unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97, Db, Wwdatsrc, DBTables, wwdblook,
  StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti,
  IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, ImgList,
  fcStatusBar, CMApplicationEvents, SConnect, MConnect, DBClient, uCtrlListTerceirosRH;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuPessoal1: TMenuItem;
    mnuCargos1: TMenuItem;
    mnuEstabelecimentos: TMenuItem;
    mnuSegmentos: TMenuItem;
    mnuMotivos1: TMenuItem;
    mnuGrausdeInstrucao1: TMenuItem;
    mnuSindicatos1: TMenuItem;
    mnuProfissoes1: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuCartasComunicados1: TMenuItem;
    mnuQueries: TMenuItem;
    mnuBrowsedoCadastro1: TMenuItem;
    mnuSituacaoFuncional1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    mnuImportacaodeDados: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuEstatisticasdoQuadro: TMenuItem;
    mnuEstabelecimentosporUsuario: TMenuItem;
    mnuCentrosdeCustoporUsuario: TMenuItem;
    UsuarioRH: TPanel;
    N7: TMenuItem;
    N8: TMenuItem;
    mnuCadHstAltCad: TMenuItem;
    procedure mnuCargos1Click(Sender: TObject);
    procedure mnuMotivos1Click(Sender: TObject);
    procedure mnuGrausdeInstrucao1Click(Sender: TObject);
    procedure mnuProfissoes1Click(Sender: TObject);
    procedure mnuCartasComunicados1Click(Sender: TObject);
    procedure mnuSituacaoFuncional1Click(Sender: TObject);
    procedure mnuPessoal1Click(Sender: TObject);
    procedure mnuSindicatos1Click(Sender: TObject);
    procedure mnuBrowsedoCadastro1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuQueriesClick(Sender: TObject);
    procedure mnuEstabelecimentosClick(Sender: TObject);
    procedure mnuImportacaodeDadosClick(Sender: TObject);
    procedure mnuEstatisticasdoQuadroClick(Sender: TObject);
    procedure mnuSegmentosClick(Sender: TObject);
    procedure mnuEstabelecimentosporUsuarioClick(Sender: TObject);
    procedure mnuCentrosdeCustoporUsuarioClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuCadHstAltCadClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSistema, uMensErro, uCtrlParamIntegra, uCMTypes, uCtrlPadroes, fTelaAut,

  dCds, uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCmCtrlRptModBas,

  fCadMotivo, fCadGrauInstr, fCadProfi, fCadParam, fCadCarta, fCadSit, fCadFunc, fCadSindi,
  fCadFilial, fCadCargo, fCadRamo, fCadHstAlterCad,

  fUsuxEstab, fUsuxCCusto, fBrwPess, fSelEstat, fQryPess, fImportacaoDireta,

  fParamCargos, fParamProfis, fParamEtiquetas, fParamCadPessoal, fParamCracha,
  fParamFichaFunc;

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
  end;

  if (Sistema.FezLogin) and (Sistema.MudouUsuario) then
  begin
    CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCap);
  end;
  // Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco
{  for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true;}
end;

procedure TfrmPrincipal.mnuCargos1Click(Sender: TObject);
begin
  AbrirForm(frmCadCargo, TfrmCadCargo, false);
end;

procedure TfrmPrincipal.mnuMotivos1Click(Sender: TObject);
begin
  AbrirForm(frmCadMotivo, TfrmCadMotivo, false);
end;

procedure TfrmPrincipal.mnuGrausdeInstrucao1Click(Sender: TObject);
begin
  AbrirForm(frmCadGrauInstr, TfrmCadGrauInstr, false);
end;

procedure TfrmPrincipal.mnuProfissoes1Click(Sender: TObject);
begin
  AbrirForm(frmCadProfi, TfrmCadProfi, false);
end;

procedure TfrmPrincipal.mnuCartasComunicados1Click(Sender: TObject);
begin
  AbrirForm(frmCadCarta, TfrmCadCarta, false);
end;

procedure TfrmPrincipal.mnuSituacaoFuncional1Click(Sender: TObject);
begin
  AbrirForm(frmCadSit, TfrmCadSit, false);
end;

procedure TfrmPrincipal.mnuPessoal1Click(Sender: TObject);
begin
  AbrirForm(frmCadFunc, TfrmCadFunc, false);
end;

procedure TfrmPrincipal.mnuCadHstAltCadClick(Sender: TObject);
begin
  AbrirForm(frmCadHstAlterCad, TfrmCadHstAlterCad, false);
end;

procedure TfrmPrincipal.mnuSindicatos1Click(Sender: TObject);
begin
  AbrirForm(frmCadSindi, TfrmCadSindi, false);
end;

procedure TfrmPrincipal.mnuBrowsedoCadastro1Click(Sender: TObject);
begin
  AbrirForm(frmBrwPess, TfrmBrwPess, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TfrmCadParam, false);
end;

procedure TfrmPrincipal.mnuQueriesClick(Sender: TObject);
begin
  AbrirForm(frmQryPess, TfrmQryPess, false);
end;

procedure TfrmPrincipal.mnuEstabelecimentosClick(Sender: TObject);
begin
  AbrirForm(frmCadFilial, TfrmCadFilial, false);
end;

procedure TfrmPrincipal.mnuImportacaodeDadosClick(Sender: TObject);
begin
  AbrirForm(frmImportacaoDireta, TfrmImportacaoDireta, false);
end;

procedure TfrmPrincipal.mnuEstatisticasdoQuadroClick(Sender: TObject);
begin
  AbrirForm(frmSelEstat, TfrmSelEstat, false);
end;

procedure TfrmPrincipal.mnuSegmentosClick(Sender: TObject);
begin
  AbrirForm(frmCadRamo, TfrmCadRamo, false);
end;

procedure TfrmPrincipal.mnuEstabelecimentosporUsuarioClick(Sender: TObject);
begin
  AbrirForm(frmUsuxEstab, TfrmUsuxEstab, false);
end;

procedure TfrmPrincipal.mnuCentrosdeCustoporUsuarioClick(Sender: TObject);
begin
  AbrirForm(frmUsuxCCusto, TfrmUsuxCCusto, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: integer;
  DesReport: TObject; var Config: boolean);
var
  CmCtrlRptModBas: TCmCtrlRptModBas;
begin
  inherited;
  CmCtrlRptModBas := TCmCtrlRptModBas.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModBas, DesReport);
    CmCtrlRptModBas.Free;
  except
    CmCtrlRptModBas.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: integer;
  sFileName: string; var Printed: boolean);
var
  RptModFol: TCmCtrlRptModBas;
begin
  inherited;
  RptModFol := TCmCtrlRptModBas.Create;
  try
    Printed := ShowReport(IdReports, RptModFol);
    RptModFol.Free;
  except
    RptModFol.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    550  : FrmPreviewReports := TfrmParamCargos.Create(Self);
    556  : FrmPreviewReports := TfrmParamProfis.Create(Self);
    579  : FrmPreviewReports := TfrmParamEtiquetas.Create(Self);
    573  : FrmPreviewReports := TfrmParamCadPessoal.Create(Self);
    3193 : FrmPreviewReports := TfrmParamCracha.Create(Self);
    444  : FrmPreviewReports := TfrmParamFichaFunc.Create(Self);
    else   FrmPreviewReports := nil;
  end;
  inherited;
end;

initialization
   Sistema.NomeModulo := 'RH - Módulo Básico';
   Sistema.IdModulo := MODBAS;
   Sistema.Versao := '3.05.08';
   Sistema.NomeAplicativo := 'RH - Módulo Básico';
   Sistema.LoadOldReport := false;
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
