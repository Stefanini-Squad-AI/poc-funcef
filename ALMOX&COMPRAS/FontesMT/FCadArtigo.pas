unit FCadArtigo;

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
  uCtrlCor, uCtrlTamanho , uCMTypes;

type
  TFrmCadArtigo = class(TFrmCadastroMestreDetMT)
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
    dbmDescricaoDet: TDBMemo;
    Panel2: TPanel;
    grdContab: TwwDBGrid;
    dsImposto: TwwDataSource;
    cdsImposto: TCMClientDataSet;
    qrySitTrib: TwwQuery;
    qryCalsFisc: TwwQuery;
    cdsSitTrib: TCMClientDataSet;
    dspSitTrib: TDataSetProvider;
    cdsClasFisc: TCMClientDataSet;
    dspClasFisc: TDataSetProvider;
    cdsAlmox: TCMClientDataSet;
    cdsUnidadeMed: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    cdsUnidNegoc: TCMClientDataSet;
    cdsEstado: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
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
    DBCheckBox1: TDBCheckBox;
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
  private
    { Private declarations }
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
    //
    Procedure Sel( CodProduto : String );

  public
    { Public declarations }
  end;

var
  FrmCadArtigo: TFrmCadArtigo;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, DBaseDados,uIntegraBack, uModulo;

procedure TFrmCadArtigo.FormCreate(Sender: TObject);
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
  //
  Sel('');
  //
  if (ParamIntegra.IntegraContab) then
  Begin
     tabContab.Enabled := True;
     //
     edContaEntrada.Mascara := Trim(ParamIntegra.MascaraPlano);//+ ';0;_';
     edContaEntrada.Plano   := ParamIntegra.Plano;
     edContaSaida.Mascara   := Trim(ParamIntegra.MascaraPlano);//+ ';0;_';
     edContaSaida.Plano     := ParamIntegra.Plano;
     //
     //cdsSubConta.Data := ContaContabil.list
     //
     cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
     //
     cdsAlmox.Data     := Almox.ListAlmox(Sistema.IdEmpresa);
     //
     cdsCCusto.Data    := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa);
  End
  Else
     tabContab.Enabled := False;
 //
 cdsTipoAgre.Data   := TipoAgregado.ListAgregados('N');
 cdsEstado.Data     := Estado.ListaEstado;
 cdsUnidadeMed.Data := UnMedida.ListUnMedida;
 cdsGrupoProd.Data  := GrupoProd.ListGrupoProd(tgAnaliticos);
 cdsCor.Data        := Cor.ListCor;
 cdsTamanho.Data    := Tamanho.ListTamanho;
 //
 cdsSitTrib.Open;
 cdsClasFisc.Open;
end;

procedure TFrmCadArtigo.CmeCadastroInsert(Sender: TObject);
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
procedure TFrmCadArtigo.Sel(CodProduto: String);
begin
  cbValeGrupo.Checked := Modulo.sContabGrupo = 'S';
  
  cds.Data := Artigo.getArtigo(CodProduto);
  // Seleciona se acontabilização é por grupo ou pelo própiro artigo
  If Modulo.sContabGrupo = 'S' Then
     cdsContab.Data := Artigo.GetContabilizacao(tcGrupo,cds.FieldbyName('CODGRUPOPROD').asString,Sistema.IdEmpresa )
  Else
     cdsContab.Data := Artigo.GetContabilizacao(tcArtigo,cds.FieldbyName('CODARTIGO').asString,Sistema.IdEmpresa );
  //
  cdsDet.Data     := Artigo.GetConver(CodProduto);
  cdsImposto.Data := Artigo.GetImposto(CodProduto,Sistema.IdEmpresa);
  cdsCorTam.Data  := Artigo.GetCorTamanho(CodProduto);
  //
end;

procedure TFrmCadArtigo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        Sel( MontaSelect.ValoresChave[0] );
     End;
end;

procedure TFrmCadArtigo.edCodProdExit(Sender: TObject);
begin
  inherited;
     cds.FieldByName('CODARTIGO').AsString := Trim(edCodProd.Text);
     if Artigo.JaExisteProduto(edCodProd.Text) then
     Begin
        MsgDlg('Já existe um Produto cadastrado com este código. Verifique','Erro',mtError,[mbOk],0);
        edCodProd.SetFocus;
     end;
end;

procedure TFrmCadArtigo.dblkCmbMenorUnidExit(Sender: TObject);
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

procedure TFrmCadArtigo.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  If pgctrlDetalhe.ActivePage.PageIndex = 0 Then
     Begin
        dblcUnidade.SetFocus;
     end
  Else
  If pgctrlDetalhe.ActivePage.PageIndex = 1 Then
     Begin
        edContaEntrada.SetFocus;
     end
  Else
  If pgctrlDetalhe.ActivePage.PageIndex = 4 Then
     Begin
        dblcTipoAgre.SetFocus;
        dbedBase.Value := 100;
     end
  Else
  If pgctrlDetalhe.ActivePage.PageIndex = 5 Then
     Begin
        dblcCor.SetFocus;
     End;     
end;

procedure TFrmCadArtigo.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  If cds.State in dsEditModes Then
     Begin
        if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (cdsDet.State in ([dsInsert,dsEdit])) then
           Begin
              dblcUnidade.SetFocus;
           end;
        if (pgctrlDetalhe.ActivePage.PageIndex = 1)  and (cdsContab.State in ([dsInsert,dsEdit])) then
           Begin
             if Modulo.sContabGrupo = 'S' Then
                 If cdsContab.FieldByName('CODGRUPOPROD').isNull then
                    cbValeGrupo.Checked := False
                 Else
                    cbValeGrupo.Checked := True;
                 edContaEntrada.SetFocus;
           end;
     end;
end;

procedure TFrmCadArtigo.dblkCmbUnPrMedExit(Sender: TObject);
begin
  inherited;
  If Artigo.ExisteMovimentacao(edCodProd.Text) Then
     Begin
        MsgDlg('Este porduto já possui movimentação. Não poder ser alterado o custo médio','Atenção',mtWarning,[mbOk],0);
        dblkCmbMenorUnid.SetFocus;
     End;
end;

procedure TFrmCadArtigo.CmeDetalheConfirma(Sender: TObject);
begin
   if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (cdsDet.State in ([dsInsert,dsEdit])) then
   Begin
      cdsDet.FieldByName('CODMENORMED').AsString := dbeMenorUn.Text;
   End
   Else
   if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (cdsContab.State in ([dsInsert,dsEdit])) then
   Begin
      if cbValeGrupo.Checked then
         cdsContab.FieldByName('CODGRUPOPROD').AsString := cds.FieldByName('CODGRUPOPROD').AsString
      else
         cdsContab.FieldByName('CODGRUPOPROD').Clear;
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
              FieldByName('IDPAIS').asInteger       :=  cdsEstado.FieldByName('IDPAIS').asInteger;
          End;
     End
   Else
   if (pgctrlDetalhe.ActivePage.PageIndex = 5) and (cdsCorTam.State in dsEditModes ) then
      Begin
         cdsCorTam.FieldByName('CODPRODUTO').AsString    := edCodProd.Text;
         cdsCorTam.FieldByName('DESCCOR').AsString       := dblcCor.Text;
         cdsCorTam.FieldByName('DESCTAMANHO').AsString   := dblcTam.Text;
         cdsCorTam.FieldByName('CODTIPOARTIGO').AsString := IntToStr(btnTipoProd.Tag);
      End;
  inherited;
end;

procedure TFrmCadArtigo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edCodProd.Enabled := False;
end;

procedure TFrmCadArtigo.CmeCadastroBeforeConfirma(sender: TObject;
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

procedure TFrmCadArtigo.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
    MsgDlg(Artigo.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadArtigo.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
    Sel(cds.FieldByName('CODPRODUTO').AsString);
end;

procedure TFrmCadArtigo.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Artigo.Excluir;
  Sel('');
end;

procedure TFrmCadArtigo.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Artigo.Gravar( TTipoArtigo(btnTipoProd.Tag) );
end;

procedure TFrmCadArtigo.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Artigo.Gravar( TTipoArtigo(btnTipoProd.Tag) );
end;

procedure TFrmCadArtigo.MudaTipo(Sender: TObject);
begin
   Caption := 'Cadastro de '+ Trim(TMenuItem(Sender).Caption);
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
end;

procedure TFrmCadArtigo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  btnTipoProd.Enabled := not bbtnConfirmar.Enabled;
end;

procedure TFrmCadArtigo.dblkcmbGrupoCloseUp(Sender: TObject; LookupTable,
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
           cdsContab.Data := Artigo.GetContabilizacao(tcGrupo,dblkcmbGrupo.LookupValue,Sistema.IdEmpresa);

     End;
end;

procedure TFrmCadArtigo.FormShow(Sender: TObject);
begin
  inherited;
  Outros1.Click;
end;

end.
