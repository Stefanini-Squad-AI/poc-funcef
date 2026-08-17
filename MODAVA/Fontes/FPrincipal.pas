unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons,  ComCtrls, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, TB97, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTransacoes: TMenuItem;
    mnuCargos: TMenuItem;
    mnuGruposFuncionais: TMenuItem;
    mnuFatoresdeAvalicao: TMenuItem;
    mnuPesosGruposxFatores: TMenuItem;
    mnuRegistrodeAvalDesemp: TMenuItem;
    mnuRegistrodeOutrasAval: TMenuItem;
    mnuTiposdeAvalicao: TMenuItem;
    mnuHistAval: TMenuItem;
    mnuEvolPotencial: TMenuItem;
    mnuEstatAval: TMenuItem;
    mnuRelatorios: TMenuItem;
    UsuarioRH: TPanel;
    N4: TMenuItem;
    mnuGruposFatoresAvaliacao: TMenuItem;
    procedure mnuCargosClick(Sender: TObject);
    procedure mnuGruposFuncionaisClick(Sender: TObject);
    procedure mnuFatoresdeAvalicaoClick(Sender: TObject);
    procedure mnuTiposdeAvalicaoClick(Sender: TObject);
    procedure mnuRegistrodeOutrasAvalClick(Sender: TObject);
    procedure mnuRegistrodeAvalDesempClick(Sender: TObject);
    procedure mnuPesosGruposxFatoresClick(Sender: TObject);
    procedure mnuHistAvalClick(Sender: TObject);
    procedure mnuEstatAvalClick(Sender: TObject);
    procedure mnuEvolPotencialClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuGruposFatoresAvaliacaoClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer;
      var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer;
      sFileName: String; var Printed: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSistema, fTelaAut, uCtrlPadroes,

  dCds, uModulo, uCtrlFuncoesRH, uCmCtrlRptModAva, uCtrlListTerceirosRH, uCtrlUsoGeralRH,

  fCadCargo, fCadGrupoFunc, fCadFator, fCadRegAval, fCadRegDesemp, fCadPeso, fCadTipAval,
  fCadGrupoFator,

  fHstAval, fSelEstAval, fPotencAval,

  fParamRelAvalPre, fParamRelAval, fParamProgAval, fParamFormAvalBranco,
  fParamRelDesemp, fCadParam;

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

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TFrmCadParam, false);
end;

procedure TfrmPrincipal.mnuCargosClick(Sender: TObject);
begin
  AbrirForm(frmCadCargo, TfrmCadCargo, false);
end;

procedure TfrmPrincipal.mnuGruposFuncionaisClick(Sender: TObject);
begin
  AbrirForm(frmCadGrupoFunc, TfrmCadGrupoFunc, false);
end;

procedure TfrmPrincipal.mnuFatoresdeAvalicaoClick(Sender: TObject);
begin
  AbrirForm(frmCadFator, TfrmCadFator, false);
end;

procedure TfrmPrincipal.mnuTiposdeAvalicaoClick(Sender: TObject);
begin
  AbrirForm(frmCadTipAval, TfrmCadTipAval, false);
end;

procedure TfrmPrincipal.mnuRegistrodeOutrasAvalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegAval, TfrmCadRegAval, false);
end;

procedure TfrmPrincipal.mnuRegistrodeAvalDesempClick(Sender: TObject);
begin
  AbrirForm(frmCadRegDesemp, TfrmCadRegDesemp, false);
end;

procedure TfrmPrincipal.mnuPesosGruposxFatoresClick(Sender: TObject);
begin
  AbrirForm(frmCadPeso, TfrmCadPeso, false);
end;

procedure TfrmPrincipal.mnuHistAvalClick(Sender: TObject);
begin
  AbrirForm(frmHstAval, TfrmHstAval, false);
end;

procedure TfrmPrincipal.mnuEstatAvalClick(Sender: TObject);
begin
  AbrirForm(frmSelEstAval, TfrmSelEstAval, false);
end;

procedure TfrmPrincipal.mnuEvolPotencialClick(Sender: TObject);
begin
  AbrirForm(frmPotencAval, TfrmPotencAval, false);
end;

procedure TfrmPrincipal.mnuGruposFatoresAvaliacaoClick(Sender: TObject);
begin
  AbrirForm(frmCadGrupoFator, TFrmCadGrupoFator, false);
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    3692 : frmPreviewReports := TfrmParamRelAvalPre.Create(Self);
    3697 : frmPreviewReports := TfrmParamRelAval.Create(Self);
    3699 : frmPreviewReports := TfrmParamProgAval.Create(Self);
    17   : frmPreviewReports := TfrmParamFormAvalBranco.Create(Self);
    4016 : frmPreviewReports := TfrmParamRelDesemp.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModAva: TCmCtrlRptModAva;
begin
  inherited;
  CmCtrlRptModAva := TCmCtrlRptModAva.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModAva, DesReport);
    CmCtrlRptModAva.Free;
  except
    CmCtrlRptModAva.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModAva: TCmCtrlRptModAva;
begin
  inherited;
  RptModAva := TCmCtrlRptModAva.Create;
  try
    Printed := ShowReport(IdReports, RptModAva);
    RptModAva.Free;
  except
    RptModAva.Free;
    raise;
  end;
end;

initialization
   Sistema.NomeModulo     := 'RH - Administração de Desempenho';
   Sistema.IdModulo       := MODAVA;
   Sistema.Versao := '3.05.05';
   Sistema.NomeAplicativo := 'RH - Administração de Desempenho';
   Sistema.LoadOldReport  := false;
   Modulo                 := TModulo.Create;
finalization
   Modulo.Free;
end.
