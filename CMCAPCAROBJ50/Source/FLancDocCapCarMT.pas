{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - FLancDocCapCarMT                                                  }
{******************************************************************************
Rotina ......: CmeCadastroFind  e SqlUnidNegocio
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado um procedimento para que não seja retornado em
               branco os registro que estiverem com atividades em Branco.
               O componente SqlUnidNegocio teve um filtro adicionado para que
               retorne apenas as atividades ativas.
--------------------------------------------------------------------------------
Autor     : Bruno Bastos
Data      : 07.11.2007
Pendencia : 25204
Descrição : Não permitir que os valores dos rateios sejam diferentes dos escolhidos para o compromisso orçamentário.
--------------------------------------------------------------------------------
Autor     : Marcus Oliveira
Data      : 31.07.2007
Pendencia : 25312
Descrição : Mudar o parametro default do ParamGlobal para ParamCap do Plano e Patro.
--------------------------------------------------------------------------------

ANDRÉ TAVARES - PENDÊNCIA 24791 - 04/04/2007 - alterei a query SqlTipoDoc para exibir corretamente o tipo de documento se é fiscal ou não.
NVL(FLGDOCFISCAL, 'N') as FLGDOCFISCAL
--------------------------------------------------------------------------------
Autor     : Antonio Marcos (amf)
Data      : 31.05.2007
Pendencia : 25484
Descrição : Obriga dados bancários caso a forma de pagamento (tabela FORMARECPAG) tenha vínculo bancário.
--------------------------------------------------------------------------------
Autor     : Antonio Marcos (amf)
Data      : 27.04.2007
Pendencia : 24756
Descrição : Desabilita o groupbox de contas bancárias caso não haja dados bancários no cadastro do fornecedor - aba dados bancários.
--------------------------------------------------------------------------------
Autor     : Marcus Oliveira
Data      : 24.04.2007
Pendencia : 24823
Descrição : Mostrar só os portadores formas habilitados.
--------------------------------------------------------------------------------
Autor     : Antonio Marcos Fernandes de Souza (amf)
Rotina    : cmeDetalheBeforeConfirma e cmeDetalheConfirma
Data      : 12.04.2007
Pendencia : 22592
Descrição : Bloqueia a inserção de registro quando já existir um tipo de desembolso que obriga cotas.
            Exige do usuário a indicação da quantidade de cotas (aba geral)
--------------------------------------------------------------------------------
Autor     : Antonio Marcos Fernandes de Souza (amf)
Rotina    : CmeDetalheConfirma
Data      : 01.03.2007
Pendencia : 24450
Descrição : Verifica se o plano previdenciário encontra-se na lista de planos previdenciários
            cadastrados na conta corrente associada ao portador-forma.
--------------------------------------------------------------------------------
Rotina    : CadastroBeforeConfirma
Data      : 17/01/2007
Pendencia : 24201
Autor     : Marcus Oliveira
Descrição : Ativar a validações quando o usuário clicar direto no botão de "OK"
            final na aba do Rateio e corrigida a Tab Order.
--------------------------------------------------------------------------------
Rotina    : MsResOrc
Data      : 26/12/2006
Pendência : 23238
Autor     : Rodolpho da Silva
Descrição : Incluir no MS o campo IDOPERACAO
--------------------------------------------------------------------------------
Rotina    : HabilitarControles
Data      : 20.10.2006
Pendência : 23425
Autor     : Marcus Santos Oliveira
Descrição : Habilita o campo Observação na guia Geral e o Histórico Lançamento
            em dados de lançamentos no modo de pesquisa.
--------------------------------------------------------------------------------
Rotina    : BeforeConfirma
Data      : 28.08.2006
Pendência : 21704
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Avisa o usuário sobre a duplicação do documento
--------------------------------------------------------------------------------
Rotina    : BeforeConfirma
Data      : 26.08.2006
Pendência : 21703
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Obriga a informação de dados bancários caso a forma de pagamento
            possua vínculo bancário
--------------------------------------------------------------------------------
Rotina    : várias
Data      : 19/07/2006
Pendência : 22079, 22409, 22249
Autor     : andre tavares
Descrição : 22079 implementação da impressão de ficha de compensação ao lançar um
documento com portador forma que tenha um modelo de ficha de compesação associado;
22409 desabilitar os controles da tela se não estiver em modo de inserção ou edição;
22249 não permitir a inserção manual na aba contas de baixa.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Rotina    : event beforeConfirma
Data      : 11/07/2006
Pendência : 22788
Autor     : andre tavares
Descrição : permitir alteração da data de disponibilidade no CAR;
            somente testar a data de disponibilidade de a datadisp = 0.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------
 Rotinas   :
 Data      : 10.07.2006
 Autor     : Alex / Tavares
 Pendência : 22515
 Descrição : Retiradas todas as referencias as contas contábeis da tela _Plano
             retiradas as referências ao componete ccontabil na aba contabilização. Caducou a alteração da contabilização.
             Retirado ObrigaSubconta
             Retirado TestaContaCC, TestaContaxCC
 ------------------------------------------------------------------------------
//20317 - andre tavares 23/03/2006 - selecionar os lançamentos contábeis de antecipação de receita
{------------------------------------------------------------------------------
 Rotinas   : Evento OnChange do dblookUp dos alteradores selecionados
 Data      : 27.01.2006
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Pendência : 18886
 Descrição : Adicionada a observação do Alterador Selecionado.
------------------------------------------------------------------------------
 Rotinas   : FazerInsertContab, FazContabilizacao
 Data      : 23/01/2006
 Autor     : André Tavares
 Pendência : 21283
 Descrição : não estava fazendo múltiplas conta de baixa se não integrasse com a conabilidade.
------------------------------------------------------------------------------
------------------------------------------------------------------------------
 Rotinas   : LancaContabCred
 Data      : 27/10/2005
 Autor     : Rodolpho da Silva
 Pendência : 20589
 Descrição : Corrigido o erro em que ao tentar inserir um documento, onde o
             mesmo não seja contabilizado, gerava o erro: "mensagem de conta
             contabil não cadastrada".
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : LancaContabCred
 Data      : 21/10/2005
 Autor     : Rodolpho da Silva
 Pendência : 20530
 Descrição : Corrigido o erro em que não era gravado a subconta contábil, sendo
             a mesma é obrigada no tipo de desembolso.
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : FazContabilizacao - zerando o CdsContab
             CmeCadastroBeforeConfirma,
             divs
 Data      : 02/08/2005
 Autor     : Alex Pereira
 Pendência : 19870 - Erro ao remontar contabilização do documento
 Descrição : Este erro somente ocorria quando clicado o botão ok final da tela
             tivesse qualquer tipo de erro no processo, desta forma a
             contabilização não era excluída para remontar nova.
             O problema foi causado pelo desenvolvimento da pendência 18937.
             A variável: bConfirmou não voltava para false - retirada a variável
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : VerificaSeDocAdiantEstaRegularizado
 Data      : 22/06/2005
 Autor     : Rodolpho da Silva
 Pendência : 18588
 Descrição : Não permitir que documentos com adiantamentos já regularizados
             sejam alterados sem antes excluir a regularização do mesmo
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : VerificaPreenchimentoSegregaDetalhe
 Data      : 20/05/2005
 Autor     : Alex Pereira
 Pendência : 19296
             Quando o parâmetro segregação virtual está ligado o sistema está
             dando erro no momento de se inserir um rateio
{------------------------------------------------------------------------------
 Rotinas   : LancaContabDeb
 Data      : 18/05/2005
 Autor     : Alex Pereira
 Pendência : 19281
         // Na alteração do documento o cdsdet não tem o campo PLACONTACREDITO preenchida
         // se a parametrização da conta contábil for feita no cadastro do fornecedor,
         // pois este preenchimento seria feito o evento dblcTipoRDCloseUp
         // neste caso precisamos verificar se a conta está nula para utilizarmos a conta
         // do fornecedor

         Corrigida a alteração do documento, quando a conta contábil de baixa é parametrizada
         no cadastro do fornecedor.
         Corrigido acesso aos botões alterar e excluir para documentos de outros módulos.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotinas   : procure pelo número da pendência
 Data      : 27/04/2005
 Autor     : André Tavares
 Pendência : 19097
 Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
// Data      : 25/04/2005
// Autor     : Marcio Motta
// Pendência : 17317
// Descrição : Inclusão de Utilização de Históricos Contábeis
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 13/04/2005
// Autor     : André Tavares
// Pendência : 18937
// Descrição : Desabilitar os botoes de inserir excluir e alterar da aba de contabilização
// e deletar a contabilizacao ao sair da aba.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 24/03/2005
// Autor     : Rodolpho da Silva
// Pendência : 18368
// Descrição : Não permitir que seja possível alterar a DATAPROGRAMADA
//             para um período bloqueado da Contabilidade
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 14/01/2005
// Autor     : Rodolpho da Silva
// Pendência : 18324
// Descrição : Não permitir que ao importar um arquivo txt com os campos obrigatórios
//             preenchidos e principalmente com critério de segregação o sistema,
//             no momento em que o usuário por algum motivo altera o documento o
//             sistema apagava o critério de segregação da tabela documento.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 14/12/2004
// Autor     : Alex Pereira
// Pendência : 18107
// Descrição : fazer as críticas por programa, quando o plano administrativo foi parametrizado
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 22/11/2004
// Autor     : Bruno Bastos
//            (Alteração feita a pedido do Alex. Não analisei. Somente fiz.)
// Pendência : 18126
// Descrição : Alteração da propriedade filtro do componente MontaSelect
//             Saiu: TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE
//             Entrou: (TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE) OR (DOCUMENTO.OPERACAO = '15')
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : SQLPlanoPrev.SQL
// Data      : 22/10/2004
// Autor     : Alex Pereira
// Pendência : 17587 / 17590
// Descrição : Interpretar se o PlanoPrevContabil está ativo ou não
//------------------------------------------------------------------------------
// Rotinas   : Componente MontaSelect
// Data      : 27/08/2004
// Autor     : André Tavares
// Pendência : 17684
// Descrição : Alteração na query do MontaSelect
//------------------------------------------------------------------------------
// Rotinas   : FormCreate, SelDocs
// Data      : 04/08/2004
// Autor     : André Tavares
// Pendência : 17290
// Descrição : correcao de erro na pasta de contabilizaçao no combo centro de custo
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 04/08/2004
// Autor     : David Ayrolla
// Pendência : 17232
// Descrição : Limitar a retenção de INSS de autônomos ao teto.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : FormCreate, SelDocs
// Data      : 28/06/2004
// Autor     : André Tavares
// Pendência : 16975
// Descrição : esconde o campo de compromisso orcamentario se estiver co contas a receber.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : LancaContabDeb, LancaContabCred, btnGrupoRateioClick
// Data      : 18/06/2004
// Autor     : André Tavares
// Pendência : 16992
// Descrição : Quando se faz um rateio pré-definido, não estava contabilizando corretamente.
//------------------------------------------------------------------------------
// Rotinas   :
// Data      : 07/06/2004 (Término)
// Autor     : David Ayrolla
// Pendência : 14646
// Descrição : Criação de processo RAD no lançamento de documentos.
//------------------------------------------------------------------------------
// Rotinas   :
// Data      : 21/05/2004
// Autor     : André Tavares
// Pendência : 15367 e 15368
// Descrição : substituição das queries que listam Centro de Custo e Centro de
//Responsabilidade por métodos do CmGlobalObj50 que já contemplam o DE-PARA
//
//
//------------------------------------------------------------------------------
// Rotinas   : CmeCadastroApplyDelete
// Data      : 27/04/2004
// Autor     : Alex Pereira
// Pendência : 16220
// Descrição : Implementar a conciliação de CPMF em Lança e baixa simultanea,
//             Passar parâmetro com o número do lote para exclusão do documento
//             com lança e baixa simultânea
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : nenhuma
// Data      : 19/04/2004
// Autor     : André Tavares
// Pendência : 15866
// Descrição : Adicionar no grid da pasta Rateio o campo Num. do compromisso orçamentário.
//------------------------------------------------------------------------------

{ -----------------------------------------------------------------------------}
// Rotinas   : TfrmLancDocCAPCAR.CmeDetalheConfirma
//             VerificaPreenchimentoSegregaMestre
//             VerificaPreenchimentoSegregaDetalhe
//             FazContabilizacao  /  FazerInsertContab
// Data      : 22/01/2004
// Autor     : Alex Pereira
// Pendência : 14451
// Descrição : Ocultar Atividade/Projeto no cadastro do alterador.
//             Travar lançamentos
//             SE PARAMINTEGRA.SEGREGAVIRTUAL
//                E LANCA E BAIXA SIMULTANEA
//                  ENTÃO OBRIGAR PLANO = COMUM
//                              E PATRO = COMUM
//             MOTIVO: BAIXA DO FLUXO PRIMÁRIO SEGREGADO (NOVA SEGREGAÇÃO)
//
// Data      : 22/01/2004
// Descrição : Corrigido o adiantamento.
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 16/01/2004 (término)
// Autor     : David Ayrolla
// Pendência : 14393
// Descrição : Implementação de retenção de INSS para autônomos.
//------------------------------------------------------------------------------
// Rotina    : várias
// Data      : até 19/05/2003 a 27/05/2003
// Autor     : André Pontes
// Descrição : Implementação de lançamento através de percentuais de rateio
//             pré-definidos
//------------------------------------------------------------------------------
// Rotina    : FormCreate
// Data      : 28/08/2003
// Autor     : David Ayrolla
// Descrição : Filtragem dos tipos de desembolso pelo campo ATIVO
// Pendência : 14458
//------------------------------------------------------------------------------
// Rotina    : SetaCentResponDesemb
// Data      : 18/12/2003
// Autor     : David Ayrolla
// Descrição : O campo centro de responsabilidade permanecia vazio mesmo após o
//             seu preenchimento (em algumas estações). Resolvi o problema
//             mudando a filtragem da query que o preenche.
// Pendência : 15656
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotina    : sbtnAlterarClick
// Data      : 18/12/2003
// Autor     : Alex Pereira
// Descrição : Se a tela estivesse em com a guia Rateio ativa, procurar um
//             documento clicar alterar do documento e clicar alterar do detalhe
//             estava dando erro pois o form de herança não encontrava o grid
//             do detalhe.
// Pendência : 15832
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotina    : SelDocs
// Data      : 14/01/2004
// Autor     : Alex Pereira
// Descrição : Criar a aba Contas baixa para mostrar o rateio para documentos
//             com múltiplas contas de baixa.
// Pendência : 15862
//------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina......: SLQUnidNegoc
Nº SOL......: 163982/7321
Nº KINTANA..: 1520392
Data........: 23/12/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Filtrar os "selects" Atividade/projeto para considerar apenas as ativas e analiticas
-----------------------------------------------------------------------------------------------------}


unit FLancDocCapCarMT;

interface

uses
   WIndows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MontaSelect, DBTables, Db, Wwdatsrc, TB97,
   MAHlpBtn, StdCtrls, Buttons, Grids, TB97Tlbr, TB97Ctls, IvDictio,
   IvMulti, IvEMulti, CMProcuraMask, CMProcuraSubTipo, CMDBLookupCombo,
   ppComm, ppProd, ppClass, ppReport, ppTypes, CMProcura, EditReg,
   wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList,
   DBClient, uCMClientDataSet, uCmSqlParams, uCMTypes, FCadastroMestreDetMT,
   Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
   TREdit, wwdbedit, DBCtrls, uCtrlPeriodo, uCtrlDocumento, uCtrlLancDocCapCar,
   uCtrlPadroes, uCtrlIntBanco, uCtrlGrupoRateio, uCtrlParamCap, CMDatabase,
   // 23/01/04 Alex 14451
   uCtrlSegregacao,
   // 01/04/2004 Marchetti 15733 e 15734
   uCtrlPlanPrevContabPatro,
   // André Tavares - pendência 15367 - 20/05/2004
   uctrlCentRespon, uctrlCentroCusto,
   // Marcio Motta - 17317 - 20/04/2005
   uListaCamposHistCapCar, uCtrlModeloHistorico,
   // amf p:18886 - 27.01.2006
   uCtrlTipoAlterador,uCtrlParamGlobal,
   fConfigBarrasCMMT,

   //Marcus Oliveira 07/11/06
   uModulo,

   //amf 01.03.2007 24450
   uCtrlPortadorConta,
   uCtrlPortadorForma,
   uCtrlTipoRecebDesemb,

   //amf 31.05.2007 25484
   uCtrlPessoaForne,
   uCtrlFormaRecPag,

   uCtrlPlacontasCapCar, dxCntner, dxEditor, dxEdLib, dxDBELib;

type
   TContabDoc = record
      PLANO          : Integer;
      PLACONTA       : String;
      CODCENTROCUSTO : String;
   end;

   TfrmLancDocCAPCAR = class(TFrmCadastroMestreDetMT)
      dsContabil: TwwDataSource;
      tbsContabil: TTabSheet;
      dbgrdContabil: TwwDBGrid;
      pnlContabil: TPanel;
      sbtnEstornar: TToOlbarButton97;
      tbsLancamento: TTabSheet;
      dbgLancamentos: TwwDBGrid;
      dsLancamento: TwwDataSource;
      TbsAlteradores: TTabSheet;
      PnlAlteradores: TPanel;
      TbsGeral: TTabSheet;
      GpBarras: TGroupBox;
      Label5: TLabel;
      DbeBarras: TwwDBEdit;
      DbeLInhaDigit: TwwDBEdit;
      GpConta: TGroupBox;
      Label14: TLabel;
      Label15: TLabel;
      Label18: TLabel;
      DbEdtConta: TwwDBEdit;
      DbEdtBanco: TwwDBEdit;
      DbEdtAgencia: TwwDBEdit;
      DBText1: TDBText;
      Label9: TLabel;
      MemObs: TDBMemo;
      ImlDocs: TImageList;
      PnlRateioGeral: TPanel;
      lblUnidNegoc: TLabel;
      lblCentroRespon: TLabel;
      lblTipoRD: TLabel;
      Label6: TLabel;
      dblcUnidNegoc: TwwDBLookupCombo;
      dblcCentroRespon: TwwDBLookupCombo;
      dblcTipoRD: TwwDBLookupCombo;
      CmbCentCusto: TwwDBLookupCombo;
      BtnBuscaContaCor: TSpeedButton;
      GpDotorc: TPanel;
      SpeedButton1: TSpeedButton;
      ReResorc: TDBRealEdit;
      Label17: TLabel;
      PnlPrograma: TPanel;
      Label13: TLabel;
      CmbPrograma: TCMDBLookupCombo;
      edMoedaDet: TEdit;
      lblMoedaDet: TLabel;
      dbeValorMoedaDet: TRealEdit;
      lblValorOutDet: TLabel;
      dbeValorDet: TRealEdit;
      lblValorDet: TLabel;
      GrdAlteradores: TwwDBGrid;
      DsAlteradores: TwwDataSource;
      lblAlterador: TLabel;
      lblValOut: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label20: TLabel;
      EdtHist: TDBEdit;
      DtLancto: TCMDateTimePicker;
      DbROutraMoeda: TDBRealEdit;
      DbrValor: TDBRealEdit;
      dblkAlterador: TwwDBLookupCombo;
      DbrValLiquido: TDBRealEdit;
      DclAtivProjeto: TwwDBLookupCombo;
      CkbContabiliza: TDBCheckBox;
      MsResORc: TMontaSelect;
      LblEstorno: TLabel;
      TbsDadosLanc: TTabSheet;
      SqlDoc: TCMSqlParams;
      SQLDet: TCMSqlParams;
      CdsDet: TCMClientDataSet;
      SqlContab: TCMSqlParams;
      CdsContab: TCMClientDataSet;
      SQLAlteradores: TCMSqlParams;
      CdsAlteradores: TCMClientDataSet;
      SQLLancamento: TCMSqlParams;
      CdsLancamento: TCMClientDataSet;
      LblMesmaData: TLabel;
      SQLMoeda: TCMSqlParams;
      CdsMoeda: TCMClientDataSet;
      CdsDadosConta: TCMClientDataSet;
      SqlDadosConta: TCMSqlParams;
      SQLPlanoPrev: TCMSqlParams;
      CdsPlanoPrev: TCMClientDataSet;
      SQLProgramaPrev: TCMSqlParams;
      CdsProgramaPrev: TCMClientDataSet;
      SQLPatroPrev: TCMSqlParams;
      CdsPatroPrev: TCMClientDataSet;
      SQLTipoRD: TCMSqlParams;
      CdsTipoRD: TCMClientDataSet;
      CdsAlt: TCMClientDataSet;
      SqlAlt: TCMSqlParams;
      CdsSubContaForCli: TCMClientDataSet;
      SqlSubContaForCli: TCMSqlParams;
      SqlValida: TCMSqlParams;
      CdsValida: TCMClientDataSet;
      SqlSubConta: TCMSqlParams;
      CdsSubConta: TCMClientDataSet;
      SqlCentroRespon: TCMSqlParams;
      CdsCentroRespon: TCMClientDataSet;
      SqlPortForma: TCMSqlParams;
      CdsPortForma: TCMClientDataSet;
      SqlCCusto: TCMSqlParams;
      CdsCCusto: TCMClientDataSet;
      SqlAuxTipoRD: TCMSqlParams;
      CdsAuxTipoRD: TCMClientDataSet;
      SqlTipoDoc: TCMSqlParams;
      CdsTipoDoc: TCMClientDataSet;
      SqlCentroCusto: TCMSqlParams;
      CdsCentroCusto: TCMClientDataSet;
      CdsUnidNegoc: TCMClientDataSet;
      SqlUnidNegoc: TCMSqlParams;
      SqlFormaPag: TCMSqlParams;
      CdsFormaPag: TCMClientDataSet;
      SqlCliAdianto: TCMSqlParams;
      CdsForCliAdianto: TCMClientDataSet;
      SqlForneAdianto: TCMSqlParams;
      CdsAux: TCMClientDataSet;
      SqlAux: TCMSqlParams;
      PnlDados: TPanel;
      lblHistorico: TLabel;
      dbeHistorico: TwwDBEdit;
      gbDatas: TGroupBox;
      lblData: TLabel;
      lblEmissao: TLabel;
      lblVencimento: TLabel;
      lblProgramada: TLabel;
      dbeDataLanc: TCMDateTimePicker;
      dbeDataEmi: TCMDateTimePicker;
      dbeDataVenc: TCMDateTimePicker;
      dbeDataProgr: TCMDateTimePicker;
      gbOutros: TGroupBox;
      cbEnglobParc: TCheckBox;
      cbLancaBaixa: TCheckBox;
      cbIntegra: TCheckBox;
      BtnStatus: TToolbarButton97;
      Label10: TLabel;
      DBText3: TDBText;
      DBText2: TDBText;
      lblModulo: TLabel;
      Bevel2: TBevel;
      Image1: TImage;
      LblDIspFinanc: TLabel;
      dbeDataDisponib: TCMDateTimePicker;
      DBcboGrupoRateio: TwwDBLookupCombo;
      lblRateio: TLabel;
      btnGrupoRateio: TBitBtn;
      sqlGrupoRateio: TCMSqlParams;
      cdsGrupoRateio: TCMClientDataSet;
      CdsIDGRUPORATEIO: TFloatField;
      CdsIDMODULO: TFloatField;
      CdsGRRDESCRICAO: TStringField;
      cdsPadraoRateio: TCMClientDataSet;
      cdsVerificaRateio: TCMClientDataSet;
      tbsContasBaixa: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      sqlCCBaixasXDocum: TCMSqlParams;
      CdsCCBaixasXDocum: TCMClientDataSet;
      dsCCBaixasXDocum: TwwDataSource;
      Label11: TLabel;
      Label12: TLabel;
      Label16: TLabel;
      EdtImovel: TwwDBEdit;
      CmbPlano: TCMDBLookupCombo;
      CmbPatro: TCMDBLookupCombo;
      SqlProcessoRad: TCMSqlParams;
      CdsProcessoRad: TCMClientDataSet;
    DBCheckBox1: TDBCheckBox;
    grBoxRAD: TGroupBox;
    dbtxtNumProc: TDBText;
    lblProcesso: TLabel;
    Label19: TLabel;
    dbtxtStatusProc: TDBText;
    SqlRAD: TCMSqlParams;
    cdsRAD: TCMClientDataSet;
    DsRAD: TwwDataSource;
    Label4: TLabel;
    RdFicha: TRadioButton;
    RdArrecad: TRadioButton;
    Label21: TLabel;
    mmObsAlt: TMemo;
    sqlContaBancaria: TCMSqlParams;
    cdsContaBancaria: TCMClientDataSet;
    PnlOpcao: TPanel;
    PnlGeral: TPanel;
    Dbereferencia: TwwDBEdit;
    DblCodForma: TwwDBLookupCombo;
    CmbSubConta: TwwDBLookupCombo;
    PnlLancPrin: TPanel;
    lblMoeda: TLabel;
    lblTipoDocum: TLabel;
    Bevel1: TBevel;
    DbeNoDocumento: TwwDBEdit;
    CmpForCli: TCMProcuraForCli;
    dbeCompl: TwwDBEdit;
    dbenNumDoc: TDBRealEdit;
    dblcMoeda: TwwDBLookupCombo;
    dbeValorMoeda: TDBRealEdit;
    dbeValorCorrente: TDBRealEdit;
    dblcTipoDoc: TwwDBLookupCombo;
    dblcPortadorForma: TwwDBLookupCombo;
    dbenChBordero: TDBRealEdit;
    lblValor: TLabel;
    Label7: TLabel;
    lblValorMoeda: TLabel;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    lblPortadorForma: TLabel;
    lblNumChBordero: TLabel;
    LblSubContaCli: TLabel;
    LblFormaPag: TLabel;
    Label8: TLabel;
    PnlAp: TPanel;
    LblNumAp: TLabel;
    BtnNumApgr: TSpeedButton;
    EdtNumAp: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    dbQtdeCota: TDBEdit;
      procedure FormCreate(Sender: TObject);
      procedure tbcDetalheChange(Sender: TObject);
      procedure dbeValorMoedaExit(Sender: TObject);
      procedure dbeValorMoedaDetExit(Sender: TObject);
      procedure dblcUnidNegocExit(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure sbtnEstornarClick(Sender: TObject);
      procedure dblcMoedaExit(Sender: TObject);
      procedure dbeDataVencExit(Sender: TObject);
      procedure sbtnInserirClick(Sender: TObject);
      procedure bbtnOkDetClick(Sender: TObject);
      procedure bbtnCancelarDetClick(Sender: TObject);
      procedure bbtnVoltarDetClick(Sender: TObject);
      procedure sbtnInsDetClick(Sender: TObject);
      procedure sbtnAltDetClick(Sender: TObject);
      procedure sbtnExcluiDetClick(Sender: TObject);
      procedure dbeValorCorrenteChange(Sender: TObject);
      procedure sbtnAlterarClick(Sender: TObject);
      procedure sbtnApagarClick(Sender: TObject);
      procedure dsLancamentoDataChange(Sender: TObject; Field: TField);
      procedure cbLancaBaixaClick(Sender: TObject);
      procedure CmpForCliEnter(Sender: TObject);
      procedure CmpForCliExit(Sender: TObject);
      procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure SpeedButton1Click(Sender: TObject);
      procedure dblcCentroResponExit(Sender: TObject);
      procedure DbeNoDocumentoExit(Sender: TObject);
      procedure dblcTipoDocExit(Sender: TObject);
      procedure dbeDataEmiExit(Sender: TObject);
      procedure BtnNumApgrClick(Sender: TObject);
      procedure dbeValorCorrenteExit(Sender: TObject);
      procedure CmbProgramaExit(Sender: TObject);
      procedure CmbPlanoExit(Sender: TObject);
      procedure CmbPatroExit(Sender: TObject);
      procedure CmbCentCustoExit(Sender: TObject);
      procedure dblcTipoRDExit(Sender: TObject);
      procedure CmbCentCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure CmpForCliApertouBotao(Sender: TObject);
      procedure CmbProgramaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure CmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure CmbPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure BtnBuscaContaCorClick(Sender: TObject);
      procedure DclAtivProjetoExit(Sender: TObject);
      procedure dblkAlteradorExit(Sender: TObject);
      procedure DbrValorExit(Sender: TObject);
      procedure CdsalteradoresAfterInsert(DataSet: TDataSet);
      procedure cbEnglobParcClick(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeDetalheEdit(Sender: TObject);
      procedure CmeDetalheInsert(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CdsAfterOpen(DataSet: TDataSet);
      procedure CdsDetAfterOpen(DataSet: TDataSet);
      procedure CdsUnidNegocAfterOpen(DataSet: TDataSet);
      procedure CdsTipoRDAfterOpen(DataSet: TDataSet);
      procedure CdsDetAfterInsert(DataSet: TDataSet);
      procedure CdsLancamentoAfterOpen(DataSet: TDataSet);
      procedure CdsContabAfterOpen(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CdsAlteradoresAfterPost(DataSet: TDataSet);
      procedure CdsDetAfterCancel(DataSet: TDataSet);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure DBcboGrupoRateioExit(Sender: TObject);
      procedure btnGrupoRateioClick(Sender: TObject);
    procedure dblcTipoRDEnter(Sender: TObject);
    procedure ReResOrcExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure RdFichaClick(Sender: TObject);
    procedure RdArrecadClick(Sender: TObject);
    procedure DbeBarrasExit(Sender: TObject);
    procedure DbeLinhaDigitExit(Sender: TObject);
    procedure dblkAlteradorChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblcTipoDocChange(Sender: TObject);
    procedure dbQtdeCotaChange(Sender: TObject);


   private  // Private declarations
      //andre tavares - pendência 22079 - 14/07/2006
      _FrmConfigBarrasCMMT : TFrmConfigBarrasCMMT;
      placontas: TPlacontas;

      sDataLanc         : String; // André Tavares - pendência 18937 - 22/04/2005
      ctrlCentRespon    : TCtrlCentRespon;// André Tavares - pendência 15367 - 20/05/2004
      CtrlIntBanco      : TCtrlIntBanco;
      CtrlGrupoRateio   : TCtrlGrupoRateio;
      CtrlParamCap      : TCtrlParamCap;
      // 23/01/04 Alex 14451
      CtrlSegregacao    : TCtrlSegregacao;
      // amf 18886 27.01.2006
      CtrlTipoAlterador : TCtrlTipoAlterador;

      //amf 01.03.2007 24450
      CtrlPortadorConta : TCtrlPortadorConta;
      CtrlPortadorForma : TCtrlPortadorForma;

      //amf 12.04.2007 22592
      ctrlTipoRecebDesemb: TCtrlTiporecebdesemb;

      //amf 31.05.2007 25484
      CtrlPessoaForne: TCtrlPessoaForne;
      CtrlFormaRecPag: TCtrlFormaRecPag;

      CtrlParamGlobal   : TCtrlParamGlobal;

      _IdForCliAdianto: Integer;
      _DataLancto: TDateTime;
      _CodTipDoc: Integer;
      _CodLancCAPCAR: Integer;
      _CodLancContab: Integer;
      _cdsAux : TcmClientDataset;
      _CodCentroRespon: String;
      _NomeCentroRespon: String;
      _Ativproj: String;
      _Crespom: String;
      _Tpdesmb: String;
      _Ccusto: String;
      _Programa : string;
      _PlanoPrevDet: Integer;
      _PatroDet: Integer;
      _Modulo: Integer;
      _ContaCliFor: String;
      _CCustoCliFor: String;
      _Valida: Boolean;
      _ContabDoc :TContabDoc;
      _IdCidade: Integer;
      _IdPais: Integer;
      _UF: String;

      _LiberaAlteracaoOutroSistema: Boolean;
      AbrindoTela: Boolean; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
      sCodCentResp: String;

      _ValorCotacao: Double;

      //Marcus Oliveira 23425
      iContaXCaixa: integer;

      _ValorEdit: Double;
      _ValorCorrente: Double;
      _ValorMoeda: Double;

      _LancDocCapCar: TCtrlLancDocCapCar;
      _oPeriodo: TCtrlPeriodo;
      _oDocumento: TCtrlDocumento;

      // 23/01/04 Alex 14451 definir o critério para segregação
      sDescSegregaCriter: string;

      // 01/04/2004 Marchetti Pendencia 15733 e 15734
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

      // 20/04/2005
      CtrlModeloHistorico : TCtrlModeloHistorico;
      //Iferreira - 27432
      procedure EmptyDataSet(Dts: TDataSet);

      function  Arredonda(const fValor     : Extended;
                          const iDecimais  : word
                         ): Extended;

      function  VerificaRateio: Boolean;
      function  VerificaTipoDesembXCRespon: Boolean;

      //Marcus Oliveira 23425
      procedure ControlesReadyOnly(bLigar: boolean);

      function  VerificaUsuXCRespon: Boolean;
      function  VerificaTipoDesembXForn: Boolean;
      function  VerificaPreenchimentoSegregaMestre: boolean;
      function  VerificaPreenchimentoSegregaDetalhe: boolean;
      // fim 22/01/04 Alex 14451

      //  Rodolpho da Silva - P: 18588 - 22/06/2005
      function  VerificaSeDocAdiantEstaRegularizado : boolean;



      procedure SelDocs(iCodDocumento: Integer);
      procedure SelecionaTipoDesembolso;

      function  BuscaNomeConta(sPlaconta: String; iPlano: integer): String;
      procedure MontaCentroDeCusto;
      procedure ExecutaPrevAdianto;
      function  ConfereSaldo(iCodDocumento: integer; bVerificaLanc: boolean): boolean;
      function  VerificaParcelas(sNumFatura: String): boolean;
      procedure SetaCentResponDesemb(iNumReserva: LongInt; bLimpa: boolean);
      procedure SetaEnglobaParcela;
      procedure AtualizaSaldo;
      procedure setaplanopatroglobal;
      function  TestaAlterador: boolean;
      function  DoEnglobarParcelar: Boolean;
      function  ValidaOperacao: Boolean;
      procedure CalculaValorEdit;

      // Início: Marcio Motta - 18492 - 19/01/2005
      function  BuscaIdReservaOrcamento(NumCompromisso: integer): integer;
      function  VerificaTipoDesembolso: boolean;
      //    Fim: Marcio Motta

     // início andre tavares pendencia 19942 - 26/08/2005 - valida também o códogo de barras da arrecadação
     function verificaCodBarra : boolean;
     // fim andre tavares pendencia 19942 - 26/08/2005 - valida também o códogo de barras da arrecadação

     //andre tavares - pendência 22079 - 14/07/2006
     function EmitirBloqueto: Boolean;

     //andre tavares - pendência 21603 - 27/07/2006
     function reprogDataVencto(const sTextoPergunta: string): boolean;

   public   // Public declarations
      class procedure AbrirForm(OperacaoLanc: TOperacaoLancDocCapCar);

  end;


var
  frmLancDocCAPCAR: TfrmLancDocCAPCAR;
  _OperacaoLanc: TOperacaoLancDocCapCar;

implementation
{$R *.DFM}
uses
   uMensErro, uDataBase, DBaseDados, uSistema, ustring, dReports,
   fMostraRelat, DDadosBancarios, udiasuteis, JclMath, uFormManager,
   Registry, uCtrlParamIntegra, uFuncaoGeral, FRegPrevAdiantoMT,
   DCapCarMT, FAgrupaParcelaMT, uMidasUtil, fAguarde, uCtrlFinanc, uCmDialogs,
   uVerificaPreenchimento,
   //DAVID - Retenção de Imposto
   fRetencaoINSS;




procedure TfrmLancDocCAPCAR.CmeCadastroInsert(Sender: TObject);
var
   cdsPlanoPatro: TCMclientDataSet;

begin

   cdsPlanoPatro := TCMclientDataSet.Create(nil);
   cdsPlanoPatro.data := _LancDocCapCar.ListaPlanoPatroParamCap;

  _IdForCliAdianto := 0;

  SelDocs(-1);

  inherited;

  { Alex 14/04 tirado este bloco do cdsafterinsert, lá estava dando erro no tipodoc }
  Cds.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
  Cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  Cds.FieldByName('IDMODULO').AsFloat := Sistema.IdModulo;
  Cds.FieldByName('DATALANCTO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAEMISSAO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAVENCTO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAPROGRAMADA').AsDateTime := _DataLancto;
  Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;

  if ( _OperacaoLanc = opldAdiantamento ) then
     Cds.FieldByName('CODTIPDOC').AsInteger := Modulo.CodAForne
  else
     Cds.FieldByName('CODTIPDOC').AsInteger := _CodTipDoc;
  { fim tirado este bloco daqui do cdsafterinsert }

  PnlAp.Enabled := True;


  SetaCentResponDesemb(-1, True);
  cbLancaBaixa.Checked := False;
  cbLancaBaixaClick(Self);
  pnlMestre.Enabled := True;
  dbenChBordero.Enabled := False;
  lblNumChBordero.Enabled := False;
  cbEnglobParc.Checked := False;
  cbLancaBaixa.Checked := False;

  if _OperacaoLanc = opldEfetivo then
    cbIntegra.Checked := False
  else
    cbIntegra.Checked := True;

  _CodLancCAPCAR := 0;
  _CodLancContab := 0;

  dbeValorMoeda.Enabled          := False;
  dbeValorCorrente.Enabled       := True;

  if CmpForCli.CanFocus then  CmpForCli.SetFocus;

  if iContaXCaixa > 0 then
  begin
    dblcPortadorForma.LookupValue := IntToStr(iContaXCaixa);
    CdsPortForma.Locate( 'CODPORTFORMA', iContaXCaixa, [] );
    dblcPortadorForma.text:= CdsPortForma.fieldbyname('Descricao').AsString;

  end;

  SetaEnglobaParcela;

 //MArcus Oliveira P. 23425 19/10/06
 ControlesReadyOnly(False);

end;



procedure TfrmLancDocCAPCAR.CmeDetalheInsert(Sender: TObject);
var
  bVazio : Boolean;
begin
  bVazio := CdsDet.IsEmpty;

  _cdsAux.Data := copyClientDataset(cdsDet);    // tavares - pendência 17279

  inherited;

  if pgctrlDetalhe.ActivePage.PageIndex = 1 then
  begin
     CdsDet.FieldByName('NumReserva').AsInteger := 0;

     if CdsCentroRespon.IsEmpty then
     begin
        dblcCentroRespon.Enabled := False;
        CdsDet.FieldByName('CODCENTRORESPON').AsString := _CodCentroRespon;
        CdsDet.FieldByName('NOME_1').AsString := _NomeCentroRespon;
     end;

     CdsDet.FieldByName('MOECODIGO').Clear;

     dbeValorMoedaDet.Value   := 0;
     dbeValorDet.Value        := 0;
     edMoedaDet.Text          := '';

     if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
        edMoedaDet.Text := CdsMoeda.FieldByName('MOESIGLA').AsString;
     end
     else
     begin
       dbeValorMoedaDet.Value := 0;
     end;

     CmbCentCusto.CloseUp(True);

     if not(bVazio) then
     begin
       if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;

       CdsDet.FieldByName('UNIDNEGOC').AsStrIng       := _Ativproj;
       dblcUnidNegoc.CloseUp(True);

       CdsDet.FieldByName('CODCENTRORESPON').AsStrIng := _Crespom;
       dblcCentroRespon.CloseUp(True);

       CdsDet.FieldByName('CODTIPRECDES').AsStrIng    := _Tpdesmb;
       dblcTipoRD.CloseUp(True);

       CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng  := _Ccusto;
       CmbCentCusto.CloseUp(True);

       // início - andré tavares - pendência 17279 - 26/08/2004
       CdsDet.FieldByName('IDPROGRAMA').AsStrIng  := _Programa;
       CmbPrograma.CloseUp(True);
       CmbPrograma.LookupValue := _Programa;
       if trim(_Programa) <> '' then
         CdsProgramaPrev.Locate('IDPROGRAMA', _Programa, []);
       // fim - andré tavares - pendência 17279 - 26/08/2004

         if _PlanoPrevDet = 0 then begin
            CdsDet.FieldByName('IDPLANOPREV').Clear;
         end
         else
         begin
            CdsDet.FieldByName('IDPLANOPREV').AsFloat := _PlanoPrevDet;
            CmbPlano.LookupValue := FloatToStr(_PlanoPrevDet);
         end;

       CmbPlano.CloseUp(True);

       if _PatroDet = 0 then
          CdsDet.FieldByName('IDPATRO').Clear
       else
          begin
             CdsDet.FieldByName('IDPATRO').AsFloat := _PatroDet;
             CmbPatro.LookupValue := FloatToStr(_PatroDet);
          end;
       CmbPatro.CloseUp(True);
     end
     else
        setaplanopatroglobal;

     if (Trim(_Crespom) = '') or
        (Trim(_Crespom) = '9999999999') then
     begin
        CdsDet.FieldByName('CODCENTRORESPON').asstrIng  := '9999999999';
        dblcCentroRespon.CloseUp(True);
     end;

     CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
     if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
       MontaCentroDeCusto;
  end;
end;




procedure TfrmLancDocCAPCAR.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (Cds.State In ([dsInsert,dsEdit])) then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 1)  then
     begin
        if not (CdsDet.State In ([dsInsert,dsEdit])) then CdsDet.Edit;

        _TpDesmb := CdsDet.FieldByName('CODTIPRECDES').AsStrIng;
        // Fim - Marcio Motta

        dblcTipoRD.Text          := CdsDet.FieldByName('DESCRICAO').Text;
        dblcCentroRespon.Text    := CdsDet.FieldByName('NOME_1').Text;
        dblcUnidNegoc.Text       := CdsDet.FieldByName('NOME').Text;

        CdsDet.FieldByName('MOECODIGO').Clear;

        dbeValorMoedaDet.Value   := CdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
        dbeValorDet.Value        := CdsDet.FieldByName('VALOR').AsFloat;
        edMoedaDet.Text          := '';

        if CdsCentroRespon.IsEmpty then
        begin
           dblcCentroRespon.Enabled:=False;
           CdsDet.FieldByName('CODCENTRORESPON').AsString := _CodCentroRespon;
           CdsDet.FieldByName('NOME_1').AsString := _NomeCentroRespon;
        end;
        if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
        begin
           CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
           edMoedaDet.Text := CdsMoeda.FieldByName('MOESIGLA').AsString;
        end
        else
           dbeValorMoedaDet.Value:=0;

        CmbCentCusto.CloseUp(True);

        setaplanopatroglobal; 
     end;
  end;
end;




procedure TfrmLancDocCAPCAR.CmeDetalheConfirma(Sender: TObject);
var contaRegIguais: integer;
    cdsLocal: TClientDataSet;
begin
  CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin

    // início - andré tavares - pendência 17279 - 26/08/2004
    if (not _cdsAux.IsEmpty) and (CdsDet.state in [dsEdit, dsInsert]) then
    begin
      _cdsAux.first;
      contaRegIguais := 0;
      while not _cdsAux.Eof do  // verifica se já existe algum registro igual
      begin
        if(dblcUnidNegoc.lookupValue       = _cdsAux.FieldByName('UNIDNEGOC').AsStrIng)     and
          (dblcCentroRespon.lookupValue    = _cdsAux.FieldByName('CODCENTRORESPON').AsStrIng)and
          (dblcTipoRD.lookupValue          = _cdsAux.FieldByName('CODTIPRECDES').AsStrIng) and
          (CmbCentCusto.lookupValue        = _cdsAux.FieldByName('CODCENTROCUSTO').AsStrIng) and
          (CmbPrograma.lookupValue         = _cdsAux.FieldByName('IDPROGRAMA').AsStrIng) and
          (CmbPlano.lookupValue            = _cdsAux.FieldByName('IDPLANOPREV').AsStrIng ) and
          (CmbPatro.lookupValue            = _cdsAux.FieldByName('IDPATRO').AsStrIng ) and

          (CdsDet.FieldByName('UNIDNEGOC').AsStrIng       <> '') and
          (CdsDet.FieldByName('CODCENTRORESPON').AsStrIng <> '') and
          (CdsDet.FieldByName('CODTIPRECDES').AsStrIng    <> '') and
          (CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng  <> '') and
          (CdsDet.FieldByName('IDPROGRAMA').AsStrIng      <> '') and
          (CdsDet.FieldByName('IDPATRO').AsStrIng         <> '') and
          (CdsDet.FieldByName('IDPLANOPREV').AsStrIng     <> '') then
        begin
          contaRegIguais := contaRegIguais + 1;
          if (contaRegIguais >= 1) and (cdsDet.Recno <> _cdsAux.Recno) then
          begin
            MsgDlg('Neste rateio existe um registro repetido.','Erro',mtWarning,[mbOk],0);
            Abort;
          end;
        end;
        _cdsAux.next;
      end;
    end;
    // fim - andré tavares - pendência 17279 - 26/08/2004

     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (CdsDet.State In [dsInsert,dsEdit]) then
        begin
           // Início - Marcio Motta - 20/01/2005 - 18492
           if (ReResOrc.Lines[0] <> '') and (ReResOrc.Value > 0) then
             if not VerificaTipoDesembolso then
               begin
                  MsgDlg('Este Compromisso Orçamentário não pode ser utilizado para este Desembolso!','Erro',mtError,[mbOk],0);
                  Repaint;
                  if ReResOrc.CanFocus then ReResOrc.SetFocus;
                  EXIT;
               end;

           // Fim - Marcio Motta - 20/01/2005 - 18492

           if (Trim(dblcUnidNegoc.Text) = '') then
           begin
              if ( ParamIntegra.ObrigaAbc ) then
              begin
                MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
               Repaint;
                if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
                exit
              end
              else
              begin
                CdsDet.FieldByName('UNIDNEGOC').AsFloat := -1;
                dblcUnidNegoc.LookupValue := '-1';
              end;
           end;

           if CdsCentroRespon.isEmpty then
           begin
              //SOL90371 - 14/07/2008 - Nilton

              MsgDlg('O vínculo do Usuário ao Centro de Responsabilidade é obrigatório.'+#13+'Contate a Área Responsável.','Erro',mtError,[mbOk],0);
              Abort;

             {  CdsDet.FieldByName('NOME_1').Text := _NomeCentroRespon;
                CdsDet.FieldByName('CODCENTRORESPON').AsString := '9999999999';
                dblcCentroRespon.LookupValue   := '9999999999';
             }
           end
           else
           begin
              if (Trim(dblcCentroRespon.Text) = '') then
              begin
                 if ( ParamIntegra.ObrigaCrespon ) then
                 begin
                   MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
                   Repaint;
                   if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
                   exit;
                 end
                 else if (CdsDet.FieldByName('CODCENTRORESPON').AsString = '') or
                         (dblcCentroRespon.LookupValue = '')then
                 begin
                  MsgDlg('O vínculo do Usuário ao Centro de Responsabilidade é obrigatório.'+#13+'Contate a Área Responsável.','Erro',mtError,[mbOk],0);
                  exit;
                 {
                  CdsDet.FieldByName('CODCENTRORESPON').AsString := '9999999999';
                  dblcCentroRespon.LookupValue := '9999999999';
                  CdsDet.FieldByName('NOME_1').AsString := _NomeCentroRespon;
                 }
                 end;
              end;
              CdsDet.FieldByName('NOME_1').Text := dblcCentroRespon.Text;
           end;
           //CATIA -Pendência 18951 - 12/04/2006
           IF ParamIntegra.RecPag = 'P' then
           begin
           //andré tavares - pendência 26515 - 05/10/2007 -
             CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);

             If (CdsAux.FieldByName('FLGOBRIGAPROG').AsString = 'S') THEN
             begin
               If Trim(cmbprograma.text) = ''  then
               begin
                 MsgDlg('Obrigatório preencher o PROGRAMA','Erro',mtError,[mbOk],0);
                 exit;
               end;
             end;
           end;

           if Trim(dblcTipoRD.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
               Repaint;
              if dblcTipoRD.CanFocus then dblcTipoRD.SetFocus;
              exit;
           end;

           if (dbeValorMoedaDet.Value = 0) and (Cds.FieldByName('MOECODIGO').AsInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
               Repaint;
              if dbeValorMoedaDet.CanFocus then dbeValorMoedaDet.SetFocus;
              exit;
           end;

           if (dbeValorDet.Value = 0) and (dbeValorCorrente.Value <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
               Repaint;
              if dbeValorDet.CanFocus then dbeValorDet.SetFocus;
              exit;
           end;

           if Sistema.UsaPlanoPatro then
           begin
             if (Trim(CmbPlano.Text) = '') or (Trim(CmbPatro.Text) = '' ) then
             begin
                MsgDlg('Obrigatório preencher o Plano Previdenciário e a Patrocinadora na ''Pasta'' Previdência','Erro',mtError,[mbOk],0);
               Repaint;
                if cmbPlano.CanFocus then cmbPlano.SetFocus;
                exit;
             end;
           end;

           // 15/12/04 Alex 18107
           if CmbPrograma.Text = '' then
             CdsDet.FieldByName('FLGTIPOPROGRAMA').Clear
           else
             CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString := CdsProgramaPrev.FieldByName('FLGTIPOPROGRAMA').AsString;


           // 22/01/04 Alex 14451 - Nova segregação
           if not VerificaPreenchimentoSegregaDetalhe then exit;


           _ValorEdit :=  _ValorEdit - dbeValorDet.Value;

           CdsDet.FieldByName('DESCRICAO').Text          := dblcTipoRD.Text;
           CdsDet.FieldByName('NOME').Text               := dblcUnidNegoc.Text;
           CdsDet.FieldByName('MOESIGLA').Text           := edMoedaDet.Text;
           CdsDet.FieldByName('VALOR').Value             := dbeValorDet.Value;
           CdsDet.FieldByName('VALOROUTRAMOEDA').Value   := dbeValorMoedaDet.Value;

           if CdsDet.FieldByName('CODDOCUMENTO').AsInteger<=0 then
           begin
              CdsDet.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
              CdsDet.FieldByName('CODDOCUMENTO').AsInteger := Cds.FieldByName('CODDOCUMENTO').AsInteger;
              CdsDet.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
           end;

           // 26/01/04 Alex estes campos não entram na grid se for repedito o insert
           CdsDet.FieldByName('IDSEGREGACRITER').AsInteger := -1;  // A SEGREGAÇÃO É RESOLVIDA NO PROCESSO CONTÁBIL
           CdsDet.FieldByName('NOMECENTROCUSTO').AsString := CmbCentCusto.Text;
           CdsDet.FieldByName('NOMEPATRO').AsString := CmbPatro.Text;
           CdsDet.FieldByName('DESCPLANO').AsString := CmbPlano.Text;
           CdsDet.FieldByName('DESCRICAO').AsString := dblcTipoRD.Text;
           if not CdsTipoRD.FieldByName('PLACONTACREDITO').isnull then
              CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
           else
              CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil  ;
           // FIM 26/01/04 Alex estes campos não entram na grid se for repedito o insert

        end;
     SetaCentResponDesemb(-1,True);
  end;

  inherited;

  if (CdsDet.state = dsInsert) then
  begin
    CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng  := _Ccusto;
    CdsDet.FieldByName('CODTIPRECDES').AsStrIng    := _Tpdesmb;
    CdsDet.FieldByName('UNIDNEGOC').AsStrIng       := _Ativproj;
    // início - andré tavares - pendência 17279 - 26/08/2004
    CdsDet.FieldByName('IDPROGRAMA').AsStrIng  := _Programa;
    CmbPrograma.CloseUp(True);
    // fim - andré tavares - pendência 17279 - 26/08/2004

    if (Trim(_Crespom) = '') or (Trim(_Crespom) = '9999999999') then
    begin
       CdsDet.FieldByName('CODCENTRORESPON').asstrIng  := '9999999999';
       CdsDet.FieldByName('NOME_1').Text := _NomeCentroRespon;
    end
    else
       CdsDet.FieldByName('CODCENTRORESPON').asstrIng  := _Crespom;

     if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
      MontaCentroDeCusto;
  end;


  {amf 01.03.2007 24450 - trava o lançamento se o plano previdenciário selecionado não estiver na lista
                          de planos previdenciários associados a contacorrente ligada ao portador-forma.}
  if (dblcPortadorForma.Text <> '') then
  begin
       if (cds.State in [dsInsert, dsEdit]) then
       begin
          try
            cdsLocal := TClientDataSet.Create(nil);
            cdsLocal.Data := CtrlPortadorForma.ListPortadorforma('',
                                                                 cds.FieldByName('CODPORTFORMA').AsInteger,
                                                                 Sistema.IdEmpresa,
                                                                 );

            if cdsAux.fieldByName('FLGOBRIGAMESMOPP').asString <> 'S' then //andré tavares - pendência 26434
              if (CtrlPortadorConta.PlanoPrevDifereDaLista(cdsLocal.FieldByName('CODPORTADOR').AsInteger,
                                                         cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
              begin
                MsgDlg('Plano Previdenciário ' + cmbPlano.DisplayValue + ' não encontrado na lista de planos'#13#10'associados a contacorrente para o portador-forma selecionado.'#13#10 + dblcPortadorForma.DisplayValue ,'Erro',mtError,[mbOk],0);
                abort;
              end;
          finally
            FreeAndNil(cdsLocal);
          end;
       end;
  end;

end;


procedure TfrmLancDocCAPCAR.CmeCadastroFind(Sender: TObject);
begin
    //Marcus Oliveira 23425
    ControlesReadyOnly(True);
     // Alex 02/08/2005 19870 bconfirmou := false; //andre tavares - pendência 18937 - 14/04/2005
     if (MontaSelect.RetornouValor) then
     begin

        _CodLancCAPCAR := StrtoInt(MontaSelect.ValoresChave[0]);

        SelDocs(_CodLancCAPCAR);

        _CodLancContab := Cds.FieldByName('PLNCODIGO').AsInteger;
        _Modulo := Cds.FieldByName('IDMODULO').AsInteger;

        _ContaCliFor := Cds.FieldByName('PLACONTA').AsString;
        _CCustoCliFor := Cds.FieldByName('CODCENTROCUSTO').AsString;

        cbLancaBaixa.Checked := ((Cds.FieldByName('OPERACAO').AsString = '10') or (Cds.FieldByName('OPERACAO').AsString = '15'));
        cbEnglobParc.Checked := ((Cds.FieldByName('OPERACAO').AsString = '1') or (Cds.FieldByName('OPERACAO').AsString = '11'));
        cbIntegra.Checked := (Cds.FieldByName('PLNCODIGO').AsInteger = 0);

        SetaEnglobaParcela;

        AbrindoTela  := False; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
        sCodCentResp := CdsDet.FieldByName('CODCENTRORESPON').AsString;
        //Vinicius Maciel - SOL 163982 KTN 1404974
        if((dbLcUnidNegoc.Text = '') and (dbLcUnidNegoc.LookupValue <> '')) then
        dbLcUnidNegoc.Text := CtrlParamCap.recuperaAtividadePerd(dbLcUnidNegoc.LookupValue)
        //Vinicius Maciel - SOL 163982 KTN 1404974 - FIM
     end;

end;




procedure TfrmLancDocCAPCAR.CmeCadastroEdit(Sender: TObject);
begin
  ControlesReadyOnly(False);
  inherited;
  PnlAp.Enabled := _LiberaAlteracaoOutroSistema;

  //DAVID - Pendência 14646
  if Cds.FieldByName('IDPROCESSO').AsInteger <> 0 then
  begin
    CdsProcessoRad.Close;
    SqlProcessoRad.Prepare;
    SqlProcessoRad.ParamByName('IDPROCESSO').AsInteger := Cds.FieldByName('IDPROCESSO').AsInteger;
    SqlProcessoRad.Open;

    if CdsProcessoRad.IsEmpty then
    begin
      MsgDlg('O processo RAD deste documento não foi encontrado. Não é possível alterá-lo.','Erro',mtError,[mbOk],0);
      Repaint;
      bbtnCancelar.Click;
      exit;
    end;
  end;

  if Cds.FieldByName('ESTORNO').AsInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido Alterar.','Erro',mtError,[mbOk],0);
      Repaint;
     bbtnCancelar.Click;
     exit;
  end;

  if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
  begin
    dbeValorMoeda.Enabled:=True;
    dbeValorCorrente.Enabled:=False;
  end
  else
  begin
    dbeValorMoeda.Enabled:=False;
    dbeValorCorrente.Enabled:=True;
  end;

  if CmpForCli.CanFocus then CmpForCli.SetFocus;

  _Valida := True;

  if cbLancaBaixa.Checked then
  begin
     dbenChBordero.Enabled := True;
     lblNumChBordero.Enabled := True;
  end
  else
  begin
     dbenChBordero.Enabled := False;
     lblNumChBordero.Enabled := False;
  end;

  DtmDadosBancarios.SetaContaPreferencial(Cds.FieldByName('IDFORCLI').AsFloat, Cds);

  _ContabDoc.PLANO          := 0;
  _ContabDoc.PLACONTA       := '';
  _ContabDoc.CODCENTROCUSTO := '';

  if ParamIntegra.IntegraContab and not(cbIntegra.Checked) and
     (( Cds.FieldByName('IDMODULO').AsInteger = 3 ) or
      ( Cds.FieldByName('IDMODULO').AsInteger = 4 )) then
  begin
     _DataLancto := Cds.FieldByName('DATALANCTO').AsDateTime;
     _ContabDoc.PLANO := Cds.FieldByName('PLANO').AsInteger;
     _ContabDoc.PLACONTA := Trim(Cds.FieldByName('PLACONTA').AsString);
     _ContabDoc.CODCENTROCUSTO := Trim(Cds.FieldByName('CODCENTROCUSTO').AsString);
  end
  else
     _DataLancto := 0;


end;


function TfrmLancDocCAPCAR.BuscaNomeConta(sPlaconta:String; iPlano: integer):String;
begin
  SqlDadosConta.Prepare;
  SqlDadosConta.ParamByName('PLACONTA').AsString := sPlaconta;
  SqlDadosConta.ParamByName('PLANO').AsInteger := iPlano;
  SqlDadosConta.Open;

  if not CdsDadosConta.IsEmpty then
     Result := CdsDadosConta.Fields[0].AsString
  else
   begin
     MsgDlg('Conta "' + sPlaconta + '" do plano "' + IntToStr(iPlano) + '" não cadsatrada', 'Atenção', mtWarning, [ mbOk ], 0);
      Repaint;
   end;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   //Bruno Bastos - Pend. 14399 e 14400 - 13/08/2003 - Início
   If Not AbrindoTela Then
   Begin
     if sbtnAlterar.Enabled then
     begin
        CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
        If (CdsAux.FieldByName('FLGACESSLANCDOC').AsString = 'S') And
           (sCodCentResp <> '') Then
        Begin
          SqlAux.Sql.Clear;
          SqlAux.Sql.Add(
          ' SELECT * FROM PESSOAXCRESP '+
          ' WHERE IDPESSOA  = ' + IntToStr(Sistema.IdEmpresa) +
          '   AND IDPESSOAACESSO  = ' + IntToStr(Sistema.IdUsuario) +
          '   AND CODCENTRORESPON = ' + sCodCentResp);
          SqlAux.Open;

          If CdsAux.IsEmpty Then
          Begin
            sbtnAlterar.Enabled := False;
            sbtnApagar.Enabled  := False;
          End
          Else
          Begin
            sbtnAlterar.Enabled := True;
            sbtnApagar.Enabled  := True;
          End;
        End;
     end;
   End;
   //Bruno Bastos - Pend. 14399 e 14400 - 13/08/2003 - Fim

   if (((_Modulo <> 3) and (_Modulo <> 4)) or
        (Cds.FieldByName('FLGIMPORTADO').AsString = 'S')) then

   begin
      sbtnAlterar.Enabled := False;
      sbtnApagar.Enabled  := False;
   end
   else
   begin
      if ( ParamIntegra.IntegraContab ) and (cbIntegra.Checked = False) and (sbtnInserir.Down = False) and (sbtnAlterar.Down = False) and (sbtnApagar.Down = False) then
      begin
         if ( ParamIntegra.EstornaContab ) then
            sbtnApagar.Enabled  :=False;
      end;
   end;

   sbtnEstornar.Enabled := (LblEstorno.Enabled) and (sbtnAlterar.Enabled) and (not bbtnConfirmar.Enabled);

   gbOutros.Enabled := bbtnConfirmar.Enabled;

   if _OperacaoLanc = opldContratoPrevisao then
   begin
      cbIntegra.Enabled:=False;
      cbLancaBaixa.Enabled:=False;
   end
   else
      if _OperacaoLanc = opldAdiantamento then
      begin
         cbEnglobParc.Enabled := False;
         cbLancaBaixa.Enabled := True;
         cbIntegra.Enabled := False;
      end;


  //início - andre tavares - pendência 22409 - 19/07/2006
  //MArcus Adicionado o dsBrowse   P. 23425 24/10/2006
  PnlDados.Enabled := cds.State in [dsEdit, dsInsert, dsBrowse];
  TbsGeral.Enabled := cds.State in [dsEdit, dsInsert, dsBrowse];

  //fim - andre tavares - pendência 22409 - 19/07/2006

end;



// Início-Form-Create...
procedure TfrmLancDocCAPCAR.FormCreate(Sender: TObject);
var RegAutoriza: TRegistry;
begin
  //início - andré tavares - pendência 26515 - 05/10/2007
  //carrega os parâmetros uma só vez.
  CtrlParamCap := TCtrlParamCap.Create;
  CtrlParamCap.InitializeAs(Padroes);
  CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  MontaCentroDeCusto;
  //fim - andré tavares - pendência 26515 - 05/10/2007

  iContaXCaixa := -1;

  CmpForCli.Enabled := false;
  grBoxRAD.visible := sistema.UsaRAD;
  sDataLanc := '';

  AbrindoTela := True;

  //início - andre tavares - pendência 17275 - 26/08/2004
  _Programa := '';
  _cdsAux := TcmClientDataset.Create(nil);
  //fim - andre tavares - pendência 17275 - 26/08/2004

//início - André Tavares - pendência 16975 - 28/06/2004 - não exibe o campo de
// compromisso orcamentário se estiver no contas a receber.
  Label17.Visible            := sistema.IdModulo <> 4;
  ReResOrc.Visible           := sistema.IdModulo <> 4;
  SpeedButton1.Visible       := sistema.IdModulo <> 4;
//fim - André Tavares - pendência 16975 - 28/06/2004

//início - André Tavares - pendência 15367 - 20/05/2004
  CtrlCentRespon := TCtrlCentRespon.Create;
  CtrlCentRespon.InitializeAS( Padroes );
//fim - André Tavares - pendência 15367 - 20/05/2004

  CtrlGrupoRateio := TCtrlGrupoRateio.Create;
  CtrlGrupoRateio.InitializeAs( Padroes );

  _oPeriodo := TCtrlPeriodo.Create;
  _oPeriodo.InitializeAs(Padroes);

  _oDocumento := TCtrlDocumento.Create;
  _oDocumento.InitializeAs(Padroes);

  _LancDocCapCar := TCtrlLancDocCapCar.Create;
  _LancDocCapCar.InitializeAs(Padroes);
  //DAVID - Retenção de Imposto
  _LancDocCapCar.OnRetencaoINSS := RetencaoOutrasEmpresas;

  _LancDocCapCar.OnPergunta := reprogDataVencto;

  // 23/01/04 Alex 14451 Nova Segregação de Recursos
  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.InitializeAs(Padroes);
  CtrlSegregacao.GetParams(Sistema.IdEmpresa);

  // 01/04/2004 Marchetti Pendencia 15733 e 15734
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);

  // Marcio Motta - 17317 - 20/04/2005
  CtrlModeloHistorico := TCtrlModeloHistorico.Create;
  CtrlModeloHistorico.InitializeAs(Padroes);

  //amf 18886 27.01.2006
  CtrlTipoAlterador := TCtrlTipoAlterador.Create;
  CtrlTipoAlterador.InitializeAs(Padroes);

  //amf 01.03.2007 24450
  CtrlPortadorConta := TCtrlPortadorConta.Create;
  CtrlPortadorConta.InitializeAs(Padroes);

  CtrlPortadorForma := TCtrlPortadorForma.Create;
  CtrlPortadorForma.InitializeAs(Padroes);

  //andre tavares
  CtrlParamGlobal := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(padroes);

  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAS( Padroes );

  //amf 12.04.2007 22592
  ctrlTipoRecebDesemb := TCtrlTipoRecebDesemb.Create;
  ctrlTipoRecebDesemb.InitializeAs(Padroes);

  CtrlPessoaForne := TCtrlPessoaForne.Create;
  CtrlPessoaForne.InitializeAs(Padroes);

  CtrlFormaRecPag := TCtrlFormaRecPag.Create;
  CtrlFormaRecPag.InitializeAs(Padroes);

  _LiberaAlteracaoOutroSistema := False;

  RegAutoriza := TRegistry.Create;
  Try
     RegAutoriza.RootKey := HKEY_CURRENT_USER;

     if ( ParamIntegra.RecPag = 'P' ) then
        RegAutoriza.OpenKey('Software\CM\Contas a Pagar', True)
     else
        RegAutoriza.OpenKey('Software\CM\Contas a Receber', True);

     if RegAutoriza.ValueExists('Libera Alteração de Documentos') then
        _LiberaAlteracaoOutroSistema := (RegAutoriza.ReadString('Libera Alteração de Documentos') = 'S')
     else
        RegAutoriza.WriteString('Libera Alteração de Documentos','N');
  Finally
     RegAutoriza.Free;
  end;

  DiasUteis.SetLogradouro(Sistema.IdEmpresa, _IdCidade, _IdPais, _UF);

  DbeNoDocumento.Visible := (Trim( ParamIntegra.MascaraNoDocum ) <> '');
  dbenNumDoc.Visible := not DbeNoDocumento.Visible;

  dbeCompl.ReadOnly := ParamIntegra.AssociaComplTipoFat;

  _Modulo := 0;

  inherited;

  if ( ParamIntegra.IntegraContab ) then
  begin
     cbIntegra.Checked    := False;
     cbIntegra.Enabled    := True;
  end
  else
  begin
     cbIntegra.Checked    := True;
     cbIntegra.Enabled    := False;
  end;

   if ( ParamIntegra.RecPag = 'R' ) then
   begin
      LblNumAp.Caption           := 'Nº da GR';
      lblTipoRD.Caption          := 'Tipo de Recebimento';
      Caption                    := 'Lançamento de Documentos no Contas a Receber';
      CmpForCli.Caption          := ' Cliente ';
      CmpForCli.ForCli           := fcCliente;
      lblPortadorForma.Caption   := 'Contas/Caixas x Tipo Cobr';
      lblNumChBordero.Caption    := 'No. Recebto.';
      LblFormaPag.Caption        := 'Tipos de Cobrança';

      lblRateio.Visible          := False;
      DBcboGrupoRateio.Visible   := False;
      btnGrupoRateio.Visible     := False;
   end
   else
   begin
      LblNumAp.Caption           := 'Nº da AP';
      lblTipoRD.Caption          := 'Tipo de Desembolso';
      Caption                    := 'Lançamento de Documentos no Contas a Pagar';
      CmpForCli.Caption          := ' Favorecido ';
      CmpForCli.ForCli           := fcFornecedor;
      lblPortadorForma.Caption   := 'Contas/Caixas x Forma de Pag';
      lblNumChBordero.Caption    := 'No. Ch./Borderô';
      LblFormaPag.Caption        := 'Forma de Pagamento';
      LblSubContaCli.Caption     := 'Sub-Conta Fornecedor';

      sqlGrupoRateio.Open;
   end;

   GpDotorc.Enabled := (( ParamIntegra.IntegraOrcamento ) and ( ParamIntegra.RecPag = 'P' ));
   GpBarras.Visible := ( ParamIntegra.RecPag = 'P' );
   GpConta.Visible := ( ParamIntegra.RecPag = 'P' );

   if GpDotorc.Enabled then
      MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

   _DataLancto := Date;
   _CodTipDoc := 0;
   pnlMestre.Enabled := False;
   _CodLancCAPCAR := 0;
   _CodLancContab := 0;

   MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
   MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.idempresa));
   MontaSelect.Filtro.Add('TIPODOCRECPAG.CODTIPDOC In (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
                          QuotedStr(ParamIntegra.RecPag) + ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(ParamIntegra.RecPag) + ' and b.idusuario=' +
                          Inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
                          QuotedStr(ParamIntegra.RecPag) + '  and exists (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(ParamIntegra.RecPag) + ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                          Inttostr(sistema.idusuario)+'))');
   MontaSelect.Filtro.Add('TIPODOCRECPAG.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));

  if _OperacaoLanc = opldContratoPrevisao then
     MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''11'' OR DOCUMENTO.OPERACAO = ''12''')
  else
    if _OperacaoLanc = opldAdiantamento then
     MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''14'' or DOCUMENTO.OPERACAO = ''15''')
    else
     MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''1'' OR DOCUMENTO.OPERACAO = ''2'' OR DOCUMENTO.OPERACAO = ''10''');

  SelDocs(-1);
  _Modulo := Cds.FieldByName('IDMODULO').AsInteger;

  if _OperacaoLanc = opldEfetivo then
  begin
     if ( ParamIntegra.RecPag = 'R' ) then
        Caption := 'Lançamento de Documentos no Contas a Receber'
     else
     begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
       Caption := 'Lançamento de Documentos no Contas a Pagar';
       HelpContext           := 30009;
       bbtnAjuda.HelpContext := 30009;
     end;
  end
  else
  begin

     if _OperacaoLanc = opldContratoPrevisao then
     begin
       lblEmissao.Caption := 'Início';
       lblData.Caption := 'Quebra';
     end;

     if ( ParamIntegra.RecPag = 'R' ) then
     begin
        if _OperacaoLanc = opldAdiantamento then
           Caption  := 'Lançamento de Adiantamento no Contas a Receber'
        else
           Caption  := 'Lançamento de Previsões no Contas a Receber';
     end
     else
     begin
        if _OperacaoLanc = opldAdiantamento then
        begin
          Caption := 'Lançamento de Adiantamento no Contas a Pagar';
          HelpContext           := 30015;
          bbtnAjuda.HelpContext := 30015;
        end
        else
        begin
          Caption := 'Lançamento de Previsões no Contas a Pagar';
          HelpContext           := 30013;
          bbtnAjuda.HelpContext := 30013;
        end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
     end;

     cbIntegra.Checked:=True;
  end;

  CmpForCli.Mensagens.EmBranco := CmpForCli.Caption + CmpForCli.Mensagens.EmBranco;
  CmpForCli.Mensagens.NaoExiste:= CmpForCli.Caption + CmpForCli.Mensagens.NaoExiste;

  SqlFormaPag.Prepare;
  SqlFormaPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlFormaPag.OPen;

  if UpperCase( Sistema.TipoEmpresa ) = 'P' then
  begin
     PnlPrograma.Visible := True;

     SqlPlanoPrev.Prepare;
     SqlPlanoPrev.Open;

     SqlProgramaPrev.Prepare;
     SqlProgramaPrev.Open;

     SqlPatroPrev.Prepare;
     SqlPatroPrev.Open;
  end
  else
  begin
     PnlRateioGeral.Parent := pnlControlesDet;
     PnlPrograma.Visible := False;
  end;

  if ( not ParamIntegra.TipoOperOk ) and ( ParamIntegra.IntegraContab ) then
  begin
    MsgDlg('Para ter este sistema Integrado com a Contabilidade é necessário cadastrar o Tipo de Operação 03 no GlobalCM. Caso este código não seja cadastrado, este sistema não aceitará nenhum lançamento.','Atenção',mtWarnIng,[mbOk],0);
   Repaint;
    Close;
    Exit;
  end;

  SqlAlt.Prepare;
  SqlAlt.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlAlt.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlAlt.Open;

  SqlTipoDoc.Prepare;
  SqlTipoDoc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  SqlTipoDoc.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDoc.Open;

  SqlPortForma.Prepare;
  SqlPortForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlPortForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlPortForma.Open;

  SqlMoeda.Open;

  _NomeCentroRespon := '';
  _CodCentroRespon  := '';

  //Bruno Bastos - 14399 e 14400 - 14/08/2003 - Início

  //andré tavares - pendência 26515 - 05/10/2007 - comentei o código abaixo, pois isso já foi feito no formCreate
  CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  If CdsAux.FieldByName('FLGACESSLANCDOC').AsString = 'S' Then
  Begin
// início - André Tavares - pendência 15367 - 20/05/2004
    cdsCentroRespon.Data := CtrlCentRespon.ListaCentResponAtrib_Usu(Sistema.IdUsuario,
                            Sistema.IdEmpresa, tcrAmbos, ParamIntegra.PlanoCentroRespon);
// fim - André Tavares - pendência 15367 - 20/05/2004
  End
  Else
  begin
// início - André Tavares - pendência 15367 - 20/05/2004
    cdsCentroRespon.Data := CtrlCentRespon.GetCentResponPadrao(Sistema.IdEmpresa, ParamIntegra.PlanoCentroRespon);
    _NomeCentroRespon := CdsCentroRespon.FieldByName('NOME').AsString;
    _CodCentroRespon := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    cdsCentroRespon.Data := CtrlCentRespon.ListaCentRespon(Sistema.IdEmpresa, '', 1, '', ParamIntegra.PlanoCentroRespon, true, true);
  end;
// fim - André Tavares - pendência 15367 - 20/05/2004

  SqlUnidNegoc.Prepare;
  SqlUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.idempresa;
  SqlUnidNegoc.Open;

  if ( ParamIntegra.IntegraContab ) then
  begin
     With SqlSubConta, Sql Do
     begin
        Clear;
        Add(' SELECT ');
        Add('    NOMESUBCONTA, ');
        Add('    CODSUBCONTA ');
        Add(' FROM ');
        Add('    SUBCONTA ');
        Add(' WHERE ');
        Add('   (IDPESSOA = :IDPESSOA) ');
        Add(' ORDER BY ');
        Add('   NOMESUBCONTA ');

        Prepare;
        ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
        Open;
     end;

     With SqlSubContaForCli, Sql Do
     begin
        Clear;
        Add(' SELECT ');
        Add('    NOMESUBCONTA, ');
        Add('    CODSUBCONTA ');
        Add(' FROM ');
        Add('    SUBCONTA ');
        Add(' WHERE ');
        Add('   (IDPESSOA = :IDPESSOA) ');
        Add(' ORDER BY ');
        Add('   NOMESUBCONTA ');

        Prepare;
        ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
        Open;
     end;

     tbsContabil.Enabled := (not cbIntegra.Checked);
  end
  else
  begin
    tbsContabil.Enabled := False;
    CmbSubConta.Enabled := False;
  end;



  if _OperacaoLanc = opldContratoPrevisao then
  begin
     cbIntegra.Enabled:=False;
     cbLancaBaixa.Enabled:=False;
  end
  else
     if _OperacaoLanc = opldAdiantamento then
     begin
        cbEnglobParc.Enabled := False;
        cbLancaBaixa.Enabled := True;
        cbIntegra.Enabled := False;
     end;

  SelecionaTipoDesembolso;

  (* Gustavo 16/04/2003 - Inicio - Solicita data para disponibilidade financeira*)
  With TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.UsaPlanoPatro) Do
  Try
    InitializeAs(Padroes);
    LblDIspFinanc.Visible := ((ParamIntegra.RecPag = 'R') and IntegraDispFinanc);
    dbeDataDisponib.Visible := LblDIspFinanc.Visible;
  finally
    Free;
  end;
  (* Gustavo 16/04/2003 - Inicio - Solicita data para disponibilidade financeira*)


// inicio - andre tavares - 04/08/2004 - pendência 17290 ***
  With SqlCCusto, Sql Do
  begin
     Clear;
     Add(' SELECT ');
     Add('    CENT.CODEXTERNO, ');
     Add('    CENT.CODCENTROCUSTO, ');
     Add('    CENT.NOME ');
     Add(' FROM ');
     Add('    CENTCUST CENT ');
     Add(' WHERE ');
     Add('    CENT.ATIVO = ''S'' and ');
     Add('    CODCENTROCUSTO IN ');
     Add('       ( ');
     Add('          SELECT ');
     Add('             CODCENTROCUSTO ');
     Add('          FROM ');
     Add('             CONTASxCC CONT ');
     Add('          WHERE ');
     Add('             CONT.IDEMPRESA = CENT.IDEMPRESA and ');
     Add('             CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO and ');
     Add('             CONT.IDEMPRESA = :IDEMPRESA and ');
     Add('             CONT.PLANO = :PLANO  ');
     Add('            ) AND CENT.IDPLANCENTCUST = :IDPLANCENTCUST');

     prepare;
     ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
     ParamByName('PLANO').AsInteger := ParamIntegra.Plano;
     ParamByName('IDPLANCENTCUST').AsInteger := ParamIntegra.PlanoCentroCusto;
     Open;
  end;

// fim - andre tavares - 04/08/2004 - pendência 17290
end; // Fim-Form-Create...



procedure TfrmLancDocCAPCAR.tbcDetalheChange(Sender: TObject);
begin
  inherited;

   if ( ParamIntegra.RecPag = 'P' ) and ( tbcDetalhe.TabIndex = 1 ) then
   begin
      lblRateio.Visible          := True;
      DBcboGrupoRateio.Visible   := True;
      btnGrupoRateio.Visible     := True;
   end
   else
   begin
      lblRateio.Visible          := False;
      DBcboGrupoRateio.Visible   := False;
      btnGrupoRateio.Visible     := False;
   end;


  //Se o sistema está integrado com a contabilidade e a origem do lançamento for cap ou car
  //faz a contabilização do mesmo
  if ( ParamIntegra.IntegraContab ) and
     ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
     (Cds.FieldByName('IDMODULO').AsInteger = 4)) and
     (Cds.State In ([dsInsert,dsEdit])) and
     (pgctrlDetalhe.ActivePage.PageIndex = 2) then
  begin
     cds.Edit;
     Cds.FieldByName('DEBCRE').AsString := CdsTipoDoc.FieldByName('DEBCRE').AsString;

     if not _LancDocCapCar.DeterminaContabilizacao((not cbIntegra.Checked),
                                                   placontas, TClientDataSet(cds),
                                                   TClientDataSet(cdsCCBaixasXDocum),
                                                   TClientDataSet(cdsContab),
                                                   TClientDataSet(cdsDet).data,
                                                   sistema.idEmpresa, paramIntegra.Plano, cbLancaBaixa.Checked,
                                                   _OperacaoLanc, dblcTipoDoc.Text,
                                                   paramintegra.recpag) then
      begin
         MsgDlg( _LancDocCapCar.MessageInfo, 'Erro Contabilização',mtError,[mbOk],0);
      end;
      cds.FieldByName('PLANO').asInteger           := placontas.iPlano;
      cds.FieldByName('PLACONTA').asString         := placontas.sPlacontaPass;
      Cds.FieldByName('CODCENTROCUSTO').AsString   := placontas.scodCentroCusto;
      cds.FieldByName('IDSEGREGACRITER').asInteger := placontas.iIdSegregaCriter;

     CmeDetalhe.AtualizaBotoes(Self);
  end;

  //Se o sistema não está integrado com a contabilidade passa direto para pasta de lançamentos
  if (( not ParamIntegra.IntegraContab ) or
      (cbIntegra.Checked = True)) and
      (Cds.State In ([dsInsert,dsEdit])) then
  begin
      if tbcDetalhe.TabIndex = 2 then
      begin
         pgctrlDetalhe.ActivePage := tbsLancamento;
         tbcDetalhe.TabIndex := 3;
         tbcDetalheChange(Self);
      end;
  end;

   if (tbcDetalhe.TabIndex = 4) then
   begin
     sbtnInsDet.Enabled := ((sbtnInserir.Down) and ( _OperacaoLanc = opldEfetivo ));
     sbtnAltDet.Enabled := sbtnInsDet.Enabled;
     sbtnExcluiDet.Enabled := sbtnInsDet.Enabled;
   end
   else
   begin
    //início - andre tavares - pendência 22409 - 19/07/2006
     sbtnInsDet.Enabled := bbtnConfirmar.Enabled;
    //fim - andre tavares - pendência 22409 - 19/07/2006
     sbtnAltDet.Enabled := sbtnInsDet.Enabled;
     sbtnExcluiDet.Enabled := sbtnInsDet.Enabled;
   end;


end;


procedure TfrmLancDocCAPCAR.dbeValorMoedaExit(Sender: TObject);
begin
  inherited;
  dbeValorCorrente.Value := dbeValorMoeda.Value * _ValorCotacao;
end;


procedure TfrmLancDocCAPCAR.dbeValorMoedaDetExit(Sender: TObject);
begin
  inherited;
  dbeValorDet.Value:=dbeValorMoedaDet.Value * _ValorCotacao;
end;


procedure TfrmLancDocCAPCAR.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
        dbeValorMoedaDet.Enabled := True;
        dbeValorDet.Enabled := False;
     end
     else
     begin
        dbeValorMoedaDet.Enabled := False;
        dbeValorDet.Enabled := True;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') then
     begin
        MsgDlg('Atividade/Projeto precisa ser analítica!', 'Atenção', mtWarnIng, [mbOk], 0);
         Repaint;
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asstrIng;
  end;
end;




procedure TfrmLancDocCAPCAR.bbtnCancelarClick(Sender: TObject);
begin
  CmpForCli.Enabled := false;

  SetaCentResponDesemb(-1,True);

  if not sbtnInsDet.Enabled then bbtnCancelarDetClick(Self);

  pnlMestre.Enabled:=False;

  inherited;
end;




procedure TfrmLancDocCAPCAR.sbtnEstornarClick(Sender: TObject);
begin
  inherited;
  CmpForCli.Enabled := true;

  _TpDesmb   := '';
  _AtivProj  := '';
  _Ccusto   := '';
  _CRespom   := '';
  _Programa := ''; // andre tavares - pendência 17279

  if not Cds.FieldByName('CODDOCUMENTO').isNull then
     if ConfereSaldo(Cds.FieldByName('CODDOCUMENTO').AsInteger,True) then Exit;

  if Cds.FieldByName('ESTORNO').AsInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido estornar outra vez.','Erro',mtError,[mbOk],0);
      Repaint;
     sbtnEstornar.Down:=False;
     exit;
  end;

  {**
    O Parâmetro oeDialogProcessa indica que será exibida uma caixa de diálogo na
    tela e o processamento será efetuado na aplicação servidora
  **}
  
  if _oDocumento.Estornar(Cds.FieldByName('DATALANCTO').AsDateTime,
                          Sistema.IdModulo,
                          Sistema.IdEmpresa,
                          Sistema.IdUsuario,
                          Cds.FieldByName('CODDOCUMENTO').AsInteger,
                          0,
                          ParamIntegra.Plano,
                          Sistema.UsaPlanoPatro,
                          oeDialogProcessa,
                          0,
                          0,
                          true,
                          true
                          ) then
  begin
     MsgDlg('Documento estornado com sucesso', 'Atenção',  mtInformation, [mbOk], 0);
      Repaint;
     CmeCadastro.Find(Self);
  end
  else
   begin
     MsgDlg(_oDocumento.MessageInfo,'Atenção',mtWarning,[mbOk],0);
      Repaint;
  end;


  sbtnEstornar.Down := False;
end;




procedure TfrmLancDocCAPCAR.dblcMoedaExit(Sender: TObject);
begin
  inherited;
  if not Cds.FieldByName('MOECODIGO').isNull then
  begin
     _ValorCotacao := FuncaoGeral.TestaCotacaoMoeda(Cds.FieldByName('MOECODIGO').AsInteger, dbeDataLanc.Text, 'S');
     if  (_ValorCotacao = 0) then
     begin
        if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
        exit;
     end;
     dbeValorMoeda.Enabled:=True;
     dbeValorCorrente.Enabled:=False;
  end
  else
  begin
     dbeValorMoeda.Enabled:=False;
     dbeValorCorrente.Enabled:=True;
  end;
end;




procedure TfrmLancDocCAPCAR.dbeDataVencExit(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down = True then
  begin
     if _IdCidade <> 0 then
       if not diasuteis.DiaUtil(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
       begin
         if (Application.MessageBox('Data de vencimento não é um dia útil. Deseja alterar ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
         begin
            if (Application.MessageBox('Lançar para o primeiro dia útil posterior?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
              dbeDataVenc.Date := diasuteis.PrimeiroDiaUtilPosterior(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false)
            else
              dbeDataVenc.Date := diasuteis.UltDiaUtilAnterior(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false);
         end;
      end;

     Cds.FieldByName('DATAPROGRAMADA').AsDateTime := strtodate(dbeDataVenc.text);
     dbeDataProgr.text := dbeDataVenc.text;
  end;
end;




procedure TfrmLancDocCAPCAR.ExecutaPrevAdianto;
begin
  if ParamIntegra.RecPag = 'P' then
  begin
     SqlForneAdianto.Prepare;
     SqlForneAdianto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SqlForneAdianto.ParamByName('IDFORCLI').AsInteger := CmpForCli.ForCliReg.Id;
     SqlForneAdianto.ParamByName('IDRAMOFORNECEDOR').AsInteger := Modulo.RamoFornAdianto;
     SqlForneAdianto.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlForneAdianto.Open;
  end
  else
  begin
     SqlCliAdianto.Prepare;
     SqlCliAdianto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SqlCliAdianto.ParamByName('IDFORCLI').AsInteger := CmpForCli.ForCliReg.Id;
     SqlCliAdianto.ParamByName('IDTIPOCLIENTE').AsInteger := Modulo.IdTipoCliAdianto;
     SqlCliAdianto.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlCliAdianto.Open;
  end;

  if not CdsForCliAdianto.IsEmpty then
     if (Application.MessageBox('Existe adiantamento\previsão pendente. Deseja regularizar agora ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
       AbrirFormModal(FrmRegPrevAdiantoMT, TFrmRegPrevAdiantoMT)
     else
       _IdForCliAdianto := 0;


//andre tavares 29/06/2006
  //primeiro seta o foco aqui
  if dbenNumDoc.Canfocus then dbenNumDoc.SetFocus;

end;




procedure TfrmLancDocCAPCAR.sbtnInserirClick(Sender: TObject);
begin
  // Alex - 29/01/2007 - Já estava apertado inserir
  if (CmeCadastro.Operacao = opInserir) then
  begin
     sbtnInserir.Down := true;
     Exit;
  end;

  CmpForCli.Enabled := true;
  sDataLanc := ''; // André Tavares - pendência 18937 - 25/04/2005
  _TpDesmb  :='';
  _AtivProj := '';
  _Ccusto  :='';
  _CRespom  :='';
  _Programa := ''; // andre tavares - pendência 17279

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  dblcTipoRD.Enabled := False;

  _ValorEdit := 0;
  _Valida := True;


  inherited;

  if CmpForCli.CanFocus then
     CmpForCli.setFocus;
end;




procedure TfrmLancDocCAPCAR.bbtnOkDetClick(Sender: TObject);
begin
  //início andre tavares - pendência 15372 - 03/06/2004
  if (cdsDet.State in [dsInsert, dsEdit]) and ((trim(CmbCentCusto.text) <> '') and (trim(CmbCentCusto.lookupvalue) <> '')) then
  begin
    cdsDet.FieldByName('CODEXTERNOCR').asString := CdsCentroRespon.fieldByName('CODEXTERNO').asString;
    cdsDet.FieldByName('CODEXTERNOCC').asString := CdsCentroCusto.fieldByName('CODEXTERNO').asString;
  end;
  //fim andre tavares - pendência 15372 - 03/06/2004

  //Bruno Bastos - Pend. 25204 - Início
  if MsResORc.RetornouValor then
  begin
    //Testa se os campos do compromisso orçamentário estão iguais aos do rateio
       //Plano Previdenciário
    if ( CmbPlano.LookupValue           <> MsResORc.ValoresChave[3] ) and
       ( trim(MsResORc.ValoresChave[3]) <> ''                       ) then
    begin
      MsgDlg('Plano previdenciário do compromisso orçamentário diferente do plano previdenciário do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Patrocinadora
    if ( CmbPatro.LookupValue           <> MsResORc.ValoresChave[4] ) and
       ( trim(MsResORc.ValoresChave[4]) <> ''                       ) then
    begin
      MsgDlg('Patrocinadora do compromisso orçamentário diferente da patrocinadora do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Atividade e Projeto
    if ( dblcUnidNegoc.LookupValue      <> MsResORc.ValoresChave[5] ) and
       ( trim(MsResORc.ValoresChave[5]) <> ''                       ) then
    begin
      MsgDlg('Atividade/projeto do compromisso orçamentário diferente de atividade/projeto do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Centro de Custo
    if ( CmbCentCusto.LookupValue       <> MsResORc.ValoresChave[6] ) and
       ( trim(MsResORc.ValoresChave[6]) <> ''                       ) then
    begin
      MsgDlg('Centro de custo do compromisso orçamentário diferente do centro de custo do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Centro de Responsabilidade
    if ( dblcCentroRespon.LookupValue   <> MsResORc.ValoresChave[7] ) and
       ( trim(MsResORc.ValoresChave[7]) <> ''                       ) then
    begin
      MsgDlg('Centro de responsabilidade do compromisso orçamentário diferente do centro de responsabilidade do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Programa
    if ( CmbPrograma.LookupValue        <> MsResORc.ValoresChave[8] ) and
       ( trim(MsResORc.ValoresChave[8]) <> ''                       ) then
    begin
      MsgDlg('Programa do compromisso orçamentário diferente do programa do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;
  end;
  //Bruno Bastos - Pend. 25204 - Fim

  // início - andré tavares - pendência 17279 - 26/08/2004
  if trim(CdsDet.FieldByName('IDPROGRAMA').AsStrIng) <> '' then
    _Programa := CdsDet.FieldByName('IDPROGRAMA').AsStrIng;

  CmbPrograma.LookupValue := _Programa;
  if trim(_Programa) <> '' then
    CdsProgramaPrev.Locate('IDPROGRAMA', _Programa, []);

  if (cdsDet.State in [dsEdit, dsInsert]) and (trim(CmbPrograma.Text)<> '') then
    CdsDet.FieldByName('DESCPROGRAMA').AsString := CmbPrograma.Text;
  // fim - andré tavares - pendência 17279 - 26/08/2004

  if (tbcDetalhe.TabIndex = 4) then
  begin
     if not TestaAlterador then Exit;
  end;

  inherited;

  if tbcDetalhe.TabIndex = 1 then
  begin
     dbeValorDet.Value := _ValorEdit;
     if IsFloatZero(dbeValorDet.Value) then bbtnVoltarDet.Click;
  end;
end;




procedure TfrmLancDocCAPCAR.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  if (tbcDetalhe.TabIndex = 4) then AtualizaSaldo;
end;




procedure TfrmLancDocCAPCAR.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex = 4) then AtualizaSaldo;
end;




procedure TfrmLancDocCAPCAR.sbtnInsDetClick(Sender: TObject);
begin
  if not ValidaOperacao then Exit;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    inherited;

    if (tbcDetalhe.TabIndex = 1) then
    begin
       if IsFloatZero(_ValorEdit) then
       begin
          MsgDlg('O Total do Rateio Já Foi Fechado!', 'Erro', mtError, [mbOk], 0);
          Repaint;
          bbtnCancelarDet.Click;
       end
       else
          dbeValorDet.Value := _ValorEdit;
    end;
  end;
end;




procedure TfrmLancDocCAPCAR.sbtnAltDetClick(Sender: TObject);
begin
  if not ValidaOperacao then Exit;

  if ( CdsAtual <> nil ) and CdsAtual.IsEmpty then
  begin
    sbtnAltDet.Down := false;
    Exit;
  end;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    inherited;

    if tbcDetalhe.TabIndex = 1 then
    begin

      if CdsDet.State <> DsEdit then
        CdsDet.Edit;

      if (_ValorEdit <> 0) and (CdsDet.State = DsInsert) then
      begin
         _ValorEdit := (_ValorEdit + CdsDet.FieldByName('VALOR').AsFloat);
         dbeValorDet.Value := _ValorEdit
      end
      else
      begin
        _ValorEdit := CdsDet.FieldByName('VALOR').AsFloat;
        dbeValorDet.Value := CdsDet.FieldByName('VALOR').AsFloat;
      end;

      if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
        MontaCentroDeCusto;
        
    end;

  end;
end;




procedure TfrmLancDocCAPCAR.sbtnExcluiDetClick(Sender: TObject);
begin
  if not ValidaOperacao then Exit;

  if ( CdsAtual <> nil ) and CdsAtual.IsEmpty then Exit;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    if (tbcDetalhe.TabIndex = 1) then
       _ValorEdit := _ValorEdit + CdsDet.FieldByName('VALOR').AsFloat;

    inherited;
  end;
end;


procedure TfrmLancDocCAPCAR.dbeValorCorrenteChange(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
     CalculaValorEdit;

     if Cds.State in [ DsEdit, DsInsert ] then
        Cds.FieldByName('VLRLIQUIDO').AsFloat := dbeValorCorrente.Value;
  end;
end;




procedure TfrmLancDocCAPCAR.sbtnAlterarClick(Sender: TObject);
begin

   if (CmeCadastro.Operacao = opAlterar) then
   begin
      sbtnAlterar.Down := true;
      Exit;
   end;

  CmpForCli.Enabled := true;
  sDataLanc := Cds.FieldByName('DATALANCTO').AsString; // ANDRE TAVARES - pendência 19937

  if (Cds.FieldByName('OPERACAO').AsString = '10') then
  begin
    MsgDlg('Não é possível alterar ' + Caption + ' efetuados com a opção de "Lança e Baixa"', 'Erro', mtError,[mbOk],0);
   Repaint;
    sbtnAlterar.Down := False;
  end
  else

  // Início -  Rodolpho da Silva - P: 18588 - 22/06/2005
  if not VerificaSeDocAdiantEstaRegularizado then
  begin
     MsgDlg('Não é possível alterar documento com adiantamento já regularizado. ' + #13 +
            'Para alterar, é necessário excluir a regularização do mesmo.','Erro',mtError,[mbOk],0);
     sbtnAlterar.Down := False;
     Exit;
  end
  else
  // Fim -  Rodolpho da Silva - P: 18588 - 22/06/2005

    if Modulo.StatusIsAtivo(Cds.FieldByName('IDFORCLI').AsInteger) then
    begin
      _TpDesmb  := '';
      _AtivProj := '';
      _Ccusto  :='';
      _Crespom  := '';
      _Programa := ''; // andre tavares - pendência 17279

      if not Cds.FieldByName('CODDOCUMENTO').isNull and
        (not _LiberaAlteracaoOutroSistema) then
      begin
        if VerificaParcelas(Cds.FieldByName('NUMFATURA').AsString) then Exit;
        if ConfereSaldo(Cds.FieldByName('CODDOCUMENTO').AsInteger,False) then Exit;
      end;

      _ValorEdit := 0;

      inherited;

    end
    else
      sbtnAlterar.Down := False;

  tbcDetalheChange(tbcDetalhe);
end;




procedure TfrmLancDocCAPCAR.sbtnApagarClick(Sender: TObject);
begin
  CmpForCli.Enabled := true;
  _TpDesmb  := '';
  _AtivProj := '';
  _Ccusto  := '';
  _Crespom  := '';
  _Programa := ''; // andre tavares - pendência 17279


  inherited;
end;




procedure TfrmLancDocCAPCAR.dsLancamentoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (not bbtnConfirmar.Enabled) and
     (not CdsLancamento.IsEmpty) then
  begin
    SqlContab.Prepare;
    SqlContab.ParamByName('PLNCODIGO').AsFloat := CdsLancamento.FieldByName('PLNCODIGO').AsInteger;
    //20317 - andre tavares - para poder selecionar os lançamentos contábeis de antecipação de receita
    SqlContab.ParamByName('PLNANTECIPA').AsFloat := CdsLancamento.FieldByName('PLNANTECIPA').AsInteger;
    SqlContab.Open;
  end;
end;




function TfrmLancDocCAPCAR.ConfereSaldo(iCodDocumento: integer;bVerificaLanc: boolean):boolean;
begin
 _oDocumento.Saldo.CalculaSaldo(iCodDocumento);

 if bVerificalanc then
    Result :=  ( ((Cds.FieldByName('STATUS').AsString = '2') and
                  (Cds.FieldByName('OPERACAO').asstrIng <> '10')) or
               (not FloatsEqual(Abs(_oDocumento.Saldo.Valor), Abs(dbeValorCorrente.Value))))
 else
    Result :=  ( ((Cds.FieldByName('STATUS').AsString = '2') and
                  (Cds.FieldByName('OPERACAO').asstrIng <> '10')) or
                  (IsFloatZero(_oDocumento.Saldo.Valor)));

 if Result then
   begin
    MsgDlg('Existem outros lançamentos para este documento, proibido alterar, excluir ou estornar','Erro',mtError,[mbOk],0);
   Repaint;
   end;
end;




function TfrmLancDocCAPCAR.VerificaParcelas(sNumFatura: String):boolean;
begin
 if (sNumFatura = '0') or (sNumFatura = '') then
    Result := False
 else
 begin
    Result := FazQuery(DtmBaseDados.qry,'SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NUMFATURA = ' + sNumFatura + ' and OPERACAO = ''3''');
    DtmBaseDados.qry.Close;
    if Result then
      begin
       MsgDlg('O Documento foi Englobado\Parcelado, favor excluir as parcelas para modificar o documento','Erro',mtError,[mbOk],0);
      Repaint;
      end;
 end;
end;




procedure TfrmLancDocCAPCAR.cbLancaBaixaClick(Sender: TObject);
begin
  inherited;
  dbenChBordero.Enabled   := cbLancaBaixa.Checked;
  lblNumChBordero.Enabled := cbLancaBaixa.Checked;

  if not cbLancaBaixa.Checked then
     if (Cds.State In ([dsInsert,dsEdit])) then Cds.FieldByName('NUMCHQBORDERO').Clear;
end;




procedure TfrmLancDocCAPCAR.CmpForCliEnter(Sender: TObject);
begin
  inherited;
  dblcTipoRD.Enabled := False;
end;




procedure TfrmLancDocCAPCAR.CmpForCliExit(Sender: TObject);
begin
  Try
    //início - andre tavares - pendência 22237 - 23/08/2006 - busca a conta bancária do novo fornecedor
    if cds.state in [dsEdit, dsInsert] then
    begin
      sqlContaBancaria.Prepare;
      sqlContaBancaria.paramByName('IDFORCLI').asInteger := Cds.FieldByName('IDFORCLI').asInteger;
      sqlContaBancaria.Open;

      //amf 27.04.2007 25203 - Não habilitar o gpConta caso o fornecedor não tenha dados bancários.
      gpConta.Enabled := (not cdsContaBancaria.IsEmpty);

      Cds.FieldByName('IDCBANCARIA').AsInteger := cdsContaBancaria.FieldByName('IDCBANCARIA').asInteger;
    end;
    //fim - andre tavares - pendência 22237 - 23/08/2006

    frmAguarde.Mostra( 'Favor aguardar' );
    frmAguarde.Min := 0;
    frmAguarde.Max := 5;
    frmAguarde.Pos := 0;
    inherited;
    if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
       (ActiveControl <> nil) and (ActiveControl.Tag <> 9999) and _Valida then
    begin
       if ( not (Cds.State in [DsEdit, DsInsert]) ) then Cds.Edit;

       if CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
       frmAguarde.Pos := 1;

       if (CmpForCli.Valida = VcOk) and (Modulo.StatusIsAtivo(CmpForCli.ForCliReg.Id)) then
       begin
          if ( CmeCadastro.Operacao = OpInserir ) and
             ( _OperacaoLanc = opldEfetivo ) and
             ( _IdForCliAdianto <> CmpForCli.ForCliReg.Id ) then
             begin
               _IdForCliAdianto := CmpForCli.ForCliReg.Id;
               if DtmDadosBancarios <> nil then
               begin
                 DtmCapCarMT.CdsAdtoPendente.Close;
                 DtmCapCarMT.CdsPrevPendente.Close;
                 ExecutaPrevAdianto;
               end;
             end;

          frmAguarde.Pos := 2;
          Cds.FieldByName('CODSUBCONTA').AsString := CmpForCli.ForCliReg.SubConta;
          CmbSubConta.LookupValue := CmpForCli.ForCliReg.SubConta;

          DtmDadosBancarios.SetaContaPreferencial(CmpForCli.ForCliReg.Id, Cds);
          frmAguarde.Pos := 3;

          if ( ParamIntegra.IntegraContab ) and
              ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
               (Cds.FieldByName('IDMODULO').AsInteger = 4)) then
          begin
             if (Trim(CmpForCli.ForCliReg.CAdiantamento) = '') and
                ( _OperacaoLanc = opldAdiantamento ) then
             begin
               MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil de Adiantamento','Erro',mtError,[mbOk],0);
               Repaint;
               bbtnCancelar.Click;
               exit;
             end;
             if ( ParamIntegra.RecPag = 'R' ) then
             begin
                if Trim(CmpForCli.ForCliReg.CContabil) = '' then
                begin
                  MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Cliente','Erro',mtError,[mbOk],0);
                  Repaint;
                  bbtnCancelar.Click;
                  exit;
                end;

                if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CReceita then
                   cbIntegra.Checked:=True;
             end
             else
             begin
                if Trim(CmpForCli.ForCliReg.CContabil) = '' then
                begin
                  MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Fornecedor','Erro',mtError,[mbOk],0);
                  Repaint;
                  bbtnCancelar.Click;
                  exit;
                end;
                if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CDespesa then
                   cbIntegra.Checked:=True;
             end;
          end;

          if DbeNoDocumento.Visible then
          begin
             Cds.FieldByName('COMPLDOCUMENTO').AsString := ParamIntegra.BuscaCodigoFiscalReduzido(CmpForCli.ForCliReg.Id);
             frmAguarde.Pos := 4;

             if (Trim(Cds.FieldByName('COMPLDOCUMENTO').AsString) = '') and
                ( ParamIntegra.AssociaComplTipoFat ) then
                begin
                   MsgDlg('Não foi cadastrada a Classificação Fiscal para este ' + CmpForCli.caption + ' ou o código reduzido da mesma não foi preenchido. Não é possível Inserir o documento.','Erro',mtError,[mbOk],0);
                  Repaint;
                   bbtnCancelar.Click;
                   exit;
                end;
          end;
          frmAguarde.Pos := 5;
       end
       else
       begin
          tbcDetalhe.TabIndex := 0;
          if CmpForCli.CanFocus then CmpForCli.SetFocus;
          Exit;
       end;

       if DbeNoDocumento.CanFocus then
         DbeNoDocumento.SetFocus
       else
         if dbenNumDoc.CanFocus then
           dbenNumDoc.SetFocus;
    end;
  Finally
    frmAguarde.Apaga;
  end;
end;




procedure TfrmLancDocCAPCAR.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
  
    if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
      MontaCentroDeCusto;

    if CdsDet.State In [DsEdit, DsInsert] then
    begin
       CdsDet.FieldByName('DESCRICAO').AsString := dblcTipoRD.Text;
       if not CdsTipoRD.FieldByName('PLACONTACREDITO').isnull then
          CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
       else
          CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil  ;

       _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asstrIng;
       CdsDet.FieldByName('HITCODHIST').AsString := CdsTipoRD.FieldByName('HITCODHIST').AsString;
    end;
  end;
end;




procedure TfrmLancDocCAPCAR.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  if MsResORc.RetornouValor then
  begin
    if not (CdsDet.State In [DsEdit, DsInsert]) then CdsDet.Edit;

    CdsDet.FieldByName('NUMRESERVA').AsInteger := StrToInt(MsResORc.ValoresChave[1]);
    CdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat := StrToFloat(MsResORc.ValoresChave[0]);

    ReResorc.Value := CdsDet.FieldByName('NUMRESERVA').AsInteger;
    SetaCentResponDesemb(CdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger, False);
  end;
end;




procedure TfrmLancDocCAPCAR.dblcCentroResponExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcCentroRespon.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString <> 'A') then
     begin
        MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
         Repaint;
        if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     end;

     _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
  end;
end;


procedure TfrmLancDocCAPCAR.SetaCentResponDesemb(iNumReserva:LongInt;bLimpa: boolean);
var
  sFiltroDesemb, sFiltroCRespon: String;
begin
  if (not bLimpa) and
     FazQuery(DtmBaseDados.Qry,'SELECT ' +
                               ' CP.CODCENTRORESPON, CP.CODTIPRECDES ' +
                               'FROM ' +
                               ' COMPCONTASORCAMEN CP, RESERVAORCAMEN RE ' +
                               'WHERE ' +
                               ' (RE.IDRESERVAORCAMEN = ' + IntToStr(iNumReserva) + ') and ' +
                               ' (RE.IDPLANOORCAMEN = CP.IDPLANOORCAMEN)     and ' +
                               ' (RE.IDCONTAORCAMEN = CP.IDCONTAORCAMEN)') then
  begin
    sFiltroDesemb  := '';
    sFiltroCRespon := '';

    while not DtmBaseDados.Qry.Eof Do
    begin

      if not DtmBaseDados.Qry.FieldByname('CODTIPRECDES').isNull then
         if sFiltroDesemb = '' then
            sFiltroDesemb  := ' CODTIPRECDES = ''' + trim( DtmBaseDados.Qry.FieldByname('CODTIPRECDES').AsString ) + ''''
         else
            sFiltroDesemb  := sFiltroDesemb + ' OR CODTIPRECDES = ''' + trim( DtmBaseDados.Qry.FieldByname('CODTIPRECDES').AsString ) + '''';

      if not DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').isNull then
         if sFiltroCRespon = '' then
            sFiltroCRespon := ' CODCENTRORESPON = ''' + trim( DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').AsString ) + ''''
         else
            sFiltroCRespon := sFiltroCRespon + ' OR CODCENTRORESPON = ''' + trim( DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').AsString ) + '''';

      DtmBaseDados.Qry.Next;
    end;

    if sFiltroDesemb <> '' then
    begin
      CdsTipoRD.Filter         := sFiltroDesemb;
      CdsTipoRD.Filtered       := True;
    end
    else
    begin
      CdsTipoRD.Filtered       := False;
      CdsTipoRD.Filter         := '';
    end;

    if sFiltroCRespon <> '' then
    begin
      CdsCentroRespon.Filter   := sFiltroCRespon;
      CdsCentroRespon.Filtered := True;
    end
    else
    begin
      CdsCentroRespon.Filtered       := False;
      CdsCentroRespon.Filter         := '';
    end;
  end
  else
  begin
    CdsTipoRD.Filtered       := False;
    CdsTipoRD.Filter         := '';
    CdsCentroRespon.Filtered := False;
    CdsCentroRespon.Filter   := '';
  end;
end;




procedure TfrmLancDocCAPCAR.DbeNoDocumentoExit(Sender: TObject);
var
  sNoDocum :String;
begin
  inherited;
  if (CmeCadastro.Operacao In [Opalterar,OpInserir]) and
     (ActiveControl.tag <> 9999) and
     (DbeNoDocumento.Visible) then
  begin

    sNodocum := Cds.FieldByName('NUMFATURA_1').AsString;
    while (Pos('.',sNodocum) <> 0) Do
          Delete(sNoDocum,Pos('.',sNodocum),1);

    if Trim(sNoDocum) <> '' then
    begin
       Cds.FieldByName('NODOCUMENTO').AsString := sNoDocum;
       if Cds.FieldByName('IDFORCLI').isNull then
       begin
          if CmpForCli.CanFocus then CmpForCli.SetFocus;
       end
       else
         if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    end
    else
      if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
  end;
end;




procedure TfrmLancDocCAPCAR.SetaEnglobaParcela;
var
  sNumDocumento, sAuxMasacara :String;
begin
  inherited;
  if (dblcTipoDoc.Text <> '') and
     (CmeCadastro.Operacao In [OpInserir, OpAlterar]) then
  begin
     cbEnglobParc.Enabled := (( _OperacaoLanc <> opldAdiantamento ) and
                              ((CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').AsString = 'A') OR
                               (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').IsNull)));
     cbEnglobParc.Checked := (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').AsString = 'S') Or
                             ((Cds.FieldByName('OPERACAO').AsString = '1') or (Cds.FieldByName('OPERACAO').AsString = '11'));
  end;

  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
     (CdsTipoDoc.FieldByName('FLGGERANUMDOC').AsString = 'S') and
     (dbenNumDoc.Value = 0.00) and
     (dblcTipoDoc.Text <> '') then
  begin
    if ParamIntegra.MascaraNoDocum <> '' then
    begin
       sNumDocumento := IntToStr(_oDocumento.GetSequenceDocumento);
       Cds.FieldByName('NODOCUMENTO').AsFloat := StrToFloat(sNumDocumento);
       sAuxMasacara := ParamIntegra.MascaraNoDocum;

       while Pos('9',sAuxMasacara) <> 0 Do
             sAuxMasacara[Pos('9',sAuxMasacara)] := '0';

       sNumDocumento := Copy(sAuxMasacara, 1, Length(sAuxMasacara) - Length(sNumDocumento)) + sNumDocumento;
       Cds.FieldByName('NUMFATURA_1').AsString := sNumDocumento;
       DbeNoDocumentoExit(Self);
    end
    else
    begin
       if (Trim(dblcTipoDoc.text) <> '') and (Cds.FieldByName('NODOCUMENTO').AsFloat = 0) then
          Cds.FieldByName('NODOCUMENTO').AsFloat := _oDocumento.GetSequenceDocumento;
    end;
  end;
end;




procedure TfrmLancDocCAPCAR.dblcTipoDocExit(Sender: TObject);
begin
  inherited;
  SetaEnglobaParcela;
  AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.MontaCentroDeCusto;
var ctrlCentroCusto: TCtrlCentroCusto;
begin

  ctrlCentroCusto := TCtrlCentroCusto.Create;
  ctrlCentroCusto.InitializeAS( Padroes );
  dblcTipoRD.LookupValue := dblcTipoRD.LookupValue;

  try

    if not cbIntegra.Checked then //se integra com a contabilidade
    begin
      if (not CdsTipoRD.isEmpty) and (trim(CdsTipoRD.FieldByName('PLACONTA').AsString) <> '') then
        cdsCentroCusto.Data := ctrlCentroCusto.ListaCentCustXContasxCC(sistema.IdEmpresa,
                               ParamIntegra.Plano, CdsTipoRD.FieldByName('PLACONTA').AsString,
                               ParamIntegra.PlanoCentroCusto);

      if (not CdsDet.IsEmpty) and (CdsCentroCusto.IsEmpty) and (not CdsDet.FieldByName('IDPROGRAMA').isNull) then
        cdsCentroCusto.Data := ctrlCentroCusto.ListaCcustoXTipoRdxCCxConta(Sistema.IdEmpresa,
                                             ParamIntegra.RecPag, Trim(dblcTipoRD.LookupValue),
                                             CdsDet.FieldByName('IDPROGRAMA').AsInteger,
                                             ParamIntegra.PlanoCentroCusto);

    end;

    //Ref. SOL 89575 - Nilton
    //if CdsCentroCusto.IsEmpty then
    //begin
      cdsCentroCusto.Data := ctrlCentroCusto.ListaCentroCusto(sistema.IdEmpresa, '', true,
                                                    1, '', ParamIntegra.PlanoCentroCusto);
    //end;

  finally
    ctrlCentroCusto.free;
  end;
end;



procedure TfrmLancDocCAPCAR.dbeDataEmiExit(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down = True then
  begin
     Cds.FieldByName('DATALANCTO').AsDateTime := strtodate(dbeDataEmi.text);
     dbeDataLanc.text := dbeDataEmi.text;
  end;
end;




procedure TfrmLancDocCAPCAR.BtnNumApgrClick(Sender: TObject);
begin
  inherited;
  if Cds.State in [DsEdit, DsInsert] then
     Cds.FieldByName('NUMAPGR').AsInteger := LeUltRegistro(nil,'SEQAPGR');
end;




procedure TfrmLancDocCAPCAR.AtualizaSaldo;
var
  rSaldoAtualizaDoc :Double;

  function CalcValAlteradores:Double;
  var
    Natureza : Integer;
  begin
    Result := 0;

    if not CdsAlteradores.IsEmpty then
    begin
      if CdsAlteradores.State In [DsEdit, DsInsert] then
      begin
        if ( CdsAlteradores.FieldByName('DEBCRE').AsString = CdsTipoDoc.FieldByName('DEBCRE').AsString ) then
         begin
          Natureza := 1;
        end else begin
          Natureza := -1;
        end;
        Result := Result + ( CdsAlteradores.FieldByName('VALOR').AsFloat * Natureza );
      end else begin

        while not CdsAlteradores.Eof Do begin
          if ( CdsAlteradores.FieldByName('DEBCRE').AsString = CdsTipoDoc.FieldByName('DEBCRE').AsString ) then
         begin
            Natureza := 1;
          end else begin
            Natureza := -1;
          end;
          Result := Result + ( CdsAlteradores.FieldByName('VALOR').AsFloat * Natureza );

          CdsAlteradores.Next;
        end;

        CdsAlteradores.First;
      end;
    end;
  end;
begin
  if (CmeCadastro.Operacao = OpInserir) then
  begin
    rSaldoAtualizaDoc := dbeValorCorrente.Value + CalcValAlteradores;
    BtnStatus.Caption    := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', rSaldoAtualizaDoc);
  end;
end;




procedure TfrmLancDocCAPCAR.dbeValorCorrenteExit(Sender: TObject);
begin
  inherited;
  AtualizaSaldo;
end;




procedure TfrmLancDocCAPCAR.CmbProgramaExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
     CdsDet.FieldByName('DESCPROGRAMA').AsString := CmbPrograma.Text;
  // início - andré tavares - pendência 17279 - 26/08/2004
  _Programa := CdsDet.FieldByName('IDPROGRAMA').AsStrIng;
  // fim - andré tavares - pendência 17279 - 26/08/2004

end;




procedure TfrmLancDocCAPCAR.CmbPlanoExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     _PlanoPrevDet := CdsDet.FieldByName('IDPLANOPREV').AsInteger;
     CdsDet.FieldByName('DESCPLANO').AsString := CmbPlano.Text;
  end;
end;




procedure TfrmLancDocCAPCAR.CmbPatroExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     CdsDet.FieldByName('NOMEPATRO').AsString := CmbPatro.Text;
     _PatroDet := CdsDet.FieldByName('IDPATRO').AsInteger;
  end;
end;




procedure TfrmLancDocCAPCAR.CmbCentCustoExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(CmbCentCusto.Text)<>'') and (ActiveControl.Tag <> 9999) and
        (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString <> 'A') then
     begin
        MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
         Repaint;
        if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
     end;

    _Ccusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asstrIng;
    CdsDet.FieldByName('NOMECENTROCUSTO').AsString := CmbCentCusto.Text;
  end;
end;




procedure TfrmLancDocCAPCAR.dblcTipoRDExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asstrIng;
    CdsDet.FieldByName('FLGOBRIGARESERVA').AsString := CdsTipoRD.FieldByName('FLGOBRIGARESERVA').AsString;
  end;
end;




procedure TfrmLancDocCAPCAR.CmbCentCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    if (Trim(CmbCentCusto.Text)<>'') and
       (ActiveControl.Tag <> 9999) and
       (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString <> 'A') then
    begin
       MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
      Repaint;
       if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
    end;

    _CCusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asstrIng;
    CdsDet.FieldByName('NOMECENTROCUSTO').AsString := CmbCentCusto.Text;

    if not CdsCentroCusto.FieldByName('IDPROGRAMA').isNull then
       CdsDet.FieldByName('IDPROGRAMA').AsFloat := CdsCentroCusto.FieldByName('IDPROGRAMA').AsFloat
    else
       CdsDet.FieldByName('IDPROGRAMA').Clear;
  end;
end;




procedure TfrmLancDocCAPCAR.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
        dbeValorMoedaDet.Enabled := True;
        dbeValorDet.Enabled := False;
     end
     else
     begin                                                 
        dbeValorMoedaDet.Enabled := False;
        dbeValorDet.Enabled := True;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') then
     begin
        MsgDlg('Atividade/Projeto precisa ser analítica!', 'Atenção', mtWarnIng, [mbOk], 0);
         Repaint;
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asstrIng;
  end;

end;




procedure TfrmLancDocCAPCAR.CmpForCliApertouBotao(Sender: TObject);
begin
  inherited;
  _IdForCliAdianto := Cds.FieldByName('IDFORCLI').AsInteger;
end;




procedure TfrmLancDocCAPCAR.CmbProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  // início - andré tavares - pendência 17279 - 26/08/2004
  _Programa := CdsDet.FieldByName('IDPROGRAMA').AsStrIng;
  // fim - andré tavares - pendência 17279 - 26/08/2004
  CdsDet.FieldByName('DESCPROGRAMA').AsString := CmbPrograma.Text;
end;




procedure TfrmLancDocCAPCAR.CmbPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  _PatroDet := CdsDet.FieldByName('IDPATRO').AsInteger;
  CdsDet.FieldByName('NOMEPATRO').AsString := CmbPatro.Text;
end;




procedure TfrmLancDocCAPCAR.CmbPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  _PlanoPrevDet := CdsDet.FieldByName('IDPLANOPREV').AsInteger;
  CdsDet.FieldByName('DESCPLANO').AsString := CmbPlano.Text;
end;




procedure TfrmLancDocCAPCAR.BtnBuscaContaCorClick(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao In [OpInserir, OpAlterar] then
  begin
     With DtmDadosBancarios Do
     begin
        SetaFiltroMs(Cds.FieldByName('IDFORCLI').AsFloat);
        if MsContaCor.Executar = MrOk then
        begin
          Cds.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
          Cds.FieldByName('CONTACORRENTE').AsString := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
          Cds.FieldByName('NUMBANCO').AsString := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
          Cds.FieldByName('NUMAGENCIA').AsString := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
          Cds.FieldByName('DESCTIPOCONTA').AsString := MsContaCor.ValoresChave[4]; //CONTABANCARIA.TIPOCONTA
        end;
     end;
  end;
end;


procedure TfrmLancDocCAPCAR.setaplanopatroglobal;
var
cdsLocal : TCMClientDataSet;

begin
   cdsLocal := TCMClientDataSet.Create(nil);
   cdsLocal.data := _lancDocCapCar.ListaPlanoPatroParamCap;

   if CdsDet.FieldByName('IDPLANOPREV').IsNull and
   //Marcus Oliveira P.25312 31/07/2007 Inicio
      (cdslocal.FieldByName('IDPLANOPREV').AsInteger > 0) then
   begin
      CdsDet.FieldByName('IDPLANOPREV').AsFloat := cdslocal.FieldByName('IDPLANOPREV').asfloat;
      CmbPlano.Lookupvalue := cdslocal.FieldByName('IDPLANOPREV').AsString;

      _PlanoPrevDet := cdslocal.FieldByName('IDPLANOPREV').AsInteger;
      CmbPlano.CloseUp(True);
      CmbPlanoExit(Self);
   end;

   if ( CdsDet.FieldByName('IDPATRO').IsNull ) and

      ( cdslocal.FieldByName('IDPATRO').AsInteger > 0 ) then
   begin
      _PatroDet := cdslocal.FieldByName('IDPATRO').AsInteger;

      CmbPatro.Lookupvalue :=cdslocal.FieldByName('IDPATRO').AsString;
      CdsDet.FieldByName('IDPATRO').AsFloat := cdslocal.FieldByName('IDPATRO').AsInteger;

   //Marcus Oliveira P.25312 31/07/2007 Fim

      CmbPatro.CloseUp(True);
      CmbPatroExit(Self);
   end;
end;




procedure TfrmLancDocCAPCAR.DclAtivProjetoExit(Sender: TObject);
begin
  inherited;
  if (Trim(DclAtivProjeto.Text) <> '') and
     (CdsAlteradores.State In [DsEdit,DsInsert]) then
     CdsAlteradores.FieldByName('NOME').AsString := DclAtivProjeto.Text;
end;




procedure TfrmLancDocCAPCAR.dblkAlteradorExit(Sender: TObject);
begin
  inherited;
  if (Trim(dblkAlterador.Text) <> '') and
     (CdsAlteradores.State In [DsEdit,DsInsert]) then
  begin
    CdsAlteradores.FieldByName('DESCRICAO').AsString := dblkAlterador.Text;
    CdsAlteradores.FieldByName('DEBCRE').AsString := CdsAlt.FieldByName('ACRESDECRES').AsString;
    CdsAlteradores.FieldByName('FLGINCIDEIRRF').AsString := CdsAlt.FieldByName('FLGINCIDEIRRF').AsString;
    //Linha Acima - Bruno Bastos - Pend. 14392 - 12/08/2003
  end;
end;




function TfrmLancDocCAPCAR.TestaAlterador:boolean;
begin
  Result := False;
  if Trim(dblkAlterador.Text) = '' then
   begin
     MsgDlg('O Alterador não foi Informado','Erro',mtError,[mbOk],0);
     Repaint;
   end
  else
     if DbrValor.Value = 0.00 then
        MsgDlg('O Valor do Alterador não foi Informado','Erro',mtError,[mbOk],0)
     else
        if DtLancto.Text = '' then
           MsgDlg('A Data de Lançamento do Alterador não foi Informada','Erro',mtError,[mbOk],0)
        else
           Result := True;

  if not Result then Abort;
end;




procedure TfrmLancDocCAPCAR.DbrValorExit(Sender: TObject);
begin
  inherited;
  if CdsAlteradores.State In [DsEdit,DsInsert] then
     CdsAlteradores.FieldByName('VLRLIQUIDO').AsFloat := CdsAlteradores.FieldByName('VALOR').AsFloat;
end;

procedure TfrmLancDocCAPCAR.CdsalteradoresAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not cbIntegra.Checked then
  begin
     CdsAlteradores.FieldByName('CONTABILIZA').AsString := 'S';
     CkbContabiliza.Enabled := True;
  end
  else
  begin
     CdsAlteradores.FieldByName('CONTABILIZA').AsString := 'N';
     CkbContabiliza.Enabled := cbIntegra.Enabled;
  end;
end;




procedure TfrmLancDocCAPCAR.cbEnglobParcClick(Sender: TObject);
begin
  inherited;
  BtnNumApgr.Enabled := not cbEnglobParc.checked;
  GpConta.Enabled := not cbEnglobParc.checked;

  if sbtnInserir.Down then EdtNumAp.text:='';
end;




procedure TfrmLancDocCAPCAR.SelecionaTipoDesembolso;
begin
  if (Trim(dblcCentroRespon.Text)<>'') and (ActiveControl.Tag <> 9999) and
     (CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString <> 'A') then
  begin
     MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
     if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     exit;
  end;

  _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').asstrIng;

  dblcTipoRD.Enabled := True;

  if ParamIntegra.RecPag = 'P' then
  begin
    SqlTipoRD.Sql.Clear;
    SqlTipoRD.Sql.Add(  'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                        'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                        'TIPORECEBDESEMB T, FORNXDESEMB F ' +
                        ' WHERE (T.ANASINT = ''A'') and ' +
                        '       (T.RECPAG        = '''+ParamIntegra.RecPag+''') and  ' +
                        '       (T.IDPESSOA      = '+InttoStr(Sistema.idempresa)+ ') and ' +
                        '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') and ' +
                        '       (F.RECPAG        = T.RECPAG) and  ' +
                        '       (F.IDEMPRESAPROP = T.IDPESSOA) and ' +
                        '       (T.ATIVO <> ''N'') and ' +

                        '       (F.CODTIPRECDES  = T.CODTIPRECDES) ');

    if not CdsCentroRespon.IsEmpty then
      SqlTipoRD.Sql.Add( ' and  ((T.CODTIPRECDES IN ' +
                         '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                         '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                         '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                         '            (RECPAG = T.RECPAG))) OR ' +
                         '             not EXISTS (SELECT * ' +
                         '                         FROM TRDXCRESPON ' +
                         '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                         '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

    SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
    SqlTipoRD.Open;

    if CdsTipoRD.IsEmpty then
    begin
        SqlTipoRD.Sql.Clear;
        SqlTipoRD.Sql.Add( 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                           'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                           'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
                           ' WHERE (T.ANASINT = ''A'') and ' +
                           '       (T.RECPAG           = '''+ParamIntegra.RecPag+''') and  ' +
                           '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') and ' +
                           '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) and ' +
                           '       (R.RECPAG           = T.RECPAG)   and ' +
                           '       (R.IDPESSOA         = T.IDPESSOA) and ' +
                           '       (T.ATIVO <> ''N'') and ' +

                           '       (R.CODTIPRECDES     = T.CODTIPRECDES) ');
        if not CdsCentroRespon.IsEmpty then
           SqlTipoRD.Sql.Add( '     and  ((T.CODTIPRECDES IN ' +
                              '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                              '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                              '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                              '            (RECPAG = T.RECPAG))) OR ' +
                              '             not EXISTS (SELECT * ' +
                              '                         FROM TRDXCRESPON ' +
                              '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                              '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

        SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
        SqlTipoRD.Open;

        if CdsTipoRD.IsEmpty then
        begin
          SqlTipoRD.Sql.Clear;
          SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST ' +
                           'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') and (RECPAG = ''' + ParamIntegra.RecPag +
                           ''') and (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                            ' and  (T.ATIVO <> ''N'')  ' );



          if not CdsCentroRespon.IsEmpty then
            SqlTipoRD.Sql.Add('  and ((T.CODTIPRECDES IN ' +
                              '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                              '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                              '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                              '            (RECPAG = T.RECPAG))) OR ' +
                              '             not EXISTS (SELECT * ' +
                              '                         FROM TRDXCRESPON ' +
                              '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                              '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

          SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
          SqlTipoRD.Open;
        end;
      end
      else
      begin
         if CdsDet.State in [ DsEdit, DsInsert ] then
         begin
           dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').AsString;
           dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
         end;
      end;
  end
  else { Contas a Receber }
  begin
    SqlTipoRD.Sql.Clear;
    SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                      'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                      'TIPORECEBDESEMB T, CLIXRECEB F ' +
                      ' WHERE (T.ANASINT = ''A'') and ' +
                      '       (T.RECPAG        = '''+ParamIntegra.RecPag+''') and  ' +
                      '       (T.IDPESSOA      = '+InttoStr(Sistema.idempresa)+ ') and ' +
                      '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') and ' +
                      '       (F.RECPAG        = T.RECPAG) and  ' +
                      '       (F.IDEMPRESA     = T.IDPESSOA) and ' +
                      '       (T.ATIVO <> ''N'') and ' +

                      '       (F.CODTIPRECDES  = T.CODTIPRECDES)  ');

    if not CdsCentroRespon.IsEmpty then
      SqlTipoRD.Sql.Add('  and     ((T.CODTIPRECDES IN ' +
                        '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                        '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                        '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                        '            (RECPAG = T.RECPAG))) OR ' +
                        '             not EXISTS (SELECT * ' +
                        '                         FROM TRDXCRESPON ' +
                        '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                        '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');


    SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
    SqlTipoRD.Open;

    if CdsTipoRD.IsEmpty then
    begin
        SqlTipoRD.Sql.Clear;

        if Sistema.TipoEmpresa = 'P' then
        begin
           SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                             'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                             ' WHERE (T.ANASINT = ''A'') and ' +
                             '       (T.RECPAG           = '''+ParamIntegra.RecPag+''') and  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') and ' +
                             '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) and ' +
                             '       (TR.RECPAG           = T.RECPAG)   and ' +
                             '       (TR.IDPESSOA         = T.IDPESSOA) and ' +
                             '       (T.ATIVO <> ''N'') and ' +

                             '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ');

           if not CdsCentroRespon.IsEmpty then
             SqlTipoRD.Sql.Add('   and  ((T.CODTIPRECDES IN ' +
                               '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                               '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                               '            (RECPAG = T.RECPAG))) OR ' +
                               '             not EXISTS (SELECT * ' +
                               '                         FROM TRDXCRESPON ' +
                               '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

           SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
           if CdsTipoRD.IsEmpty then
           begin
             SqlTipoRD.Sql.Clear;
             SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  ' +
                               'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') and (RECPAG = ''' + ParamIntegra.RecPag +
                               ''') and (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                               ' and  (T.ATIVO <> ''N'')  ' );


             if not CdsCentroRespon.IsEmpty then
               SqlTipoRD.Sql.Add('    and   ((T.CODTIPRECDES IN ' +
                                 '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                                 '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                                 '            (RECPAG = T.RECPAG))) OR ' +
                                 '             not EXISTS (SELECT * '+
                                 '                         FROM TRDXCRESPON ' +
                                 '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

              SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
              SqlTipoRD.Open;
           end;
        end
        else
         begin
           SqlTipoRD.Sql.Clear;
           SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                             'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                             ' WHERE (T.ANASINT = ''A'') and ' +
                             '       (T.RECPAG           = '''+ParamIntegra.RecPag+''') and  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') and ' +
                             '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) and ' +
                             '       (TR.RECPAG           = T.RECPAG)   and ' +
                             '       (T.ATIVO <> ''N'') and ' +

                             '       (TR.IDPESSOA         = T.IDPESSOA) and ' +
                             '       (TR.CODTIPRECDES     = T.CODTIPRECDES)  ');

           if not CdsCentroRespon.IsEmpty then
             SqlTipoRD.Sql.Add('   and  ((T.CODTIPRECDES IN ' +
                               '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                               '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                               '            (RECPAG = T.RECPAG))) OR ' +
                               '             not EXISTS (SELECT * ' +
                               '                         FROM TRDXCRESPON ' +
                               '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

           SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
           SqlTipoRD.Open;

           if CdsTipoRD.IsEmpty then
           begin
            SqlTipoRD.Sql.Clear;
            SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST ' +
                              'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') and (RECPAG = ''' + ParamIntegra.RecPag +
                              ''') and (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                              ' and  (T.ATIVO <> ''N'')  ' );


            if not CdsCentroRespon.IsEmpty then
               SqlTipoRD.Sql.Add('    and ((T.CODTIPRECDES IN ' +
                                 '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                                 '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                                 '            (RECPAG = T.RECPAG))) OR ' +
                                 '             not EXISTS (SELECT * ' +
                                 '                         FROM TRDXCRESPON ' +
                                 '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');
            SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
            SqlTipoRD.Open;
           end;
         end;
      end
      else
      begin
         if CdsDet.State in [ DsEdit, DsInsert ] then
         begin
           dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').AsString;
           dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
         end;
      end;
  end;
end;


procedure TfrmLancDocCAPCAR.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
end;




procedure TfrmLancDocCAPCAR.SelDocs(iCodDocumento: Integer);
   procedure ExibeStatusDoc;
   begin
     try
       BtnStatus.ImageIndex := -1;

       if Cds.FieldByName('ESTORNO').AsInteger <> 0 then
       begin
           BtnStatus.Caption    := 'Doc. Estornado\Cancelado';
           BtnStatus.ImageIndex := 2;
       end
       else
       begin
          if ( _OperacaoLanc <> opldAdiantamento ) and
             ( Trim(Cds.FieldByName('STATUS').AsString) = '2' ) then
          begin
            if Cds.FieldByName('NUMFATURA').AsInteger <> 0 then
            begin
              BtnStatus.Caption    := 'Documento Englobado\Parcelado ';
              BtnStatus.ImageIndex := 3
            end
            else
            begin
              BtnStatus.Caption    := 'Documento Baixado ';
              BtnStatus.ImageIndex := 1
            end;
          end
          else
          begin
            _oDocumento.Saldo.CalculaSaldo(Cds.FieldByName('CODDOCUMENTO').AsInteger);

            if ( _OperacaoLanc = opldAdiantamento ) then
            begin
              if ( Cds.FieldByName('OPERACAO').AsString = '14' ) then
                BtnStatus.Caption  := 'Adiantamento Em Aberto '
              else
                if ( Cds.FieldByName('OPERACAO').AsString = '15' ) then
                begin
                   if IsFloatZero(_oDocumento.Saldo.Valor) then
                      BtnStatus.Caption  := 'Adiantamento Regularizado '
                   else
                      if FloatsEqual(Abs(_oDocumento.Saldo.Valor), Cds.FieldByName('VALOR').AsFloat) then
                          BtnStatus.Caption  := 'Adiantamento Baixado '
                      else
                          BtnStatus.Caption  := 'Adiantamento Parcialmente Regularizado ' + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', Abs( _oDocumento.Saldo.Valor ) );
                end
                else
                  BtnStatus.Caption  := 'Adiantamento Em Aberto '
            end
            else
              if IsFloatZero(_oDocumento.Saldo.Valor) then
                BtnStatus.Caption    := 'Documento Em Aberto '
              else
                BtnStatus.Caption    := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', _oDocumento.Saldo.Valor );

            BtnStatus.ImageIndex := 0
          end;
       end;
     except
         MsgDlg('Erro ao associar imagens','Erro',mtError,[mbOk],0);
     end;
   end;
begin
   SqlDoc.Prepare;
   SqlDoc.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SqlDoc.Open;
   sDataLanc := Cds.fieldByName('DATALANCTO').asString; // André Tavares - pendência 18937 - 25/04/2005

   // andre tavares pendencia 19942 - 26/08/2005
   if RdFicha.checked then
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
   else
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

   SQLDet.Prepare;
   SQLDet.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SQLDet.Open;

//inicio - André Tavares - pendência 16975 - 28/06/2004 - esconde o campo de compromisso orcamentario se estiver co contas a receber
   dbgrdDet.Fields[6].Visible := sistema.IdModulo <> 4;
//fim - André Tavares - pendência 16975 - 28/06/2004


   SQLLancamento.Prepare;
   SQLLancamento.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SQLLancamento.Open;

   SqlContab.Prepare;
   SqlContab.ParambyName('PLNCODIGO').AsInteger := CdsLancamento.FieldByName('PLNCODIGO').AsInteger;
   SqlContab.ParamByName('PLNANTECIPA').AsFloat := CdsLancamento.FieldByName('PLNANTECIPA').AsInteger;
   SqlContab.Open;

   SQLAlteradores.Prepare;
   SQLAlteradores.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SQLAlteradores.Open;

   // 14/01/04 Alex 15862 Múltiplas contas de baixa
   sqlCCBaixasXDocum.Prepare;
   sqlCCBaixasXDocum.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
   sqlCCBaixasXDocum.Open;
   if CdsCCBaixasXDocum.IsEmpty then begin
     if tbcDetalhe.Tabs.Count >= 7 then begin
       if tbcDetalhe.Tabs.Strings[6] = 'Contas Baixa' then
         // se excluir a página com o foco nela, ela fica perdida
         if pgctrlDetalhe.ActivePageIndex = 6 then begin
           pgctrlDetalhe.ActivePageIndex := 0;
           tbcDetalhe.TabIndex := 0;
         end;
         tbcDetalhe.Tabs.Delete(6);
     end;
   end else begin
     if tbcDetalhe.Tabs.Count >= 7 then begin
       if tbcDetalhe.Tabs.Strings[6] <> 'Contas Baixa' then begin
         tbcDetalhe.Tabs.Insert(6, 'Contas Baixa');
       end;
     end else begin
       tbcDetalhe.Tabs.Insert(6, 'Contas Baixa');
     end;
   end;
   // 14/01/04 Alex 15862 Múltiplas contas de baixa

   // início - andre tavares - pendência ???? - 07/05/2005
   cdsRAD.Close;
   sqlRad.Prepare;
   sqlRad.paramByName('IDPROCESSO').asInteger := cds.FieldByName('IDPROCESSO').asInteger;
   sqlRad.Open;
   // fim - andre tavares - pendência ???? - 07/05/2005
   ExibeStatusDoc;
end;




procedure TfrmLancDocCAPCAR.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DbeNoDocumento.Visible then
     Cds.FieldByName('NUMFATURA_1').EditMask :=  ParamIntegra.MascaraNoDocum + ';1; ';

  //amf 19.04.2007 22592 - dispara apenas para o cds relacionado ao SqlDoc.
  if (DataSet.tag = 1) then
  begin
     //amf 25.05.2007 - acerto da máscara de entrada.
     TFloatField(DataSet.FieldByName('QTDECOTAS')).DisplayFormat := '#,##0.000000';
     TFloatField(DataSet.FieldByName('QTDECOTAS')).EditFormat    := '###0.000000';
  end;

end;




procedure TfrmLancDocCAPCAR.CdsDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(CdsDet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';

  if ParamIntegra.RecPag = 'R' then
  begin
     CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Recebimento';
     CdsDet.FieldByName('NOME').DisplayLabel      := 'Projeto';
  end
  else
  begin
     CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Desembolso';
     CdsDet.FieldByName('NOME').DisplayLabel      := 'Atividade';
  end;

end;




procedure TfrmLancDocCAPCAR.CdsUnidNegocAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('UNECODIGO').EditMask := ParamIntegra.MascaraUnidNegoc + ';0;_';
end;




procedure TfrmLancDocCAPCAR.CdsTipoRDAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
     DataSet.Fields[0].EditMask := ParamIntegra.MascaraDesemb + ';0;_'
  else
     DataSet.Fields[0].EditMask := ParamIntegra.MascaraReceb + ';0;_';
end;




procedure TfrmLancDocCAPCAR.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName('VALOR').AsFloat := _ValorEdit;
  CdsDet.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
  CdsDet.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
end;

procedure TfrmLancDocCAPCAR.CdsLancamentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;




procedure TfrmLancDocCAPCAR.CdsContabAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
end;




procedure TfrmLancDocCAPCAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(_cdsAux); // tavares - pendência 17279
//início - André Tavares - pendência 15367 - 20/05/2004
  FreeAndNil(CtrlCentRespon);
//fim - André Tavares - pendência 15367 - 20/05/2004

  FreeAndNil(CtrlIntBanco);

  FreeAndNil(_LancDocCapCar);
  FreeAndNil(_oPeriodo);
  FreeAndNil(_oDocumento);

  // 23/01/04 Alex 14451 - Nova Segregação
  FreeAndNil(CtrlParamCap); // Bruno esqueceu
  FreeAndNil(CtrlSegregacao);
  // fim 23/01/04 Alex 14451 - Nova Segregação

  // 01/04/2004 Marchetti Pendencia 15733 e 15734
  FreeAndNil(CtrlPlanPrevContabPatro);

  //andre tavares
  FreeAndNil(CtrlParamGlobal);

  // Marcio Motta - 17317 - 20/04/2005
  FreeAndNil(CtrlModeloHistorico);

  FreeAndNil(CtrlTipoAlterador);

  //amf 01.03.2007 24450
  FreeAndNil(CtrlPortadorConta);
  FreeAndNil(CtrlPortadorForma);

  //amf 12.04.2007
  FreeAndNil(ctrlTipoRecebDesemb);

  //amf 31.05.2007
  FreeAndNil(CtrlPessoaForne);
  FreeAndNil(CtrlFormaRecPag);

  inherited;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  // 22/01/04 alex 14451 - chamar as restrições da segregação virtual
  // as mensagens já são dadas no tratamento
  Accept := VerificaPreenchimentoSegregaMestre;
  if not Accept then Exit;

  (* Gustavo 03/04/2003 - Inicio *)
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
  ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
  (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
  cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
  GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
  DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
  opInserir, _OperacaoLanc, ParamIntegra.PartidaDobrada, dbeDataLanc.Date, _oDocumento.DataDisponibilidade,
  (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
  CdsContab.FieldByName('IDSEGREGACRITER').AsInteger);
  (* Gustavo 03/04/2003 - Fim *)

  if Accept then
  begin
    if not DoEnglobarParcelar then
      _LancDocCapCar.ImprimeEspelhoDoc( _LancDocCapCar.CodDocumento, Modulo.IdReports, Modulo.NomeReport, _OperacaoLanc );

    //Iferreira 22/02/2008 - 27432
    EmptyDataSet(Cds);
  end
  else
  begin
    //DAVID - Retenção de Imposto
    if trim( _LancDocCapCar.MessageInfo ) <> '' then
      MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0)
  end;
end;




class procedure TfrmLancDocCAPCAR.AbrirForm(
  OperacaoLanc: TOperacaoLancDocCapCar);
begin
  if ExisteForm(FrmLancDocCapCar) then
     MsgDlg('A tela de ' + FrmLancDocCapCar.Caption + ' está aberta, para acessar outra opção é obrigatório sair da operação atual.', 'Atenção', mtInformation, [ MbOk ], 0)
  else
  begin
     _OperacaoLanc := OperacaoLanc;
     uFormManager.AbrirForm(FrmLancDocCapCar, TFrmLancDocCapCar, false);
  end;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // 22/01/04 alex 14451 - chamar as restrições da segregação virtual
  // as mensagens já são dadas no tratamento
  Accept := VerificaPreenchimentoSegregaMestre;
  if not Accept then Exit;

    // Rodolpho da Silva - 21/06/2006
  if CtrlTipoAlterador.ExisteLancIRRF(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
  begin
     MsgDlg('Este documento não pode ser alterado ou excluído, pois há um documento de imposto do INSS lançado relacionado a este.','Aviso',mtWarning,[mbOk],0);
     Accept := False;
     Exit;
  end;

  (* Gustavo 03/04/2003 - Inicio *)
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
  ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
  (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
  cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
  GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
  DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
  opAlterar, _OperacaoLanc, ParamIntegra.PartidaDobrada, dbeDataLanc.Date, _oDocumento.DataDisponibilidade,
  (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
  CdsContab.FieldByName('IDSEGREGACRITER').AsInteger);
  (* Gustavo 03/04/2003 - Fim *)

  if ( not (Cds.State in [DsEdit, DsInsert]) ) then Cds.Edit;


  if Accept then
  begin
    if not DoEnglobarParcelar then
      _LancDocCapCar.ImprimeEspelhoDoc( _LancDocCapCar.CodDocumento, Modulo.IdReports, Modulo.NomeReport, _OperacaoLanc );

    //DAVID - Retenção de INSS
    CmeCadastro.Cancel( Self );
    SelDocs(_CodLancCAPCAR);
    _CodLancContab := Cds.FieldByName('PLNCODIGO').AsInteger;
    _Modulo := Cds.FieldByName('IDMODULO').AsInteger;
    _ContaCliFor := Cds.FieldByName('PLACONTA').AsString;
    _CCustoCliFor := Cds.FieldByName('CODCENTROCUSTO').AsString;
    cbLancaBaixa.Checked := ((Cds.FieldByName('OPERACAO').AsString = '10') or (Cds.FieldByName('OPERACAO').AsString = '15'));
    cbEnglobParc.Checked := ((Cds.FieldByName('OPERACAO').AsString = '1') or (Cds.FieldByName('OPERACAO').AsString = '11'));
    cbIntegra.Checked := (Cds.FieldByName('PLNCODIGO').AsInteger = 0);
    SetaEnglobaParcela;
    AbrindoTela  := False; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
    sCodCentResp := CdsDet.FieldByName('CODCENTRORESPON').AsString;

    //Marcus Oliveira 23425
    ControlesReadyOnly(False);

    //Iferreira 22/02/2008 - 27432
    EmptyDataSet(Cds);
  end
  else
    //DAVID - Retenção de Imposto
    if trim( _LancDocCapCar.MessageInfo ) <> '' then
      MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0);

   //Marcus Oliveira 23425
   ControlesReadyOnly(False);
end;




procedure TfrmLancDocCAPCAR.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  (* Gustavo 03/04/2003 - Inicio *)
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
  ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
  (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
  cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
  GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
  DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
  opApagar, _OperacaoLanc, ParamIntegra.PartidaDobrada, 0, 0,
  (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
  (* Gustavo 03/04/2003 - Fim *)
  // Alex 16220 27/04/04 - Para exclusão do documento com lança e baixa simultânea é necessário o número do lote
  -1, CdsLancamento.FieldByName('NUMLOTE').AsInteger);

  if not Accept then MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0);
     EmptyDataSet(CdsDet);
     EmptyDataSet(CdsLancamento);
     EmptyDataSet(CdsContab);
     EmptyDataSet(CdsAlteradores);
     EmptyDataSet(CdsCCBaixasXDocum);
end;




procedure TfrmLancDocCAPCAR.CdsAlteradoresAfterPost(DataSet: TDataSet);
begin
  inherited;
  AtualizaSaldo;
end;

function TfrmLancDocCAPCAR.DoEnglobarParcelar: Boolean;
var
  DadosParcela: TParcelaAutomatica;
begin
    if ( _OperacaoLanc in [ opldEfetivo, opldContratoPrevisao ] ) and
        (cbEnglobParc.Checked) then
    begin
      Result := True;

      if (Application.MessageBox('Deseja Parcelar\Englobar este documento agora ?',
                              'Atenção',
                              Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
      begin
         DadosParcela.CodDocumento := Trunc(_LancDocCapCar.CodDocumento);
         DadosParcela.RazaoSocial := CmpForCli.Text;
         DadosParcela.DataEmissao := dbeDataEmi.Date;
         DadosParcela.DataLancto := dbeDataLanc.Date;
         DadosParcela.FormaDePagamento := StrToIntDef(DblCodForma.LookupValue,0);
         DadosParcela.PortadorForma := StrToIntDef(dblcPortadorForma.LookupValue,0);
         DadosParcela.TipoDeDocumento := StrToIntDef(dblcTipoDoc.LookupValue,0);
         DadosParcela.IdForCli := CmpForCli.ForCliReg.Id;

         if _OperacaoLanc = opldEfetivo then
            TFrmAgrupaParcelaMT.AbrirForm( opfDocumento, DadosParcela )
         else
            TFrmAgrupaParcelaMT.AbrirForm( opfContratoPrev, DadosParcela );
      end;
    end
    else
      Result := false;
end;




procedure TfrmLancDocCAPCAR.CdsDetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CalculaValorEdit;
end;




procedure TfrmLancDocCAPCAR.CalculaValorEdit;
var
  rValorDet: Double;
begin
  inherited;
  CdsDet.DisableControls;
  Try
    rValorDet := 0;

    CdsDet.First;
    while not CdsDet.Eof Do
    begin
       rValorDet := rValorDet + CdsDet.FieldByName('VALOR').AsFloat;
       CdsDet.Next;
    end;

    _ValorEdit := dbeValorCorrente.Value - rValorDet;
  finally
    CdsDet.EnableControls;
  end;
end;




function TfrmLancDocCAPCAR.ValidaOperacao: Boolean;
begin
  Result := True;

  if ( not CdsLancamento.IsEmpty ) and
     ( tbcDetalhe.TabIndex = 2 ) and
     ( Cds.FieldByName('OPERACAO').AsString <> CdsLancamento.FieldByName('OPERACAO').AsString) then
  begin
     MsgDlg('Esta Contabilização não se refere ao lançamento do documento. Verifique na pasta "Lançamentos".', 'Atenção', mtInformation, [MbOk], 0);
     Result := False;
  end;

  if Result and
     ( CdsAtual <> nil ) and
     ( CdsAtual.State in [DsEdit, DsInsert] ) then Result := False;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  TotalRateioOM, TotalRateio, rTotalContab, rValorCliFor, rValorCheckForCli: Real;
  sNomeConta, sObriga, sNome, sSubConta: String;
  bExiste,
  bExisteRetOutros, bExisteContab : Boolean;
  dDataDisp: TDateTime;

  VlOutros, VlINSSDoc : extended;

  //amf 02.03.2007 24450
  cdsLocal: TClientDataSet;

  //amf 16.04.2007 22592
  iExigeCota: integer;
  cdsContaBancoForn: TClientDataSet;
  cdsFormaRecPag: TClientDataSet;

begin  //Rodolpho - Marcus 17/01/2007 P. 24201
  if ((tbcDetalhe.TabIndex = 1) and (CdsDet.State = dsInsert)) then
  begin
     bbtnOkDet.Click;
     bbtnVoltarDet.Click;

  end;

  inherited;    //Aqui ele pega o 2º virtual nessa procedure
  Accept := False;

  bExisteContab := false;

  _oDocumento.CodDocumento := cds.FieldByName('CodDocumento').asFloat; // Andre tavares - pendência 18178 - 02/12/2004
  (* Gustavo 03/04/2003 - Inicio *)
  _oDocumento.DataDisponibilidade := 0;
  (* Gustavo 03/04/2003 - Fim *)

  if ( CmeCadastro.Operacao in [ OpInserir, OpAlterar ] ) then
  begin
     (* Gustavo 03/04/2003 - Inicio - Solicita data para disponibilidade financeira*)
     if _OperacaoLanc = opldEfetivo then
        _oDocumento.DataDisponibilidade := Cds.FieldByName('DATADISPONIB').AsDateTime;
     (* Gustavo 03/04/2003 - Fim *)

     if (Cds.FieldByName('DATADISPONIB').AsDateTime = 0)
        and (ParamIntegra.RecPag = 'P') then //andre tavares - pendência 22788 - 11/07/2006
        _oDocumento.DataDisponibilidade := Cds.FieldByName('DATAPROGRAMADA').AsDateTime;

     if CdsDet.IsEmpty then
      begin
       MsgDlg( 'Informe o rateio para o documento', 'Aviso', mtWarning, [ mbOk ], 0 );
       Repaint;
       Exit;
     end;

     if ( not (Cds.State in [DsEdit, DsInsert]) ) then Cds.Edit;

     if ( Cds.FieldByName('NODOCUMENTO').AsFloat < 1 ) then
      begin
       MsgDlg('O Número do documento está inválido', 'Erro', mtError, [ mbOk ], 0 );
       Exit;
     end;

     if ParamIntegra.Integracontab then
     begin
       if ( ParamIntegra.IntegraContab ) and
          ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
           (Cds.FieldByName('IDMODULO').AsInteger = 4)) then

         bExisteContab := _LancDocCapCar.DeterminaContabilizacao((not cbIntegra.Checked),
                                                                 placontas, TClientDataSet(cds),
                                                                 TClientDataSet(cdsCCBaixasXDocum),
                                                                 TClientDataSet(cdsContab),
                                                                 TClientDataSet(cdsDet).data,
                                                                 sistema.idEmpresa, ParamIntegra.plano, cbLancaBaixa.Checked,
                                                                 _OperacaoLanc, dblcTipoDoc.Text,
                                                                 paramintegra.Recpag);
         if not bExisteContab then
         begin
           accept := false;
           MsgDlg( _LancDocCapCar.MessageInfo, 'Erro Contabilização',mtError,[mbOk],0);
           exit;
         end;
         if (placontas.sPlacontaPass = '') and (cdsCCBaixasXDocum.IsEmpty) and (cbIntegra.Checked) then
         begin
           accept := false;
           MsgDlg( 'A Conta de Baixa do Documento não foi parametrizada!'+#13+
                   'Mesmo que o Documento não seja Contabilizado esta Conta é Obrigatória, pois será utilizada na Baixa do Mesmo.' , 'Erro Contabilização',mtError,[mbOk],0);
           exit;
         end;

         cds.FieldByName('PLANO').asInteger           := placontas.iPlano;
         cds.FieldByName('PLACONTA').asString         := placontas.sPlacontaPass;
         Cds.FieldByName('CODCENTROCUSTO').AsString   := placontas.scodCentroCusto;
         cds.FieldByName('IDSEGREGACRITER').asInteger := placontas.iIdSegregaCriter;
     end;
  end;

  if not verificaCodBarra then  exit;
  // fim andre tavares pendencia 19942 - 26/08/2005 - valida também o códogo de barras da arrecadação

  if (Trim(dblcPortadorForma.Text) = '') then
  begin
     if (cbLancaBaixa.Checked) then
     begin
        MsgDlg('Obrigatório Indicar '+ lblPortadorForma.Caption ,'Erro',mtError,[mbOk],0);
        if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
        exit;
     end;
  end
  else
    if ( ParamIntegra.RecPag = 'P' ) and
       (not CdsPortForma.FieldByName('CODARQUIVOREMESSA').isNull) and
       (not CdsPortForma.FieldByName('CODFORMAPAGTO').isNull) and
       CtrlIntBanco.ObrigaDadosBancarios(CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsInteger,
                                  CdsPortForma.FieldByName('CODFORMAPAGTO').AsInteger) and
       ((DbEdtBanco.Text = '') or (DbEdtAgencia.Text = '') or (DbEdtConta.Text = '')) then
    begin
        MsgDlg('Esta forma de pagamento obriga a Indicação da conta bancária', 'Aviso', mtInformation, [mbOk], 0);
        Exit;
    end;

  if (CmpForCli.Valida <> VcOk) then  exit;

  if Cds.FieldByName('NODOCUMENTO').IsNull then
  begin
    MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
    if dbenNumDoc.CanFocus then
       dbenNumDoc.SetFocus
    else
       if DbeNoDocumento.CanFocus then
         DbeNoDocumento.SetFocus;
    exit;
  end;

  if Modulo.ObrigaFormaPagto and (DblCodForma.Text = '') then
  begin
    MsgDlg('Obrigatório Indicar ' + LblFormaPag.Caption + ' na ''Pasta'' Geral','Erro',mtError,[mbOk],0);
    if DblCodForma.CanFocus then DblCodForma.SetFocus;
    exit;
  end;

  if Trim(dbeDataEmi.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblEmissao.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    exit;
  end;

  if Trim(dbeDataLanc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblData.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
    exit;
  end;

  if Trim(dbeDataVenc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblVencimento.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if Trim(dbeDataProgr.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblProgramada.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;

  if StrToDate(dbeDataVenc.Text) < StrToDate(dbeDataEmi.Text) then
  begin
    MsgDlg('A ' + lblVencimento.Caption + ' não pode ser menor que ' + lblEmissao.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if StrToDate(dbeDataProgr.Text) < StrToDate(dbeDataLanc.Text)  then
  begin
    MsgDlg('A ' + lblProgramada.Caption + ' não pode ser menor que a ' + lblData.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  if ( ParamIntegra.IntegraContab ) and
     (cbIntegra.Checked = False)       and
     ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
     (Cds.FieldByName('IDMODULO').AsInteger = 4)) then
  begin
     if (CmeCadastro.Operacao = OpAlterar) and
        (Cds.FieldByName('DATALANCTO').OldValue <> null) and
        ( Cds.FieldByName('DATALANCTO').Value <> Cds.FieldByName('DATALANCTO').OldValue  ) then
     begin
       _oPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr( Cds.FieldByName('DATALANCTO').OldValue ));
       if _oPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, _oPeriodo.Periodo, _oPeriodo.Exercicio, False) then
       begin
          MsgDlg(_oPeriodo.MessageInfo, Caption, mtWarning, [ MbOk ], 0);
          if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
          exit;
       end;
     end;

     _oPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, Cds.FieldByName('DATALANCTO').AsString);
     if _oPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, _oPeriodo.Periodo, _oPeriodo.Exercicio, False) then
     begin
        MsgDlg(_oPeriodo.MessageInfo, Caption, mtWarning, [ MbOk ], 0);
        if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
        exit;
     end;
  end;

  if (dbeValorMoeda.Value = 0) and (Cds.FieldByName('MOECODIGO').AsInteger <> 0) then
     begin
       MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
       if dbeValorMoeda.CanFocus then dbeValorMoeda.SetFocus;
       exit;
     end;

  if dbeValorCorrente.Value = 0 then
     begin
       if (MsgDlg('Confirma o lançamento do documento com valor ''0''(Zero)?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) then
       begin
        if dbeValorCorrente.CanFocus then dbeValorCorrente.SetFocus;
        exit;
       end;
     end;

  if Trim(dblcTipoDoc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk],0);
       if dblcTipoDoc.CanFocus then dblcTipoDoc.SetFocus;
       exit;
     end;

  if (cbLancaBaixa.Checked) then
  begin
     if Trim(dblcPortadorForma.text) = '' then
     begin

       Cds.FieldByName('CODPORTFORMA').Value := -1;

       if ( ParamIntegra.RecPag = 'R' ) then
          MsgDlg('Obrigatório preencher a Cobrança','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Obrigatório preencher a Forma de Pagamento','Erro',mtError,[mbOk],0);
       if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
       exit;
     end;

     if Trim(dbenChBordero.text) = '' then
     begin
       if ( ParamIntegra.RecPag = 'R' ) then
          MsgDlg('Obrigatório preencher o Número do Lote de Recebimento','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Obrigatório preencher o Número do Cheque/Borderô','Erro',mtError,[mbOk],0);
       if dbenChBordero.CanFocus then dbenChBordero.SetFocus;
       exit;
     end;

     if ( ParamIntegra.RecPag = 'R' ) then
        Cds.FieldByName('DATACFLOAT').AsDateTime := Cds.FieldByName('DATALANCTO').AsDateTime  +
                                                    CdsPortForma.FieldByName('DMAIS').AsInteger
     else
        Cds.FieldByName('DATACFLOAT').AsDateTime := Cds.FieldByName('DATALANCTO').AsDateTime  -
                                                    CdsPortForma.FieldByName('DMAIS').AsInteger;

     if ( ParamIntegra.IntegraContab ) and (_OperacaoLanc <> opldAdiantamento) then
     begin
        _ContaCliFor := CdsPortForma.FieldByName('PLACONTA').AsString;
        _CCustoCliFor := CdsPortForma.FieldByName('CODCENTROCUSTO').AsString;
     end;
  end;

  TotalRateioOM:=0;
  TotalRateio  := 0;
  CdsDet.First;

  iExigeCota := 0;
  while (not CdsDet.EOF) do
  begin

     TotalRateio   := TotalRateio + CdsDet.FieldByName('VALOR').AsFloat;
     TotalRateioOM := TotalRateioOM + CdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;

     {amf 01.03.2007 24450 - trava o lançamento se o plano previdenciário selecionado não estiver na lista
                             de planos previdenciários associados a contacorrente ligada ao portador-forma.}
     if (dblcPortadorForma.Text <> '') then
     begin
          if (cds.State in [dsInsert, dsEdit]) then
          begin
             try
               cdsLocal := TClientDataSet.Create(nil);
               cdsLocal.Data := CtrlPortadorForma.ListPortadorforma('',
                                                                    cds.FieldByName('CODPORTFORMA').AsInteger,
                                                                    Sistema.IdEmpresa,
                                                                    );

               if cdsAux.fieldByName('FLGOBRIGAMESMOPP').asString <> 'S' then //andré tavares - pendência 26434
                 if (CtrlPortadorConta.PlanoPrevDifereDaLista(cdsLocal.FieldByName('CODPORTADOR').AsInteger,
                                                              cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
                 begin
                      MsgDlg('Plano Previdenciário ' + cmbPlano.DisplayValue + ' não encontrado na lista de planos'#13#10'associados a contacorrente para o portador-forma selecionado.'#13#10 + dblcPortadorForma.DisplayValue ,'Erro',mtError,[mbOk],0);
                      Accept := False;
                      exit;
                 end;
                 
             finally
               FreeAndNil(cdsLocal);
             end;
          end;
     end;


     //amf 16.04.2007 22592 - verifica se tipo de desembolso obriga cotas.
     if (ctrlTipoRecebDesemb.TipoDesembObrigaCota(Sistema.IdEmpresa,
                                                  ParamIntegra.RecPag,
                                                  cdsDet.FieldByName('CODTIPRECDES').AsString) ) then
        inc(iExigeCota);


     //amf 19.04.2007 22592
     if (iExigeCota > 1) then
     begin
        MsgDlg('Já existe rateio cujo desembolso obriga quantidade de cotas.'#13#10+
               'Tipo de Desembolso: ' + dblcTipoRD.DisplayValue ,'Erro',mtWarning,[mbOk],0);
        Accept := False;
        exit;
     end;

     CdsDet.Next;
  end;

  if not FloatsEqual(dbeValorCorrente.Value, TotalRateio) then
     begin
       MsgDlg('Total do Rateio não bate com o Valor do Lançamento','Erro',mtError,[mbOk],0);
       _ValorEdit := dbeValorCorrente.Value - TotalRateio;
       exit;
     end;

  if (not IsFloatZero(dbeValorMoeda.Value)) and
     (not FloatsEqual(dbeValorMoeda.Value, TotalRateioOM)) then
     begin
       MsgDlg('Total do Rateio em outra moeda não bate com o Valor do Lançamento em outra moeda','Erro',mtError,[mbOk],0);
       exit;
     end;

  _DataLancto := Cds.FieldByName('DATALANCTO').AsDateTime;
  _CodTipDoc := Cds.FieldByName('CODTIPDOC').AsInteger;

  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  Cds.FieldByName('DEBCRE').AsString := CdsTipoDoc.FieldByName('DEBCRE').AsString;
  Cds.FieldByName('NOME').AsString := CmpForCli.ForCliReg.Nome;
  rTotalContab := 0;
  rValorCliFor := 0;

  if Cds.FieldByName('DEBCRE').AsString = 'C' then
     rValorCheckForCli := (dbeValorCorrente.Value * (-1))
  else
     rValorCheckForCli := dbeValorCorrente.Value;

  // Alex 14/04/04 16597
  // se for múltiplas contas de baixa não passar por aqui
  if ( ParamIntegra.IntegraContab ) and
     ( CdsCCBaixasXDocum.IsEmpty ) then
  begin
     sObriga := '';
     sNome := '';
     sSubConta := '';

     if Sobriga <> 'S' then _CCustoCliFor := '';

  end;

  if ( ParamIntegra.IntegraContab ) and ( not cbIntegra.Checked ) and
     ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
     (Cds.FieldByName('IDMODULO').AsInteger = 4)) then
  begin
     CdsContab.First;
     while (not CdsContab.Eof) do
     begin
        if CdsContab.FieldByName('LACDEBCRE').AsString = 'D' then
           rTotalContab   := rTotalContab   +  CdsContab.FieldByName('LACVALOR').AsFloat
        else
           rTotalContab   := rTotalContab   - CdsContab.FieldByName('LACVALOR').AsFloat;

        CdsContab.Next;
     end;

     if (not IsFloatZero(rTotalContab)) then
     begin
       MsgDlg('Total do Débito não bate com o Total do Crédito na Contabilização. Verifique','Erro',mtError,[mbOk],0);
       exit;
     end;

  end;


 //amf 26.08.2006 21703
  if _LancDocCapCar.VinculoBancario
     ('P', cdsPortForma.FieldByName('CODPORTFORMA').AsFloat) and (paramIntegra.RecPag = 'P') then
  begin
     if (cds.FieldByName('NUMBANCO').IsNull) OR
        (Trim(cds.FieldByName('NUMBANCO').AsString) = '') OR
        (cds.FieldByName('NUMAGENCIA').IsNull) OR
        (Trim(cds.FieldByName('NUMAGENCIA').AsString) = '') OR
        (cds.FieldByName('CONTACORRENTE').IsNull) OR
        (Trim(cds.FieldByName('CONTACORRENTE').AsString) = '') then
     begin
        MsgDlg('Os dados bancários são obrigatórios. Verifique na aba Geral', 'Erro',mtError,[mbOk],0);
        Accept := False;
        Exit;
     end;
  end;

  //amf 31.05.2007 25484 - Verifica o vínculo bancário do Fornecedor
  try
    cdsContaBancoForn := TClientDataSet.Create(nil);
    cdsContaBancoForn.Data := CtrlPessoaForne.SelContaBancaria(cds.FieldByName('IDFORCLI').AsFloat);

    cdsFormaRecPag      := TClientDataSet.Create(nil);
    cdsFormaRecPag.Data := CtrlFormaRecPag.ListFormaRecPag(Sistema.IdEmpresa,
                                                           cds.FieldByName('CODFORMA').AsFloat,
                                                           'P');
    if ( cdsFormaRecPag.FieldByName('FLGDADOSBANCARIOS').AsString = 'S' ) then
       if ( cdsContaBancoForn.IsEmpty ) then
       begin
           MsgDlg('Este fornecedor não possui dados bancários e esta forma de pagamento '#13#10 +'exige dados bancários. Verifique na aba Geral', 'Erro',mtError,[mbOk],0);
           Accept := False;
           Exit;
       end;

  finally
    FreeAndNil(cdsContaBancoForn);
    FreeAndNil(cdsFormaRecPag);
  end;

  //amf 26.08.2006 21704 - Verifica a duplicação do documento
  if _LancDocCapCar.DocumentoDuplicado(CmeCadastro.Operacao,
                                       cds.FieldByName('NODOCUMENTO').AsInteger,
                                       cds.FieldByName('COMPLDOCUMENTO').AsString,
                                       cds.FieldByName('VALOR').AsFloat,
                                       cds.FieldByName('IDFORCLI').AsInteger,
                                       cds.FieldByName('DATAVENCTO').AsDateTime) then
  begin
     if Application.MessageBox
       ('Já foi encontrado um documento com o mesmo valor para esta data de vencimento.' +
        'Deseja Continuar ?', 'Aviso', mb_YesNo + mb_IconWarning) = idNo then
     begin
       Accept := False;
       Exit;
     end;
  end;

  //amf 12.04.2007 22592
  if (iExigeCota > 0) then
  begin
     if (cds.FieldByName('QTDECOTAS').IsNull) then
     begin
       MsgDlg('É obrigatório indicar o valor da quantidade de cotas. Verifique na aba Geral', 'Erro',mtError,[mbOk],0);
       Accept := False;
       Exit;
     end
  end;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  inherited;

  dblcTipoRD.Enabled := False;

  if sbtnInserir.Down then
  begin
    _ValorEdit := 0;
    _Valida := True;
    if CmpForCli.CanFocus then CmpForCli.SetFocus;
  end;

  Accept := True;
end;


procedure TfrmLancDocCAPCAR.DBcboGrupoRateioExit(Sender: TObject);
begin
   inherited;

   if DBcboGrupoRateio.LookupValue <> '' then
   begin
      cdsPadraoRateio.Data := CtrlGrupoRateio.LookupPadraoRateioDoc(StrToInt(DBcboGrupoRateio.LookupValue),
                                                                    Sistema.IDEmpresa);
   end;
end;



procedure TfrmLancDocCAPCAR.btnGrupoRateioClick(Sender: TObject);
var
   iContador      : Integer;
   iQuantRateio   : Integer;
   fTotalRateado  : Extended;
   fTotalRestante : Extended;
   fVlrRateio     : Extended;
begin
   inherited;

   if not(VerificaRateio) then Exit;

   if (cdsPadraoRateio.Active) and not(cdsPadraoRateio.IsEmpty) then
   begin
      iContador      := 1;
      iQuantRateio   := cdsPadraoRateio.RecordCount;
      fTotalRestante := Cds.FieldByName('VALOR').AsCurrency;

      cdsPadraoRateio.First;
      CdsDet.DisableControls;

      while not(cdsPadraoRateio.EOF) do
      begin
         fTotalRateado  := Cds.FieldByName('VALOR').AsCurrency;
         fVlrRateio     := Arredonda(fTotalRateado * cdsPadraoRateio.FieldByName('PERCENTRATEIO').AsCurrency / 100, 2);

         // se for o ultimo registro da query colocar o valor restante nela
         if iContador = iQuantRateio then fVlrRateio := fTotalRestante;

         // inserção do Rateio
         CdsDet.Insert;

         CdsDet.FieldByName('CODDOCUMENTO').AsInteger    := Cds.FieldByName('CODDOCUMENTO').AsInteger;
         CdsDet.FieldByName('IDPESSOA').AsInteger        := Sistema.IdEmpresa;

         CdsDet.FieldByName('UNIDNEGOC').AsInteger       := cdsPadraoRateio.FieldByName('UNIDNEGOC').AsInteger;
         CdsDet.FieldByName('NOME').Text                 := cdsPadraoRateio.FieldByName('UNIDNEGOCIO').AsString;

         CdsDet.FieldByName('RECPAG').AsString           := ParamIntegra.RecPag;

         CdsDet.FieldByName('CODCENTRORESPON').AsString  := cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString;
         CdsDet.FieldByName('NOME_1').Text               := cdsPadraoRateio.FieldByName('CENTRORESPON').AsString;

         CdsDet.FieldByName('CODTIPRECDES').AsStrIng     := cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString;
         CdsDet.FieldByName('DESCRICAO').Text            := cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString;
         CdsDet.FieldByName('VALOR').Value               := fVlrRateio;

         CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng   := cdsPadraoRateio.FieldByName('CODCENTROCUSTO').AsString;
         CdsDet.FieldByName('CODEXTERNOCC').asString       := cdsPadraoRateio.FieldByName('CODCCEXTERNO').AsString;
         CdsDet.FieldByName('NOMECENTROCUSTO').AsString  := cdsPadraoRateio.FieldByName('CENTROCUSTO').AsString;
         With SqlAuxTipoRD, Sql Do
         begin
           Clear;
           Add(' SELECT ');
           Add('    T.PLACONTACREDITO, ');
           Add('    T.PLACONTA, ');
           Add('    P.PLACCUST ');
           Add(' FROM ');
           Add('    TIPORECEBDESEMB T, ');
           Add('    PLANOCONTA P ');
           Add(' WHERE ');
           Add('    RTrim(T.CODTIPRECDES) = :CODTIPRECDES ');
           Add('    and T.RECPAG = :RECPAG ');
           Add('    and T.IDPESSOA = :IDPESSOA ');
           Add('    and P.PLACONTA(+) = T.PLACONTA ');
           Add('    and P.PLANO(+)    = T.PLANO ');
           Prepare;
           ParamByName('CODTIPRECDES').AsString := Trim(CdsDet.FieldByName('CODTIPRECDES').AsString);
           ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
           ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
           Open;
         end;

         if trim (CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng) <> '' then
           CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
         else
           CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil;
         //fim - André Tavares - pendência 16992 - 17/04/2004

         CdsDet.FieldByName('IDPLANOPREV').AsInteger     := cdsPadraoRateio.FieldByName('IDPLANOPREV').AsInteger;
         CdsDet.FieldByName('DESCPLANO').AsString        := cdsPadraoRateio.FieldByName('PLANPREV').AsString;

         CdsDet.FieldByName('IDPATRO').AsInteger         := cdsPadraoRateio.FieldByName('IDPATRO').AsInteger;
         CdsDet.FieldByName('NOMEPATRO').AsString        := cdsPadraoRateio.FieldByName('PATRO').AsString;

         CdsDet.FieldByName('IDPROGRAMA').AsInteger      := cdsPadraoRateio.FieldByName('IDPROGRAMA').AsInteger;
         CdsDet.FieldByName('DESCPROGRAMA').AsString     := cdsPadraoRateio.FieldByName('DESCPROGRAMA').AsString;

         CdsDet.Post;

         fTotalRestante := fTotalRestante - fVlrRateio;
         inc(iContador);

         cdsPadraoRateio.Next;
      end;

      _cdsAux.Data := copyClientDataset(cdsDet);    // tavares - pendência 17279

      CdsDet.EnableControls;
   end;
end;




function TfrmLancDocCAPCAR.Arredonda(const fValor     : Extended;
                                     const iDecimais  : Word
                                    ): Extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;





function TfrmLancDocCAPCAR.VerificaRateio: Boolean;
var
   sMsg : String;
begin
   Result := False;
   try

      if (Cds.FieldByName('VALOR').IsNull) or (Cds.FieldByName('VALOR').AsCurrency = 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor do Documento antes de fazer o Rateio!', btnGrupoRateio);

      if not(dbgrdDet.DataSource.DataSet.IsEmpty) then
         raise EValidacao.CreateVal('O Rateio já foi preenchido! ' + #13 + 'Não é possível executar Rateio Pré-definido', btnGrupoRateio);

      if not(cdsPadraoRateio.Active) then
         raise EValidacao.CreateVal('É necessário indicar o Padrão de Rateio!', btnGrupoRateio);

      if cdsPadraoRateio.IsEmpty then
         raise EValidacao.CreateVal('O Padrão de Rateio selecionado está vazio!', btnGrupoRateio);

      cdsPadraoRateio.First;
      while not(cdsPadraoRateio.EOF) do
      begin
         if not(VerificaTipoDesembXCRespon) then
         begin
            sMsg := 'O Tipo de Desembolso "' + cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString +
                    '" não está associado ao ' + 'Centro de Responsabilidade "' +
                    cdsPadraoRateio.FieldByName('CENTRORESPON').AsString + '"! ' + #13 +
                    'O Rateio está inválido. ';
            raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
         end;

         if not(VerificaTipoDesembXForn) then
         begin
            sMsg := 'O Tipo de Desembolso "' + cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString +
                    '" não está associado ao ' + 'Fornecedor "' +
                    CmpForCli.Text + '" ou seu Ramo! ' + #13 +
                    'O Rateio está inválido. ';
            raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
         end;

         if not(VerificaUsuXCRespon) then
         begin
            sMsg := 'O Usuário corrente não está associado ao Centro de Responsabilidade "' +
                    cdsPadraoRateio.FieldByName('CENTRORESPON').AsString + '"! ' + #13 +
                    'O Rateio está inválido. ';
            raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
         end;

         cdsPadraoRateio.Next;
      end;

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;




function TfrmLancDocCAPCAR.VerificaTipoDesembXCRespon: Boolean;
begin
   Result := True;

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupTipoDesembXCRespon(Sistema.IDEmpresa,
                                                                      'P',
                                                                      Espaco(cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString, 10));

   // Se não houver Tipos de Desembolso associados ao Centro de Responsabilidade, está OK
   if cdsVerificaRateio.IsEmpty then Exit;

   cdsVerificaRateio.First;
   while not(cdsVerificaRateio.EOF) do
   begin
      // Se o Tipo de Desembolso estiver associado, está OK
      if trim(cdsVerificaRateio.FieldByName('CODTIPRECDES').AsString) =
         trim(cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString) then Exit;

      cdsVerificaRateio.Next;
   end;

   Result := False;
end;




function TfrmLancDocCAPCAR.VerificaPreenchimentoSegregaDetalhe: boolean;
begin
   Result := False;
   try

      if (Cds.FieldByName('VALOR').IsNull) or (Cds.FieldByName('VALOR').AsCurrency = 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor do Documento antes de fazer o Rateio!', btnGrupoRateio);

      // início Andre tavares - 19243
      if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(CdsDet.FieldByName('IDPATRO').AsInteger,
             CdsDet.FieldByName('IDPLANOPREV').AsInteger) then
      begin
        MsgDlg(CtrlPlanPrevContabPatro.MessageInfo,'Erro',mtError,[mbOk],0);
        Result := false;
        Abort;
      end;
      //fim Andre Tavares - 19243

      // Se segregação ativada
      // não permitir lança e baixa simultânea para plano <> comum e patro <> comum
      // esta trava tb deve ser feita no objeto pois o usuário pode selecionar lança e baixa
      // após ter sido feito o rateio. _LancDocCapCar.ProcessaDocumento
      if ParamIntegra.SegregaVirtual then begin
         // travas lança e baixa simulanea
         if cbLancaBaixa.Checked then begin
            // se permitir lançar um plano carimbado, fura a segregação do fluxo primário
            if not ((ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
                    (ParamIntegra.PlanoPrevAdm = CdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
               raise EValidacao.createVal ('Para lançamentos de Lança e Baixa Simultânea, onde a segregação está ativa, não é permitido lançar um Plano Previdenciário diferente do "Comum"/"Adminitrativo"!', cmbPlano);

            // se permitir lançar uma patro carimbada, fura a segregação do fluxo primário
            if ParamIntegra.PatroGlobal <> CdsDet.FieldByName('IDPATRO').AsInteger then
               raise EValidacao.createVal ('Para lançamentos de Lança e Baixa Simultânea, onde a segregação está ativa, não é permitido lançar uma Patrocinadora diferente da "Comum"!',CmbPatro);

         end;

         // se plano = comum/adm  então  patro = comum
         if ((ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
             (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
             (ParamIntegra.PatroGlobal = CdsDet.FieldByName('IDPATRO').AsInteger)) and
            ( not ((ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
                   (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOPREV').AsInteger)) or
            (ParamIntegra.PatroGlobal <> CdsDet.FieldByName('IDPATRO').AsInteger)) then
            raise EValidacao.createVal('Para lançamentos, onde a segregação está ativa, se lançar em um Plano Previdenciário "Comum"/"Administrativo" a Patrocinadora deve ser "Comum", e vice-versa!',cmbPlano);

         // Alex 14/12/04 18107 fazer as críticas por programa, quando o plano administrativo foi parametrizado
         if (CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString <> '') and (ParamIntegra.PlanoPrevAdm > 0) then begin
           // o programa administrativo foi escolhido
           if CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'ADM' then begin
             if ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger then // escolhido o plano O.C.
               raise EValidacao.createVal ('O programa Administrativo não permite o plano de "Operações Comuns"!', cmbPlano);

           end else if CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'INV' then begin
             if (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOPREV').AsInteger) then // escolhido o plano ADM
               raise EValidacao.createVal ('O programa de Investimentos não permite o plano de "Operações Administrativas"!', cmbPlano);

           end else if (CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'PRE') or (CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'ASS') then begin
             if ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger then // escolhido o plano O.C.
               raise EValidacao.createVal ('O programa Previdencial / Assistencial não permite o plano de "Operações Comuns"!', cmbPlano);

             if (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOPREV').AsInteger) then // escolhido o plano ADM
               raise EValidacao.createVal ('O programa Previdencial / Assistencial não permite o plano de "Operações Administrativas"!', cmbPlano);
           end;
         end;
         // Alex 14/12/04 18107 fazer as críticas por programa, quando o plano administrativo foi parametrizado

       end;
       // fim 22/01/04 Alex 14451 - Nova segregação


   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Segregação de Recursos', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;




function TfrmLancDocCAPCAR.VerificaPreenchimentoSegregaMestre: boolean;
begin
   Result := true;
   if not ParamIntegra.SegregaVirtual then exit;
   try
     try
       CdsDet.DisableControls;

       if (_OperacaoLanc = opldAdiantamento) and (CdsDet.RecordCount > 1) then
         raise EValidacao.createVal('Apenas um rateio é permitido em documentos de adiantamento!',cmbPlano);

       CdsDet.First;
       while not CdsDet.Eof do begin
         Result := VerificaPreenchimentoSegregaDetalhe;
         if not Result then exit;
         CdsDet.Next;
       end;

     except
       on ev : EValidacao do
       begin
          Result := false;
          if ev.Show then MsgDlg(ev.message, 'Segregação de Recursos', mtWarning, [mbOk], 0);
          Repaint;
          if ev.Control.CanFocus then ev.Control.SetFocus;
          Exit;
       end;
     end;
   finally
      CdsDet.EnableControls;
   end;
end;




function TfrmLancDocCAPCAR.VerificaTipoDesembXForn: Boolean;
begin
   Result := True;

   // 1º - Verifica se o Tipo de Desembolso está associado ao Fornecedor

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupTipoDesembXForn(Sistema.IDEmpresa,
                                                                   Cds.FieldByName('IDFORCLI').AsFloat,
                                                                   'P');

   cdsVerificaRateio.First;
   while not(cdsVerificaRateio.EOF) do
   begin
      // Se o Tipo de Desembolso estiver associado, está OK
      if trim(cdsVerificaRateio.FieldByName('CODTIPRECDES').AsString) =
         trim(cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString) then Exit;

      cdsVerificaRateio.Next;
   end;

   // 2º - Verifica se o Tipo de Desembolso está associado ao Ramo do Fornecedor

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupRamoFornXDesemb(Sistema.IDEmpresa,
                                                                   Cds.FieldByName('IDFORCLI').AsFloat,
                                                                   'P');

   // Se não houver Tipos de Desembolso associados ao Ramo do Fornecedor, está OK
   if cdsVerificaRateio.IsEmpty then Exit;

   cdsVerificaRateio.First;
   while not(cdsVerificaRateio.EOF) do
   begin
      // Se o Tipo de Desembolso estiver associado, está OK
      if trim(cdsVerificaRateio.FieldByName('CODTIPRECDES').AsString) =
         trim(cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString) then Exit;

      cdsVerificaRateio.Next;
   end;

   Result := False;
end;





function TfrmLancDocCAPCAR.VerificaUsuXCRespon: Boolean;
begin
   Result := True;

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupUsuXCRespon(Sistema.IDEmpresa,
                                                               Sistema.IDUsuario,
                                                               'P',
                                                               Espaco(cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString, 10));

   // Se não houver Tipos de Desembolso associado ao Centro de Responsabilidade, está OK
   if not(cdsVerificaRateio.IsEmpty) then Exit;

   Result := False;
end;




procedure TfrmLancDocCAPCAR.dblcTipoRDEnter(Sender: TObject);
begin
  // Marcio Motta - 18492 - 19/01/2005
  dblcTipoRD.Text := '';
  CdsDet.FieldByName('CODTIPRECDES').Clear;

  if ReResOrc.Value = 0 then
    SetaCentResponDesemb(-1, False)
  else
    SetaCentResponDesemb(BuscaIdReservaOrcamento(Trunc(ReResOrc.Value)), False);
  // Fim - Marcio Motta
end;




function TfrmLancDocCAPCAR.BuscaIdReservaOrcamento(NumCompromisso: integer): integer;
// Marcio Motta - 18492 - 19/01/2005
//******************************************************************************
//* Função para buscar o IDRESERVAORCAMEN, fornecendo o número do Compromisso  *
//* Necessário para a filtragem do TIPO DE DESEMBOLSO                          *
//******************************************************************************

var
  CdsTemp: TCMClientDataSet;
  SqlParam: TCMSqlParams;

begin
  if NumCompromisso > 0 then
    begin
      try
        CdsTemp  := TCMClientDataSet.Create(nil);
        SqlParam := TCMSqlParams.Create(nil);
        SqlParam.ClientDataSet := CdsTemp;

        SqlParam.SQL.Add('SELECT IDRESERVAORCAMEN');
        SqlParam.SQL.Add('FROM RESERVAORCAMEN');
        SqlParam.SQL.Add('WHERE NUMRESERVA = ' + IntToStr(NumCompromisso));

        CdsTemp.Close;
        SqlParam.Open;

        if CdsTemp.IsEmpty then
          Result := -1
        else
          Result := CdsTemp.FieldByName('IDRESERVAORCAMEN').AsInteger;

      finally
        FreeAndNil(CdsTemp);
        FreeAndNil(SqlParam);
      end;
    end
  else
    Result := -1;
end;




function TfrmLancDocCAPCAR.VerificaTipoDesembolso: boolean;
// Marcio Motta - 18492 - 20/01/2005
//******************************************************************************
//* Função para verificar se o Compromisso Orçamentário corresponde ao         *
//* TIPO DE DESEMBOLSO selecionado                                             *
//******************************************************************************

var
  CdsTemp: TCMClientDataSet;
  SqlParam: TCMSqlParams;
  sIdReserva: string;
begin
  Result := False;

  try
    CdsTemp  := TCMClientDataSet.Create(nil);
    SqlParam := TCMSqlParams.Create(nil);
    SqlParam.ClientDataSet := CdsTemp;

    // Busca o ID da Reserva
    sIdReserva := IntToStr(BuscaIdReservaOrcamento(Trunc(ReResOrc.Value)));

    // Busca os Tipos de Desembolsos permitidos
    SqlParam.SQL.Add('SELECT CP.CODCENTRORESPON, CP.CODTIPRECDES');
    SqlParam.SQL.Add('FROM COMPCONTASORCAMEN CP, RESERVAORCAMEN RE');
    SqlParam.SQL.Add('WHERE (RE.IDRESERVAORCAMEN = ' + sIdReserva + ')');
    SqlParam.SQL.Add('AND (RE.IDPLANOORCAMEN = CP.IDPLANOORCAMEN)');
    SqlParam.SQL.Add('AND (RE.IDCONTAORCAMEN = CP.IDCONTAORCAMEN)');
    SqlParam.SQL.Add('AND CP.CODTIPRECDES IS NOT NULL');

    CdsTemp.Close;
    SqlParam.Open;

    // Se o Tipo de Desembolso selecionado não for permitido
    if (CdsTemp.IsEmpty) or (CdsTemp.Locate('CODTIPRECDES', _TpDesmb, [])) then
      Result := True;

  finally
    FreeAndNil(CdsTemp);
    FreeAndNil(SqlParam);
  end;
end;




procedure TfrmLancDocCAPCAR.ReResOrcExit(Sender: TObject);
begin
  inherited;
  // Marcio Motta - 18492 - 21/01/2005
  if (ReResOrc.Lines[0] <> '') and (ReResOrc.Value > 0) then
    begin
      CdsDet.FieldByName('NUMRESERVA').AsFloat := ReResOrc.Value;
      CdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat := BuscaIdReservaOrcamento(Trunc(ReResOrc.Value));
      SetaCentResponDesemb(CdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger, False);
    end;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  sDataLanc := Cds.fieldByName('DATALANCTO').asString; // André Tavares - pendência 18937 - 25/04/2005

  iContaXCaixa := StrtoIntDef( dblcPortadorForma.LookupValue, -1 );

  //  Rodolpho da Silva - P: 18588 - 11/08/2005
  DtmCapCarMT.CdsAdtoPendente.Close;
  DtmCapCarMT.CdsPrevPendente.Close;

  EmitirBloqueto; //andré tavares pendência 24373 - 01/02/2007

end;

function TfrmLancDocCAPCAR.VerificaSeDocAdiantEstaRegularizado: boolean;
//  Rodolpho da Silva - P: 18588 - 22/06/2005
begin
   Result := False;
   CdsLancamento.DisableControls;
   CdsLancamento.First;
   while not CdsLancamento.Eof do
   begin
       if CdsLancamento.FieldByName('OPERACAO').AsInteger in [16,17] then
          Exit;
      CdsLancamento.Next;
   end;
   CdsLancamento.EnableControls;
   CdsLancamento.First;
   Result := True;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   //  Rodolpho da Silva - P: 18588 - 11/08/2005
   DtmCapCarMT.CdsAdtoPendente.Close;
   DtmCapCarMT.CdsPrevPendente.Close;

end;


// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.RdFichaClick(Sender: TObject);
begin
  inherited;
   if RdFicha.checked then
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; ';
end;

// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.RdArrecadClick(Sender: TObject);
begin
  inherited;
   if RdArrecad.checked then
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';
end;

// andre tavares pendencia 19942 - 26/08/2005
function TfrmLancDocCAPCAR.verificaCodBarra: boolean;
begin
  result := true;
  if RdFicha.Checked then
  begin
    if (Trim(DbeBarras.Text) <> '') then
      if not CtrlIntBanco.ValidaCodBarrasSispag(DbeBarras.Text,11) then
      begin
        result := false;
        if DbeBarras.CanFocus then DbeBarras.setFocus;
      end;
    if (Trim(DbeLInhaDigit.Text) <> '') then
      if not CtrlIntBanco.ValidaCodBarrasSispag(DbeLInhaDigit.Text,10) then
      begin
        result := false;
        if DbeLInhaDigit.CanFocus then DbeLInhaDigit.setFocus;
      end;
  end else
  begin
    If (Trim(DbeLInhaDigit.Text) <> '') then
      if Not CtrlIntBanco.ValidaCodBarrasArrecad(DbeLInhaDigit.Text) then
      begin
        result := false;
        if DbeLInhaDigit.CanFocus then DbeLInhaDigit.setFocus;
      end;
  end;
end;

// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.DbeBarrasExit(Sender: TObject);
begin
  inherited;
  verificaCodBarra;
end;

// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.DbeLinhaDigitExit(Sender: TObject);
begin
  inherited;
  verificaCodBarra;
end;

procedure TfrmLancDocCAPCAR.dblkAlteradorChange(Sender: TObject);
var
   cdsAux: TClientDataSet;
begin
  inherited;
  mmObsAlt.Lines.Text := '';
  cdsAux := TClientDataSet.Create(nil);
  if Trim(dblkAlterador.LookUpValue) <> '' then
  begin
     cdsAux.Data := CtrlTipoalterador.listTipoalterador(0,'',StrToFloat(dblkAlterador.LookUpValue));
     mmObsAlt.Lines.Text := cdsAux.FieldByName('OBSERVACAO').AsString;
  end;
  FreeAndNil(cdsAux);
end;

procedure TfrmLancDocCAPCAR.sbtnProcurarClick(Sender: TObject);
begin
  CmpForCli.Enabled := true;
  inherited;

end;

//andre tavares - pendência 22079 - 14/07/2006
procedure TfrmLancDocCAPCAR.dblcTipoDocChange(Sender: TObject);
begin
  inherited;
  cdsPortForma.filtered := false;
  if trim(dblcTipoDoc.LookupValue) <> '' then
  begin
    cdsPortForma.filter := ' CODTIPDOC = '+ dblcTipoDoc.LookupValue;
    cdsPortForma.filtered := true;
  end;
  cdsPortForma.filtered := not cdsPortForma.IsEmpty;

  dblcPortadorForma.LookupValue := '';
  dblcPortadorForma.Text := '';
end;

//início - andre tavares - pendência 22079 - 14/07/2006
function TfrmLancDocCAPCAR.EmitirBloqueto: Boolean;
begin
  result := true;
  try
    // se o portadorforma do documento emite ficha de compensação e não foi emitido então
    //  perguntar se quer emitir ficha de compensação
    //  se sim então
    //    chamar o form de emissão ficha de compensação preenchido
    if (not CdsPortForma.fieldByName('IDCONFIGBARRAS').IsNull) and (ParamIntegra.RecPag = 'R') and
       (trim(dblcPortadorForma.Text) <> '') and (_OperacaoLanc = opldEfetivo) and
       (Application.MessageBox('Deseja Emitir uma Ficha de Compensação?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
    begin
      _FrmConfigBarrasCMMT := TFrmConfigBarrasCMMT.Create(self);
      _FrmConfigBarrasCMMT.formStyle        := fsNormal;
      _FrmConfigBarrasCMMT.Visible := false;
      _FrmConfigBarrasCMMT.coddocumento     := trunc(_lancdoccapcar.coddocumento);
      _FrmConfigBarrasCMMT.idconfigBarras   := CdsPortForma.fieldByName('IDCONFIGBARRAS').asInteger;
      _FrmConfigBarrasCMMT.codportadorforma := CdsPortForma.fieldByName('CODPORTFORMA').asInteger;
      _FrmConfigBarrasCMMT.idtipocliente    := Modulo.IdTipoCliAdianto;
      _FrmConfigBarrasCMMT.codTipoDoc       := CdsTipoDoc.fieldByName('CODTIPDOC').asInteger;;
      _FrmConfigBarrasCMMT.idmodulo         := sistema.idmodulo;
      _FrmConfigBarrasCMMT.idusuario        := sistema.idusuario;
      _FrmConfigBarrasCMMT.HabilitaImpressao(true);
      _FrmConfigBarrasCMMT.ShowModal;
      _FrmConfigBarrasCMMT.Release;
    end;
  except
    result := false;
  end;//try
end;
//fim - andre tavares - pendência 22079 - 14/07/2006

//início - andre tavares - pendência 21603 - 27/07/2006
function TfrmLancDocCAPCAR.reprogDataVencto(const sTextoPergunta: string): boolean;
begin

  result := MsgDlg(sTextoPergunta,
                  'Confirmar', mtConfirmation, [mbYes,mbNo],0) = mrYes;

end;
//fim - andre tavares - pendência 21603 - 27/07/2006

procedure TfrmLancDocCAPCAR.ControlesReadyOnly(bLigar: boolean);
begin
   //Marcus Oliveira P. 23425 20/10/2006

   //Dados pra lançamento
   dbeHistorico.ReadOnly      := bLigar;
   PnlLancPrin.Enabled        := not(bLigar);
   pnlOpcao.Enabled           := not(bLigar);
   gbDatas.Enabled            := not(bLigar);
   GpBarras.Enabled           := not(bLigar);
   GpConta.Enabled            := not(bLigar);
   PnlGeral.Enabled           := not(bLigar);
   MemObs.ReadOnly            := bLigar;

end;

procedure TfrmLancDocCAPCAR.dbQtdeCotaChange(Sender: TObject);
var
  strCota: string;
  i: integer;
  iVirgulas: integer;
begin
  inherited;

  strCota := dbQtdeCota.Text;
  iVirgulas := 0;
  for i := 1 to length(strCota) do
  begin
     if (strCota[i] = ',') then
        inc(iVirgulas);

     if (iVirgulas > 1) then
     begin
        dbQtdeCota.Clear;
        break;
     end;
  end;

end;

procedure TfrmLancDocCAPCAR.EmptyDataSet(Dts: TDataSet);
begin
  Dts.First;
  while not Dts.Eof Do Dts.Delete;
end;

end.
