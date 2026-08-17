// Alterações:
{
{ --------------------------------------------------------------------------------------------------
Rotina......: DBedtGrupoExit
Nº SOL......: 241986
Nº PPM......: 563140
Data........: 29/10/2014
Responsável.: Marcio Sanches Spinosa SOL 241986 PPM 563140
Descrição...: Verificar se a conta é analitica para utilizar a conta certa.
--------------------------------------------------------------------------------
Rotina......: .dfm (dbcGruposDif), FormCreate
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 15/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
--------------------------------------------------------------------------------
// Rotina........: CmeCadastroInsert
// Autor.........: Edilaine Ferraresi
// Data..........: 03/08/2012
// Nº SOL........: 189232
// Nº KINTANA....: 1786577
// Descrição.....: dados da contabilidade ficam na tela de um insert para outro
--------------------------------------------------------------------------------
// Rotina........: CmeCadastroApplyUpdate, CmeCadastroDelete
// Autor.........: Edilaine Ferraresi
// Data..........: 22/08/2012
// Nº SOL........: 188480
// Nº KINTANA....: 1776616
// Descrição.....: alteração está desvinculando as contas
--------------------------------------------------------------------------------
// Rotina........: CmeCadastroApplyInsert
// Autor.........: Helen Bianchi / Edilaine Ferraresi
// Data..........: 15/08/2012
// Nº SOL........: 187700
// Nº KINTANA....: 1767662
// Descrição.....: Alterado parâmetro
--------------------------------------------------------------------------------
Rotina......: DBedtGrupoExit
Nº SOL......: 172384/10302
Nº KINTANA..: 1710639
Data........: 26/06/2012
Responsável.: Higor Nayde
Descrição...: localização do IDGRUPOORCAMEN selecionado na pesquisa do grupo
{--------------------------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
// Rotina........: CmeCadastroApplyEdit
// Autor.........: Edilaine Ferraresi
// Data..........: 11/05/2012
// Nº SOL........: 172383-9602
// Nº KINTANA....: 1661594
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Rotina........: *.dfm, Diversas (troca de Modulo.iPlanoOrc por iIdPlanoOrc)
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 04/11/2011
// Nº SOL........: 167901
// Nº KINTANA....: 1476693
// Rotina........: MontaSelectBeforeOpenCds
// Descrição.....: Retirar comando LOWER e adicion JOIN com a tabela PLANOORCAMENTARIO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 18/08/2011
Autor     : Ricardo de Freitas Araújo
SOL\KTN   : 159219 \ 1337821
Descrição : Adicionado os campos de Programa e TIpo de Despesa na  guia de Fluxo de Caixa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 18/08/2011
Autor     : Ricardo de Freitas Araújo
SOL\KTN   : 159215 \ 1337816
Descrição : Adicionado os campos de Programa e TIpo de Despesa na  guia de contabilidade
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 07/11/2005
Autor     : Rodolpho da Silva
Pendencia : 18252
Descrição : Permitir criação de novas contas orçamentárias em um grupo já cadastrado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 15/09/2005
Autor     : Rodolpho da Silva
Pendencia : 20069/20251
Descrição : 20069 - Ao alterar um grupo de contas, refeltir essa alteração para todas as contas e
                    suas composições.
            20251 - Correção da crítica em que se o usuário informar que o tipo de cálculo (Orçado
                    ou Realizado) for manualmente, permitir que se cadastre sem informar nenhuma
                    composição de conta orçamentária.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 20/05/2005
Autor     : andre tavares
Pendencia : 17608
Descrição : filtra os planoprevcontabil pela patro selecionada e mostra somente os ativos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 03/03/2004
Autor     : Marchetti
Pendencia : 16014
Descrição : Filtro dos grupos pelo Plano Orçamentário (IDPLANOORCAMEN) / Modulo.iPlanoOrc
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaPreencimento
Data      : 24/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Obrigatório preencher a composição da conta
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 07/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Filtro dos grupos pelo Plano Orçamentário (IDPLANOORCAMEN) / Modulo.iPlanoOrc
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroConfirma
Data      : 29/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Alteração para Alteração e Exclusão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - (MontaSelect)
Data      : 29/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Alteração nos campos de busca
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBedtGrupoExit
Data      : 29/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Nome da Conta (se não estiver preenchido) será com o nome do Grupo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 24/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Nome da Conta e Parâmetros da Conta mostrados novamente, pois serão necessários ao
            cadastro.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 19/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Novo form criado, com alterações para cadastrar contas por Grupo Orçamentário
---------------------------------------------------------------------------------------------------}

unit FCadContasOrcPorGrupoMT;

Interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   TB97, TabControlDetalhe, ExtCtrls, wwdblook, TREdit, Mask,   wwdbedit, DBCtrls,
   wwriched, CMTree, IvDictio, IvMulti, IvEMulti, Wwdotdot, Wwdbcomb, CMProcuraMask,
   Parser10, Wwdbspin, fcButton, fcImgBtn, fcShapeBtn, wwdbdatetimepicker,
   CMDateTimePicker, CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient,
   uCMClientDataSet, uCtrlCadContasOrc, uCtrlCadContasOrcPorGrupo,
   uCtrlParamIntegra, uCMTypes, uCmSqlParams, uCtrlPlanPrevContabPatro,
  CMDBLookupCombo;


type
   TfrmCadContasOrcPorGrupoMT = class(TFrmCadastroMestreDetMT)
      tbsFormulas: TTabSheet;
      tbsContasOrc: TTabSheet;
      tbsFluxoCaixa: TTabSheet;
      tbsArquivoGen: TTabSheet;
      DBedtNomeContaOrc: TwwDBEdit;
      lblCodigoConta: TLabel;
      lblNome: TLabel;
      lblFormulaOrc: TLabel;
      lblFormulaReal: TLabel;
      dbcConverte: TDBCheckBox;
      tbsValorInformado: TTabSheet;
      gbValorInformadoRea: TGroupBox;
      dbrValorRealizado: TDBRealEdit;
      gbValorInformadoOrc: TGroupBox;
      dbrValorOrcado: TDBRealEdit;
      pnlFluxoCaixa: TPanel;
      pnlContasOrc: TPanel;
      dbgrdContaOrc: TwwDBGrid;
      dbgrdFluxo: TwwDBGrid;
      tbsContaRea: TTabSheet;
      pnlContasRea: TPanel;
      dbgrdContaRea: TwwDBGrid;
      lblContaRefOrc: TLabel;
      dblcContaRefOrc: TwwDBLookupCombo;
      dbrPercOrc: TDBRealEdit;
      lblPercOrc: TLabel;
      dbrPercRea: TDBRealEdit;
      lblPercRea: TLabel;
      dblcContaRefRea: TwwDBLookupCombo;
      lblContaRefRea: TLabel;
      spbOrcado: TSpeedButton;
      spbRealizado: TSpeedButton;
      dblcUnidNegoc: TwwDBLookupCombo;
      lblUnidNegoc: TLabel;
      dblcCentroRespon: TwwDBLookupCombo;
      lblCentroRespon: TLabel;
      dblcTipoRD: TwwDBLookupCombo;
      lblTipoRD: TLabel;
      dblcCCusto: TwwDBLookupCombo;
      lblCCusto: TLabel;
      dblcAtividade: TwwDBLookupCombo;
      lblAtividade: TLabel;
      dbreFormulaOrcado: TwwDBEdit;
      dbreFormulaReal: TwwDBEdit;
      btnCriaSQL: TBitBtn;
      dbrdgSinal: TDBRadioGroup;
      tbsObs: TTabSheet;
      dbeObservacao: TwwDBEdit;
      lblObservacao: TLabel;
      dblcCentRespConta: TwwDBLookupCombo;
      Label4: TLabel;
      dbrgGeracaoDados: TDBRadioGroup;
      btnImportaContab: TToolbarButton97;
      MontaSelectGrupo: TMontaSelect;
      dbcboTipoCalcReal: TwwDBComboBox;
      Label5: TLabel;
      dbcboTipoCalcOrc: TwwDBComboBox;
      Label6: TLabel;
      tbsCond: TTabSheet;
      dbgrdCond: TwwDBGrid;
      Panel2: TPanel;
      Label9: TLabel;
      dblkContaIni: TwwDBLookupCombo;
      Label7: TLabel;
      dbcboCondicao: TwwDBComboBox;
      dbcboTipoIni: TwwDBComboBox;
      dblkContaFim: TwwDBLookupCombo;
      Label8: TLabel;
      dbrValorIni: TDBRealEdit;
      Label10: TLabel;
      dblkContaRes: TwwDBLookupCombo;
      dbcboTipoRes: TwwDBComboBox;
      dbrValorRes: TDBRealEdit;
      Image1: TImage;
      Label11: TLabel;
      memSQL: TMemo;
      cmccConta: TCMProcuraMaskContabil;
      dbcboCalcValor: TwwDBComboBox;
      Label1: TLabel;
      dbcTransfere: TDBCheckBox;              
      dteDataInativa: TCMDateTimePicker;
      dblkCCustoFluxo: TwwDBLookupCombo;
      Label2: TLabel;
      dbchkInativa: TDBCheckBox;
      Label12: TLabel;
      dteDataAtiva: TCMDateTimePicker;
      Label13: TLabel;
      pnlPlanoPatroC: TPanel;
      lblPlanoPrevC: TLabel;
      dblcPlanoPrevC: TwwDBLookupCombo;
      lblPatroC: TLabel;
      dblcPatroC: TwwDBLookupCombo;
      pnlPlanoPatroF: TPanel;
      lblPlanPrevF: TLabel;
      lblPlatroF: TLabel;
      dblcPlanPrevF: TwwDBLookupCombo;
      dblcPatroF: TwwDBLookupCombo;
      ToolbarSep973: TToolbarSep97;
      DBedtGrupo: TCMProcuraMask;
      DBedtCodigoContaOrc: TwwDBEdit;
      MontaSelectContaContab: TMontaSelect;
      Label14: TLabel;
      sePosIni1: TwwDBSpinEdit;
      Label15: TLabel;
      sePosFim1: TwwDBSpinEdit;
      Label16: TLabel;
      edConteudo1: TEdit;
      sePosIni2: TwwDBSpinEdit;
      sePosFim2: TwwDBSpinEdit;
      edConteudo2: TEdit;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
    tbsRelac: TTabSheet;
      Label24: TLabel;
      dblcPlanoContabil: TwwDBLookupCombo;
      CdsDet: TCMClientDataSet;

      dsDetContaOrc    : TwwDataSource;
      dsDetFluxo       : TwwDataSource;
      dsDetContaRea    : TwwDataSource;
      dsContaContabil  : TwwDataSource;
      dsGrupo          : TwwDataSource;
      dsDetCond        : TwwDataSource;
      dsDataView       : TwwDataSource;
      dsTodoDet        : TwwDataSource;
      dsMovOrcamento   : TwwDataSource;

      CdsAux             : TCMClientDataSet;
      CdsCCusto          : TCMClientDataSet;
      CdsCCustoConta     : TCMClientDataSet;
      CdsCCustoFluxo     : TCMClientDataSet;
      CdsCenRespConta    : TCMClientDataSet;
      CdsCentroRespon    : TCMClientDataSet;
      CdsContaCondFim    : TCMClientDataSet;
      CdsContaCondIni    : TCMClientDataSet;
      CdsContaCondRes    : TCMClientDataSet;
      CdsContaContab     : TCMClientDataSet;
      CdsContaContabil   : TCMClientDataSet;
      CdsContasOrc       : TCMClientDataSet;
      CdsContasRef       : TCMClientDataSet;
      CdsDataView        : TCMClientDataSet;
      CdsDetCond         : TCMClientDataSet;
      CdsDetContaOrc     : TCMClientDataSet;
      CdsDetContaRea     : TCMClientDataSet;
      CdsDetFluxo        : TCMClientDataSet;
      CdsGrupo           : TCMClientDataSet;
      CdsGrupoAux        : TCMClientDataSet;
      CdsMovOrcamento    : TCMClientDataSet;
      CdsPatro           : TCMClientDataSet;
      CdsPatroConta      : TCMClientDataSet;
      CdsPlanoContabil   : TCMClientDataSet;
      CdsPlanoPrev       : TCMClientDataSet;
      CdsPlanoPrevConta  : TCMClientDataSet;
      CdsTestaComposicao : TCMClientDataSet;
      CdsTipoRD          : TCMClientDataSet;
      CdsTodoDet         : TCMClientDataSet;
      CdsUnidNegoc       : TCMClientDataSet;
      CdsUnidNegocConta  : TCMClientDataSet;
      qryGrupo: TCMSqlParams;
      ClientDataSet1: TClientDataSet;
      QryDet: TCMSqlParams;
      Bevel1: TBevel;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep974: TToolbarSep97;
      ToolbarSep975: TToolbarSep97;
      pgbStatus: TProgressBar;
      cdsContaOrc: TCMClientDataSet;
      MontaSelectAndreAntigo: TMontaSelect;
      btnTransf: TfcShapeBtn;
      CMSqlParams1: TCMSqlParams;
      CMSqlParams2: TCMSqlParams;
      Panel1: TPanel;
      Panel3: TPanel;
    GridRelacionamento: TwwDBGrid;
    CdsRelac: TCMClientDataSet;
    dsRelac: TDataSource;
    pnlTotRel: TPanel;
    CMSqlParams3: TCMSqlParams;
    dblcPrograma: TwwDBLookupCombo;
    Label3: TLabel;
    Label20: TLabel;
    dblcTipoDespesa: TwwDBLookupCombo;
    cdsPrograma: TCMClientDataSet;
    cdsTipoDespesa: TCMClientDataSet;
    cdsProgramaConta: TCMClientDataSet;
    cdsTipoDespesaConta: TCMClientDataSet;
    dblkProgramaFluxo: TwwDBLookupCombo;
    dblkTipoDespesaFluxo: TwwDBLookupCombo;
    Label21: TLabel;
    Label22: TLabel;
    cdsTipoDespesaFluxo: TCMClientDataSet;
    cdsProgramaFluxo: TCMClientDataSet;
    cdsPlanoOrc: TCMClientDataSet;
    labPlanoOrc: TLabel;
    cboPlanoOrc: TCMDBLookupCombo;
    dbcGruposDif: TDBCheckBox;

      procedure HabilitaDetalheOrc;
      procedure HabilitaDetalheRea;

      procedure CriaConsulta;

      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);

      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeDetalheInsert(Sender: TObject);
      procedure CmeDetalheEdit(Sender: TObject);

      procedure dbreFormulaOrcadoEnter(Sender: TObject);
      procedure dbreFormulaRealEnter(Sender: TObject);
      procedure dbreFormulaOrcadoExit(Sender: TObject);
      procedure dbreFormulaRealExit(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure spbOrcadoClick(Sender: TObject);
      procedure spbRealizadoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure dblcContaRefOrcEnter(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure dbcboTipoIniCloseUp(Sender: TwwDBComboBox; Select: Boolean);
      procedure dbcboTipoResCloseUp(Sender: TwwDBComboBox; Select: Boolean);
      procedure btnCriaSQLClick(Sender: TObject);
      procedure dbcboTipoCalcRealCloseUp(Sender: TwwDBComboBox; Select: Boolean);
      procedure dbcboTipoCalcOrcCloseUp(Sender: TwwDBComboBox; Select: Boolean);
      procedure dbcboTipoCalcOrcExit(Sender: TObject);
      procedure dbcboTipoCalcRealExit(Sender: TObject);
      procedure dbchkInativaClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure btnTransfClick(Sender: TObject);
      procedure DBedtGrupoExit(Sender: TObject);
      procedure dblcPlanoContabilCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure dblcPlanoContabilExit(Sender: TObject);
      procedure MensagemChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dblcAtividadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CdsDetCondBeforePost(DataSet: TDataSet);
    procedure CdsDetCondAfterOpen(DataSet: TDataSet);
    procedure CdsDetNewRecord(DataSet: TDataSet);
    procedure GridRelacionamentoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GridRelacionamentoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure GridRelacionamentoRowChanged(Sender: TObject);
    procedure CdsRelacAfterOpen(DataSet: TDataSet);
    procedure tbcDetalheChange(Sender: TObject);
    procedure cboPlanoOrcChange(Sender: TObject);


   private  // Private declarations

      Mensagem : TEdit;
      MsgMsg   : String;

      iIdPlanoOrc : integer; // Edilaine - SOL 172383-7764 / KTN 1556975

      CtrlCadContasOrc           : TCtrlCadContasOrc;
      CtrlCadContasOrcPorGrupo   : TCtrlCadContasOrcPorGrupo;

      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

      procedure AtualizaLlbAtividade(var lblLocal: TLabel; pUNETIPO, pATIVIDADE: String);

      function  VerificaPreenchimento: Boolean;


      //Ricardo SOl 159215 Kintana 1337816
      //Ao inserir\atualizar é realizado um consulta do grupo inserido\alterado
      //para listas todas aas inforamções na tela
      procedure FinalizaOperacao;

   public   // Public declarations

      procedure Progresso(vParam : Array of Variant);

   end;



var
  frmCadContasOrcPorGrupoMT: TfrmCadContasOrcPorGrupoMT;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, DBaseDados, uFuncaoGeral, uModulo, uString,
   uVerificaPreenchimento, FCadContasOrcPorGrupoAuxMT, uFuncoesOrcamento,
  FProgresso;








procedure TfrmCadContasOrcPorGrupoMT.Progresso(vParam : Array of Variant);
begin
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)
//   vParam[2] :  Mínimo de Registros
//   vParam[3] :  Total de Registros
//   vParam[4] :  Registro Atual
//   vParam[5] :  mensagem
//   vParam[6] :  ?

   case vParam[1] of
      0: frmProgresso.MostraFormProgresso(vParam[5],  // Legenda
                                          False,      // Botão Visivel
                                          False,      // Botão Habilitado
                                          True,       // Barra Visível
                                          vParam[2],  // Mínimo
                                          vParam[3]   // Máximo
                                         );
      1: frmProgresso.AndaFormProgresso(vParam[4]);
      2: frmProgresso.EscondeFormProgresso;
   end;

   Application.ProcessMessages;
end;



procedure TfrmCadContasOrcPorGrupoMT.FormCreate(Sender: TObject);

begin
   inherited;
   // Edilaine - SOL 172383-7764 / KTN 1556975
   iIdPlanoOrc := -1;
   {
   MontaSelectGrupo.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
   qryGrupo.Sql.Add('AND IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

   pgbStatus.Position := 0;
   pgbStatus.Min      := 0;
   pgbStatus.Max      := 17;
   pgbStatus.Visible  := True;
   }
   // Edilaine - SOL 172383-7764 / KTN 1556975 - fim

   dbcTransfere.enabled := false;  // Edilaine - SOL 190311 / KTN 1799290

   Mensagem := TEdit.Create(nil);
   Mensagem.OnChange := MensagemChange;

   CtrlCadContasOrc           := TCtrlCadContasOrc.Create;
   CtrlCadContasOrcPorGrupo   := TCtrlCadContasOrcPorGrupo.Create;

   CtrlCadContasOrc.Initialize(DtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True,
                               nil,
                               nil,
                               False
                              );

   CtrlCadContasOrcPorGrupo.InitializeAs(CtrlCadContasOrc);

   CtrlCadContasOrcPorGrupo.Progresso  := Progresso;

   CtrlCadContasOrc.iPlanoOrc          := iIdPlanoOrc;  {Modulo.iPlanoOrc;}  // Edilaine - SOL 172383-7764 / KTN 1556975
   CtrlCadContasOrc.idEmpresa          := Sistema.IdEmpresa;
   CtrlCadContasOrc.Mensagem           := Mensagem;
   CtrlCadContasOrc.pgbStatus          := pgbStatus;

   pgbStatus.Position                  := 1;

   CtrlCadContasOrc.Cds                := Cds;
   CtrlCadContasOrc.CdsAux             := CdsAux;
   CtrlCadContasOrc.CdsCCusto          := CdsCCusto;
   CtrlCadContasOrc.CdsCCustoConta     := CdsCCustoConta;
   CtrlCadContasOrc.CdsCCustoFluxo     := CdsCCustoFluxo;
   CtrlCadContasOrc.CdsCenRespConta    := CdsCenRespConta;
   CtrlCadContasOrc.CdsCentroRespon    := CdsCentroRespon;
   CtrlCadContasOrc.CdsContaCondFim    := CdsContaCondFim;
   CtrlCadContasOrc.CdsContaCondIni    := CdsContaCondIni;
   CtrlCadContasOrc.CdsContaCondRes    := CdsContaCondRes;
   CtrlCadContasOrc.CdsContaContab     := CdsContaContab;
   CtrlCadContasOrc.CdsContaContabil   := CdsContaContabil;
   CtrlCadContasOrc.CdsContasOrc       := CdsContasOrc;
   CtrlCadContasOrc.CdsContasRef       := CdsContasRef;
   CtrlCadContasOrc.CdsDataView        := CdsDataView;
   CtrlCadContasOrc.CdsDet             := CdsDet;
   CtrlCadContasOrc.CdsDetCond         := CdsDetCond;
   CtrlCadContasOrc.CdsDetContaOrc     := CdsDetContaOrc;
   CtrlCadContasOrc.CdsDetContaRea     := CdsDetContaRea;
   CtrlCadContasOrc.CdsDetFluxo        := CdsDetFluxo;
   CtrlCadContasOrc.CdsGrupo           := CdsGrupo;
   CtrlCadContasOrc.CdsGrupoAux        := CdsGrupoAux;
   CtrlCadContasOrc.CdsMovOrcamento    := CdsMovOrcamento;
   CtrlCadContasOrc.CdsPatro           := CdsPatro;
   CtrlCadContasOrc.CdsPatroConta      := CdsPatroConta;
   CtrlCadContasOrc.CdsPlanoContabil   := CdsPlanoContabil;
   CtrlCadContasOrc.CdsPlanoPrev       := CdsPlanoPrev;
   CtrlCadContasOrc.CdsPlanoPrevConta  := CdsPlanoPrevConta;
   CtrlCadContasOrc.CdsTestaComposicao := CdsTestaComposicao;
   CtrlCadContasOrc.CdsTipoRD          := CdsTipoRD;
   CtrlCadContasOrc.CdsTodoDet         := CdsTodoDet;
   CtrlCadContasOrc.CdsUnidNegoc       := CdsUnidNegoc;
   CtrlCadContasOrc.CdsUnidNegocConta  := CdsUnidNegocConta;

   //Ricardo SOl 159215 Kintana 1337816
   CtrlCadContasOrc.CdsPrograma          := cdsPrograma;
   CtrlCadContasOrc.CdsProgramaConta     := CdsProgramaConta;
   CtrlCadContasOrc.CdsProgramaFluxo     := cdsProgramaFluxo;

   CtrlCadContasOrc.CdsTipoDespesa       := CdsTipoDespesa;
   CtrlCadContasOrc.CdsTipoDespesaConta  := CdsTipoDespesaConta;
   CtrlCadContasOrc.CdsTipoDespesaFluxo  := cdsTipoDespesaFluxo;
   //Ricardo SOl 159215 Kintana 1337816 - fim

   pgbStatus.Position := 2;  

   CtrlCadContasOrc.AbreQueries(True);
   CtrlCadContasOrc.SelecionaFilhos;

   // Edilaine - SOL 172383-7764 / KTN 1556975
   cdsPlanoOrc.Data := CtrlCadContasOrcPorGrupo.ListaPlanoOrcamento('-1');


   CdsRelac.Data := CtrlCadContasOrc.ListaRelacionamentos(-1,-1);


   MontaSelectContaContab.Mascaras[0] := ParamIntegra.MascaraPlano + ';0; ';
   MontaSelectContaContab.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(CtrlCadContasOrc.CdsAuxContab.FieldByName('PLANO').asInteger));

   // MontaSelect da Conta Orçamentária (Busca & Controle geral)
   //MontaSelect.Filtro.Add('COR.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));       // Edilaine - SOL 172383-7764 / KTN 1556975 - comentada
   MontaSelect.Filtro.Add('COR.IDPESSOA       = ' + IntToStr(Sistema.IDEmpresa));

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(CtrlCadContasOrc);

   pgbStatus.Visible := False;   
end;



procedure TfrmCadContasOrcPorGrupoMT.FormShow(Sender: TObject);
begin
   inherited;

   CtrlCadContasOrc.sCodContaOrc := '';
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.bInicioConta := False;

   CtrlCadContasOrc.FazerQryPrincipal;
   CtrlCadContasOrc.iConsulta    := -1;

   //CtrlCadContasOrc.SelecionaFilhos;
   memSQL.lines.text             := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

   // Edilaine - SOL 172383-7764 / KTN 1556975 - comentado
   //DBedtGrupo.Mascara          := Modulo.sMascaraGrupo;

   //Seleciona o Plano de Contas
   cmccConta.Mascara             := ParamIntegra.MascaraPlano;
   cmccConta.Plano               := ParamIntegra.Plano;

   //Ricardo SOl 159215 Kintana 1337816   {HARDCODE}
   dblcPrograma.DataField    := 'IDPROGRAMAORCAMEN';
   dblcTipoDespesa.DataField := 'IDTIPO_DEPESAORCAMEN';
   //Ricardo SOl 159215 Kintana 1337816 - fim


end;



procedure TfrmCadContasOrcPorGrupoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Mensagem.Free;

   CtrlCadContasOrc.Free;
   CtrlCadContasOrcPorGrupo.Free;

   CtrlPlanPrevContabPatro.Free;

   inherited;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbreFormulaOrcadoEnter(Sender: TObject);
begin
   inherited;

   //Inicializa a verificação da fórmula
   CtrlCadContasOrc.iPos         := length(dbreFormulaOrcado.text);
   CtrlCadContasOrc.bInicioConta := False;
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.iAbrePar     := 0;
   CtrlCadContasOrc.iFechaPar    := 0;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbreFormulaRealEnter(Sender: TObject);
begin
   inherited;

   //Inicializa a verificação da fórmula
   CtrlCadContasOrc.iPos         := length(dbreFormulaReal.text);
   CtrlCadContasOrc.bInicioConta := False;
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.iAbrePar     := 0;
   CtrlCadContasOrc.iFechaPar    := 0;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbreFormulaOrcadoExit(Sender: TObject);
begin
   inherited;

   if not(CtrlCadContasOrc.VerificaFormula(dbreFormulaOrcado, MsgMsg)) then
   begin
      MsgDlg(MsgMsg, 'Orçamento', mtError, [mbOk], 0);
      Repaint;

      if dbreFormulaOrcado.canFocus then dbreFormulaOrcado.SetFocus;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbreFormulaRealExit(Sender: TObject);
begin
   inherited;

   if not(CtrlCadContasOrc.VerificaFormula(dbreFormulaReal, MsgMsg)) then
   begin
      MsgDlg(MsgMsg, 'Orçamento', mtError, [mbOk], 0);
      Repaint;

      if dbreFormulaReal.canFocus then dbreFormulaReal.SetFocus;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   CtrlCadContasOrc.sCodContaOrc := '';
   memSQL.lines.text             := '';
   CtrlCadContasOrc.iConsulta    := -1;
   CtrlCadContasOrc.idGrupoOrcamen := -1;  //Edilaine - SOL 189232 / KTN 1786577
   CtrlCadContasOrc.iPlanoOrc      := -1;  //Edilaine - SOL 189232 / KTN 1786577
   cboPlanoOrc.clear;                      //Edilaine - SOL 189232 / KTN 1786577
   
   CtrlCadContasOrc.SelecionaFilhos;
   memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

   CdsRelac.EmptyDataSet;
   pnlTotRel.Caption := 'Total de (0) relacionamentos';

   CtrlCadContasOrc.ValoresDefault;

   // Passa -1 para o ID da conta, que será a chave que a tela Aux vai buscar
   Cds.FieldByName('IDCONTAORCAMEN').AsInteger := -1;

   dbrdgSinal.itemIndex := 0;

   // Controla o TabSet de acordo com o cálculo
   HabilitaDetalheOrc;
   HabilitaDetalheRea;

   dbcboTipoCalcReal.Enabled := True;
   dbcboTipoCalcOrc.Enabled  := True;
end;



procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   HabilitaDetalheOrc;
   HabilitaDetalheRea;

   CdsRelac.EmptyDataSet;
   pnlTotRel.Caption := 'Total de (0) relacionamentos';

end;



procedure TfrmCadContasOrcPorGrupoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

   if (Cds.State in ([dsInsert,dsEdit])) then
   begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 1) then
      begin
         if dblcPlanoContabil.CanFocus then dblcPlanoContabil.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 3) then
      begin
         if dblcContaRefOrc.CanFocus then dblcContaRefOrc.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 4) then
      begin
         if dblcContaRefRea.CanFocus then dblcContaRefRea.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 5) then
      begin
         if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   if (Cds.State in ([dsInsert,dsEdit])) then
   begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 1) then
      begin
         if dblcPlanoContabil.CanFocus then dblcPlanoContabil.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 2) then
      begin
         if dblcContaRefOrc.CanFocus then dblcContaRefOrc.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 4) then
      begin
         if dblcContaRefRea.CanFocus then dblcContaRefRea.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 5) then
      begin
         if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.HabilitaDetalheOrc;
begin
   //Faz o controle do TabSet de acordo com o Tipo de Cálculo do Orcado
   tbsContasOrc.Enabled        := False;
   dbreFormulaOrcado.Enabled   := False;
   spbOrcado.Enabled           := False;
   gbValorInformadoOrc.Enabled := False;
   dbrgGeracaoDados.Enabled    := False;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'M') or (Cds.FieldByName('TIPOCALCORCADO').AsString = 'A') then
   begin
      dbreFormulaOrcado.Enabled := True;
      spbOrcado.Enabled         := True;
      btnTransf.enabled         := False;
   end;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'F') then
   begin
      tbsContasOrc.Enabled := True;
      btnTransf.enabled    := True;
   end;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'C') then
   begin
      tbsCond.Enabled   := True;
      btnTransf.enabled := False;
   end;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'I') then
   begin
      gbValorInformadoOrc.Enabled := True;
      dbrgGeracaoDados.Enabled    := True;
      btnTransf.enabled           := False;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.HabilitaDetalheRea;
begin
   // Faz o controle do TabSet de acordo com o Tipo de Cálculo do Realizado
   tbsFluxoCaixa.Enabled       := False;
   tbsDet.Enabled              := False;
   tbsContaRea.Enabled         := False;
   tbsArquivoGen.Enabled       := False;
   dbreFormulaReal.Enabled     := False;
   spbRealizado.Enabled        := False;
   gbValorInformadoRea.Enabled := False;
   dbrgGeracaoDados.Enabled    := False;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'M') or (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'A') then
   begin
     dbreFormulaReal.Enabled := True;
     spbRealizado.Enabled    := True;
     btnTransf.enabled       := False;
   end;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'X') then
   begin
      tbsFluxoCaixa.Enabled := True;
      btnTransf.enabled     := False;
   end;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'I') then
   begin
      gbValorInformadoRea.Enabled := True;
      dbrgGeracaoDados.Enabled    := True;
      btnTransf.enabled           := False;
   end;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'P') then
   begin
      tbsDet.Enabled    := True;
      btnTransf.enabled := False;
   end;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'F') then
   begin
      tbsContaRea.Enabled := True;
      btnTransf.enabled   := True;
   end;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'C') then
   begin
      tbsCond.Enabled   := True;
      btnTransf.enabled := False;
   end;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'G') then
   begin
      tbsArquivoGen.Enabled := True;
      btnTransf.enabled     := False;
   end
   else
   begin
      memSQL.lines.text     := '';
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
   if (Cds.State in ([dsInsert])) then    //Edilaine - SOL 189232 / KTN 1786577
      cboPlanoOrc.Clear;  // Edilaine - SOL 188480 / KTN 1776616

   inherited;
   btnImportaContab.Enabled := False;
   btnTransf.Enabled        := False;
end;


procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroDelete(Sender: TObject);
begin
  if not CtrlCadContasOrc.ExcluiGrupoOrcamen(Cds.FieldByName('IDGRUPOORCAMEN').AsInteger, true) then  // Edilaine - SOL 188480 / KTN 1776616
     MsgDlg('Houve um erro ao tentar excluir o grupo orçamentário.' + #13 +
            'Motivo: ' + CtrlCadContasOrc.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     CtrlCadContasOrc.iPlanoOrc      := -1;  // Edilaine - SOL 188480 / KTN 1776616
     CtrlCadContasOrc.idGrupoOrcamen := -1;  // Edilaine - SOL 188480 / KTN 1776616
     CtrlCadContasOrc.sCodContaOrc := '';
     CtrlCadContasOrc.sConta       := '';
     CtrlCadContasOrc.bInicioConta := False;
     CtrlCadContasOrc.FazerQryPrincipal;
     CtrlCadContasOrc.iConsulta    := -1;
     CtrlCadContasOrc.SelecionaFilhos;

     CdsRelac.Data := CtrlCadContasOrc.ListaRelacionamentos(-1,-1);  // Edilaine - SOL 188480 / KTN 1776616
     cboPlanoOrc.Clear;                                              // Edilaine - SOL 188480 / KTN 1776616
  end;

end;



procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroFind(Sender: TObject);
begin
   //Abre a Busca e seleciona os registros filhos da Conta Orçamentária
   Repaint;

   if MontaSelect.RetornouValor then
   begin
      Repaint;

      cdsContaOrc.Data := CtrlCadContasOrc.TrazContaOrc(MontaSelect.ValoresChave[0],
                                                        MontaSelect.ValoresChave[1],
                                                        IntToStr(Sistema.IDEmpresa),
                                                        MontaSelect.ValoresChave[2],
                                                       );

      // Edilaine - SOL 172383-7764 / KTN 1556975
      cdsPlanoOrc.data := CtrlCadContasOrcPorGrupo.ListaPlanoOrcamento(MontaSelect.ValoresChave[1]);
      cboPlanoOrc.LookUpValue := MontaSelect.ValoresChave[0];
      iIdPlanoOrc := StrToInt(MontaSelect.ValoresChave[0]);

      CtrlCadContasOrc.iPlanoOrc := iIdPlanoOrc;
      CtrlCadContasOrc.AbreQueries(True);
      //CtrlCadContasOrc.SelecionaFilhos;    // Edilaine - SOL 188480 / KTN 1776616 - comentada
      // Edilaine - SOL 172383-7764 / KTN 1556975 = fim

      CtrlCadContasOrc.sCodContaOrc := cdsContaOrc.FieldByName('IDCONTAORCAMEN').AsString;

      //Ricardo SOl 159215 Kintana 1337816
      CtrlCadContasOrc.IdGrupoOrcamen := StrToInt(MontaSelect.ValoresChave[1]);

      CtrlCadContasOrc.FazerQryPrincipal;
      CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

      CtrlCadContasOrc.SelecionaFilhos;
      memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

      CdsRelac.Data := CtrlCadContasOrc.ListaRelacionamentos(StrToInt(MontaSelect.ValoresChave[1]),Sistema.IdEmpresa);

      if Cds.FieldByName('FLGATIVA').asString = 'I' then
      begin
         dteDataInativa.enabled := True;
         dteDataAtiva.enabled   := True;
      end;
   end;

   Repaint;
end;




function TfrmCadContasOrcPorGrupoMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if ((Cds.FieldByName('IDGRUPOORCAMEN').IsNull) or (Cds.FieldByName('IDGRUPOORCAMEN').AsInteger < 1)) then
         raise EValidacao.CreateVal('Obrigatório preencher o Grupo a que esta Conta pertence.', DBedtGrupo);

      // Edilaine - SOL 172383-7764 / KTN 1556975
      if (cboPlanoOrc.text = '') then
         raise EValidacao.CreateVal('Obrigatório o preenchimento do Plano Orçamentário.', cboPlanoOrc);
      // Edilaine - SOL 172383-7764 / KTN 1556975 - fim

      if dbrdgSinal.ItemIndex < 0 then
         raise EValidacao.CreateVal('Obrigatório selecionar se a Conta é de valor Positivo ou Negativo.', dbrdgSinal);

      if dbcboCalcValor.ItemIndex < 0 then
         raise EValidacao.CreateVal('Obrigatório selecionar o Tipo de Cálculo dos Valores Acumulados.', dbcboCalcValor);

      if not(CtrlCadContasOrc.VerificaLinhaGrid(CtrlCadContasOrc.CdsDet, 0, 0, 'Conta Contábil', True)) then
         raise EValidacao.CreateVal(CtrlCadContasOrc.MessageInfo, DBedtGrupo);

      if not(CtrlCadContasOrc.VerificaLinhaGrid(CtrlCadContasOrc.CdsDetContaOrc, 0, 0, 'Composição de Contas Orçado', True)) then
         raise EValidacao.CreateVal(CtrlCadContasOrc.MessageInfo, DBedtGrupo);

      if not(CtrlCadContasOrc.VerificaLinhaGrid(CtrlCadContasOrc.CdsDetContaRea, 0, 0, 'Composição de Contas Orçado', True)) then
         raise EValidacao.CreateVal(CtrlCadContasOrc.MessageInfo, DBedtGrupo);

      if not(CtrlCadContasOrc.VerificaLinhaGrid(CtrlCadContasOrc.CdsDetFluxo, 0, 0, 'Fluxo de Caixa', True)) then
         raise EValidacao.CreateVal(CtrlCadContasOrc.MessageInfo, DBedtGrupo);

      if ((dbgrdDet.DataSource.DataSet.IsEmpty) and
          (dbgrdContaOrc.DataSource.DataSet.IsEmpty) and
          (dbgrdContaRea.DataSource.DataSet.IsEmpty) and
          (dbgrdFluxo.DataSource.DataSet.IsEmpty) and
          (dbgrdCond.DataSource.DataSet.IsEmpty)

          and ((dbcboTipoCalcOrc.ItemIndex <> 0) and (dbcboTipoCalcReal.ItemIndex <> 0)) )

         then
      begin
         raise EValidacao.CreateVal('É necessário indicar a composição da Conta Orçamentária.', dbcboTipoCalcOrc);
      end;

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadContasOrcPorGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
   try
      if VerificaPreenchimento then
      begin
         //pgbStatus.Visible := True;    // Edilaine - SOL 172383-7764 / KTN 1556975 - comentado

         CtrlCadContasOrc.ProcessaConfirma(True);

         //pgbStatus.Visible := False;   // Edilaine - SOL 172383-7764 / KTN 1556975 - comentado

         inherited;
      end;

   finally
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.spbOrcadoClick(Sender: TObject);
begin
   inherited;

   //Busca uma Conta Orçamentária para colocar na fórmula do Orçado
   MontaSelect.Executar;
   Repaint;

   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      dbreFormulaOrcado.Text := dbreFormulaOrcado.Text + trim(MontaSelect.ValoresChave[1]);
   end;

   if (not (Cds.State in ([dsInsert, dsEdit]))) then
   begin
      Cds.Edit;
   end;

   Cds.FieldByName('FORMULAORCADO').AsString := dbreFormulaOrcado.Text;
   if dbreFormulaOrcado.canFocus then dbreFormulaOrcado.SetFocus;
end;



procedure TfrmCadContasOrcPorGrupoMT.spbRealizadoClick(Sender: TObject);
begin
   inherited;

   //Busca uma Conta Orçamentária para colocar na fórmula do Realizado
   MontaSelect.Executar;
   Repaint;

   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      dbreFormulaReal.Text := dbreFormulaReal.Text + trim(MontaSelect.ValoresChave[1]);
   end;

   Cds.FieldByName('FORMULAREALIZADO').AsString := dbreFormulaReal.Text;
   if dbreFormulaReal.canFocus then dbreFormulaReal.SetFocus;
end;



procedure TfrmCadContasOrcPorGrupoMT.CmeDetalheConfirma(Sender: TObject);
var
   rPerc : Double;
begin
   with CtrlCadContasOrc.dtmCadContasOrcamen do
   begin
      if (Cds.State in ([dsInsert,dsEdit])) then
      begin
         if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (CdsDet.State in ([dsInsert,dsEdit])) then
         begin

            if cmccConta.Valida <> VcOK then
            begin
               if cmccConta.canFocus then cmccConta.SetFocus;
               Exit;
            end;

            if Trim(dblcCCusto.Text) <> '' then
               CdsDet.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa
            else
               CdsDet.FieldByName('IDEMPRESA').AsString  := '';

            CdsDet.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
            CdsDet.FieldByName('PLANOME').AsString   := dblcPlanoContabil.Text;
            CdsDet.FieldByName('NOMECC').AsString    := dblcCCusto.Text;
            CdsDet.FieldByName('NOMEAP').AsString    := dblcAtividade.Text;
            CdsDet.FieldByName('NOMEPLANO').AsString := dblcPlanoPrevC.Text;
            CdsDet.FieldByName('NOMEPATRO').AsString := dblcPatroC.Text;
            CdsDet.FieldByName('UNECODIGO').AsString := CdsUnidNegoc.FieldByName('UNECODIGO').AsString;
            CdsDet.FieldByName('DESCPLANO').AsString := CdsPlanoContabil.FieldByName('DESCPLANO').AsString;

            //Ricardo SOl 159215 Kintana 1337816
            CdsDet.FieldByName('PROGRAMA').AsString    := dblcPrograma.Text;
            CdsDet.FieldByName('TIPODESPESA').AsString := dblcTipoDespesa.Text;
            //Ricardo SOl 159215 Kintana 1337816 - fim
         end;

         if (pgctrlDetalhe.ActivePage.PageIndex = 2) and (CdsDetContaOrc.State in ([dsInsert,dsEdit])) then
         begin

         CdsDetContaOrc.FieldByName('NOMECONTAORCAMEN').AsString := CdsContasOrc.FieldByName('NOMECONTAORCAMEN').AsString;

            if trim(edConteudo1.Text) <> '' then
            begin
               rPerc := dbrPercOrc.Value;

               CtrlCadContasOrc.ProcessaDetalheConfirma1(sePosIni1.Value,
                                                          sePosFim1.Value,
                                                          edConteudo1.Text,
                                                          rPerc);
               edConteudo1.Text := '';
               sePosIni1.Value  := 0;
               sePosFim1.Value  := 0;
            end;
         end;

         if (pgctrlDetalhe.ActivePage.PageIndex = 4) and (CdsDetContaRea.State in ([dsInsert,dsEdit])) then
         begin
            CdsDetContaRea.FieldByName('NOMECONTAORCAMEN').AsString := CdsContasOrc.FieldByName('NOMECONTAORCAMEN').AsString;

            if trim(edConteudo2.Text) <> '' then
            begin

               rPerc := dbrPercOrc.Value;

               CtrlCadContasOrc.ProcessaDetalheConfirma2(sePosIni2.Value,
                                                         sePosFim2.Value,
                                                         edConteudo2.Text,
                                                         rPerc);
               edConteudo2.Text := '';
               sePosIni2.Value  := 0;
               sePosFim2.Value  := 0;
            end;
         end;

         if (pgctrlDetalhe.ActivePage.PageIndex = 5) and (CdsDetFluxo.State in ([dsInsert,dsEdit])) then
         begin
            if trim(dblcTipoRD.Text) = '' then
            begin
               MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso.','Erro',mtError,[mbOk],0);
               Repaint;

               if dblcTipoRD.canFocus then dblcTipoRD.SetFocus;
               Exit;
           end;

           CdsDetFluxo.FieldByName('RECPAG').AsString     := CdsTipoRD.FieldByName('RECPAG').AsString;
           CdsDetFluxo.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
           CdsDetFluxo.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
           CdsDetFluxo.FieldByName('NOMECC').AsString     := dblkCCustoFluxo.Text;
           CdsDetFluxo.FieldByName('NOMEAP').AsString     := dblcUnidNegoc.Text;
           CdsDetFluxo.FieldByName('NOMECR').AsString     := dblcCentroRespon.Text;
           CdsDetFluxo.FieldByName('NOMETR').AsString     := dblcTipoRD.Text;
           CdsDetFluxo.FieldByName('NOMEPLANO').AsString  := dblcPlanPrevF.Text;
           CdsDetFluxo.FieldByName('NOMEPATRO').AsString  := dblcPatroF.Text;

           //Ricardo SOl 159215 Kintana 1337816
           CdsDetFluxo.FieldByName('PROGRAMA').AsString    := dblkProgramaFluxo.Text;
           CdsDetFluxo.FieldByName('TIPODESPESA').AsString := dblkTipoDespesaFluxo.Text;
           //Ricardo SOl 159215 Kintana 1337816 - fim
         end;

         if (pgctrlDetalhe.ActivePage.PageIndex = 7) and (CdsDetCond.State in ([dsInsert,dsEdit])) then
         begin

            if trim(dblkContaIni.Text) = '' then
            begin
               MsgDlg('Obrigatório preencher a Conta Inicial da Condição.','Erro',mtError,[mbOk],0);
               Repaint;

               if dblkContaIni.canFocus then dblkContaIni.SetFocus;
               Exit;
            end;

            if trim(dbcboCondicao.Text) = '' then
            begin
               MsgDlg('Obrigatório preencher a Condição.','Erro',mtError,[mbOk],0);
               Repaint;

               if dbcboCondicao.canFocus then dbcboCondicao.SetFocus;
               Exit;
            end;

            if trim(dbcboTipoIni.Text) = '' then
            begin
               MsgDlg('Obrigatório preencher o Tipo Inicial.','Erro',mtError,[mbOk],0);
               Repaint;

               if dbcboTipoIni.canFocus then dbcboTipoIni.SetFocus;
               Exit;
            end;

            if trim(dbcboTipoRes.Text) = '' then
            begin
               MsgDlg('Obrigatório preencher o Tipo do Resultado.','Erro',mtError,[mbOk],0);
               Repaint;

               if dbcboTipoRes.canFocus then dbcboTipoRes.SetFocus;
               Exit;
            end;
         end;
      end;
   end;

   inherited;
end;



procedure TfrmCadContasOrcPorGrupoMT.dblcContaRefOrcEnter(Sender: TObject);
begin
   inherited;

   // Dá refresh na query de Composição de Contas para que a lookupCombo seja preenchida
   CdsContasOrc.Data := CtrlCadContasOrc.dtmCadContasOrcamen.qryContasOrc.Data;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbcboTipoIniCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;

   if dbcboTipoIni.Text = 'ao Valor' then
   begin
      dbrValorIni.enabled := True;
      dblkContaFim.enabled := False;
   end
   else
   begin
      dbrValorIni.enabled := False;
      dblkContaFim.enabled := True;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbcboTipoResCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;

   if dbcboTipoRes.Text = 'ao Valor' then
   begin
      dbrValorRes.enabled  := True;
      dblkContaRes.enabled := False;
   end
   else
   begin
      dbrValorRes.enabled  := False;
      dblkContares.enabled := True;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.btnCriaSQLClick(Sender: TObject);
begin
   inherited;

   if memSQL.Lines.text <> '' then
   begin
      if MsgDlg('Deseja reescrever a Consulta?', 'Pergunta', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         Repaint;
         CriaConsulta;
      end;
      Repaint;
   end
   else
   begin
      CriaConsulta;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.CriaConsulta;
begin
//
end;



procedure TfrmCadContasOrcPorGrupoMT.dbcboTipoCalcRealCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;
   HabilitaDetalheRea;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbcboTipoCalcOrcCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;
   HabilitaDetalheOrc;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbcboTipoCalcOrcExit(Sender: TObject);
begin
   inherited;
   HabilitaDetalheOrc;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbcboTipoCalcRealExit(Sender: TObject);
begin
   inherited;
   HabilitaDetalheRea;
end;



procedure TfrmCadContasOrcPorGrupoMT.dbchkInativaClick(Sender: TObject);
begin
   inherited;
   dteDataInativa.enabled := True;
   dteDataAtiva.enabled   := True;
end;



procedure TfrmCadContasOrcPorGrupoMT.FormActivate(Sender: TObject);
begin
   inherited;

   //Comentado por Ricardo
   {if not(Sistema.UsaPlanoPatro) then
   begin
      pnlPlanoPatroF.Visible := False;
      pnlPlanoPatroC.Visible := False;
      pnlPlanoPatroP.Visible := False;
   end;}
end;



procedure TfrmCadContasOrcPorGrupoMT.btnTransfClick(Sender: TObject);
begin
   inherited;

   with CtrlCadContasOrc do
   begin
      if (CdsDetContaOrc.isEmpty) and (CdsDetContaRea.isEmpty) then
      begin
         MsgDlg('A Composição do Orçado e a Composição do Realizado estão vazias.' + #13 +
                'Transferência não realizada.', 'Orçamento', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;

      if CdsDetContaOrc.isEmpty then
      begin
         ProcessabtnTransfClick1;
      end
      else
      begin
         ProcessabtnTransfClick2;
      end;
   end;

   MsgDlg('Transferência realizada com sucesso.','Aviso',mtInformation,[mbOk],0);
   Repaint;
end;



procedure TfrmCadContasOrcPorGrupoMT.DBedtGrupoExit(Sender: TObject);
begin
   inherited;

   if ActiveControl.Tag <> 999 then
   begin
      //Marcio Sanches Spinosa SOL 241986 PPM 563140 - Inicio
      if not (MontaSelectGrupo.ValoresChave[4] = 'A') then
      //Marcio Sanches Spinosa SOL 241986 PPM 563140 - Fim
      begin
        if DBedtGrupo.Valida <> VcOK then
           DBedtGrupo.SetFocus;
      end
      else
      begin
         //Higor Nayde  SOL - 172384/10302 KTN - 1710639
         if MontaSelectGrupo.RetornouValor then
            CdsGrupo.Locate( 'IDGRUPOORCAMEN', StrToInt(MontaSelectGrupo.ValoresChave[3]), [loCaseinsensitive]);
         //Higor Nayde  SOL - 172384/10302 KTN - 1710639

         Cds.FieldByName('IDGRUPOORCAMEN').AsInteger := CdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;

         if Cds.FieldByName('NOMECONTAORCAMEN').IsNull then
         begin
            Cds.FieldByName('NOMECONTAORCAMEN').AsString := CdsGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
         end;

         if ((Cds.State = dsInsert) and not(CdsGrupo.FieldByName('FLGSINALGRUPO').isNull)) then
         begin
            Cds.FieldByName('FLGSINALCONTA').AsString := CdsGrupo.FieldByName('FLGSINALGRUPO').AsString;
         end;

         // Edilaine - SOL 172383-7764 / KTN 1556975
         cdsPlanoOrc.Data := CtrlCadContasOrcPorGrupo.ListaPlanoOrcamento( CdsGrupo.FieldByName('IDGRUPOORCAMEN').AsString );
         cboPlanoOrc.LookupValue := CdsGrupo.FieldByName('IDPLANOORCAMEN').AsString;
         iIdPlanoOrc := CdsGrupo.FieldByName('IDPLANOORCAMEN').AsInteger;
         // Edilaine - SOL 172383-7764 / KTN 1556975


         // Edilaine - SOL 188480 / KTN 1776616
         CtrlCadContasOrc.IdGrupoOrcamen := CdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;
         CtrlCadContasOrc.iPlanoOrc      := iIdPlanoOrc;
        // Edilaine - SOL 188480 / KTN 1776616 - fim
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.dblcPlanoContabilCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if trim(dblcPlanoContabil.Text) <> '' then
   begin
      cmccConta.Plano   := StrToInt(dblcPlanoContabil.LookUpValue);
      cmccConta.Mascara := CtrlCadContasOrc.CdsPlanoContabil.FieldByName('MASCARA').AsString;
   end
   else
   begin
      cmccConta.Mascara := ParamIntegra.MascaraPlano;
      cmccConta.Plano   := ParamIntegra.Plano;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.dblcPlanoContabilExit(Sender: TObject);
begin
   inherited;
   if trim(dblcPlanoContabil.Text) <> '' then
   begin
      cmccConta.Plano   := StrToInt(dblcPlanoContabil.LookUpValue);
      cmccConta.Mascara := CtrlCadContasOrc.CdsPlanoContabil.FieldByName('MASCARA').AsString;
   end
   else
   begin
      cmccConta.Mascara := ParamIntegra.MascaraPlano;
      cmccConta.Plano   := ParamIntegra.Plano;
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.MensagemChange(Sender: TObject);
begin
   inherited;

   if Mensagem.Text <> '' then
   begin
      CtrlCadContasOrc.Confirmado := (Msgdlg(Mensagem.Text, 'Orçamento', mtConfirmation, [mbNo, mbYes], 0) = mrYes);
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.AtualizaLlbAtividade(var lblLocal   : TLabel;
                                                              pUNETIPO   : String;
                                                              pATIVIDADE : String
                                                        );
begin
end;



procedure TfrmCadContasOrcPorGrupoMT.dblcAtividadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Modified then
   begin
   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.dblcUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Modified then
   begin

   end;
end;



procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := False;

   if (dbcboTipoCalcReal.Value = 'X') and (CdsDetFluxo.IsEmpty) then
   begin
      MsgDlg('Foi escolhido tipo de cálculo realizado "Fluxo de Caixa" e não foram informados parâmetros para o mesmo', 'Orçamento', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;


   Accept := True;

   inherited;
end;



procedure TfrmCadContasOrcPorGrupoMT.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);

var
  sLista: TStringList;

begin
  inherited;
  try
     sLista            := TStringList.Create;
     sLista.Text       := sqlText;
     sLista.Strings[4] := '''  '' AS CENTROCUSTO,';
     sLista.Strings[5] := '''  '' AS ATIVPROJETO,';
     sLista.Strings[6] := '''  '' AS PLANO,';
     sLista.Strings[7] := '''  '' AS C5,';

     sqlText := sLista.Text;

  finally
     FreeAndNil(sLista);
  end;


  //Ricardo SOL 167901 KINTANA 1476693
  //Retirar comando LOWER
  sqlText := StringReplace(sqlText,'LOWER','',[rfReplaceAll]);



end;

procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  Cds.FieldByName('IDPLANOORCAMEN').AsInteger := iIdPlanoOrc; // Helen - SOL 187700 /KTN 1767662
  CtrlCadContasOrc.CadastroConfirma(DBedtCodigoContaOrc.Text, MemSQL.Lines.Text);

   btnImportaContab.enabled := False;

   inherited;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      Application.CreateForm(TfrmCadContasOrcPorGrupoAuxMT, frmCadContasOrcPorGrupoAuxMT);

      frmCadContasOrcPorGrupoAuxMT.ContaOrc     := Cds.FieldByName('IDCONTAORCAMEN').AsString;
      frmCadContasOrcPorGrupoAuxMT.GrupoOrc     := Cds.FieldByName('IDGRUPOORCAMEN').AsInteger;
      frmCadContasOrcPorGrupoAuxMT.CodGrupoOrc  := Cds.FieldByName('CODGRUPOORC').AsString;    // Helen - SOL 187700 /KTN 1767662
      frmCadContasOrcPorGrupoAuxMT.iIdPlanoOrc  := iIdPlanoOrc;  // Edilaine - SOL 172383-7764 / KTN 1556975

      frmCadContasOrcPorGrupoAuxMT.CmeCadastro.Operacao  := CmeCadastro.Operacao;

      frmCadContasOrcPorGrupoAuxMT.ShowModal;

      CtrlCadContasOrc.FazerQryPrincipal;
      CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

      CtrlCadContasOrc.SelecionaFilhos;
      memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

      // Edilaine - SOL 188480 / KTN 1776616
      CdsRelac.Data := CtrlCadContasOrc.ListaRelacionamentos(CtrlCadContasOrc.IdGrupoOrcamen ,Sistema.IdEmpresa);

      if Cds.FieldByName('FLGATIVA').asString = 'I' then
      begin
         dteDataInativa.enabled := True;
         dteDataAtiva.enabled   := True;
      end;

      Repaint;
      Application.ProcessMessages;
   end;

   // Edilaine - SOL 188480 / KTN 1776616
   { comentado a função FinalizaOperacao NA INCLUSAO primeiro pq é permitida
     várias inclusões e os dados não carregados a menos que clique em CANCELA
     e faça uma pesquisa. E tb pq se fizer a consulta de um grupo do plano 2010
     e na sequencia a inclusão de contas para um grupo de 2012, na função
     comentada os parametros que serão carregados são da pesquisa, ou seja, do
     grupo com plano 2010

   //Ricardo SOl 159215 Kintana 1337816
   FinalizaOperacao();
   }
end;


procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Para inativar
  //--------------------------------------------------------------------------------------
  if dbchkInativa.Checked then
  begin
     if MsgDlg('A opção "Grupo orçamentário inativo" está selecionada, portanto, todos os ' +
               'relacionamentos deste grupo orçamentário serão INATIVADOS e as alterações efetuadas na tela ' +
               'serão descartadas. Deseja realmente continuar com o processo?','Aviso',mtWarning,[mbYes,mbNo],0) = mrYes then
     begin
        Accept := CtrlCadContasOrcPorGrupo.InativaGrupoOrcamentario(True,Cds.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                                    Cds.FieldByName('IDPLANOORCAMEN').AsInteger);
        if not Accept then
        begin
           MsgDlg('Não foi possível inativar o grupo orçamentário. ' + #13 +
                  'Motivo: ' + CtrlCadContasOrcPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
           bbtnCancelar.Click;
           Exit;
        end
        else
           Exit;
     end
     else
     begin
        Accept := False;
        Exit;
     end;
  end
  else
  // Para ativar
  //--------------------------------------------------------------------------------------
  begin
     // Faz a validação, caso o usuário esteja ATIVANDO o grupo
     if Cds.State = dsEdit then
        Cds.Post;
     if ((Cds.FieldByName('FLGATIVA').OldValue = 'I') and
         (Cds.FieldByName('FLGATIVA').NewValue = 'A')) then
     begin
        if MsgDlg('A opção "Grupo orçamentário inativo" está desmarcada, portanto, todos os ' +
                  'relacionamentos deste grupo orçamentário serão ATIVADOS e as alterações efetuadas na tela ' +
                  'serão descartadas. Deseja realmente continuar com o processo?','Aviso',mtWarning,[mbYes,mbNo],0) = mrYes then
        begin
           Accept := CtrlCadContasOrcPorGrupo.InativaGrupoOrcamentario(False,Cds.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                                       Cds.FieldByName('IDPLANOORCAMEN').AsInteger);
           if not Accept then
           begin
              MsgDlg('Não foi possível ativar o grupo orçamentário. ' + #13 +
                     'Motivo: ' + CtrlCadContasOrcPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
              bbtnCancelar.Click;
              Exit;
           end
           else
              Exit;
        end
        else
        begin
           Accept := False;
           Exit;
        end;
     end;
  end;

  if not CtrlCadContasOrc.AlteraGrupoContasOrcamen then
    MsgDlg('Não foi possível alterar o grupo orçamentário. ' + #13 +
           'Motivo: ' + CtrlCadContasOrc.MessageInfo,'Erro',mtError,[mbOk],0)

  else
  begin
     Application.CreateForm(TfrmCadContasOrcPorGrupoAuxMT, frmCadContasOrcPorGrupoAuxMT);
     frmCadContasOrcPorGrupoAuxMT.ContaOrc              := Cds.FieldByName('IDCONTAORCAMEN').AsString;
     frmCadContasOrcPorGrupoAuxMT.GrupoOrc              := Cds.FieldByName('IDGRUPOORCAMEN').AsInteger;
     frmCadContasOrcPorGrupoAuxMT.iIdPlanoOrc           := iIdPlanoOrc;  // Edilaine - SOL 172383-9602 / KTN 1661594
     frmCadContasOrcPorGrupoAuxMT.CodGrupoOrc           := Cds.FieldByName('CODGRUPOORC').AsString;    // Edilaine - SOL 188480 / KTN 1776616

     frmCadContasOrcPorGrupoAuxMT.CmeCadastro.Operacao  := CmeCadastro.Operacao;
     frmCadContasOrcPorGrupoAuxMT.ShowModal;

     CtrlCadContasOrc.FazerQryPrincipal;
     CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

     CtrlCadContasOrc.SelecionaFilhos;
     memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

     if Cds.FieldByName('FLGATIVA').asString = 'I' then
     begin
        dteDataInativa.enabled := True;
        dteDataAtiva.enabled   := True;
     end;

     Repaint;
     Application.ProcessMessages;
  end;

  //Ricardo SOl 159215 Kintana 1337816
  FinalizaOperacao();
end;





procedure TfrmCadContasOrcPorGrupoMT.CdsDetCondBeforePost(
  DataSet: TDataSet);
var
   sDescricao : String;
begin
   inherited;
   sDescricao := '';

   with DataSet do
   begin
      sDescricao := sDescricao + 'Se o Grupo ' + dblkContaIni.Text;

      if FieldByName('CONDICAO').asString = '<=' then sDescricao := sDescricao + ' for menor ou igual ';
      if FieldByName('CONDICAO').asString = '<'  then sDescricao := sDescricao + ' for menor ';
      if FieldByName('CONDICAO').asString = '='  then sDescricao := sDescricao + ' for igual ';
      if FieldByName('CONDICAO').asString = '>=' then sDescricao := sDescricao + ' for maior ou igual ';
      if FieldByName('CONDICAO').asString = '>'  then sDescricao := sDescricao + ' for maior ';
      if FieldByName('CONDICAO').asString = '<>' then sDescricao := sDescricao + ' for diferente ';

      if FieldByName('TIPOCONDINI').asString = 'V' then sDescricao := sDescricao + 'que o Valor ' + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDINI').asFloat);
      if FieldByName('TIPOCONDINI').asString = 'C' then sDescricao := sDescricao + 'que o Grupo ' + dblkContaFim.Text;

      sDescricao := sDescricao + ' então a condição receberá o Valor ';

      if FieldByName('TIPOCONDRES').asString = 'V' then sDescricao := sDescricao + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDRES').asFloat);
      if FieldByName('TIPOCONDRES').asString = 'C' then sDescricao := sDescricao + 'do Grupo ' + dblkContaRes.Text;

      FieldByName('CONDDESCRICAO').asString := sDescricao;
   end;
end;




procedure TfrmCadContasOrcPorGrupoMT.CdsDetCondAfterOpen(
  DataSet: TDataSet);
var
  sDescricao : String;

begin
  inherited;
  if DataSet.RecordCount <> 0 then
  begin
      sDescricao := '';

      with DataSet do
      begin
         First;
         while not Eof do
         begin
            sDescricao := sDescricao + 'Se o Grupo ' + dblkContaIni.Text;

            if FieldByName('CONDICAO').asString = '<=' then sDescricao := sDescricao + ' for menor ou igual ';
            if FieldByName('CONDICAO').asString = '<'  then sDescricao := sDescricao + ' for menor ';
            if FieldByName('CONDICAO').asString = '='  then sDescricao := sDescricao + ' for igual ';
            if FieldByName('CONDICAO').asString = '>=' then sDescricao := sDescricao + ' for maior ou igual ';
            if FieldByName('CONDICAO').asString = '>'  then sDescricao := sDescricao + ' for maior ';
            if FieldByName('CONDICAO').asString = '<>' then sDescricao := sDescricao + ' for diferente ';

            if FieldByName('TIPOCONDINI').asString = 'V' then sDescricao := sDescricao + 'que o Valor ' + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDINI').asFloat);
            if FieldByName('TIPOCONDINI').asString = 'C' then sDescricao := sDescricao + 'que o Grupo ' + dblkContaFim.Text;

            sDescricao := sDescricao + ' então a condição receberá o Valor ';

            if FieldByName('TIPOCONDRES').asString = 'V' then sDescricao := sDescricao + FormatFloat('###,###,###,##0.00', FieldByName('VLRCONDRES').asFloat);
            if FieldByName('TIPOCONDRES').asString = 'C' then sDescricao := sDescricao + 'do Grupo ' + dblkContaRes.Text;

            Edit;
            FieldByName('CONDDESCRICAO').asString := sDescricao;
            Post;

            Next;
         end;
      end;
  end;
end;




procedure TfrmCadContasOrcPorGrupoMT.CdsDetNewRecord(DataSet: TDataSet);
begin
  inherited;
  // Traz selecionado como "default" o plano contabil em vigor
  if dbcboTipoCalcReal.ItemIndex = 1 then
  begin
     CdsDet.FieldByName('PLANO').AsInteger :=  CtrlCadContasOrc.RetornaPlanContabEmVigor(Sistema.IdEmpresa);
  end;
end;




procedure TfrmCadContasOrcPorGrupoMT.GridRelacionamentoTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  CdsRelac.IndexFieldNames := AFieldName;
end;




procedure TfrmCadContasOrcPorGrupoMT.GridRelacionamentoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmCadContasOrcPorGrupoMT.GridRelacionamentoRowChanged(
  Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TfrmCadContasOrcPorGrupoMT.CdsRelacAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlTotRel.Caption := 'Total de ' + IntToStr(CdsRelac.RecordCount) + ' relacionamento(s)';
end;




procedure TfrmCadContasOrcPorGrupoMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if not (CmeCadastro.Operacao in [opAlterar,opInserir]) then
  begin
     if CdsRelac.RecordCount <> 0 then
     begin
        CtrlCadContasOrc.sCodContaOrc := CdsRelac.FieldByName('IDCONTAORCAMEN').AsString;
        CtrlCadContasOrc.FazerQryPrincipal;
        CtrlCadContasOrc.SelecionaFilhos;
     end;
  end;

end;


procedure TfrmCadContasOrcPorGrupoMT.FinalizaOperacao;
begin
     TRY
        Screen.Cursor := crHourGlass;

        //Abre a Busca e seleciona os registros filhos da Conta Orçamentária
        Repaint;

        if MontaSelect.RetornouValor then
        begin
             Repaint;

             cdsContaOrc.Data := CtrlCadContasOrc.TrazContaOrc(MontaSelect.ValoresChave[0],
                                                        MontaSelect.ValoresChave[1],
                                                        IntToStr(Sistema.IDEmpresa),
                                                        MontaSelect.ValoresChave[2],
                                                       );

             CtrlCadContasOrc.sCodContaOrc := cdsContaOrc.FieldByName('IDCONTAORCAMEN').AsString;

             CtrlCadContasOrc.FazerQryPrincipal;
             CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

             CtrlCadContasOrc.SelecionaFilhos;
             memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

             CdsRelac.Data := CtrlCadContasOrc.ListaRelacionamentos(StrToInt(MontaSelect.ValoresChave[1]),Sistema.IdEmpresa);


             if Cds.FieldByName('FLGATIVA').asString = 'I' then
             begin
                  dteDataInativa.enabled := True;
                  dteDataAtiva.enabled   := True;
             end;
        end;

        Repaint;

     FINALLY
        Screen.Cursor := crDefault;
     END;
end;

procedure TfrmCadContasOrcPorGrupoMT.cboPlanoOrcChange(Sender: TObject);
begin
  inherited;
  // Edilaine - SOL 172383-7764 / KTN 1556975
  iIdPlanoOrc := -1;
  if (cboPlanoOrc.text = '') then
  begin
    if cboPlanoOrc.LookUpValue <> '' then
       iIdPlanoOrc := StrToInt( cboPlanoOrc.LookUpValue );

    DBedtGrupo.Mascara := cdsPlanoOrc.FieldByName('MASCARAGRUPO').AsString;

    if CmeCadastro.Operacao = opInserir then
    begin
      CtrlCadContasOrc.SelecionaFilhos;
      memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

      Cds.FieldByName('IDPLANOORCAMEN').AsInteger   := iIdPlanoOrc;
    end;

  end;
  // Edilaine - SOL 172383-7764 / KTN 1556975 - fim
end;

end.

