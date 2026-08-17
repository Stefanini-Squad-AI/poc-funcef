{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: mnuGetif, mnuAutorizacao, mnuFormulario, mnuOperacao, mnuObjeto
               mnuFuncaoxOperacao, mnuUsuarioLiberado
--------------------------------------------------------------------------------
Rotina......: (dfm mnuIntegraoOramentriaFDO1), FCadIntegraOrcFDO
Nº SIG......: 94320
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação de Tela de parametrizacao da Integração Orçamentária
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de Tela de cadastro de natureza de contrato em
              Cadastro/Tipo de Natureza do Contrato
--------------------------------------------------------------------------------
Data      : 31/01/2007
Pendência :
Descrição : Removido Baca
--------------------------------------------------------------------------------
Rotina    : -
Data      : 28/10/2003
Pendencia : 14801 e 14803
Descrição : Criados menus para cadastros de Planos de Centros de
            Responsabilidade e Custo
--------------------------------------------------------------------------------
Rotina    : -
Data      : 13/08/2003
Pendencia : 14449
Descrição :
--------------------------------------------------------------------------------}

unit FPrincipal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCMPrincipal,UMensErro,USistema, DB, DBTables, wwTable, CMwwQuery, Menus,
   Wwintl, ExtCtrls, Buttons, ComCtrls, Wwdatsrc, wwdblook, StdCtrls, Mask,
   wwdbedit, TB97, TB97Tlwn, TB97Tlbr, TB97Ctls, DBCtrls, uModulo, IvDictio,
   IvAMulti, IvBinDic, IvMulti, IvEMulti, uIntegraBack, Grids, Wwdbigrd,
   Wwdbgrid, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns,
   ActnList, ImgList, fcStatusBar, Wwquery, SConnect, fLeArqReports, MConnect,
   uCtrlRptGlobal, DBClient, uResource, CMNetUsers, FCadBackAutoriza, FNaturezaContrato,
   FCadIntegraOrcFDO, wwstorep;            //edilaine - SIG94320

type
   TfrmPrincipal = class(TfrmCMPrincipal)
      Moeda1: TMenuItem;
      CentrodeResultado1: TMenuItem;
      Estado1: TMenuItem;
      Pas1: TMenuItem;
      Fornecedores1: TMenuItem;
      Bancos1: TMenuItem;
      Cotao1: TMenuItem;
      Qualificao1: TMenuItem;
      N5: TMenuItem;
      Feriados1: TMenuItem;
      TipodeDocumento1: TMenuItem;
      TipodeOperao1: TMenuItem;
      CentrodeResponsabilidade1: TMenuItem;
      Clientes1: TMenuItem;
      Agncia1: TMenuItem;
      RamodeF1: TMenuItem;
      TipodeCliente1: TMenuItem;
      Ferramentas1: TMenuItem;
      Importadefiniesderelatorio1: TMenuItem;
      AtividadesProjetos1: TMenuItem;
      Cidades1: TMenuItem;
      N4: TMenuItem;
      N9: TMenuItem;
      mnuUsuxCCusto: TMenuItem;
      MnuProgramas: TMenuItem;
      N1: TMenuItem;
      ConsultaLogTabelas1: TMenuItem;
      ExcluiLogTabelas1: TMenuItem;
      N2: TMenuItem;
      AssociaPessoaXMduloResponsvel1: TMenuItem;
      MnuPlanoPrevidenciarioContabil: TMenuItem;
      MnuPracadeCompensacao1: TMenuItem;
      UsuariosporCentrodeResponsabilidade1: TMenuItem;
      TipodeClienteporHoteleContaContabil1: TMenuItem;
      UsuariosporQualificacaodeMoeda1: TMenuItem;
      CentrodeResponsabilidadePorUsurios1: TMenuItem;
      CentrodeCustoPorUsurios1: TMenuItem;
      N6: TMenuItem;
      mnuCadPlanCentRespon: TMenuItem;
      mnuCadPlanCentCust: TMenuItem;
      mnuDeParaCR: TMenuItem;
      mnuDeParaCC: TMenuItem;
      mnuDePara: TMenuItem;
      mnuExecDeParaCR: TMenuItem;
      mnuExecDeParaCC: TMenuItem;
      mnuCadTabelaDeParaCR: TMenuItem;
      mnuCadCampoDeParaCR: TMenuItem;
      mnuCadDeParaCR: TMenuItem;
      mnuCadDeParaCC: TMenuItem;
      N11: TMenuItem;
      N10: TMenuItem;
      mnuCadTabelaDeParaCC: TMenuItem;
      mnuCadCampoDeParaCC: TMenuItem;
      N12: TMenuItem;
      mnuPlanoPrevidencirioXPatrocinadora1: TMenuItem;
      CentrosdeResponsabilidade1: TMenuItem;
      CentrodeCustos1: TMenuItem;
      N3: TMenuItem;
      Importaodecotaes1: TMenuItem;
      DeParadeExportaes1: TMenuItem;
      RestauraAutorizao1: TMenuItem;
      mnuCadPatro: TMenuItem;
      mnuCadPlanPrev: TMenuItem;
    mnuNaturezaContr: TMenuItem;
    N7: TMenuItem;
    mnuIntegraoOramentriaFDO1: TMenuItem;
    mnuGetif: TMenuItem;
    mnuAutorizacao: TMenuItem;
    mnuFormulario: TMenuItem;
    mnuOperacao: TMenuItem;
    mnuObjeto: TMenuItem;
    mnuFuncaoxOperacao: TMenuItem;
    mnuUsuarioLiberado: TMenuItem;

      procedure Qualificao1Click(Sender: TObject);
      procedure Cotao1Click(Sender: TObject);
      procedure CentrodeResultado1Click(Sender: TObject);
      procedure Fornecedores1Click(Sender: TObject);
      procedure Bancos1Click(Sender: TObject);
      procedure Pas1Click(Sender: TObject);
      procedure Estado1Click(Sender: TObject);
      procedure PlanodeContas1Click(Sender: TObject);
      procedure TipodeDocumento1Click(Sender: TObject);
      procedure TipodeOperao1Click(Sender: TObject);
      procedure ContasAuxiliares1Click(Sender: TObject);
      procedure mnuAjudaIndiceClick(Sender: TObject);
      procedure CentrodeResponsabilidade1Click(Sender: TObject);
      procedure Clientes1Click(Sender: TObject);
      procedure Agncia1Click(Sender: TObject);
      procedure RamodeF1Click(Sender: TObject);
      procedure TipodeCliente1Click(Sender: TObject);
      procedure Feriados1Click(Sender: TObject);
      procedure nmuConfigParametrosClick(Sender: TObject);
      procedure Importadefiniesderelatorio1Click(Sender: TObject);
      procedure AtividadesProjetos1Click(Sender: TObject);
      procedure Cidades1Click(Sender: TObject);
      procedure mnuUsuxCCustoClick(Sender: TObject);
      procedure MnuProgramasClick(Sender: TObject);
      procedure AppPadraoAfterLogin(Sender: TObject);
      procedure ConsultaLogTabelas1Click(Sender: TObject);
      procedure ExcluiLogTabelas1Click(Sender: TObject);
      procedure MnuPlanoPrevidenciarioContabilClick(Sender: TObject);
      procedure MnuPracadeCompensacao1Click(Sender: TObject);
      procedure AssociaPessoaXMduloResponsvel1Click(Sender: TObject);
      procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
      procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
      procedure UsuariosporCentrodeResponsabilidade1Click(Sender: TObject);
      procedure TipodeClienteporHoteleContaContabil1Click(Sender: TObject);
      procedure UsuariosporQualificacaodeMoeda1Click(Sender: TObject);
      procedure CentrodeCustoPorUsurios1Click(Sender: TObject);
      procedure CentrodeResponsabilidadePorUsurios1Click(Sender: TObject);
      procedure mnuCadPlanCentResponClick(Sender: TObject);
      procedure mnuCadPlanCentCustClick(Sender: TObject);
      procedure mnuCadDeParaCRClick(Sender: TObject);
      procedure mnuCadDeParaCCClick(Sender: TObject);
      procedure mnuCadTabelaDeParaCCClick(Sender: TObject);
      procedure mnuCadTabelaDeParaCRClick(Sender: TObject);
      procedure mnuPlanoPrevidencirioXPatrocinadora1Click(Sender: TObject);
      procedure fcLabel2DblClick(Sender: TObject);
      procedure mnuExecDeParaCCClick(Sender: TObject);
      procedure mnuExecDeParaCRClick(Sender: TObject);
      procedure Importaodecotaes1Click(Sender: TObject);
      procedure DeParadeExportaes1Click(Sender: TObject);
      procedure RestauraAutorizao1Click(Sender: TObject);
      procedure mnuCadPlanPrevClick(Sender: TObject);
      procedure mnuCadPatroClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuNaturezaContrClick(Sender: TObject);
    procedure mnuIntegraoOramentriaFDO1Click(Sender: TObject);
    procedure mnuFormularioClick(Sender: TObject);
    procedure mnuOperacaoClick(Sender: TObject);
    procedure mnuObjetoClick(Sender: TObject);
    procedure mnuFuncaoxOperacaoClick(Sender: TObject);
    procedure mnuUsuarioLiberadoClick(Sender: TObject);

   private  // Private declarations
      procedure HabilitaMenu;

   public   // Public declarations

   end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.DFM}
uses
   uDataBase,            dbaseDados,        UAutorizacao,         fTelaAut,
   FCadBanco,            FImpPlanoCntas,    fParamGlobalMT,       fCadUsrxMoedaMT,
   fImpSubConta,         fCadCliente,       fCadAgencia,          FCadCCustoMT,
   FCadCReponMT,         FCadForne,         FExcluiLogTabelasMT,  fCadPaisMT,
   RListagemDeEmpresas,  FCadMoedaMT,       FCadEstadoMT,         FCadCidadeMT,
   FCotacaoMoedaMT,      FCadTipOperMT,     FCadTipoClienteMT,    FCadProgramaMT,
   FCadRamoFornecedorMT, UCtrlParamIntegra, FConsultaLogAltExcMT, FCadPracaCompMT,
   FCadUsrxCCustoMT,     FCadFeriadoMT,     FCadAbcMT,            FCadPlanPrevContabilMT,
   fCadTipoDocPessoaMT,  FCadUsuxCRespMT,   FPessoaXModuloResponMT,
   FCadTipoClixHotelxCCMT, FCadCRespxUsu, FCadCcustoxUsu, FCadPlanCRespon,
   FCadPlanCCust, fCadDeParaCRMultiMT, fCadDeParaCCMultiMT, FCadPlanPrevContabPatro,
   FCadTabelaDeParaCC, FCadTabelaDeParaCR, FExecDeParaCC, FExecDeParaCR,
   FWizImportaCotacao, FCadDeparaExternoMT, FCadPlanPrevMT, FCadPatroMT,
   uPExtratoDesligamento, dRelExtratoDesligamento, FCadForm, FCadOperacao,
  FCadObjeto, FCadFuncaoOperacao, FCadUsuarioLiberado;

procedure TfrmPrincipal.Qualificao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadMoeda, TfrmCadMoeda, false);
end;

procedure TfrmPrincipal.Cotao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCotacaoMoeda, TfrmCotacaoMoeda, false);
end;

procedure TfrmPrincipal.CentrodeResultado1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCCusto, TfrmCadCCusto, false);
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadForne, TfrmCadForne, false);
end;

procedure TfrmPrincipal.Bancos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadBanco, TfrmCadBanco, false);
end;

procedure TfrmPrincipal.Pas1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPais, TfrmCadPais, false);
end;

procedure TfrmPrincipal.Estado1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadUF, TfrmCadUF, false);
end;

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmImpPlanoCntas, TfrmImpPlanoCntas, false);
end;

procedure TfrmPrincipal.TipodeDocumento1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTipoDocPessoa, TfrmCadTipoDocPessoa, false);
end;

procedure TfrmPrincipal.TipodeOperao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTipOper, TfrmCadTipOper, false);
end;

procedure TfrmPrincipal.ContasAuxiliares1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmImpSubConta, TfrmImpSubConta, false);
end;

procedure TfrmPrincipal.mnuAjudaIndiceClick(Sender: TObject);
begin
   inherited;
   Application.HelpCommand(help_contents, 0);
end;

procedure TfrmPrincipal.CentrodeResponsabilidade1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCRespon, TfrmCadCRespon, false);
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCliente, TfrmCadCliente, false);
end;

procedure TfrmPrincipal.Agncia1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadAgencia, TfrmCadAgencia, false);
end;

procedure TfrmPrincipal.RamodeF1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadRamoFor, TfrmCadRamoFor, false);
end;

procedure TfrmPrincipal.TipodeCliente1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTipoCliente, TfrmCadTipoCliente, false);
end;

procedure TfrmPrincipal.Feriados1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadFeriados, TFrmCadFeriados, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmParamGlobal, TfrmParamGlobal, false);
end;

procedure TfrmPrincipal.Importadefiniesderelatorio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmLeArqReports, TfrmLeArqReports, false);
end;

procedure TfrmPrincipal.AtividadesProjetos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadAbc, TfrmCadAbc, false);
end;

procedure TfrmPrincipal.Cidades1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCidade, TfrmCadCidade, false);
end;

procedure TfrmPrincipal.mnuUsuxCCustoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmUsuxCCusto, TFrmUsuxCCusto, false);
end;

procedure TfrmPrincipal.MnuProgramasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPrograma, TfrmCadPrograma, false);
end;

procedure TfrmPrincipal.ConsultaLogTabelas1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsultaLogAltExc, TFrmConsultaLogAltExc, False);
end;

procedure TfrmPrincipal.ExcluiLogTabelas1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmExcluiLogTabelas, TFrmExcluiLogTabelas, False);
end;

procedure TfrmPrincipal.MnuPlanoPrevidenciarioContabilClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadPlanPrevContabil, TFrmCadPlanPrevContabil, False);
end;

procedure TfrmPrincipal.MnuPracadeCompensacao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadPracaComp, TFrmCadPracaComp, False);
end;

procedure TfrmPrincipal.AssociaPessoaXMduloResponsvel1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmPessoaXModuloRespon, TFrmPessoaXModuloRespon, False);
end;

procedure TfrmPrincipal.UsuariosporCentrodeResponsabilidade1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadUsuxCResp, TFrmCadUsuxCResp, False);
end;

procedure TfrmPrincipal.TipodeClienteporHoteleContaContabil1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadTipoClixHotelxCC, TFrmCadTipoClixHotelxCC, False);
end;

procedure TfrmPrincipal.UsuariosporQualificacaodeMoeda1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadUsrxMoeda, TFrmCadUsrxMoeda, False);
end;

procedure TfrmPrincipal.CentrodeCustoPorUsurios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadCcustoxUsu, TFrmCadCcustoxUsu, False);
end;

// 13/08/2003 - Inicio pendência 14449
procedure TfrmPrincipal.CentrodeResponsabilidadePorUsurios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadCRespxUsuMT, TFrmCadCRespxUsuMT, False);
end;
// 13/08/2003 - Fim pendência 14449

procedure TfrmPrincipal.mnuCadPlanCentResponClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPlanCRespon, TfrmCadPlanCRespon, False);
end;

procedure TfrmPrincipal.mnuCadPlanCentCustClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadPlanCCust, TfrmCadPlanCCust, False);
end;

procedure TfrmPrincipal.mnuCadDeParaCRClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadDeParaCRMultiMT, TfrmCadDeParaCRMultiMT, False);
end;

procedure TfrmPrincipal.mnuCadDeParaCCClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadDeParaCCMultiMT, TfrmCadDeParaCCMultiMT, False);
end;

procedure TfrmPrincipal.mnuPlanoPrevidencirioXPatrocinadora1Click(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadPlanPrevContabPatro, TFrmCadPlanPrevContabPatro, False);
end;

procedure TfrmPrincipal.mnuCadTabelaDeParaCCClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTabelaDeParaCC, TfrmCadTabelaDeParaCC, False);
end;

procedure TfrmPrincipal.mnuCadTabelaDeParaCRClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTabelaDeParaCR, TfrmCadTabelaDeParaCR, False);
end;

procedure TfrmPrincipal.mnuExecDeParaCCClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecDeParaCC, TfrmExecDeParaCC, False);
end;

procedure TfrmPrincipal.mnuExecDeParaCRClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecDeParaCR, TfrmExecDeParaCR, False);
end;

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
var
   CtrlRptGlobal: TCtrlRptGlobal;
begin
   inherited;

   CtrlRptGlobal := TCtrlRptGlobal.Create;

   try
      Printed := ShowReport(IdReports, CtrlRptGlobal);

      if CtrlRptGlobal.ExceptionRaised then
         MsgDlg(CtrlRptGlobal.MessageInfo, 'Erro', mtWarning, [mbOk], 0);

      Repaint;

      CtrlRptGlobal.Free;

   except
      on E: Exception do
      begin
         CtrlRptGlobal.Free;
         MsgDlg(E.Message, 'Erro', MtWarning, [MbOk], 0);
         Abort;
      end;
   end;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
   CtrlRptGlobal: TCtrlRptGlobal;
begin
   inherited;

   CtrlRptGlobal := TCtrlRptGlobal.Create;

   try
      Config := ConfigReport(liIdReports, liOrigemCm, CtrlRptGlobal, DesReport);

      if CtrlRptGlobal.ExceptionRaised then
         MsgDlg(CtrlRptGlobal.MessageInfo, 'Erro', MtWarning, [MbOk], 0);

      CtrlRptGlobal.Free;

   except
      on E: Exception do
      begin
         CtrlRptGlobal.Free;
         MsgDlg(E.message, 'Erro', mtWarning, [mbOk], 0);
         Abort;
      end;
   end;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;
   if Sistema.FezLogin then
   begin
      stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

      if Sistema.MudouEmpresa then
      begin
         ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiSistema);
      end;

      MnuProgramas.Visible                   := (Sistema.TipoEmpresa = 'P');
      MnuPlanoPrevidenciarioContabil.Visible := (Sistema.TipoEmpresa = 'P');
      Importadefiniesderelatorio1.Enabled    := True;
   end;
end;

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TfrmPrincipal.fcLabel2DblClick(Sender: TObject);
begin
  inherited;
end;

(* Habilita todos os menus *)
procedure TfrmPrincipal.HabilitaMenu;
var
   i : integer;
begin
   // habilita todos os menus
   for i := 0 to (ComponentCount - 1) do
   begin
      if Components[i] is TMenuItem then (Components[i] as TMenuItem).Enabled := True;
   end;
end;

procedure TfrmPrincipal.Importaodecotaes1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(frmWizImportaCotacao, TfrmWizImportaCotacao, false);
end;

procedure TfrmPrincipal.DeParadeExportaes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDeparaExternoMT, TfrmCadDeparaExternoMT, false);
end;

procedure TfrmPrincipal.RestauraAutorizao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBackAutoriza, TfrmCadBackAutoriza, false);
end;

procedure TfrmPrincipal.mnuCadPlanPrevClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadPlanPrev, TFrmCadPlanPrev, false);
end;

procedure TfrmPrincipal.mnuCadPatroClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPatroMT, TfrmCadPatroMT, false);
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TdtmRelExtratoDesligamento,dtmRelExtratoDesligamento);
end;

procedure TfrmPrincipal.mnuNaturezaContrClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmNaturezaContrato, TfrmNaturezaContrato, false);
end;

//edilaine - SIG94320 - inicio
procedure TfrmPrincipal.mnuIntegraoOramentriaFDO1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadIntegraOrcFDO, TFrmCadIntegraOrcFDO, false);
end;
//edilaine - SIG94320 - fim

//Everson Cunha - Autorização - Início
procedure TfrmPrincipal.mnuFormularioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadForm, TFrmCadForm, false);
end;

procedure TfrmPrincipal.mnuOperacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadOperacao, TFrmCadOperacao, false);
end;

procedure TfrmPrincipal.mnuObjetoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadObjeto, TFrmCadObjeto, false);
end;

procedure TfrmPrincipal.mnuFuncaoxOperacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadFuncaoOperacao, TFrmCadFuncaoOperacao, false);
end;

procedure TfrmPrincipal.mnuUsuarioLiberadoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadUsuarioLiberado, TFrmCadUsuarioLiberado, false);
end;
//Everson Cunha - Autorização - Fim

initialization

   Sistema.NomeModulo         := 'Global';   // Nome do Módulo
   Sistema.IdModulo           := 2;          // IdModulo cadastrado no SAD
   Sistema.Versao := '3.09.16b';
   Sistema.NomeAplicativo     := 'Global CM';
   Sistema.UsaLogOperacoes    := True;
   Modulo := TModulo.Create;

finalization

   Modulo.free;
   IntegraBack.free;

end.
