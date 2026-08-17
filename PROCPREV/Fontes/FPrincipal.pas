unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  ImgList, fcStatusBar, SConnect, MConnect, DBClient, uCtrlListTerceirosRH,
  CMNetUsers, uResource;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTiposdeObjeto: TMenuItem;
    mnuTiposdeSentenca: TMenuItem;
    mnuTiposdeRecurso: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuProcessoPrevidenciario: TMenuItem;
    mnuTRTs: TMenuItem;
    mnuAdvogados: TMenuItem;
    mnuEtapasdoProcesso: TMenuItem;
    mnuHonorarios: TMenuItem;
    mnuFolUpEtapas: TMenuItem;
    mnuConsultaGeraldeProcessos: TMenuItem;
    mnuEstatReclamacoes: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuTiposdeProcesso: TMenuItem;
    mnuVerificaCusto: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuEstatisticadeProcessos: TMenuItem;
    mnuTiposdeAcao: TMenuItem;
    N5: TMenuItem;
    mnuGruposdeObjeto: TMenuItem;
    ConsultaProcessoQualquerMateria: TMenuItem;
    mnuParametrizaoContabil: TMenuItem;
    mnuAlteracaodoResponsavel: TMenuItem;
    mnuAlteracaodoEscritorio: TMenuItem;
    N8: TMenuItem;
    N1: TMenuItem;
    mnuManutDoc: TMenuItem;
    mnuMotivosdeExclusaodePessoas: TMenuItem;
    N2: TMenuItem;
    mnuEmpresasRecl: TMenuItem;
    procedure mnuTiposdeObjetoClick(Sender: TObject);
    procedure mnuTiposdeSentencaClick(Sender: TObject);
    procedure mnuTiposdeRecursoClick(Sender: TObject);
    procedure mnuProcessoPrevidenciarioClick(Sender: TObject);
    procedure mnuTRTsClick(Sender: TObject);
    procedure mnuAdvogadosClick(Sender: TObject);
    procedure mnuEtapasdoProcessoClick(Sender: TObject);
    procedure mnuHonorariosClick(Sender: TObject);
    procedure mnuEstatReclamacoesClick(Sender: TObject);
    procedure mnuFolUpEtapasClick(Sender: TObject);
    procedure mnuConsultaGeraldeProcessosClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuTiposdeProcessoClick(Sender: TObject);
    procedure mnuVerificaCustoClick(Sender: TObject);
    procedure mnuEstatisticadeProcessosClick(Sender: TObject);
    procedure mnuTiposdeAcaoClick(Sender: TObject);
    procedure mnuGruposdeObjetoClick(Sender: TObject);
    procedure ConsultaProcessoQualquerMateriaClick(Sender: TObject);
    procedure mnuParametrizaoContabilClick(Sender: TObject);
    procedure mnuAlteracaodoResponsavelClick(Sender: TObject);
    procedure mnuAlteracaodoEscritorioClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuManutDocClick(Sender: TObject);
    procedure mnuMotivosdeExclusaodePessoasClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure mnuEmpresasReclClick(Sender: TObject);
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
  uSistema, uCMTypes, uIntegraBack, uCtrlParamIntegra, uCtrlPadroes, fTelaAut,

  uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCmCtrlRptProcPrev, dCds,

  fCadParam, fCadTipObjeto, fCadTipSent, fCadTipRec, fCadProcesso,
  fCadVara, fCadAdvog, fCadRegEtp, fCadRegHon, fCadTipProc, fAcertaCusto, fCadTipAcao,
  fCadGrpObjeto, fCadContJurid, fCadMotivoJur, fCadEmprAdq,

  fSelEstObj, fSelFolUp, fSelConProc, fSelEstProc, 

  fParamFichaProc_ProcPrev, fParamProcPrev,

  fAgenda, fAdvogxProcJur,
  //Renan Cristiano Sol Nº 141647 Kintana 905096
  //fLancDocCAPCAR,
  fUsuxProcJur, fConsultaProcesso,
  fParamAnalSintProc;

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

  dmCds := TdmCds.Create(Application);

  IntegraBack := TIntegraBack.Create(true, true, true);
  IntegraBack.RecPag := 'P';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Modulo.Free;
//  IntegraBack.Free;
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

//    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
    CtrlListTerceirosRH.Free;

    CtrlUsoGeralRH.GetParametros(true, Sistema.IdEmpresa, Sistema.IdUsuario);

    if (Sistema.MudouUsuario) then
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCap);

    frmAgenda := TfrmAgenda.Create(Self);
    FreeAndNil(frmAgenda);
  end;
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

procedure TfrmPrincipal.mnuProcessoPrevidenciarioClick(Sender: TObject);
begin
  AbrirForm(frmCadProcesso, TfrmCadProcesso, false);
end;

procedure TfrmPrincipal.mnuTRTsClick(Sender: TObject);
begin
  AbrirForm(frmCadVara, TfrmCadVara, false);
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

procedure TfrmPrincipal.ConsultaProcessoQualquerMateriaClick(Sender: TObject);
begin
  AbrirForm(frmConsultaProcesso, TfrmConsultaProcesso, false);
end;

procedure TfrmPrincipal.mnuParametrizaoContabilClick(Sender: TObject);
begin
  AbrirForm(frmCadContJurid, TfrmCadContJurid, false);
end;

procedure TfrmPrincipal.mnuAlteracaodoResponsavelClick(Sender: TObject);
begin
  AbrirForm(frmUsuxProcJur, TfrmUsuxProcJur, false);
end;

procedure TfrmPrincipal.mnuAlteracaodoEscritorioClick(Sender: TObject);
begin
  AbrirForm(frmAdvogxProcJur, TfrmAdvogxProcJur, false);
end;

procedure TfrmPrincipal.mnuManutDocClick(Sender: TObject);
begin
  //Renan Cristiano Sol Nº 141647 Kintana 905096
//  TfrmLancDocCAPCAR.AbrirForm;
end;

procedure TfrmPrincipal.mnuMotivosdeExclusaodePessoasClick(Sender: TObject);
begin
  AbrirForm(frmCadMotivoJur, TfrmCadMotivoJur, false);
end;

procedure TfrmPrincipal.mnuEmpresasReclClick(Sender: TObject);
begin
  AbrirForm(frmCadEmprAdq, TfrmCadEmprAdq, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptProcPrev: TCmCtrlRptProcPrev;
begin
  inherited;
  CmCtrlRptProcPrev := TCmCtrlRptProcPrev.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptProcPrev, DesReport);
    CmCtrlRptProcPrev.Free;
  except
    CmCtrlRptProcPrev.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    4052 : frmPreviewReports := TfrmParamFichaProc_ProcPrev.Create(Self);
    3196 : frmPreviewReports := TfrmParamProcPrev.Create(Self);
    4065 : frmPreviewReports := TfrmParamAnalSintProc.Create(Self);    
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptProcPrev: TCmCtrlRptProcPrev;
begin
  inherited;
  RptProcPrev := TCmCtrlRptProcPrev.Create;
  try
    Printed := ShowReport(IdReports, RptProcPrev);
    RptProcPrev.Free;
  except
    RptProcPrev.Free;
    raise;
  end;
end;

initialization
   Sistema.NomeModulo := 'Contencioso Previdenciário';
   Sistema.IdModulo := PROCPREV;
   Sistema.Versao := '3.21.05';
   Sistema.NomeAplicativo := 'Contencioso Previdenciário';
finalization
end.
