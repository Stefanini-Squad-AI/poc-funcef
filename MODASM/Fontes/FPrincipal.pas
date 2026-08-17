unit fPrincipal;

// Alterações:
{ --------------------------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/01/2015
 Sol........: 229873/16665
 PPM........: 570016
 Descrição..: Criação do menu Transações -> Condição Diferenciada de Trabalho.
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, fcLabel, IvAMulti,
  IvBinDic, IvMulti, IvEMulti, CorreioCM, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient, CMNetUsers, uResource,
  wwstorep;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuOcorrenciaseExames: TMenuItem;
    mnuCIDCodInternacionaldeDoencas: TMenuItem;
    mnuPeriodicidadedosExames: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuRegistrodeOcorrencia: TMenuItem;
    mnuHistoricodeOcorrencias: TMenuItem;
    mnuRelatoriosFixos: TMenuItem;
    mnuAnaliseMultiDim: TMenuItem;
    mnuEstatisticadeOcorrencias: TMenuItem;
    UsuarioRH: TPanel;
    N4: TMenuItem;
    N1: TMenuItem;
    mnuCadPPRAAcoesRecomendadas: TMenuItem;
    mnuCadPPRAAgentesdeRisco: TMenuItem;
    mnuCadPPRAMeiosPropagContam: TMenuItem;
    mnuCadPPRAClassesdeBens: TMenuItem;
    mnuCadPPRABensEP: TMenuItem;
    mnuCadPPRALocalizacoes: TMenuItem;
    N2: TMenuItem;
    mnuCadFuncoesCIPA: TMenuItem;
    mnuCadCIPA: TMenuItem;
    N3: TMenuItem;
    mnuPPRAAvaliacoes: TMenuItem;
    mnuCondicaoDifTrab: TMenuItem; // Felipe A. Santos SOL 229873/16665 PPM 570016
    N5: TMenuItem; // Felipe A. Santos SOL 229873/16665 PPM 570016
    procedure mnuOcorrenciaseExamesClick(Sender: TObject);
    procedure mnuCIDCodInternacionaldeDoencasClick(Sender: TObject);
    procedure mnuPeriodicidadedosExamesClick(Sender: TObject);
    procedure mnuRegistrodeOcorrenciaClick(Sender: TObject);
    procedure mnuHistoricodeOcorrenciasClick(Sender: TObject);
    procedure mnuEstatisticadeOcorrenciasClick(Sender: TObject);
    procedure mnuAnaliseMultiDimClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure mnuCadPPRAAcoesRecomendadasClick(Sender: TObject);
    procedure mnuCadPPRAAgentesdeRiscoClick(Sender: TObject);
    procedure mnuCadPPRAMeiosPropagContamClick(Sender: TObject);
    procedure mnuCadPPRAClassesdeBensClick(Sender: TObject);
    procedure mnuCadPPRABensEPClick(Sender: TObject);
    procedure mnuCadPPRALocalizacoesClick(Sender: TObject);
    procedure mnuCadFuncoesCIPAClick(Sender: TObject);
    procedure mnuCadCIPAClick(Sender: TObject);
    procedure mnuPPRAAvaliacoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuCondicaoDifTrabClick(Sender: TObject); // Felipe A. Santos SOL 229873/16665 PPM 570016
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSistema, uModulo, fTelaAut, uCtrlPadroes,

  dCds, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCmCtrlRptModAsm,

  fCadOcorr, fCadCID, fCadPeriodo, fCadRegOcorr, fCadPpraAcoes, fCadPpraAgenteRisco,
  fCadPpraMeio, fCadClasseBem, fCadBemEPI, fCadLocalizacao, fCadPpraCipaFuncao,
  fCadPpraCipa, fCadPpraAval,

  fCuboOcorr, fHstOcorr, fSelEstOcorr,

  fParamProgTipo, fParamProgPess, fParamTabCID, fParamOcorrExames, fParamTabPer,
  fParamOcorrPess, fParamPPP,
  fCondicaoDifTrab {// Felipe A. Santos SOL 229873/16665 PPM 570016 };

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
begin
  inherited;
  if (Sistema.FezLogin) then
    CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);

{  Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco)
  for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true;}
end;

procedure TfrmPrincipal.mnuOcorrenciaseExamesClick(Sender: TObject);
begin
  AbrirForm(frmCadOcorr, TfrmCadOcorr, false);
end;

procedure TfrmPrincipal.mnuCIDCodInternacionaldeDoencasClick(Sender: TObject);
begin
  AbrirForm(frmCadCID, TfrmCadCID, false);
end;

procedure TfrmPrincipal.mnuPeriodicidadedosExamesClick(Sender: TObject);
begin
  AbrirForm(frmCadPeriodo, TfrmCadPeriodo, false);
end;

procedure TfrmPrincipal.mnuRegistrodeOcorrenciaClick(Sender: TObject);
begin
  AbrirForm(frmCadRegOcorr, TfrmCadRegOcorr, false);
end;

procedure TfrmPrincipal.mnuHistoricodeOcorrenciasClick(Sender: TObject);
begin
  AbrirForm(frmHstOcorr, TfrmHstOcorr, false);
end;

procedure TfrmPrincipal.mnuEstatisticadeOcorrenciasClick(Sender: TObject);
begin
  AbrirForm(frmSelEstOcorr, TfrmSelEstOcorr, false);
end;

procedure TfrmPrincipal.mnuAnaliseMultiDimClick(Sender: TObject);
begin
  AbrirForm(frmCuboOcorr, TfrmCuboOcorr, false);
end;

procedure TfrmPrincipal.mnuCadPPRAAcoesRecomendadasClick(Sender: TObject);
begin
  AbrirForm(frmCadPpraAcoes, TfrmCadPpraAcoes, false);
end;

procedure TfrmPrincipal.mnuCadPPRAAgentesdeRiscoClick(Sender: TObject);
begin
  AbrirForm(frmCadPpraAgenteRisco, TfrmCadPpraAgenteRisco, false);
end;

procedure TfrmPrincipal.mnuCadPPRAMeiosPropagContamClick(Sender: TObject);
begin
  AbrirForm(frmCadPpraMeio, TfrmCadPpraMeio, false);
end;

procedure TfrmPrincipal.mnuCadPPRAClassesdeBensClick(Sender: TObject);
begin
  AbrirForm(frmCadClasseBem, TfrmCadClasseBem, false);
end;

procedure TfrmPrincipal.mnuCadPPRABensEPClick(Sender: TObject);
begin
  AbrirForm(frmCadBemEPI, TfrmCadBemEPI, false);
end;

procedure TfrmPrincipal.mnuCadPPRALocalizacoesClick(Sender: TObject);
begin
  AbrirForm(frmCadLocalizacao, TfrmCadLocalizacao, false);
end;

procedure TfrmPrincipal.mnuCadFuncoesCIPAClick(Sender: TObject);
begin
  AbrirForm(frmCadPpraCipaFuncao, TfrmCadPpraCipaFuncao, false);
end;

procedure TfrmPrincipal.mnuCadCIPAClick(Sender: TObject);
begin
  AbrirForm(frmCadPpraCipa, TfrmCadPpraCipa, false);
end;

procedure TfrmPrincipal.mnuPPRAAvaliacoesClick(Sender: TObject);
begin
  AbrirForm(frmCadPpraAval, TfrmCadPpraAval, false);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer;
  sFileName: String; var Printed: Boolean);
var
  RptModAsm: TCmCtrlRptModAsm;
begin
  inherited;
  RptModAsm := TCmCtrlRptModAsm.Create;
  try
    Printed := ShowReport(IdReports, RptModAsm);
    RptModAsm.Free;
  except
    RptModAsm.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
  DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModAsm: TCmCtrlRptModAsm;
begin
  inherited;
  CmCtrlRptModAsm := TCmCtrlRptModAsm.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModAsm, DesReport);
    CmCtrlRptModAsm.Free;
  except
    CmCtrlRptModAsm.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer;
  var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    3618 : frmPreviewReports := TfrmParamProgTipo.Create(Self);
    3628 : frmPreviewReports := TfrmParamProgPess.Create(Self);
    20   : frmPreviewReports := TfrmParamTabCID.Create(Self);
    2978 : frmPreviewReports := TfrmParamOcorrExames.Create(Self);
    2980 : frmPreviewReports := TfrmParamTabPer.Create(Self);
    2988 : frmPreviewReports := TfrmParamOcorrPess.Create(Self, tpRelatPorPessoa);
    2990 : frmPreviewReports := TfrmParamOcorrPess.Create(Self, tpRelatPorTipo);
    3960 : frmPreviewReports := TfrmParamPPP.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.mnuCondicaoDifTrabClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCondicaoDifTrab, TfrmCondicaoDifTrab, false); // Felipe A. Santos SOL 229873/16665 PPM 570016 
end;

initialization
   Sistema.NomeModulo := 'RH - Medicina e Segurança do Trabalho';
   Sistema.IdModulo := MODASM;
   Sistema.Versao := '3.04.02';
   Sistema.NomeAplicativo := 'RH - Medicina e Segurança do Trabalho';
   Sistema.LoadOldReport := false;
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
