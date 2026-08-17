{----------------------------------------------------------------------------------
 Data       : 13.08.2007
 Autor      : Antonio Marcos (amf)
 Pendência  : 26045 - 26051
 Descrição  : Passagem do parâmetro tiAlmox para ser tratado na uctrlParamIntegra.
-----------------------------------------------------------------------------------}

unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls,  TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient, uCtrlParamIntegra,
  uResource, CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    N3: TMenuItem;
    UsuriosporAlmoxarifado1: TMenuItem;
    Compras1: TMenuItem;
    CaixaPequeno1: TMenuItem;
    Produto1: TMenuItem;
    N4: TMenuItem;
    UnidadedeCusteio1: TMenuItem;
    Almoxarifado1: TMenuItem;
    Compradores1: TMenuItem;
    Imposto1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Fornecedor1: TMenuItem;
    SolicitaesPrPronta1: TMenuItem;
    GrupodeProduto1: TMenuItem;
    N7: TMenuItem;
    ArtigosxFornecedores1: TMenuItem;
    Insumos1: TMenuItem;
    Outros1: TMenuItem;
    ItensdeVenda1: TMenuItem;
    N8: TMenuItem;
    UnidadedeMedida1: TMenuItem;
    Tamanho1: TMenuItem;
    Cor1: TMenuItem;
    Cadastro1: TMenuItem;
    UsuriosporCaixasPequenos1: TMenuItem;
    Lanamentos1: TMenuItem;
    ConsultaLanamentos1: TMenuItem;
    N9: TMenuItem;
    EfetivaodeLanamento1: TMenuItem;
    SolicitaodeCompra1: TMenuItem;
    N10: TMenuItem;
    Avulsa1: TMenuItem;
    PrPronta1: TMenuItem;
    AtribuirComprador1: TMenuItem;
    ProcessodeCompras1: TMenuItem;
    SumriodeCotao1: TMenuItem;
    OCsemCotao1: TMenuItem;
    N11: TMenuItem;
    Contrato1: TMenuItem;
    Cotao1: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    CancelamentodeOC1: TMenuItem;
    N15: TMenuItem;
    ConsultaOC1: TMenuItem;
    ConsultaSumriodaCotao1: TMenuItem;
    VisualizaltimasCompras1: TMenuItem;
    UsuriosporGrupodeProduto1: TMenuItem;
    N1: TMenuItem;
    ExclusodeItensPendetesdaSCI1: TMenuItem;
    Button1: TButton;
    AcompanhamentodeSolicitaodeCompra1: TMenuItem;
    ExcluiEfetivaodeLanamento1: TMenuItem;
    ConsultadeRecebimentodeMercadoria1: TMenuItem;
    procedure UsuriosporAlmoxarifado1Click(Sender: TObject);
    procedure GrupodeProduto1Click(Sender: TObject);
    procedure Insumos1Click(Sender: TObject);
    procedure Outros1Click(Sender: TObject);
    procedure ItensdeVenda1Click(Sender: TObject);
    procedure UnidadedeMedida1Click(Sender: TObject);
    procedure Tamanho1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure UnidadedeCusteio1Click(Sender: TObject);
    procedure Almoxarifado1Click(Sender: TObject);
    procedure Imposto1Click(Sender: TObject);
    procedure SolicitaesPrPronta1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Avulsa1Click(Sender: TObject);
    procedure PrPronta1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure UsuriosporCaixasPequenos1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure ConsultaLanamentos1Click(Sender: TObject);
    procedure EfetivaodeLanamento1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure Compradores1Click(Sender: TObject);
    procedure ArtigosxFornecedores1Click(Sender: TObject);
    procedure AtribuirComprador1Click(Sender: TObject);
    procedure ProcessodeCompras1Click(Sender: TObject);
    procedure Cotao1Click(Sender: TObject);
    procedure SumriodeCotao1Click(Sender: TObject);
    procedure OCsemCotao1Click(Sender: TObject);
    procedure CancelamentodeOC1Click(Sender: TObject);
    procedure ConsultaOC1Click(Sender: TObject);
    procedure ConsultaSumriodaCotao1Click(Sender: TObject);
    procedure VisualizaltimasCompras1Click(Sender: TObject);
    procedure UsuriosporGrupodeProduto1Click(Sender: TObject);
    procedure fcLabel2Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure ExclusodeItensPendetesdaSCI1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AcompanhamentodeSolicitaodeCompra1Click(Sender: TObject);
    procedure ExcluiEfetivaodeLanamento1Click(Sender: TObject);
    procedure ConsultadeRecebimentodeMercadoria1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPrincipal : TfrmPrincipal;


implementation

uses uModulo, dBaseDados, FCadForne, FMtloginCCusto, uMEnsErro, uCtrlArtigo,
     uIntegraBack,   FCadUsuxAlmox,FSoliPrePronta,
     FSoliComp2,     FAtendPrePronta, FParamCompras,
     FCotacao, FCadUsuxGrpProd,DRelCompras, RControleOC,
     RCxPeqR,  RCotProdxForn,  FApagaItemSCI,  FMtCadArtigo,
     FMtCadUnidCusteio, FMtCadUnidMedida, FMtCadTamanho, FMtCadCor,
     FMTCadComprador, FMtCadContratoProd, FMtCadArtxForn, FMtCadGrupoProd,
     FMtCadSCPrePronta,  FMtCadCustAgregado, FMtSoliCompra,
     FMtAtribComprador, FMtMontaProcesso,  FMTCotacao, FMTSumarioCot,
     FMtCadAlmoxarifado, FMTCadOCSemCot,  FMTCancelaOC, FMTViewUltCompra,
     fCadGrupoProd, FLogCCusto, FMTAcompSCI, FMTParamCompras,
  FMTApagaItemSCI, FMTCadCaixaPeq, FMTLancCaixaPeq, FMTConsCaixaPeq,
  FMTUsuxCaixaPeq, FMTEfetivCaixaPeq,fMTExcluiEfetCxPeq,FMTConsultaRecMerc,
  FMTAtendPrePronta, FMTCadUsuxGrpProd;

{$R *.DFM}


procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  bPodeLogar : Boolean;
begin
   inherited;
     If Sistema.FezLogin Then
       Begin
          Modulo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);

          Application.CreateForm(TfrmMTLoginCCusto,FrmMTLoginCCusto);
          bPodeLogar := FrmMTLoginCCusto.bPodeLogar;
          FrmMTLoginCCusto.ShowModal;

          If Not bPodeLogar Then
             Application.Terminate;
          if Modulo.iCodAlmoxa = -1 //mostrar o Centro de Custo
          then begin
             if Modulo.sCodCCusto <> ''
             then stbarStatusbar.Panels[0].Text := stbarStatusbar.Panels[0].Text +' - '+Modulo.sDescCCusto
           end
           else //mostrar o almoxarifado
           stbarStatusbar.Panels[0].Text := stbarStatusbar.Panels[0].Text +' - '+Modulo.sAlmoxaUsuario;


         ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCompras);

         Integraback.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB','P');
         Integraback.RecPag := 'P';
         Modulo.AtualizarParametros( Sistema.idEmpresa );
       End;

  MnuConsPart_Padrao.Visible    := False;
  Mnu_UsoPessoal_Padrao.Visible := False;
end;


procedure TfrmPrincipal.UsuriosporAlmoxarifado1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadUsuxAlmox,TFrmCadUsuxAlmox,False);
end;

procedure TfrmPrincipal.GrupodeProduto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMtCadGrupoProd,TFrmMtCadGrupoProd,False);
end;

procedure TfrmPrincipal.Insumos1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taInsumo;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext            := 50044;
  FrmMTCadArtigo.bbtnAjuda.HelpContext  := 50044;
  FrmMTCadArtigo.Show;

end;

procedure TfrmPrincipal.Outros1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taOutros;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext            := 50045;
  FrmMTCadArtigo.bbtnAjuda.HelpContext  := 50045;
  FrmMTCadArtigo.Show;
end;

procedure TfrmPrincipal.ItensdeVenda1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmMTCadArtigo,FrmMTCadArtigo);
  FrmMTCadArtigo.TipoArtigo := taItemVenda;
  FrmMTCadArtigo.sContabGrupo := Modulo.sContabGrupo;
  FrmMTCadArtigo.HelpContext            := 50046;
  FrmMTCadArtigo.bbtnAjuda.HelpContext  := 50046;
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

procedure TfrmPrincipal.Contrato1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmMtCadContratoProd,TFrmMtCadContratoProd,False);
end;

procedure TfrmPrincipal.UnidadedeCusteio1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmMTCadUnidCusteio,TFrmMTCadUnidCusteio,False);
end;

procedure TfrmPrincipal.Almoxarifado1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmMtCadAlmoxarifado,TFrmMtCadAlmoxarifado,False);
end;

procedure TfrmPrincipal.Imposto1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmMtCadCustAgregado,TFrmMtCadCustAgregado,False);
end;

procedure TfrmPrincipal.SolicitaesPrPronta1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMtCadSCPrePronta,TFrmMtCadSCPrePronta,False);
end;

procedure TfrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadForne,TfrmCadForne,False);
end;

procedure TfrmPrincipal.Avulsa1Click(Sender: TObject);
begin
  inherited;
   Modulo.bVeioAnalise := False;
   if Modulo.sCodCCusto = '' then Exit;
   if Modulo.iCodAlmoxa = -1 then
   begin
      MsgDlg('Almoxarifado não informado. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
   if Modulo.sPrincSec = 'S' Then
   begin
      MsgDlg('Almoxarifado não é Principal. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
  AbrirForm(FrmSoliComp2,TFrmSoliComp2,False);
end;

procedure TfrmPrincipal.PrPronta1Click(Sender: TObject);
begin
  inherited;
   if Modulo.sCodCCusto = '' then Exit;
   if Modulo.iCodAlmoxa = -1 then
   begin
      MsgDlg('Almoxarifado não informado. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
   if Modulo.sPrincSec = 'S' Then
   begin
      MsgDlg('Almoxarifado não é Principal. Solicitação não permitida', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   end;
    AbrirForm(FrmMTAtendPrePronta,TFrmMTAtendPrePronta,False);
end;

procedure TfrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadCaixaPeq,TFrmMTCadCaixaPeq,False);
end;

procedure TfrmPrincipal.UsuriosporCaixasPequenos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTUsuxCaixaPeq,TFrmMTUsuxCaixaPeq,False);
end;

procedure TfrmPrincipal.Lanamentos1Click(Sender: TObject);
begin
  inherited;
  If (Not Sistema.UsaPlanoPatro) Then
    AbrirForm(FrmMTLancCaixaPeq,TFrmMTLancCaixaPeq,False)
  Else
  If (Sistema.UsaPlanoPatro) And ((Modulo.iIdPatro > 0 ) Or ((Modulo.iIdPlanoPrev >0)))
  Then
    AbrirForm(FrmMTLancCaixaPeq,TFrmMTLancCaixaPeq,False)
  Else
    MsgDlg('Por favor preencha os parâmetros Plano e Patrocinadora, no sistema Almoxarifado', 'Erro', mtError, [mbOk], 0);
end;

procedure TfrmPrincipal.ConsultaLanamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConsCaixaPeq,TFrmMTConsCaixaPeq,False);
end;

procedure TfrmPrincipal.EfetivaodeLanamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTEfetivCaixaPeq,TFrmMTEfetivCaixaPeq,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTParamCompras,TFrmMTParamCompras,False);
end;

procedure TfrmPrincipal.Compradores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadComprador,TFrmMTCadComprador,False);
end;

procedure TfrmPrincipal.ArtigosxFornecedores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMtCadArtxForn,TFrmMtCadArtxForn,False);
end;

procedure TfrmPrincipal.AtribuirComprador1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMtAtribComprador,TFrmMtAtribComprador,False);
end;

procedure TfrmPrincipal.ProcessodeCompras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTMontaProcesso,TFrmMTMontaProcesso,False);
end;

procedure TfrmPrincipal.Cotao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCotacao,TFrmMTCotacao,False);
 end;

procedure TfrmPrincipal.SumriodeCotao1Click(Sender: TObject);
begin
  inherited;
  Modulo.sFormSumario := 'S';
  AbrirForm(FrmMTSumarioCot,TFrmMTSumarioCot,False);
end;

procedure TfrmPrincipal.OCsemCotao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadOCsemCot,TFrmMTCadOCsemCot,False);
end;

procedure TfrmPrincipal.CancelamentodeOC1Click(Sender: TObject);
begin
  inherited;
  Modulo.sFormCancela := 'S';
  AbrirForm(FrmMTCancelaOC,TFrmMTCancelaOC,False);
end;

procedure TfrmPrincipal.ConsultaOC1Click(Sender: TObject);
begin
  inherited;
  Modulo.sFormCancela := 'N';
  AbrirForm(FrmMTCancelaOC,TFrmMTCancelaOC,False);
end;

procedure TfrmPrincipal.ConsultaSumriodaCotao1Click(Sender: TObject);
begin
  inherited;
  Modulo.sFormSumario := 'N';
  AbrirForm(FrmMTSumarioCot,TFrmMTSumarioCot,False);

end;

procedure TfrmPrincipal.VisualizaltimasCompras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTViewUltCompra,TFrmMTViewUltCompra,False);
end;

procedure TfrmPrincipal.UsuriosporGrupodeProduto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadUsuxGrpProd,TFrmMTCadUsuxGrpProd,False);
end;

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TDtmRelCompras,DtmRelCompras);
end;

procedure TfrmPrincipal.ExclusodeItensPendetesdaSCI1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTApagaItemSCI,TFrmMTApagaItemSCI,False);
end;

procedure TfrmPrincipal.AcompanhamentodeSolicitaodeCompra1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTAcompSCI,TFrmMTAcompSCI,False);
end;
procedure TfrmPrincipal.ExcluiEfetivaodeLanamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTExcluiEfetCxPeq,TfrmMTExcluiEfetCxPeq,False);
end;


procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTSoliCompra,TFrmMTSoliCompra,False);
end;

procedure TfrmPrincipal.ConsultadeRecebimentodeMercadoria1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConsultaRecMerc,TFrmMTConsultaRecMerc,False);
end;

initialization
   Sistema.NomeModulo := 'Compras 2000';     // Nome do Módulo
   Sistema.IdModulo := 113 ;                 // IdModulo cadastrado no SAD
   Sistema.Versao := '3.03.14d';
   Sistema.NomeAplicativo := 'Compras';

   IntegraBack := TIntegraBack.Create(True,True,True);

   Modulo      := TModulo.Create;

finalization
   Modulo.free;

{

-------------------------------------------------------------------------------------
 ** RELATORIOS DA WEB **
-------------------------------------------------------------------------------------
procedure TfrmPrincipal.rgRelClick(Sender: TObject);
begin
  inherited;
  Case rgRel.ItemIndex of
    0:  TRptControleOC.PrintReport(0,0,Sistema.IdEmpresa,Sistema.IdUsuario,
                                   Sistema.IdModulo,'','','BASEDADOS');
    1:  TRptCxPeqR.PrintReport(0,0,Sistema.IdEmpresa,Sistema.IdUsuario,
                                   Sistema.IdModulo,'','','BASEDADOS');
    2:  TRptCotProdxForn.PrintReport(0,0,Sistema.IdEmpresa,Sistema.IdUsuario,
                                   Sistema.IdModulo,'','','BASEDADOS');
  End;
end;



 RControleOC.pas    TRptControleOC
 RCxPeqR.pas        TRptCxPeqR
 RCotProdxForn.pas  TRptCotProdxForn

IDREPORTS  NOME                                 UNIT               CLASSE
---------- ------------------------------------ ------------------ ------------------
      2524 Controle de Ordem de Compras         RControleOC.pas    TRptControleOC
      2496 Cotação - Produtos x Fornecedores    RCotProdxForn.pas  TRptCotProdxForn
      2408 Caixa Pequeno - Resumido             RCxPeqR.pas        TRptCxPeqR

}

end.


