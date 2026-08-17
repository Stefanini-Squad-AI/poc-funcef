{---------------------------------------------------------------------------------
 Data       : 28/01/2005
 Autor      : André Tavares
 Pendências : 18602
 Descrição  : 
---------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------
 Data       : 28/01/2005
 Autor      : Marchetti
 Pendências : 17949
 Descrição  : Inclusão de saldo quando insere produto novo
---------------------------------------------------------------------------------}
unit FMTCadArtigo;
                                               
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, Mask, wwdbedit,
  DBCtrls, Provider, DBTables, Wwquery, TREdit,Menus,
  CMDBLookupCombo, CMProcuraMask, uCtrlContaContabil,uCtrlArtigo,
  uCtrlTipoAgregado,uCtrlCentroCusto, uCtrlEstado,uCtrlUnidNegocio,
  uCtrlUnMedida, uCtrlGrupoProd, uCtrlParamIntegra, uCtrlAlmox,
  uCtrlCor, uCtrlTamanho, uCMTypes, uCtrlSubConta, uCmSqlParams, uCtrlParamGlobal;

type
  TFrmMTCadArtigo = class(TFrmCadastroMestreDetMT)
    Label8: TLabel;
    edCodProd: TwwDBEdit;
    Label9: TLabel;
    edDescProd: TwwDBEdit;
    dblkcmbGrupo: TwwDBLookupCombo;
    Label1: TLabel;
    grpMedidas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label24: TLabel;
    dblkCmbUnCompra: TwwDBLookupCombo;
    dblkCmbMenorUnid: TwwDBLookupCombo;
    dblkCmbUnPrMed: TwwDBLookupCombo;
    RgBloq: TDBRadioGroup;
    rgrpFinalidade: TDBRadioGroup;
    chkVariavel: TDBCheckBox;
    chkLoteValidade: TDBCheckBox;
    chkEstocavel: TDBCheckBox;
    cdsDet: TCMClientDataSet;
    dsContab: TwwDataSource;
    cdsContab: TCMClientDataSet;
    TabContab: TTabSheet;
    TabDescDet: TTabSheet;
    TabEscFiscal: TTabSheet;
    TabImpostos: TTabSheet;
    Panel1: TPanel;
    grdImposto: TwwDBGrid;
    Panel2: TPanel;
    grdContab: TwwDBGrid;
    dsImposto: TwwDataSource;
    cdsImposto: TCMClientDataSet;
    cdsSitTrib: TCMClientDataSet;
    cdsClasFisc: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    cdsUnidadeMed: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    cdsUnidNegoc: TCMClientDataSet;
    cdsEstado: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    cdsSubContaEnt: TCMClientDataSet;
    lblUnidade: TLabel;
    dblcUnidade: TwwDBLookupCombo;
    lblFator: TLabel;
    dbrFator: TDBRealEdit;
    lblMenorUn: TLabel;
    dbeMenorUn: TwwDBEdit;
    lblCCusto: TLabel;
    lblAtividade: TLabel;
    lblSubConta: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    dblcAtividade: TwwDBLookupCombo;
    cbValeGrupo: TCheckBox;
    edContaEntrada: TCMProcuraMaskContabil;
    dblcSubContaEntrada: TwwDBLookupCombo;
    dblcSubContaSaida: TwwDBLookupCombo;
    edContaSaida: TCMProcuraMaskContabil;
    dblcAlmoxa: TwwDBLookupCombo;
    Label10: TLabel;
    dblcSittrib: TCMDBLookupCombo;
    dbrgIsentoOutros: TDBRadioGroup;
    gbCodigoFiscal: TGroupBox;
    Label6: TLabel;
    lblExplica: TLabel;
    dblcClasFisc: TCMDBLookupCombo;
    lbTipoAgre: TLabel;
    dblcTipoAgre: TwwDBLookupCombo;
    Label7: TLabel;
    dbPercentual: TDBRealEdit;
    lblPerc: TLabel;
    dbedBase: TDBRealEdit;
    Label11: TLabel;
    lblEstado: TLabel;
    dblcEstado: TwwDBLookupCombo;
    cdsTipoAgre: TCMClientDataSet;
    dblcAtivo: TDBCheckBox;
    btnTipoProd: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    mnuTipoProd: TPopupMenu;
    Insumo1: TMenuItem;
    Outros1: TMenuItem;
    ItensdeVenda1: TMenuItem;
    ItensdePDV1: TMenuItem;
    cdsCorTam: TCMClientDataSet;
    dsCorTam: TwwDataSource;
    TabCorTam: TTabSheet;
    grdCorTam: TwwDBGrid;
    pnlCortam: TPanel;
    LblTam: TLabel;
    lblCor: TLabel;
    dblcCor: TwwDBLookupCombo;
    dblcTam: TwwDBLookupCombo;
    cdsCor: TCMClientDataSet;
    cdsTamanho: TCMClientDataSet;
    edCodBarra: TDBEdit;
    edCodBarraCT: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    CdsSubContaSai: TCMClientDataSet;
    spSitTrib: TCMSqlParams;
    spClasFisc: TCMSqlParams;
    DBRichEdit1: TDBRichEdit;
    spTipoAgre: TCMSqlParams;
    cdsParamGlobal: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure edCodProdExit(Sender: TObject);
    procedure dblkCmbMenorUnidExit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dblkCmbUnPrMedExit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dblkcmbGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    Procedure MudaTipo(Sender : TObject);
    procedure edContaEntradaExit(Sender: TObject);
    procedure edContaSaidaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlParamGlobal : TCtrlParamGlobal;
    Artigo        : TCtrlArtigo;
    ContaContabil : TCtrlContaContabil;
    TipoAgregado  : TCtrlTipoAgregado;
    CentroCusto   : TCtrlCentroCusto;
    Estado        : TCtrlEstado;
    UnidNegocio   : TCtrlUnidNegocio;
    UnMedida      : TCtrlUnMedida;
    GrupoProd     : TCtrlGrupoProd;
    Almox         : TCtrlAlmox;
    Cor           : TCtrlCor;
    Tamanho       : TCtrlTamanho;
    SubConta      : TCtrlSubConta;
    //
    Procedure Sel( CodProduto : String );

  public
    { Public declarations }
    TipoArtigo   : TTipoArtigo;
    sContabGrupo : String;

  end;

var
  FrmMTCadArtigo: TFrmMTCadArtigo;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, DBaseDados,uIntegraBack, uModulo;

procedure TFrmMTCadArtigo.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Artigo.cdsProduto      := cds;
  Artigo.cdsArtigo       := cds;
  Artigo.cdsConver       := cdsDet;
  Artigo.cdsImpostos     := cdsImposto;
  Artigo.cdsArtxContaxCC := cdsContab;
  Artigo.cdsCorTamanho   := cdsCorTam;

  Artigo.Pessoa          := Sistema.IdEmpresa;
  Artigo.CodCusteio      := Modulo.iCodCusteio;
  Artigo.CodAlmoxa       := Modulo.iCodAlmoxa;
  Artigo.CustoAlmoxa     := Modulo.sCCustoAlmoxa;

  //
  ContaContabil := TCtrlContaContabil.Create;
  ContaContabil.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  TipoAgregado  := TCtrlTipoAgregado.Create;
  TipoAgregado.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Estado := TCtrlEstado.Create;
  Estado.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Cor := TCtrlCor.Create;
  Cor.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Tamanho := TCtrlTamanho.Create;
  Tamanho.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  SubConta := TCtrlSubConta.Create;
  SubConta.InitializeAs(Artigo);
  //
  Sel('');

  // Marchetti - Pendencia 27699
  CtrlParamGlobal   := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(Artigo);
  cdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);
  // Fim Marchetti - Pendencia 27699

  //
  if (ParamIntegra.IntegraContab) then
  Begin
     tabContab.Enabled := True;
     //
     edContaEntrada.Mascara := Trim(ParamIntegra.MascaraPlano);
     edContaEntrada.Plano   := ParamIntegra.Plano;
     edContaSaida.Mascara   := Trim(ParamIntegra.MascaraPlano);
     edContaSaida.Plano     := ParamIntegra.Plano;
     cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
     //
     cdsAlmox.Data     := Almox.ListAlmox(Sistema.IdEmpresa);
     //
  // Marchetti - Pendencia 27699
//     cdsCCusto.Data    := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A', cdsParamGlobal.FieldByName('IDPLANCENTCUST').AsInteger);
     cdsCCusto.Data    := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A', cdsParamGlobal.FieldByName('IDPLANCENTCUST').AsInteger);
  // Fim Marchetti - Pendencia 27699

     cdsSubContaEnt.Data  := SubConta.ListSubConta(0,0);
     cdsSubContaSai.Data  := SubConta.ListSubConta(0,0);
  End
  Else
     tabContab.Enabled := False;

 cdsEstado.Data     := Estado.ListaEstado;
 cdsUnidadeMed.Data := UnMedida.ListUnMedida;
 cdsGrupoProd.Data  := GrupoProd.ListGrupoProd(tgAnaliticos);
 cdsCor.Data        := Cor.ListCor;
 cdsTamanho.Data    := Tamanho.ListTamanho;
 //
 spSitTrib.Open;
 spClasFisc.Open;
 spTipoAgre.Open;

end;

procedure TFrmMTCadArtigo.CmeCadastroInsert(Sender: TObject);
begin
  Sel('');
  //
  inherited;
  cds.FieldByName('CONSUMOREVENDA').AsString := 'R';
  cds.FieldByName('LOTEVALIDADE').AsString   := 'F';
  cds.FieldByName('ITEMESTOCAVEL').AsString  := 'S';
  cds.FieldByName('FLGVARIAVEL').AsString    := 'N';
  cds.FieldByName('FLGBLOQUEADO').AsString   := 'L';
  cds.FieldByName('FLGATIVO').AsString       := 'S';
  edCodProd.Enabled := True;
  edCodProd.SetFocus;
end;
procedure TFrmMTCadArtigo.Sel(CodProduto: String);
begin
  cbValeGrupo.Checked := (sContabGrupo = 'S');

  cds.Data := Artigo.getArtigo(CodProduto);
  cdsContab.Data := Artigo.ListContabArtigo(Sistema.IdEmpresa, cds.FieldbyName('CODARTIGO').asString,cds.FieldbyName('CODGRUPOPROD').asString );
  //
  cdsDet.Data     := Artigo.GetConver(CodProduto);
  cdsImposto.Data := Artigo.GetImposto(CodProduto,Sistema.IdEmpresa);
  cdsCorTam.Data  := Artigo.GetCorTamanho(CodProduto);

  Artigo.CodArtigo := cds.FieldByName('CODARTIGO').asString;
end;

procedure TFrmMTCadArtigo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        Sel( MontaSelect.ValoresChave[0] );
     End;
end;

procedure TFrmMTCadArtigo.edCodProdExit(Sender: TObject);
begin
  inherited;
     cds.FieldByName('CODARTIGO').AsString := Trim(edCodProd.Text);
     if Artigo.JaExisteProduto(edCodProd.Text) then
     Begin
        MsgDlg('Já existe um Produto cadastrado com este código. Verifique','Erro',mtError,[mbOk],0);
        edCodProd.SetFocus;
     end;
end;

procedure TFrmMTCadArtigo.dblkCmbMenorUnidExit(Sender: TObject);
begin
  inherited;
  If Not Artigo.ExisteMedida(dblkCmbMenorUnid.LookupValue) Then
     Begin
        cdsDet.Insert;
        cdsDet.FieldByName('CODMEDIDA').AsString   := dblkCmbMenorUnid.LookupValue;
        cdsDet.FieldByName('CODPRODUTO').AsString  := cds.FieldByName('CODPRODUTO').AsString;
        cdsDet.FieldByName('FATOR').AsFloat        := 1;
        cdsDet.FieldByName('CODMENORMED').AsString := dblkCmbMenorUnid.LookupValue;
        cdsDet.Post;
     End;
end;

procedure TFrmMTCadArtigo.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  If pgctrlDetalhe.ActivePage.PageIndex = 0 Then
     Begin
        IF dblcUnidade.CanFocus Then
           dblcUnidade.SetFocus;
     end
  Else
  If pgctrlDetalhe.ActivePage.PageIndex = 1 Then
     Begin
        IF edContaEntrada.CanFocus Then
           edContaEntrada.SetFocus;
     end
  Else
  If pgctrlDetalhe.ActivePage.PageIndex = 4 Then
     Begin
        IF edContaEntrada.CanFocus Then
           edContaEntrada.SetFocus;
        dbedBase.Value := 100;
     end
  Else
  If pgctrlDetalhe.ActivePage.PageIndex = 5 Then
     Begin
        IF dblcCor.CanFocus Then
           dblcCor.SetFocus;
     End;
end;

procedure TFrmMTCadArtigo.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  If cds.State in dsEditModes Then
     Begin
        if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (cdsDet.State in ([dsInsert,dsEdit])) then
           Begin
              IF dblcUnidade.CanFocus Then
                 dblcUnidade.SetFocus;
           end;
        if (pgctrlDetalhe.ActivePage.PageIndex = 1)  and (cdsContab.State in ([dsInsert,dsEdit])) then
           Begin
             if sContabGrupo = 'S' Then
                 If cdsContab.FieldByName('CODGRUPOPROD').isNull then
                    cbValeGrupo.Checked := False
                 Else
                    cbValeGrupo.Checked := True;

             IF edContaEntrada.CanFocus Then
                edContaEntrada.SetFocus;
           end;
     end;
end;

procedure TFrmMTCadArtigo.dblkCmbUnPrMedExit(Sender: TObject);
begin
  inherited;
  If Artigo.ExisteMovimentacao(edCodProd.Text) Then
     Begin
        MsgDlg('Este porduto já possui movimentação. Não poder ser alterado o custo médio','Atenção',mtWarning,[mbOk],0);
        dblkCmbMenorUnid.SetFocus;
     End;
end;

procedure TFrmMTCadArtigo.CmeDetalheConfirma(Sender: TObject);
begin
   if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (cdsDet.State in ([dsInsert,dsEdit])) then
   Begin
      cdsDet.FieldByName('CODMENORMED').AsString := dbeMenorUn.Text;
   End
   Else
   if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (cdsContab.State in ([dsInsert,dsEdit])) then
   Begin
      cdsContab.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      cdsContab.FieldByName('PLANO').AsInteger    := ParamIntegra.Plano;
      if cbValeGrupo.Checked then
         Begin
            cdsContab.FieldByName('CODARTIGO').Clear;
            cdsContab.FieldByName('CODGRUPOPROD').AsString := cds.FieldByName('CODGRUPOPROD').AsString
         End
      else
         Begin
            cdsContab.FieldByName('CODGRUPOPROD').Clear;
            cdsContab.FieldByName('CODARTIGO').AsString := cds.FieldByName('CODARTIGO').AsString
         End;
   end
   Else
   if (pgctrlDetalhe.ActivePage.PageIndex = 4) and (cdsImposto.State in ([dsInsert,dsEdit])) then
     Begin
        With cdsImposto Do
          Begin
              cdsEstado.Locate('CODESTADO',dblcEstado.LookUpValue,[LoPartialKey]);
              FieldByName('DESCCUSTAGREG').asString := Trim(dblcTipoAgre.Text);
              FieldByName('CODPRODUTO').asString    := Trim(edCodProd.Text);
              FieldByName('IDPESSOA').asInteger     := Sistema.IdEmpresa;
              FieldByName('IDPAIS').asInteger       := cdsEstado.FieldByName('IDPAIS').asInteger;
          End;
     End
   Else
   if (pgctrlDetalhe.ActivePage.PageIndex = 5) and (cdsCorTam.State in dsEditModes ) then
      Begin
         cdsCorTam.FieldByName('FLGATIVO').AsString      := Cds.FieldByName('FLGATIVO').AsString;
         cdsCorTam.FieldByName('CODPRODUTO').AsString    := edCodProd.Text;
         cdsCorTam.FieldByName('DESCCOR').AsString       := dblcCor.Text;
         cdsCorTam.FieldByName('DESCTAMANHO').AsString   := dblcTam.Text;
         cdsCorTam.FieldByName('CODTIPOARTIGO').AsString := IntToStr(btnTipoProd.Tag);
      End;
  inherited;
end;

procedure TFrmMTCadArtigo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edCodProd.Enabled := False;
end;

procedure TFrmMTCadArtigo.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If Not Artigo.ExisteMedida(dblkCmbUnPrMed.LookupValue) Then
     Begin
        MsgDlg('Obrigatório ter conversão para a Unidade de Custo Médio','Erro',mtError,[mbOk],0);
        dblkCmbUnPrMed.SetFocus;
        Accept := False;
     End
  Else
  If Not Artigo.ExisteMedida(dblkCmbMenorUnid.LookupValue) Then
     Begin
        MsgDlg('Obrigatório ter conversão para a menor Unidade','Erro',mtError,[mbOk],0);
        dblkCmbMenorUnid.SetFocus;
        Accept := False;
     End
  Else
  If Not Artigo.ExisteMedida(dblkCmbUnCompra.LookupValue) Then
     Begin
        MsgDlg('Obrigatório ter conversão para a Unidade de compra','Erro',mtError,[mbOk],0);
        dblkCmbUnCompra.SetFocus;
        Accept := False;
     End;
end;

procedure TFrmMTCadArtigo.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
    MsgDlg(Artigo.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMTCadArtigo.CmeCadastroAfterConfirma(Sender: TObject);
begin
    Sel(cds.FieldByName('CODPRODUTO').AsString);
end;

procedure TFrmMTCadArtigo.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Artigo.Excluir;
  Sel('');
end;

procedure TFrmMTCadArtigo.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Artigo.Gravar( TTipoArtigo(btnTipoProd.Tag) );
end;

procedure TFrmMTCadArtigo.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Artigo.Gravar( TTipoArtigo(btnTipoProd.Tag) );
  Show;
end;

procedure TFrmMTCadArtigo.MudaTipo(Sender: TObject);
begin
   TMenuItem(Sender).Tag := 2;
   If (Sistema.IdModulo = 113) And (TMenuItem(Sender).Tag = 0 ) Then
      MsgDlg('Opção não disponível no sistema de Compras','Atenção',mtWarning,[mbOk],0)
   Else
      Begin

         Caption := 'Cadastro de '+ Trim(TMenuItem(Sender).Caption) +' - '+ Artigo.GetUltArtigoCad(TTipoArtigo(TMenuItem(Sender).Tag));
         TMenuItem(Sender).Default := True;
         MontaSelect.Filtro.Strings[0] := 'ARTIGO.CODTIPOARTIGO = '+QuotedStr(IntToStr(TMenuItem(Sender).Tag)) ;
         btnTipoProd.Tag := TMenuItem(Sender).Tag;
         //---------------------------------------------------------------------------------
         // Esconde e Mostra a orelha de Cor e Tamanho
         //---------------------------------------------------------------------------------
         If (TMenuItem(Sender).Tag = 2) And (tbcDetalhe.Tabs.Count = 6) Then
            tbcDetalhe.Tabs.Delete(5)
         Else
            If (TMenuItem(Sender).Tag <> 2) And (tbcDetalhe.Tabs.Count <= 5) Then
               tbcDetalhe.Tabs.Add('Cor e Tamanho');

         tbcDetalhe.TabIndex := 0;
         pgctrlDetalhe.ActivePageIndex := 0;

         tbcDetalheChange(tbcDetalhe);
         //---------------------------------------------------------------------------------
      End;

end;

procedure TFrmMTCadArtigo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  btnTipoProd.Enabled := not bbtnConfirmar.Enabled;
end;

procedure TFrmMTCadArtigo.dblkcmbGrupoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified and (trim(dblkcmbGrupo.text) <> '') then
     Begin
        If cbValeGrupo.Checked then
        Begin
           cdsContab.First;
           While not cdsContab.EOF do
              cdsContab.Delete;
        end;
        If cdsContab.IsEmpty then
           cdsContab.Data := Artigo.GetContabilizacao(Sistema.IdEmpresa,'',dblkcmbGrupo.LookupValue);
        CmeDetalhe.AtualizaBotoes(Self);
     End;
end;

procedure TFrmMTCadArtigo.FormShow(Sender: TObject);
begin
  inherited;
  Case TipoArtigo Of
     taItemPDV   : ItensdePDV1.Click;
     taOutros    : Outros1.Click;
     taInsumo    : Insumo1.Click;
     taItemVenda : ItensdeVenda1.Click;
  End;
end;

procedure TFrmMTCadArtigo.edContaEntradaExit(Sender: TObject);
begin
  inherited;
  cdsSubContaEnt.Data := SubConta.ListSubConta( Sistema.IdEmpresa,StrToIntDef(edContaEntrada.Conta.Numero,0) );
end;

procedure TFrmMTCadArtigo.edContaSaidaExit(Sender: TObject);
begin
  inherited;
  cdsSubContaSai.Data := SubConta.ListSubConta( Sistema.IdEmpresa,StrToIntDef(edContaEntrada.Conta.Numero,0) );
end;

procedure TFrmMTCadArtigo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlParamGlobal );
  Artigo.Free;
  ContaContabil.Free;
  TipoAgregado.Free;
  CentroCusto.Free;
  Estado.Free;
  UnidNegocio.Free;
  UnMedida.Free;
  GrupoProd.Free;
  Almox.Free;
  Cor.Free;
  Tamanho.Free;
  SubConta.Free;
  inherited;

end;

procedure TFrmMTCadArtigo.bbtnOkDetClick(Sender: TObject);
begin
   If (pgctrlDetalhe.ActivePageIndex = 1) And (CdsContab.State in DsEditModes) Then
      Begin
         If ( edContaEntrada.Conta.ObrigaSubConta ) And (Trim(dblcSubContaEntrada.Text) = '' ) Then
            Begin
               MsgDlg('Obrigatório preencher sub-conta entrada','Erro',mtError,[mbOk],0);
               dblcSubContaEntrada.SetFocus;
            End
         Else
         If ( edContaSaida.Conta.ObrigaSubConta ) And (Trim(dblcSubContaSaida.Text) = '' ) Then
            Begin
               MsgDlg('Obrigatório preencher sub-conta saída','Erro',mtError,[mbOk],0);
               dblcSubContaSaida.SetFocus;
            End
         Else
           inherited;
      End
   Else
      inherited;


end;

procedure TFrmMTCadArtigo.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  if (cdsContab.State in [dsInsert, dsEdit]) and (not cbValeGrupo.Checked) then
    cdsContab.FieldByName('CODGRUPOPROD').asString := '';
  inherited;

end;

end.
