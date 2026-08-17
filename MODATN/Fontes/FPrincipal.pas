unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97, Db, Wwdatsrc, DBTables, wwdblook,
  StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti,
  IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns,
  ActnList, ImgList, fcStatusBar, SConnect, MConnect, DBClient;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuPessoal1: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuCartasComunicados1: TMenuItem;
    mnuBrowsedoCadastro1: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuEstatisticasdoQuadro: TMenuItem;
    UsuarioRH: TPanel;
    N7: TMenuItem;
    N8: TMenuItem;
    mnuRegistrodeAvaliacoesdeDesempenho: TMenuItem;
    mnuRegistrodeOutrasAvaliacoes: TMenuItem;
    mnuHistricodeAvaliacoes: TMenuItem;
    mnuEvoluocaoPotencialdoDesempenho: TMenuItem;
    mnuRelGeral: TMenuItem;
    mnuRelAvaliacoes: TMenuItem;
    mnuAvaliacaoPreenchida: TMenuItem;
    mnuRelatoriodeAvaliacoes: TMenuItem;
    mnuProgramacaodeAvaliacoes: TMenuItem;
    N5: TMenuItem;
    mnuEstatisticadeAvaliacoes: TMenuItem;
    mnuRegistroIndividualdeTreinamento: TMenuItem;
    mnuRegistroColetivodeTreinamento: TMenuItem;
    mnuTransacoesGeral: TMenuItem;
    mnuTransacoesAvaliacoes: TMenuItem;
    mnuTransacoesTreinamento: TMenuItem;
    mnuHistoricodeTreinamento: TMenuItem;
    mnuRelTreinamento: TMenuItem;
    mnuAtividadenoPeriodo: TMenuItem;
    mnuNecessidadesdeTreinamento: TMenuItem;
    mnuMapadeTreinamento: TMenuItem;
    N6: TMenuItem;
    mnuEstatisticadeTreinamento: TMenuItem;
    mnuCandidatos: TMenuItem;
    mnuRecrutamento: TMenuItem;
    mnuRequisicaodePessoal: TMenuItem;
    N9: TMenuItem;
    mnuRegistrodeTestesEntrevistas: TMenuItem;
    mnuRegistrodeExperiencias: TMenuItem;
    mnuRegistrodeCursosdeCandidatos: TMenuItem;
    mnuEliminacaodeRequisicoes: TMenuItem;
    mnuSelecaodeCandidatos: TMenuItem;
    mnuRelRecrutamento: TMenuItem;
    mnuDossieCandidato: TMenuItem;
    mnuRequisicoesdePessoal: TMenuItem;
    mnuRotatividade: TMenuItem;
    N11: TMenuItem;
    mnuEstatisticaporFonte: TMenuItem;
    mnuEstatisticadeDemissoes: TMenuItem;
    mnuSalariosBeneficios: TMenuItem;
    mnuRegistrodeAlteracaoFuncional: TMenuItem;
    mnuSolicitdeAlteracaoFuncional: TMenuItem;
    mnuAnalisedasSolicitacoesdeAlteracao: TMenuItem;
    mnuSimulacaodeAumentos: TMenuItem;
    mnuHistoricodaEvolucaoFuncional: TMenuItem;
    mnuOrcamentodoCustodePessoal: TMenuItem;
    mnuRelSalariosBeneficios: TMenuItem;
    mnuInconsistSalar: TMenuItem;
    mnuRegistrodeBeneficios: TMenuItem;
    mnuHistoricodeBeneficios: TMenuItem;
    mnuEstatisticadeBeneficios: TMenuItem;
    N13: TMenuItem;
    Medicina1: TMenuItem;
    mnuRegistrodeOcorrencia: TMenuItem;
    mnuHistoricodeOcorrencias: TMenuItem;
    mnuRelMedicinadoTrabalho: TMenuItem;
    mnuEstatisticadeOcorrencias: TMenuItem;
    mnuConsGeralRH: TMenuItem;
    mnuConsAvaliacoes: TMenuItem;
    mnuConsTreinamento: TMenuItem;
    mnuConsRecrutamento: TMenuItem;
    mnuConsSalariosBeneficios: TMenuItem;
    mnuConsMedicinadoTrabalho: TMenuItem;
    N3: TMenuItem;
    mnuLinhasdeTransporteporPessoa: TMenuItem;
    mnuTransacoesPagamentoeAfins: TMenuItem;
    mnuDiasExtrasporPessoa: TMenuItem;
    mnuLancaRubricasSalariais: TMenuItem;
    mnuLancaRubPorPessoa: TMenuItem;
    mnuLancaRubPorRubrica: TMenuItem;
    mnuHorasExtraseAtrasos: TMenuItem;
    mnuFerias: TMenuItem;
    mnuProgramacaoAntec13: TMenuItem;
    mnuConsPagamentoeAfins: TMenuItem;
    mnuHistoricoRubricas: TMenuItem;
    mnuHistoricodaSituacaoFuncional: TMenuItem;
    mnuEvolucaodaFolha: TMenuItem;
    N4: TMenuItem;
    mnuRelFichaFuncional: TMenuItem;
    mnuRelEtiquetas: TMenuItem;
    mnuRelCadastrodePessoal: TMenuItem;
    procedure mnuCartasComunicados1Click(Sender: TObject);
    procedure mnuPessoal1Click(Sender: TObject);
    procedure mnuBrowsedoCadastro1Click(Sender: TObject);
    procedure mnuEstatisticasdoQuadroClick(Sender: TObject);
    procedure mnuRegistrodeAvaliacoesdeDesempenhoClick(Sender: TObject);
    procedure mnuRegistrodeOutrasAvaliacoesClick(Sender: TObject);
    procedure mnuHistricodeAvaliacoesClick(Sender: TObject);
    procedure mnuEvoluocaoPotencialdoDesempenhoClick(Sender: TObject);
    procedure mnuAvaliacaoPreenchidaClick(Sender: TObject);
    procedure mnuRelatoriodeAvaliacoesClick(Sender: TObject);
    procedure mnuProgramacaodeAvaliacoesClick(Sender: TObject);
    procedure mnuEstatisticadeAvaliacoesClick(Sender: TObject);
    procedure mnuRegistroIndividualdeTreinamentoClick(Sender: TObject);
    procedure mnuRegistroColetivodeTreinamentoClick(Sender: TObject);
    procedure mnuHistoricodeTreinamentoClick(Sender: TObject);
    procedure mnuAtividadenoPeriodoClick(Sender: TObject);
    procedure mnuNecessidadesdeTreinamentoClick(Sender: TObject);
    procedure mnuMapadeTreinamentoClick(Sender: TObject);
    procedure mnuEstatisticadeTreinamentoClick(Sender: TObject);
    procedure mnuCandidatosClick(Sender: TObject);
    procedure mnuRequisicaodePessoalClick(Sender: TObject);
    procedure mnuEliminacaodeRequisicoesClick(Sender: TObject);
    procedure mnuRegistrodeTestesEntrevistasClick(Sender: TObject);
    procedure mnuRegistrodeExperienciasClick(Sender: TObject);
    procedure mnuRegistrodeCursosdeCandidatosClick(Sender: TObject);
    procedure mnuDossieCandidatoClick(Sender: TObject);
    procedure mnuRequisicoesdePessoalClick(Sender: TObject);
    procedure mnuRotatividadeClick(Sender: TObject);
    procedure mnuEstatisticaporFonteClick(Sender: TObject);
    procedure mnuEstatisticadeDemissoesClick(Sender: TObject);
    procedure mnuRegistrodeAlteracaoFuncionalClick(Sender: TObject);
    procedure mnuSolicitdeAlteracaoFuncionalClick(Sender: TObject);
    procedure mnuAnalisedasSolicitacoesdeAlteracaoClick(Sender: TObject);
    procedure mnuSimulacaodeAumentosClick(Sender: TObject);
    procedure mnuHistoricodaEvolucaoFuncionalClick(Sender: TObject);
    procedure mnuOrcamentodoCustodePessoalClick(Sender: TObject);
    procedure mnuInconsistSalarClick(Sender: TObject);
    procedure mnuRegistrodeBeneficiosClick(Sender: TObject);
    procedure mnuHistoricodeBeneficiosClick(Sender: TObject);
    procedure mnuEstatisticadeBeneficiosClick(Sender: TObject);
    procedure mnuRegistrodeOcorrenciaClick(Sender: TObject);
    procedure mnuHistoricodeOcorrenciasClick(Sender: TObject);
    procedure mnuLinhasdeTransporteporPessoaClick(Sender: TObject);
    procedure mnuDiasExtrasporPessoaClick(Sender: TObject);
    procedure mnuLancaRubPorPessoaClick(Sender: TObject);
    procedure mnuLancaRubPorRubricaClick(Sender: TObject);
    procedure mnuHorasExtraseAtrasosClick(Sender: TObject);
    procedure mnuFeriasClick(Sender: TObject);
    procedure mnuProgramacaoAntec13Click(Sender: TObject);
    procedure mnuHistoricoRubricasClick(Sender: TObject);
    procedure mnuHistoricodaSituacaoFuncionalClick(Sender: TObject);
    procedure mnuEvolucaodaFolhaClick(Sender: TObject);
    procedure mnuRelCadastrodePessoalClick(Sender: TObject);
    procedure mnuRelFichaFuncionalClick(Sender: TObject);
    procedure mnuRelEtiquetasClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuEstatisticadeOcorrenciasClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    ChavePessoa, iIdContraCheque, prmUnidNegoc: integer;
    prmCodTipDoc, prmCodCentroRespon: string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSistema, uModulo, uMensErro, fTelaAut, fAguarde, uCtrlPadroes,

  UsoGeralRH, uImprimeRelatorio, uCmCtrlRptModAtn, uCtrlListTerceirosRH, uCtrlUsoGeralRH,
  uCtrlFuncoesRH, dCds,

  dBaseDados, dRelatorioEtiqAltCTPS, 

  fCadCarta, fCadFunc, fCadRegDesemp, fCadRegAval, fCadRegTrein, fCadCand, fCadRequi,
  fCadRegExp, fCadRegTreinCand, fCadRegEvol, fCadRegSolic, fCadRegBen, fCadRegOcorr,
  fCadDiaExtra, fCadFerias, fCadAntec13,

  fHstEvol, fHstAval, fHstTrein, fHstBenef, fHstOcorr, fHstSitFunc, fSelEstBenef, fSelEstOcorr,

  fSelEstat, fSelEstAval, fSelEstTrein, fSelEstRecr, fSelEstDem, fSelSolic, fSelSimul,
  fSelOrcam,

  fElimReq, fPotencAval, fBrwPess, fRegTreinColetivo, fRegLinha, fRegHoras, fEstRubricas,
  fConsHistRubSal, fLancaRub, fLancaRubPorRub,

  fParamFichaFunc, fParamInconsistSal, fParamAvisoFerias, fParamFeriasProgram,
  fParamFichaFinanc, fParamFolhaEmprRub, fParamCadDependente, fParamCadPessoal,
  fParamEtiquetas, fParamRelAvalPre, fParamRelAval, fParamProgAval, fParamAtivTrein,
  fParamNecesPess, fParamMapaTrein, fParamGerencial, fParamDossieCand, fParamRequi,
  fParamRotat, fParamCadRubSal;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Modulo := TModulo.Create;
  //Modulo.InitializeAs(Padroes);

  CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
  CtrlUsoGeralRH.InitializeAs(Padroes);

  FU := TCtrlFuncoesRH.Create;
  FU.InitializeAs(Padroes);

  dmCds := TdmCds.Create(Application);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FU.Free;
  CtrlUsoGeralRH.Free;
  Modulo.Free;
  dmCds.Free;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
  CtrlListTerceirosRH: TCtrlListTerceirosRH;
begin
  inherited;
  IdEmpresa := Sistema.IdEmpresa;
  bFezLogin := Sistema.FezLogin;
  bUsuarioRH := UsuarioRH.Enabled;
  UsuXfilialXcc(IntToStr(Sistema.IdUsuario));

  if (Sistema.FezLogin) then
  begin
    CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);

    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.Initialize(dtmBaseDados.dbBaseDados, true);

    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
    iIDContraCheque := Modulo.IdContraCheque;

    FreeAndNil(CtrlListTerceirosRH);
  end;
  { Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco
  for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true;}
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelatorioEtiqAltCTPS, dtmRelatorioEtiqAltCTPS);
end;

procedure TfrmPrincipal.mnuCartasComunicados1Click(Sender: TObject);
begin
  AbrirForm(frmCadCarta, TfrmCadCarta, false);
end;

procedure TfrmPrincipal.mnuPessoal1Click(Sender: TObject);
begin
  AbrirForm(frmCadFunc, TfrmCadFunc, false);
end;

procedure TfrmPrincipal.mnuBrowsedoCadastro1Click(Sender: TObject);
begin
  AbrirForm(frmBrwPess, TfrmBrwPess, false);
end;

procedure TfrmPrincipal.mnuEstatisticasdoQuadroClick(Sender: TObject);
begin
  AbrirForm(frmSelEstat, TfrmSelEstat, false);
end;

procedure TfrmPrincipal.mnuRegistrodeAvaliacoesdeDesempenhoClick(Sender: TObject);
begin
  AbrirForm(frmCadRegDesemp, TfrmCadRegDesemp, false);
end;

procedure TfrmPrincipal.mnuRegistrodeOutrasAvaliacoesClick(Sender: TObject);
begin
  AbrirForm(frmCadRegAval, TfrmCadRegAval, false);
end;

procedure TfrmPrincipal.mnuHistricodeAvaliacoesClick(Sender: TObject);
begin
  AbrirForm(frmHstAval, TfrmHstAval, false);
end;

procedure TfrmPrincipal.mnuEvoluocaoPotencialdoDesempenhoClick(Sender: TObject);
begin
  AbrirForm(frmPotencAval, TfrmPotencAval, false);
end;

procedure TfrmPrincipal.mnuAvaliacaoPreenchidaClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3719, '', Printed);
end;

procedure TfrmPrincipal.mnuRelatoriodeAvaliacoesClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3720, '', Printed);
end;

procedure TfrmPrincipal.mnuProgramacaodeAvaliacoesClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3721, '', Printed);
end;

procedure TfrmPrincipal.mnuEstatisticadeAvaliacoesClick(Sender: TObject);
begin
  AbrirForm(frmSelEstAval, TfrmSelEstAval, false);
end;

procedure TfrmPrincipal.mnuRegistroIndividualdeTreinamentoClick(Sender: TObject);
begin
  AbrirForm(frmCadRegTrein, TfrmCadRegTrein, false);
end;

procedure TfrmPrincipal.mnuRegistroColetivodeTreinamentoClick(Sender: TObject);
begin
  AbrirForm(frmRegTreinColetivo, TfrmRegTreinColetivo, false);
end;

procedure TfrmPrincipal.mnuHistoricodeTreinamentoClick(Sender: TObject);
begin
  AbrirForm(frmHstTrein, TfrmHstTrein, false);
end;

procedure TfrmPrincipal.mnuAtividadenoPeriodoClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3722, '', Printed);
end;

procedure TfrmPrincipal.mnuNecessidadesdeTreinamentoClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3723, '', Printed);
end;

procedure TfrmPrincipal.mnuMapadeTreinamentoClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3724, '', Printed);
end;

procedure TfrmPrincipal.mnuEstatisticadeTreinamentoClick(Sender: TObject);
begin
  AbrirForm(frmSelEstTrein, TfrmSelEstTrein, false);
end;

procedure TfrmPrincipal.mnuCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmCadCand, TfrmCadCand, false);
end;

procedure TfrmPrincipal.mnuRequisicaodePessoalClick(Sender: TObject);
begin
  AbrirForm(frmCadRequi, TfrmCadRequi, false);
end;

procedure TfrmPrincipal.mnuEliminacaodeRequisicoesClick(Sender: TObject);
begin
  AbrirForm(frmElimReq, TfrmElimReq, false);
end;

procedure TfrmPrincipal.mnuRegistrodeTestesEntrevistasClick(Sender: TObject);
begin
  AbrirForm(frmCadRegAval, TfrmCadRegAval, false);
end;

procedure TfrmPrincipal.mnuRegistrodeExperienciasClick(Sender: TObject);
begin
  AbrirForm(frmCadRegExp, TfrmCadRegExp, false);
end;

procedure TfrmPrincipal.mnuRegistrodeCursosdeCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmCadRegTreinCand, TfrmCadRegTreinCand, false);
end;

procedure TfrmPrincipal.mnuDossieCandidatoClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3996, '', Printed);
end;

procedure TfrmPrincipal.mnuRequisicoesdePessoalClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3998, '', Printed);
end;

procedure TfrmPrincipal.mnuRotatividadeClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 3999, '', Printed);
end;

procedure TfrmPrincipal.mnuEstatisticaporFonteClick(Sender: TObject);
begin
  AbrirForm(frmSelEstRecr, TfrmSelEstRecr, false);
end;

procedure TfrmPrincipal.mnuEstatisticadeDemissoesClick(Sender: TObject);
begin
  AbrirForm(frmSelEstDem, TfrmSelEstDem, false);
end;

procedure TfrmPrincipal.mnuRegistrodeAlteracaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegEvol, TfrmCadRegEvol, false);
end;

procedure TfrmPrincipal.mnuSolicitdeAlteracaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegSolic, TfrmCadRegSolic, false);
end;

procedure TfrmPrincipal.mnuAnalisedasSolicitacoesdeAlteracaoClick(Sender: TObject);
begin
  AbrirForm(frmSelSolic, TfrmSelSolic, false);
end;

procedure TfrmPrincipal.mnuSimulacaodeAumentosClick(Sender: TObject);
begin
  AbrirForm(frmSelSimul, TfrmSelSimul, false);
end;

procedure TfrmPrincipal.mnuHistoricodaEvolucaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmHstEvol, TfrmHstEvol, false);
end;

procedure TfrmPrincipal.mnuOrcamentodoCustodePessoalClick(Sender: TObject);
begin
  AbrirForm(frmSelOrcam, TfrmSelOrcam, false);
end;

procedure TfrmPrincipal.mnuInconsistSalarClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 634, '', Printed);
end;

procedure TfrmPrincipal.mnuRegistrodeBeneficiosClick(Sender: TObject);
begin
  AbrirForm(frmCadRegBen, TfrmCadRegBen, false);
end;

procedure TfrmPrincipal.mnuHistoricodeBeneficiosClick(Sender: TObject);
begin
  AbrirForm(frmHstBenef, TfrmHstBenef, false);
end;

procedure TfrmPrincipal.mnuEstatisticadeBeneficiosClick(Sender: TObject);
begin
  AbrirForm(frmSelEstBenef, TfrmSelEstBenef, false);
end;

procedure TfrmPrincipal.mnuRegistrodeOcorrenciaClick(Sender: TObject);
begin
  AbrirForm(frmCadRegOcorr, TfrmCadRegOcorr, false);
end;

procedure TfrmPrincipal.mnuHistoricodeOcorrenciasClick(Sender: TObject);
begin
  AbrirForm(frmHstOcorr, TfrmHstOcorr, false);
end;

procedure TfrmPrincipal.mnuLinhasdeTransporteporPessoaClick(Sender: TObject);
begin
  AbrirForm(frmRegLinha, TfrmRegLinha, false);
end;

procedure TfrmPrincipal.mnuDiasExtrasporPessoaClick(Sender: TObject);
begin
  AbrirForm(frmCadDiaExtra, TfrmCadDiaExtra, false);
end;

procedure TfrmPrincipal.mnuLancaRubPorPessoaClick(Sender: TObject);
begin
  AbrirForm(frmLancaRub, TfrmLancaRub, false);
end;

procedure TfrmPrincipal.mnuLancaRubPorRubricaClick(Sender: TObject);
begin
  AbrirForm(frmLancaRubPorRub, TfrmLancaRubPorRub, false);
end;

procedure TfrmPrincipal.mnuHorasExtraseAtrasosClick(Sender: TObject);
begin
  AbrirForm(frmRegHoras, TfrmRegHoras, false);
end;

procedure TfrmPrincipal.mnuFeriasClick(Sender: TObject);
begin
  AbrirForm(frmCadFerias, TfrmCadFerias, false);
end;

procedure TfrmPrincipal.mnuProgramacaoAntec13Click(Sender: TObject);
begin
  AbrirForm(frmCadAntec13, TfrmCadAntec13, false);
end;

procedure TfrmPrincipal.mnuHistoricoRubricasClick(Sender: TObject);
begin
  AbrirForm(frmConsHistRubSal, TfrmConsHistRubSal, false);
end;

procedure TfrmPrincipal.mnuHistoricodaSituacaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmHstSitFunc, TfrmHstSitFunc, false);
end;

procedure TfrmPrincipal.mnuEvolucaodaFolhaClick(Sender: TObject);
begin
  AbrirForm(frmEstRubricas, TfrmEstRubricas, false);
end;

procedure TfrmPrincipal.mnuRelCadastrodePessoalClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 578, '', Printed);
end;

procedure TfrmPrincipal.mnuRelFichaFuncionalClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 4000, '', Printed);
end;

procedure TfrmPrincipal.mnuRelEtiquetasClick(Sender: TObject);
var
  Printed: boolean;
begin
  Printed := false;
  AppPadraoPrintReportPadrao(Sender, 574, '', Printed);
end;

procedure TfrmPrincipal.mnuEstatisticadeOcorrenciasClick(Sender: TObject);
begin
  AbrirForm(frmSelEstOcorr, TfrmSelEstOcorr, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModAtn: TCmCtrlRptModAtn;
begin
  inherited;
  CmCtrlRptModAtn := TCmCtrlRptModAtn.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModAtn, DesReport);
    CmCtrlRptModAtn.Free;
  except
    CmCtrlRptModAtn.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModAtn: TCmCtrlRptModAtn;
begin
  inherited;
  RptModAtn := TCmCtrlRptModAtn.Create;
  try
    Printed := ShowReport(IdReports, RptModAtn);
    RptModAtn.Free;
  except
    RptModAtn.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    3380 : frmPreviewReports := TfrmParamCadDependente.Create(Self, tprRelacao);
    578  : frmPreviewReports := TfrmParamEtiquetas.Create(Self);
    574  : frmPreviewReports := TfrmParamCadPessoal.Create(Self);
    138  : frmPreviewReports := TfrmParamAvisoFerias.Create(Self);
    139  : frmPreviewReports := TfrmParamFeriasProgram.Create(Self);
    142  : frmPreviewReports := TfrmParamFichaFinanc.Create(Self);
    143  : frmPreviewReports := TfrmParamFolhaEmprRub.Create(Self);
    3719 : frmPreviewReports := TfrmParamRelAvalPre.Create(Self);
    3720 : frmPreviewReports := TfrmParamRelAval.Create(Self);
    3721 : frmPreviewReports := TfrmParamProgAval.Create(Self);
    3722 : frmPreviewReports := TfrmParamAtivTrein.Create(Self, 'TREINANDO');
    3723 : frmPreviewReports := TfrmParamNecesPess.Create(Self);
    3724 : frmPreviewReports := TfrmParamMapaTrein.Create(Self);
    2439 : frmPreviewReports := TfrmParamGerencial.Create(Self);
    3996 : frmPreviewReports := TfrmParamDossieCand.Create(Self);
    3998 : frmPreviewReports := TfrmParamRequi.Create(Self);
    3999 : frmPreviewReports := TfrmParamRotat.Create(Self);
    4000 : frmPreviewReports := TfrmParamFichaFunc.Create(Self);
    565  : frmPreviewReports := TfrmParamCadRubSal.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

initialization
   Sistema.NomeModulo := 'RH - Módulo de Atendimento';
   Sistema.IdModulo := MODATN;
   Sistema.Versao := '3.01.19';
   Sistema.NomeAplicativo := 'RH - Módulo de Atendimento';
finalization
end.
