// Alterações:
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 190485
Nº KINTANA..: 1929913
Data........: 27/05/2013
Responsável.: Felipe A. Santos
Descrição...: Alteração na rotina AppPadraoShowParamReportPadrao
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172383-7761
Nº KINTANA..: 1556947
Data........: 24/02/2012
Responsável.: Edilaine Ferraresi
Descrição...: Adicionado novo item de menu  -> Cadastros ->  Fornecedores/Sub-Despesas
              Removido item de menu  -> Cadastros ->  Plano Trabalho
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 14/11/2011
// Nº SOL........: 166067
// Nº KINTANA....: 1448049
// Rotina........: Tudo
// Descrição.....: Adicionado os relatórios:
   6021 - Valores por Grupo X Centro de Custo
   6022 - Valores por Grupo X Centro de Responsabilidade
   6023 - Valores por Grupo X Atividade de Projeto
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: AppPadraoShowParamReportPadrao
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado a chamada dos formulários padrões de relatório
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 159242\6041
Nº KINTANA..: 1385831
Data........: 01/07/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado novo itam de menu  -> Cadastros ->  Contas Contábeis por Grupo - NOVO
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 109829
Nº KINTANA..: 517466
Data........: 19/04/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Exclusão dos itens de menu: "Cadastros -> Contas Orçamentárias" e
              "Cadastros -> Contas Orçamentárias por Grupo e Centro de Responsabilidade"
{ --------------------------------------------------------------------------------------------------
Data      : 19/10/2006
Autor     : Rodolpho da Silva
Pendencia : 22175
Descrição : Inserido novo item de menu "\Processos\Justificativa de divergências dos saldos"
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/12/2003
Autor     : André Pontes
Pendencia : -
Descrição : Criado novo item de menu: "Contas Orçamentárias por Grupo e Centro de Responsabilidade"
            Todos os itens referentes a contas orçamentárias em um único "grupo"
---------------------------------------------------------------------------------------------------}

unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM,
  fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient,uCtrlParamOrcamento,
  uCMClientDataSet, uIntegraBack, uCtrlOrcamento, uResource,
  FReservasPorGrupoMT, CMNetUsers, FTransfPorGrupoMT, fRParamListaReservaPorGrupoMT,
  fRParamListaCompromissoPorGrupoMT, FCompromissosPorGrupoMT,
  FEntDadosPorGrupoMT,
  FGeracaoDadosMT,
  FJustDiverg,
  FCadBlqEntDadosMT,
  FFornecedorSubDespesa;



type
   TfrmPrincipal = class(TfrmCMPrincipal)
     PlanoOramentrio1: TMenuItem;
     GrupodeContasOramentrias1: TMenuItem;
     N3: TMenuItem;
    PerodoOramentrio1B: TMenuItem;
    Gerao1B: TMenuItem;
     EntradadeDados1: TMenuItem;
     Processos: TMenuItem;
    EfetivacaoReservasB: TMenuItem;
    SuplementaoOramentria1B: TMenuItem;
    ReservaOramentria1B: TMenuItem;
     N4: TMenuItem;
    TransfernciaOramentria2B: TMenuItem;
     N5: TMenuItem;
     Lanamentos1: TMenuItem;
     tb97Outros: TToolbar97;
     sbtnTransferencias: TToolbarButton97;
     sbtnGeracao: TToolbarButton97;
     ToolbarSep971: TToolbarSep97;
     sbtnPeriodos: TToolbarButton97;
     sbtnReservas: TToolbarButton97;
     ToolbarSep972: TToolbarSep97;
     sbtnEfetivacao: TToolbarButton97;
    Mensal1B: TMenuItem;
    Diria1B: TMenuItem;
     sbtDiaria: TToolbarButton97;
     ToolbarSep974: TToolbarSep97;
     sbtMensal: TToolbarButton97;
    CompromissoOramentrio1B: TMenuItem;
     sbtnCompromissos: TToolbarButton97;
     sbtnSuplemen: TToolbarButton97;
     N6: TMenuItem;
    UsuriosxCentroResponsabilidade1B: TMenuItem;
     sbtnUsuxCResp: TToolbarButton97;
     ToolbarSep975: TToolbarSep97;
     sbtnCriaRelat: TToolbarButton97;
    RetornoOramentrio1B: TMenuItem;
     sbtnRetorno: TToolbarButton97;
     sbtnLayout: TToolbarButton97;
     N7: TMenuItem;
    CriaodeRelatriosConfigurveis1B: TMenuItem;
    LayoutdeRelatrios1B: TMenuItem;
     N8: TMenuItem;
     Encerra1: TMenuItem;
     N9: TMenuItem;
     CopiaContasOramentrias1: TMenuItem;
     N10: TMenuItem;
     AcertaSaldodaReservaCompromisso1: TMenuItem;
     bbtnPermiteNeg: TBitBtn;
     Cenrios1: TMenuItem;
     Cenrios2: TMenuItem;
     N13: TMenuItem;
     EfetivaCenrio1: TMenuItem;
     ManipulaCenrios1: TMenuItem;
     BuscadadosContbeisparaOramento1: TMenuItem;
     N1: TMenuItem;
     CritriosdeRateio1: TMenuItem;
     TiposdeCritrio1: TMenuItem;
     ValoresBasesparaRateio1: TMenuItem;
     N2: TMenuItem;
     Especial1: TMenuItem;
     N14: TMenuItem;
     PlanodeTrabalho1: TMenuItem;
     CompromissoEspecial1: TMenuItem;
     SuplementaoEspecial1: TMenuItem;
     cdsParamOrcamento: TCMClientDataSet;
     EspecialCenario: TMenuItem;
     LogdeCenario: TMenuItem;
     AjusteOramentrio1: TMenuItem;
     BusinessIntelligence: TMenuItem;
     ContasOrcamentariasporGrupo: TMenuItem;
     mnuExecReplicaRateio: TMenuItem;
     mnuCadContasOrcPorGrupo: TMenuItem;
     N15: TMenuItem;
     N17: TMenuItem;
     mnuConsOrcadoXRealizadoSemestre: TMenuItem;
     N18: TMenuItem;
     N19: TMenuItem;
     N20: TMenuItem;
     N16: TMenuItem;
     Cenrio1: TMenuItem;
     N21: TMenuItem;
     N22: TMenuItem;
     FrmulasparaapuraroOramento1: TMenuItem;
    ExecuodeFrmulas1: TMenuItem;
    N11: TMenuItem;
    ImportaodooramentoviaplanilhaEXCEL1: TMenuItem;
    mnuReservaOrcamenGrupo: TMenuItem;
    N12: TMenuItem;
    N23: TMenuItem;
    mnuTransfOrcPorGrupo: TMenuItem;
    N24: TMenuItem;
    mnuAjusteOrcPorGrupo: TMenuItem;
    Mensal1: TAction;
    Diria1: TAction;
    Gerao1: TAction;
    CompromissoOramentrio1: TAction;
    ReservaOramentria1: TAction;
    EfetivacaoReservas: TAction;
    TransfernciaOramentria2: TAction;
    SuplementaoOramentria1: TAction;
    RetornoOramentrio1: TAction;
    ContasOramentrias1: TAction;
    PerodoOramentrio1: TAction;
    UsuriosxCentroResponsabilidade1: TAction;
    CriaodeRelatriosConfigurveis1: TAction;
    LayoutdeRelatrios1: TAction;
    N25: TMenuItem;
    mnuJustDiverg: TMenuItem;
    mnuBloqueioEntDados: TMenuItem;
    ImportaodeGruposOrcamenatario: TMenuItem;
    ContasContbeisporGrupo: TMenuItem;
    mnuDespesaOrc: TMenuItem;

      procedure PlanoOramentrio1Click(Sender: TObject);
      procedure GrupodeContasOramentrias1Click(Sender: TObject);
      procedure nmuConfigParametrosClick(Sender: TObject);
      procedure Lanamentos1Click(Sender: TObject);
      procedure Encerra1Click(Sender: TObject);
      procedure CopiaContasOramentrias1Click(Sender: TObject);
      procedure AcertaSaldodaReservaCompromisso1Click(Sender: TObject);
      procedure Cenrios1Click(Sender: TObject);
      procedure Cenrios2Click(Sender: TObject);
      procedure EfetivaCenrio1Click(Sender: TObject);
      procedure ManipulaCenrios1Click(Sender: TObject);
      procedure AppPadraoAfterLogin(Sender: TObject);
      procedure BuscadadosContbeisparaOramento1Click(Sender: TObject);
      procedure TiposdeCritrio1Click(Sender: TObject);
      procedure ValoresBasesparaRateio1Click(Sender: TObject);
      procedure Especial1Click(Sender: TObject);
      procedure PlanodeTrabalho1Click(Sender: TObject);
      procedure CompromissoEspecial1Click(Sender: TObject);
      procedure SuplementaoEspecial1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure EspecialCenarioClick(Sender: TObject);
      procedure LogDeCenarioClick(Sender: TObject);
      procedure BusinessIntelligenceClick(Sender: TObject);
      procedure mnuExecReplicaRateioClick(Sender: TObject);


      procedure AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer; var sParams: String; var PrintReport: Boolean);
      procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);

      procedure AppPadraoConfigReportPadrao(    liIdReports, liOrigemCm : Integer;
                                                 DesReport               : TObject;
                                             var Config                  : Boolean);
    procedure mnuCadContasOrcPorGrupoClick(Sender: TObject);
    procedure mnuConsOrcadoXRealizadoSemestreClick(Sender: TObject);
    procedure FrmulasparaapuraroOramento1Click(Sender: TObject);
    procedure ExecuodeFrmulas1Click(Sender: TObject);
    procedure ImportaodooramentoviaplanilhaEXCEL1Click(Sender: TObject);
    procedure mnuReservaOrcamenGrupoClick(Sender: TObject);
    procedure mnuTransfOrcPorGrupoClick(Sender: TObject);
    procedure mnuAjusteOrcPorGrupoClick(Sender: TObject);
    procedure Mensal1Execute(Sender: TObject);
    procedure Diria1Execute(Sender: TObject);
    procedure Gerao1Execute(Sender: TObject);
    procedure CompromissoOramentrio1Execute(Sender: TObject);
    procedure ReservaOramentria1Execute(Sender: TObject);
    procedure EfetivacaoReservasExecute(Sender: TObject);
    procedure TransfernciaOramentria2Execute(Sender: TObject);
    procedure SuplementaoOramentria1Execute(Sender: TObject);
    procedure RetornoOramentrio1Execute(Sender: TObject);
    procedure PerodoOramentrio1Execute(Sender: TObject);
    procedure UsuriosxCentroResponsabilidade1Execute(Sender: TObject);
    procedure CriaodeRelatriosConfigurveis1Execute(Sender: TObject);
    procedure LayoutdeRelatrios1Execute(Sender: TObject);
    procedure mnuJustDivergClick(Sender: TObject);
    procedure mnuBloqueioEntDadosClick(Sender: TObject);
    procedure ImportaodeGruposOrcamenatarioClick(Sender: TObject);
    procedure ContasContbeisporGrupoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuDespesaOrcClick(Sender: TObject);

   private
      CtrlParamOrcamento : TCtrlParamOrcamento;


   public

   end;



var
  frmPrincipal: TfrmPrincipal;



implementation
{$R *.DFM}
{$R MensagemRes.Res}
uses
   FCadPlanoOrcMT ,          FCadGruposMT,              FCadPeriodoOrcMT,          FParamOrcamenMT,
   FCadContasOrcMT,          UMensErro,                 UDatabase,                 DBaseDados,
   UFuncaoGeral,             FEntDadosMT,               FEntDadosDiariaMT,         FGeraDadosMT2,
   FReservaMT,               FTransfereMT,              FLancamentoMT,             FEfetivacaoMT,
   FCompromissoMT,           FSuplemenMT,               FCadUsuxCRespMT,           FCriaRelatorioMT,
   FEncerraExercicioMT,      FCadLayoutOrcMT,           FRetornoMT,                FCopiaContaOrcamenMT,
   FAcertaSaldoMT,           FCadCenarioMT,             FEntDadosCenarioMT,        FEfetivaCenarioMT,
   FCadTipoCriterioRatMT,    FCadValCriterioRatMT,      FPlanoTrabalhoMT,
   FRParamComparativoMT,     FRParamListaReservaMT,     FRParamListaCompromissoMT, FRParamListaTransfMT,
   FRParamListaSuplemenMT,   FRParamSaldosSintMT,       FRParamTotCenRespMT,       FRParamListaContasMT,
   FRParamSaldosMT,          FRParamListaRetornoMT,     FRParamRelatGrupoMT,       FRParamRelatGrupoAnualMT,
   FRParamDemoLayoutMT,      FRParamAtivGestor2MT,      FRParamOrcxRealContaMT,    FRParamRelatGrupoCRespMT,
   FRParamRelatGrupoCCustMT, FEntSuplemenEspecialMT,    uCtrlRptOrcamen,
   FManipCenarioMT,          FBuscaContabilMT,          uCtrlParamIntegra,         FRParamRateioPlanoTrabalhoMT,
   FConsLogCenarioMT,        FRParamPlanoTrabalho,                                 FEntCadDadosEspecialCenarioMT,
   FBIGrid,                  FExecReplicaCriterio,
   FCadContasOrcPorGrupoMT,  FCadContasOrcPorGrupoAuxMT,
   FConsOrcadoXRealizadoSemestre, FCadContasOrcPorGrupoCentResponMT,               FCadFormulaApuraOrcMT,
   FWzExecApuraOrc,          FWizImportaOrc,                                       FSuplemDeduPorGrupoMT,
   FRParamOrcxRealGrupoContaMT, FImportaDadosEntradaEspecial,
  FImportaGrupoOrcamen, FVinculaOrcadoContabil;


procedure TfrmPrincipal.PlanoOramentrio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPlanoOrcMT, TfrmCadPlanoOrcMT, False);
end;



procedure TfrmPrincipal.GrupodeContasOramentrias1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadGruposMT, TfrmCadGruposMT, False);
end;



procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmParamOrcamenMT, TfrmParamOrcamenMT, False);
end;



procedure TfrmPrincipal.Lanamentos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmLancamentoMT, TfrmLancamentoMT, False);
end;



procedure TfrmPrincipal.mnuExecReplicaRateioClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecReplicaCriterio, TfrmExecReplicaCriterio, False);
end;


procedure TfrmPrincipal.Encerra1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEncerraExercicioMT, TfrmEncerraExercicioMT, False);
end;



procedure TfrmPrincipal.CopiaContasOramentrias1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCopiaContaOrcamenMT, TfrmCopiaContaOrcamenMT, False);
end;



procedure TfrmPrincipal.AcertaSaldodaReservaCompromisso1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmAcertaSaldoMT, TfrmAcertaSaldoMT, False);
end;



procedure TfrmPrincipal.Cenrios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCenarioMT, TfrmCadCenarioMT, False);
end;



procedure TfrmPrincipal.Cenrios2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEntDadosCenarioMT, TfrmEntDadosCenarioMT, False);
end;



procedure TfrmPrincipal.EfetivaCenrio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEfetivaCenarioMT, TfrmEfetivaCenarioMT, False);
end;



procedure TfrmPrincipal.ManipulaCenrios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmManipCenarioMT, TfrmManipCenarioMT, False);
end;




procedure TfrmPrincipal.BuscadadosContbeisparaOramento1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmBuscaContabilMT, TfrmBuscaContabilMT, False);
end;



procedure TfrmPrincipal.TiposdeCritrio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTipoCriterioRatMT, TfrmCadTipoCriterioRatMT, False);
end;



procedure TfrmPrincipal.ValoresBasesparaRateio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadValCriterioRatMT, TfrmCadValCriterioRatMT, False);
end;



procedure TfrmPrincipal.Especial1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmEntDadosPorGrupoMT, TFrmEntDadosPorGrupoMT, False)
end;


procedure TfrmPrincipal.EspecialCenarioClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEntCadDadosEspecialCenarioMT, TfrmEntCadDadosEspecialCenarioMT, False);
end;



procedure TfrmPrincipal.PlanodeTrabalho1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmPlanoTrabalhoMT,TfrmPlanoTrabalhoMT,False);
end;



procedure TfrmPrincipal.CompromissoEspecial1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCompromissosPorGrupoMT, TFrmCompromissosPorGrupoMT, False);
end;



procedure TfrmPrincipal.SuplementaoEspecial1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEntSuplemenEspecialMT, TfrmEntSuplemenEspecialMT, False);
end;



procedure TfrmPrincipal.LogDeCenarioClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsLogCenarioMT, TfrmConsLogCenarioMT, False);
end;



procedure TfrmPrincipal.BusinessIntelligenceClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmBIGrid, TfrmBIGrid, False);
end;



procedure TfrmPrincipal.mnuCadContasOrcPorGrupoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadContasOrcPorGrupoMT, TfrmCadContasOrcPorGrupoMT, False);
end;

procedure TfrmPrincipal.mnuConsOrcadoXRealizadoSemestreClick(Sender: TObject);
begin
   inherited;                                         
   AbrirForm(frmConsOrcadoXRealizadoSemestre, TfrmConsOrcadoXRealizadoSemestre, False);
end;


// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   inherited;
   OrcamentoBackMT    := TOrcamentoBackMT.Create;
   CtrlParamOrcamento := TCtrlParamOrcamento.Create;
end;



procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   CtrlParamOrcamento.Free;
   OrcamentoBackMT.Free;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmPrincipal.AppPadraoPrintReportPadrao(    Sender    : TObject;
                                                        IdReports : Integer;
                                                        sFileName : String;
                                                    var Printed   : Boolean);
var
  RptOrcamen :TCtrlRptOrcamen;
begin
  inherited;
  RptOrcamen := TCtrlRptOrcamen.Create;
  Try
    Printed := ShowReport(IdReports, RptOrcamen);
    RptOrcamen.Free;
  Except
    On E : Exception Do begin
      RptOrcamen.Free;
      If (UpperCase(E.Message) <> 'OPERATION ABORTED') then begin
        Raise;
      end;
    end;
  end;
end;



procedure TfrmPrincipal.AppPadraoConfigReportPadrao(    liIdReports, liOrigemCm : Integer;
                                                         DesReport: TObject;
                                                     var Config: Boolean);
var
   RptOrcamen: TCtrlRptOrcamen;
begin
   inherited;

   RptOrcamen := TCtrlRptOrcamen.Create;

   try
      Config := ConfigReport(liIdReports, liOrigemCm, RptOrcamen, DesReport);
      RptOrcamen.Free;
   except
      on E: Exception do
      begin
         RptOrcamen.Free;
         if (UpperCase(E.message) <> 'OPERATION ABORTED') then raise;
      end;  // on E: Exception do
   end;  // try..except
end;



procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(     sender      : TObject;
                                                             IdReports   : Integer;
                                                         var sParams     : String;
                                                         var PrintReport : Boolean);
begin
   case IDReports of
      1327: frmPreviewReports := TfrmRParamComparativoMT.Create(Self);
      1331: frmPreviewReports := TfrmRParamListaReservaMT.Create(Self);
      1332: frmPreviewReports := TfrmRParamListaCompromissoMT.Create(Self);
      1333: frmPreviewReports := TfrmRParamListaTransfMT.Create(Self);
      1334: frmPreviewReports := TfrmRParamListaSuplemenMT.Create(Self);
      1341: frmPreviewReports := TfrmRParamSaldosSintMT.Create(Self);
      1342: frmPreviewReports := TfrmRParamTotCenRespMT.Create(Self);
      1374: frmPreviewReports := TfrmRParamListaContasMT.Create(Self);
      1375: frmPreviewReports := TfrmRParamSaldosMT.Create(Self);
      1518: frmPreviewReports := TfrmRParamListaRetornoMT.Create(Self);
      2000: frmPreviewReports := TfrmRParamRelatGrupoMT.Create(Self);

      //Ricardo SOL: 159242/6041 Nº KINTANA: 1385831
      //2020: frmPreviewReports := TfrmRParamRelatGrupoAnualMT.Create(Self);
      2020: begin
            frmPreviewReports := TfrmRParamRelatGrupoMT.Create(Self);
            (frmPreviewReports As TfrmRParamRelatGrupoMT).rgImpValores.Visible := True;
      end;

      //Ricardo SOL: 166067 Nº KINTANA: 1448049
      6021,6022,6023: begin
            frmPreviewReports := TfrmRParamRelatGrupoMT.Create(Self);
            (frmPreviewReports As TfrmRParamRelatGrupoMT).rgImpValores.Visible := True;
            (FrmPreviewReports As TfrmRParamRelatGrupoMT).grbVlrSem.Visible := False; // Felipe A. Santos SOL 190485 KTN 1929913
      end;
      //Ricardo SOL: 166067 Nº KINTANA: 1448049 - fim


      2113: frmPreviewReports := TfrmRParamDemoLayoutMT.Create(Self);
      2494: frmPreviewReports := TfrmRParamAtivGestor2MT.Create(Self);
      3015: frmPreviewReports := TfrmRParamOrcxRealContaMT.Create(Self);

      //Ricardo SOL: 159242/6041 Nº KINTANA: 1385831
      //3247: frmPreviewReports := TfrmRParamRelatGrupoCRespMT.Create(Self);
      3247:frmPreviewReports := TfrmRParamRelatGrupoMT.Create(Self);
      //3250: frmPreviewReports := TfrmRParamRelatGrupoCCustMT.Create(Self);
      3250: frmPreviewReports := TfrmRParamRelatGrupoMT.Create(Self);
      3251: frmPreviewReports := TfrmRParamRelatGrupoMT.Create(Self);
      //Ricardo SOL: 159242/6041 Nº KINTANA: 1385831 - fim
      
      3637: frmPreviewReports := TfrmRParamRateioPlanoTrabalho.Create(Self);
      3729: frmPreviewReports := TfrmRParamPlanoTrabalho.Create(Self);
      20184: frmPreviewReports := TfrmRParamListaReservaPorGrupoMT.Create(Self);
      20185: frmPreviewReports := TfrmRParamListaCompromissoPorGrupoMT.Create(Self);
      20191: frmPreviewReports := TfrmParamOrcxRealGrupoContaMT.Create(Self);
   else
      frmPreviewReports       := nil;
   end;

   inherited;
end;



procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;
   if Sistema.FezLogin then
   begin
      stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

      mnuConsOrcadoXRealizadoSemestre.Enabled := True;

      if Sistema.MudouUsuario then
      begin
         CtrlParamOrcamento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                      Sistema.AppRemoteServer,True,nil,nil,False);
         OrcamentoBackMT.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                      Sistema.AppRemoteServer,True,nil,nil,False);
         OrcamentoBackMT.IdEmpresa := Sistema.IdEmpresa;
         OrcamentoBackMT.IdUsuario := Sistema.IdUsuario;
      end;

      Modulo.iPlanoOrc  := 0;
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAP);
      Modulo.sMascaraCentRespon := ParamIntegra.MascaraCr;
      cdsParamOrcamento.Data := CtrlParamOrcamento.Procurar(Sistema.idEmpresa);

      if (cdsParamOrcamento.isEmpty) or
         (cdsParamOrcamento.FieldByName('IDPLANOORCAMEN').isNull) or
         (cdsParamOrcamento.FieldByName('MASCGRUPOORC').isNull) then
      begin
         MsgDlg('Para usar o sistema de Orçamento é necessário cadastrar os parâmetros.','Aviso',mtWarning,[mbOk],0);
         Repaint;
      end
      else
      begin
         Modulo.iPlanoOrc        := cdsParamOrcamento.FieldByName('IDPLANOORCAMEN').AsInteger;
         Modulo.sMascaraGrupo    := cdsParamOrcamento.FieldByName('MASCGRUPOORC').AsString;
         Modulo.sTipoSaldo       := cdsParamOrcamento.FieldByName('FLGTIPOSALDO').AsString;
         Modulo.sPermiteSaldoNeg := cdsParamOrcamento.FieldByName('FLGVERIFICASALDO').AsString;

         if (cdsParamOrcamento.FieldByName('FLGVERIFICASALDO').isNull) or
            ((Modulo.sPermiteSaldoNeg = 'S') and not(bbtnPermiteNeg.Enabled)) then
         begin
            Modulo.sPermiteSaldoNeg := 'N';
         end;

         if cdsParamOrcamento.FieldByName('FLGPERMITETRANSF').isNull then
         begin
            Modulo.sPermiteTransf := 'N';
         end
         else
         begin
            Modulo.sPermiteTransf := cdsParamOrcamento.FieldByName('FLGPERMITETRANSF').AsString;
         end;
      end;

      IntegraBack.BuscaParamIntegra('PARAMFINANC', 'INTEGRACONTAB', ' ');
   end;
   MnuConsPart_Padrao.Visible    := False;
   Mnu_UsoPessoal_Padrao.Visible := False;

end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------




procedure TfrmPrincipal.FrmulasparaapuraroOramento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadFormulaApuraOrcMT, TFrmCadFormulaApuraOrcMT, False);
end;

procedure TfrmPrincipal.ExecuodeFrmulas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmWzExecApuraOrc, TFrmWzExecApuraOrc, false);
end;

procedure TfrmPrincipal.ImportaodooramentoviaplanilhaEXCEL1Click(
  Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmWizImportaOrc, TFrmWizImportaOrc, false);
  TRY
     FImportaEntradaDadosEspecial := TFImportaEntradaDadosEspecial.Create(Application);
     FImportaEntradaDadosEspecial.ShowModal;
  FINALLY
    FreeAndNil(FImportaEntradaDadosEspecial);
  end;
end;

procedure TfrmPrincipal.mnuReservaOrcamenGrupoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmReservasPorGrupoMT,TFrmReservasPorGrupoMT,false);
end;

procedure TfrmPrincipal.mnuTransfOrcPorGrupoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTransfPorGrupoMT,TFrmTransfPorGrupoMT,false);
end;

procedure TfrmPrincipal.mnuAjusteOrcPorGrupoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmSuplemDeduPorGrupoMT,TFrmSuplemDeduPorGrupoMT,false);
end;

procedure TfrmPrincipal.Mensal1Execute(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEntradaDadosMT, TfrmEntradaDadosMT, False);
end;

procedure TfrmPrincipal.Diria1Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmEntradaDadosDiariaMT, TfrmEntradaDadosDiariaMT, False);
end;

procedure TfrmPrincipal.Gerao1Execute(Sender: TObject);
begin
   inherited;
   if Sistema.TipoCliente = 19991 then
      AbrirForm(FrmGeracaoDadosMT, TFrmGeracaoDadosMT, False)
   else
      AbrirForm(frmGeraDadosMT2, TfrmGeraDadosMT2, False)
end;

procedure TfrmPrincipal.CompromissoOramentrio1Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCompromissoMT, TfrmCompromissoMT, False);
end;

procedure TfrmPrincipal.ReservaOramentria1Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmReservaMT, TfrmReservaMT, False);
end;

procedure TfrmPrincipal.EfetivacaoReservasExecute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmEfetivacaoMT, TfrmEfetivacaoMT, False);
end;

procedure TfrmPrincipal.TransfernciaOramentria2Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmTransfereMT, TfrmTransfereMT, False);
end;

procedure TfrmPrincipal.SuplementaoOramentria1Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmSuplemenMT, TfrmSuplemenMT, False);
end;

procedure TfrmPrincipal.RetornoOramentrio1Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmRetornoMT, TfrmRetornoMT, False);
end;

procedure TfrmPrincipal.PerodoOramentrio1Execute(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadPeriodoOrcMT,TfrmCadPeriodoOrcMT,False);
end;

procedure TfrmPrincipal.UsuriosxCentroResponsabilidade1Execute(
  Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadUsuxCRespMT,TfrmCadUsuxCRespMT,False);
end;

procedure TfrmPrincipal.CriaodeRelatriosConfigurveis1Execute(
  Sender: TObject);
begin
  inherited;
   AbrirForm(frmCriaRelatorioMT,TfrmCriaRelatorioMT, False);
end;

procedure TfrmPrincipal.LayoutdeRelatrios1Execute(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLayoutOrcMT, TfrmCadLayoutOrcMT, False);
end;

procedure TfrmPrincipal.mnuJustDivergClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmJustDiverg, TFrmJustDiverg, False);
end;




procedure TfrmPrincipal.mnuBloqueioEntDadosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadBlqEntDadosMT,TFrmCadBlqEntDadosMT,false);
end;




procedure TfrmPrincipal.ImportaodeGruposOrcamenatarioClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FImportacaoGrupoOrcamen,tFImportacaoGrupoOrcamen,false);
end;

procedure TfrmPrincipal.ContasContbeisporGrupoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmVinculaOrcadoContabil,TfrmVinculaOrcadoContabil,false);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  //Retirar
  contasContbeisporGrupo.Enabled := true;

end;

procedure TfrmPrincipal.mnuDespesaOrcClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmFornecedorSubDespesa,TfrmFornecedorSubDespesa,False);
end;

initialization

   Sistema.NomeModulo      := 'Planejamento e Orçamento';      // Nome do Módulo
   Sistema.Versao          := '3.08.21m';
   Sistema.IdModulo        := 52;                              // IdModulo cadastrado no SAD
   Sistema.NomeAplicativo  := 'Planejamento e Orçamento';
   Sistema.UsaLogOperacoes := True;
   Modulo                  := TModulo.Create;
   IntegraBack             := TIntegraBack.Create(true,true,true);
finalization

   Modulo.free;

   IntegraBack.Free;

end.
