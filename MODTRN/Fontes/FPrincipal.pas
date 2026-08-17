{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 43337
 Data........: 10/03/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade fCadCertificadoMT.pas
--------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: .dfm (alteracao menus), fCadRegTreinColetivo, fCadRegIncentivo
--------------------------------------------------------------------------------
Rotina......: MnuSiglasClick
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Inserir item 'Siglas', para cadastro de Siglas.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 134702
Nº KINTANA..: 796136
Data........: 05/08/2010
Responsável.: Thaise Amaral Martins
Descrição...: No Contrutor do TfrmParamAtivTrein colocar mais um parâmetro para
              que ele saiba de qual relatório se trata.
--------------------------------------------------------------------------------}

unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient, uResource, CMNetUsers,
  wwstorep;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTransacoes: TMenuItem;
    mnuCursos1: TMenuItem;
    mnuPacotesdeCursos: TMenuItem;
    mnuGruposdeTreinamento1: TMenuItem;
    mnuCursosRequeridos: TMenuItem;
    mnuTiposdeCursos: TMenuItem;
    mnuCargos1: TMenuItem;
    mnuEmpresasEntidades: TMenuItem;
    mnuRegistrodeTreinamento: TMenuItem;
    mnuHistTreinamento: TMenuItem;
    N3: TMenuItem;
    mnuEstatisticaTrein: TMenuItem;
    mnuRelatorios: TMenuItem;
    N4: TMenuItem;
    mnuOrcamento: TMenuItem;
    UsuarioRH: TPanel;
    mnuRegistroColetivodeTreinamento: TMenuItem;
    N6: TMenuItem;
    mnuFatoresdeAvaliacaodosCursos: TMenuItem;
    mnuListadePresenca: TMenuItem;
    mnuRegAvalParticipantes: TMenuItem;
    mnuInstrutoresInternos: TMenuItem;
    mnuGraficoAvaliacoesdosCursos: TMenuItem;
    N1: TMenuItem;
    mnuCadLocalizacoes: TMenuItem;
    mnuConsultaFatoresAvalDesemp: TMenuItem;
    mnuCadEscalasdeConceitos: TMenuItem;
    MnuSiglas: TMenuItem;
    mnuAssinatura: TMenuItem;
    mnuCadCertificado: TMenuItem;
    N2: TMenuItem;
    mnuRegCertificado: TMenuItem;
    procedure mnuCursos1Click(Sender: TObject);
    procedure mnuPacotesdeCursosClick(Sender: TObject);
    procedure mnuGruposdeTreinamento1Click(Sender: TObject);
    procedure mnuTiposdeCursosClick(Sender: TObject);
    procedure mnuCargos1Click(Sender: TObject);
    procedure mnuCursosRequeridosClick(Sender: TObject);
    procedure mnuRegistrodeTreinamentoClick(Sender: TObject);
    procedure mnuEmpresasEntidadesClick(Sender: TObject);
    procedure mnuHistTreinamentoClick(Sender: TObject);
    procedure mnuEstatisticaTreinClick(Sender: TObject);
    procedure mnuOrcamentoClick(Sender: TObject);
    procedure mnuRegistroColetivodeTreinamentoClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuFatoresdeAvaliacaodosCursosClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(Sender: TObject; IdReports: Integer;
      var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject;
      var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer;
      sFileName: String; var Printed: Boolean);
    procedure mnuListadePresencaClick(Sender: TObject);
    procedure mnuRegAvalParticipantesClick(Sender: TObject);
    procedure mnuInstrutoresInternosClick(Sender: TObject);
    procedure mnuGraficoAvaliacoesdosCursosClick(Sender: TObject);
    procedure mnuCadLocalizacoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuConsultaFatoresAvalDesempClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuCadEscalasdeConceitosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnuSiglasClick(Sender: TObject);
    procedure mnuAssinaturaClick(Sender: TObject);
    procedure mnuCadCertificadoClick(Sender: TObject);
    procedure mnuRegCertificadoClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSistema, uModulo, uCMTypes, fTelaAut, uCtrlParamIntegra, uCtrlPadroes,

  UsoGeralRH, uCmCtrlRptModTrn, uCtrlListTerceirosRH, uCtrlRegTrein, uCtrlUsoGeralRH,
  uCtrlFuncoesRH, dCds,

  {fCadCurso,} fCadPacote, fCadGrpTr, {fCadRegTrein,} fCadEntid, fCadTipCurso, fCadCargo,      // Edilaine - SOL 137268-7062 / KTN 1497173
  fCadRequer, fCadOrcamTrein, fCadFator, fCadInstrutorInterno,
  fCadCursoMT, fCadRegTreinColetivo, fCadRegIncentivo, // Edilaine - SOL 137268-7062 / KTN 1497173
  fHstTrein, fSelEstTrein, {fRegTreinColetivo,} fAgendaTrein, fRegPresenca, fRegAvalAlunos,  // Edilaine - SOL 137268-7062 / KTN 1497173

  fParamNecesCurso, fParamNecesPess, fParamAtivTrein, fParamMapaTrein, fParamListaEntid,
  fParamTabCursos, fParamEstAvalTrein, fCadLocalizacao, fParamMapaResumoTrein, fCadEscala,
  fParamMapaResumoTrein2, fCadFatorDesemp, fCadParam, FCadSiglas, FAssinatura,
  fCadCertificadoMT, fRegCertificadoMT;

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
  CtrlRegTrein: TCtrlRegTrein;
  CtrlListTerceirosRH: TCtrlListTerceirosRH;
//  c: integer;
begin
  inherited;
  bFezLogin := Sistema.FezLogin;
  IdEmpresa := Sistema.IdEmpresa;
  bUsuarioRH := UsuarioRH.Enabled;
  UsuXfilialXcc(IntToStr(Sistema.IdUsuario));

  if (Sistema.FezLogin) then
  begin
    CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);

    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);
    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;

    FreeAndNil(CtrlListTerceirosRH);

    if (Sistema.MudouUsuario) then
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCap);

    // Agenda de Cursos Iniciando nos Prox. 7 Dias
    if (CtrlUsoGeralRH.UsuXCCusto = '') and (CtrlUsoGeralRH.UsuXFilial = '') and
       (CtrlUsoGeralRH.IdUsuarioGeral = '') then
    begin
      CtrlRegTrein := TCtrlRegTrein.Create(false, false, false, false, 0, 0, '',
        CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
      CtrlRegTrein.InitializeAs(Padroes);
      dmCds.Cds.Data := CtrlRegTrein.ListAgendaTrein;
      CtrlRegTrein.Free;

      if not(dmCds.Cds.IsEmpty) then
        with TfrmAgendaTrein.Create(Application) do
        begin
          dsHstTrn.DataSet := dmCds.Cds;
          ShowModal;
          Free;
        end;
    end;
  end;
  //{ Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco
  {for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true;//}
end;

procedure TfrmPrincipal.mnuCursos1Click(Sender: TObject);
begin
  //AbrirForm(frmCadCurso, TfrmCadCurso, false);
  AbrirForm(frmCadCursoMT, TfrmCadCursoMT, false);  // Edilaine - SOL 137268-7062 / KTN 1497173
end;

procedure TfrmPrincipal.mnuPacotesdeCursosClick(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadPacote, TfrmCadPacote, false);
end;

procedure TfrmPrincipal.mnuGruposdeTreinamento1Click(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadGrpTr, TfrmCadGrpTr, false);
end;

procedure TfrmPrincipal.mnuTiposdeCursosClick(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadTipCurso, TfrmCadTipCurso, false);
end;

procedure TfrmPrincipal.mnuCargos1Click(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadCargo, TfrmCadCargo, false);
end;

procedure TfrmPrincipal.mnuCursosRequeridosClick(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadRequer, TfrmCadRequer, false);
end;

procedure TfrmPrincipal.mnuRegistrodeTreinamentoClick(Sender: TObject);
begin
  //AbrirForm(frmCadRegTrein, TfrmCadRegTrein, false);   // Edilaine - SOL 137268-7062 / KTN 1497173
  AbrirForm(frmCadRegIncentivo, TfrmCadRegIncentivo, false);
end;

procedure TfrmPrincipal.mnuEmpresasEntidadesClick(Sender: TObject);
begin
  AbrirForm(frmCadEntid, TfrmCadEntid, false);
end;

procedure TfrmPrincipal.mnuHistTreinamentoClick(Sender: TObject);
begin
  AbrirForm(frmHstTrein, TfrmHstTrein, false);
end;

procedure TfrmPrincipal.mnuEstatisticaTreinClick(Sender: TObject);
begin
  AbrirForm(frmSelEstTrein, TfrmSelEstTrein, false);
end;

procedure TfrmPrincipal.mnuOrcamentoClick(Sender: TObject);
begin
  AbrirForm(frmCadOrcamTrein, TfrmCadOrcamTrein, false);
end;

procedure TfrmPrincipal.mnuRegistroColetivodeTreinamentoClick(Sender: TObject);
begin
  //AbrirForm(frmRegTreinColetivo, TfrmRegTreinColetivo, false);
  AbrirForm( frmCadRegTreinColetivo, TfrmCadRegTreinColetivo, false );  // Edilaine - SOL 137268-7062 / KTN 1497173
end;

procedure TfrmPrincipal.mnuFatoresdeAvaliacaodosCursosClick(Sender: TObject);
begin
  AbrirForm(frmCadFator, TfrmCadFator, false);
end;

procedure TfrmPrincipal.mnuListadePresencaClick(Sender: TObject);
begin
  AbrirForm(frmRegPresenca, TfrmRegPresenca, false);
end;

procedure TfrmPrincipal.mnuRegAvalParticipantesClick(Sender: TObject);
begin
  AbrirForm(frmRegAvalAlunos, TfrmRegAvalAlunos, false);
end;

procedure TfrmPrincipal.mnuInstrutoresInternosClick(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadInstrutorInterno, TfrmCadInstrutorInterno, false);
end;

procedure TfrmPrincipal.mnuGraficoAvaliacoesdosCursosClick(Sender: TObject);
begin
  AbrirForm(frmParamEstAvalTrein, TfrmParamEstAvalTrein, false);
end;

procedure TfrmPrincipal.mnuCadLocalizacoesClick(Sender: TObject);
begin
  // Edilaine - SOL 137268-7062 / KTN 1497173
  //AbrirForm(frmCadLocalizacao, TfrmCadLocalizacao, false);
end;

procedure TfrmPrincipal.mnuConsultaFatoresAvalDesempClick(Sender: TObject);
begin
  AbrirForm(frmCadFatorDesemp, TfrmCadFatorDesemp, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TfrmCadParam, false);
end;

procedure TfrmPrincipal.mnuCadEscalasdeConceitosClick(Sender: TObject);
begin
  AbrirForm(frmCadEscala, TfrmCadEscala, false);
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    3654 : frmPreviewReports := TfrmParamNecesCurso.Create(Self);
    3655 : frmPreviewReports := TfrmParamNecesPess.Create(Self);
    3669 : frmPreviewReports := TfrmParamAtivTrein.Create(Self, 'TREINANDO', '3669');
    3670 : frmPreviewReports := TfrmParamAtivTrein.Create(Self, 'CURSO', '3670');
    3671 : frmPreviewReports := TfrmParamAtivTrein.Create(Self, 'ENTIDADE', '3671');
    3676 : frmPreviewReports := TfrmParamMapaTrein.Create(Self);
    3731 : frmPreviewReports := TfrmParamListaEntid.Create(Self);
    2984 : frmPreviewReports := TfrmParamTabCursos.Create(Self);
    4002 : frmPreviewReports := TfrmParamMapaResumoTrein.Create(Self);
    4039 : frmPreviewReports := TfrmParamMapaResumoTrein2.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModTrn: TCmCtrlRptModTrn;
begin
  inherited;
  CmCtrlRptModTrn := TCmCtrlRptModTrn.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModTrn, DesReport);
    CmCtrlRptModTrn.Free;
  except
    CmCtrlRptModTrn.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModTrn: TCmCtrlRptModTrn;
begin
  inherited;
  RptModTrn := TCmCtrlRptModTrn.Create;
  try
    Printed := ShowReport(IdReports, RptModTrn);
    RptModTrn.Free;
  except
    RptModTrn.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.MnuSiglasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadSiglas, TFrmCadSiglas, false);
end;

procedure TfrmPrincipal.mnuAssinaturaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssinatura, TFrmAssinatura, false);
end;

procedure TfrmPrincipal.mnuCadCertificadoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCertificado, TFrmCadCertificado, false);
end;

procedure TfrmPrincipal.mnuRegCertificadoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRegCertificado, TFrmRegCertificado, false);
end;

initialization
   Sistema.NomeModulo := 'RH - Treinamento';
   Sistema.IdModulo := MODTRN;
   Sistema.Versao := '3.08.09';
   Sistema.NomeAplicativo := 'RH - Treinamento';
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
