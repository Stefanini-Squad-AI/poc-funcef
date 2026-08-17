unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModuloIndicadores, TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel, SConnect, MConnect, DBClient, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, fcStatusBar, uCMRptManager,uCMTypes,
  uResource, CMNetUsers;


type
  TfrmPrincipal = class(TfrmCMPrincipal)
    miCadLojas: TMenuItem;
    miContratos: TMenuItem;
    Eventos1: TMenuItem;
    miCadEventosMarketing: TMenuItem;
    miHistEventosMarketing: TMenuItem;
    N1: TMenuItem;
    miCadIndicadores: TMenuItem;
    Movimento1: TMenuItem;
    miApuracao: TMenuItem;
    miExecImportacao: TMenuItem;
    miCadGrpApuracao: TMenuItem;
    Relatrios2: TMenuItem;
    miTipoRelat: TMenuItem;
    miSubTipoRelat: TMenuItem;
    miCalcIndicadores: TMenuItem;
    miExecCheckList: TMenuItem;
    miCadAtividade: TMenuItem;
    miCadMarca: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    miExecEncerraContrato: TMenuItem;
    miExecConcilia: TMenuItem;
    miExecExcluiApuracao: TMenuItem;
    miSeparador: TMenuItem;
    miCadContratoLoja: TMenuItem;
    miCadEventoContratoLoja: TMenuItem;
    miCadSitContImob: TMenuItem;
    N6: TMenuItem;
    miCadContratoHotel: TMenuItem;
    miCadContratoNegocio: TMenuItem;
    DadosComplementares1: TMenuItem;
    miCadComplemento: TMenuItem;
    miCadComplementoXTipoImovel: TMenuItem;
    miLayOutImportacao: TMenuItem;
    miExecImportPlanilha: TMenuItem;
    miSinonimos: TMenuItem;
    ImportaodeIndicadores1: TMenuItem;
    N2: TMenuItem;
    mnuCorrecaoLancImovel: TMenuItem;
    procedure miTipoRelatClick(Sender: TObject);
    procedure miCadIndicadoresClick(Sender: TObject);
    procedure miSubTipoRelatClick(Sender: TObject);
    procedure miCadEventosMarketingClick(Sender: TObject);
    procedure miHistEventosMarketingClick(Sender: TObject);
    procedure miCadGrpApuracaoClick(Sender: TObject);
    procedure miCadLojasClick(Sender: TObject);
    procedure miApuracaoClick(Sender: TObject);
    procedure miCadMarcaClick(Sender: TObject);
    procedure miCadAtividadeClick(Sender: TObject);
    procedure miCalcIndicadoresClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure miExecEncerraContratoClick(Sender: TObject);
    procedure miExecCheckListClick(Sender: TObject);
    procedure miExecConciliaClick(Sender: TObject);
    procedure miExecImportacaoClick(Sender: TObject);
    procedure miExecExcluiApuracaoClick(Sender: TObject);
    procedure miCadContratoLojaClick(Sender: TObject);
    procedure miCadSitContImobClick(Sender: TObject);
    procedure miCadEventoContratoLojaClick(Sender: TObject);
    procedure miCadContratoHotelClick(Sender: TObject);
    procedure miCadComplementoClick(Sender: TObject);
    procedure miCadComplementoXTipoImovelClick(
      Sender: TObject);
    procedure miCadContratoNegocioClick(Sender: TObject);
    procedure miLayOutImportacaoClick(Sender: TObject);
    procedure miExecImportPlanilhaClick(Sender: TObject);
    procedure miSinonimosClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuCorrecaoLancImovelClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.DFM}

uses  uCtrlRptIndicadores,  fParamIndicadores,    fCadContratoHotelMT,
      fCadIndicadoresMT,    fCadSubTipoRelatMT,   fCadEventoMkgMT, fCadHistEventoMkgMT,
      fCadGrpApuracaoMT,    fCadContratoLojaMT,   fCadLojaMT,      fCadTipoRelatMT,
      fCadAtividadeMT,      fCadMarcasMT,         fApuracaoMT,     fCadSitContImobMT,
      fExecEncerraContrato, fExecCalcIndicadores, fExecCheckList,  fCadEventoContratoLojaMT,
      fExecExcluiApuracao,  fExecImportacao,      fExecConcilia,   fCadOutroDadoXTipoImovelMT,
      fCadOutroDadoMT,      fCadSinonimoMT,       fCadLayOutImpMT, fCadContratoTerceiroMT,
      fExecImportPlanilha,
      cRelOrcamento,        cRelFuncionario,      cRelVeiculoSem,  cRelOrcamentoCivil,
      cRelVendaLoja,        cRelInadimplencia,    cRelAbono,       cRelRemessa,
      cRelLojasLivres,      cRelVendaAtividade,   cRelRanking,     cRelVendaAtividadeShop,
      cRelPerformance,      cRelVeiculoMen,       cRelIndicadores, cRelGrpApuracao,
      cRelEstrutura,        cRelAgua,             cRelEnergia,     cRelRdsHotel,
      cRelComparaHotel,     cRelGraficoHotel,     cRelVacancia,    cRelVendaFranquiaShop,
      cRelEvolVacancia,     cRelAnaliseOrca,      dMS,             fAcertaLanctoImovel;


procedure TfrmPrincipal.miTipoRelatClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoRelatMT, TfrmCadTipoRelatMT, False);
end;

procedure TfrmPrincipal.miCadIndicadoresClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadoresMT, TfrmCadIndicadoresMT, False);
end;

procedure TfrmPrincipal.miSubTipoRelatClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSubTipoRelatMT, TfrmCadSubTipoRelatMT, False);
end;

procedure TfrmPrincipal.miCadEventosMarketingClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadEventoMkgMT, TfrmCadEventoMkgMT, False);
end;

procedure TfrmPrincipal.miHistEventosMarketingClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHistEventoMkgMT, TfrmCadHistEventoMkgMT, False);
end;

procedure TfrmPrincipal.miCadGrpApuracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGrpApuracaoMT, TfrmCadGrpApuracaoMT, False);
end;

procedure TfrmPrincipal.miCadLojasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLojaMT, TfrmCadLojaMT, False);
end;

procedure TfrmPrincipal.miApuracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmApuracaoMT, TfrmApuracaoMT, False);
end;

procedure TfrmPrincipal.miCadMarcaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadMarcasMT, TfrmCadMarcasMT, False);
end;

procedure TfrmPrincipal.miCadAtividadeClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAtividadeMT, TfrmCadAtividadeMT, False);
end;

procedure TfrmPrincipal.miCalcIndicadoresClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecCalcIndicadores, TfrmExecCalcIndicadores, False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var CtrlRptIndicadores :TCtrlRptIndicadores;
Begin
  inherited;
  CtrlRptIndicadores := TCtrlRptIndicadores.Create;
  try
    Printed := ShowReport(IdReports, CtrlRptIndicadores);
    CtrlRptIndicadores.Free;
  except
    CtrlRptIndicadores.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
     3433: FrmPreviewReports := TcfgRelIndicadores.Create(Self);
     3435: FrmPreviewReports := TcfgRelOrcamento.Create(Self);
     3437: FrmPreviewReports := TcfgRelEstrutura.Create(Self);
     3441: FrmPreviewReports := TcfgRelFuncionario.Create(Self);
     3449: FrmPreviewReports := TcfgRelVeiculoSem.Create(Self);
     3454: FrmPreviewReports := TcfgRelEnergia.Create(Self);
     3463: FrmPreviewReports := TcfgRelVendaLoja.Create(Self);
     3465: FrmPreviewReports := TcfgRelInadimplencia.Create(Self);
     3469: FrmPreviewReports := TcfgRelAbono.Create(Self);
     3471: FrmPreviewReports := TcfgRelRemessa.Create(Self);
     3473: FrmPreviewReports := TcfgRelLojasLivres.Create(Self);
     3475: FrmPreviewReports := TcfgRelVendaAtividade.Create(Self);
     3477: FrmPreviewReports := TcfgRelRanking.Create(Self);
     3479: FrmPreviewReports := TcfgRelPerformance.Create(Self);
     3481: FrmPreviewReports := TcfgRelAgua.Create(Self);
     3494: FrmPreviewReports := TcfgRelGrpApuracao.Create(Self);
     3546: FrmPreviewReports := TcfgRelVeiculoMen.Create(Self);
     3620: FrmPreviewReports := TcfgRelVendaAtividadeShop.Create(Self);
     3965: FrmPreviewReports := TcfgRelVendaFranquiaShop.Create(Self);
     3622: FrmPreviewReports := TcfgRelOrcamentoCivil.Create(Self);
     3755: FrmPreviewReports := TcfgRelRdsHotel.Create(Self);
     3759: FrmPreviewReports := TcfgRelComparaHotel.Create(Self);
     3763: FrmPreviewReports := TcfgRelGraficoHotel.Create(Self);
    20132: FrmPreviewReports := TcfgRelVacancia.Create(Self);
    20134: FrmPreviewReports := TcfgRelEvolVacancia.Create(Self);
    20140: FrmPreviewReports := TcfgRelAnaliseOrca.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  // Conecta ao servidor de Aplicação
  if Sistema.FezLogin then begin
    ModuloIndicadores.GetParam(sistema.idEmpresa);
    DecimalSeparator := ',';    
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  ModuloIndicadores := TModuloIndicadores.Create;
  Application.CreateForm(TdtmMS, dtmMS);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamIndicadores, TfrmParamIndicadores, False);
end;

procedure TfrmPrincipal.miExecEncerraContratoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecEncerraContrato, TfrmExecEncerraContrato, False);
end;

procedure TfrmPrincipal.miExecCheckListClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecCheckList, TfrmExecCheckList, False);
end;

procedure TfrmPrincipal.miExecConciliaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecConcilia, TfrmExecConcilia, False);
end;

procedure TfrmPrincipal.miExecImportacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecImportacao, TfrmExecImportacao, False);
end;

procedure TfrmPrincipal.miExecExcluiApuracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecExcluiApuracao, TfrmExecExcluiApuracao, False);
end;

procedure TfrmPrincipal.miCadContratoLojaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContratoLojaMT, TfrmCadContratoLojaMT, False);
end;

procedure TfrmPrincipal.miCadSitContImobClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSitContImobMT, TfrmCadSitContImobMT, False);
end;

procedure TfrmPrincipal.miCadEventoContratoLojaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadEventoContratoLojaMT, TfrmCadEventoContratoLojaMT, False);
end;

procedure TfrmPrincipal.miCadContratoHotelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContratoHotelMT, TfrmCadContratoHotelMT, False);
end;

procedure TfrmPrincipal.miCadComplementoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOutroDadoMT, TfrmCadOutroDadoMT, False);
end;

procedure TfrmPrincipal.miCadComplementoXTipoImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOutroDadoXTipoImovelMT, TfrmCadOutroDadoXTipoImovelMT, False);
end;

procedure TfrmPrincipal.miCadContratoNegocioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContratoTerceiroMT, TfrmCadContratoTerceiroMT, False);
end;

procedure TfrmPrincipal.miLayOutImportacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLayOutImpMT, TfrmCadLayOutImpMT, False);
end;

procedure TfrmPrincipal.miExecImportPlanilhaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecImportPlanilha, TfrmExecImportPlanilha, False);
end;

procedure TfrmPrincipal.miSinonimosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSinonimoMT, TfrmCadSinonimoMT, False);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,liOrigemCm:Integer;
                                                    DesReport:TObject; var Config:Boolean);
var RptIndicadores : TCtrlRptIndicadores;
begin
   inherited;

// Daniel - 26239 - Início -----------------------------------------------------
   RptIndicadores := TCtrlRptIndicadores.Create;

   try
      Config := ConfigReport(liIdReports,liOrigemCm,RptIndicadores,DesReport);
      RptIndicadores.Free;
   except
      on E: Exception do
      begin
         RptIndicadores.Free;
         if (UpperCase(E.message) <> 'OPERATION ABORTED') then raise;
      end;  // on E: Exception do
   end;  // try..except
// Daniel - 26239 - Fim --------------------------------------------------------

end;

procedure TfrmPrincipal.mnuCorrecaoLancImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaLanctoImovel, TfrmAcertaLanctoImovel, False);
end;

initialization
   Sistema.NomeModulo     := 'Indicadores'; // Nome do Módulo
   Sistema.IdModulo       := 439;           // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.18a';
   Sistema.NomeAplicativo := 'Indicadores de Shoppings, Hotéis e Parques';
finalization
   ModuloIndicadores.free;


end.
