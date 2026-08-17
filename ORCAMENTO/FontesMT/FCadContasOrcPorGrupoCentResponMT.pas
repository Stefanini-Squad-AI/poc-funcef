// Alterações:
// - pendência 17608
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
Rotina    :
Data      : 25/11/2003
Autor     : André Pontes
Pendencia : 15700
Descrição : Combo do Centro de Responsabilidade deslocada para a orelha "parâmetros da conta"
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/11/2003
Autor     : André Pontes
Pendencia : 15700
Descrição : Criado novo form, baseado no frmCadContasOrcPorGrupoMT
---------------------------------------------------------------------------------------------------}

unit FCadContasOrcPorGrupoCentResponMT;

Interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   TB97, TabControlDetalhe, ExtCtrls, wwdblook, TREdit, Mask,   wwdbedit, DBCtrls,
   wwriched, CMTree, IvDictio, IvMulti, IvEMulti, Wwdotdot, Wwdbcomb, CMProcuraMask,
   Parser10, Wwdbspin, fcButton, fcImgBtn, fcShapeBtn, wwdbdatetimepicker,
   CMDateTimePicker, CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient,
   uCMClientDataSet,  uCtrlPlanPrevContabPatro,
   uCtrlCadContasOrc, uCtrlCadContasOrcPorGrupo,
   uCtrlParamIntegra, uCMTypes, uCmSqlParams;

type
   TfrmCadContasOrcPorGrupoCentResponMT = class(TFrmCadastroMestreDetMT)
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
      Label3: TLabel;
      btnCriaSQL: TBitBtn;
      dbrdgSinal: TDBRadioGroup;
      tbsObs: TTabSheet;
      dbeObservacao: TwwDBEdit;
      lblObservacao: TLabel;
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
      memlegenda: TMemo;
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
      TabSheet1: TTabSheet;
      Label20: TLabel;
      dblcCCustoParamConta: TwwDBLookupCombo;
      Label21: TLabel;
      dblcAtivParamConta: TwwDBLookupCombo;
      pnlPlanoPatroP: TPanel;
      Label22: TLabel;
      Label23: TLabel;
      dblcPlanoParamConta: TwwDBLookupCombo;
      dblcPatroParamConta: TwwDBLookupCombo;
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
      CdsDetCondIDCONTACONDINI: TStringField;
      CdsDetCondIDCONTACONDFIM: TStringField;
      CdsDetCondIDCONTACONDRES: TStringField;
      CdsDetCondCONDICAO: TStringField;
      CdsDetCondTIPOCONDINI: TStringField;
      CdsDetCondTIPOCONDRES: TStringField;
      CdsDetCondVLRCONDINI: TFloatField;
      CdsDetCondVLRCONDRES: TFloatField;
      CdsDetCondIDCONTAORCAMEN: TStringField;
      CdsDetCondIDPLANOORCAMEN: TFloatField;
      CdsDetCondIDCOMPCONTASORC: TFloatField;
      CdsDetCondCONDDESCRICAO: TStringField;
      lblAtividade3: TLabel;
      lblAtividade2: TLabel;
      lblAtividade1: TLabel;
      QryDet: TCMSqlParams;
      Bevel1: TBevel;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep974: TToolbarSep97;
      ToolbarSep975: TToolbarSep97;
      pgbStatus: TProgressBar;
      cdsContaOrc: TCMClientDataSet;
    MontaSelectAndreAntigo: TMontaSelect;
    btnTransf: TfcShapeBtn;
    dblcCentRespConta: TwwDBLookupCombo;
    Label4: TLabel;
    CMSqlParams1: TCMSqlParams;

      procedure HabilitaDetalheOrc;
      procedure HabilitaDetalheRea;

      procedure CriaConsulta;

      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
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
      procedure dblcContaRefReaEnter(Sender: TObject);
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
      procedure dblcAtividadeExit(Sender: TObject);
      procedure dblcAtivParamContaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure dblcAtivParamContaExit(Sender: TObject);
      procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure dblcUnidNegocExit(Sender: TObject);
      procedure TabSheet1Show(Sender: TObject);
      procedure tbsDetShow(Sender: TObject);
      procedure tbsFluxoCaixaShow(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure dblkContaResEnter(Sender: TObject);
      procedure dblkContaFimEnter(Sender: TObject);
    procedure dblcPatroParamContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPatroFCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPatroCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentRespContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      Mensagem : TEdit;
      MsgMsg   : String;

      CtrlCadContasOrc           : TCtrlCadContasOrc;
      CtrlCadContasOrcPorGrupo   : TCtrlCadContasOrcPorGrupo;
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

      procedure AtualizaLlbAtividade(var lblLocal: TLabel; pUNETIPO, pATIVIDADE: String);

      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

      procedure Progresso(vParam : Array of Variant);

   end;



var
  frmCadContasOrcPorGrupoCentResponMT: TfrmCadContasOrcPorGrupoCentResponMT;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, DBaseDados, uFuncaoGeral, uModulo, uString,
   uVerificaPreenchimento, FCadContasOrcPorGrupoCentResponAuxMT, uFuncoesOrcamento,
   FProgresso, FCadContasOrcPorGrupoAuxMT;

   procedure TfrmCadContasOrcPorGrupoCentResponMT.Progresso(vParam : Array of Variant);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.FormCreate(Sender: TObject);

begin
   inherited;

   MontaSelectGrupo.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

   qryGrupo.Sql.Add('AND IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

   pgbStatus.Position := 0;
   pgbStatus.Min      := 0;
   pgbStatus.Max      := 17;
   pgbStatus.Visible  := True;

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

   CtrlCadContasOrc.iPlanoOrc          := Modulo.iPlanoOrc;
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

   pgbStatus.Position := 2;

   CtrlCadContasOrc.AbreQueries;

   MontaSelectContaContab.Mascaras[0] := ParamIntegra.MascaraPlano + ';0; ';
   MontaSelectContaContab.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(CtrlCadContasOrc.CdsAuxContab.FieldByName('PLANO').asInteger));

   // MontaSelect da Conta Orçamentária (Busca & Controle geral)
   MontaSelect.Filtro.Add('COR.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
   MontaSelect.Filtro.Add('COR.IDPESSOA       = ' + IntToStr(Sistema.IDEmpresa));

   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.InitializeAs(CtrlCadContasOrc);
   CdsPlanoPrev.data      := CtrlPlanPrevContabPatro.ListaPlanoPatro;
   CdsPlanoPrevConta.data := CdsPlanoPrev.data;


   pgbStatus.Visible := False;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.FormShow(Sender: TObject);
begin
   inherited;

   CtrlCadContasOrc.sCodContaOrc := '';
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.bInicioConta := False;

   CtrlCadContasOrc.FazerQryPrincipal;
   CtrlCadContasOrc.iConsulta    := -1;

   CtrlCadContasOrc.SelecionaFilhos;
   memSQL.lines.text             := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

   DBedtGrupo.Mascara            := Modulo.sMascaraGrupo;

   //Seleciona o Plano de Contas
   cmccConta.Mascara             := ParamIntegra.MascaraPlano;
   cmccConta.Plano               := ParamIntegra.Plano;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Mensagem.Free;

   CtrlCadContasOrc.Free;
   CtrlCadContasOrcPorGrupo.Free;

   CtrlPlanPrevContabPatro.Free;
   inherited;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbreFormulaOrcadoEnter(Sender: TObject);
begin
   inherited;

   //Inicializa a verificação da fórmula
   CtrlCadContasOrc.iPos         := length(dbreFormulaOrcado.text);
   CtrlCadContasOrc.bInicioConta := False;
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.iAbrePar     := 0;
   CtrlCadContasOrc.iFechaPar    := 0;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbreFormulaRealEnter(Sender: TObject);
begin
   inherited;

   //Inicializa a verificação da fórmula
   CtrlCadContasOrc.iPos         := length(dbreFormulaReal.text);
   CtrlCadContasOrc.bInicioConta := False;
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.iAbrePar     := 0;
   CtrlCadContasOrc.iFechaPar    := 0;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbreFormulaOrcadoExit(Sender: TObject);
begin
   inherited;

   if not(CtrlCadContasOrc.VerificaFormula(dbreFormulaOrcado, MsgMsg)) then
   begin
      MsgDlg(MsgMsg, 'Orçamento', mtError, [mbOk], 0);
      Repaint;

      if dbreFormulaOrcado.canFocus then dbreFormulaOrcado.SetFocus;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbreFormulaRealExit(Sender: TObject);
begin
   inherited;

   if not(CtrlCadContasOrc.VerificaFormula(dbreFormulaReal, MsgMsg)) then
   begin
      MsgDlg(MsgMsg, 'Orçamento', mtError, [mbOk], 0);
      Repaint;

      if dbreFormulaReal.canFocus then dbreFormulaReal.SetFocus;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   CtrlCadContasOrc.sCodContaOrc := '';
   memSQL.lines.text             := '';
   CtrlCadContasOrc.iConsulta    := -1;

   CtrlCadContasOrc.SelecionaFilhos;
   memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

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



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   HabilitaDetalheOrc;
   HabilitaDetalheRea;

end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

   if (Cds.State in ([dsInsert,dsEdit])) then
   begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 0) then
      begin
         if dblcPlanoContabil.CanFocus then dblcPlanoContabil.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 2) then
      begin
         if dblcContaRefOrc.CanFocus then dblcContaRefOrc.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 3) then
      begin
         if dblcContaRefRea.CanFocus then dblcContaRefRea.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 4) then
      begin
         if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   if (Cds.State in ([dsInsert,dsEdit])) then
   begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 0) then
      begin
         if dblcPlanoContabil.CanFocus then dblcPlanoContabil.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 2) then
      begin
         if dblcContaRefOrc.CanFocus then dblcContaRefOrc.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 3) then
      begin
         if dblcContaRefRea.CanFocus then dblcContaRefRea.SetFocus;
      end
      else if (pgctrlDetalhe.ActivePage.PageIndex = 4) then
      begin
         if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.HabilitaDetalheOrc;
begin
   // Faz o controle do TabSet de acordo com o Tipo de Cálculo do Orcado
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.HabilitaDetalheRea;
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroConfirma(Sender: TObject);
begin
   CtrlCadContasOrc.CadastroConfirma(DBedtCodigoContaOrc.Text, MemSQL.Lines.Text);

   btnImportaContab.enabled := False;

   inherited;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      Application.CreateForm(TfrmCadContasOrcPorGrupoCentResponAuxMT, frmCadContasOrcPorGrupoCentResponAuxMT);

      frmCadContasOrcPorGrupoCentResponAuxMT.ContaOrc := Cds.FieldByName('IDCONTAORCAMEN').AsString;
      frmCadContasOrcPorGrupoCentResponAuxMT.GrupoOrc := Cds.FieldByName('IDGRUPOORCAMEN').AsInteger;

      frmCadContasOrcPorGrupoCentResponAuxMT.CmeCadastro.Operacao  := CmeCadastro.Operacao;

      frmCadContasOrcPorGrupoCentResponAuxMT.ShowModal;

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
   end;  // if CmeCadastro.Operacao in...
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;

   btnImportaContab.Enabled := False;
   btnTransf.Enabled        := False;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroDelete(Sender: TObject);
begin
   Application.CreateForm(TfrmCadContasOrcPorGrupoCentResponAuxMT, frmCadContasOrcPorGrupoCentResponAuxMT);

   frmCadContasOrcPorGrupoCentResponAuxMT.ContaOrc     := Cds.FieldByName('IDCONTAORCAMEN').AsString;
   frmCadContasOrcPorGrupoCentResponAuxMT.GrupoOrc     := Cds.FieldByName('IDGRUPOORCAMEN').AsInteger;

   frmCadContasOrcPorGrupoCentResponAuxMT.CmeCadastro.Operacao  := CmeCadastro.Operacao;

   frmCadContasOrcPorGrupoCentResponAuxMT.ShowModal;

   Repaint;
   Application.ProcessMessages;

   CtrlCadContasOrc.sCodContaOrc := '-2';

   CtrlCadContasOrc.FazerQryPrincipal;
   CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

   CtrlCadContasOrc.SelecionaFilhos;
   memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroFind(Sender: TObject);
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

      CtrlCadContasOrc.sCodContaOrc := cdsContaOrc.FieldByName('IDCONTAORCAMEN').AsString;

      CtrlCadContasOrc.FazerQryPrincipal;
      CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

      CtrlCadContasOrc.SelecionaFilhos;
      memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

      if Cds.FieldByName('FLGATIVA').asString = 'I' then
      begin
         dteDataInativa.enabled := True;
         dteDataAtiva.enabled   := True;
      end;
   end;

   Repaint;
end;




function TfrmCadContasOrcPorGrupoCentResponMT.VerificaPreenchimento: Boolean;
begin
    Result := False;

    try

      if ((Cds.FieldByName('IDGRUPOORCAMEN').IsNull) or (Cds.FieldByName('IDGRUPOORCAMEN').AsInteger < 1)) then
         raise EValidacao.CreateVal('Obrigatório preencher o Grupo a que esta Conta pertence.', DBedtGrupo);

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

      if (dbgrdDet.DataSource.DataSet.IsEmpty) and
         (dbgrdContaOrc.DataSource.DataSet.IsEmpty) and
         (dbgrdContaRea.DataSource.DataSet.IsEmpty) and
         (dbgrdFluxo.DataSource.DataSet.IsEmpty) and
         (dbgrdCond.DataSource.DataSet.IsEmpty) then
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.bbtnConfirmarClick(Sender: TObject);
begin
   try
      if VerificaPreenchimento then
      begin
         pgbStatus.Visible := True;

         CtrlCadContasOrc.ProcessaConfirma;

         pgbStatus.Visible := False;

         inherited;
      end;

   finally
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.spbOrcadoClick(Sender: TObject);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.spbRealizadoClick(Sender: TObject);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeDetalheConfirma(Sender: TObject);
var
   rPerc : Double;
begin
   with CtrlCadContasOrc.dtmCadContasOrcamen do
   begin
      if (Cds.State in ([dsInsert,dsEdit])) then
      begin
         if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (CdsDet.State in ([dsInsert,dsEdit])) then
         begin

            if cmccConta.Valida <> VcOK then
            begin
               if cmccConta.canFocus then cmccConta.SetFocus;
               Exit;
            end;

            CdsDet.FieldByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
            CdsDet.FieldByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
            CdsDet.FieldByName('PLANOME').AsString   := dblcPlanoContabil.Text;
            CdsDet.FieldByName('NOMECC').AsString    := dblcCCusto.Text;
            CdsDet.FieldByName('NOMEAP').AsString    := dblcAtividade.Text;
            CdsDet.FieldByName('NOMEPLANO').AsString := dblcPlanoPrevC.Text;
            CdsDet.FieldByName('NOMEPATRO').AsString := dblcPatroC.Text;
            CdsDet.FieldByName('UNECODIGO').AsString := CdsUnidNegoc.FieldByName('UNECODIGO').AsString;
            CdsDet.FieldByName('DESCPLANO').AsString := CdsPlanoContabil.FieldByName('DESCPLANO').AsString;
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

         if (pgctrlDetalhe.ActivePage.PageIndex = 3) and (CdsDetContaRea.State in ([dsInsert,dsEdit])) then
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

         if (pgctrlDetalhe.ActivePage.PageIndex = 4) and (CdsDetFluxo.State in ([dsInsert,dsEdit])) then
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
         end;

         if (pgctrlDetalhe.ActivePage.PageIndex = 6) and (CdsDetCond.State in ([dsInsert,dsEdit])) then
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcContaRefOrcEnter(Sender: TObject);
begin
   inherited;

   // Dá refresh na query de Composição de Contas para que a lookupCombo seja preenchida
   CdsContasOrc.Data := CtrlCadContasOrc.dtmCadContasOrcamen.qryContasOrc.Data;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcContaRefReaEnter(Sender: TObject);
begin
   inherited;

   // Dá refresh na query de Composição de Contas para que a lookupCombo seja preenchida
   CdsContaCondIni.Data := CtrlCadContasOrc.dtmCadContasOrcamen.qryContaCondIni.Data;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblkContaFimEnter(Sender: TObject);
begin
   inherited;
   CdsContaCondFim.Data := CtrlCadContasOrc.dtmCadContasOrcamen.qryContaCondFim.Data;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblkContaResEnter(Sender: TObject);
begin
   inherited;
   CdsContaCondRes.Data := CtrlCadContasOrc.dtmCadContasOrcamen.qryContaCondRes.Data;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbcboTipoIniCloseUp(Sender: TwwDBComboBox; Select: Boolean);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbcboTipoResCloseUp(Sender: TwwDBComboBox; Select: Boolean);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.btnCriaSQLClick(Sender: TObject);
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


procedure TfrmCadContasOrcPorGrupoCentResponMT.CriaConsulta;
begin
//
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbcboTipoCalcRealCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;
   HabilitaDetalheRea;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbcboTipoCalcOrcCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;
   HabilitaDetalheOrc;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbcboTipoCalcOrcExit(Sender: TObject);
begin
   inherited;
   HabilitaDetalheOrc;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbcboTipoCalcRealExit(Sender: TObject);
begin
   inherited;
   HabilitaDetalheRea;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dbchkInativaClick(Sender: TObject);
begin
   inherited;

   dteDataInativa.enabled := True;
   dteDataAtiva.enabled   := True;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.FormActivate(Sender: TObject);
begin
   inherited;

   if not(Sistema.UsaPlanoPatro) then
   begin
      pnlPlanoPatroF.Visible := False;
      pnlPlanoPatroC.Visible := False;
      pnlPlanoPatroP.Visible := False;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.btnTransfClick(Sender: TObject);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.DBedtGrupoExit(Sender: TObject);
begin
   inherited;

   if ActiveControl.Tag <> 999 then
   begin
      if DBedtGrupo.Valida <> VcOK then
      begin
         DBedtGrupo.SetFocus;
      end
      else
      begin
         Cds.FieldByName('IDGRUPOORCAMEN').AsInteger := CdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;

         if Cds.FieldByName('NOMECONTAORCAMEN').IsNull then
         begin
            Cds.FieldByName('NOMECONTAORCAMEN').AsString := CdsGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
         end;

         if ((Cds.State = dsInsert) and not(CdsGrupo.FieldByName('FLGSINALGRUPO').isNull)) then
         begin
            Cds.FieldByName('FLGSINALCONTA').AsString := CdsGrupo.FieldByName('FLGSINALGRUPO').AsString;
         end;
      end;
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcPlanoContabilCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcPlanoContabilExit(Sender: TObject);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.MensagemChange(Sender: TObject);
begin
   inherited;

   if Mensagem.Text <> '' then
   begin
      CtrlCadContasOrc.Confirmado := (Msgdlg(Mensagem.Text, 'Orçamento', mtConfirmation, [mbNo, mbYes], 0) = mrYes);
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.AtualizaLlbAtividade(var lblLocal   : TLabel;
                                                              pUNETIPO   : String;
                                                              pATIVIDADE : String
                                                        );
begin
   if pATIVIDADE = '' then
   begin
      lblLocal.Caption := '';
   end
   else if (pUNETIPO = 'A') then
   begin
      lblLocal.Caption := 'Analítico';
   end
   else if (pUNETIPO = 'S') then
   begin
      lblLocal.Caption := 'Sintético';
      MsgDlg('Foi selecionado um grupo SINTÉTICO!', 'Orçamento', mtWarning, [mbOk], 0);
      Repaint;
   end
   else
   begin
      lblLocal.Caption := '';
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.tbsDetShow(Sender: TObject);
begin
   AtualizaLlbAtividade(lblAtividade1,
                        CdsUnidNegoc.FieldByName('UNETIPO').AsString,
                        dblcAtividade.Text
                      );
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcAtividadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Modified then
   begin
      AtualizaLlbAtividade(lblAtividade1,
                           CdsUnidNegoc.FieldByName('UNETIPO').AsString,
                           dblcAtividade.Text
                         );
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcAtividadeExit(Sender: TObject);
begin
   AtualizaLlbAtividade(lblAtividade1,
                        CdsUnidNegoc.FieldByName('UNETIPO').AsString,
                        dblcAtividade.Text
                      );
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.tbsFluxoCaixaShow(Sender: TObject);
begin
   inherited;
   AtualizaLlbAtividade(lblAtividade2,
                        CdsUnidNegoc.FieldByName('UNETIPO').AsString,
                        dblcUnidNegoc.Text
                      );
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Modified then
   begin
      AtualizaLlbAtividade(lblAtividade2,
                           CdsUnidNegoc.FieldByName('UNETIPO').AsString,
                           dblcUnidNegoc.Text
                         );
   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;

  AtualizaLlbAtividade(lblAtividade2,
                        CdsUnidNegoc.FieldByName('UNETIPO').AsString,
                        dblcUnidNegoc.Text);
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.TabSheet1Show(Sender: TObject);
begin
   inherited;

   AtualizaLlbAtividade(lblAtividade3,
                        CdsUnidNegocConta.FieldByName('UNETIPO').AsString,
                        dblcAtivParamConta.Text
                      );
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcAtivParamContaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Modified then
   begin
      AtualizaLlbAtividade(lblAtividade3,
                           CdsUnidNegocConta.FieldByName('UNETIPO').AsString,
                           dblcAtivParamConta.Text
                         );

   end;
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcAtivParamContaExit(Sender: TObject);
begin
   inherited;

   AtualizaLlbAtividade(lblAtividade3,
                        CdsUnidNegocConta.FieldByName('UNETIPO').AsString,
                        dblcAtivParamConta.Text
                      );
end;



procedure TfrmCadContasOrcPorGrupoCentResponMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
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



procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcPatroParamContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CdsPlanoPrevConta.data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, strToIntDef(dblcPatroParamConta.LookupValue, -1));
end;

procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcPatroFCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CdsPlanoPrev.data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, strToIntDef(dblcPatroF.LookupValue, -1));
end;

procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcPatroCCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CdsPlanoPrev.data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, strToIntDef(dblcPatroC.LookupValue, -1));
end;

procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcCentRespContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var stxt: string;
begin
  //pendência 26820 - 24/11/2007 - Código para não permitir que o usuário altere o cadastro, colocando um CR desativado, mas
  //aqueles registros que foram inseridos antes do CR ser desativado, permanecerão com o mesmo CR ou pode-se aterar para um CR ATIVADO.
  stxt := trim(dblcCentRespConta.text);
  if (trim(CdsCenRespConta.fieldByName('ATIVO').asString) = 'N') then
  begin
    MsgDlg('Este Centro de Responsabilidade está desativado e não é permitido associá-lo a novos cadastros.', 'Orçamento', mtError, [mbOk], 0);
    if stxt <> '' then
      dblcCentRespConta.Text := stxt
    else
      dblcCentRespConta.Text := '';
  end;

  inherited;
end;

procedure TfrmCadContasOrcPorGrupoCentResponMT.dblcCentroResponCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var stxt: string;
begin
  //pendência 26820 - 24/11/2007 - Código para não permitir que o usuário altere o cadastro, colocando um CR desativado, mas
  //aqueles registros que foram inseridos antes do CR ser desativado, permanecerão com o mesmo CR ou pode-se aterar para um CR ATIVADO.
  stxt := trim(dblcCentroRespon.text);
  if (trim(CdsCentroRespon.fieldByName('ATIVO').asString) = 'N') then
  begin
    MsgDlg('Este Centro de Responsabilidade está desativado e não é permitido associá-lo a novos cadastros.', 'Orçamento', mtError, [mbOk], 0);
    if stxt <> '' then
      dblcCentroRespon.Text := stxt
    else
      dblcCentroRespon.Text := '';
  end;
  inherited;
end;

end.
