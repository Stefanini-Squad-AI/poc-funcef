unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuCadCargos: TMenuItem;
    mnuCadGruposFuncionais: TMenuItem;
    mnuCadFatoresdeAvaliacao: TMenuItem;
    mnuCadPesos: TMenuItem;
    mnuCadGrausdosCargos: TMenuItem;
    mnuCadClassesSalariais: TMenuItem;
    mnuCadFaixasSalariais: TMenuItem;
    mnuCadEmpresasEntidades: TMenuItem;
    mnuCadPesquisasSalariais: TMenuItem;
    mnuCadFatoresdeAjuste: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuRegistrodeAlteracaoFuncional: TMenuItem;
    mnuSolicitdeAlteracaoFuncional: TMenuItem;
    mnuAnalisedasSolicitacoesdeAlteracao: TMenuItem;
    mnuSimulacaodeAumentos: TMenuItem;
    mnuCorrecaodeFaixasSalariais: TMenuItem;
    mnuDadosPesquisaSalarial: TMenuItem;
    mnuFrequenciaseTendenciasGeral: TMenuItem;
    mnuTendenciasApenasdoMercado: TMenuItem;
    EliminaodePesquisaSalarial1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Sindicatos1: TMenuItem;
    EncargosSociais1: TMenuItem;
    mnuHistoricodaEvolucaoFuncional: TMenuItem;
    mnuOrcamentodoCustodePessoal: TMenuItem;
    mnuTabulacaoPontualdePesquisa: TMenuItem;
    mnuDistrPontosCargos: TMenuItem;
    mnuPontuacaoPorFaixa: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mnuAnaliseMultiDim: TMenuItem;
    mnuRelatorios: TMenuItem;
    UsuarioRH: TPanel;
    N1: TMenuItem;
    mnuCadTabelaHay: TMenuItem;
    N2: TMenuItem;
    N10: TMenuItem;
    mnuCadOrcamQuantPessoal: TMenuItem;
    mnuConsOrcamQuantPessoal: TMenuItem;
    procedure mnuCadCargosClick(Sender: TObject);
    procedure mnuCadGruposFuncionaisClick(Sender: TObject);
    procedure mnuCadFatoresdeAvaliacaoClick(Sender: TObject);
    procedure mnuCadPesosClick(Sender: TObject);
    procedure mnuCadGrausdosCargosClick(Sender: TObject);
    procedure mnuCadFaixasSalariaisClick(Sender: TObject);
    procedure mnuCadClassesSalariaisClick(Sender: TObject);
    procedure mnuCadPesquisasSalariaisClick(Sender: TObject);
    procedure mnuCadFatoresdeAjusteClick(Sender: TObject);
    procedure mnuRegistrodeAlteracaoFuncionalClick(Sender: TObject);
    procedure mnuSolicitdeAlteracaoFuncionalClick(Sender: TObject);
    procedure mnuHistoricodaEvolucaoFuncionalClick(Sender: TObject);
    procedure mnuAnalisedasSolicitacoesdeAlteracaoClick(Sender: TObject);
    procedure mnuSimulacaodeAumentosClick(Sender: TObject);
    procedure mnuCorrecaodeFaixasSalariaisClick(Sender: TObject);
    procedure mnuFrequenciaseTendenciasGeralClick(Sender: TObject);
    procedure mnuTendenciasApenasdoMercadoClick(Sender: TObject);
    procedure EliminaodePesquisaSalarial1Click(Sender: TObject);
    procedure EncargosSociais1Click(Sender: TObject);
    procedure mnuOrcamentodoCustodePessoalClick(Sender: TObject);
    procedure mnuTabulacaoPontualdePesquisaClick(Sender: TObject);
    procedure mnuCadEmpresasEntidadesClick(Sender: TObject);
    procedure mnuAnaliseMultiDimClick(Sender: TObject);
    procedure mnuDistrPontosCargosClick(Sender: TObject);
    procedure mnuPontuacaoPorFaixaClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure Sindicatos1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure mnuCadTabelaHayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuCadOrcamQuantPessoalClick(Sender: TObject);
    procedure mnuConsOrcamQuantPessoalClick(Sender: TObject);
  private
    procedure HabilitarMenusTabHAY;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  fTelaAut, uSistema, uCtrlParamIntegra, uCMTypes, uCtrlPadroes, dCds,

  uModulo, uCmCtrlRptModCes, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCtrlListTerceirosRH,
  uCtrlGlobalRH,

  fCadCargo, fCadGrupoFunc, fCadFator, fCadPeso, fCadGrau, fCadFaixa, fCadClasse, fCadPesqui,
  fCadAjuste, fCadRegEvol, fCadRegSolic, fCadEncar, fCadPesqEmpr, fCadPesqTend, fCadEntid,
  fCadParam, fCadSindi, fCadHay,

  fSelSolic, fSelSimul, fCorrFaixa, fElimPesq, fSelOrcam, fTabPesqui, fCuboOcorr, fDistrPont,
  fDistrFaixa, fHstEvol,

  fParamAlterFuncional, fParamInconsistSal, fParamPesqSal, fCadOrcamPessoal,
  fConsOrcamPessoal;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
  CtrlUsoGeralRH.InitializeAs(Padroes);

  FU := TCtrlFuncoesRH.Create;
  FU.InitializeAs(Padroes);

  dmCds := TdmCds.Create(Application);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlUsoGeralRH.Free;
  FU.Free;
  dmCds.Free;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
  CtrlListTerceirosRH: TCtrlListTerceirosRH;
begin
  inherited;
  if (Sistema.FezLogin) then
  begin
    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);

    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
    CtrlListTerceirosRH.Free;

    HabilitarMenusTabHAY;   
    if (Sistema.MudouUsuario) then
    begin
      CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
    end;
  end;
end;

procedure TfrmPrincipal.mnuCadCargosClick(Sender: TObject);
begin
  AbrirForm(frmCadCargo, TfrmCadCargo, false);
end;

procedure TfrmPrincipal.mnuCadGruposFuncionaisClick(Sender: TObject);
begin
  AbrirForm(frmCadGrupoFunc, TfrmCadGrupoFunc, false);
end;

procedure TfrmPrincipal.mnuCadFatoresdeAvaliacaoClick(Sender: TObject);
begin
  AbrirForm(frmCadFator, TfrmCadFator, false);
end;

procedure TfrmPrincipal.mnuCadPesosClick(Sender: TObject);
begin
  AbrirForm(frmCadPeso, TfrmCadPeso, false);
end;

procedure TfrmPrincipal.mnuCadGrausdosCargosClick(Sender: TObject);
begin
  AbrirForm(frmCadGrau, TfrmCadGrau, false);
end;

procedure TfrmPrincipal.mnuCadFaixasSalariaisClick(Sender: TObject);
begin
  AbrirForm(frmCadFaixa, TfrmCadFaixa, false);
end;

procedure TfrmPrincipal.mnuCadClassesSalariaisClick(Sender: TObject);
begin
  AbrirForm(frmCadClasse, TfrmCadClasse, false);
end;

procedure TfrmPrincipal.mnuCadPesquisasSalariaisClick(Sender: TObject);
begin
  AbrirForm(frmCadPesqui, TfrmCadPesqui, false);
end;

procedure TfrmPrincipal.mnuCadFatoresdeAjusteClick(Sender: TObject);
begin
  AbrirForm(frmCadAjuste, TfrmCadAjuste, false);
end;

procedure TfrmPrincipal.mnuCadOrcamQuantPessoalClick(Sender: TObject);
begin
  AbrirForm(frmCadOrcamPessoal, TfrmCadOrcamPessoal, false);
end;

procedure TfrmPrincipal.mnuRegistrodeAlteracaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegEvol, TfrmCadRegEvol, false);
end;

procedure TfrmPrincipal.mnuSolicitdeAlteracaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegSolic, TfrmCadRegSolic, false);
end;

procedure TfrmPrincipal.mnuHistoricodaEvolucaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmHstEvol, TfrmHstEvol, false);
end;

procedure TfrmPrincipal.mnuAnalisedasSolicitacoesdeAlteracaoClick(Sender: TObject);
begin
  AbrirForm(frmSelSolic, TfrmSelSolic, false);
end;

procedure TfrmPrincipal.mnuSimulacaodeAumentosClick(Sender: TObject);
begin
  AbrirForm(frmSelSimul, TfrmSelSimul, false);
end;

procedure TfrmPrincipal.mnuCorrecaodeFaixasSalariaisClick(Sender: TObject);
begin
  AbrirFormModal(frmCorrFaixa, TfrmCorrFaixa);
end;

procedure TfrmPrincipal.mnuFrequenciaseTendenciasGeralClick(Sender: TObject);
begin
  AbrirForm(frmCadPesqEmpr, TfrmCadPesqEmpr, false);
end;

procedure TfrmPrincipal.mnuTendenciasApenasdoMercadoClick(Sender: TObject);
begin
  AbrirForm(frmCadPesqTend, TfrmCadPesqTend, false);
end;

procedure TfrmPrincipal.EliminaodePesquisaSalarial1Click(Sender: TObject);
begin
  AbrirForm(frmElimPesq, TfrmElimPesq, false);
end;

procedure TfrmPrincipal.EncargosSociais1Click(Sender: TObject);
begin
  AbrirForm(frmCadEncar, TfrmCadEncar, false);
end;

procedure TfrmPrincipal.mnuOrcamentodoCustodePessoalClick(Sender: TObject);
begin
  AbrirForm(frmSelOrcam, TfrmSelOrcam, false);
end;

procedure TfrmPrincipal.mnuTabulacaoPontualdePesquisaClick(Sender: TObject);
begin
  AbrirForm(frmTabPesqui, TfrmTabPesqui, false);
end;

procedure TfrmPrincipal.mnuCadEmpresasEntidadesClick(Sender: TObject);
begin
  AbrirForm(frmCadEntid, TfrmCadEntid, false);
end;
               
procedure TfrmPrincipal.mnuAnaliseMultiDimClick(Sender: TObject);
begin
  AbrirForm(frmCuboOcorr, TfrmCuboOcorr, false);
end;

procedure TfrmPrincipal.mnuDistrPontosCargosClick(Sender: TObject);
begin
  AbrirForm(frmDistrPont, TfrmDistrPont, false);
end;

procedure TfrmPrincipal.mnuPontuacaoPorFaixaClick(Sender: TObject);
begin
  AbrirForm(frmDistrFaixa, TfrmDistrFaixa, false);
end;

procedure TfrmPrincipal.mnuConsOrcamQuantPessoalClick(Sender: TObject);
begin
  AbrirForm(frmConsOrcamPessoal, TfrmConsOrcamPessoal, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TfrmCadParam, false);
end;

procedure TfrmPrincipal.Sindicatos1Click(Sender: TObject);
begin
  AbrirForm(frmCadSindi, TfrmCadSindi, false);
end;

procedure TfrmPrincipal.mnuCadTabelaHayClick(Sender: TObject);
begin
  AbrirForm(frmCadHay, TfrmCadHay, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
  DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModCes: TCmCtrlRptModCes;
begin
  inherited;
  CmCtrlRptModCes := TCmCtrlRptModCes.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModCes, DesReport);
    CmCtrlRptModCes.Free;
  except
    CmCtrlRptModCes.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  FrmPreviewReports := nil;
  case (IdReports) of
    3842 : FrmPreviewReports := TfrmParamAlterFuncional.Create(Self);
    634  : frmPreviewReports := TfrmParamInconsistSal.Create(Self);
    635  : frmPreviewReports := TfrmParamPesqSal.Create(Self);
    else   FrmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModCes: TCmCtrlRptModCes;
begin
  inherited;
  RptModCes := TCmCtrlRptModCes.Create;
  try
    Printed := ShowReport(IdReports, RptModCes);
    RptModCes.Free;
  except
    RptModCes.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.HabilitarMenusTabHAY;
var
  Ctrl: TCtrlGlobalRH;
begin
  Ctrl := TCtrlGlobalRH.Create;
  Ctrl.InitializeAs(Padroes);

  dmCds.Cds.Data := Ctrl.GetParamRH('INDPOLITICA');
  if (dmCds.Cds.FieldByName('INDPOLITICA').asInteger = 1) then // Hay
  begin
    mnuCadFatoresdeAvaliacao.Enabled := false;
    mnuCadPesos.Enabled := false;
    mnuCadGrausdosCargos.Enabled := false;
    mnuCadClassesSalariais.Enabled := false;
    mnuCadFaixasSalariais.Enabled := false;
  end
  else // Classes e Faixas Salariais
    mnuCadTabelaHay.Enabled := false;
end;

initialization
   Sistema.NomeModulo := 'RH - Cargos e Salários';
   Sistema.IdModulo := MODCES;
   Sistema.Versao := '3.04.08';
   Sistema.NomeAplicativo := 'RH - Cargos e Salários';
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
