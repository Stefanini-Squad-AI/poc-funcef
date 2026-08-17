unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, ImgList, IvAMulti,
  IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTiposdeBeneficio: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuRegistrodeBeneficios: TMenuItem;
    mnuHistoricodeBeneficios: TMenuItem;
    mnuRubricasSalariais: TMenuItem;
    mnuRubricasporEmpresa: TMenuItem;
    mnuEstatisticadeBeneficios: TMenuItem;
    mnuRelatorios: TMenuItem;
    UsuarioRH: TPanel;
    N2: TMenuItem;
    procedure mnuTiposdeBeneficioClick(Sender: TObject);
    procedure mnuRegistrodeBeneficiosClick(Sender: TObject);
    procedure mnuHistoricodeBeneficiosClick(Sender: TObject);
    procedure mnuRubricasSalariaisClick(Sender: TObject);
    procedure mnuRubricasporEmpresaClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuEstatisticadeBeneficiosClick(Sender: TObject);
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
  uSistema, uModulo, fTelaAut, uCtrlPadroes,

  uCmCtrlRptModBen, uCtrlUsoGeralRH, uCtrlFuncoesRH, dCds,

  fCadBenef, fCadRegBen, fCadProvento,

  fAssocProvEmpre, fHstBenef, fSelEstBenef,

  fParamBenefPorPessoa, fParamBenefPorTipo;

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

procedure TfrmPrincipal.mnuTiposdeBeneficioClick(Sender: TObject);
begin
  AbrirForm(frmCadBenef, TfrmCadBenef, false);
end;

procedure TfrmPrincipal.mnuRegistrodeBeneficiosClick(Sender: TObject);
begin
  AbrirForm(frmCadRegBen, TfrmCadRegBen, false);
end;

procedure TfrmPrincipal.mnuHistoricodeBeneficiosClick(Sender: TObject);
begin
  AbrirForm(frmHstBenef, TfrmHstBenef, false);
end;

procedure TfrmPrincipal.mnuRubricasSalariaisClick(Sender: TObject);
begin
  AbrirForm(frmCadProvento, TfrmCadProvento, false);
end;

procedure TfrmPrincipal.mnuRubricasporEmpresaClick(Sender: TObject);
begin
  AbrirForm(frmAssocProvEmpre, TfrmAssocProvEmpre, false);
end;

procedure TfrmPrincipal.mnuEstatisticadeBeneficiosClick(Sender: TObject);
begin
  AbrirForm(frmSelEstBenef, TfrmSelEstBenef, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModBen: TCmCtrlRptModBen;
begin
  inherited;
  CmCtrlRptModBen := TCmCtrlRptModBen.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModBen, DesReport);
    CmCtrlRptModBen.Free;
  except
    CmCtrlRptModBen.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModFol: TCmCtrlRptModBen;
begin
  inherited;
  RptModFol := TCmCtrlRptModBen.Create;
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
    738 : frmPreviewReports := TfrmParamBenefPorPessoa.Create(Self);
    739 : frmPreviewReports := TfrmParamBenefPorTipo.Create(Self);
    else  frmPreviewReports := nil;
  end;
  inherited;
end;

initialization
   Sistema.NomeModulo := 'RH - Benefícios Sociais';
   Sistema.IdModulo := MODBEN;
   Sistema.Versao := '4.00.07';
   Sistema.NomeAplicativo := 'RH - Benefícios Sociais';
   Sistema.LoadOldReport := false;
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
