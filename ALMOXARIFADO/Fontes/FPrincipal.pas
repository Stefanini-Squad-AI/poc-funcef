{ --------------------------------------------------------------------------------------------------
Rotina......: Bloqueiodeusurios1Click
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Incluir novo form: FrmCadMovXUsu
-------------------------------------------------------------------------------------------------- }

{-------------------------------------------------------------------------------
 Data       : 13.08.2007
 Autor      : Antonio Marcos (amf)
 Pendência  : 26045 - 26051
 Descrição  : Passagem do parâmetro tiAlmox para ser tratado na uctrlParamIntegra.
---------------------------------------------------------------------------------
 Data       : 25.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22546
 Descrição  : Desabilitado o menu 'Geração de Arquivo Texto do SENAC'
----------------------------------------------------------------------------------}

unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
   WwQuery, TB97, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, uModulo, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts,
  StdActns, ActnList, ImgList, fcStatusBar, CMApplicationEvents, Grids,
  DBGrids, SConnect, MConnect, DBClient, uCtrlParamIntegra, uCMTypes,
  uCtrlRptAlmox, uResource, CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Movimentacao1: TMenuItem;
    RequisicaodeMaterial1: TMenuItem;
    ConfirmacaoAtendimento1: TMenuItem;
    Atender1: TMenuItem;
    RequisicoesnaoCadastradas1: TMenuItem;
    RequisicoesjaCadastradas1: TMenuItem;
    NovaRequisicao1: TMenuItem;
    Compra1: TMenuItem;
    NovaSolicitacao1: TMenuItem;
    mnuPoliticaEstoque: TMenuItem;
    Inventrio1: TMenuItem;
    SaldoInicial1: TMenuItem;
    N9: TMenuItem;
    Impostos1: TMenuItem;
    TipodePerda1: TMenuItem;
    N10: TMenuItem;
    Almoxarifado1: TMenuItem;
    UnidadedeCusteio1: TMenuItem;
    N11: TMenuItem;
    Produto1: TMenuItem;
    LocalizaoemEstoque1: TMenuItem;
    N13: TMenuItem;
    Cor1: TMenuItem;
    Tamanho1: TMenuItem;
    UnidadedeMedida1: TMenuItem;
    N14: TMenuItem;
    ItensdeVenda1: TMenuItem;
    Outros1: TMenuItem;
    Insumos1: TMenuItem;
    N15: TMenuItem;
    GrupodeProduto1: TMenuItem;
    N18: TMenuItem;
    MudarCentrodeCustoAlmoxarifado1: TMenuItem;
    N19: TMenuItem;
    AlteracaodeCustoMedio1: TMenuItem;
    Fornecedor1: TMenuItem;
    RamodeFornecedor1: TMenuItem;
    Novo1: TMenuItem;
    Transferncia2: TMenuItem;
    ToolbarSep971: TToolbarSep97;
    Iniciar3: TMenuItem;
    Contagem4: TMenuItem;
    AnaliseAtualizaodeSaldo1: TMenuItem;
    RecebimentodeMercadoria1: TMenuItem;
    ComOC1: TMenuItem;
    SemOC1: TMenuItem;
    PremissasparaGestodeEstoque1: TMenuItem;
    DevoluodeMercadoria1: TMenuItem;
    IntegraoContbildosCustos1: TMenuItem;
    GerarAnalise1: TMenuItem;
    N3: TMenuItem;
    SolicitaoPrPronta1: TMenuItem;
    SolicitaoPrPronta2: TMenuItem;
    SolicitaoAvula1: TMenuItem;
    IntegraoContbildasNotasdeEntrada1: TMenuItem;
    AtualizaodasMovimentaes1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SadaporPerda1: TMenuItem;
    DatadeRepresamento1: TMenuItem;
    MudanadeUnidadedoCustoMdio1: TMenuItem;
    AcompanhamentodeRequisioCadastrada1: TMenuItem;
    N6: TMenuItem;
    ItensdePDV1: TMenuItem;
    ContratodeProduto1: TMenuItem;
    N7: TMenuItem;
    AcertaEntrada1: TMenuItem;
    SaldodosProdutos1: TMenuItem;
    DifernasdeInventriosnoPerodo1: TMenuItem;
    TermodeInvetrio1: TMenuItem;
    AtualizaltimaCompra1: TMenuItem;
    UsurioporAlmoxarifado1: TMenuItem;
    AjustaConversodeUnidadedeMedidanaEntrada1: TMenuItem;
    N8: TMenuItem;
    ProdutosFeitosnaCasa1: TMenuItem;
    N12: TMenuItem;
    GeraSCIAutomtica1: TMenuItem;
    UsuriosporGrupodeProduto1: TMenuItem;
    GeraArquivotextoSENAC: TMenuItem;
    ConsultaSCIOCcomunidadedemedidasinvalidas1: TMenuItem;
    ConsumodosProduto1: TMenuItem;
    NotaFiscaldeDevoluo1: TMenuItem;
    ConfiguraodaNota1: TMenuItem;
    ImpressodaNota1: TMenuItem;
    EstornoIntegraContabCusto: TMenuItem;
    N2: TMenuItem;
    N16: TMenuItem;
    ExclusodeItensPendetesdaSCI1: TMenuItem;
    EdiodeNotaFiscal1: TMenuItem;
    AlteraodeValidadedosProdutos1: TMenuItem;
    Button1: TButton;
    N17: TMenuItem;
    ColetordeDados1: TMenuItem;
    ExportaodeArquivo1: TMenuItem;
    ImportaodeArquivo1: TMenuItem;
    AcompanhamentodeSolicitaodeCompra1: TMenuItem;
    RequsiesConsolidadas1: TMenuItem;
    N1: TMenuItem;
    ConfiguraodeModelosdeHistrico1: TMenuItem;
    Bloqueiodeusurios1: TMenuItem;
    N20: TMenuItem;
    Recebimentosconsolidados1: TMenuItem;
    procedure GrupodeProduto1Click(Sender: TObject);
    procedure Insumos1Click(Sender: TObject);
    procedure Outros1Click(Sender: TObject);
    procedure ItensdeVenda1Click(Sender: TObject);
    procedure UnidadedeMedida1Click(Sender: TObject);
    procedure Tamanho1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure UnidadedeCusteio1Click(Sender: TObject);
    procedure Impostos1Click(Sender: TObject);
    procedure TipodePerda1Click(Sender: TObject);
    procedure LocalizaoemEstoque1Click(Sender: TObject);
    procedure MudarCentrodeCustoAlmoxarifadoClick(Sender: TObject);
    procedure RequisicoesnaoCadastradas1Click(Sender: TObject);
    procedure SaldoInicial1Click(Sender: TObject);
    procedure NovaRequisicao1Click(Sender: TObject);
    procedure RequisicoesjaCadastradas1Click(Sender: TObject);
    procedure ConfirmacaoAtendimento1Click(Sender: TObject);
    procedure AtendimentodeReqjCadastradas1Click(Sender: TObject);
    procedure sbtnMudaCentroCustoClick(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure RamodeFornecedor1Click(Sender: TObject);
    procedure mnuAjudaIndiceClick(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Transferncia2Click(Sender: TObject);
    procedure Iniciar3Click(Sender: TObject);
    procedure Contagem4Click(Sender: TObject);
    procedure AnaliseAtualizaodeSaldo1Click(Sender: TObject);
    procedure ComOC1Click(Sender: TObject);
    procedure SemOC1Click(Sender: TObject);
    procedure PremissasparaGestodeEstoque1Click(Sender: TObject);
    procedure DevoluodeMercadoria1Click(Sender: TObject);
    procedure IntegraoContbildosCustos1Click(Sender: TObject);
    procedure GerarAnalise1Click(Sender: TObject);
    procedure SolicitaoPrPronta1Click(Sender: TObject);
    procedure SolicitaoPrPronta2Click(Sender: TObject);
    procedure SolicitaoAvula1Click(Sender: TObject);
    procedure AlteracaodeCustoMedio1Click(Sender: TObject);
    procedure AtualizaodasMovimentaes1Click(Sender: TObject);
    procedure SadaporPerda1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure DatadeRepresamento1Click(Sender: TObject);
    procedure AcertaEntradas1Click(Sender: TObject);
    procedure MudanadeUnidadedoCustoMdio1Click(Sender: TObject);
    procedure AcompanhamentodeRequisioCadastrada1Click(Sender: TObject);
    procedure ItensdePDV1Click(Sender: TObject);
    procedure ContratodeProduto1Click(Sender: TObject);
    procedure AcertaEntrada1Click(Sender: TObject);
    procedure SaldodosProdutos1Click(Sender: TObject);
    procedure DifernasdeInventriosnoPerodo1Click(Sender: TObject);
    procedure TermodeInvetrio1Click(Sender: TObject);
    procedure AtualizaltimaCompra1Click(Sender: TObject);
    procedure UsurioporAlmoxarifado1Click(Sender: TObject);
    procedure AjustaConversodeUnidadedeMedidanaEntrada1Click(
      Sender: TObject);
    procedure ProdutosFeitosnaCasa1Click(Sender: TObject);
    procedure GeraSCIAutomtica1Click(Sender: TObject);
    procedure UsuriosporGrupodeProduto1Click(Sender: TObject);
    procedure GeraArquivotextoSENACClick(Sender: TObject);
    procedure ConsultaSCIOCcomunidadedemedidasinvalidas1Click(
      Sender: TObject);
    procedure ConsumodosProduto1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure ConfiguraodaNota1Click(Sender: TObject);
    procedure ImpressodaNota1Click(Sender: TObject);
    procedure EstornoIntegraContabCustoClick(Sender: TObject);
    procedure ExclusodeItensPendetesdaSCI1Click(Sender: TObject);
    procedure EdiodeNotaFiscal1Click(Sender: TObject);
    procedure AlteraodeValidadedosProdutos1Click(Sender: TObject);
    procedure ExportaodeArquivo1Click(Sender: TObject);
    procedure ImportaodeArquivo1Click(Sender: TObject);
    procedure AcompanhamentodeSolicitaodeCompra1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure RequsiesConsolidadas1Click(Sender: TObject);
    procedure ConfiguraodeModelosdeHistrico1Click(Sender: TObject);
    procedure Bloqueiodeusurios1Click(Sender: TObject);
    procedure Recebimentosconsolidados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

Uses
  uIntegraBack,
  UAutorizacao,     uMensErro, USistema, FTelaAut,uCtrlArtigo,
  FSoliComp2,
  FParamAlmox,
  FAtendReqCad,     FUsuxCCusto,       FConfAtend,       FCadForne,
  FCadRamoFor,      FRequiscao,        FIniContagem,
  FContagem,        FAnaliseInv,       FMTloginCCusto,
  FAnalEstoque,     FAtendPrePronta,
  FAcertaEntrada,
  dBaseDados,
  FImpSaldo,        FDataRepresa,     FMudaUn,
  FAcompReqCad,
  FConsDifInvent,   FAjustaConv,      FGeraSCIAuto,     FAcertaFuncef,
  FCadUsuxGrpProd,  fAjustaSCI,       FViewConsumo,
  DRelatoriosAlmox, DRptRelats,        FConfigNFDevol,   FImpNFDevol,
  FNotaFiscal,         FApagaProdMov, FMTSenac,
  FAltValidade, FMTReqManual,FMTExportArqInvent, FMTIniContagem,FMTCadUnidMedida,
  FMTContagem, FMTAnaliseInvent, FMTImportArqInvent, FMTAlteraCustoMed,
  FMtCadGrupoProd, FMTCadArtigo, FMtCadTamanho, FMtCadCor,
  FMtCadUnidCusteio, FMtCadCustAgregado, FMtCadAlmoxarifado,
  FMtCadSCPrePronta, FMtCadContratoProd, FMTCadTermo, FMTCadTipoPerda,
  FMTCadPremiGestEst, FMTCadLocal, FAlteraCustoMed, FAtuUltCompra,
  FMTBaixaPerda, FMTCadReq, FMTConsultaSaldo, FMTConsDifInvent,
  FMTViewConsumo, FMTAcompReqCad, FMTDataRepresa, FMTAtendReqCad,
  FMTConfAtend, FMTAtualizaMov, FMTCadUsuxGrpProd, FMTTransfAlmox,
  FMTCadUsuxAlmox, FMTProdCasa, FMTIntegraContab, FMTMudaUn,
  FMTExtornaIntContab,fCadGrupoProd, FCadReq, FLogCCusto, FTransfAlmox,
  FAtualizaMov, FBaixaPerda, FCadUsuxAlmox, FProdCasa,
  FMTAcompSCI, fMTParamAlmox, FMTImpSaldo, FMTAtuUltCompra,
  FMTAltValidade, FMTApagaItemSCI, FMTAtendPrePronta, FMTGeraSCIAuto,
  FMTRecebMerc, FMTAnalEstoque, FMTDevolMerc, FMTConfigNFDevol,
  FMTImpNFDevol, FMTConsolidaReq, FMTConfigHistAlmox, FCadMovXUsu,
  FMTConsolidaRec;

{$R *.DFM}

procedure TfrmPrincipal.GrupodeProduto1Click(Sender: TObject);
begin
   inherited;
   If Trim(Modulo.sMascaraGrupoProd) <> '' then
      AbrirForm(FrmMtCadGrupoProd,TFrmMtCadGrupoProd,False)
   else
      ShowMessage('Não existe mascara de grupo de produto cadastrado '+
                  'configure os parametros do sistema');
end;

procedure TfrmPrincipal.Insumos1Click(Sender: TObject);
begin
   inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taInsumo;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext           := 50044;
  FrmMTCadArtigo.bbtnAjuda.HelpContext := 50044;
  FrmMTCadArtigo.Show;
end;

procedure TfrmPrincipal.Outros1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taOutros;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext           := 50045;
  FrmMTCadArtigo.bbtnAjuda.HelpContext := 50045;
  FrmMTCadArtigo.Show;

end;

procedure TfrmPrincipal.ItensdeVenda1Click(Sender: TObject);
begin
   inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taItemVenda;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext           := 50046;
  FrmMTCadArtigo.bbtnAjuda.HelpContext := 50046;
  FrmMTCadArtigo.Show;
end;

procedure TfrmPrincipal.ItensdePDV1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taItemPDV;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext           := 50047;
  FrmMTCadArtigo.bbtnAjuda.HelpContext := 50047;
  FrmMTCadArtigo.Show;
end;

procedure TfrmPrincipal.UnidadedeMedida1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadUnidMedida,TFrmMTCadUnidMedida,False);
end;

procedure TfrmPrincipal.Tamanho1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMtCadTamanho,TFrmMtCadTamanho,False);
end;

procedure TfrmPrincipal.Cor1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMtCadCor,TFrmMtCadCor,False);
end;

procedure TfrmPrincipal.UnidadedeCusteio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMTCadUnidCusteio,TFrmMTCadUnidCusteio,False);
end;

procedure TfrmPrincipal.Impostos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmMtCadCustAgregado,TFrmMtCadCustAgregado,False);
end;

procedure TfrmPrincipal.TipodePerda1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTCadTipoPerda,TfrmMTCadTipoPerda,False);
end;

procedure TfrmPrincipal.LocalizaoemEstoque1Click(Sender: TObject);
begin
  inherited;
  if Modulo.iCodAlmoxa <> -1 then
     AbrirForm(frmMTCadLocal,TfrmMTCadLocal,False)
  else
     MsgDlg('Almoxarifado não selecionado na entrada do Sistema. Indicação da Localização não permitida.', 'Erro', mtError, [mbOk, mbHelp], 0);

end;

procedure TfrmPrincipal.MudarCentrodeCustoAlmoxarifadoClick(
  Sender: TObject);
Var
  bPodeLogar : Boolean;
begin
    inherited;
     Application.CreateForm(TfrmMTLoginCCusto,FrmMTLoginCCusto);
     bPodeLogar := FrmMTLoginCCusto.bPodeLogar;
     FrmMTLoginCCusto.ShowModal;
     If Not bPodeLogar Then
        Application.Terminate;
     if Modulo.iCodAlmoxa = -1 //mostrar o Centro de Custo
     then begin
      if Modulo.sCodCCusto <> ''
      then stbarStatusbar.Panels[0].Text := Sistema.NomeFantasia +' - '+Modulo.sDescCCusto
   end
   else //mostrar o almoxarifado
      stbarStatusbar.Panels[0].Text := Sistema.NomeFantasia +' - '+Modulo.sAlmoxaUsuario;

end;

procedure TfrmPrincipal.RequisicoesnaoCadastradas1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(frmMTReqManual,TfrmMTReqManual,False);
end;

procedure TfrmPrincipal.SaldoInicial1Click(Sender: TObject);
begin
   inherited;
  if Modulo.iCodAlmoxa <> -1 then
     AbrirForm(frmMTImpSaldo,TfrmMTImpSaldo,False)
  else
     MsgDlg('Almoxarifado não selecionado na entrada do Sistema. Implantação de Saldo não permitida.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.NovaRequisicao1Click(Sender: TObject);
begin
  inherited;  {Se o usuario (quem está requisitando o Material nao tiver Almoxa nao pode
               requisitar material}
  if (Modulo.sCodCCusto <> '') or (Modulo.iCodAlmoxa <> -1) then
     AbrirForm(frmMTCadReq,TfrmMTCadReq,False)
  else
     MsgDlg('Usuário sem Centro de Custo. Requisição de Material não permitida.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.RequisicoesjaCadastradas1Click(Sender: TObject);
begin
   inherited;
   if Modulo.iCodAlmoxa <> -1 then
      AbrirForm(frmMTAtendReqCad,TfrmMTAtendReqCad,False)
   else
      MsgDlg('Almoxarifado nao informado. Atendimento não permitido.', 'Erro', mtError, [mbOk, mbHelp], 0);

end;

procedure TfrmPrincipal.ConfirmacaoAtendimento1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTConfAtend,TfrmMTConfAtend,False);
end;

procedure TfrmPrincipal.AtendimentodeReqjCadastradas1Click(Sender: TObject);
begin
   inherited;
   if Modulo.iCodAlmoxa <> -1 then
      AbrirForm(frmMTAtendReqCad,TfrmMTAtendReqCad,False)
   else
      MsgDlg('Almoxarifado nao informado. Atendimento não permitido.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.sbtnMudaCentroCustoClick(Sender: TObject);
begin
  inherited;
  MudarCentrodeCustoAlmoxarifado1.Click;

end;

procedure TfrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadForne,TfrmCadForne,False);
end;

procedure TfrmPrincipal.RamodeFornecedor1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRamoFor,TfrmCadRamoFor,False);
end;

procedure TfrmPrincipal.mnuAjudaIndiceClick(Sender: TObject);
begin
  inherited;
   Application.helpcommand(help_contents,0);
end;

procedure TfrmPrincipal.Novo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMtCadAlmoxarifado,TFrmMtCadAlmoxarifado,False);
end;

procedure TfrmPrincipal.Transferncia2Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTTransfAlmox,TFrmMTTransfAlmox,False);
end;

procedure TfrmPrincipal.Iniciar3Click(Sender: TObject);
begin
  inherited;
  if Modulo.iCodAlmoxa <> -1 then
       AbrirForm(FrmMTIniContagem,TFrmMTIniContagem,False)
  else
     MsgDlg('Almoxarifado não selecionado na entrada do Sistema. Inventário não permitido.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.Contagem4Click(Sender: TObject);
begin
  inherited;

  if Modulo.iCodAlmoxa <> -1 then
     AbrirForm(FrmMTContagem,TFrmMTContagem,False)
  else
     MsgDlg('Almoxarifado não selecionado na entrada do Sistema. Inventário não permitido.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.AnaliseAtualizaodeSaldo1Click(Sender: TObject);
begin
  inherited;
  if Modulo.iCodAlmoxa <> -1 then
     AbrirForm(FrmMTAnaliseInvent,TFrmMTAnaliseInvent,False)
  else
     MsgDlg('Almoxarifado não selecionado na entrada do Sistema. Inventário não permitido.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.ComOC1Click(Sender: TObject);
begin
  inherited;
  Modulo.sComSemOC:='C';
  If Not Sistema.UsaPlanoPatro Then
      AbrirForm(FrmMTRecebMerc,TFrmMTRecebMerc,False)
  Else
  If (Sistema.UsaPlanoPatro) And ((Modulo.iIdPatro > 0 ) Or ((Modulo.iIdPlanoPrev >0)))
  Then
    AbrirForm(FrmMTRecebMerc,TFrmMTRecebMerc,False)
  Else
     MsgDlg('Porfavor preencha os parâmetros Plano e Patrocinadora', 'Erro', mtError, [mbOk], 0);
End;

procedure TfrmPrincipal.SemOC1Click(Sender: TObject);
begin
  inherited;
  Modulo.sComSemOC:='S';
  If Not Sistema.UsaPlanoPatro Then
      AbrirForm(FrmMTRecebMerc,TFrmMTRecebMerc,False)
  Else
  If (Sistema.UsaPlanoPatro) And ((Modulo.iIdPatro > 0 ) Or ((Modulo.iIdPlanoPrev >0)))
  Then
      AbrirForm(FrmMTRecebMerc,TFrmMTRecebMerc,False)
  Else
     MsgDlg('Por favor preencha o Plano e Patrocinadora', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.PremissasparaGestodeEstoque1Click(Sender: TObject);
begin
  inherited;
  if Modulo.iCodAlmoxa <> -1 then
     AbrirForm(FrmMTCadPremiGestEst,TFrmMTCadPremiGestEst,False)
  else
     MsgDlg('Almoxarifado não selecionado na entrada do Sistema. Indicação das Premissas para Gestão de Estoque não permitida.', 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmPrincipal.DevoluodeMercadoria1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTDevolMerc,TFrmMTDevolMerc,False);
end;

procedure TfrmPrincipal.IntegraoContbildosCustos1Click(Sender: TObject);
begin
  inherited;
  If Not Sistema.UsaPlanoPatro Then
     AbrirForm(FrmMTIntegraContab,TFrmMTIntegraContab,False)
  Else
  If (Sistema.UsaPlanoPatro) And ((Modulo.iIdPatro > 0 ) Or ((Modulo.iIdPlanoPrev >0)))
  Then
     AbrirForm(FrmMTIntegraContab,TFrmMTIntegraContab,False)
  Else
     MsgDlg('Porfavor preencha os parâmetros Plano e Patrocinadora', 'Erro', mtError, [mbOk], 0);
end;

procedure TfrmPrincipal.GerarAnalise1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTAnalEstoque,TFrmMTAnalEstoque,False);
end;

procedure TfrmPrincipal.SolicitaoPrPronta1Click(Sender: TObject);
begin
  inherited;
  if Modulo.sPrincSec = 'S' Then
     Begin
         MsgDlg('Almoxarifado não é Principal. Requisição Pré-Pronta não é permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
     End;
   AbrirForm(FrmMtCadSCPrePronta,TFrmMtCadSCPrePronta,False);
end;

procedure TfrmPrincipal.SolicitaoPrPronta2Click(Sender: TObject);
begin
  inherited;
   if Modulo.sCodCCusto = '' then Exit;
   if Modulo.iCodAlmoxa = -1 then
   begin
      { Msg - Almoxarifado não informado }
      MsgDlg('Almoxarifado não informado. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
   if Modulo.sPrincSec = 'S' Then
   begin
      MsgDlg('Almoxarifado não é Principal. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
      AbrirForm(FrmMTAtendPrePronta ,TFrmMTAtendPrePronta,False);
end;

procedure TfrmPrincipal.SolicitaoAvula1Click(Sender: TObject);
begin
  inherited;
   Modulo.bVeioAnalise := False;
   { Se o usuario (quem está requisitando o Material) nao tiver Almoxa nao pode
   solicitar compra}
   if Modulo.sCodCCusto = '' then Exit;
   if Modulo.iCodAlmoxa = -1  then begin
      { Msg - Almoxarifado não informado }
      MsgDlg('Almoxarifado não informado. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
   if Modulo.sPrincSec = 'S' Then
   begin
      MsgDlg('Almoxarifado não é Principal. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
   AbrirForm(frmSoliComp2,TfrmSoliComp2,False);
end;

procedure TfrmPrincipal.AlteracaodeCustoMedio1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTAlteraCustoMed,TFrmMTAlteraCustoMed,False);
end;

procedure TfrmPrincipal.AtualizaodasMovimentaes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTAtualizaMov,TFrmMTAtualizaMov,False);
end;

procedure TfrmPrincipal.SadaporPerda1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTBaixaPerda,TFrmMTBaixaPerda,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTParamAlmox,TfrmMTParamAlmox,False);
end;

procedure TfrmPrincipal.DatadeRepresamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTDataRepresa,TFrmMTDataRepresa,False);
end;

procedure TfrmPrincipal.AcertaEntradas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAcertaEntrada,TFrmAcertaEntrada,False);
end;

procedure TfrmPrincipal.MudanadeUnidadedoCustoMdio1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTMudaUn,TFrmMTMudaUn,False);
end;

procedure TfrmPrincipal.AcompanhamentodeRequisioCadastrada1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTAcompReqCad,TFrmMTAcompReqCad,False);
end;

procedure TfrmPrincipal.ContratodeProduto1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmMtCadContratoProd,TFrmMtCadContratoProd,False);
end;

procedure TfrmPrincipal.AcertaEntrada1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAcertaEntrada,TFrmAcertaEntrada,False);
end;

procedure TfrmPrincipal.SaldodosProdutos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConsultaSaldo,TFrmMTConsultaSaldo,False);
end;

procedure TfrmPrincipal.DifernasdeInventriosnoPerodo1Click(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTConsDifInvent,TFrmMTConsDifInvent,False);
end;

procedure TfrmPrincipal.TermodeInvetrio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadTermo,TFrmMTCadTermo,False);
end;

procedure TfrmPrincipal.AtualizaltimaCompra1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTAtuUltCompra,TFrmMTAtuUltCompra,False);
end;

procedure TfrmPrincipal.UsurioporAlmoxarifado1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadUsuxAlmox,TFrmMTCadUsuxAlmox,False);
end;

procedure TfrmPrincipal.AjustaConversodeUnidadedeMedidanaEntrada1Click(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmAjustaConv,TFrmAjustaConv,False);
end;

procedure TfrmPrincipal.ProdutosFeitosnaCasa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTProdCasa,TFrmMTProdCasa,False);
end;

procedure TfrmPrincipal.GeraSCIAutomtica1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTGeraSCIAuto,TFrmMTGeraSCIAuto,False);
end;

procedure TfrmPrincipal.UsuriosporGrupodeProduto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadUsuxGrpProd,TFrmMTCadUsuxGrpProd,False);
end;

procedure TfrmPrincipal.GeraArquivotextoSENACClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTSenac,TFrmMTSenac,False);
end;

procedure TfrmPrincipal.ConsultaSCIOCcomunidadedemedidasinvalidas1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAjustaSCI,TfrmAjustaSCI,False);
end;

procedure TfrmPrincipal.ConsumodosProduto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTViewConsumo,TFrmMTViewConsumo,False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;
   If Sistema.FezLogin Then
     Begin
       Modulo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);

       MudarCentrodeCustoAlmoxarifado1.Click;

       IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB','P');
       IntegraBack.RecPag := 'P';


       ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiAlmox);

       Modulo.AtualizarParametros(Sistema.IdEmpresa,
                                   Sistema.IdUsuario);
       Modulo.AtualizarParamIntegracao(Sistema.IdEmpresa);

       If Sistema.ConnectionSide = cnsServer Then
          Modulo.SetAssinatura;
     end;
  MnuConsPart_Padrao.Visible    := False;
  Mnu_UsoPessoal_Padrao.Visible := False;
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelatoriosAlmox, dtmRelatoriosAlmox);
  Application.CreateForm(TdtmRptRelats, dtmRptRelats);
end;

procedure TfrmPrincipal.ConfiguraodaNota1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConfigNFDevol,TFrmMTConfigNFDevol,False);
end;

procedure TfrmPrincipal.ImpressodaNota1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTImpNFDevol,TFrmMTImpNFDevol,False);
end;

procedure TfrmPrincipal.EstornoIntegraContabCustoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTExtornaIntContab,TFrmMTExtornaIntContab,False);
end;

procedure TfrmPrincipal.ExclusodeItensPendetesdaSCI1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTApagaItemSCI,TFrmMTApagaItemSCI,False);
end;

procedure TfrmPrincipal.EdiodeNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmNotaFiscal,TFrmNotaFiscal,False);
end;

procedure TfrmPrincipal.AlteraodeValidadedosProdutos1Click(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmMTAltValidade,TFrmMTAltValidade,False)
end;

procedure TfrmPrincipal.ExportaodeArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTExportArqInvent,TFrmMTExportArqInvent,False);
end;

procedure TfrmPrincipal.ImportaodeArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTImportArqInvent,TFrmMTImportArqInvent,False);
end;

procedure TfrmPrincipal.AcompanhamentodeSolicitaodeCompra1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTAcompSCI,TFrmMTAcompSCI,False);
end;

procedure TfrmPrincipal.RequsiesConsolidadas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConsolidaReq,TFrmMTConsolidaReq,False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var  RptAlmox :TCtrlRptAlmox;
begin
   inherited;
   RptAlmox := TCtrlRptAlmox.Create;
   Try
      Printed := ShowReport(IdReports, RptAlmox);
      RptAlmox.Free;
   Except
      RptAlmox.Free;
      Raise;
   End;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
Var  RptAlmox :TCtrlRptAlmox;
begin
   inherited;
   RptAlmox := TCtrlRptAlmox.Create;
   Try
      Config := ConfigReport(liIdReports,liOrigemCm,RptAlmox,DesReport);
      RptAlmox.Free;
   Except
      RptAlmox.Free;
      Raise;
   End;
end;

procedure TfrmPrincipal.ConfiguraodeModelosdeHistrico1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConfigHistAlmox,TFrmMTConfigHistAlmox,False);

end;

procedure TfrmPrincipal.Bloqueiodeusurios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadMovXUsu,TFrmCadMovXUsu, False);
end;

procedure TfrmPrincipal.Recebimentosconsolidados1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConsolidaRec,TFrmMTConsolidaRec,False);
end;

initialization
   Sistema.NomeModulo := 'Almoxarifado';        // Nome do Módulo
   Sistema.IdModulo   := 5 ;                    // IdModulo cadastrado no SAD
   Sistema.Versao := '3.05.14d';
   Sistema.NomeAplicativo := 'Almoxarifado e Custos';

   IntegraBack := TIntegraBack.Create(True,True,True);
   Modulo      := TModulo.Create;

   IntegraBack.RecPag    := 'P';

finalization
   Modulo.free;
end.





