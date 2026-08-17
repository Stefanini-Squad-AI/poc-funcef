unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
   WwQuery, TB97, Db, Wwdatsrc, DBTables, wwdblook, StdCtrls,
  Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, uModulo, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts,
  StdActns, ActnList, ImgList, fcStatusBar, CMApplicationEvents, SConnect,
  MConnect, DBClient, uCtrlParamIntegra, uResource, CMNetUsers, wwstorep;

type
  Tfrmprincipal = class(TfrmCMPrincipal)
    UsuriosporCentrodeCusto: TMenuItem;
    UsurioporAlmoxarifado: TMenuItem;
    UsuriosporGrupodeProduto: TMenuItem;
    RecebimentodeMercadoria: TMenuItem;
    DevoluodeMercadoria: TMenuItem;
    ComOC: TMenuItem;
    SemOC: TMenuItem;
    Produto: TMenuItem;
    GrupodeProduto: TMenuItem;
    Insumos: TMenuItem;
    Outros: TMenuItem;
    ItensdeVenda: TMenuItem;
    ItensdePDV: TMenuItem;
    N14: TMenuItem;
    UnidadedeMedida: TMenuItem;
    Tamanho: TMenuItem;
    Cor: TMenuItem;
    N12: TMenuItem;
    UnidadedeCusteio: TMenuItem;
    Almoxarifado: TMenuItem;
    N11: TMenuItem;
    Impostos: TMenuItem;
    N10: TMenuItem;
    Fornecedor: TMenuItem;
    RamodeFornecedor: TMenuItem;
    MudarCentrodeCustoAlmoxarifado: TMenuItem;
    N16: TMenuItem;
    ConsultadeRecebimentodeMercadoria1: TMenuItem;
    N1: TMenuItem;
    ConfiguraodeModelosdeHistrico1: TMenuItem;
    procedure ComOCClick(Sender: TObject);
    procedure fcLabel2Click(Sender: TObject);
    procedure SemOCClick(Sender: TObject);
    procedure DevoluodeMercadoriaClick(Sender: TObject);
    procedure MudarCentrodeCustoAlmoxarifadoClick(Sender: TObject);
    procedure UsuriosporCentrodeCustoClick(Sender: TObject);
    procedure UsurioporAlmoxarifadoClick(Sender: TObject);
    procedure UsuriosporGrupodeProdutoClick(Sender: TObject);
    procedure GrupodeProdutoClick(Sender: TObject);
    procedure InsumosClick(Sender: TObject);
    procedure OutrosClick(Sender: TObject);
    procedure ItensdeVendaClick(Sender: TObject);
    procedure ItensdePDVClick(Sender: TObject);
    procedure UnidadedeMedidaClick(Sender: TObject);
    procedure TamanhoClick(Sender: TObject);
    procedure CorClick(Sender: TObject);
    procedure UnidadedeCusteioClick(Sender: TObject);
    procedure AlmoxarifadoClick(Sender: TObject);
    procedure ImpostosClick(Sender: TObject);
    procedure FornecedorClick(Sender: TObject);
    procedure RamodeFornecedorClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure ConsultadeRecebimentodeMercadoria1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure ConfiguraodeModelosdeHistrico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation
{$R *.DFM}
{$R MensagemRes.Res}

Uses
  DBaseDados,uSistema, uIntegraBack, uMensErro,fTelaAut,
  FLogCCusto, FMTDevolMerc,
  FUsuxCCusto, FCadUsuxAlmox, FCadUsuxGrpProd, FCadInsumos, FCadOutros,
  FCadItemVenda, FCadItemPDV, FCadUnMedida, FCadTamanho, FCadCores,
  FCadUnCusteio, FCadAlmox, FCadTipoAgre, FCadGrupoProd,FCadForne,
  FCadRamoFor, DRelatoriosAlmox, DRptRelats,fMTConsultaRecMerc,
  fMTParamAlmox,
  FMTConfigHistAlmox, FMTRecebMerc;


procedure Tfrmprincipal.ComOCClick(Sender: TObject);
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


end;

procedure Tfrmprincipal.fcLabel2Click(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
end;

procedure Tfrmprincipal.SemOCClick(Sender: TObject);
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

procedure Tfrmprincipal.DevoluodeMercadoriaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTDevolMerc,TFrmMTDevolMerc,False);
end;

procedure Tfrmprincipal.MudarCentrodeCustoAlmoxarifadoClick(
  Sender: TObject);
Var
  bPodeLogar : Boolean;
begin
     inherited;
     Application.CreateForm(TfrmLogCCusto,FrmLogCCusto);
     bPodeLogar := FrmLogCCusto.bPodeLogar;
     FrmLogCCusto.ShowModal;
     If Not bPodeLogar Then
        Application.Terminate;
     if Modulo.iCodAlmoxa = -1 //mostrar o Centro de Custo
     then begin
      if Modulo.sCodCCusto <> ''
      then stbarStatusbar.Panels[2].Text := Modulo.sDescCCusto
   end
   else //mostrar o almoxarifado
      stbarStatusbar.Panels[2].Text := Modulo.sAlmoxaUsuario;

end;

procedure Tfrmprincipal.UsuriosporCentrodeCustoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmUsuxCCusto,TfrmUsuxCCusto,False);
end;

procedure Tfrmprincipal.UsurioporAlmoxarifadoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadUsuxAlmox,TFrmCadUsuxAlmox,False);
end;

procedure Tfrmprincipal.UsuriosporGrupodeProdutoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadUsuxGrpProd,TFrmCadUsuxGrpProd,False);
end;

procedure Tfrmprincipal.GrupodeProdutoClick(Sender: TObject);
begin
  inherited;
   If Trim(Modulo.sMascaraGrupoProd) <> '' then
      AbrirForm(frmCadGrupoProd,TfrmCadGrupoProd,False)
   else
      ShowMessage('Não existe mascara de grupo de produto cadastrado '+
                  'configure os parametros do sistema');
end;

procedure Tfrmprincipal.InsumosClick(Sender: TObject);
begin
  inherited;
   Modulo.sTipoArtigo:='2';
   AbrirForm(frmCadInsumos,TfrmCadInsumos,False);
end;

procedure Tfrmprincipal.OutrosClick(Sender: TObject);
begin
  inherited;
  Modulo.sTipoArtigo  := '3';
  AbrirForm(frmCadOutros,TfrmCadOutros,False);
end;

procedure Tfrmprincipal.ItensdeVendaClick(Sender: TObject);
begin
  inherited;
   Modulo.sTipoArtigo := '4';
   AbrirForm(frmCadItemVenda,TfrmCadItemVenda,False);
end;

procedure Tfrmprincipal.ItensdePDVClick(Sender: TObject);
begin
  inherited;
   Modulo.sTipoArtigo := '0';
   AbrirForm(frmCadItemPDV,TfrmCadItemPDV,False);
end;

procedure Tfrmprincipal.UnidadedeMedidaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadUnMedida,TfrmCadUnMedida,False);
end;

procedure Tfrmprincipal.TamanhoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadTamanho,TfrmCadTamanho,False);
end;

procedure Tfrmprincipal.CorClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadCores,TfrmCadCores,False);
end;

procedure Tfrmprincipal.UnidadedeCusteioClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadUnCusteio,TfrmCadUnCusteio,False);
end;

procedure Tfrmprincipal.AlmoxarifadoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadAlmox,TfrmCadAlmox,False);
end;

procedure Tfrmprincipal.ImpostosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadTipoAgre,TfrmCadTipoAgre,False);
end;

procedure Tfrmprincipal.FornecedorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadForne,TfrmCadForne,False);
end;

procedure Tfrmprincipal.RamodeFornecedorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRamoFor,TfrmCadRamoFor,False);
end;

procedure Tfrmprincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  bPodeLogar : Boolean;
begin
   inherited;
     If Sistema.FezLogin Then
       Begin
         Modulo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);

         Application.CreateForm(TfrmLogCCusto,FrmLogCCusto);
         bPodeLogar := FrmLogCCusto.bPodeLogar;
         FrmLogCCusto.ShowModal;

         If Not bPodeLogar Then
            Application.Terminate;

         IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB','P');
         IntegraBack.RecPag := 'P';

         if Sistema.MudouEmpresa then
            ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

         Modulo.AtualizarParametros(Sistema.IdEmpresa,
                                     Sistema.IdUsuario);
         Modulo.AtualizarParamIntegracao(Sistema.IdEmpresa);
         if Modulo.iCodAlmoxa = -1 //mostrar o Centro de Custo
         then begin
            if Modulo.sCodCCusto <> ''
            then stbarStatusbar.Panels[2].Text := Modulo.sDescCCusto
         end
         else //mostrar o almoxarifado
            stbarStatusbar.Panels[2].Text := Modulo.sAlmoxaUsuario;
   end;

end;

procedure Tfrmprincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelatoriosAlmox, dtmRelatoriosAlmox);
  Application.CreateForm(TdtmRptRelats, dtmRptRelats);
end;

procedure Tfrmprincipal.ConsultadeRecebimentodeMercadoria1Click(
  Sender: TObject);
begin
  inherited;
   AbrirForm(frmMTConsultaRecMerc,TfrmMTConsultaRecMerc,False);
end;

procedure Tfrmprincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmMTParamAlmox,TfrmMTParamAlmox,False);
end;

procedure Tfrmprincipal.ConfiguraodeModelosdeHistrico1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTConfigHistAlmox,TFrmMTConfigHistAlmox,False);
end;

initialization

   Sistema.NomeModulo := 'Recebimento de Mecadoria';    // Nome do Módulo
   Sistema.IdModulo := 46 ;                             // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.03';
   Sistema.NomeAplicativo := 'Recebimento de Mercadoria';

   IntegraBack := TIntegraBack.Create(True,True,True);
   Modulo      := TModulo.Create;
   IntegraBack.RecPag    :='P';
   
finalization
   Modulo.free;


end.
