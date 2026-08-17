// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizaContaOrcamen, InsereContaOrcamen
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 29/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 187955
Nº KINTANA..: 1770040
Data........: 03/08/2012
Responsável.: Edilaine Ferraresi
Descrição...: tratamento da condição de centros de custos que deve efetuada apenas para grupos 4
{--------------------------------------------------------------------------------------------------
Rotina......: AtualizarContasContabporGrupo
Nº SOL......: 172384/10142
Nº KINTANA..: 1696873
Data........: 18/06/2012
Responsável.: Higor Nayde
Descrição...: client publico para passagem dos centros de custos
{--------------------------------------------------------------------------------------------------
{--------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento
Nº SOL......: 172383-7764
Nº KINTANA..: 1556975
Data........: 23/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ExisteCombinacao
Nº SOL......: 176840
Nº KINTANA..: 1615714
Data........: 22/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: acrescentar na verificação o CODEXTERNO do Centro de Custo.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Todo a Control
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado vários ajustes nas rotinas para se adequar para a tela de
              Vinculação de Contas Contábeis pro Grupo.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo
Data..........: 17/08/2011
Nº SOL........: 159212
Nº KINTANA....: 1337867
Descrição.....: Adicionado métodos de ListaPrograma,ListaTipoDespesa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Autor......: Ricardo de Freitas Araújo
// Data.......: 08/07/2011
// Sol........: 1349788
// Kintana....: 160539/5501
// Rotina.....: RetirarContOrcamenNaoParam
// Descrição..: Excluir as contas orçamentérias que não fazem parte da parametrização
                selecionada pelo usuário
//------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
// Autor......: Ricardo de Freitas Araújo
// Rotina.....: GravarGrupoOrc
// Data.......: 22/02/2010
// Sol........: 153019
// Kintana....: 1147112
// Descrição..: * Alterado a consulta de contas orçamentárias por LIKE, pois há códigos
                que começam com " " no início, ex: " 0000000034523143"
                * Alterado o layout do log para melhor entendimento.

// Rotina.....: AtualizaPlanosContabilGrupo
// Data.......: 24/02/2010
// Sol........: 153019
// Kintana....: 1147112
// Descrição..: Adicionado rotina que atualiza vinculo de contas contábeis por
                grupo para os códigos de contas orçamentária que a parametrização
                não abrange porém existem no grupo.
//------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
// Autor......: Ricardo de Freitas Araújo
// Rotina.....: GravarGrupoOrc
// Data.......: 17/02/2010
// Sol........: 152733
// Kintana....: 1138762
// Descrição..: Comentado a chamada da função ExcluiRelacionamDesfeitos para não excluir
//              todas as contas de orcamento fazendo assim o grupoorcamneto sempre
//              apareça na consulta.
//-------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaCentroDeCusto
Nº SOL......: 151628
Nº KINTANA..: 1115224
Data........: 28/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração para trazer os centros de custos inativos no cadastro de
              Contas Orçamentárias por Grupo.
---------------------------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 08/09/2009
// Sol........: 123436
// Kintana....: 616983
// Descrição..: Alteração da Rotina de Centro de Custos, para desvincular a
//              obrigatoriedade de informar as contas de centro de custos quando
//              o flag de centro de custos estiver desmarcado.
//
//------------------------------------------------------------------------------
{Rotina.........: TCtrlCadContasOrcPorGrupo.ListaCentroDeCusto,
                  function ExcluiRelacionamDesfeitos
N. Sol..........: 109826
N. Kintana......: 498982
Data............: 26/03/2009
Responsável.....: Marilza Colpani
Descrição.......: Otimização de query
******************************************************** }
{
Rotina    : Diversas
Data      : 07/11/2005
Autor     : Rodolpho da Silva
Pendencia : 18252
Descrição : Permitir criação de novas contas orçamentárias em um grupo já cadastrado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentRespon e ListaCentroDeCusto e ListaAtivProj
Data      : 17/12/2003
Autor     : André Pontes
Pendencia : 16005 / 15700
Descrição : Filtro para não listar os sintéticos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentRespon e ListaCentroDeCusto
Data      : 17/12/2003
Autor     : André Pontes
Pendencia : 15805
Descrição : Centros de Custo e Centro de Restponsabilidade filtradas pelo respectivo plano vigente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentRespon e ListaCentroDeCusto
Data      : 15/12/2003
Autor     : André Pontes
Pendencia : 15805
Descrição : Centros de Custo e Centro de Restponsabilidade filtradas pelo respectivo plano vigente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InclusaoNovaCR, AlteracaoNovaCR, ExclusaoNovaCR, MontaCodigosCR, ExisteCombinacaoCR
Data      : 03/12/2003 a 15/12/2003
Autor     : André Pontes
Pendencia : 15700
Descrição : Criadas novas funções para controlar a replicação por Centro de Responsabilidade
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AlteracaoNova
Data      : 23/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Correção da alteração da conta "espelho" original
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExclusaoNova
Data      : 06/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Criada função para exclusão das contas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExcluiCompContas
Data      : 03/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : A exclusão da CompContas passa a ser conta a conta.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExisteCombinacao
Data      : 02/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Criada função para verificar se já existe alguma conta com a mesma combinação de
            parâmetros da que se deseja inserir
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaCentroDeCusto   /  ListaAtivProj  /  ListaPatro  /  ListaPlanoPrev
Data      : 30/09/2003 a 01/10/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Criado parâmetro que indica se devem ser listados:
            0: Todos
            1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
            2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AlteracaoNova / ExcluiCompContas
Data      : 29 e 30/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Novas funções para alteração de Contas Orçamentárias por Grupo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 22/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Nova função para criação das Contas Orçamentárias
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 19/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Reorganização de todo o código
---------------------------------------------------------------------------------------------------}

unit uCtrlCadContasOrcPorGrupo;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
   uMidasUtil, uCMTypes, Classes, StdCtrls, uCmSqlParams, uDbDataView, uReccodigo,
   ComCtrls, Math, dialogs, Forms,FAnaliseGeracaoContasOrcamen,DBaseDados, uSistema,
   uCtrlPlanPrevContabPatro, uCtrlPadroes,DBTables,uCtrlCadContasContabPorGrupo;

type
   TCtrlCadContasOrcPorGrupo = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure onCreateAppServer; override;

   private

      dbDataView        : TdbDataView;
      AtualizarLog      : Boolean;

      FCntStatus        : Integer;
      FIdEmpresa        : Double;
      FPlano            : Double;

      FCdsGrupoOrc      : TClientDataSet;    // Grupos Orçamentário
      FCdsCentRespon    : TClientDataSet;    // Centro de Responsabilidade
      FCdsCentroDeCusto : TClientDataSet;    // Centro de Custo
      FCdsAtivProj      : TClientDataSet;    // Atividade de Projeto
      FCdsPlanoPrev     : TClientDataSet;    // Plano Previdenciário
      FCdsPatro         : TClientDataSet;    // Patrocinadores
      FCdsCRSel         : TClientDataSet;    // Centros de Responsabilidade selecionados
      FCdsCCSel         : TClientDataSet;    // Centros de Custo selecionados
      FCdsAPSel         : TClientDataSet;    // Atividades/Projetos selecionados
      FCdsPPSel         : TClientDataSet;    // Planos selecionados
      FCdsPTSel         : TClientDataSet;    // Patrocinadoras selecionadas
      FCdsCampoSel      : TClientDataSet;    // Campos selecionados (não usado)
      FCdsParamOrc      : TClientDataSet;    // Parâmetros do sistema (códigos dos Planos e Patrocinadoras)

      cdsCodigo         : TClientDataSet;    // Usado para o "cálculo" do código da conta.
                                             // É nele que se faz o loop para inserção/alteração
                                             // das contas orçamentárias
      cdsExiste         : TClientDataSet;    // Usado para verificar a existência de contas
                                             // orçamentárias com uma determinada combinação de
                                             // parâmetros

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      FbSubstCC         : Boolean;           // Substitui Centro de Custo
      FbSubstAP         : Boolean;           // Substitui Atividade de Projeto
      FbSubstPP         : Boolean;           // Substitui Plano Previdenciário
      FbSubstPT         : Boolean;           // Substitui Patrocinador
      FbSubstPR         : Boolean;           // Substitui Programa
      FbSubstTP         : Boolean;           // Substitui Tipo de Despesa
      //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


      FCdsBase          : TClientDataSet;
      FCdsConta         : TClientDataSet;
      FCdsOrigem        : TClientDataSet;
      FCdsDataView      : TClientDataSet;
      FCdsContaEspelho  : TClientDataSet;
      FCdsContaNova     : TClientDataSet;
      FCdsTipoDespesaSel: TClientDataSet;
      FCdsProgramaSel   : TClientDataSet;

      ArqLog : TextFile;
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;


      FAnalisaContasorcamen: boolean;
    FAtualizaNaInsercao: Boolean;
    FUtilizarRotinaVincContabil: boolean;
    FlstContasContab: TStringList;
    FIdGrupoOrcamen: integer;
    FidAnoOrcamento: integer;
    FidPlanoContas: integer;
    FidPlanoOrcamento: integer;
    FCodGrupoOrcamen: string;
    FDescrGrupoOrcamen: string;
    FDesvincularContorcamen: Boolean;

      procedure SetCdsGrupoOrc(const Value: TClientDataSet);
      procedure SetCdsCentRespon(const Value: TClientDataSet);
      procedure SetCdsCentroDeCusto(const Value: TClientDataSet);
      procedure SetCdsAtivProj(const Value: TClientDataSet);
      procedure SetCdsPatro(const Value: TClientDataSet);
      procedure SetCdsPlanoPrev(const Value: TClientDataSet);
      procedure SetCdsBase(const Value: TClientDataSet);
      procedure SetCdsConta(const Value: TClientDataSet);
      procedure SetCdsProgramaSel(const Value: TClientDataSet);
      procedure SetCdsTipoDespesaSel(const Value: TClientDataSet);
      procedure SetCdsOrigem(const Value: TClientDataSet);
      procedure SetCdsDataView(const Value: TClientDataSet);
      procedure SetCdsContaEspelho(const Value: TClientDataSet);
      procedure SetCdsContaNova(const Value: TClientDataSet);
      procedure SetCdsCRSel(const Value: TClientDataSet);
      procedure SetCdsCCSel(const Value: TClientDataSet);
      procedure SetCdsAPSel(const Value: TClientDataSet);
      procedure SetCdsPPSel(const Value: TClientDataSet);
      procedure SetCdsPTSel(const Value: TClientDataSet);
      procedure SetCdsCampoSel(const Value: TClientDataSet);
      procedure SetCdsParamOrc(const Value: TClientDataSet);

      procedure PopulaOrigemContab(pContaOrigem: String);
      procedure PopulaOrigemContaOrc(pContaOrigem: String);
      procedure PopulaOrigemContaRea(pContaOrigem: String);
      procedure PopulaOrigemFluxoCai(pContaOrigem: String);
      procedure PopulaOrigemCondic(pContaOrigem: String);
      procedure PopulaOrigemArqGenerico(pContaOrigem: String);

      procedure GeraCodigo(pArrCodigo : array of TrecCodigo);

      function MontaCodigos(const IDGrupoOrcamen   : Extended;
                             const CodGrupoOrcamen  : String;
                             const bCalculaCodigo   : Boolean;
                             const sNomeBilhete     : String;
                             const bUsaCodCentroCusto : Boolean
                            ): Boolean;

      //Verifica se já existem uma conta orçamentários com os parâmetros definidos
      function  ExisteCombinacao(const IDPlanoOrcamen : Extended;
                                 const IDGrupoOrcamen : Extended;
                                 const sCentroCusto   : String;
                                 const sUnidNegoc     : String;
                                 const sPlano         : String;
                                 const sPatro         : String;
                                 //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                 const sPrograma      : String; {Programa}
                                 const sTipoDespesa   : String {Tipo de Despesa}
                                 //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                ): Boolean;

      function AtualizaTabela(pSql: String): Boolean;


      procedure MontaCodigosCR(const IDGrupoOrcamen   : Extended;
                               const CodGrupoOrcamen  : String;
                               const bCalculaCodigo   : Boolean;
                               const sNomeBilhete     : String
                              );

      function  ExisteCombinacaoCR(const IDPlanoOrcamen : Extended;
                                   const IDGrupoOrcamen : Extended;
                                   const sCentRespon    : String;
                                   const sCentroCusto   : String;
                                   const sUnidNegoc     : String;
                                   const sPlano         : String;
                                   const sPatro         : String
                                ): Boolean;

      function ExcluiContasSemMovim(iIdGrupoOrc: integer): boolean;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      //Rotina alterada para os novos Parâmetros de programa e Tipo de Despesa
      function InsereContaOrcamen(sCodConta,
                                  sCCusto,
                                  sAtivProj,
                                  sIdPlano,
                                  sIdPatro,
                                  //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                  sPrograma,
                                  sTipoDespesa: string;
                                  //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                  iIdEmpresa: integer;
                                  bSubstCC,
                                  bSubstAP,
                                  bSubstPP,
                                  bSubstPT,
                                  //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                  bSubstPrograma,
                                  bSubstTipoDespesa: boolean
                                  //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                  ): boolean;


      function AtualizaContaOrcamen(sCodConta,
                                    sCCusto,
                                    sAtivProj,
                                    sIdPlano,
                                    sIdPatro,
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    sPrograma,
                                    sTipoDespesa: string;
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                    iIdPlanoOrc,
                                    iIdEmpresa: integer;
                                    bSubstCC,
                                    bSubstAP,
                                    bSubstPP,
                                    bSubstPT,
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    bSubstPrograma,
                                    bSubstTipoDespesa: boolean
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                    ): boolean;
      
      //Ricardo de Freitas SOL 153019 KTN: 1147112
      //Excluir\Insere vínculo de planos contábeis com  grupo de forma geral
      function AtualizaPlanosContabilGrupo(iIdGrupoOrc,
                                           iIdPlanoOrc:Integer): boolean;

      //Ricardo de Freitas SOL
      //Excluir as contas orçamentérias que não fazem parte da parametrização
      //selecionada pelo usuário
      function RetirarContOrcamenNaoParam(iIdGrupoOrc,iIdPlanoOrc:Integer): boolean;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      //Mostrar Tela para Análise de contas orçamentárias , das contas geradas
      //pela parametrização;
      function AnalisaContasorcamenGeradas(CodGrupoOrcamen:String;Dados:oleVariant):boolean;


      //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
      //Atualizar composição de contas orçamentárias (contabilidade)
      function AtualizarContasContabporGrupo:boolean;


      procedure SetAnalisaContasorcamen(const Value: boolean);
    procedure SetAtualizaNaInsercao(const Value: Boolean);
    procedure SetUtilizarRotinaVincContabil(const Value: boolean);
    procedure SetlstContasContab(const Value: TStringList);
    procedure SetCodGrupoOrcamen(const Value: string);
    procedure SetDescrGrupoOrcamen(const Value: string);
    procedure SetidAnoOrcamento(const Value: integer);
    procedure SetIdGrupoOrcamen(const Value: integer);
    procedure SetidPlanoContas(const Value: integer);
    procedure SetidPlanoOrcamento(const Value: integer);
    procedure SetDesvincularContorcamen(const Value: Boolean);

   public
      memStatus : TMemo;

      //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
      //Control da Composição de Contas Orçamentárias
      CtrlCadContasContabilPorGrupo: TCtrlCadContasContabilPorGrupo;


      constructor Create;  override;
      destructor  Destroy; override;

      function ListaGrupoOrc       : OleVariant;


      function ListaCentRespon(const iTipo     : Integer = 0;
                               const iPlanoOrc : Integer = 0;
                               const iGrupoOrc : Integer = 0
                              ): OleVariant;

      function ListaCentroDeCusto(const iTipo     : Integer = 0;
                                  const iPlanoOrc : Integer = 0;
                                  const iGrupoOrc : Integer = 0
                                 ): OleVariant;

      // Edilaine - SOL 172383-7764 / KTN 1556975
      function ListaPlanoOrcamento(sIDGrupoOrcamento : string) : OleVariant;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      function ListaPrograma(const iTipo     : Integer = 0;
                             const iPlanoOrc : Integer = 0;
                             const iGrupoOrc : Integer = 0): OleVariant;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      function ListaTipoDespesa(const iTipo     : Integer = 0;
                             const iPlanoOrc : Integer = 0;
                             const iGrupoOrc : Integer = 0): OleVariant;


      function ListaAtivProj(const iTipo     : Integer = 0;
                             const iPlanoOrc : Integer = 0;
                             const iGrupoOrc : Integer = 0
                            ): OleVariant;

      function ListaPatro(const iTipo     : Integer = 0;
                          const iPlanoOrc : Integer = 0;
                          const iGrupoOrc : Integer = 0
                         ): OleVariant;

      function ListaPlanoPrev(const iTipo     : Integer = 0;
                              const iPlanoOrc : Integer = 0;
                              const iGrupoOrc : Integer = 0
                             ): OleVariant;

      function Exclusao           : Boolean;
      function Alteracao(edtContaText  : String;
                         cboCampoValue : String
                        ): Boolean;

      function  AlteraCampo(pContaOrigem   : String;
                            pCampos        : array of String;
                            pcboCampoValue : String
                           ): Boolean;

      function  AlteraContab(pContaOrigem: String): Boolean;
      function  AlteraContaOrc(pContaOrigem: String): Boolean;
      function  AlteraContaRea(pContaOrigem: String): Boolean;
      function  AlteraFluxoCai(pContaOrigem: String): Boolean;
      function  AlteraCondic(pContaOrigem: String): Boolean;

      function  AlteraArqGenerico(pContaOrigem: String): Boolean;

      function  TamanhoMinimo(pCdsLocal : TDataSet;
                              pLtvSelec : TListView;
                              pCampo    : String
                             ): Integer;

      procedure BuscaContas(pLogar : Boolean);

      procedure PopulaOrigem(pContaOrigem : String);

      procedure GravaLog(pLog : String);

      procedure Estimar(pInserir : Boolean);

      function  Inclusao(pedtContaText : String;
                         pArrCodigo : array of TrecCodigo;
                         pLtvSelec  : TListView
                        ): Boolean;

      function  GravarGrupoOrc(const IDGrupoOrcamen  : Extended;
                               const CodGrupoOrcamen : String;
                               const IDContaOrcamen  : String;
                               const sPath           : String;
                               const bSubstCC        : Boolean;
                               const bSubstAP        : Boolean;
                               const bSubstPP        : Boolean;
                               const bSubstPT        : Boolean;
                               //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                               const bSubstPR        : Boolean; {Programa}
                               const bSubstTP        : Boolean; {Tipo de Despesa}
                               //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                               const sNomeBilhete    : String;
                               Operacao : TOperacao): Boolean;

      function  AlteracaoNova(const IDContaEspelho  : String;
                              const IDGrupoOrcamen  : String;
                              const CodGrupoOrcamen : String;
                              const IDEmpresProp    : String;
                              const sPath           : String;
                              const bSubstCompConta : Boolean;
                              const bSubstCC        : Boolean;
                              const bSubstAP        : Boolean;
                              const bSubstPP        : Boolean;
                              const bSubstPT        : Boolean;
                              const sNomeBilhete    : String
                             ): Boolean;

      function InativaGrupoOrcamentario(bInativar: boolean; iIdGrupoOrc,iIdPlanoOrc: integer): boolean;


      function  ExcluiCompContas(const IDPlanoOrcamen  : String;
                                 const IDContaNova     : String
                                ): Boolean;



      function  ExclusaoNova(const IDGrupoOrcamen  : String;
                             const CodGrupoOrcamen : String;
                             const IDEmpresProp    : String;
                             const sPath           : String;
                             const bSubstCC        : Boolean;
                             const bSubstAP        : Boolean;
                             const bSubstPP        : Boolean;
                             const bSubstPT        : Boolean;
                             const sNomeBilhete    : String
                            ): Boolean;

      function  InclusaoNovaCR(const IDGrupoOrcamen  : Extended;
                               const CodGrupoOrcamen : String;
                               const IDContaOrcamen  : String;
                               const sPath           : String;
                               const bSubstCR        : Boolean;
                               const bSubstCC        : Boolean;
                               const bSubstAP        : Boolean;
                               const bSubstPP        : Boolean;
                               const bSubstPT        : Boolean;
                               const sNomeBilhete    : String
                              ): Boolean;

      function  AlteracaoNovaCR(const IDContaEspelho  : String;
                                const IDGrupoOrcamen  : String;
                                const CodGrupoOrcamen : String;
                                const IDEmpresProp    : String;
                                const sPath           : String;
                                const bSubstCompConta : Boolean;
                                const bSubstCR        : Boolean;
                                const bSubstCC        : Boolean;
                                const bSubstAP        : Boolean;
                                const bSubstPP        : Boolean;
                                const bSubstPT        : Boolean;
                                const sNomeBilhete    : String
                               ): Boolean;

      function  ExclusaoNovaCR(const IDGrupoOrcamen  : String;
                               const CodGrupoOrcamen : String;
                               const IDEmpresProp    : String;
                               const sPath           : String;
                               const bSubstCR        : Boolean;
                               const bSubstCC        : Boolean;
                               const bSubstAP        : Boolean;
                               const bSubstPP        : Boolean;
                               const bSubstPT        : Boolean;
                               const sNomeBilhete    : String
                              ): Boolean;

      procedure ExcluiContaEspelho;

      property CntStatus        : Integer        read FCntStatus        write FCntStatus Default 0;
      property pIdEmpresa       : Double         read FIdEmpresa        write FIdEmpresa;
      property pPlano           : Double         read FPlano            write FPlano;

      property CdsGrupoOrc      : TClientDataSet read FCdsGrupoOrc      write SetCdsGrupoOrc;

      property CdsCentRespon    : TClientDataSet read FCdsCentRespon    write SetCdsCentRespon;

      property CdsCentroDeCusto : TClientDataSet read FCdsCentroDeCusto write SetCdsCentroDeCusto;
      property CdsAtivProj      : TClientDataSet read FCdsAtivProj      write SetCdsAtivProj;
      property CdsPlanoPrev     : TClientDataSet read FCdsPlanoPrev     write SetCdsPlanoPrev;
      property CdsPatro         : TClientDataSet read FCdsPatro         write SetCdsPatro;

      property CdsCRSel         : TClientDataSet read FCdsCRSel         write SetCdsCRSel;
      property CdsCCSel         : TClientDataSet read FCdsCCSel         write SetCdsCCSel;
      property CdsAPSel         : TClientDataSet read FCdsAPSel         write SetCdsAPSel;
      property CdsPPSel         : TClientDataSet read FCdsPPSel         write SetCdsPPSel;
      property CdsPTSel         : TClientDataSet read FCdsPTSel         write SetCdsPTSel;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      //CLientdataset de programas Selecionados
      property CdsProgramaSel         : TClientDataSet read FCdsProgramaSel write SetCdsProgramaSel;
      //CLientdataset de Tipo de Despesa Selecionados
      property CdsTipoDespesaSel      : TClientDataSet read FCdsTipoDespesaSel write SetCdsTipoDespesaSel;
      //Ricardo de Freitas SOL: 159212 - Kintana 1337867 = fim


      property CdsCampoSel      : TClientDataSet read FCdsCampoSel      write SetCdsCampoSel;
      property CdsParamOrc      : TClientDataSet read FCdsParamOrc      write SetCdsParamOrc;

      property CdsBase          : TClientDataSet read FCdsBase          write SetCdsBase;
      property CdsConta         : TClientDataSet read FCdsConta         write SetCdsConta;
      property CdsOrigem        : TClientDataSet read FCdsOrigem        write SetCdsOrigem;
      property CdsDataView      : TClientDataSet read FCdsDataView      write SetCdsDataView;

      property CdsContaEspelho  : TClientDataSet read FCdsContaEspelho  write SetCdsContaEspelho;
      property CdsContaNova     : TClientDataSet read FCdsContaNova     write SetCdsContaNova;

      //Ricardo SOL: 159242/6041 KINTANA 1385831
      property IdGrupoOrcamen             :integer  read FIdGrupoOrcamen    write SetIdGrupoOrcamen;    //Id do Grupo orçamentário
      property CodGrupoOrcamen            :string   read FCodGrupoOrcamen   write SetCodGrupoOrcamen;   //Código do Grupo orçamentário
      property DescrGrupoOrcamen          :string   read FDescrGrupoOrcamen write SetDescrGrupoOrcamen; //Descrição do Grupo orçamentário
      property idPlanoOrcamento           :integer  read FidPlanoOrcamento  write SetidPlanoOrcamento;  //Id do Plano orçamentário
      property idAnoOrcamento             :integer  read FidAnoOrcamento    write SetidAnoOrcamento;    //Ano Vigente do Plano orçamentário
      property idPlanoContas              :integer  read FidPlanoContas     write SetidPlanoContas;     //Id do Plano de Contas Vigente (contabilidade)
      property lstContasContab            :TStringList read FlstContasContab   write SetlstContasContab;//Lista de Contas Contábeia a serem vinculadas ao grupo Orçamentário
      property UtilizarRotinaVincContabil :boolean read FUtilizarRotinaVincContabil write SetUtilizarRotinaVincContabil; //Para gravar na CompContasOrcamen, utilizar a rotina específica na control: CtrlCadContasContabilPorGrupo
      property AtualizaNaInsercao         :Boolean read FAtualizaNaInsercao write SetAtualizaNaInsercao; //Mesmo no modo de inserção, caso o conta orçamentária já esteja cadastrada,este conta orçamentária deverá ser atualizada
      property DesvincularContorcamen     :Boolean  read FDesvincularContorcamen write SetDesvincularContorcamen; //Executar nova rotina de desvinculação com a contabilidade
      //Ricardo SOL: 159242/6041 KINTANA 1385831 - fim

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      //Exibe Formulário onde exibe os códigos de contas orçamentárias gerados
      //conforme os parãmetros e parametrização orçamnetária
      property AnalisaContasorcamen:boolean read FAnalisaContasorcamen write SetAnalisaContasorcamen;

   end;



implementation
uses
   uFuncoesOrcamento,FCadContasOrcPorGrupoAuxMT;



procedure TCtrlCadContasOrcPorGrupo.onCreateAppServer;
begin
   inherited;

   CdsGrupoOrc         := TClientDataSet.Create(nil);
   CdsBase             := TClientDataSet.Create(nil);
   CdsOrigem           := TClientDataSet.Create(nil);
   CdsCentroDeCusto    := TClientDataSet.Create(nil);
   CdsAtivProj         := TClientDataSet.Create(nil);
   CdsPatro            := TClientDataSet.Create(nil);
   CdsPlanoPrev        := TClientDataSet.Create(nil);
   CdsCRSel            := TClientDataSet.Create(nil);
   CdsCCSel            := TClientDataSet.Create(nil);
   CdsAPSel            := TClientDataSet.Create(nil);
   CdsPPSel            := TClientDataSet.Create(nil);
   CdsPTSel            := TClientDataSet.Create(nil);
   CdsCampoSel         := TClientDataSet.Create(nil);
   CdsParamOrc         := TClientDataSet.Create(nil);

   //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
   FAtualizaNaInsercao        := false;
   UtilizarRotinaVincContabil := false;
   FDesvincularContorcamen    := false;
   //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831 - fim

   memStatus           := TMemo.Create(nil);
   AtualizarLog        := False;
end;



procedure TCtrlCadContasOrcPorGrupo.DoChangeDataBase;
begin
   inherited;
   dbDataView.DatabaseName := DataBaseName;
end;



constructor TCtrlCadContasOrcPorGrupo.Create;
begin
   inherited;

   dbDataView        := TdbDataView.Create(Self);

   cdsCodigo         := TClientDataSet.Create(nil);
   cdsExiste         := TClientDataSet.Create(nil);

   CdsConta          := TClientDataSet.Create(nil);
   CdsDataView       := TClientDataSet.Create(nil);

   cdsContaEspelho   := TClientDataSet.Create(nil);
   cdsContanova      := TClientDataSet.Create(nil);

   AtualizarLog := True;


   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(Padroes);
end;



destructor TCtrlCadContasOrcPorGrupo.Destroy;
begin
   inherited;

   CdsConta.Free;
   CdsDataView.Free;

   cdsContaEspelho.Free;
   cdsContanova.Free;


   FreeAndNil(CtrlPlanPrevContabPatro);

   if (isAppServer) then
   begin
      FreeCds([CdsCentroDeCusto,
               CdsAtivProj,
               CdsPatro,
               CdsPlanoPrev,
               CdsGrupoOrc,
               CdsBase,
               CdsOrigem,
               CdsCRSel,
               CdsCCSel,
               CdsAPSel,
               CdsPPSel,
               CdsPTSel,
               CdsCampoSel,
               CdsParamOrc,
               cdsCodigo,
               cdsExiste]
             );

      memStatus.Free;
   end;
end;



// -------------------------------------------------------------------------------------------------
function TCtrlCadContasOrcPorGrupo.ListaGrupoOrc : OleVariant;
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;
   try
      SqlLocal.Add('SELECT');
      SqlLocal.Add('  NOMEGRUPOORCAMEN AS NOME, IDGRUPOORCAMEN,');
      SqlLocal.Add('  FLGANALSINT,    CODGRUPOORC,');
      SqlLocal.Add('  FLGSINALGRUPO');
      SqlLocal.Add('FROM');
      SqlLocal.Add('  GRUPOORCAMEN');
      SqlLocal.Add('ORDER BY');
      SqlLocal.Add('  NOME');

      Result := GetDataPacket(SqlLocal.Text);
   except
      on E:Exception do MessageInfo := E.Message;
   end;
   SqlLocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.ListaCentRespon(const iTipo     : Integer = 0;
                                                   const iPlanoOrc : Integer = 0;
                                                   const iGrupoOrc : Integer = 0
                                                  ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                            + #13 +
      '   NOME AS NOME, CODCENTRORESPON, CODEXTERNO '                      + #13 +
      'FROM '                                                              + #13 +
      '   CENTRESPON '                                                     + #13 +
      'WHERE '                                                             + #13 +
      '       IDPESSOA        = ' + FloatToStr(pIdEmpresa)                 + #13 +
      '   AND IDPLANCRESPON   = (SELECT IDPLANCRESPON FROM PARAMGLOBAL) '  + #13 +
      '   AND ANALITICOSINTET = ''A'' '                                    + #13 +
      '   AND ATIVO           = ''S'' '                                    + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND CODCENTRORESPON NOT IN '                            + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTRORESPON '                                + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

      2: sSQL := sSQL +
      '   AND CODCENTRORESPON IN '                                + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTRORESPON  '                               + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaCentroDeCusto(const iTipo     : Integer = 0;
                                                      const iPlanoOrc : Integer = 0;
                                                      const iGrupoOrc : Integer = 0
                                                     ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      //Marilza Colpani 26/03/2009 N.Sol 109826/N.Kintana 498982
      //inclusão da condição DISTINCT
      'SELECT DISTINCT'                                                            + #13 +
      '   trim(NOME) || decode(STATUSGRUPOCDC,''S'','' *'','''') || decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME,'     + #13 +
      '   CODCENTROCUSTO, CODEXTERNO '                                     + #13 +
      'FROM '                                                              + #13 +
      '   CENTCUST '                                                       + #13 +
      'WHERE '                                                             + #13 +
      '       IDEMPRESA       = ' + FloatToStr(pIdEmpresa)                 + #13 +
      '   AND IDPLANCENTCUST  = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL) ' + #13 ;

      //------------------------------------------------------------------------------
      // Alterado por FHBS - SOL: 151628 KTN: 1115224
      //------------------------------------------------------------------------------
      // Como existia valores lançados nos centros de custos inativos então
      // foi retirada as as condições abaixo para que o usuário possa
      // incluir qualquer centro de custo no cadastro de Contas Orçamentárias por Grupo.
      //------------------------------------------------------------------------------
      //'   AND STATUSGRUPOCDC  = ''A'' '                                    + #13 +
      //'   AND ATIVO           = ''S'' '                                    + #13;
      //------------------------------------------------------------------------------
      // Fim - Alterado por FHBS - SOL: 151628 KTN: 1115224
      //------------------------------------------------------------------------------

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND CODCENTROCUSTO  NOT IN '                            + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTROCUSTO '                                 + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDEMPRESA      = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   AND CODCENTROCUSTO  IN '                                + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          CODCENTROCUSTO '                                 + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDEMPRESA      = ' + FloatToStr(pIdEmpresa)  + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL + 'ORDER BY NOME ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaAtivProj(const iTipo     : Integer = 0;
                                                 const iPlanoOrc : Integer = 0;
                                                 const iGrupoOrc : Integer = 0
                                                ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                   + #13 +

      //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
      'trim(NOME) || decode(UNETIPO,' + QuotedStr('S') + ',' +    QuotedStr('*') +   ',' + QuotedStr('') + ') as NOME,' + #13 +

      ' UNIDNEGOC, UNETIPO, CODORCAMEN AS UNECODIGO '  + #13 +

      'FROM '                                                     + #13 +
      '   UNIDNEGOCIO '                                           + #13 +
      'WHERE '                                                    + #13 +
      '       IDPESSOA = ' + FloatToStr(pIdEmpresa)               + #13 ;
      //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831 - comentado
      //'   AND UNETIPO  = ''A'' '                                  + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND UNIDNEGOC NOT IN '                                  + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          UNIDNEGOC '                                      + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND UNIDNEGOC IS NOT NULL '                      + #13 +
      '       ) ';

         2: sSQL := sSQL +
      '   AND UNIDNEGOC IN '                                      + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          UNIDNEGOC '                                      + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND UNIDNEGOC IS NOT NULL '                      + #13 +
      '       ) ';

      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaPlanoPrev(const iTipo     : Integer = 0;
                                                  const iPlanoOrc : Integer = 0;
                                                  const iGrupoOrc : Integer = 0
                                                 ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                   + #13 +
      '   NOME AS NOME, IDPLANOPREV, CODORCAMENTO '               + #13 +
      'FROM '                                                     + #13 +
      '   PLANPREVCONTABIL '                                      + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      'WHERE '                                                    + #13 +

      '   ATIVO = ''S''   AND ' +
      
      '   IDPLANOPREV NOT IN '                                    + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPLANOPREV '                                    + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDPLANOPREV IS NOT NULL '                    + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      'WHERE '                                                    + #13 +

      '   ATIVO = ''S''   AND ' +

      '   IDPLANOPREV IN '                                        + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPLANOPREV '                                    + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDPLANOPREV IS NOT NULL '                    + #13 +
      '       ) '                                                 + #13;
      else
         sSQL := sSQL + ' WHERE ATIVO = ''S'' ';
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);
   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;



function TCtrlCadContasOrcPorGrupo.ListaPatro(const iTipo     : Integer = 0;
                                              const iPlanoOrc : Integer = 0;
                                              const iGrupoOrc : Integer = 0
                                             ): OleVariant;
var
   sSQL : String;
begin
   try
      sSQL :=
      'SELECT '                                                   + #13 +
      '   P.NOME AS NOME, PT.IDPESSOA, PT.CODORCAMENTO '          + #13 +
      'FROM '                                                     + #13 +
      '   PESSOA P, '                                             + #13 +
      '   PATRO  PT '                                             + #13 +
      'WHERE '                                                    + #13 +
      '      P.IDPESSOA   = PT.IDPESSOA '                         + #13;

//    0: Todos
//    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
//    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)

      case iTipo of

         1: sSQL := sSQL +
      '   AND PT.IDPESSOA NOT IN '                                + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPATRO '                                        + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDPATRO IS NOT NULL '                        + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   AND PT.IDPESSOA IN '                                    + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPATRO '                                        + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDPATRO IS NOT NULL '                        + #13 +
      '       ) '                                                 + #13;
      end;

      sSQL := sSQL +
      'ORDER BY '                                                 + #13 +
      '   NOME ';

      Result := GetDataPacket(sSQL);
   except
      on E:Exception do MessageInfo := E.Message;
   end;
end;


procedure TCtrlCadContasOrcPorGrupo.BuscaContas(pLogar : Boolean);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
     if (pLogar) then GravaLog(' Selecionando contas');

     sqlLocal.Clear;
     sqlLocal.Add('SELECT');
     sqlLocal.Add('  IDCONTAORCAMEN, NOMECONTAORCAMEN, IDDATAVIEW');
     sqlLocal.Add('FROM');
     sqlLocal.Add('  CONTASORCAMEN');
     sqlLocal.Add('WHERE');

     if (CdsBase.FieldByName('BASGRUP').AsString <> '') then sqlLocal.Add('  IDGRUPOORCAMEN = ' + Trim(CdsBase.FieldByName('BASGRUP').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASCENT').AsString <> '') then sqlLocal.Add('  CODCENTROCUSTO = ' + QuotedStr(CdsBase.FieldByName('BASCENT').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASATIV').AsString <> '') then sqlLocal.Add('  UNIDNEGOC      = ' + Trim(CdsBase.FieldByName('BASATIV').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASPLAN').AsString <> '') then sqlLocal.Add('  IDPLANOPREV    = ' + Trim(CdsBase.FieldByName('BASPLAN').AsString) + ' AND')  ;
     if (CdsBase.FieldByName('BASPATR').AsString <> '') then sqlLocal.Add('  IDPATRO        = ' + Trim(CdsBase.FieldByName('BASPATR').AsString) + ' AND')  ;

     sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano));
     sqlLocal.Add('ORDER BY');
     sqlLocal.Add('  IDCONTAORCAMEN');

     CdsConta.Close;
     CdsConta.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



function TCtrlCadContasOrcPorGrupo.Exclusao: Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';

   Atualizados := 0;

   sqlLocal := TStringList.Create;
   try
      GravaLog('- Exclusão - iniciando');

      StartTransaction;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         //-----------------------------
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase

         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            GravaLog('  Conta - ' + CdsConta.FieldByName('IDCONTAORCAMEN').AsString);

            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  SALDOORCADO');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);

            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);

            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  CONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);

            Inc (Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      MessageInfo := MessageInfo + 'Foram excluídas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Exclusão concluída';

      GravaLog(' ' + MessageInfo);

      Result := True;

   except
      on E:Exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.Alteracao(edtContaText  : String;
                                             cboCampoValue : String
                                            ): Boolean;
begin
   if      (cboCampoValue = 'TRS') then Result := AlteraCampo(edtContaText, ['TIPOCALCREALIZADO'], cboCampoValue)
   else if (cboCampoValue = 'TOS') then Result := AlteraCampo(edtContaText, ['TIPOCALCORCADO'], cboCampoValue)
   else if (cboCampoValue = 'SCS') then Result := AlteraCampo(edtContaText, ['FLGSINALCONTA'], cboCampoValue)
   else if (cboCampoValue = 'VAS') then Result := AlteraCampo(edtContaText, ['FLGACUMULADO'], cboCampoValue)
   else if (cboCampoValue = 'DID') then Result := AlteraCampo(edtContaText, ['DATAINATIVA'], cboCampoValue)
   else if (cboCampoValue = 'DRD') then Result := AlteraCampo(edtContaText, ['DATAATIVA'], cboCampoValue)
   else if (cboCampoValue = 'CIS') then Result := AlteraCampo(edtContaText, ['FLGATIVA'], cboCampoValue)
   else if (cboCampoValue = 'OMS') then Result := AlteraCampo(edtContaText, ['FLGCONTAMONETARIA'], cboCampoValue)
   else if (cboCampoValue = 'EES') then Result := AlteraCampo(edtContaText, ['FLGTRANSFSALDO'], cboCampoValue)
   else if (cboCampoValue = 'FAS') then Result := AlteraCampo(edtContaText, ['FORMULAORCADO', 'FORMULAREALIZADO'], cboCampoValue)
   else if (cboCampoValue = 'FIF') then Result := AlteraCampo(edtContaText, ['VLRINFORMADOORC', 'VLRINFORMADOREAL'], cboCampoValue)
   else if (cboCampoValue = 'OBS') then Result := AlteraCampo(edtContaText, ['OBSERVACAO'], cboCampoValue)
   else if (cboCampoValue = 'CRS') then Result := AlteraCampo(edtContaText, ['CODCENTRORESPon'], cboCampoValue)
   else if (cboCampoValue = 'CTL') then Result := AlteraContab(edtContaText)
   else if (cboCampoValue = 'COL') then Result := AlteraContaOrc(edtContaText)
   else if (cboCampoValue = 'CRL') then Result := AlteraContaRea(edtContaText)
   else if (cboCampoValue = 'FCL') then Result := AlteraFluxoCai(edtContaText)
   else if (cboCampoValue = 'CDL') then Result := AlteraCondic(edtContaText)
   else if (cboCampoValue = 'AGL') then Result := AlteraArqGenerico(edtContaText)
   else begin
      Result      := False;
      MessageInfo := 'Campo desconhecido - ' + cboCampoValue;
      GravaLog(' ' + MessageInfo);
   end;
end;



function  TCtrlCadContasOrcPorGrupo.AlteraCampo(pContaOrigem   : String;
                                                pCampos        : array of String;
                                                pcboCampoValue : String
                                               ): Boolean;
var
   sqlLocal    : TStringList;
   Posicao     : Integer;
   Atualizados : Integer;
   Mascara     : String;
   Conteudo    : String;
begin
   MessageInfo := '';

   sqlLocal := TStringList.Create;
   try
      StartTransaction;

      PopulaOrigem(pContaOrigem);

      GravaLog('- Alteração - ' + pcboCampoValue);
      //-------------------------------

      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while (not CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('UPDATE');
            sqlLocal.Add('  CONTASORCAMEN');
            sqlLocal.Add('SET');

            for Posicao := 0 to Length(pCampos) - 1 do
            begin
               if (pcboCampoValue[3] = 'D') then   // Data
               begin
                  Conteudo := CdsOrigem.FieldByName(pCampos[Posicao]).AsString;

                  if      (Length(Conteudo) <= 10) then Mascara := 'dd/mm/yyyy'
                  else if (Length(Conteudo) <= 16) then Mascara := 'dd/mm/yyyy hh24:mi'
                  else                                  Mascara := 'dd/mm/yyyy hh24:mi:ss';

                  Conteudo := 'TO_DATE(' + QuotedStr(Conteudo) + ', ' + QuotedStr(Mascara) + ')';
               end
               else  // String / Float
               begin
                  Conteudo := QuotedStr(CdsOrigem.FieldByName(pCampos[Posicao]).AsString);
                  Mascara  := '';
               end;

               if (Posicao = (Length(pCampos) - 1)) then
               begin
                  sqlLocal.Add('  ' + pCampos[Posicao] + ' = ' + Conteudo);
               end
               else
               begin
                  sqlLocal.Add('  ' + pCampos[Posicao] + ' = ' + Conteudo + ',');
               end;
            end;

            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));
            AtualizaTabela(sqlLocal.Text);
            Inc(Atualizados);
            //-----------------------------
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;
      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';

      GravaLog(' ' + MessageInfo);

      Result := True;
   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraContab(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - CTL');

      StartTransaction;
      //----------------------------- Busca as contas contábeis da conta origem
      GravaLog('  Lendo dados de origem');

      PopulaOrigemContab(pContaOrigem);
      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  PLACONTA IS NOT NULL');

            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDPESSOA,        IDEMPRESA,');
               sqlLocal.Add('    PLANO,           PLACONTA,       CODCENTROCUSTO,');
               sqlLocal.Add('    UNIDNEGOC,       IDPLANOPREV,    IDPATRO)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  ' + FloatToStr(pIdEmpresa) + ',');
               sqlLocal.Add('  ' + FloatToStr(pIdEmpresa) + ',');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('PLANO').AsFloat) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsOrigem.FieldByName('PLACONTA').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat)+ '))');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraContaOrc(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';

   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - COL');

      StartTransaction;

      //----------------------------- Busca as contas de orçado da conta origem
      GravaLog(' Lendo dados de origem');

      PopulaOrigemContaOrc(pContaOrigem);

      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  IDCONTAREFORCADO IS not NULL');

            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC,  IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDCONTAREFORCADO, PERCCONTAREFORC)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTAREFORCADO').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTAREFORCADO').AsString)+ '),');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('PERCCONTAREFORC').AsFloat) + ')');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + #13 + #10 + E.Message;
        GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraContaRea(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - CRL');

      StartTransaction;

      //----------------------------- Busca as contas de realizado da conta origem
      GravaLog('  Lendo dados de origem');

      PopulaOrigemContaRea(pContaOrigem);

      Atualizados := 0;

      CdsBase.First;
      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  IDCONTAREFREAL IS NOT NULL');
            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC,  IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDCONTAREFREAL, PERCCONTAREFREA)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTAREFREAL').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTAREFREAL').AsString)+ '),');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('PERCCONTAREFREA').AsFloat) + ')');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + #13 + #10 + E.Message;
        GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraFluxoCai(pContaOrigem : String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal    := TStringList.Create;

   try
      GravaLog('- Alteração - FCL');

      StartTransaction;

      //----------------------------- Busca as contas de fluxo de caixa da conta origem
      GravaLog('  Lendo dados de origem');
      PopulaOrigemFluxoCai(pContaOrigem);
      Atualizados := 0;
      CdsBase.First;

      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin

         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------
         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  CODTIPRECDES IS NOT NULL');
            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    CODTIPRECDES,    RECPAG,         CODCENTRORESPON,');
               sqlLocal.Add('    IDPLANOPREV,     IDPATRO,        UNIDNEGOC,');
               sqlLocal.Add('    CODCENTROCUSTO,  IDPESSOA,        IDEMPRESA)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODTIPRECDES').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODTIPRECDES').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('RECPAG').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('RECPAG').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODCENTRORESPon').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODCENTRORESPon').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPLANOPREV').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('IDPATRO').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat) + ', 0, NULL, ' +
                                            FloatToStr(CdsOrigem.FieldByName('UNIDNEGOC').AsFloat)+ '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString) + ', 0, NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CODCENTROCUSTO').AsString)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(pIdEmpresa ) + ', 0, NULL, ' +
                                            FloatToStr(pIdEmpresa)+ '),');
               sqlLocal.Add('  DECODE(' + FloatToStr(pIdEmpresa) + ', 0, NULL, ' +
                                            FloatToStr(pIdEmpresa)+ '))');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;

      GravaLog(' ' + MessageInfo);

   except
      on E:exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + #13 + #10 + E.Message;
        GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraCondic(pContaOrigem: String): Boolean;
var
   sqlLocal    : TStringList;
   Atualizados : Integer;
begin
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   try
      GravaLog('- Alteração - CDL');

      StartTransaction;

      //----------------------------- Busca as condições da conta origem
      GravaLog('  Lendo dados de origem');
      PopulaOrigemCondic(pContaOrigem);
      Atualizados := 0;
      CdsBase.First;

      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase

         //-----------------------------

         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            sqlLocal.Clear;
            sqlLocal.Add('DELETE FROM');
            sqlLocal.Add('  COMPCONTASORCAMEN');
            sqlLocal.Add('WHERE');
            sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ' AND');
            sqlLocal.Add('  IDCONTACONDINI IS NOT NULL');
            AtualizaTabela(sqlLocal.Text);

            CdsOrigem.First;
            while not(CdsOrigem.EOF) and (memStatus.Tag = 0) do
            begin
               sqlLocal.Clear;
               sqlLocal.Add('INSERT INTO');
               sqlLocal.Add('  COMPCONTASORCAMEN');
               sqlLocal.Add('  (IDCOMPCONTASORC, IDPLANOORCAMEN, IDCONTAORCAMEN,');
               sqlLocal.Add('    IDCONTACONDINI,  IDCONTACONDFIM, IDCONTACONDRES,');
               sqlLocal.Add('    TIPOCONDINI,     TIPOCONDRES,    CONDICAO,');
               sqlLocal.Add('    VLRCONDINI,      VLRCONDRES)');
               sqlLocal.Add('  VALUES (');
               sqlLocal.Add('  ' + FloatToStr(GetSequence('COMPCONTASORCAMEN')) + ',');
               sqlLocal.Add('  ' + FloatToStr(pPlano) + ',');
               sqlLocal.Add('  ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString) + ',');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTACONDINI').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTACONDINI').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTACONDFIM').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTACONDFIM').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('IDCONTACONDRES').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('IDCONTACONDRES').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('TIPOCONDINI').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('TIPOCONDINI').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('TIPOCONDRES').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('TIPOCONDRES').AsString) + '),');
               sqlLocal.Add('  DECODE(' + QuotedStr(CdsOrigem.FieldByName('CONDICAO').AsString) + ', '''', NULL, ' +
                                            QuotedStr(CdsOrigem.FieldByName('CONDICAO').AsString) + '),');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('VLRCONDINI').AsFloat) + ',');
               sqlLocal.Add('  ' + FloatToStr(CdsOrigem.FieldByName('VLRCONDRES').AsFloat) + ')');

               AtualizaTabela(sqlLocal.Text);
               //-----------------------------
               CdsOrigem.Next;
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;

      Commit;

      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;
      GravaLog(' ' + MessageInfo);

   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



function TCtrlCadContasOrcPorGrupo.AlteraArqGenerico(pContaOrigem: String): Boolean;
var
  sqlLocal    : TCMSqlParams;
  Atualizados : Integer;
  IdDataView  : Double;
begin
   MessageInfo := '';
   sqlLocal    := TCMSqlParams.Create(nil);
   try
      GravaLog('- Alteração - AGL');

      StartTransaction;

      //----------------------------- Busca o texto de busca da conta origem
      GravaLog('  Lendo dados de origem');
      PopulaOrigemArqGenerico(pContaOrigem);
      Atualizados := 0;
      CdsBase.First;

      while not(CdsBase.EOF) and (memStatus.Tag = 0) do
      begin
         BuscaContas(True);     // Busca os contas orçamentárias para o registro atual do cdsbase
         //-----------------------------

         while not(CdsConta.EOF) and (memStatus.Tag = 0) do
         begin
            if CdsOrigem.IsEmpty then
            begin
               IdDataView := 0;
            end
            else
            begin
               IdDataView := GetSequence('DATAVIEW');

               with CdsDataView do
               begin
                  EmptyDataSet;
                  Append;
                  FieldByName('IDDATAVIEW').AsFloat        := IdDataView;
                  FieldByName('CLASSNAME').AsString        := CdsOrigem.FieldByName('CLASSNAME').AsString;
                  FieldByName('TEMPLATE').AsString         := CdsOrigem.FieldByName('TEMPLATE').AsString;
                  FieldByName('NAME').AsString             := CdsOrigem.FieldByName('NAME').AsString;
                  FieldByName('CLASSDESCRIPTION').AsString := CdsOrigem.FieldByName('CLASSDESCRIPTION').AsString;
                  FieldByName('DESCRIPTION').AsString      := CdsOrigem.FieldByName('DESCRIPTION').AsString;
                  Post;
               end;

               // Transformar este applycds em sql local
               ApplyCds(CdsDataView, dbDataView, [], [])
            end;

            sqlLocal.SQL.Clear;
            sqlLocal.SQL.Add('UPDATE');
            sqlLocal.SQL.Add('  CONTASORCAMEN');
            sqlLocal.SQL.Add('SET');
            sqlLocal.SQL.Add('  IDDATAVIEW = DECODE(' + FloatToStr(IdDataView) + ', 0, NULL, ' +
                                                          FloatToStr(IdDataView) + '),');
            sqlLocal.SQL.Add('  ORIGEMCMDV = ''0''');
            sqlLocal.SQL.Add('WHERE');
            sqlLocal.SQL.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
            sqlLocal.SQL.Add('  IDCONTAORCAMEN = ' + QuotedStr(CdsConta.FieldByName('IDCONTAORCAMEN').AsString));

            AtualizaTabela(sqlLocal.SQL.Text);

            if not(CdsConta.FieldByName('IDDATAVIEW').IsNull) then
            begin
               sqlLocal.SQL.Clear;
               sqlLocal.SQL.Add('DELETE FROM');
               sqlLocal.SQL.Add('  DATAVIEW');
               sqlLocal.SQL.Add('WHERE');
               sqlLocal.SQL.Add('  IDDATAVIEW = ' + FloatToStr(CdsConta.FieldByName('IDDATAVIEW').AsFloat) + ' AND');
               sqlLocal.SQL.Add('  ORIGEMCMDV = ''0''');
               AtualizaTabela(sqlLocal.SQL.Text);
            end;
            Inc(Atualizados);
            CdsConta.Next;
         end;
         CdsBase.Next;
      end;
      Commit;
      MessageInfo := 'Foram atualizadas ' + IntToStr(Atualizados) + ' contas orçamentárias' + #13 + #10 +
                     ' Alteração concluída';
      Result := True;
      GravaLog(' ' + MessageInfo);
   except
      on E:exception do
      begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + #13 + #10 + E.Message;
         GravaLog(' ' + MessageInfo);
      end;
   end;
   sqllocal.Free;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigem(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  NVL(IDGRUPOORCAMEN   , '''') AS IDGRUPOORCAMEN   ,');
      sqlLocal.Add('  NVL(NOMECONTAORCAMEN , '''') AS NOMECONTAORCAMEN ,');
      sqlLocal.Add('  NVL(TIPOCALCREALIZADO, '''') AS TIPOCALCREALIZADO,');
      sqlLocal.Add('  NVL(TIPOCALCORCADO   , '''') AS TIPOCALCORCADO   ,');
      sqlLocal.Add('  NVL(FLGSINALCONTA    , '''') AS FLGSINALCONTA    ,');
      sqlLocal.Add('  NVL(FLGACUMULADO     , '''') AS FLGACUMULADO     ,');
      sqlLocal.Add('  NVL(DATAINATIVA      , '''') AS DATAINATIVA      ,');
      sqlLocal.Add('  NVL(DATAATIVA        , '''') AS DATAATIVA        ,');
      sqlLocal.Add('  NVL(FLGATIVA         , '''') AS FLGATIVA         ,');
      sqlLocal.Add('  NVL(FLGCONTAMONETARIA, '''') AS FLGCONTAMONETARIA,');
      sqlLocal.Add('  NVL(FLGTRANSFSALDO   , '''') AS FLGTRANSFSALDO   ,');
      sqlLocal.Add('  NVL(FORMULAORCADO    , '''') AS FORMULAORCADO    ,');
      sqlLocal.Add('  NVL(FORMULAREALIZADO , '''') AS FORMULAREALIZADO ,');
      sqlLocal.Add('  NVL(VLRINFORMADOORC  , '''') AS VLRINFORMADOORC  ,');
      sqlLocal.Add('  NVL(VLRINFORMADOREAL , '''') AS VLRINFORMADOREAL ,');
      sqlLocal.Add('  NVL(OBSERVACAO       , '''') AS OBSERVACAO       ,');
      sqlLocal.Add('  NVL(CODCENTRORESPON  , '''') AS CODCENTRORESPON   ');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  CONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem));
      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContab(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  PLANO,     PLACONTA,    CODCENTROCUSTO,');
      sqlLocal.Add('  UNIDNEGOC, IDPLANOPREV, IDPATRO');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPESSOA       = ' + FloatToStr(pIdEmpresa) + ' AND');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  PLACONTA IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContaOrc(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  IDCONTAREFORCADO, PERCCONTAREFORC');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  IDCONTAREFORCADO IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemContaRea(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;
   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  IDCONTAREFREAL, PERCCONTAREFREA');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  IDCONTAREFREAL IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemFluxoCai(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;

   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  CODTIPRECDES, RECPAG,    CODCENTRORESPON, IDPLANOPREV,');
      sqlLocal.Add('  IDPATRO,      UNIDNEGOC, IDPESSOA,        IDEMPRESA,');
      sqlLocal.Add('  CODCENTROCUSTO');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  CODTIPRECDES IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemCondic(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;

   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  IDCONTACONDINI, IDCONTACONDFIM, IDCONTACONDRES,');
      sqlLocal.Add('  TIPOCONDINI,    TIPOCONDRES,    CONDICAO,');
      sqlLocal.Add('  VLRCONDINI,     VLRCONDRES');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  COMPCONTASORCAMEN');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  IDCONTACONDINI IS NOT NULL');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);
   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.PopulaOrigemArqGenerico(pContaOrigem : String);
var
   sqlLocal : TStringList;
begin
   sqlLocal := TStringList.Create;

   try
      sqlLocal.Add('SELECT');
      sqlLocal.Add('  DV.IDDATAVIEW,       DV.CLASSNAME,  DV.TEMPLATE,   DV.NAME,');
      sqlLocal.Add('  DV.CLASSDESCRIPTION, DV.DESCRIPTION');
      sqlLocal.Add('FROM');
      sqlLocal.Add('  DATAVIEW DV, CONTASORCAMEN CO');
      sqlLocal.Add('WHERE');
      sqlLocal.Add('  CO.IDPLANOORCAMEN = ' + FloatToStr(pPlano) + ' AND');
      sqlLocal.Add('  CO.IDCONTAORCAMEN = ' + QuotedStr(pContaOrigem) + ' AND');
      sqlLocal.Add('  DV.IDDATAVIEW     = CO.IDDATAVIEW AND');
      sqlLocal.Add('  DV.ORIGEMCMDV     = ''0''');

      CdsOrigem.Close;
      CdsOrigem.Data := GetDataPacket(sqlLocal.Text);

      CdsDataView.Data := CdsOrigem.Data;           //   Somente para pegar
      CdsDataView.EmptyDataSet;                     //    a estrutura

   finally
      sqlLocal.Free;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.GravaLog(pLog : String);
begin
   if (AtualizarLog) then
   begin
      memStatus.Lines.Add(pLog);

      if (memStatus.Lines.Count = 1000) or (pLog = 'Fim do Log') then
      begin
         memStatus.Lines.SaveTofile('LogContasPorGrupo' + FormatFloat('00', CntStatus) + '.Txt');

         if (memStatus.Lines.Count = 1000) then memStatus.Clear;

         CntStatus := CntStatus + 1;
      end;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.Estimar(pInserir : Boolean);
var
   Posicao   : Integer;
   Restantes : Integer;
begin
   Posicao   := 0;
   Restantes := CdsBase.RecordCount;

   GravaLog('Estimar - iniciando');
   GravaLog(' Linhas restantes - ' + IntToStr(Restantes));
   GravaLog(' Quantidade de contas que serão atualizadas - 0');

   CdsBase.First;
   while not(CdsBase.EOF) and (memStatus.Tag = 0) do
   begin
      BuscaContas (False);     // Busca os contas orçamentárias para o registro atual do cdsbase

      if (pInserir) then
      begin                     // Se for inserção as combinações que
         if (CdsConta.RecordCount = 0) then
         begin   // interessam são as que não possuem contas
            Inc(Posicao);
         end;
      end
      else
      begin
         Posicao := Posicao + CdsConta.RecordCount;
      end;
      Dec(Restantes);

      cdsBase.Edit;
      cdsBase.FieldByName('BASQUANT').AsInteger := CdsConta.RecordCount;
      cdsBase.Post;

      memStatus.Lines[memStatus.Lines.Count - 1] := ' Quantidade de contas que serão atualizadas - ' + IntToStr(Posicao);
      memStatus.Lines[memStatus.Lines.Count - 2] := ' Linhas restantes - ' + IntToSTr(Restantes);

      CdsBase.Next;
      Application.ProcessMessages;
   end;

   GravaLog(StringofChar('=', 40));
end;



function  TCtrlCadContasOrcPorGrupo.TamanhoMinimo(pCdsLocal : TDataSet;
                                                  pLtvSelec : TListView;
                                                  pCampo    : String) : Integer;
var
   Posicao : Integer;
begin
   Result := 0;
   for Posicao := 0 To pLtvSelec.Items.Count - 1 do
   begin
      pCdsLocal.RecNo := StrToInt(pltvSelec.Items[Posicao].SubItems[0]);
      if (Result < Length(Trim(pCdsLocal.FieldByName(pCampo).AsString))) then
      begin
         Result := Length(Trim(pCdsLocal.FieldByName(pCampo).AsString));
      end;
   end;
end;



procedure TCtrlCadContasOrcPorGrupo.GeraCodigo(pArrCodigo : array of TrecCodigo);
var
   Formato  : String;
   Posicao  : Integer;
   SeqPlano : Integer;
   SeqPatro : Integer;
begin
   SeqPlano := 0;
   SeqPatro := 0;

   cdsBase.Filtered := False;
   cdsBase.Filter   := 'BASQUANT = 0';
   cdsBase.Filtered := True;
   cdsBase.First;

   while not(cdsBase.EOF) and (memStatus.Tag = 0) do
   begin
      Posicao := 0;
      while (Posicao < Length(pArrCodigo)) and (memStatus.Tag = 0) do
      begin
         if (pArrcodigo[Posicao].Inicio <> 0) and (pArrcodigo[Posicao].Digitos <> 0) then
         begin

            Formato := StringofChar('0', pArrcodigo[Posicao].Digitos);

            if (pArrcodigo[Posicao].Campo = 'GO') then
            begin
               try
                  CdsGrupoOrc.Locate('CODGRUPOORC',
                                     Vararrayof([CdsBase.FieldByName('BASGRUP').AsFloat]),
                                     [loCaseInsensitive]);
               except
                  on E:Exception do showmessage(E.Message);
               end;

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, StrTofloat(Trim(CdsGrupoOrc.FieldByName('CODGRUPOORC').AsString)));
            end
            else if (pArrcodigo[Posicao].Campo = 'CC') then
            begin
               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, CdsBase.FieldByName('BASCENT').AsFloat);
            end
            else if (pArrcodigo[Posicao].Campo = 'AP') then
            begin
               CdsAtivProj.Locate('UNIDNEGOC',
                                  Vararrayof([CdsBase.FieldByName('BASATIV').AsFloat]),
                                  [loCaseInsensitive]);

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, StrTofloat(Trim(CdsAtivProj.FieldByName('UNECODIGO').AsString)));
            end
            else if (pArrcodigo[Posicao].Campo = 'PP') then
            begin
               Inc(SeqPlano);
               if (SeqPlano > Power(10, pArrcodigo[Posicao].Digitos) - 1) then SeqPlano := 1;

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, SeqPlano + pArrcodigo[Posicao].Valor);
            end
            else if (pArrcodigo[Posicao].Campo = 'PT') then
            begin
               Inc(SeqPatro);
               if (SeqPatro > Power(10, pArrcodigo[Posicao].Digitos) - 1) then SeqPatro := 1;

               pArrcodigo[Posicao].Conteudo := FormatFloat(Formato, SeqPatro + pArrcodigo[Posicao].Valor);
            end
            else
            begin
               pArrcodigo[Posicao].Conteudo := '';
            end;
         end;
         Inc(Posicao);
      end;

      CdsBase.Edit;
      CdsBase.FieldByName('BASCONTA').AsString := pArrcodigo[0].Conteudo +
                                                  pArrcodigo[1].Conteudo +
                                                  pArrcodigo[2].Conteudo +
                                                  pArrcodigo[3].Conteudo +
                                                  pArrcodigo[4].Conteudo;
      CdsBase.Post;
      cdsBase.Next;
   end;

   cdsBase.Filtered := False;
   cdsBase.Filter   := '';
end;



function  TCtrlCadContasOrcPorGrupo.Inclusao(pedtContaText : String;
                                             pArrCodigo    : array of TrecCodigo;
                                             pLtvSelec     : TListView
                                            ): Boolean;
var
   sqlLocal : TStringList;
   Posicao  : Integer;
begin
   Result := True;
   MessageInfo := '';
   sqlLocal := TStringList.Create;

   GravaLog('- Inclusão - iniciando');
   GravaLog('  Gerando códigos');
   GeraCodigo(pArrcodigo);  // Gera ID para as contas

   cdsBase.Filtered := False;
   cdsBase.Filter   := 'BASQUANT = 0';
   cdsBase.Filtered := True;
   cdsBase.First;

   while not(cdsBase.EOF) and (memStatus.Tag = 0) do
   begin
      try
         sqlLocal.Clear;
         sqlLocal.Add('INSERT INTO');
         sqlLocal.Add('  CONTASORCAMEN');
         sqlLocal.Add('  (IDPESSOA,       IDPLANOORCAMEN, IDCONTAORCAMEN,');
         sqlLocal.Add('    IDGRUPOORCAMEN, CODCENTROCUSTO, UNIDNEGOC,');
         sqlLocal.Add('    IDPLANOPREV,    IDPATRO,        NOMECONTAORCAMEN)');
         sqlLocal.Add('  VALUES (');
         sqlLocal.Add('    ' + FloatToStr(pIdEmpresa) + ',');
         sqlLocal.Add('    ' + FloatToStr(pPlano) + ',');
         sqlLocal.Add('    ' + QuotedStr(cdsBase.FieldByName('BASCONTA').AsString) + ',');
         sqlLocal.Add('    ' + Trim(CdsBase.FieldByName('BASGRUP').AsString) + ',');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASCENT').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASCENT').AsString)+ '),');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASATIV').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASATIV').AsString) + '),');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASPLAN').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASPLAN').AsString) + '),');
         sqlLocal.Add('    DECODE(' + QuotedStr(cdsBase.FieldByName('BASPATR').AsString) + ', '''', NULL, ' +
                                        QuotedStr(cdsBase.FieldByName('BASPATR').AsString) + '),');
         sqlLocal.Add('    ' + QuotedStr(cdsBase.FieldByName('BASCONTA').AsString) + ')');

         AtualizaTabela(sqlLocal.Text);

      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := MessageInfo + E.Message;
            GravaLog(' ' + MessageInfo);
         end;
      end;

      CdsBase.Next;
   end;

   // Utiliza os métodos de alteração para popular os demais dados da conta
   AtualizarLog := False;
   Posicao      := 0;

   while (Posicao < pLtvSelec.Items.Count) and (memStatus.Tag <> -1) do
   begin
      if not(Alteracao(pedtContaText, pLtvSelec.Items[Posicao].SubItems[0])) then
      begin
         Posicao := pLtvSelec.Items.Count;       // Para sair do loop
      end;

      Inc(Posicao);
   end;

   AtualizarLog := not(isAppServer);
   GravaLog('Fim do Log');

   cdsBase.Filtered := False;
   cdsBase.Filter   := '';
end;





function  TCtrlCadContasOrcPorGrupo.GravarGrupoOrc(const IDGrupoOrcamen  : Extended;
                                                   const CodGrupoOrcamen : String;
                                                   const IDContaOrcamen  : String;
                                                   const sPath           : String;
                                                   const bSubstCC        : Boolean;
                                                   const bSubstAP        : Boolean;
                                                   const bSubstPP        : Boolean;
                                                   const bSubstPT        : Boolean;
                                                   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                   const bSubstPR        : Boolean; {Programa}
                                                   const bSubstTP        : Boolean; {Tipo de Despesa}
                                                   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                   const sNomeBilhete    : String;
                                                   Operacao : TOperacao): Boolean;
var
   iContasCriadas : Integer;
   bLog : Boolean;
   sOperacao, sContaContabil : String;
   sSQL,sIDORCAMEN:string; //Ricardo de Freitas SOL 153019 KTN: 1147112

   function ExcluiRelacionamDesfeitos(iIdGrupoOrc,iIdPlanoOrc: integer): boolean;
   var
     CdsAux,CdsContasEmUso: TClientDataSet;
     
   begin
      try
         // Traz todas as contas cadastradas do grupo
         CdsAux      := TClientDataSet.Create(nil);
         CdsAux.Data := GetDataPacket(' SELECT DISTINCT ' +
                                      '    IDCONTAORCAMEN, ' +
                                      '    ''S'' AS EXCLUIR ' +
                                      ' FROM ' +
                                      '    CONTASORCAMEN ' +
                                      ' WHERE ' +
                                      '    (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                                      '    (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                      '    (IDCONTAORCAMEN <> ''-1'')');

         // Exclui da tabela SALDOORCADO as contas que estão sem movimentação, para evitar
         //que fique impossibilitado excluir um relacionamento inativo
         if not ExecSQL('DELETE FROM SALDOORCADO ' +
                        'WHERE IDCONTAORCAMEN IN (SELECT DISTINCT ' +
                        '                            IDCONTAORCAMEN ' +
                        '                         FROM ' +
                        '                            CONTASORCAMEN ' +
                        '                         WHERE (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                        '                               (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                        '                               (IDCONTAORCAMEN <> ''-1'')) AND ' +

                        
                        //Marilza Colpani 26/03/2009 N.Sol 109826/N.Kintana 498982
                        '   (NVL(VLRORCADO,0) + NVL(VLRRESERVADO,0)+ ' +
                        '     NVL(VLRREALIZADO,0)+ NVL(VLRCOMPROMETIDO,0) + ' +
                        '     NVL(VLRORCACUM,0) + NVL(VLRREALACUM,0) + ' +
                        '     NVL(VLRRATEIOORI,0))=0 ') then

            raise Exception.Create('Não foi possível excluir lançamentos inativos do grupo. Motivo: ' + MessageInfo);


        // Pega as contas que estão com movimentação (Dotação,Reserva,Compromisso,Ajuste e Transferência)
        CdsContasEmUso      := TClientDataSet.Create(nil);
        CdsContasEmUso.Data := GetDataPacket('SELECT DISTINCT ' +
                                             '   DECODE(A.IDCONTAORIGEM,'''', ' +
                                             '      DECODE(S.IDCONTAORCAMEN,'''', ' +
                                             '         DECODE(R.IDCONTAORCAMEN,'''',''0'',R.IDCONTAORCAMEN), ' +
                                             '      S.IDCONTAORCAMEN), ' +
                                             '   A.IDCONTAORIGEM) AS IDCONTAORCAMEN, ' +


                                             '   DECODE(A.IDCONTAORIGEM,'''', ' +
                                             '         DECODE(S.IDCONTAORCAMEN,'''', ' +
                                             '                  DECODE(R.IDCONTAORCAMEN,'''',''0'',DECODE(R.FLGRESCOMP,''C'', ' +
                                             '                                                        ''Compromisso efetuado'',''Reserva efetuada'')), ' +
                                             '         ''Dotação efetuada''), ' +
                                             '   DECODE(A.FLGTIPOALTER,''R'',''Dedução efetuada'',''S'',''Suplementação efetuada'',''T'',''Transferência efetuada'')) AS TIPOALTER ' +

                                             'FROM ' +
                                             '   ALTERORCAMENTO A, ' +
                                             '   SALDOORCADO S, ' +
                                             '   RESERVAORCAMEN R, ' +
                                             '   CONTASORCAMEN C ' +
                                             'WHERE ' +
                                             '   (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                                             '   (C.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)) AND ' +
                                             '   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+)) AND ' +
                                             '   (C.IDCONTAORCAMEN = R.IDCONTAORCAMEN(+)) ' +
                                             ' ORDER BY TIPOALTER  ');

         // 1 - Marca para NÃO serem excluidas as contas orçamentárias
         //que ainda fazem parte do relacionamento escolhido
         cdsCodigo.First;
         while not cdsCodigo.Eof do
         begin
            CdsAux.Filtered := False;
            CdsAux.Filter   := 'IDCONTAORCAMEN = ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString);
            CdsAux.Filtered := True;
            if not CdsAux.IsEmpty then
            begin
               CdsAux.Edit;
               CdsAux.FieldByName('EXCLUIR').AsString := 'N';
               CdsAux.Post;
            end;
            CdsCodigo.Next;
         end;


         // 2 - Filtra todas as contas marcadas para exclusão. Se
         //a conta estiver já em movimentação, não permite a exclusão
         //da mesma, evitando o erro de constraint
         CdsAux.Filtered := False;
         CdsAux.Filter   := 'EXCLUIR = ''S''';
         CdsAux.Filtered := True;
         CdsAux.First;
         while not CdsAux.Eof do
         begin
            CdsContasEmUso.Filtered := False;
            CdsContasEmUso.Filter   := 'IDCONTAORCAMEN = ' + QuotedStr(CdsAux.FieldByName('IDCONTAORCAMEN').AsString);
            CdsContasEmUso.Filtered := True;

            if not CdsContasEmUso.IsEmpty then
            begin
               CdsAux.Edit;
               CdsAux.FieldByName('EXCLUIR').AsString := 'N';
               CdsAux.Post;
               WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' Este relacionamento não pode ser excluído, pois já está em uso. Conta: ' + CompletaFIM(CdsAux.FieldByName('IDCONTAORCAMEN').AsString, ' ', 40) + ' ' + CdsContasEmUso.FieldByName('TIPOALTER').AsString);
               // Não pode dar o Next aqui, pois como este Cds já está filtrado,
               //sofre um efeito semelhante ao Delete
            end
            else
              CdsAux.Next;
         end;


         // Exclui todas as contas sem relacionamento
         CdsAux.First;
         while not CdsAux.Eof do
         begin
             // Deleta o filho
             Result := ExecSQL('DELETE FROM COMPCONTASORCAMEN ' +
                               'WHERE IDCONTAORCAMEN = ' + QuotedStr(CdsAux.FieldByName('IDCONTAORCAMEN').AsString) + ' AND ' +
                               '      IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc));
             if not Result then
                Exit;

             // Deleta o pai
             Result := ExecSQL('DELETE FROM CONTASORCAMEN ' +
                               'WHERE IDCONTAORCAMEN = ' + QuotedStr(CdsAux.FieldByName('IDCONTAORCAMEN').AsString) + ' AND ' +
                               '      IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc));
             if not Result then
                Exit;

            CdsAux.Next;
         end;

         Result := true;
      finally
         FreeAndNil(CdsAux);
         FreeAndNil(CdsContasEmUso);
      end;
   end;


   
begin
      try

         //Ricardo de Freitas SOL: 159212 - Kintana 1337867
         FbSubstCC        := bSubstCC;
         FbSubstAP        := bSubstAP;
         FbSubstPP        := bSubstPP;
         FbSubstPT        := bSubstPT;
         FbSubstPR        := bSubstPR;
         FbSubstTP        := bSubstTP;
         //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

         // Gera o código das contas orçamentárias selecionadas para o CdsCodigo
         if not MontaCodigos(IDGrupoOrcamen, CodGrupoOrcamen, True, sNomeBilhete, bSubstCC) then
         begin
              Result := false;
              raise Exception.Create('Processo abortado. Não foi gerado códigos de contas orçamentárias');
         end;

         bLog := not(isAppServer);
         if Operacao = opInserir then
            sOperacao := 'INSERINDO'
         else
            sOperacao := 'ALTERANDO';

         // Prepara gravação do arquivo de log
         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamen' + sOperacao + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);
            //Ricardo de Freitas SOL 153019 KTN: 1147112
            WriteLN(ArqLog,'LOG de CADASTRO DE CONTAS ORÇAMENTÁRIAS POR GRUPO');
            WriteLN(ArqLog,'=======================================================================');
            WriteLN(ArqLog,'Grupo Orçamentário Id: ' + FloattoStr(IDGrupoOrcamen) + ' - Código: ' + CodGrupoOrcamen);
            WriteLN(ArqLog,'Operação: ' +  sOperacao);
            WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' Início do processo...');
            WriteLN(ArqLog, '');
         end;

         StartTransaction;

         iContasCriadas := 0;
         DoProgresso([sNomeBilhete, 0, 0, cdsCodigo.RecordCount, cdsCodigo.RecNo, sOperacao + ' Contas Orçamentárias...']);

         //Ricardo de Freitas SOL 153019 KTN: 1147112
         WriteLN(ArqLog, '');
         WriteLN(ArqLog, 'Contas Orçamentárias');
         WriteLN(ArqLog, '----------------------------------');
         WriteLN(ArqLog, '');

         //===============================================================================
         // Início do processo de Loop - alteração/inserção das contas orçamentárias
         //===============================================================================
         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            // Anda o form progresso
            DoProgresso(['',1,0,0,cdsCodigo.RecNo]);

            //Validação de Plano Patro
            if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(cdsCodigo.FieldByName('IDPATRO').AsInteger,
                                                            cdsCodigo.FieldByName('IDPLANOPREV').AsInteger) then
            begin
               if bLog then
                  WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' +
                          CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                          'Conta não atualizada/inserida. Motivo: ' + CtrlPlanPrevContabPatro.MessageInfo);
               cdsCodigo.Next;
               Continue;
            end;

            // Verifica qual é o tipo de operação para efetuar o processo correspondente
            case Operacao of
               //-----------------------------------------------------------------------------------------------------------------------------------------------------
               //Inserir----------------------------------------------------------------------------------------------------------------------------------------------
               //-----------------------------------------------------------------------------------------------------------------------------------------------------
               opInserir : begin
                              //  Verifica se a combinação de Plano x Patro x C.Custo x Ativ/Proj. já existe
                              if ExisteCombinacao(pPlano,
                                                  cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat,
                                                  cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                                  cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                                  cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                                  cdsCodigo.FieldByName('IDPATRO').AsString,
                                                  //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                  cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString,
                                                  cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString
                                                  //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                 ) then
                              begin

                                   //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
                                   //No modo de inserção, caso o conta orçamentária já esteja cadastrada,
                                   //este conta orçamentária deverá ser atualizada
                                   if FAtualizaNaInsercao then
                                   begin
                                        //Atualiza a Conta
                                        if not AtualizaContaOrcamen(cdsCodigo.FieldByName('CODIGO').AsString,
                                                                    cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                                                    cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                                                    cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                                                    cdsCodigo.FieldByName('IDPATRO').AsString,
                                                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                                    cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString,
                                                                    cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString,
                                                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                                    Trunc(pPlano),
                                                                    Trunc(pIdEmpresa),
                                                                    bSubstCC,
                                                                    bSubstAP,
                                                                    bSubstPP,
                                                                    bSubstPT,
                                                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                                    bSubstPR,
                                                                    bSubstTP
                                                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                                    ) then
                                             raise Exception.Create(MessageInfo);

                                        //Ricardo de Freitas SOL 153019 KTN: 1147112
                                        Inc(iContasCriadas);
                                        WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - Atualizado.');
                                   end
                                   else
                                   begin

                                      if bLog then
                                           WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' +
                                            CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                            'Já existe uma conta orçamentária com os mesmos parâmetros.' );
                                       cdsCodigo.Next;
                                       Continue;
                                   end;
                              end
                              else
                              begin
                                   //Inserir cotna Orçamentária
                                   if not InsereContaOrcamen(cdsCodigo.FieldByName('CODIGO').AsString,
                                                              cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                                              cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                                              cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                                              cdsCodigo.FieldByName('IDPATRO').AsString,
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                              cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString,
                                                              cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString,
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                              Trunc(pIdEmpresa),
                                                              bSubstCC,
                                                              bSubstAP,
                                                              bSubstPP,
                                                              bSubstPT,
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                              bSubstPR,
                                                              bSubstTP) then
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                       raise Exception.Create(MessageInfo)
                                   else
                                   begin
                                         Inc(iContasCriadas);
                                         if bLog then
                                           WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' +
                                                  CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                                  'Inserida.' );
                                   end;
                              end;
                           end;
               //-----------------------------------------------------------------------------------------------------------------------------------------------------
               //Alterar----------------------------------------------------------------------------------------------------------------------------------------------
               //-----------------------------------------------------------------------------------------------------------------------------------------------------
               opAlterar :  begin

                               //Ricardo de Freitas SOL 153019 KTN: 1147112 - INICIO
                               //Caso o código geradom começa com "0" retira ele para realizar
                               //o operador like, pois há códigos no banco de dados que começam
                               //com " " ex: " 0000000034523143".
                               if Copy(cdsCodigo.FieldByName('CODIGO').AsString,1,1) = '0' then
                                  sIDORCAMEN := Copy(cdsCodigo.FieldByName('CODIGO').AsString,2, length(cdsCodigo.FieldByName('CODIGO').AsString) - 1)
                               else
                                  sIDORCAMEN := cdsCodigo.FieldByName('CODIGO').AsString;

                               sSQL :=  'SELECT IDCONTAORCAMEN   ' +
                                        'FROM   CONTASORCAMEN    ' +
                                        'WHERE  IDCONTAORCAMEN LIKE ' + QuotedStr(  '%' + sIDORCAMEN)  + ' AND ' +
                                        '       IDPLANOORCAMEN = ' + FloatToStr(pPlano);
                               _Cds.Data := GetDataPacket(sSQL);
                               //Ricardo de Freitas SOL 153019 KTN: 1147112 - FIM

                               // Se não existir o relacionamento, inclui o mesmo
                               if _Cds.IsEmpty then
                               begin
                                  //  Verifica se a combinação de Plano x Patro x C.Custo x Ativ/Proj. já existe
                                  if ExisteCombinacao(pPlano,
                                                      cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat,
                                                      cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                                      cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                                      cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                                      cdsCodigo.FieldByName('IDPATRO').AsString,
                                                      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                      cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString,
                                                      cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString
                                                      //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                      ) then
                                  begin
                                     if bLog then
                                        WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' +
                                                CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                                'Já existe uma conta orçamentária com os mesmos parâmetros.' );
                                     cdsCodigo.Next;
                                     Continue;
                                  end;

                                  if not InsereContaOrcamen(cdsCodigo.FieldByName('CODIGO').AsString,
                                                            cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                                            cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                                            cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                                            cdsCodigo.FieldByName('IDPATRO').AsString,
                                                            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                            cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString,
                                                            cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString,
                                                            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                            Trunc(pIdEmpresa),
                                                            bSubstCC,
                                                            bSubstAP,
                                                            bSubstPP,
                                                            bSubstPT,
                                                            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                            bSubstPR,
                                                            bSubstTP
                                                            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                            ) then
                                     raise Exception.Create(MessageInfo)
                                  else
                                  begin
                                       Inc(iContasCriadas);
                                       if bLog then
                                          WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' +
                                            CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                            'Inserida.' );
                                  end;

                                     //Ricardo de Freitas SOL 153019 KTN: 1147112
                                     Inc(iContasCriadas);
                                     WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - Inserida.');
                               end
                               else
                               //Se existir, atualiza a conta
                               begin

                                  //Ricardo de Freitas SOL 153019 KTN: 1147112
                                  sIDORCAMEN :=  _Cds.Fieldbyname('IDCONTAORCAMEN').AsString;

                                  if not AtualizaContaOrcamen(//cdsCodigo.FieldByName('CODIGO').AsString, //Ricardo de Freitas SOL 153019 KTN: 1147112 - comentado
                                                              sIDORCAMEN, //Ricardo de Freitas SOL 153019 KTN: 1147112
                                                              cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                                              cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                                              cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                                              cdsCodigo.FieldByName('IDPATRO').AsString,
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                              cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString,
                                                              cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString,
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                              Trunc(pPlano),
                                                              Trunc(pIdEmpresa),
                                                              bSubstCC,
                                                              bSubstAP,
                                                              bSubstPP,
                                                              bSubstPT,
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                              bSubstPR,
                                                              bSubstTP
                                                              //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                              ) then
                                       raise Exception.Create(MessageInfo);

                                  //Ricardo de Freitas SOL 153019 KTN: 1147112
                                  Inc(iContasCriadas);
                                  WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(sIDORCAMEN, ' ', 40) + ' - Atualizado.');
                               end;
                            end;
            end;
            cdsCodigo.Next;
         end;


         //Desvinculção de ContasOrçametárias
         //---------------------------------------------------------------------

         if DesvincularContorcamen then
         begin
              //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831 - comentado
              //Exclui  os relacionamentos desfeitos
              if (Operacao = opAlterar) or ( (Operacao = opInserir) and (FAtualizaNaInsercao))      then
              begin
                   if not RetirarContOrcamenNaoParam(Trunc(IDGrupoOrcamen),
                                              Trunc(pPlano)) then
                   raise Exception.Create(MessageInfo);

                   //Ricardo de Freitas SOL 153019 KTN: 1147112

                   if not AtualizaPlanosContabilGrupo(Trunc(IDGrupoOrcamen),
                                              Trunc(pPlano)) then
                   raise Exception.Create(MessageInfo);
              end;
              //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831 - fim
          end;

         //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
         //Rotina de Vinculação Contabilidade
         if UtilizarRotinaVincContabil then
         begin
              AtualizarContasContabporGrupo();
         end;

         DoProgresso(['',2]);

         //Rodapé do arquivo de Log
         if bLog then
         begin
            WriteLN(ArqLog, '');
            WriteLN(ArqLog,'Foram criadas/alteradas ' + IntToStr(iContasCriadas) + ' Contas Orçamentárias, de ' + IntToStr(cdsCodigo.RecordCount) + ' previstas.');
            WriteLN(ArqLog, '');
            WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' Término do processo.');
            CloseFile(ArqLog);
         end;

         //Exclui a conta base
         ExcluiContaEspelho;

         //Commitar Transação
         Commit;

         //Ok
         Result := True;

      except
         on E:Exception do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result      := false;

            if bLog then
            begin
               WriteLN(ArqLog,'****************** PROCESSO INTERROMPIDO ******************');
               WriteLN(ArqLog,'Houve um erro ao inserir/alterar o grupo orçamentário.');
               WriteLN(ArqLog,'Conta: ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40));
               WriteLN(ArqLog,'Motivo: ' + E.message);
               WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now)); 
               WriteLN(ArqLog,'***********************************************************');
               CloseFile(ArqLog);
            end;
         end;
      end;  // try..except
//   end;  // if ConnectionSide = cnsClient
end;






function  TCtrlCadContasOrcPorGrupo.AlteracaoNova(const IDContaEspelho  : String;
                                                  const IDGrupoOrcamen  : String;
                                                  const CodGrupoOrcamen : String;
                                                  const IDEmpresProp    : String;
                                                  const sPath           : String;
                                                  const bSubstCompConta : Boolean;
                                                  const bSubstCC        : Boolean;
                                                  const bSubstAP        : Boolean;
                                                  const bSubstPP        : Boolean;
                                                  const bSubstPT        : Boolean;
                                                  const sNomeBilhete    : String
                                                 ): Boolean;
var
   iQuant    : Integer;
   iAlterada : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteracaoNova(IDContaEspelho,
                                                   IDGrupoOrcamen,
                                                   CodGrupoOrcamen,
                                                   IDEmpresProp,
                                                   bSubstCompConta,
                                                   bSubstCC,
                                                   bSubstAP,
                                                   bSubstPP,
                                                   bSubstPT,
                                                   sNomeBilhete
                                                  );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally
         try // Except
            StartTransaction;

            // Aqui, é excluído todas as contas já existentes no grupo, para que, as alterações
            //feitas sejam inseridas de acordo com o usuário.
            if not ExecSQL('DELETE FROM CONTASORCAMEN WHERE IDGRUPOORCAMEN = ' + IDGrupoOrcamen) then
               raise Exception.Create(MessageInfo);


               Commit;

            Result := true;   



         except
            on E: Exception do
            begin
               Rollback;
               Result      := False;
               MessageInfo := E.Message
            end;
         end;

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram alteradas ' + IntToStr(iAlterada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant - 1) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



function  TCtrlCadContasOrcPorGrupo.ExcluiCompContas(const IDPlanoOrcamen  : String;
                                                     const IDContaNova     : String
                                                    ): Boolean;

var
   sSQL : String;
begin
   sSQL :=
   'DELETE FROM COMPCONTASORCAMEN '                               + #13 +
   'WHERE '                                                       + #13 +
   '       IDCONTAORCAMEN  = ' + QuotedStr(IDContaNova)           + #13 +
   '   AND IDPLANOORCAMEN  = ' + IDPlanoOrcamen;
   try
      ExecSQL(sSQL);
      Result := True;
   except
      Result := False;
   end;

end;

function  TCtrlCadContasOrcPorGrupo.ExclusaoNova(const IDGrupoOrcamen  : String;
                                                 const CodGrupoOrcamen : String;
                                                 const IDEmpresProp    : String;
                                                 const sPath           : String;
                                                 const bSubstCC        : Boolean;
                                                 const bSubstAP        : Boolean;
                                                 const bSubstPP        : Boolean;
                                                 const bSubstPT        : Boolean;
                                                 const sNomeBilhete    : String
                                                ): Boolean;
var
   iQuant    : Integer;
   iExcluida : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;
   bExcluiu  : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   Result := True;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExclusaoNova(IDGrupoOrcamen,
                                                  CodGrupoOrcamen,
                                                  IDEmpresProp,
                                                  bSubstCC,
                                                  bSubstAP,
                                                  bSubstPP,
                                                  bSubstPT,
                                                  sNomeBilhete
                                                 );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigos(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete, bSubstCC);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenEXCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iExcluida := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

            // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
            // *** Garante não haver problemas na inserção da CompContas, o que poderia de outra
            //     forma ocorrer (se a composição do código for mudada, p.ex.) ***
            sSQL :=
            'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                               + #13 +
            'WHERE '                                                                                  + #13 +
            '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                    + #13 +
            '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                               + #13 +
            '   AND CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)  + #13 +
            '   AND IDEMPRESA      = ' + IDEmpresProp                                                 + #13 +
            '   AND UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                  + #13 +
            '   AND IDPESSOA       = ' + IDEmpresProp                                                 + #13 +
            '   AND IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                + #13 +
            '   AND IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString;

            cdsContaNova.Close;
            cdsContaNova.Data := GetDataPacket(sSQL);
            // ----------------------------------------------------------------------------------

            if not(cdsContaNova.isEmpty) then
            begin
               StartTransaction;

               try
                  sSQL :=
                  'DELETE FROM COMPCONTASORCAMEN '                                                             + #13 +
                  'WHERE '                                                                                     + #13 +
                  '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                  '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                  bExcluiu := ExecSQL(sSQL);

                  if bExcluiu then
                  begin
                     sSQL :=
                     'DELETE FROM CONTASORCAMEN '                                                                 + #13 +
                     'WHERE '                                                                                     + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                     '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                  + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                     bExcluiu := ExecSQL(sSQL, True);
                  end;  // if bExcluiu

                  if bExcluiu then
                  begin
                     Commit;

                     inc(iExcluida);

                     if bLog then
                     begin
                        sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                  CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40);

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end
                  else  // if ExecSQL(sSQL, True)
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                    'Conta Orçamentária NÃO EXCLUÍDA.';

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // if bExcluiu

               except
                  on E: Exception do
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                    'ERRO na exclusão da Conta Orçamentária: ' + E.Message;

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // on E: Exception
               end;  // try..except

            end
            else  // if not(cdsContaNova.isEmpty)
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                              'Conta Orçamentária não encontrada.';

                  MessageInfo := sLinha;

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog
            end;  // if not(cdsContaNova.isEmpty)

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

      // -------------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram excluídas ' + IntToStr(iExcluida) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;


procedure TCtrlCadContasOrcPorGrupo.ExcluiContaEspelho;
var
   sSQL : String;
begin
   sSQL := 'DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1'' ';
   ExecSQL(sSQL);

   sSQL := 'DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1'' ';
   ExecSQL(sSQL);
end;



function TCtrlCadContasOrcPorGrupo.ExisteCombinacao(const IDPlanoOrcamen : Extended;
                                                    const IDGrupoOrcamen : Extended;
                                                    const sCentroCusto   : String;
                                                    const sUnidNegoc     : String;
                                                    const sPlano         : String;
                                                    const sPatro         : String;
                                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                    const sPrograma      : String; {Programa}
                                                    const sTipoDespesa   : String {Tipo de Despesa}
                                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                   ): Boolean;
var
   sSQL : String;
begin
   // Edilaine - SOL 176840 / KTN 1615714 - comentado o trecho
   {
   sSQL :=
   ' SELECT COUNT(*) AS TOTAL FROM CONTASORCAMEN '                    + #13 +
   ' WHERE '                                                          + #13 +
   '       IDPLANOORCAMEN = ' + FormatFloat('#0', IDPlanoOrcamen)    + #13 +
   '   AND IDGRUPOORCAMEN = ' + FormatFloat('#0', IDGrupoOrcamen)    + #13 +
   '   AND UNIDNEGOC      = ' + sUnidNegoc                           + #13 +
   '   AND IDPLANOPREV    = ' + sPlano                               + #13 +
   '   AND IDPATRO        = ' + sPatro;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   if (sCentroCusto <> 'X') and  (sPrograma <> '') then
      sSQL := sSQL + '   AND CODCENTROCUSTO = ' + QuotedStr(sCentroCusto)
   else
      sSQL := sSQL + '   AND CODCENTROCUSTO IS NULL';

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   if (sPrograma <> '0') and  (sPrograma <> '') then
   begin
        sSQL := sSQL + '  AND IDPROGRAMAORCAMEN = ' + sPrograma
   end
   else
        sSQL := sSQL + '  AND IDPROGRAMAORCAMEN IS NULL ';

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   if (sTipoDespesa <> '0') and  (sTipoDespesa <> '') then
   begin
        sSQL := sSQL + '  AND IDTIPO_DEPESAORCAMEN = ' + sTipoDespesa
   end
   else
        sSQL := sSQL + '  AND IDTIPO_DEPESAORCAMEN IS NULL ';
   }
   // Edilaine - SOL 176840 / KTN 1615714 - fim

   // Edilaine - SOL 176840 / KTN 1615714
   sSQL :=
   ' SELECT COUNT(*) AS TOTAL FROM CONTASORCAMEN C, CENTCUST CC  '    + #13 +
   ' WHERE '                                                          + #13;

   // Edilaine - SOL 187955 / KTN 1770040
   if (sCentroCusto <> 'X') then
      sSQL := sSQL + '       C.CODCENTROCUSTO = CC.CODCENTROCUSTO  AND '  + #13
   else
      sSQL := sSQL + '       C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)  AND '  + #13;
   // Edilaine - SOL 187955 / KTN 1770040 - fim

   sSQL := sSQL +                                                                // Edilaine - SOL 187955 / KTN 1770040
   '   C.IDPLANOORCAMEN = ' + FormatFloat('#0', IDPlanoOrcamen)    + #13 +
   '   AND C.IDGRUPOORCAMEN = ' + FormatFloat('#0', IDGrupoOrcamen)    + #13 +
   '   AND C.UNIDNEGOC      = ' + sUnidNegoc                           + #13 +
   '   AND C.IDPLANOPREV    = ' + sPlano                               + #13 +
   '   AND C.IDPATRO        = ' + sPatro;

   if (sCentroCusto <> 'X') and  (sPrograma <> '') then
      sSQL := sSQL + '   AND C.CODCENTROCUSTO = ' + QuotedStr(sCentroCusto)
   else
      sSQL := sSQL + '   AND C.CODCENTROCUSTO IS NULL';

   if (sPrograma <> '0') and  (sPrograma <> '') then
   begin
        sSQL := sSQL + '  AND C.IDPROGRAMAORCAMEN = ' + sPrograma
   end
   else
        sSQL := sSQL + '  AND C.IDPROGRAMAORCAMEN IS NULL ';

   if (sTipoDespesa <> '0') and  (sTipoDespesa <> '') then
   begin
        sSQL := sSQL + '  AND C.IDTIPO_DEPESAORCAMEN = ' + sTipoDespesa
   end
   else
        sSQL := sSQL + '  AND C.IDTIPO_DEPESAORCAMEN IS NULL ';

   if (sCentroCusto <> 'X') then   // Edilaine - SOL 187955 / KTN 1770040
      sSQL := sSQL + ' AND SUBSTR(C.IDCONTAORCAMEN, 17, 6) = SUBSTR(''000000'', 1, 6-length(trim(CC.CODEXTERNO)))||trim(cc.codexterno)';

   cdsExiste.Data := GetDataPacket(sSQL);
   
   Result := False;
   if cdsExiste.FieldByName('TOTAL').AsInteger > 0 then Result := True;

   cdsExiste.Close;
end;



function TCtrlCadContasOrcPorGrupo.MontaCodigos(const IDGrupoOrcamen   : Extended;
                                                 const CodGrupoOrcamen  : String;
                                                 const bCalculaCodigo   : Boolean;
                                                 const sNomeBilhete     : String;
                                                 const bUsaCodCentroCusto : Boolean): Boolean;
var
   sSQL        : String;

   sCampo1     : String;
   sCampo2     : String;
   sCampo3     : String;
   sCampo4     : String;
   sCampo5     : String;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   sCampo7     : String;
   sCampo8     : String;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

   sCodigoConta: String;

   iPos        : Integer;
   iPosCC      : Integer;
   iQuant      : Integer;

   iTamCod     : Integer;
   iTamCod1    : Integer;
   iTamCod2    : Integer;
   iTamCod3    : Integer;
   iTamCod4    : Integer;
   iTamCod5    : Integer;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   iTamCod7    : Integer;
   iTamCod8    : Integer;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

   iTipoCod1   : Integer;
   iTipoCod2   : Integer;
   iTipoCod3   : Integer;
   iTipoCod4   : Integer;
   iTipoCod5   : Integer;

   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   iTipoCod7   : Integer;
   iTipoCod8   : Integer;
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

begin
   // ----------------------------------------------------------------------------------------------
   // 1) Monta o cds que conterá os registros dos códigos
   // ----------------------------------------------------------------------------------------------

   Result := false;

   TRY
       iTipoCod1   := CdsParamOrc.FieldByName('FLGTIPOCOD1').AsInteger;
       iTipoCod2   := CdsParamOrc.FieldByName('FLGTIPOCOD2').AsInteger;
       iTipoCod3   := CdsParamOrc.FieldByName('FLGTIPOCOD3').AsInteger;
       iTipoCod4   := CdsParamOrc.FieldByName('FLGTIPOCOD4').AsInteger;
       iTipoCod5   := CdsParamOrc.FieldByName('FLGTIPOCOD5').AsInteger;

       //Ricardo de Freitas SOL: 159212 - Kintana 1337867
       iTipoCod7   := CdsParamOrc.FieldByName('FLGTIPOCOD7').AsInteger;
       iTipoCod8   := CdsParamOrc.FieldByName('FLGTIPOCOD8').AsInteger;
       //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       iTamCod1    := CdsParamOrc.FieldByName('TAMCOD1').AsInteger;
       iTamCod2    := CdsParamOrc.FieldByName('TAMCOD2').AsInteger;
       iTamCod3    := CdsParamOrc.FieldByName('TAMCOD3').AsInteger;
       iTamCod4    := CdsParamOrc.FieldByName('TAMCOD4').AsInteger;
       iTamCod5    := CdsParamOrc.FieldByName('TAMCOD5').AsInteger;

       //Ricardo de Freitas SOL: 159212 - Kintana 1337867
       iTamCod7    := CdsParamOrc.FieldByName('TAMCOD7').AsInteger;
       iTamCod8    := CdsParamOrc.FieldByName('TAMCOD8').AsInteger;
       //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       //Ricardo de Freitas SOL: 159212 - Kintana 1337867
       //Adicionado som dos tamanhos de 7 e 8
       iTamCod     := iTamCod1 + iTamCod2 + iTamCod3 + iTamCod4 + iTamCod5 +
                      iTamCod7 + iTamCod8;

       sSQL :=
       'SELECT '                                                            + #13 +

       '   ' + QuotedStr(StringOfChar(' ', iTamCod)) + ' AS CODIGO, '       + #13 +

       '   ' + QuotedStr(StringOfChar(' ', 12)) + ' AS CODGRUPOORCAMEN, '   + #13 +

       '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTROCUSTO, '    + #13 +
       '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCC, '      + #13 +

       '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS UNECODIGO, '         + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPLANO, '          + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPATRO, '          + #13 +

       //Ricardo de Freitas SOL: 159212 - Kintana 1337867
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS IDPROGRAMAORCAMEN, '     + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS IDTIPO_DEPESAORCAMEN, '  + #13 +
       //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       '0.00 AS IDGRUPOORCAMEN, '                                           + #13 +
       '0.00 AS UNIDNEGOC, '                                                + #13 +
       '0.00 AS IDPLANOPREV, '                                              + #13 +
       '0.00 AS IDPATRO '                                                   + #13 +
       'FROM '                                                              + #13 +
       '   DUAL '                                                           + #13 +
       'WHERE '                                                             + #13 +
       '   1 = 2 ';

       cdsCodigo.Close;
       cdsCodigo.Data := GetDataPacket(sSQL);
       // ----------------------------------------------------------------------------------------------

       // ----------------------------------------------------------------------------------------------
       // 2) 4 loops aninhados, por Centro de Custo, Ativ/Projeto, Plano e Patro
       //    Cada iteração vai produzir um código único, e os parâmetros da conta seguirão o código
       // ----------------------------------------------------------------------------------------------

       //Nova Rotina de Geração de código de contas orçamentárias
       //---------------------------------------------------------------------------

       iQuant := CdsCCSel.RecordCount * CdsAPSel.RecordCount * CdsPPSel.RecordCount * CdsPTSel.RecordCount *
                 CdsProgramaSel.RecordCount *  CdsTipoDespesaSel.RecordCount; {Ricardo de Freitas SOL: 159212 - Kintana 1337867}
       iPos   := 0;

       // MostraFormProgresso
       DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

       //Centro de Custa
       CdsCCSel.First;
       while not(CdsCCSel.EOF) do
       begin

          //Atividade de Projeto
          CdsAPSel.First;
          while not(CdsAPSel.EOF) do
          begin

             //Plano Previdenciário
             CdsPPSel.First;
             while not(CdsPPSel.EOF) do
             begin

                //Patrocinador
                CdsPTSel.First;
                while not(CdsPTSel.EOF) do
                begin
                     //Programa
                     CdsProgramaSel.First;
                     while not(CdsProgramaSel.EOF) do
                     begin
                          //Tipo de Despesa
                          CdsTipoDespesaSel.First;
                          while not(CdsTipoDespesaSel.EOF) do
                          begin

                               inc(iPos);

                               // AndaFormProgresso
                               DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

                               cdsCodigo.Append;

                               cdsCodigo.FieldByName('CODGRUPOORCAMEN').AsString        := CodGrupoOrcamen;
                               cdsCodigo.FieldByName('CODEXTERNOCC').AsString           := CdsCCSel.FieldByName('CODEXTERNO').AsString;
                               cdsCodigo.FieldByName('UNECODIGO').AsString              := CdsAPSel.FieldByName('UNECODIGO').AsString;
                               cdsCodigo.FieldByName('CODPLANO').AsString               := CdsPPSel.FieldByName('CODORCAMENTO').AsString;
                               cdsCodigo.FieldByName('CODPATRO').AsString               := CdsPTSel.FieldByName('CODORCAMENTO').AsString;

                               cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat          := IDGrupoOrcamen;
                               cdsCodigo.FieldByName('CODCENTROCUSTO').AsString         := CdsCCSel.FieldByName('CODCENTROCUSTO').AsString;
                               cdsCodigo.FieldByName('UNIDNEGOC').AsFloat               := CdsAPSel.FieldByName('UNIDNEGOC').AsFloat;
                               cdsCodigo.FieldByName('IDPLANOPREV').AsFloat             := CdsPPSel.FieldByName('IDPLANOPREV').AsFloat;
                               cdsCodigo.FieldByName('IDPATRO').AsFloat                 := CdsPTSel.FieldByName('IDPESSOA').AsFloat;

                               //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                               cdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString      := CdsProgramaSel.FieldByName('IDPROGRAMAORCAMEN').AsString;
                               cdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString   := CdsTipoDespesaSel.FieldByName('IDTIPO_DEPESAORCAMEN').AsString;
                               //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                               cdsCodigo.Post;

                               CdsTipoDespesaSel.Next;
                          end;// while not(CdsTipoDespesaSel.EOF)
                          CdsProgramaSel.Next;
                     end; // while not(CdsProgramaSel.EOF)
                     CdsPTSel.Next;
                end;  // while not(CdsPTSel.EOF)
                CdsPPSel.Next;
             end;  // while not(CdsPPSel.EOF)
             CdsAPSel.Next;
          end;  // while not(CdsAPSel.EOF)
          CdsCCSel.Next;
       end;  // while not(CdsCCSel.EOF)

       //---------------------------------------------------------------------------


       // EscondeFormProgresso
       DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
       // ----------------------------------------------------------------------------------------------

       // ----------------------------------------------------------------------------------------------
       // 4) Define a composição do código
       // ----------------------------------------------------------------------------------------------

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod1 of
          1: sCampo1 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo1 := 'CODEXTERNOCC';
               iPosCC  := 1;
             end;
          3: sCampo1 := 'UNECODIGO';
          4: sCampo1 := 'CODPLANO';
          5: sCampo1 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo1 := 'IDPROGRAMAORCAMEN';
          8: sCampo1 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod2 of
          1: sCampo2 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo2 := 'CODEXTERNOCC';
               iPosCC  := 2;
             end;
          3: sCampo2 := 'UNECODIGO';
          4: sCampo2 := 'CODPLANO';
          5: sCampo2 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo2 := 'IDPROGRAMAORCAMEN';
          8: sCampo2 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod3 of
          1: sCampo3 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo3 := 'CODEXTERNOCC';
               iPosCC  := 3;
             end;
          3: sCampo3 := 'UNECODIGO';
          4: sCampo3 := 'CODPLANO';
          5: sCampo3 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo3 := 'IDPROGRAMAORCAMEN';
          8: sCampo3 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod4 of
          1: sCampo4 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo4 := 'CODEXTERNOCC';
               iPosCC  := 4;
             end;
          3: sCampo4 := 'UNECODIGO';
          4: sCampo4 := 'CODPLANO';
          5: sCampo4 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo4 := 'IDPROGRAMAORCAMEN';
          8: sCampo4 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod5 of
          1: sCampo5 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo5 := 'CODEXTERNOCC';
               iPosCC  := 5;
             end;
          3: sCampo5 := 'UNECODIGO';
          4: sCampo5 := 'CODPLANO';
          5: sCampo5 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo5 := 'IDPROGRAMAORCAMEN';
          8: sCampo5 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       end;


       //Ricardo de Freitas SOL: 159212 - Kintana 1337867

       //Campo 7
       case iTipoCod7 of
          1: sCampo7 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo7 := 'CODEXTERNOCC';
               iPosCC  := 7;
             end;
          3: sCampo7 := 'UNECODIGO';
          4: sCampo7 := 'CODPLANO';
          5: sCampo7 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo7 := 'IDPROGRAMAORCAMEN';
          8: sCampo7 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       end;

       //Campo 8
       case iTipoCod8 of
          1: sCampo8 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo8 := 'CODEXTERNOCC';
               iPosCC  := 8;
             end;
          3: sCampo8 := 'UNECODIGO';
          4: sCampo8 := 'CODPLANO';
          5: sCampo8 := 'CODPATRO';

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          7: sCampo8 := 'IDPROGRAMAORCAMEN';
          8: sCampo8 := 'IDTIPO_DEPESAORCAMEN';
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

       end;
       //Ricardo de Freitas SOL: 159212 - Kintana 1337867- fim

       //Verifica se a regra da formação da conta orçamentária
       If (sCampo1 = '') or (sCampo2 = '') or (sCampo3 = '') or
          (sCampo4 = '') or (sCampo5 = '') or (sCampo7 = '') or
          (sCampo8 = '') then
       begin
         Beep;
         Application.MessageBox(pchar('O sistema não pode gerar as contas orçamentárias pois ' + #13 +
                                      'a regra de formação de contas orçamentárias está incompleta.' + #13 +
                                      'Favor completar a regra de formação da contas orçamentária em: ' + #13 + #13 +
                                      'Principal -> Parâmetros do Sistema -> Aba Contas Orçamentárias'),'Atenção',48);
         Exit;                             
       end;
       // ----------------------------------------------------------------------------------------------

       // ----------------------------------------------------------------------------------------------
       // 4) Itera pelo cdsCodigo, compondo o código final
       // ----------------------------------------------------------------------------------------------

       if bCalculaCodigo then
       begin
          iPos := 0;

          // MostraFormProgresso
          DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

          cdsCodigo.First;
          while not(cdsCodigo.EOF) do
          begin
             inc(iPos);

             // AndaFormProgresso
             DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);
             cdsCodigo.Edit;

             // Alterado por Arnaldo V. Scarin em 08/09/2009
             // Sol: 123436 Kintana: 616983
             // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
             // informar as contas de centro de custos quando o flag de centro de custos estiver
             // desmarcado.
             //if bUsaCodCentroCusto then - comentado por Ricardo

             //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
             //Determina se no código da conta orçamentária terá o código
             //do centro de custo de "XXXX"
             if (Trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) <> 'X') then
               sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                               CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                               CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                               CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                               CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                               //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                               CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                               CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8)
                               //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
             else
             begin
               //Preenchando Código e Centro de Custos
               Case iPosCC of
                 1: sCodigoConta := StringOfChar('X', iTamCod1) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


                 2: sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    StringOfChar('X',iTamCod2) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


                 3: sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    StringOfChar('X',iTamCod3) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

                                
                 4: sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    StringOfChar('X',iTamCod4) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


                 5: sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    StringOfChar('X', iTamCod5) +
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);
                                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

                 //Ricardo de Freitas SOL: 159212 - Kintana 1337867

                 7: sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    StringOfChar('X',iTamCod7) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);


                 8: sCodigoConta := CompletaInicio(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    CompletaInicio(cdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    StringOfChar('X',iTamCod8);
                 //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
               end;
             end;

             cdsCodigo.FieldByName('CODIGO').AsString  := sCodigoConta;

             cdsCodigo.Post;
             cdsCodigo.Next;
          end;

          //Ricardo de Freitas SOL: 159212 - Kintana 1337867
          //Mostrar Tela para Análise de contas orçamentárias , das contas geradas
          //pela parametrização;
          if FAnalisaContasorcamen then
          begin
               AnalisaContasorcamenGeradas(CodGrupoOrcamen,cdsCodigo.Data);
          end;
          //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


          //Tudo OK
          Result := true;

          // EscondeFormProgresso
          DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
       end;  // if bCalculaCodigo
       // ----------------------------------------------------------------------------------------------
   EXCEPT
       on E:Exception do
       begin
         Beep;
         Application.MessageBox(pchar(
                                      'Ocorreu um erro ao gerar as contas orçamentárias. ' + #13 +
                                      'Favor contatar o suporte. '     + #13 +
                                      ' Tipo:  ORC34TY -  '+ E.Classname + #13 +
                                      E.Message),'Atenção',48);
       end;
   END;
end;
// FIM André Pontes - pendência 10065 - 24/09/2003


function TCtrlCadContasOrcPorGrupo.AtualizaTabela(pSql : String) : Boolean;
begin
   Application.ProcessMessages;

   if (memStatus.Tag = 0) then
   begin
      if (ConnectionSide = cnsClient) then
      begin
        Result := Connection.AppServer.AtualizaTabela(pSql);

        if not Result then MessageInfo := Connection.AppServer.MessageInfo;
      end
      else
      begin
         try
            ExecSql(pSql);
            Result := True;
         except
            on E: exception do
            begin
               MessageInfo := E.Message;
               Result := False;
            end;
         end;
      end;
   end
   else
   begin
      MessageInfo := 'Processo cancelado pelo usuário' + #13 + #10;
      GravaLog(MessageInfo);
      Result := False;
   end;
end;





// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TCtrlCadContasOrcPorGrupo.SetCdsAtivProj(Const Value: TClientDataSet);
begin FCdsAtivProj := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsGrupoOrc(Const Value: TClientDataSet);
begin FCdsGrupoOrc := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCentroDeCusto(Const Value: TClientDataSet);
begin FCdsCentroDeCusto := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPatro(Const Value: TClientDataSet);
begin FCdsPatro := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsConta(Const Value: TClientDataSet);
begin FCdsConta := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPlanoPrev(Const Value: TClientDataSet);
begin FCdsPlanoPrev := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsBase(Const Value: TClientDataSet);
begin FCdsBase := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsOrigem(Const Value: TClientDataSet);
begin FCdsOrigem := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsDataView(Const Value: TClientDataSet);
begin FCdsDataView := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsAPSel(const Value: TClientDataSet);
begin FCdsAPSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCCSel(const Value: TClientDataSet);
begin FCdsCCSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPPSel(const Value: TClientDataSet);
begin FCdsPPSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsPTSel(const Value: TClientDataSet);
begin FCdsPTSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCampoSel(const Value: TClientDataSet);
begin FCdsCampoSel := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsParamOrc(const Value: TClientDataSet);
begin FCdsParamOrc := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsContaEspelho(const Value: TClientDataSet);
begin FCdsContaEspelho := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsContaNova(const Value: TClientDataSet);
begin FCdsContaNova := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCentRespon(const Value: TClientDataSet);
begin FCdsCentRespon := Value; end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsCRSel(const Value: TClientDataSet);
begin FCdsCRSel := Value; end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------





function TCtrlCadContasOrcPorGrupo.InclusaoNovaCR(const IDGrupoOrcamen  : Extended;
                                                  const CodGrupoOrcamen : String;
                                                  const IDContaOrcamen  : String;
                                                  const sPath           : String;
                                                  const bSubstCR        : Boolean;
                                                  const bSubstCC        : Boolean;
                                                  const bSubstAP        : Boolean;
                                                  const bSubstPP        : Boolean;
                                                  const bSubstPT        : Boolean;
                                                  const sNomeBilhete    : String
                                                 ): Boolean;
var
   ArqLog   : TextFile;
   iTamanho : Integer;

   iQuant   : Integer;
   iCriada  : Integer;
   iPos     : Integer;

   bLog     : Boolean;
   bInseriu : Boolean;

   sCC      : String;
   sAP      : String;
   sPP      : String;
   sPT      : String;

   sSQL     : String;
   sLinha   : String;
   sCodigo  : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.InclusaoNovaCR(IDGrupoOrcamen,
                                                    CodGrupoOrcamen,
                                                    IDContaOrcamen,
                                                    sPath,
                                                    bSubstCR,
                                                    bSubstCC,
                                                    bSubstAP,
                                                    bSubstPP,
                                                    bSubstPT,
                                                    sNomeBilhete
                                                   );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         MontaCodigosCR(IDGrupoOrcamen, CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;

      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenINCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog


         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo Insert na CONTASORCAMEN e COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         StartTransaction;

         iQuant   := cdsCodigo.RecordCount;
         iPos     := 0;
         iCriada  := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            // AndaFormProgresso
            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

            // -------------------------------------------------------------------------------------
            //    Verifica se a combinação já existe
            // -------------------------------------------------------------------------------------

            if ExisteCombinacaoCR(pPlano,
                                  cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat,
                                  cdsCodigo.FieldByName('CODCENTRORESPON').AsString,
                                  cdsCodigo.FieldByName('CODCENTROCUSTO').AsString,
                                  cdsCodigo.FieldByName('UNIDNEGOC').AsString,
                                  cdsCodigo.FieldByName('IDPLANOPREV').AsString,
                                  cdsCodigo.FieldByName('IDPATRO').AsString
                                 ) then
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                              'Já existe uma conta orçamentária com os mesmos parâmetros.';

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog

               cdsCodigo.Next;
               Continue;
            end;


            // -------------------------------------------------------------------------------------
            //    CONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               sSQL :=
               'INSERT INTO CONTASORCAMEN '                                                        + #13 +
               '( '                                                                                + #13 +
               'IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                        + #13 +
               'IDCONTAORCAMEN, '                                                                  + #13 +
               'NOMECONTAORCAMEN, CODCENTRORESPON, '                                               + #13 +
               'CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                      + #13 +
               'TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                           + #13 +
               'TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                                  + #13 +
               'OBSERVACAO, '                                                                      + #13 +
               'FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '      + #13 +
               'FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '                  + #13 +
               'IDDATAVIEW, ORIGEMCMDV '                                                           + #13 +
               ') '                                                                                + #13 +
               '( '                                                                                + #13 +
               'SELECT '                                                                           + #13 +
               '   IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                     + #13 +

               '   ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString) + ', '                  + #13 +

               '   NOMECONTAORCAMEN, '                                                             + #13 +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + ', '         + #13;

               // Centro de Custo, Ativ/Proj, Plano, Patro -----------------------------------------
               if not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNull)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', '          + #13 +
               '   ' + FormatFloat(#0, pIDEmpresa) + ', '                                          + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, NULL, '                                                                   + #13;
               end;

               if not(cdsCodigo.FieldByName('UNIDNEGOC').IsNull)
                  and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                          + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, '                                                                         + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPLANOPREV').IsNull)
                  and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '                        + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, '                                                                         + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPATRO').IsNull)
                  and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                            + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   NULL, '                                                                         + #13;
               end;
               // ----------------------------------------------------------------------------------

               sSQL := sSQL +
               '   TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                        + #13 +
               '   TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                               + #13 +
               '   OBSERVACAO, '                                                                   + #13 +
               '   FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '   + #13 +
               '   FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '               + #13 +
               '   IDDATAVIEW, ORIGEMCMDV '                                                        + #13 +
               'FROM '                                                                             + #13 +
               '   CONTASORCAMEN '                                                                 + #13 +
               'WHERE '                                                                            + #13 +
               '   IDCONTAORCAMEN = ''-1'' '                                                       + #13 +
               ') ';

               bInseriu := ExecSQL(sSQL);
               if not(bInseriu) then Raise Exception.Create('Erro');

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                 'ERRO na inserção da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except


            // -------------------------------------------------------------------------------------
            //    COMPCONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               sSQL :=
               'INSERT INTO COMPCONTASORCAMEN '                                           + #13 +
               '( '                                                                       + #13 +
               'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                        + #13 +
               'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         + #13 +
               'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       + #13 +
               'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, '                                + #13 +
               'CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, IDPLANOPREV, IDPATRO, '             + #13 +
               'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
               'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
               'CODTIPDOC '                                                               + #13 +
               ') '                                                                       + #13 +
               '( '                                                                       + #13 +
               'SELECT '                                                                  + #13 +
               '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        + #13 +

               '   ' + QuotedStr(cdsCodigo.FieldByName('CODIGO').AsString) + ', '         + #13 +

               '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      + #13 +
               '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    + #13 +
               '   IDPESSOA, CODTIPRECDES, '                                              + #13;

               // ----------------------------------------------------------------------------------
               if (bSubstCR) and not(cdsCodigo.FieldByName('CODCENTRORESPON').IsNull)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + ', '+ #13;
               end
               else
               begin
                  sSQL := sSQL + '   CODCENTRORESPON, '                                   + #13;
               end;

               if (bSubstCC) and not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNull)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', ' + #13 +
               '   ' + FormatFloat(#0, pIDEmpresa) + ', '                                 + #13;
               end
               else
               begin
                  sSQL := sSQL + '   CODCENTROCUSTO, IDEMPRESA, '                         + #13;
               end;

               if (bSubstAP) and not(cdsCodigo.FieldByName('UNIDNEGOC').IsNull)
                  and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                 + #13;
               end
               else
               begin
                  sSQL := sSQL + '   UNIDNEGOC, '                                         + #13;
               end;

               if (bSubstPP) and not(cdsCodigo.FieldByName('IDPLANOPREV').IsNull)
                  and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '               + #13;
               end
               else
               begin
                  sSQL := sSQL + '   IDPLANOPREV, '                                       + #13;
               end;

               if (bSubstPT) and not(cdsCodigo.FieldByName('IDPATRO').IsNull)
                  and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                   + #13;
               end
               else
               begin
                  sSQL := sSQL + '   IDPATRO, '                                           + #13;
               end;
               // ----------------------------------------------------------------------------------

               sSQL := sSQL +
               'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
               'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
               'CODTIPDOC '                                                               + #13 +
               'FROM '                                                                    + #13 +
               '   COMPCONTASORCAMEN '                                                    + #13 +
               'WHERE '                                                                   + #13 +
               '   IDCONTAORCAMEN = ''-1'' '                                              + #13 +
               ') ';

               bInseriu := ExecSQL(sSQL);
               if not(bInseriu) then Raise Exception.Create('Erro');

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                 'ERRO na inserção da Composição da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);
                  end;  // if bLog

                  Exit;
               end;  // on E:Exception
            end;  // try..except

            // -------------------------------------------------------------------------------------

            if bLog then
            begin
               sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40);

               WriteLN(ArqLog, sLinha);
            end;  // if bLog

            inc(iCriada);

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

         Commit;

         // ----------------------------------------------------------------------------------------
         // 3) Exclui a conta "base"
         // ----------------------------------------------------------------------------------------
         ExcluiContaEspelho;
         // ----------------------------------------------------------------------------------------

         Result := True;

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Criando Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram criadas ' + IntToStr(iCriada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog
      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



function TCtrlCadContasOrcPorGrupo.AlteracaoNovaCR(const IDContaEspelho  : String;
                                                   const IDGrupoOrcamen  : String;
                                                   const CodGrupoOrcamen : String;
                                                   const IDEmpresProp    : String;
                                                   const sPath           : String;
                                                   const bSubstCompConta : Boolean;
                                                   const bSubstCR        : Boolean;
                                                   const bSubstCC        : Boolean;
                                                   const bSubstAP        : Boolean;
                                                   const bSubstPP        : Boolean;
                                                   const bSubstPT        : Boolean;
                                                   const sNomeBilhete    : String
                                                  ): Boolean;
var
   iQuant    : Integer;
   iAlterada : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;
   bAlterou  : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlteracaoNovaCR(IDContaEspelho,
                                                     IDGrupoOrcamen,
                                                     CodGrupoOrcamen,
                                                     IDEmpresProp,
                                                     bSubstCompConta,
                                                     bSubstCR,
                                                     bSubstCC,
                                                     bSubstAP,
                                                     bSubstPP,
                                                     bSubstPT,
                                                     sNomeBilhete
                                                    );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigosCR(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenALTERACAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         StartTransaction;

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iAlterada := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Atualizando Contas Orçamentárias...']);

         // Abre a tabela de contas orçamentárias, trazendo a conta que será usada como "espelho"
         sSQL :=
         'SELECT * '                + #13 +
         'FROM '                    + #13 +
         '   CONTASORCAMEN '        + #13 +
         'WHERE '                                                 + #13 +
         '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)   + #13 +
         '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen              + #13 +
         '   AND IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

         cdsContaEspelho.Close;
         cdsContaEspelho.Data := GetDataPacket(sSQL);
         // ----------------------------------------------------------------------------------

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Atualizando Contas Orçamentárias...']);

            // -------------------------------------------------------------------------------------
            //    CONTASORCAMEN
            // -------------------------------------------------------------------------------------

            try
               // ----------------------------------------------------------------------------------
               // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
               // *** Garante não haver problemas na nova inserção da CompContas, o que poderia de
               //     outra forma ocorrer (se a composição do código for mudada, p.ex.) ***
               // ----------------------------------------------------------------------------------
               sSQL :=
               'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                                  + #13 +
               'WHERE '                                                                                     + #13 +
               '       IDPLANOORCAMEN  = ' + FormatFloat('#0', pPlano)                                      + #13 +
               '   AND IDGRUPOORCAMEN  = ' + IDGrupoOrcamen                                                 + #13 +
               '   AND CODCENTRORESPON = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)   + #13;

               // ----------------------------------------------------------------------------------
               if not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNULL)
                  and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
               begin
                  sSQL := sSQL +
               '   AND CODCENTROCUSTO  = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)    + #13 +
               '   AND IDEMPRESA       = ' + IDEmpresProp                                                   + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND CODCENTROCUSTO  IS NULL '                                                            + #13;
               end;

               if not(cdsCodigo.FieldByName('UNIDNEGOC').IsNULL)
                  and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   AND UNIDNEGOC       = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                    + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND UNIDNEGOC       IS NULL '                                                            + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPLANOPREV').IsNULL)
                  and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   AND IDPLANOPREV     = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                  + #13;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND IDPLANOPREV     IS NULL '                                                            + #13;
               end;

               if not(cdsCodigo.FieldByName('IDPATRO').IsNULL)
                  and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
               begin
                  sSQL := sSQL +
               '   AND IDPATRO         = ' + cdsCodigo.FieldByName('IDPATRO').AsString;
               end
               else
               begin
                  sSQL := sSQL +
               '   AND IDPATRO         IS NULL ';
               end;
               // ----------------------------------------------------------------------------------

               cdsContaNova.Close;
               cdsContaNova.Data := GetDataPacket(sSQL);
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               //    Se a conta atual for a própria conta espelho, pula o registro, verifica se
               //    deve alterar a composição da mesma, mas não faz (delete + insert)
               // ----------------------------------------------------------------------------------
               if CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString = CdsContaEspelho.FieldByName('IDCONTAORCAMEN').AsString then
               begin
                  if bSubstCompConta then
                  begin
                     try
                        if (bSubstCR) and not(cdsCodigo.FieldByName('CODCENTRORESPON').IsNull)
                           and (length(trim(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)) > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                                            + #13 +
                           'SET '                                                                                 + #13 +
                           '   CODCENTRORESPON = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + #13 +
                           'WHERE '                                                                               + #13 +
                           '   IDCONTAORCAMEN  = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                        if (bSubstCC) and not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNull)
                           and (length(trim(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)) > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                                            + #13 +
                           'SET '                                                                                 + #13 +
                           '   CODCENTROCUSTO = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)   + #13 +
                           'WHERE '                                                                               + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           ExecSQL(sSQL);
                        end;

                        if (bSubstAP) and not(cdsCodigo.FieldByName('UNIDNEGOC').IsNull)
                           and (cdsCodigo.FieldByName('UNIDNEGOC').AsFloat > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                          + #13 +
                           'SET '                                                               + #13 +
                           '   UNIDNEGOC      = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + #13 +
                           'WHERE '                                                             + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                        if (bSubstPP) and not(cdsCodigo.FieldByName('IDPLANOPREV').IsNull)
                           and (cdsCodigo.FieldByName('IDPLANOPREV').AsFloat > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                             + #13 +
                           'SET '                                                                  + #13 +
                           '   IDPLANOPREV    = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString  + #13 +
                           'WHERE '                                                                + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                        if (bSubstPT) and not(cdsCodigo.FieldByName('IDPATRO').IsNull)
                           and (cdsCodigo.FieldByName('IDPATRO').AsFloat > 0) then
                        begin
                           sSQL :=
                           'UPDATE COMPCONTASORCAMEN '                                          + #13 +
                           'SET '                                                               + #13 +
                           '   IDPATRO        = ' + cdsCodigo.FieldByName('IDPATRO').AsString   + #13 +
                           'WHERE '                                                             + #13 +
                           '   IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho);

                           bAlterou := ExecSQL(sSQL);
                           if not(bAlterou) then Raise Exception.Create('Erro');
                        end;

                     except

                        on E:Exception do
                        begin
                           Rollback;

                           if bLog then
                           begin
                              sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                         CompletaInicio(IDContaEspelho, ' ', 25) + ' - ' +
                                         'ERRO na atualização da Composição da Conta Orçamentária: ' +
                                         E.message;

                              MessageInfo := sLinha;

                              WriteLN(ArqLog, sLinha);
                              WriteLN(ArqLog, '');

                              sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                              WriteLN(ArqLog, sLinha);
                           end;  // if bLog
                           Exit;
                        end;  // on E:Exception
                     end;  // try..except

                  end;  // if bSubstCompConta

                  cdsCodigo.Next;
                  Continue;
               end;
               // ----------------------------------------------------------------------------------


               sSQL :=
               'UPDATE CONTASORCAMEN '                                                                                     + #13 +
               'SET '                                                                                                      + #13 +
               '   NOMECONTAORCAMEN    = ' + QuotedStr(cdsContaEspelho.FieldByName('NOMECONTAORCAMEN').AsString)  + ', '   + #13 +
               '   TIPOCALCREALIZADO   = ' + QuotedStr(cdsContaEspelho.FieldByName('TIPOCALCREALIZADO').AsString) + ', '   + #13 +
               '   FORMULAREALIZADO    = ' + QuotedStr(cdsContaEspelho.FieldByName('FORMULAREALIZADO').AsString)  + ', '   + #13 +
               '   VLRINFORMADOREAL    = ' + QuotedStr(cdsContaEspelho.FieldByName('VLRINFORMADOREAL').AsString)  + ', '   + #13 +
               '   TIPOCALCORCADO      = ' + QuotedStr(cdsContaEspelho.FieldByName('TIPOCALCORCADO').AsString)    + ', '   + #13 +
               '   FORMULAORCADO       = ' + QuotedStr(cdsContaEspelho.FieldByName('FORMULAORCADO').AsString)     + ', '   + #13 +
               '   VLRINFORMADOORC     = ' + QuotedStr(cdsContaEspelho.FieldByName('VLRINFORMADOORC').AsString)   + ', '   + #13 +
               '   OBSERVACAO          = ' + QuotedStr(cdsContaEspelho.FieldByName('OBSERVACAO').AsString)        + ', '   + #13 +
               '   FLGCONTAMONETARIA   = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCONTAMONETARIA').AsString) + ', '   + #13 +
               '   FLGSINALCONTA       = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGSINALCONTA').AsString)     + ', '   + #13 +
               '   FLGCALCORCADO       = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCALCORCADO').AsString)     + ', '   + #13 +
               '   FLGCALCREAL         = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGCALCREAL').AsString)       + ', '   + #13 +
               '   FLGINFDIAMES        = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGINFDIAMES').AsString)      + ', '   + #13 +
               '   FLGACUMULADO        = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGACUMULADO').AsString)      + ', '   + #13 +
               '   FLGTRANSFSALDO      = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGTRANSFSALDO').AsString)    + ', '   + #13 +
               '   FLGATIVA            = ' + QuotedStr(cdsContaEspelho.FieldByName('FLGATIVA').AsString)          + ', '   + #13 +
               '   DATAATIVA           = ' + QuotedStr(cdsContaEspelho.FieldByName('DATAATIVA').AsString)         + ', '   + #13 +
               '   DATAINATIVA         = ' + QuotedStr(cdsContaEspelho.FieldByName('DATAINATIVA').AsString)       + ', '   + #13 +
               '   IDDATAVIEW          = ' + QuotedStr(cdsContaEspelho.FieldByName('IDDATAVIEW').AsString)        + ', '   + #13 +
               '   ORIGEMCMDV          = ' + QuotedStr(cdsContaEspelho.FieldByName('ORIGEMCMDV').AsString)                 + #13 +
               'WHERE '                                                                                                    + #13 +
               '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                                      + #13 +
               '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                                 + #13 +
               '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);


               bAlterou := ExecSQL(sSQL);
               if not(bAlterou) then Raise Exception.Create('Erro');

            except
               on E:Exception do
               begin
                  Rollback;

                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                 'ERRO na atualização da Conta Orçamentária: ' +
                                 E.message;

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                  end;  // if bLog
                  Exit;
               end;  // on E:Exception
            end;  // try..except


            // -------------------------------------------------------------------------------------
            //    COMPCONTASORCAMEN
            // -------------------------------------------------------------------------------------

            if bSubstCompConta then
            begin
               // Exclui a composição anterior
               if not(ExcluiCompContas(FormatFloat('#0', pPlano),
                                       CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString
                                      )) then
               begin
                  if bLog then
                  begin
                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                 CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                 'ERRO na exclusão da Composição anterior da Conta Orçamentária.';

                     MessageInfo := sLinha;

                     WriteLN(ArqLog, sLinha);

                     WriteLN(ArqLog, '');

                     sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                     WriteLN(ArqLog, sLinha);

                     Exit;
                  end;  // if bLog
               end
               else
               begin

                  try
                     sSQL :=
                     'INSERT INTO COMPCONTASORCAMEN '                                              + #13 +
                     '( '                                                                          + #13 +
                     'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                           + #13 +
                     'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                            + #13 +
                     'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                          + #13 +
                     'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                        + #13 +
                     'CODCENTROCUSTO, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                           + #13 +
                     'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '                 + #13 +
                     'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '                + #13 +
                     'CODTIPDOC '                                                                  + #13 +
                     ') '                                                                          + #13 +
                     '( '                                                                          + #13 +
                     'SELECT '                                                                     + #13 +
                     '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                           + #13 +

                     '   ' + QuotedStr(cdsContaNova.FieldByName('IDCONTAORCAMEN').AsString) + ', ' + #13 +

                     '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         + #13 +
                     '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       + #13 +
                     '   IDPESSOA, CODTIPRECDES, IDEMPRESA, '                                      + #13;

                     // ----------------------------------------------------------------------------
                     if bSubstCR then
                     begin
                        sSQL := sSQL +
                     '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString) + ', '   + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   CODCENTRORESPON, '                                      + #13;
                     end;

                     if bSubstCC then
                     begin
                        sSQL := sSQL +
                     '   ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString) + ', '    + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   CODCENTROCUSTO, '                                       + #13;
                     end;

                     if bSubstAP then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '                    + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   UNIDNEGOC, '                                            + #13;
                     end;

                     if bSubstPP then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '                  + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   IDPLANOPREV, '                                          + #13;
                     end;

                     if bSubstPT then
                     begin
                        sSQL := sSQL +
                     '   ' + cdsCodigo.FieldByName('IDPATRO').AsString + ', '                      + #13;
                     end
                     else
                     begin
                        sSQL := sSQL + '   IDPATRO, '                                              + #13;
                     end;
                     // ----------------------------------------------------------------------------

                     sSQL := sSQL +
                     '   PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              + #13 +
                     '   CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             + #13 +
                     '   CODTIPDOC '                                                               + #13 +
                     'FROM '                                                                       + #13 +
                     '   COMPCONTASORCAMEN '                                                       + #13 +
                     'WHERE '                                                                      + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                        + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(IDContaEspelho)                        + #13 +
                     ') ';

                     bAlterou := ExecSQL(sSQL);
                     if not(bAlterou) then Raise Exception.Create('Erro');

                  except
                     on E:Exception do
                     begin
                        Rollback;

                        if bLog then
                        begin
                           sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                       CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                       'ERRO na inserção da Composição da Conta Orçamentária: ' +
                                       E.message;

                           MessageInfo := sLinha;

                           WriteLN(ArqLog, sLinha);

                           WriteLN(ArqLog, '');

                           sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Processo interrompido';

                           WriteLN(ArqLog, sLinha);
                        end;  // if bLog
                        Exit;
                     end;  // on E:Exception
                  end;  // try..except

               end;  // if not(ExcluiCompConts(...
            end;  // if bSubstCompConta

            // -------------------------------------------------------------------------------------

            if bLog then
            begin
               sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' + CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40);

               WriteLN(ArqLog, sLinha);
            end;  // if bLog

            inc(iAlterada);

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

         Commit;

         Result := True;

         // ----------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram alteradas ' + IntToStr(iAlterada) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant - 1) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



function TCtrlCadContasOrcPorGrupo.ExclusaoNovaCR(const IDGrupoOrcamen  : String;
                                                  const CodGrupoOrcamen : String;
                                                  const IDEmpresProp    : String;
                                                  const sPath           : String;
                                                  const bSubstCR        : Boolean;
                                                  const bSubstCC        : Boolean;
                                                  const bSubstAP        : Boolean;
                                                  const bSubstPP        : Boolean;
                                                  const bSubstPT        : Boolean;
                                                  const sNomeBilhete    : String
                                                 ): Boolean;
var
   iQuant    : Integer;
   iExcluida : Integer;
   iPos      : Integer;

   ArqLog    : TextFile;

   bLog      : Boolean;
   bExcluiu  : Boolean;

   sCC       : String;
   sAP       : String;
   sPP       : String;
   sPT       : String;

   sSQL      : String;
   sLinha    : String;
begin
   Result := True;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExclusaoNovaCR(IDGrupoOrcamen,
                                                    CodGrupoOrcamen,
                                                    IDEmpresProp,
                                                    bSubstCR,
                                                    bSubstCC,
                                                    bSubstAP,
                                                    bSubstPP,
                                                    bSubstPT,
                                                    sNomeBilhete
                                                   );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      // -------------------------------------------------------------------------------------------
      try
         MontaCodigosCR(StrToFloat(IDGrupoOrcamen), CodGrupoOrcamen, True, sNomeBilhete);
      except
         on E:Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
            Exit;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      try
         bLog := not(isAppServer);

         // ----------------------------------------------------------------------------------------
         // 1) Prepara gravação do arquivo de log
         // ----------------------------------------------------------------------------------------

         if bLog then
         begin
            AssignFile(ArqLog, sPath + 'ContasOrcamenEXCLUSAO' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
            ReWrite(ArqLog);

            sLinha   := FormatDateTime('hh:nn:ss', Now) + ' Início do processo...';

            WriteLN(ArqLog, sLinha);
            WriteLN(ArqLog, '');
         end;  // if bLog

         // ----------------------------------------------------------------------------------------
         // 2) Itera pelo cdsCodigo, fazendo update na CONTASORCAMEN e
         //    delete + insert na COMPCONTASORCAMEN
         // ----------------------------------------------------------------------------------------

         iQuant    := cdsCodigo.RecordCount;
         iPos      := 0;
         iExcluida := 0;

         DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

         cdsCodigo.First;
         while not(cdsCodigo.EOF) do
         begin
            inc(iPos);

            DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Excluindo Contas Orçamentárias...']);

            // Abre a tabela de contas orçamentárias, trazendo a conta que será alterada
            // *** Garante não haver problemas na inserção da CompContas, o que poderia de outra
            //     forma ocorrer (se a composição do código for mudada, p.ex.) ***
            sSQL :=
            'SELECT IDCONTAORCAMEN FROM CONTASORCAMEN '                                                  + #13 +
            'WHERE '                                                                                     + #13 +
            '       IDPLANOORCAMEN  = ' + FormatFloat('#0', pPlano)                                      + #13 +
            '   AND IDGRUPOORCAMEN  = ' + IDGrupoOrcamen                                                 + #13 +
            '   AND CODCENTRORESPON = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTRORESPON').AsString)   + #13;

            // ----------------------------------------------------------------------------------
            if not(cdsCodigo.FieldByName('CODCENTROCUSTO').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND CODCENTROCUSTO  = ' + QuotedStr(cdsCodigo.FieldByName('CODCENTROCUSTO').AsString)    + #13 +
            '   AND IDEMPRESA       = ' + IDEmpresProp                                                   + #13;
            end
            else
            begin
               sSQL := sSQL +
            '   AND CODCENTROCUSTO  IS NULL '                                                            + #13;
            end;

            if not(cdsCodigo.FieldByName('UNIDNEGOC').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND UNIDNEGOC       = ' + cdsCodigo.FieldByName('UNIDNEGOC').AsString                    + #13;
            end
            else
            begin
               sSQL := sSQL +
            '   AND UNIDNEGOC       IS NULL '                                                            + #13;
            end;

            if not(cdsCodigo.FieldByName('IDPLANOPREV').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND IDPLANOPREV     = ' + cdsCodigo.FieldByName('IDPLANOPREV').AsString                  + #13;
            end
            else
            begin
               sSQL := sSQL +
            '   AND IDPLANOPREV     IS NULL '                                                            + #13;
            end;

            if not(cdsCodigo.FieldByName('IDPATRO').IsNULL) then
            begin
               sSQL := sSQL +
            '   AND IDPATRO         = ' + cdsCodigo.FieldByName('IDPATRO').AsString;
            end
            else
            begin
               sSQL := sSQL +
            '   AND IDPATRO         IS NULL ';
            end;
            // ----------------------------------------------------------------------------------

            cdsContaNova.Close;
            cdsContaNova.Data := GetDataPacket(sSQL);
            // ----------------------------------------------------------------------------------

            if not(cdsContaNova.isEmpty) then
            begin
               StartTransaction;

               try
                  sSQL :=
                  'DELETE FROM COMPCONTASORCAMEN '                                                             + #13 +
                  'WHERE '                                                                                     + #13 +
                  '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                  '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                  bExcluiu := ExecSQL(sSQL);

                  if bExcluiu then
                  begin
                     sSQL :=
                     'DELETE FROM CONTASORCAMEN '                                                                 + #13 +
                     'WHERE '                                                                                     + #13 +
                     '       IDPLANOORCAMEN = ' + FormatFloat('#0', pPlano)                                       + #13 +
                     '   AND IDGRUPOORCAMEN = ' + IDGrupoOrcamen                                                  + #13 +
                     '   AND IDCONTAORCAMEN = ' + QuotedStr(CdsContaNova.FieldByName('IDCONTAORCAMEN').AsString);

                     bExcluiu := ExecSQL(sSQL, True);
                  end;  // if bExcluiu

                  if bExcluiu then
                  begin
                     Commit;

                     inc(iExcluida);

                     if bLog then
                     begin
                        sLinha := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                  CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40);

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end
                  else  // if ExecSQL(sSQL, True)
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                    'Conta Orçamentária NÃO EXCLUÍDA.';

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // if bExcluiu

               except
                  on E: Exception do
                  begin
                     Rollback;

                     if bLog then
                     begin
                        sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                                    CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                                    'ERRO na exclusão da Conta Orçamentária: ' + E.Message;

                        MessageInfo := sLinha;

                        WriteLN(ArqLog, sLinha);
                     end;  // if bLog
                  end;  // on E: Exception
               end;  // try..except

            end
            else  // if not(cdsContaNova.isEmpty)
            begin
               if bLog then
               begin
                  sLinha   := FormatDateTime('hh:nn:ss', Now) + ' ' +
                              CompletaFIM(cdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' +
                              'Conta Orçamentária não encontrada.';

                  MessageInfo := sLinha;

                  WriteLN(ArqLog, sLinha);
               end;  // if bLog
            end;  // if not(cdsContaNova.isEmpty)

            cdsCodigo.Next;
         end;  // while not(cdsCodigo.EOF)

      // -------------------------------------------------------------------------------------------

      finally
         // EscondeFormProgresso
         DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Atualizando Composição das Contas Orçamentárias...']);

         if bLog then
         begin
            WriteLN(ArqLog, '');

            sLinha := 'Foram excluídas ' + IntToStr(iExcluida) + ' Contas Orçamentárias, de ' +
                      IntToStr(iQuant) + ' previstas.';

            WriteLN(ArqLog, sLinha);

            WriteLN(ArqLog, '');

            sLinha := FormatDateTime('hh:nn:ss', Now) + ' Término do processo.';

            WriteLN(ArqLog, sLinha);
            CloseFile(ArqLog);
         end;  // if bLog

      end;  // try..finally
   end;  // if ConnectionSide = cnsClient
end;



// FIM André Pontes - pendência 15700 - 03/12/2003
procedure TCtrlCadContasOrcPorGrupo.MontaCodigosCR(const IDGrupoOrcamen   : Extended;
                                                   const CodGrupoOrcamen  : String;
                                                   const bCalculaCodigo   : Boolean;
                                                   const sNomeBilhete     : String
                                                  );
var
   sSQL        : String;

   sCampo1     : String;
   sCampo2     : String;
   sCampo3     : String;
   sCampo4     : String;
   sCampo5     : String;
   sCampo6     : String;

   iPos        : Integer;
   iQuant      : Integer;
   iQuantCR    : Integer;
   iQuantCC    : Integer;
   iQuantAP    : Integer;
   iQuantPP    : Integer;
   iQuantPT    : Integer;

   iTamCod     : Integer;
   iTamCod1    : Integer;
   iTamCod2    : Integer;
   iTamCod3    : Integer;
   iTamCod4    : Integer;
   iTamCod5    : Integer;
   iTamCod6    : Integer;

   iTipoCod1   : Integer;
   iTipoCod2   : Integer;
   iTipoCod3   : Integer;
   iTipoCod4   : Integer;
   iTipoCod5   : Integer;
   iTipoCod6   : Integer;
begin
   // ----------------------------------------------------------------------------------------------
   // 1) Monta o cds que conterá os registros dos códigos
   // ----------------------------------------------------------------------------------------------

   iTipoCod1   := CdsParamOrc.FieldByName('FLGTIPOCOD1').AsInteger;
   iTipoCod2   := CdsParamOrc.FieldByName('FLGTIPOCOD2').AsInteger;
   iTipoCod3   := CdsParamOrc.FieldByName('FLGTIPOCOD3').AsInteger;
   iTipoCod4   := CdsParamOrc.FieldByName('FLGTIPOCOD4').AsInteger;
   iTipoCod5   := CdsParamOrc.FieldByName('FLGTIPOCOD5').AsInteger;
   iTipoCod6   := CdsParamOrc.FieldByName('FLGTIPOCOD6').AsInteger;

   iTamCod1    := CdsParamOrc.FieldByName('TAMCOD1').AsInteger;
   iTamCod2    := CdsParamOrc.FieldByName('TAMCOD2').AsInteger;
   iTamCod3    := CdsParamOrc.FieldByName('TAMCOD3').AsInteger;
   iTamCod4    := CdsParamOrc.FieldByName('TAMCOD4').AsInteger;
   iTamCod5    := CdsParamOrc.FieldByName('TAMCOD5').AsInteger;
   iTamCod6    := CdsParamOrc.FieldByName('TAMCOD6').AsInteger;

   iTamCod     := iTamCod1 + iTamCod2 + iTamCod3 + iTamCod4 + iTamCod5 + iTamCod6;

   sSQL :=
   'SELECT '                                                            + #13 +

   '   ' + QuotedStr(StringOfChar(' ', iTamCod)) + ' AS CODIGO, '       + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 12)) + ' AS CODGRUPOORCAMEN, '   + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTRORESPON, '   + #13 +
   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCR, '      + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTROCUSTO, '    + #13 +
   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCC, '      + #13 +

   '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS UNECODIGO, '         + #13 +
   '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPLANO, '          + #13 +
   '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPATRO, '          + #13 +

   '0.00 AS IDGRUPOORCAMEN, '                                           + #13 +
   '0.00 AS UNIDNEGOC, '                                                + #13 +
   '0.00 AS IDPLANOPREV, '                                              + #13 +
   '0.00 AS IDPATRO '                                                   + #13 +

   'FROM '                                                              + #13 +
   '   DUAL '                                                           + #13 +
   'WHERE '                                                             + #13 +
   '   1 = 2 ';

   cdsCodigo.Close;
   cdsCodigo.Data := GetDataPacket(sSQL);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 2) Calcula a quantidade de códigos a gerar (apenas para o form de progressão)
   // ----------------------------------------------------------------------------------------------

   iQuantCR := CdsCRSel.RecordCount;
   iQuantCC := 1;
   iQuantAP := 1;
   iQuantPP := 1;
   iQuantPT := 1;

   if CdsCCSel.RecordCount > 0 then iQuantCC := CdsCCSel.RecordCount;
   if CdsAPSel.RecordCount > 0 then iQuantAP := CdsAPSel.RecordCount;
   if CdsPPSel.RecordCount > 0 then iQuantPP := CdsPPSel.RecordCount;
   if CdsPTSel.RecordCount > 0 then iQuantPT := CdsPTSel.RecordCount;

   iQuant   := iQuantCR * iQuantCC * iQuantAP * iQuantPP * iQuantPT;
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 3) Geração dos Códigos
   // ----------------------------------------------------------------------------------------------

   iPos   := 0;

   // MostraFormProgresso
   DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

   CdsCRSel.First;
   while not(CdsCRSel.EOF) do
   begin
      CdsCCSel.First;
      repeat
         CdsAPSel.First;
         repeat
            CdsPPSel.First;
            repeat
               CdsPTSel.First;
               repeat
                  cdsCodigo.Append;

                  cdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat       := IDGrupoOrcamen;
                  cdsCodigo.FieldByName('CODGRUPOORCAMEN').AsString     := CodGrupoOrcamen;

                  cdsCodigo.FieldByName('CODCENTRORESPON').AsString     := CdsCRSel.FieldByName('CODCENTRORESPON').AsString;
                  cdsCodigo.FieldByName('CODEXTERNOCR').AsString        := CdsCRSel.FieldByName('CODEXTERNO').AsString;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('CODCENTROCUSTO').AsString   := CdsCCSel.FieldByName('CODCENTROCUSTO').AsString;
                     cdsCodigo.FieldByName('CODEXTERNOCC').AsString     := CdsCCSel.FieldByName('CODEXTERNO').AsString;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('CODCENTROCUSTO').Clear;
                     cdsCodigo.FieldByName('CODEXTERNOCC').Clear;
                  end;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('UNECODIGO').AsString        := CdsAPSel.FieldByName('UNECODIGO').AsString;
                     cdsCodigo.FieldByName('UNIDNEGOC').AsFloat         := CdsAPSel.FieldByName('UNIDNEGOC').AsFloat;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('UNECODIGO').Clear;
                     cdsCodigo.FieldByName('UNIDNEGOC').Clear;
                  end;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('CODPLANO').AsString         := CdsPPSel.FieldByName('CODORCAMENTO').AsString;
                     cdsCodigo.FieldByName('IDPLANOPREV').AsFloat       := CdsPPSel.FieldByName('IDPLANOPREV').AsFloat;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('CODPLANO').Clear;
                     cdsCodigo.FieldByName('IDPLANOPREV').Clear;
                  end;

                  if not(CdsCCSel.IsEmpty) then
                  begin
                     cdsCodigo.FieldByName('CODPATRO').AsString         := CdsPTSel.FieldByName('CODORCAMENTO').AsString;
                     cdsCodigo.FieldByName('IDPATRO').AsFloat           := CdsPTSel.FieldByName('IDPESSOA').AsFloat;
                  end
                  else
                  begin
                     cdsCodigo.FieldByName('CODPATRO').Clear;
                     cdsCodigo.FieldByName('IDPATRO').Clear;
                  end;

                  cdsCodigo.Post;

                  inc(iPos);
                  // AndaFormProgresso
                  DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

                  CdsPTSel.Next;
               until CdsPTSel.EOF;
               CdsPPSel.Next;
            until CdsPPSel.EOF;
            CdsAPSel.Next;
         until CdsAPSel.EOF;
         CdsCCSel.Next;
      until CdsCCSel.EOF;
      CdsCRSel.Next;
   end;  // while not(CdsCRSel.EOF)

   // EscondeFormProgresso
   DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 4) Define a composição do código
   // ----------------------------------------------------------------------------------------------

   case iTipoCod1 of
      1: sCampo1 := 'CODGRUPOORCAMEN';
      2: sCampo1 := 'CODEXTERNOCC';
      3: sCampo1 := 'UNECODIGO';
      4: sCampo1 := 'CODPLANO';
      5: sCampo1 := 'CODPATRO';
      6: sCampo1 := 'CODEXTERNOCR';
   end;

   case iTipoCod2 of
      1: sCampo2 := 'CODGRUPOORCAMEN';
      2: sCampo2 := 'CODEXTERNOCC';
      3: sCampo2 := 'UNECODIGO';
      4: sCampo2 := 'CODPLANO';
      5: sCampo2 := 'CODPATRO';
      6: sCampo2 := 'CODEXTERNOCR';
   end;

   case iTipoCod3 of
      1: sCampo3 := 'CODGRUPOORCAMEN';
      2: sCampo3 := 'CODEXTERNOCC';
      3: sCampo3 := 'UNECODIGO';
      4: sCampo3 := 'CODPLANO';
      5: sCampo3 := 'CODPATRO';
      6: sCampo3 := 'CODEXTERNOCR';
   end;

   case iTipoCod4 of
      1: sCampo4 := 'CODGRUPOORCAMEN';
      2: sCampo4 := 'CODEXTERNOCC';
      3: sCampo4 := 'UNECODIGO';
      4: sCampo4 := 'CODPLANO';
      5: sCampo4 := 'CODPATRO';
      6: sCampo4 := 'CODEXTERNOCR';
   end;

   case iTipoCod5 of
      1: sCampo5 := 'CODGRUPOORCAMEN';
      2: sCampo5 := 'CODEXTERNOCC';
      3: sCampo5 := 'UNECODIGO';
      4: sCampo5 := 'CODPLANO';
      5: sCampo5 := 'CODPATRO';
      6: sCampo5 := 'CODEXTERNOCR';
   end;

   case iTipoCod6 of
      1: sCampo6 := 'CODGRUPOORCAMEN';
      2: sCampo6 := 'CODEXTERNOCC';
      3: sCampo6 := 'UNECODIGO';
      4: sCampo6 := 'CODPLANO';
      5: sCampo6 := 'CODPATRO';
      6: sCampo6 := 'CODEXTERNOCR';
   end;
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   // 4) Itera pelo cdsCodigo, compondo o código final
   // ----------------------------------------------------------------------------------------------

   if bCalculaCodigo then
   begin
      iPos := 0;

      // MostraFormProgresso
      DoProgresso([sNomeBilhete, 0, 0, iQuant, iPos, 'Montando Códigos...']);

      cdsCodigo.First;
      while not(cdsCodigo.EOF) do
      begin
         inc(iPos);

         // AndaFormProgresso
         DoProgresso([sNomeBilhete, 1, 0, iQuant, iPos, 'Montando Códigos...']);

         cdsCodigo.Edit;
         cdsCodigo.FieldByName('CODIGO').AsString  := CompletaFim(cdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                                      CompletaFim(cdsCodigo.FieldByName(sCampo6).AsString, '0', iTamCod6);
         cdsCodigo.Post;
         cdsCodigo.Next;
      end;

      // EscondeFormProgresso
      DoProgresso([sNomeBilhete, 2, 0, iQuant, iPos, 'Montando Códigos...']);
   end;  // if bCalculaCodigo
   // ----------------------------------------------------------------------------------------------
end;


function TCtrlCadContasOrcPorGrupo.ExisteCombinacaoCR(const IDPlanoOrcamen : Extended;
                                                      const IDGrupoOrcamen : Extended;
                                                      const sCentRespon    : String;
                                                      const sCentroCusto   : String;
                                                      const sUnidNegoc     : String;
                                                      const sPlano         : String;
                                                      const sPatro         : String
                                                     ): Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT COUNT(*) AS TOTAL FROM CONTASORCAMEN '                    + #13 +
   'WHERE '                                                          + #13 +
   '       IDPLANOORCAMEN  = ' + FormatFloat('#0', IDPlanoOrcamen)   + #13 +
   '   AND IDGRUPOORCAMEN  = ' + FormatFloat('#0', IDGrupoOrcamen)   + #13 +
   '   AND CODCENTRORESPON = ' + QuotedStr(sCentRespon)              + #13;

   // ----------------------------------------------------------------------------------------------
   if length(trim(sCentroCusto)) > 0 then
   begin
      sSQL := sSQL +
   '   AND CODCENTROCUSTO  = ' + QuotedStr(sCentroCusto)             + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND CODCENTROCUSTO  IS NULL '                                 + #13;
   end;

   if (length(trim(sUnidNegoc)) > 0) and (StrToInt(sUnidNegoc) > 0) then
   begin
      sSQL := sSQL +
   '   AND UNIDNEGOC       = ' + sUnidNegoc                          + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND UNIDNEGOC       IS NULL '                                 + #13;
   end;

   if (length(trim(sPlano)) > 0) and (StrToInt(sPlano) > 0) then
   begin
      sSQL := sSQL +
   '   AND IDPLANOPREV     = ' + sPlano                              + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   AND IDPLANOPREV     IS NULL '                                 + #13;
   end;

   if (length(trim(sPatro)) > 0) and (StrToInt(sPatro) > 0) then
   begin
      sSQL := sSQL +
   '   AND IDPATRO         = ' + sPatro;
   end
   else
   begin
      sSQL := sSQL +
   '   AND IDPATRO         IS NULL ';
   end;
   // ----------------------------------------------------------------------------------------------

   cdsExiste.Data := GetDataPacket(sSQL);

   Result := False;
   if cdsExiste.FieldByName('TOTAL').AsInteger > 0 then Result := True;

   cdsExiste.Close;
end;
// FIM André Pontes - pendência 15700 - 03/12/2003







function TCtrlCadContasOrcPorGrupo.InsereContaOrcamen(sCodConta,
                                                      sCCusto,
                                                      sAtivProj,
                                                      sIdPlano,
                                                      sIdPatro,
                                                      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                      sPrograma,
                                                      sTipoDespesa: string;
                                                      //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                      iIdEmpresa: integer;
                                                      bSubstCC,
                                                      bSubstAP,
                                                      bSubstPP,
                                                      bSubstPT,
                                                      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                      bSubstPrograma,
                                                      bSubstTipoDespesa: boolean
                                                      //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                      ): boolean;
var
   sSQL: string;
begin
   // Insere uma conta orçamentária através da conta-espelho (-1)
   sSQL :=  'INSERT INTO CONTASORCAMEN '                                                        +
            '( '                                                                                +
            'IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                        +
            'IDCONTAORCAMEN, '                                                                  +
            'NOMECONTAORCAMEN, CODCENTRORESPON, IDEMPRESA, '                                    +
            'CODCENTROCUSTO, '                                                                  +

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            'IDPROGRAMAORCAMEN,IDTIPO_DEPESAORCAMEN, '                                          +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim

            'UNIDNEGOC, IDPLANOPREV, IDPATRO, '                                                 +
            'TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                           +
            'TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                                  +
            'OBSERVACAO, '                                                                      +
            'FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '      +
            'FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '                  +
            'IDDATAVIEW, ORIGEMCMDV, FLGTRANSFORIGDIF  '                                        +  // Edilaine - SOL 190311 / KTN 1799290
            ') '                                                                                +
            '( '                                                                                +
            'SELECT '                                                                           +
            '   IDPESSOA, IDPLANOORCAMEN, IDGRUPOORCAMEN, '                                     +

            '   ' + QuotedStr(sCodConta) + ', '                                                 +

            '   NOMECONTAORCAMEN, CODCENTRORESPON, '                                            +
            '   ' + IntToStr(iIdEmpresa) + ', '                                                 ;


   //Centro de Custo
   If bSubstCC then
   begin
      //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
      if (Trim(sCCusto) <> '') and  (Trim(sCCusto) <> 'X') then
        sSQL :=  sSQL + '   ' + QuotedStr(sCCusto) + ' AS CODCENTROCUSTO, '
      else
        sSQL :=  sSQL + '   Null AS CODCENTROCUSTO, ';
   end
   else
   begin
     sSQL :=  sSQL + '   Null AS CODCENTROCUSTO, ';
   end;
   
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867
   //Programa
   If bSubstPrograma then
     if (Trim(sPrograma) <> '') and  (Trim(sPrograma) <> '0') then
     begin
          sSQL :=  sSQL + '   ' + QuotedStr(sPrograma) + ' AS IDPROGRAMAORCAMEN, '
     end
     else
         sSQL :=  sSQL + '   Null AS IDPROGRAMAORCAMEN, '
   else
     sSQL :=  sSQL + '   Null AS IDPROGRAMAORCAMEN, ';

   //Tipo de Despesa
   If bSubstTipoDespesa then
     if (Trim(sTipoDespesa) <> '') and  (Trim(sTipoDespesa) <> '0') then
     begin
          sSQL :=  sSQL + '   ' + QuotedStr(sTipoDespesa) + ' AS IDTIPO_DEPESAORCAMEN, '
      end
      else
         sSQL :=  sSQL + '   Null AS IDTIPO_DEPESAORCAMEN, '
   else
     sSQL :=  sSQL + '   Null AS IDTIPO_DEPESAORCAMEN, ';
   //Ricardo de Freitas SOL: 159212 - Kintana 1337867  -fim

   sSQL :=  sSQL +
            '   ' + sAtivProj          + ' AS UNIDNEGOC, '                                      +
            '   ' + sIdPlano           + ' AS IDPLANOPREV ,'                                    +
            '   ' + sIdPatro           + ' AS IDPATRO, '                                        +

            '   TIPOCALCREALIZADO, FORMULAREALIZADO, VLRINFORMADOREAL, '                        +
            '   TIPOCALCORCADO, FORMULAORCADO, VLRINFORMADOORC, '                               +
            '   OBSERVACAO, '                                                                   +
            '   FLGCONTAMONETARIA, FLGSINALCONTA, FLGCALCORCADO, FLGCALCREAL, FLGINFDIAMES, '   +
            '   FLGACUMULADO, FLGTRANSFSALDO, FLGATIVA, DATAATIVA, DATAINATIVA, '               +
            '   IDDATAVIEW, ORIGEMCMDV, FLGTRANSFORIGDIF '                                      +  // Edilaine - SOL 190311 / KTN 1799290
            'FROM '                                                                             +
            '   CONTASORCAMEN '                                                                 +
            'WHERE  ' +
            '   IDCONTAORCAMEN = ''-1'' )';

   Result := ExecSQL(sSQL);

   if not Result then
      Exit;

   //Se não utilizar a rotina a rotina específica da Composição de Contas orçamentárias (Contabilidade)
   if not UtilizarRotinaVincContabil then
   begin
            //Composição de Contas orçamentárias (Contabilidade)
            sSQL :=  
            'INSERT INTO COMPCONTASORCAMEN '                                           +
            '( '                                                                       +
            'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                        +
            'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         +
            'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       +
            'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                     +
            'CODCENTROCUSTO, '                                                         +

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867
            'IDPROGRAMAORCAMEN,IDTIPO_DEPESAORCAMEN, '                                 +
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


            'UNIDNEGOC, IDPLANOPREV, IDPATRO, '                        +
            'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
            'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
            'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
            ') '                                                                       +
            '( '                                                                       +
            'SELECT '                                                                  +
            '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        +

            '   ' + QuotedStr(sCodConta) + ', '         +

            '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      +
            '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    +
            '   IDPESSOA, CODTIPRECDES, CODCENTRORESPON,';
            // ----------------------------------------------------------------------------------

            // C.Custo
            if bSubstCC then
            begin
              //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
              if (Trim(sCCusto) <> '') and  (Trim(sCCusto) <> 'X') then
              begin
                    sSQL := sSQL + '   ' + IntToStr(iIdEmpresa) + ', ' +
                                   '   ' + QuotedStr(sCCusto)   + ', ';
              end
              else
                    sSQL := sSQL + '  IDEMPRESA,   CODCENTROCUSTO, '
            end
            else
               sSQL := sSQL + '  IDEMPRESA,   CODCENTROCUSTO, ';

            //Ricardo de Freitas SOL: 159212 - Kintana 1337867

            //Programa
            If bSubstPrograma then
               if (Trim(sPrograma) <> '') and  (Trim(sPrograma) <> '0') then
               begin
                    sSQL :=  sSQL + '   ' + QuotedStr(sPrograma) + ', '
               end
               else
                   sSQL :=  sSQL + '   Null, '
            else
               sSQL :=  sSQL + '   Null, ';

            //Tipo de Despesa
            If bSubstTipoDespesa then
               if (Trim(sTipoDespesa) <> '') and  (Trim(sTipoDespesa) <> '0') then
               begin
                    sSQL :=  sSQL + '   ' + sTipoDespesa + ', '
               end
               else
                   sSQL :=  sSQL + '   Null, '
            else
                sSQL :=  sSQL + '   Null, ';
            //Ricardo de Freitas SOL: 159212 - Kintana 1337867  -fim


            // Ativ.Projeto
            if bSubstAP then
               sSQL := sSQL + '   ' + sAtivProj + ', '
            else
               sSQL := sSQL + '   UNIDNEGOC, ';

            //Plano
            if bSubstPP then
               sSQL := sSQL + '   ' + sIdPlano + ', '
            else
               sSQL := sSQL + '   IDPLANOPREV, ';

            // Patro
            if bSubstPT then
               sSQL := sSQL + '   ' + sIdPatro + ', '
            else
               sSQL := sSQL + '   IDPATRO, ';

            // ----------------------------------------------------------------------------------

            sSQL := sSQL +
            'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
            'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
            'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
            'FROM '                                                                    +
            '   COMPCONTASORCAMEN '                                                    +
            'WHERE ' +
            '   IDCONTAORCAMEN = ''-1'' )';

            Result := ExecSQL(sSQL);
   end;

end;


function TCtrlCadContasOrcPorGrupo.ExcluiContasSemMovim(
  iIdGrupoOrc: integer): boolean;
begin
   // Registro filho
   Result := ExecSQL(' DELETE FROM COMPCONTASORCAMEN ' +
                     ' WHERE ' +
                     '   (IDCONTAORCAMEN IN (SELECT IDCONTAORCAMEN   ' +
                     '                       FROM   CONTASORCAMEN    ' +
                     '                       WHERE  IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ')) AND ' +
                     '   (IDCONTAORCAMEN NOT IN (SELECT DISTINCT ' +
                     '                              DECODE(A.IDCONTAORIGEM,'''', ' +
                     '                                 DECODE(S.IDCONTAORCAMEN,'''', ' +
                     '                                    DECODE(R.IDCONTAORCAMEN,'''',''0'') ' +
                     '                                 ) ' +
                     '                              ) AS IDCONTAORCAMEN ' +
                     '                           FROM ' +
                     '                              ALTERORCAMENTO A, ' +
                     '                              SALDOORCADO S, ' +
                     '                              RESERVAORCAMEN R, ' +
                     '                              CONTASORCAMEN C ' +
                     '                           WHERE ' +
                     '                              (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                     '                              (C.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)) AND ' +
                     '                              (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+)) AND ' +
                     '                              (C.IDCONTAORCAMEN = R.IDCONTAORCAMEN(+)))) ');

   if not Result then
      Exit;

   // Registro pai   
   Result := ExecSQL(' DELETE FROM CONTASORCAMEN ' +
                     ' WHERE ' +
                     '    (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                     '    (IDCONTAORCAMEN NOT IN (SELECT DISTINCT ' +
                     '                              DECODE(A.IDCONTAORIGEM,'''', ' +
                     '                                 DECODE(S.IDCONTAORCAMEN,'''', ' +
                     '                                    DECODE(R.IDCONTAORCAMEN,'''',''0'') ' +
                     '                                 ) ' +
                     '                              ) AS IDCONTAORCAMEN ' +
                     '                           FROM ' +
                     '                              ALTERORCAMENTO A, ' +
                     '                              SALDOORCADO S, ' +
                     '                              RESERVAORCAMEN R, ' +
                     '                              CONTASORCAMEN C ' +
                     '                           WHERE ' +
                     '                              (C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                     '                              (C.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)) AND ' +
                     '                              (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+)) AND ' +
                     '                              (C.IDCONTAORCAMEN = R.IDCONTAORCAMEN(+)))) ');
end;




function TCtrlCadContasOrcPorGrupo.AtualizaContaOrcamen(sCodConta,
                                                        sCCusto,
                                                        sAtivProj,
                                                        sIdPlano,
                                                        sIdPatro,
                                                        //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                        sPrograma,
                                                        sTipoDespesa: string;
                                                        //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                        iIdPlanoOrc,
                                                        iIdEmpresa: integer;
                                                        bSubstCC,
                                                        bSubstAP,
                                                        bSubstPP,
                                                        bSubstPT,
                                                        //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                                                        bSubstPrograma,
                                                        bSubstTipoDespesa: boolean
                                                        //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim
                                                        ): boolean;

var
   sSQL: string;
   CdsAux: TClientDataSet;
begin
   try
      CdsAux := TClientDataSet.Create(nil);

      // Pega as alterações da conta espelho
      CdsAux.Data := GetDataPacket('SELECT * FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ''-1''');

      // Atualiza a conta
      sSQL := 'UPDATE CONTASORCAMEN '                                                                                     + #13 +
              'SET '                                                                                                      + #13 +
              '   NOMECONTAORCAMEN    = ' + QuotedStr(CdsAux.FieldByName('NOMECONTAORCAMEN').AsString)  + ', '   +
              '   CODCENTRORESPON     = ' + QuotedStr(CdsAux.FieldByName('CODCENTRORESPON').AsString)   + ', '   +
              '   TIPOCALCREALIZADO   = ' + QuotedStr(CdsAux.FieldByName('TIPOCALCREALIZADO').AsString) + ', '   +
              '   FORMULAREALIZADO    = ' + QuotedStr(CdsAux.FieldByName('FORMULAREALIZADO').AsString)  + ', '   +
              '   VLRINFORMADOREAL    = ' + QuotedStr(CdsAux.FieldByName('VLRINFORMADOREAL').AsString)  + ', '   +
              '   TIPOCALCORCADO      = ' + QuotedStr(CdsAux.FieldByName('TIPOCALCORCADO').AsString)    + ', '   +
              '   FORMULAORCADO       = ' + QuotedStr(CdsAux.FieldByName('FORMULAORCADO').AsString)     + ', '   +
              '   VLRINFORMADOORC     = ' + QuotedStr(CdsAux.FieldByName('VLRINFORMADOORC').AsString)   + ', '   +
              '   OBSERVACAO          = ' + QuotedStr(CdsAux.FieldByName('OBSERVACAO').AsString)        + ', '   +
              '   FLGCONTAMONETARIA   = ' + QuotedStr(CdsAux.FieldByName('FLGCONTAMONETARIA').AsString) + ', '   +
              '   FLGSINALCONTA       = ' + QuotedStr(CdsAux.FieldByName('FLGSINALCONTA').AsString)     + ', '   +
              '   FLGCALCORCADO       = ' + QuotedStr(CdsAux.FieldByName('FLGCALCORCADO').AsString)     + ', '   +
              '   FLGCALCREAL         = ' + QuotedStr(CdsAux.FieldByName('FLGCALCREAL').AsString)       + ', '   +
              '   FLGINFDIAMES        = ' + QuotedStr(CdsAux.FieldByName('FLGINFDIAMES').AsString)      + ', '   +
              '   FLGACUMULADO        = ' + QuotedStr(CdsAux.FieldByName('FLGACUMULADO').AsString)      + ', '   +
              '   FLGTRANSFSALDO      = ' + QuotedStr(CdsAux.FieldByName('FLGTRANSFSALDO').AsString)    + ', '   +
              '   FLGATIVA            = ' + QuotedStr(CdsAux.FieldByName('FLGATIVA').AsString)          + ', '   +
              '   DATAATIVA           = ' + QuotedStr(CdsAux.FieldByName('DATAATIVA').AsString)         + ', '   +
              '   DATAINATIVA         = ' + QuotedStr(CdsAux.FieldByName('DATAINATIVA').AsString)       + ', '   +
              '   IDDATAVIEW          = ' + QuotedStr(CdsAux.FieldByName('IDDATAVIEW').AsString)        + ', '   +
              '   ORIGEMCMDV          = ' + QuotedStr(CdsAux.FieldByName('ORIGEMCMDV').AsString)        + ', '   +
              '   FLGTRANSFORIGDIF    = ' + QuotedStr(CdsAux.FieldByName('FLGTRANSFORIGDIF').AsString)           +  // Edilaine - SOL 190311 / KTN 1799290
              ' WHERE '                                                                                           +
              '       IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)                                                 +
              '   AND IDCONTAORCAMEN = ' + QuotedStr(sCodConta);

      Result := ExecSQL(sSQL);
      if not Result then
         Exit;

      //Se não utilizar a rotina a rotina específica da Composição de Contas orçamentárias (Contabilidade)
      if not UtilizarRotinaVincContabil then
      begin

            // Deleta a composição da conta
            sSQL := 'DELETE FROM COMPCONTASORCAMEN ' +
                    'WHERE (IDCONTAORCAMEN = ' + QuotedStr(sCodConta)  + ')  AND ' +
                    '      (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') ';
            Result := ExecSQL(sSQL);

            if not Result then
               Exit;

           // Recria a composição da conta com as alterações efetuadas através da conta espelho
           sSQL :=  'INSERT INTO COMPCONTASORCAMEN '                                           +
                    '( '                                                                       +
                    'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                        +
                    'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         +
                    'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       +
                    'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                     +
                    'CODCENTROCUSTO,  ' +

                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                    'IDPROGRAMAORCAMEN,IDTIPO_DEPESAORCAMEN, '                                 +
                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867 - fim


                    ' UNIDNEGOC, IDPLANOPREV, IDPATRO, '                        +
                    'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
                    'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
                    'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
                    ') '                                                                       +
                    '( '                                                                       +
                    'SELECT '                                                                  +
                    '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        +

                    '   ' + QuotedStr(sCodConta) + ', '         +

                    '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      +
                    '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    +
                    '   IDPESSOA, CODTIPRECDES, CODCENTRORESPON, ';
                    // ----------------------------------------------------------------------------------

                    // C.Custo
                    if bSubstCC then
                    begin
                      //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
                      if (Trim(sCCusto) <> '') and  (Trim(sCCusto) <> 'X') then
                      begin
                          sSQL := sSQL + '   ' + IntToStr(iIdEmpresa) + ', ' +
                                         '   ' + QuotedStr(sCCusto)   + ', ';
                      end
                      else
                          sSQL := sSQL + '  IDEMPRESA,   CODCENTROCUSTO, '
                    end
                    else
                          sSQL := sSQL + '  IDEMPRESA,   CODCENTROCUSTO, ';

                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867
                    //Programa
                    If bSubstPrograma then
                       if (Trim(sPrograma) <> '') and  (Trim(sPrograma) <> '0') then
                       begin
                            sSQL :=  sSQL + '   ' + QuotedStr(sPrograma) + ', '
                       end
                       else
                           sSQL :=  sSQL + '   Null, '
                    else
                        sSQL :=  sSQL + '   Null, ';

                    //Tipo de Despesa
                    If bSubstTipoDespesa then
                       if (Trim(sTipoDespesa) <> '') and  (Trim(sTipoDespesa) <> '0') then
                       begin
                            sSQL :=  sSQL + '   ' + QuotedStr(sTipoDespesa) + ', '
                       end
                       else
                           sSQL :=  sSQL + '   Null, '
                    else
                          sSQL :=  sSQL + '   Null, ';
                    //Ricardo de Freitas SOL: 159212 - Kintana 1337867  -fim

                    // Ativ.Projeto
                    if bSubstAP then
                       sSQL := sSQL + '   ' + sAtivProj + ', '
                    else
                       sSQL := sSQL + '   UNIDNEGOC, ';

                    //Plano
                    if bSubstPP then
                       sSQL := sSQL + '   ' + sIdPlano + ', '
                    else
                       sSQL := sSQL + '   IDPLANOPREV, ';

                    // Patro
                    if bSubstPT then
                       sSQL := sSQL + '   ' + sIdPatro + ', '
                    else
                       sSQL := sSQL + '   IDPATRO, ';

                    //----------------------------------------------------------------------------------

                    sSQL := sSQL +
                    'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
                    'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
                    'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
                    'FROM '                                                                    +
                    '   COMPCONTASORCAMEN '                                                    +
                    'WHERE ' +
                    '   IDCONTAORCAMEN = ''-1'' )';

           Result := ExecSQL(sSQL);

      end; //if not UtilizarRotinaVincContabil then
   finally
       FreeAndNil(CdsAux);
   end;
end;

function TCtrlCadContasOrcPorGrupo.InativaGrupoOrcamentario(bInativar: boolean; iIdGrupoOrc,
  iIdPlanoOrc: integer): boolean;
var
  sSQL: string;
begin
    try
       StartTransaction;

       sSQL := 'UPDATE CONTASORCAMEN ';
       if bInativar then
          sSQL := sSQL + 'SET FLGATIVA = ''I'' '
       else
          sSQL := sSQL + 'SET FLGATIVA = ''A'' ';
          
       sSQL := sSQL + 'WHERE ' +
                      '   (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                      '   (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') ';
       Result := ExecSQL(sSQL);
       if not Result then
          Raise Exception.Create(MessageInfo);

       Commit;

    except
       on E:Exception do
       begin
          Rollback;
          MessageInfo := E.Message;
          Result      := False;
       end;
    end;
end;

function TCtrlCadContasOrcPorGrupo.AtualizaPlanosContabilGrupo(
  iIdGrupoOrc,iIdPlanoOrc:integer): boolean;
var
   sSQL:string;
   CdsAux: TClientDataSet;
begin
     TRY
        TRY
            Result := false;

            //Traz todas as contas cadastradas do grupo
            CdsAux := TClientDataSet.Create(nil);
            CdsAux.Data := GetDataPacket(' SELECT DISTINCT ' +
                                         '    IDCONTAORCAMEN, ' +
                                         '    ''S'' AS EXCLUIR ' +
                                         ' FROM ' +
                                         '    CONTASORCAMEN ' +
                                         ' WHERE ' +
                                         '    (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                                         '    (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                         '    (IDCONTAORCAMEN <> ''-1'')');
            CdsAux.First;
            if CdsAux.IsEmpty then
            begin
              //Não há contas para o Grupo Orçamentário
              Result := true;
              Exit;
            end;

            //Barra de progresso
            DoProgresso(['', 0, 0, CdsAux.RecordCount, CdsAux.RecNo, 'Atualizando Planos Contábeis do Grupo...']);


            while not CdsAux.Eof Do
            begin
              //Se o código não foi gerado pela parametrização
              if not cdsCodigo.Locate('CODIGO', CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString,[]) then
              begin
                     //Desvincular todos os planos contábeis que não constam na conta
                     //conforme espelho COMPCONTASORCAMEN criada.
                     {sSQL :=
                     ' DELETE FROM COMPCONTASORCAMEN ' +
                     ' WHERE ' +
                             ' IDCONTAORCAMEN = ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString) +  ' AND ' +
                             ' (LTRIM(RTRIM(NVL(TO_CHAR(PLANO),'  + QuotedStr('0') + ')))       || LTRIM(RTRIM(NVL(TO_CHAR(PLACONTA),' + QuotedStr('0') + '))) || ' +
                             ' LTRIM(RTRIM(NVL(TO_CHAR(UNIDNEGOC),' + QuotedStr('0') + ')))   || LTRIM(RTRIM(NVL(TO_CHAR(CODCENTROCUSTO),' + QuotedStr('0') + '))) || ' +
                             ' LTRIM(RTRIM(NVL(TO_CHAR(IDPLANOPREV),' + QuotedStr('0') + '))) || LTRIM(RTRIM(NVL(TO_CHAR(IDPATRO),' + QuotedStr('0') + '))) ) ' +
                             ' IN  ' +
                             ' (SELECT ' +
                             '          /*Montagem de Indice para poder realizar delete em cima de select*/ ' +
                             '          LTRIM(RTRIM(NVL(TO_CHAR(CON.PLANO),' + QuotedStr('0') + ')))       || LTRIM(RTRIM(NVL(TO_CHAR(CON.PLACONTA),' + QuotedStr('0') + '))) || ' +
                             '          LTRIM(RTRIM(NVL(TO_CHAR(CON.UNIDNEGOC),' + QuotedStr('0') + ')))   || LTRIM(RTRIM(NVL(TO_CHAR(CON.CODCENTROCUSTO),' + QuotedStr('0') + '))) || ' +
                             '          LTRIM(RTRIM(NVL(TO_CHAR(CON.IDPLANOPREV),' + QuotedStr('0') + '))) || LTRIM(RTRIM(NVL(TO_CHAR(CON.IDPATRO),' + QuotedStr('0') + '))) AS INDICE ' +
                             '   FROM ' +
                             '         /*Planos contabeis vinculados conforme conta orçamentária*/' +
                             '         (SELECT * FROM COMPCONTASORCAMEN' +
                             '         WHERE IDCONTAORCAMEN = ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString) + ')CON' +
                             '  LEFT JOIN' +
                             '         /*Planos Contabeis selecionado pelo usuário' +
                             '         conta "espelho"*/' +
                             '         (SELECT * FROM COMPCONTASORCAMEN ' +
                             '         WHERE IDCONTAORCAMEN = ' + QuotedStr('-1') + ') ESP ' +
                             '   ON' +
                             '         CON.PLANO   = ESP.PLANO ' +
                             '         AND CON.PLACONTA = ESP.PLACONTA ' +
                             '         AND CON.UNIDNEGOC = ESP.UNIDNEGOC ' +
                             '         AND CON.CODCENTROCUSTO = ESP.CODCENTROCUSTO ' +
                             '         AND CON.IDPLANOPREV = ESP.IDPLANOPREV ' +
                             '         AND CON.IDPATRO = ESP.IDPATRO ' +
                             '         AND CON.IDEMPRESA = ESP.IDEMPRESA ' +
                             '         AND CON.IDPESSOA = ESP.IDPESSOA ' +
                             '         AND CON.IDPLANOORCAMEN = ESP.IDPLANOORCAMEN ' +
                             '   WHERE ' +
                             '        (ESP.PLANO IS NULL) AND (ESP.PLACONTA IS NULL))'; }


                            //Deleta relações de contas contabeis conta
                            sSQL := 'DELETE FROM COMPCONTASORCAMEN ' +
                                    'WHERE (IDCONTAORCAMEN = ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString)  + ')  AND ' +
                                    '      (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') ';
                            Result := ExecSQL(sSQL);
                            
                           //Recria a relações de contaa contábeis com as alterações efetuadas através da conta espelho
                           sSQL :=  'INSERT INTO COMPCONTASORCAMEN '                                           +
                                    '( '                                                                       +
                                    'IDCOMPCONTASORC, IDCONTAORCAMEN, '                                        +
                                    'IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                         +
                                    'IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                       +
                                    'IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '                     +
                                    'CODCENTROCUSTO, UNIDNEGOC, IDPLANOPREV, IDPATRO, '                        +
                                    'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
                                    'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
                                    'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
                                    ') '                                                                       +
                                    '( '                                                                       +
                                    'SELECT '                                                                  +
                                    '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        +

                                    '   ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString) + ', '         +

                                    '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      +
                                    '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    +
                                    '   IDPESSOA, CODTIPRECDES, CODCENTRORESPON, ';
                                    // -----------------------------------------

                                    // C.Custo
                                    sSQL := sSQL + '  IDEMPRESA,   CODCENTROCUSTO, ';

                                    //Ativ.Projeto
                                    sSQL := sSQL + '   UNIDNEGOC, ';

                                    //Plano
                                    sSQL := sSQL + '   IDPLANOPREV, ';

                                    //Patro
                                    sSQL := sSQL + '   IDPATRO, ';

                                    //------------------------------------------

                                    sSQL := sSQL +
                                    'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
                                    'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
                                    'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
                                    'FROM '                                                                    +
                                    '   COMPCONTASORCAMEN '                                                    +
                                    'WHERE ' +
                                    '   IDCONTAORCAMEN = ''-1'' )';

                                    ExecSQL(sSQL);
              end;
              
              //Anda o form progresso
              DoProgresso(['',1,0,0,CdsAux.RecNo]);
              //Próximo
              CdsAux.Next;
            end;

            Result := True;
        EXCEPT
            on E:Exception Do
               MessageInfo := 'Rotina: AtualizaPlanosContabilGrupo ' + #13 +
                              'Tipo: '   + E.ClassName + #13 +
                              'Msg: '    + E.Message;
        END;
   FINALLY
     FreeAndNil(CdsAux);
   END;
end;

function TCtrlCadContasOrcPorGrupo.RetirarContOrcamenNaoParam(iIdGrupoOrc,
  iIdPlanoOrc: Integer): boolean;
var
   sSQL:string;
   qryAux: TwwQuery;
   CdsAux: TClientDataSet;
   tot:integer;
begin
   TRY
        TRY
            Result := false;

            tot := 0;

            //Log
            WriteLN(ArqLog, '');
            WriteLN(ArqLog,'Desvinculação de Contas Orçametárias');
            WriteLN(ArqLog,'----------------------------------');


            //Instancia controle de SQL
            qryAux := TwwQuery.Create(nil);
            qryAux.DatabaseName := DataBaseName;
            qryAux.SessionName := DataBase.SessionName;

            //Traz todas as contas cadastradas do grupo
            CdsAux := TClientDataSet.Create(nil);
            CdsAux.Data := GetDataPacket(' SELECT DISTINCT ' +
                                         '    IDCONTAORCAMEN ' +
                                         ' FROM ' +
                                         '    CONTASORCAMEN ' +
                                         ' WHERE ' +
                                         '    (IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc) + ') AND ' +
                                         '    (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                         '    (IDCONTAORCAMEN <> ''-1'')');
            CdsAux.First;
            if CdsAux.IsEmpty then
            begin
              //Não há contas para o Grupo Orçamentário
              WriteLN(ArqLog,'Não há contas para desvincular.');
              Result := true;
              Exit;
            end;

            //Barra de progresso
            DoProgresso(['', 0, 0, CdsAux.RecordCount, CdsAux.RecNo, 'Desvinculando contas orçamentárias...']);


            while not CdsAux.Eof Do
            begin
              //Se o código não foi gerado pela parametrização selecionad pelo usuário
              //deverá desvincular estas contas orçamentárias
              if not cdsCodigo.Locate('CODIGO', CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString,[]) then
              begin

                   //Apaga composição de Contas Contábeis da Conta Orçamentária
                   qryAux.SQL.Clear;
                   sSQL := '';
                   sSQL := ' DELETE FROM COMPCONTASORCAMEN WHERE ' +
                           ' IDCONTAORCAMEN = ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString)
                           + ' AND IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc);
                   qryAux.SQL.Text := Trim(sSQL);
                   qryAux.ExecSQL;
                   

                   //Apaga Saldo do Orçamento
                   qryAux.SQL.Clear;
                   sSQL := '';
                   sSQL := ' DELETE FROM SALDOORCADO WHERE ' +
                           ' IDCONTAORCAMEN = ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString)
                           + ' AND IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc);
                   qryAux.SQL.Text := Trim(sSQL);
                   qryAux.ExecSQL;


                   //Apaga conta Orçamentéria em Si
                   qryAux.SQL.Clear;
                   sSQL := '';
                   sSQL := ' DELETE FROM CONTASORCAMEN WHERE ' +
                                   ' IDCONTAORCAMEN = ' + QuotedStr(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString)
                             + ' AND IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)
                             + ' AND IDGRUPOORCAMEN = ' + IntToStr(iIdGrupoOrc);
                   qryAux.SQL.Text := Trim(sSQL);
                   qryAux.ExecSQL;
                   
                   tot := tot + 1;
                   WriteLN(ArqLog,FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' +
                          CompletaFIM(CdsAux.Fieldbyname('IDCONTAORCAMEN').AsString, ' ', 40) + ' - ' +
                          'Conta orçamentária desvinculada.');
              end;

              //Anda o form progresso
              DoProgresso(['',1,0,0,CdsAux.RecNo]);

              //Próximo
              CdsAux.Next;
            end;

            //Log
            WriteLN(ArqLog,'----------------------------------');
            WriteLN(ArqLog,'Total de contas desvinculadas: ' + intToStr(tot));
            WriteLN(ArqLog,'');
            WriteLN(ArqLog,'');

            //OK
            Result := True;
        EXCEPT
            on E:Exception Do
               MessageInfo := 'Rotina: RetirarContOrcamenNaoParam ' + #13 +
                              'Tipo: '   + E.ClassName + #13 +
                              'Msg: '    + E.Message;
        END;
   FINALLY
     CdsAux.Close;
     FreeAndNil(CdsAux);
     FreeAndNil(qryAux);
   END;
end;

function TCtrlCadContasOrcPorGrupo.ListaPrograma(const iTipo, iPlanoOrc,
  iGrupoOrc: Integer): OleVariant;
var
   sSQL : String;
begin
   try

     //    0: Todos
     //    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
     //    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)


      sSQL :=
      'SELECT '                                                   + #13 +
      '   IDPROGRAMAORCAMEN,DESCRICAO_PROGRAMAORCAMEN AS NOME '   + #13 +
      'FROM '                                                     + #13 +
      '   CM.PROGRAMAORCAMEN '                                    + #13;

      case iTipo of

         1: sSQL := sSQL +
      ' WHERE IDPROGRAMAORCAMEN NOT IN '                          + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPROGRAMAORCAMEN '                              + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDPROGRAMAORCAMEN IS NOT NULL '              + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   WHERE IDPROGRAMAORCAMEN IN '                            + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDPROGRAMAORCAMEN '                              + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDPROGRAMAORCAMEN IS NOT NULL '              + #13 +
      '       ) ';                                                 
      end;

      sSQL := sSQL +
      'ORDER BY DESCRICAO_PROGRAMAORCAMEN ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;     
end;

function TCtrlCadContasOrcPorGrupo.ListaTipoDespesa(const iTipo, iPlanoOrc,
  iGrupoOrc: Integer): OleVariant;
var
   sSQL : String;
begin
     try

     //    0: Todos
     //    1: Apenas os que AINDA não estiverem utilizados por contas orçamentárias (p/ inserção)
     //    2: Apenas os que Já        estiverem utilizados por contas orçamentárias (p/ alteração)


      sSQL :=
      'SELECT '                                                   + #13 +
      '   IDTIPO_DEPESAORCAMEN,DESCRICAO_TIPO_DEPESAOCAMEN AS NOME '   + #13 +
      'FROM '                                                     + #13 +
      '   CM.TIPO_DESPESAORCAMEN '                                       + #13;

      case iTipo of

         1: sSQL := sSQL +
      ' WHERE IDTIPO_DEPESAORCAMEN NOT IN '                          + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDTIPO_DEPESAORCAMEN '                           + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDTIPO_DEPESAORCAMEN IS NOT NULL '              + #13 +
      '       ) '                                                 + #13;

         2: sSQL := sSQL +
      '   WHERE IDTIPO_DEPESAORCAMEN IN '                         + #13 +
      '       ( '                                                 + #13 +
      '       SELECT '                                            + #13 +
      '          IDTIPO_DEPESAORCAMEN '                           + #13 +
      '       FROM '                                              + #13 +
      '          CONTASORCAMEN '                                  + #13 +
      '       WHERE '                                             + #13 +
      '              IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)     + #13 +
      '          AND IDGRUPOORCAMEN = ' + IntToStr(iGrupoOrc)     + #13 +
      '          AND IDPESSOA       = ' + FloatToStr(pIdEmpresa)  + #13 +
      '          AND IDTIPO_DEPESAORCAMEN IS NOT NULL '              + #13 +
      '       ) ';                                                 
      end;

      sSQL := sSQL + 'ORDER BY DESCRICAO_TIPO_DEPESAOCAMEN ';

      Result := GetDataPacket(sSQL);

   except
      on E:Exception do MessageInfo := E.Message;
   end;             
end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsProgramaSel(
  const Value: TClientDataSet);
begin
  FCdsProgramaSel := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetCdsTipoDespesaSel(
  const Value: TClientDataSet);
begin
  FCdsTipoDespesaSel := Value;
end;

function TCtrlCadContasOrcPorGrupo.AnalisaContasorcamenGeradas(CodGrupoOrcamen:String;Dados:oleVariant): boolean;
begin
     Result := true;

     TRY
        FrmAnaliseGeracaoContasOrcamen := TFrmAnaliseGeracaoContasOrcamen.Create(Application);

        with FrmAnaliseGeracaoContasOrcamen Do
        begin
             cdsCodigos.Data  := Dados;
             chkGO.Checked    := true;
             chkCC.Checked    := not FbSubstCC;
             chkAP.Checked    := not FbSubstAP;
             chkPP.Checked    := not FbSubstPP;
             chkPT.Checked    := not FbSubstPT;
             chkCR.Checked    := false;
             chkPR.Checked    := not FbSubstPR;
             chkTD.Checked    := not FbSubstTP;
             edtCodGrupo.Text := TRIM(CodGrupoOrcamen);
             ShowModal;
        end;
     FINALLY
        FreeAndnil(FrmAnaliseGeracaoContasOrcamen);
     END;
end;

procedure TCtrlCadContasOrcPorGrupo.SetAnalisaContasorcamen(
  const Value: boolean);
begin
  FAnalisaContasorcamen := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetAtualizaNaInsercao(
  const Value: Boolean);
begin
  FAtualizaNaInsercao := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetUtilizarRotinaVincContabil(
  const Value: boolean);
begin
  FUtilizarRotinaVincContabil := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetlstContasContab(
  const Value: TStringList);
begin
  FlstContasContab := Value;
end;

function TCtrlCadContasOrcPorGrupo.AtualizarContasContabporGrupo: boolean;
var
   c:integer;
begin
     Result := false;

     WriteLN(ArqLog, '');
     WriteLN(ArqLog,'Vinculação de Contas Contábeis');
     WriteLN(ArqLog,'----------------------------------');

     //Consistências
     if lstContasContab   = nil then raise Exception.Create('ORC4598 - Não foi determinado as contas contábeis para vinculação');
     if IdGrupoOrcamen    = 0   then raise Exception.Create('ORC4598 - Não foi determinado o Id do Grupo Orc. para vinculação');
     if CodGrupoOrcamen   = ''  then raise Exception.Create('ORC4598 - Não foi determinado o Código do Grupo Orc. para vinculação');
     if DescrGrupoOrcamen = ''  then raise Exception.Create('ORC4598 - Não foi determinado a Descrição do Grupo Orc. para vinculação');
     if idPlanoOrcamento  = 0   then raise Exception.Create('ORC4598 - Não foi determinado o Id do Plano orçamentário para vinculação');
     if idAnoOrcamento    = 0   then raise Exception.Create('ORC4598 - Não foi determinado o Ano do Plano Orçamentário');
     if idPlanoContas     = 0   then raise Exception.Create('ORC4598 - Não foi determinado o Plano de Contas para vinculação');

     TRY
        //Instância Controle
        CtrlCadContasContabilPorGrupo := TCtrlCadContasContabilPorGrupo.Create;

        CtrlCadContasContabilPorGrupo.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
        CtrlCadContasContabilPorGrupo.DataBase   := DtmBaseDados.dbBaseDados;

        //Preenche Propriedades
        CtrlCadContasContabilPorGrupo.Progresso         := Progresso;
        CtrlCadContasContabilPorGrupo.IdGrupoOrcamen    := IdGrupoOrcamen;
        CtrlCadContasContabilPorGrupo.CodGrupoOrcamen   := CodGrupoOrcamen;
        CtrlCadContasContabilPorGrupo.DescrGrupoOrcamen := DescrGrupoOrcamen;
        CtrlCadContasContabilPorGrupo.idPlanoOrcamento  := intToStr(idPlanoOrcamento);
        CtrlCadContasContabilPorGrupo.idAnoOrcamento    := intToStr(idAnoOrcamento);
        CtrlCadContasContabilPorGrupo.idPlanoContas     := intToStr(idPlanoContas);
        CtrlCadContasContabilPorGrupo.lstContas         := lstContasContab;

        CtrlCadContasContabilPorGrupo.CdsCentroDeCusto  := CdsCentroDeCusto; //Higor Nayde  SOL - 172384/10142 KTN - 1696873

        //Realizar a Vinculação
        CtrlCadContasContabilPorGrupo.Vincular();

        //Log da vinculção
        for c:= 0 to CtrlCadContasContabilPorGrupo.LogInclusao.Count - 1 Do
        begin
             WriteLN(ArqLog,CtrlCadContasContabilPorGrupo.LogInclusao[c]);
        end;

        //Subtotal
        if CtrlCadContasContabilPorGrupo.LogInclusao.Count > 0 then
        begin
             WriteLN(ArqLog,'');
             WriteLN(ArqLog,'----------------------------------');
             WriteLN(ArqLog,'Total de  vinculados: ' +  intToStr(CtrlCadContasContabilPorGrupo.TotVinculacao));
             WriteLN(ArqLog,'Total não vinculados: ' +  intToStr(CtrlCadContasContabilPorGrupo.TotNaoVinculacao));
        end;

        WriteLN(ArqLog,'');
        WriteLN(ArqLog,'----------------------------------');

     FINALLY
        //Destrói Controle
        FreeAndNil(CtrlCadContasContabilPorGrupo);
     END;


     Result := true;

end;

procedure TCtrlCadContasOrcPorGrupo.SetCodGrupoOrcamen(
  const Value: string);
begin
  FCodGrupoOrcamen := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetDescrGrupoOrcamen(
  const Value: string);
begin
  FDescrGrupoOrcamen := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetidAnoOrcamento(
  const Value: integer);
begin
  FidAnoOrcamento := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetIdGrupoOrcamen(
  const Value: integer);
begin
  FIdGrupoOrcamen := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetidPlanoContas(const Value: integer);
begin
  FidPlanoContas := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetidPlanoOrcamento(
  const Value: integer);
begin
  FidPlanoOrcamento := Value;
end;

procedure TCtrlCadContasOrcPorGrupo.SetDesvincularContorcamen(
  const Value: Boolean);
begin
  FDesvincularContorcamen := Value;
end;

function TCtrlCadContasOrcPorGrupo.ListaPlanoOrcamento(sIDGrupoOrcamento : string) : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.IDPLANOORCAMEN, '+
          '       P.NOMEPLANOORC, '+
          '       P.ANO, P.MASCARAGRUPO '+
          '  FROM GRUPOORCAMEN G, '+
          '       PLANOORCAMENTARIO P '+
          ' WHERE ( P.IDPLANOORCAMEN = G.IDPLANOORCAMEN ) '+
          '   AND ( G.IDGRUPOORCAMEN = '+ QuotedStr(sIDGrupoOrcamento) + ') ' +
          'order by P.NOMEPLANOORC';

  result := GetDataPacket( sSQL );
end;

end.
