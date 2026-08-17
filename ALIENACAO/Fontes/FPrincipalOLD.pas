unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, dBaseDados,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModuloAlienacao, TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar, DBClient, MConnect, SConnect ,uCMTypes, uModuloImobiliario,
  uCtrlModuloImobiliario, uCtrlParamIntegra, uCtrlRptAlienacao, dReports,
  uComunsImobiliario, uResource, CMNetUsers, fExecEncerraContratoMT;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    N3: TMenuItem;
    miAnalProp: TMenuItem;
    N4: TMenuItem;
    miLancamentos: TMenuItem;
    miExecParcelas: TMenuItem;
    miGeraContrato: TMenuItem;
    N5: TMenuItem;
    miExecIntegra: TMenuItem;
    miCadAmortizacao: TMenuItem;
    miCadMsgBoleto: TMenuItem;
    miExecEstorno: TMenuItem;
    miCadProposta: TMenuItem;
    miConIndices: TMenuItem;
    miExecConcilia: TMenuItem;
    miCadBaixaManual: TMenuItem;
    N2: TMenuItem;
    miExecRecalculo: TMenuItem;
    miCadComprador: TMenuItem;
    miRecDes: TMenuItem;
    miCadTipoCustoRec: TMenuItem;
    miCadParamReceita: TMenuItem;
    miExecDesfazContrato: TMenuItem;
    N1: TMenuItem;
    miPlanoContas: TMenuItem;
    miExecAntecipa: TMenuItem;
    miExecEncerraContrato: TMenuItem;
    miExecRepactuacao: TMenuItem;
    miExecDesfazRepactuacao: TMenuItem;
    N6: TMenuItem;
    miExecDesfazAntecipa: TMenuItem;
    N7: TMenuItem;
    miExecAlterador: TMenuItem;
    miTipoImovel: TMenuItem;
    mmDiario: TMenuItem;
    miCalculaPrevisao: TMenuItem;
    miEditaPrevisao: TMenuItem;
    N8: TMenuItem;
    miAjustaPrevisao: TMenuItem;
    miEncerraMes: TMenuItem;
    miDesfazEncerra: TMenuItem;
    miAlteradorxImovel: TMenuItem;
    Toolbar971: TToolbar97;
    btnContratos: TToolbarButton97;
    miResiduo: TMenuItem;
    N9: TMenuItem;
    miExecImportaBaixa: TMenuItem;
    miResponsavel: TMenuItem;
    miImovel: TMenuItem;
    btnImovel: TToolbarButton97;
    N10: TMenuItem;
    mnuCartaReajuste: TMenuItem;
    mnuDesenhoCartaReajuste: TMenuItem;
    mnuEmissaoCartaReajuste: TMenuItem;
    miExecAssociaDoc: TMenuItem;
    miExecCadParamOperacao: TMenuItem;
    mniFiadores: TMenuItem;
    miConsultaParc: TMenuItem;
    procedure miAnalPropClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miGeraContratoClick(Sender: TObject);
    procedure miExecParcelasClick(Sender: TObject);
    procedure miCadAmortizacaoClick(Sender: TObject);
    procedure miExecIntegraClick(Sender: TObject);
    procedure miCadMsgBoletoClick(Sender: TObject);
    procedure miExecEstornoClick(Sender: TObject);
    procedure miCadPropostaClick(Sender: TObject);
    procedure miExecConciliaClick(Sender: TObject);
    procedure miCadBaixaManualClick(Sender: TObject);
    procedure miExecRecalculoClick(Sender: TObject);
    procedure miCadCompradorClick(Sender: TObject);
    procedure miCadTipoCustoRecClick(Sender: TObject);
    procedure miCadParamReceitaClick(Sender: TObject);
    procedure miExecDesfazContratoClick(Sender: TObject);
    procedure miPlanoContasClick(Sender: TObject);
    procedure miExecAntecipaClick(Sender: TObject);
    procedure miExecRepactuacaoClick(Sender: TObject);
    procedure miExecDesfazRepactuacaoClick(Sender: TObject);
    procedure miExecDesfazAntecipaClick(Sender: TObject);
    procedure miExecAlteradorClick(Sender: TObject);
    procedure miTipoImovelClick(Sender: TObject);
    procedure miCalculaPrevisaoClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure miEditaPrevisaoClick(Sender: TObject);
    procedure miAjustaPrevisaoClick(Sender: TObject);
    procedure miEncerraMesClick(Sender: TObject);
    procedure miDesfazEncerraClick(Sender: TObject);
    procedure miAlteradorxImovelClick(Sender: TObject);
    procedure miResiduoClick(Sender: TObject);
    procedure miExecImportaBaixaClick(Sender: TObject);
    procedure miResponsavelClick(Sender: TObject);
    procedure miImovelClick(Sender: TObject);
    procedure mnuDesenhoCartaReajusteClick(Sender: TObject);
    procedure mnuEmissaoCartaReajusteClick(Sender: TObject);
    procedure miExecAssociaDocClick(Sender: TObject);
    procedure miExecCadParamOperacaoClick(Sender: TObject);
    procedure mniFiadoresClick(Sender: TObject);
    procedure miConsultaParcClick(Sender: TObject);
    procedure miExecEncerraContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
  private
    { Private declarations }
    procedure AcertaClausulaSQL(dtmReport: TdtmReports);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  gFrmCadPropAtivo : Boolean;

implementation
{$R *.DFM}

uses
   uIntegraBack,
   FCadPropFinanc, fAnalProp, FGeraContrato, FCadParamMT, DRelFinanc,
   FCadAmortizacao, FCadMsgBoleto, fExecParcelas, fExecIntegra,
   fExecEstorno, FCadBaixaManual, fExecConcilia,
   FPessoaLocatarioMT, FCadParamReceitaMT, fExecRecalculo,
   fExecDesfazContrato, BPlanoConta, fExecAntecipa, FCadTipoCustoRecMT,
   fExecRepactuacao, fExecDesfazRepactuacao, fExecDesfazAntecipa,
   FCadAlterador, fCadTipoImovelMT, fExecCalculaPrevisaoDiariaMT,
   cRelPrevImob, cRelParamContab, fCadPrevisaoDiariaMT,
   fExecAjustePrevisaoDiariaMT, fExecFechaDiarioMT, fExecDesfazDiarioMT,
   fCadAlteradorXTipoImovelMT, fExecResiduo, cRelFolhaAlienacao,
   fExecImportaBaixa, fPessoaResponsavelMT, fCadImovelMT,
   FDRelCartaReajuste, CRelCartaReajuste, fExecAssociaDoc,
   fCadParamOperacaoMT, cRelPerdas, cRelPerdasDiarias, fPessoaAvalistaMT,
   cRelEstoqueFinanceiro, FConsultaParcela, cRelAbonos, 

   dFinanciamento,
   dEventoImovel,
   dImobiliario,
   dLancImovel,
   dCalcDocumento,
   dLookImobiliario,
   dCAF,
   dMS,
   dRelAbonos, cRelMovimContabil,
   FExecRecalculoDocumentoAliena;


procedure TfrmPrincipal.miAnalPropClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAnalProp,TfrmAnalProp,False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  // Conecta ao servidor de Aplicação
  try
     if Sistema.FezLogin then begin
        ModuloImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                     ComunsImobiliario.MensErroMT);

        ModuloImobiliario.Alienacao.GetParam( Sistema.IdEmpresa );
        ModuloImobiliario.Global.GetParam( Sistema.IdEmpresa );
        ModuloImobiliario.InvestImob.GetParam( Sistema.IdEmpresa );

        // Pendência 19867 - Marcos Topini
        ModuloImobiliario.Adminimob.GetParam( Sistema.IdEmpresa );
        // Fim Pendência 19867

        ParamIntegra.GetParams( Sistema.IdEmpresa,0,'','',tiSistema );
        IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB','R');
        IntegraBack.RecPag := 'R';

        AcertaClausulaSQL(dtmRelFinanc);
     end;
  finally
     mmDiario.Visible := ModuloImobiliario.Alienacao.bFlgDiario;
     DecimalSeparator := ',';
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadParamMT,TFrmCadParamMT,False);
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TDtmRelFinanc, DtmRelFinanc);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   inherited;
   gFrmCadPropAtivo := False;
end;

procedure TfrmPrincipal.miGeraContratoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmGeraContrato,TFrmGeraContrato,False);
end;

procedure TfrmPrincipal.miExecParcelasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmExecParcelas,TFrmExecParcelas,False);
end;

procedure TfrmPrincipal.miCadAmortizacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadAmortizacao,TFrmCadAmortizacao,False);
end;

procedure TfrmPrincipal.miExecIntegraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmExecIntegra,TFrmExecIntegra,False);
end;

procedure TfrmPrincipal.miCadMsgBoletoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadMsgBoleto,TFrmCadMsgBoleto,False);
end;

procedure TfrmPrincipal.miExecEstornoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecEstorno,TfrmExecEstorno,False);
end;

procedure TfrmPrincipal.miCadPropostaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadPropFinanc,TFrmCadPropFinanc,False);
end;

procedure TfrmPrincipal.miExecConciliaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmExecConcilia,TFrmExecConcilia,False);
end;

procedure TfrmPrincipal.miCadBaixaManualClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadBaixaManual,TFrmCadBaixaManual,False);
end;

procedure TfrmPrincipal.miExecRecalculoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecRecalculoDocumentoAlienacao,TfrmExecRecalculoDocumentoAlienacao,False);
end;

procedure TfrmPrincipal.miCadCompradorClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmPessoaLocatarioMT,TFrmPessoaLocatarioMT,False);
end;

procedure TfrmPrincipal.miCadTipoCustoRecClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadTipoCustoRecMT,TFrmCadTipoCustoRecMT,False);
end;

procedure TfrmPrincipal.miCadParamReceitaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmCadParamReceitaMT,TFrmCadParamReceitaMT,False);
end;

procedure TfrmPrincipal.miExecDesfazContratoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmExecDesfazContrato,TFrmExecDesfazContrato,False);
end;

procedure TfrmPrincipal.miPlanoContasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(busPlanoconta, TbusPlanoconta, False);
end;

procedure TfrmPrincipal.miExecAntecipaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecAntecipa, TfrmExecAntecipa, False);
end;

procedure TfrmPrincipal.miExecRepactuacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecRepactuacao, TfrmExecRepactuacao, False);
end;

procedure TfrmPrincipal.miExecDesfazRepactuacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecDesfazRepactuacao, TfrmExecDesfazRepactuacao, False);
end;

procedure TfrmPrincipal.miExecDesfazAntecipaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecDesfazAntecipa, TfrmExecDesfazAntecipa, False);
end;

procedure TfrmPrincipal.miExecAlteradorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlterador, TfrmCadAlterador, False);
end;

procedure TfrmPrincipal.miTipoImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoImovelMT, TfrmCadTipoImovelMT, False);
end;

procedure TfrmPrincipal.miCalculaPrevisaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecCalculaPrevisaoDiariaMT, TfrmExecCalculaPrevisaoDiariaMT, False);
end;

procedure TfrmPrincipal.miEditaPrevisaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPrevisaoDiariaMT, TfrmCadPrevisaoDiariaMT, False);
end;

procedure TfrmPrincipal.miAjustaPrevisaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecAjustePrevisaoDiariaMT, TfrmExecAjustePrevisaoDiariaMT, False);
end;

procedure TfrmPrincipal.miEncerraMesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecFechaDiarioMT, TfrmExecFechaDiarioMT, False);
end;

procedure TfrmPrincipal.miDesfazEncerraClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecDesfazDiarioMT, TfrmExecDesfazDiarioMT, False);
end;

procedure TfrmPrincipal.miAlteradorxImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlteradorXTipoImovelMT, TfrmCadAlteradorXTipoImovelMT, False);
end;

procedure TfrmPrincipal.miResiduoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecResiduo, TfrmExecResiduo, False);
end;

procedure TfrmPrincipal.miExecImportaBaixaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecImportaBaixa, TfrmExecImportaBaixa, False);
end;

procedure TfrmPrincipal.miResponsavelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaResponsavelMT, TfrmPessoaResponsavelMT, False);
end;

procedure TfrmPrincipal.miImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadImovelMT, TfrmCadImovelMT, False);
end;



procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var RptAlienacao :TCtrlRptAlienacao;
begin
  inherited;
  RptAlienacao := TCtrlRptAlienacao.Create;
  Try
     Printed := ShowReport(IdReports, RptAlienacao);
     RptAlienacao.Free;
  Except
     RptAlienacao.Free;
     Raise;
  End;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  Case IdReports of
    3694  : FrmPreviewReports := TcfgRelPrevImob.Create(Self);
    3695  : FrmPreviewReports := TcfgRelParamContab.Create(Self);
    3963  : FrmPreviewReports := TcfgRelFolhaAlienacao.Create(Self);
    20162 : FrmPreviewReports := TcfgRelPerdas.Create(Self);
    20165 : FrmPreviewReports := TcfgRelPerdasDiarias.Create(Self);
    20178 : FrmPreviewReports := TcfgRelEstoqueFinanceiro.Create(Self);
    20198 : FrmPreviewReports := TcfgRelAbonos.Create(Self);
    20332 : FrmPreviewReports := TcfgRelMovimContabil.Create(Self);
  Else
    FrmPreviewReports := nil;
  End;
  inherited;
end;


procedure TfrmPrincipal.AcertaClausulaSQL(dtmReport: TdtmReports);
var
   iFor, iPos: integer;
   sSql: string;
begin
   iFor := 0;
   while iFor <= dtmReport.ComponentCount - 1 do begin
      if TObject(dtmReport.Components[iFor]).ClassType = TwwQuery then begin
         sSql := TwwQuery(dtmReport.FindComponent(dtmReport.Components[iFor].Name)).SQL.Text;
         iPos := pos('1=2 AND', sSql);
         // achada a expressão "1=2 AND" = EXCLUI-LA
         while iPos > 1 do begin
            Delete(sSql, iPos, 7);
            TwwQuery(dtmReport.FindComponent(dtmReport.Components[iFor].Name)).SQL.Text := sSql;
            iPos := pos('1=2 AND', sSql);
         end;
      end;
      inc(iFor);
   end;
end;


procedure TfrmPrincipal.mnuDesenhoCartaReajusteClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmDesenhoRelCartaReajuste, TfrmDesenhoRelCartaReajuste, False );
end;

procedure TfrmPrincipal.mnuEmissaoCartaReajusteClick(Sender: TObject);
begin
  inherited;
  AbrirForm( cfgRelCartaReajuste, TcfgRelCartaReajuste, False );
end;

procedure TfrmPrincipal.miExecAssociaDocClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmExecAssociaDoc, TfrmExecAssociaDoc, False );
end;

procedure TfrmPrincipal.miExecCadParamOperacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamOperacaoMT,TfrmCadParamOperacaoMT,False);
end;

procedure TfrmPrincipal.mniFiadoresClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaAvalistaMT,TfrmPessoaAvalistaMT,False);
end;

procedure TfrmPrincipal.miConsultaParcClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaParcela,TfrmConsultaParcela,False);
end;

procedure TfrmPrincipal.miExecEncerraContratoClick(Sender: TObject);
begin
  inherited;
AbrirForm(frmExecEncerraContratoMT,TfrmExecEncerraContratoMT,False);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TdtmFinanciamento, dtmFinanciamento);
   Application.CreateForm(TdtmEventoImovel, dtmEventoImovel);
   Application.CreateForm(TdtmImobiliario, dtmImobiliario);
   Application.CreateForm(TdtmLancImovel, dtmLancImovel);
   Application.CreateForm(TdtmCalcDocumento, dtmCalcDocumento);
   Application.CreateForm(TdtmLookImobiliario, dtmLookImobiliario);
   Application.CreateForm(TdtmCAF, dtmCAF);
   Application.CreateForm(TdtmMS, dtmMS);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,liOrigemCm:Integer;
                                                    DesReport:TObject; var Config: Boolean);
var RptAlienacao : TCtrlRptAlienacao;
begin
   inherited;

// Daniel - 26239 - Início -----------------------------------------------------
   RptAlienacao := TCtrlRptAlienacao.Create;

   try
      Config := ConfigReport(liIdReports,liOrigemCm,RptAlienacao,DesReport);
      RptAlienacao.Free;
   except
      on E: Exception do
      begin
         RptAlienacao.Free;
         if (UpperCase(E.message) <> 'OPERATION ABORTED') then raise;
      end;  // on E: Exception do
   end;  // try..except
// Daniel - 26239 - Fim --------------------------------------------------------

end;

initialization

   Sistema.NomeModulo      := 'Alienação';    // Nome do Módulo
   Sistema.IdModulo        := 135;            // IdModulo cadastrado no SAD
   Sistema.Versao := '3.02.18f';
   Sistema.NomeAplicativo  := 'Alienação';

   Modulo      := TModulo.Create;
   ModuloImobiliario := TCtrlModuloImobiliario.Create;
   IntegraBack := TIntegraBack.Create(True,True,True);


finalization
   Modulo.free;
   ModuloImobiliario.Free;
   IntegraBack.Free;
end.
