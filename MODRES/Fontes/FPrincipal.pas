//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação das funcionalidades Cadastros -> Agente de integração
//                e Instituição de Ensino
//Responsável: Felipe A. Santos
//Descrição: criação das funcionalidades Cadastros -> Agente de integração
//           e Instituição de Ensino.
//******************************************************************************

unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  ImgList, fcStatusBar, SConnect, MConnect, DBClient, CMNetUsers, uResource;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuCadastrodeCandidatos: TMenuItem;
    mnuFontesdeRecrutamento: TMenuItem;
    mnuTiposdeExperiencia: TMenuItem;
    mnuExperienciasRequeridasporCargo: TMenuItem;
    mnuAvaliaciesRequeridasporCargo: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuRequisicaodePessoal: TMenuItem;
    mnuRegistrodeTestesEntrevistas: TMenuItem;
    mnuRegistrodeExperiencias: TMenuItem;
    mnuEliminacaodeCandidatos: TMenuItem;
    mnuEliminacaodeRequisicoes: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    mnuTiposdeTeste: TMenuItem;
    mnuHistoricodeTestes: TMenuItem;
    N3: TMenuItem;
    mnuSelecaodeCandidatos: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    mnuEstatisticaporFonte: TMenuItem;
    mnuEstatisticadeDemissoes: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuRegistrodeCursosdeCandidatos: TMenuItem;
    UsuarioRH: TPanel;
    mnuImportaTXTCandidatos: TMenuItem;
    N1: TMenuItem;
    mnuInsEnsino: TMenuItem;
    mnuAgenteIntegracao: TMenuItem;
    procedure mnuFontesdeRecrutamentoClick(Sender: TObject);
    procedure mnuTiposdeExperienciaClick(Sender: TObject);
    procedure mnuExperienciasRequeridasporCargoClick(Sender: TObject);
    procedure mnuAvaliaciesRequeridasporCargoClick(Sender: TObject);
    procedure mnuCadastrodeCandidatosClick(Sender: TObject);
    procedure mnuRequisicaodePessoalClick(Sender: TObject);
    procedure mnuRegistrodeTestesEntrevistasClick(Sender: TObject);
    procedure mnuRegistrodeExperienciasClick(Sender: TObject);
    procedure mnuEliminacaodeCandidatosClick(Sender: TObject);
    procedure mnuEliminacaodeRequisicoesClick(Sender: TObject);
    procedure mnuHistoricodeTestesClick(Sender: TObject);
    procedure mnuTiposdeTesteClick(Sender: TObject);
    procedure mnuSelecaodeCandidatosClick(Sender: TObject);
    procedure mnuEstatisticadeDemissoesClick(Sender: TObject);
    procedure mnuEstatisticaporFonteClick(Sender: TObject);
    procedure mnuRegistrodeCursosdeCandidatosClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuImportaTXTCandidatosClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuInsEnsinoClick(Sender: TObject);
    procedure mnuAgenteIntegracaoClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSistema, fTelaAut, uCtrlPadroes,

  uModulo, uCmCtrlRptModRes, uCtrlListTerceirosRH, uCtrlUsoGeralRH, uCtrlFuncoesRH, dCds,

  fCadFonte, fCadExper, fCadExpReq, fCadAvalReq, fCadCand, fCadRequi, fCadRegAval,
  fCadRegExp, fCadTipAval, fCadRegTreinCand,

  fImportaCand, fElimCand, fElimReq, fHstAval, fPreSelec, fSelEstRecr, fSelEstDem,

  fParamRotat, fParamRequi, fParamDossieCand, fParamContrat,
  fCadInstituicaoEnsino, fCadAgenteIntegracao // Felipe A. Santos SOL 229871.16137
  ;

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
    CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);
    
    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);

    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;

    FreeAndNil(CtrlListTerceirosRH);
  end;
end;

procedure TfrmPrincipal.mnuFontesdeRecrutamentoClick(Sender: TObject);
begin
  AbrirForm(frmCadFonte, TfrmCadFonte, false);
end;

procedure TfrmPrincipal.mnuTiposdeExperienciaClick(Sender: TObject);
begin
  AbrirForm(frmCadExper, TfrmCadExper, false);
end;

procedure TfrmPrincipal.mnuExperienciasRequeridasporCargoClick(Sender: TObject);
begin
  AbrirForm(frmCadExpReq, TfrmCadExpReq, false);
end;

procedure TfrmPrincipal.mnuAvaliaciesRequeridasporCargoClick(Sender: TObject);
begin
  AbrirForm(frmCadAvalReq, TfrmCadAvalReq, false);
end;

procedure TfrmPrincipal.mnuCadastrodeCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmCadCand, TfrmCadCand, false);
end;

procedure TfrmPrincipal.mnuRequisicaodePessoalClick(Sender: TObject);
begin
  AbrirForm(frmCadRequi, TfrmCadRequi, false);
end;

procedure TfrmPrincipal.mnuRegistrodeTestesEntrevistasClick(Sender: TObject);
begin
  AbrirForm(frmCadRegAval, TfrmCadRegAval, false);
end;

procedure TfrmPrincipal.mnuRegistrodeExperienciasClick(Sender: TObject);
begin
  AbrirForm(frmCadRegExp, TfrmCadRegExp, false);
end;

procedure TfrmPrincipal.mnuEliminacaodeCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmElimCand, TfrmElimCand, false);
end;

procedure TfrmPrincipal.mnuEliminacaodeRequisicoesClick(Sender: TObject);
begin
  AbrirForm(frmElimReq, TfrmElimReq, false);
end;

procedure TfrmPrincipal.mnuHistoricodeTestesClick(Sender: TObject);
begin
  AbrirForm(frmHstAval, TfrmHstAval, false);
end;

procedure TfrmPrincipal.mnuTiposdeTesteClick(Sender: TObject);
begin
  AbrirForm(frmCadTipAval, TfrmCadTipAval, false);
end;

procedure TfrmPrincipal.mnuSelecaodeCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmPreSelec, TfrmPreSelec, false);
end;

procedure TfrmPrincipal.mnuEstatisticadeDemissoesClick(Sender: TObject);
begin
  AbrirForm(frmSelEstDem, TfrmSelEstDem, false);
end;

procedure TfrmPrincipal.mnuEstatisticaporFonteClick(Sender: TObject);
begin
  AbrirForm(frmSelEstRecr, TfrmSelEstRecr, false);
end;

procedure TfrmPrincipal.mnuRegistrodeCursosdeCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmCadRegTreinCand, TfrmCadRegTreinCand, false);
end;

procedure TfrmPrincipal.mnuImportaTXTCandidatosClick(Sender: TObject);
begin
  AbrirForm(frmImportaCand, TfrmImportaCand, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
  DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModRes: TCmCtrlRptModRes;
begin
  inherited;
  CmCtrlRptModRes := TCmCtrlRptModRes.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModRes, DesReport);
    CmCtrlRptModRes.Free;
  except
    CmCtrlRptModRes.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer;
  sFileName: String; var Printed: Boolean);
var
  RptModRes: TCmCtrlRptModRes;
begin
  inherited;
  RptModRes := TCmCtrlRptModRes.Create;
  try
    Printed := ShowReport(IdReports, RptModRes);
    RptModRes.Free;
  except
    RptModRes.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    3709 : frmPreviewReports := TfrmParamRequi.Create(Self);
    3710 : frmPreviewReports := TfrmParamRotat.Create(Self);
    2982 : frmPreviewReports := TfrmParamDossieCand.Create(Self);
    4008 : frmPreviewReports := TfrmParamContrat.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.mnuInsEnsinoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadInstituicaoEnsino, TfrmCadInstituicaoEnsino, false); // Felipe A. Santos SOL 229871.16137
end;

procedure TfrmPrincipal.mnuAgenteIntegracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAgenteIntregracao, TfrmCadAgenteIntregracao, false); // Felipe A. Santos SOL 229871.16137
end;

initialization
   Sistema.NomeModulo := 'RH - Recrutamento e Seleção';
   Sistema.IdModulo := MODRES;
   Sistema.Versao := '3.05.06';
   Sistema.NomeAplicativo := 'RH - Recrutamento e Seleção';
   Sistema.LoadOldReport := false;
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
