unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  ImgList, fcStatusBar, SConnect, MConnect, DBClient, uCtrlListTerceirosRH;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTiposdeObjeto: TMenuItem;
    mnuTiposdeSentenca: TMenuItem;
    mnuTiposdeRecurso: TMenuItem;
    mnuTransacoes: TMenuItem;
    ProcessoTrabalhista1: TMenuItem;
    mnuAdvogados: TMenuItem;
    mnuEtapasdoProcesso: TMenuItem;
    mnuHonorarios: TMenuItem;
    mnuFolUpEtapas: TMenuItem;
    mnuConsultaGeraldeProcessos: TMenuItem;
    mnuEstatReclamacoes: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuTiposdeProcesso: TMenuItem;
    mnuVerificaCusto: TMenuItem;
    mnuRateiodeCustos: TMenuItem;
    mnuEmpresasAdq: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuEstatisticadeProcessos: TMenuItem;
    mnuTiposdeAcao: TMenuItem;
    N5: TMenuItem;
    mnuGruposdeObjeto: TMenuItem;
    mnuDistribuicaodeProcessos: TMenuItem;
    mnuVarasdoTrabalho: TMenuItem;
    mnuConsultaProcessoQualquerMateria: TMenuItem;
    UsuarioRH: TPanel;
    mnuParametrizacaoContabil: TMenuItem;
    mnuAlteracaodeResponsavel: TMenuItem;
    mnuAlteracaodeEscritorio: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N1: TMenuItem;
    mnuManutDoc: TMenuItem;
    mnuMotivosdeExclusaodePessoas: TMenuItem;
    procedure mnuTiposdeObjetoClick(Sender: TObject);
    procedure mnuTiposdeSentencaClick(Sender: TObject);
    procedure mnuTiposdeRecursoClick(Sender: TObject);
    procedure ProcessoTrabalhista1Click(Sender: TObject);
    procedure mnuAdvogadosClick(Sender: TObject);
    procedure mnuEtapasdoProcessoClick(Sender: TObject);
    procedure mnuHonorariosClick(Sender: TObject);
    procedure mnuEstatReclamacoesClick(Sender: TObject);
    procedure mnuFolUpEtapasClick(Sender: TObject);
    procedure mnuConsultaGeraldeProcessosClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuTiposdeProcessoClick(Sender: TObject);
    procedure mnuVerificaCustoClick(Sender: TObject);
    procedure mnuRateiodeCustosClick(Sender: TObject);
    procedure mnuEmpresasAdqClick(Sender: TObject);
    procedure mnuEstatisticadeProcessosClick(Sender: TObject);
    procedure mnuTiposdeAcaoClick(Sender: TObject);
    procedure mnuGruposdeObjetoClick(Sender: TObject);
    procedure mnuVarasdoTrabalhoClick(Sender: TObject);
    procedure mnuDistribuicaodeProcessosClick(Sender: TObject);
    procedure mnuConsultaProcessoQualquerMateriaClick(Sender: TObject);
    procedure mnuParametrizacaoContabilClick(Sender: TObject);
    procedure mnuAlteracaodeResponsavelClick(Sender: TObject);
    procedure mnuAlteracaodeEscritorioClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuManutDocClick(Sender: TObject);
    procedure mnuMotivosdeExclusaodePessoasClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    iIDContraCheque, prmUnidNegoc: integer;
    prmCodTipDoc, prmCodCentroRespon: string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uModulo, uSistema, fTelaAut, uIntegraBack, uCtrlParamIntegra, uCMTypes, uCtrlPadroes,

  UsoGeralRH, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCmCtrlRptModCon, dCds,

  fCadTipObjeto, fCadTipSent, fCadProcesso, fCadAdvog, fCadRegEtp, fCadRegHon,
  fCadParam, fCadTipProc, fCadRateio, fCadContJurid, fCadTipRec, fCadMotivoJur, fCadEmprAdq,
  fCadTipAcao, fCadGrpObjeto, fCadVara,

  fSelEstObj, fSelFolUp, fSelConProc, fSelEstProc, fSelEstDistr, 
  
  fAgenda, fAcertaCusto, fConsultaProcesso, fUsuxProcJur, fAdvogxProcJur,
  fLancDocCAPCAR, fParamFichaProc_ModCon, fParamAnalSintProc, fParamProcTrab;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Modulo := TModulo.Create;
  Modulo.InitializeAs(Padroes);

  CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
  CtrlUsoGeralRH.InitializeAs(Padroes);

  FU := TCtrlFuncoesRH.Create;
  FU.InitializeAs(Padroes);

  IntegraBack := TIntegraBack.Create(true, true, true);
  IntegraBack.RecPag := 'P';

  dmCds := TdmCds.Create(Application);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Modulo.Free;
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
  IdEmpresa := Sistema.IdEmpresa;
  bFezLogin := Sistema.FezLogin;
  bUsuarioRH := UsuarioRH.Enabled;
  UsuXfilialXcc(IntToStr(Sistema.IdUsuario));

  if (Sistema.FezLogin) then
  begin
    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);

    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
    CtrlListTerceirosRH.Free;

    IntegraBack.BuscaParamIntegra('PARAMCAP', 'INTEGRACONTAB', 'P');
    
    if (Sistema.MudouUsuario) then
    begin
      CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
    end;

    frmAgenda := TfrmAgenda.Create(Self);
    FreeAndNil(frmAgenda);
  end;

  // Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco
{  for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true;}
end;

procedure TfrmPrincipal.mnuTiposdeObjetoClick(Sender: TObject);
begin
  AbrirForm(frmCadTipObjeto, TfrmCadTipObjeto, false);
end;

procedure TfrmPrincipal.mnuTiposdeSentencaClick(Sender: TObject);
begin
  AbrirForm(frmCadTipSent, TfrmCadTipSent, false);
end;

procedure TfrmPrincipal.mnuTiposdeRecursoClick(Sender: TObject);
begin
  AbrirForm(frmCadTipRec, TfrmCadTipRec, false);
end;

procedure TfrmPrincipal.ProcessoTrabalhista1Click(Sender: TObject);
begin
  AbrirForm(frmCadProcesso, TfrmCadProcesso, false);
end;

procedure TfrmPrincipal.mnuAdvogadosClick(Sender: TObject);
begin
  AbrirForm(frmCadAdvog, TfrmCadAdvog, false);
end;

procedure TfrmPrincipal.mnuEtapasdoProcessoClick(Sender: TObject);
begin
  AbrirForm(frmCadRegEtp, TfrmCadRegEtp, false);
end;

procedure TfrmPrincipal.mnuHonorariosClick(Sender: TObject);
begin
  AbrirForm(frmCadRegHon, TfrmCadRegHon, false);
end;

procedure TfrmPrincipal.mnuEstatReclamacoesClick(Sender: TObject);
begin
  AbrirForm(frmSelEstObj, TfrmSelEstObj, false);
end;

procedure TfrmPrincipal.mnuFolUpEtapasClick(Sender: TObject);
begin
  AbrirForm(frmSelFolUp, TfrmSelFolUp, false);
end;

procedure TfrmPrincipal.mnuConsultaGeraldeProcessosClick(Sender: TObject);
begin
  AbrirForm(frmSelConProc, TfrmSelConProc, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TfrmCadParam, false);
end;

procedure TfrmPrincipal.mnuTiposdeProcessoClick(Sender: TObject);
begin
  AbrirForm(frmCadTipProc, TfrmCadTipProc, false);
end;

procedure TfrmPrincipal.mnuVerificaCustoClick(Sender: TObject);
begin
  AbrirForm(frmAcertaCusto, TfrmAcertaCusto, false);
end;

procedure TfrmPrincipal.mnuRateiodeCustosClick(Sender: TObject);
begin
  AbrirForm(frmCadRateio, TfrmCadRateio, false);
end;

procedure TfrmPrincipal.mnuEmpresasAdqClick(Sender: TObject);
begin
  AbrirForm(frmCadEmprAdq, TfrmCadEmprAdq, false);
end;

procedure TfrmPrincipal.mnuEstatisticadeProcessosClick(Sender: TObject);
begin
  AbrirForm(frmSelEstProc, TfrmSelEstProc, false);
end;

procedure TfrmPrincipal.mnuTiposdeAcaoClick(Sender: TObject);
begin
  AbrirForm(frmCadTipAcao, TfrmCadTipAcao, false);
end;

procedure TfrmPrincipal.mnuGruposdeObjetoClick(Sender: TObject);
begin
  AbrirForm(frmCadGrpObjeto, TfrmCadGrpObjeto, false);
end;

procedure TfrmPrincipal.mnuVarasdoTrabalhoClick(Sender: TObject);
begin
  AbrirForm(frmCadVara, TfrmCadVara, false);
end;

procedure TfrmPrincipal.mnuDistribuicaodeProcessosClick(Sender: TObject);
begin
  AbrirForm(frmSelEstDistr, TfrmSelEstDistr, false);
end;

procedure TfrmPrincipal.mnuConsultaProcessoQualquerMateriaClick(Sender: TObject);
begin
  AbrirForm(frmConsultaProcesso, TfrmConsultaProcesso, false);
end;

procedure TfrmPrincipal.mnuParametrizacaoContabilClick(Sender: TObject);
begin
  AbrirForm(frmCadContJurid, TfrmCadContJurid, false);
end;

procedure TfrmPrincipal.mnuAlteracaodeResponsavelClick(Sender: TObject);
begin
  AbrirForm(frmUsuxProcJur, TfrmUsuxProcJur, false);
end;

procedure TfrmPrincipal.mnuAlteracaodeEscritorioClick(Sender: TObject);
begin
  AbrirForm(frmAdvogxProcJur, TfrmAdvogxProcJur, false);
end;

procedure TfrmPrincipal.mnuManutDocClick(Sender: TObject);
begin
  TfrmLancDocCAPCAR.AbrirForm;
end;

procedure TfrmPrincipal.mnuMotivosdeExclusaodePessoasClick(Sender: TObject);
begin
  AbrirForm(frmCadMotivoJur, TfrmCadMotivoJur, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModCon: TCmCtrlRptModCon;
begin
  inherited;
  CmCtrlRptModCon := TCmCtrlRptModCon.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModCon, DesReport);
    CmCtrlRptModCon.Free;
  except
    CmCtrlRptModCon.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    4041 : frmPreviewReports := TfrmParamFichaProc_ModCon.Create(Self);
    3265 : frmPreviewReports := TfrmParamAnalSintProc.Create(Self);
    3237 : frmPreviewReports := TfrmParamProcTrab.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModCon: TCmCtrlRptModCon;
begin
  inherited;
  RptModCon := TCmCtrlRptModCon.Create;
  try
    Printed := ShowReport(IdReports, RptModCon);
    RptModCon.Free;
  except
    RptModCon.Free;
    raise;
  end;
end;

initialization
   Sistema.NomeModulo := 'RH - Contencioso Trabalhista';
   Sistema.IdModulo := MODCON;
   Sistema.Versao := '3.15.03';
   Sistema.NomeAplicativo := 'RH - Contencioso Trabalhista';
finalization
end.
