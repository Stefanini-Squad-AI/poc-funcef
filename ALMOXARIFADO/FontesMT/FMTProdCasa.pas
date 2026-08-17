unit FMTProdCasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, Tabs, DBCtrls, uCtrlProdCasa, DBClient,
  uCMClientDataSet, uCtrlMovEstoque, uCtrlUnMedida, uCtrlAlmox, uCtrlUnidNegocio,
  uCmSqlParams, uCtrlArtigo;

type
  TFrmMTProdCasa = class(TfrmSairAjuda)
    dsArtigo: TwwDataSource;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    edData: TCMDateTimePicker;
    edNumReq: TRealEdit;
    edAlmox: TEdit;
    dblcAtiv: TwwDBLookupCombo;
    Panel2: TPanel;
    Img: TImage;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUN: TwwDBLookupCombo;
    edQtde: TRealEdit;
    edSaldo: TRealEdit;
    RgArtEleb: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    dblcItemEleb: TwwDBLookupCombo;
    dblcDescEleb: TwwDBLookupCombo;
    dblcUNEleb: TwwDBLookupCombo;
    edQtdeEleb: TRealEdit;
    Panel1: TPanel;
    btnBaixar: TBitBtn;
    BtnLimpar: TBitBtn;
    TabTipo: TTabSet;
    cdsArtigo: TCMClientDataSet;
    cdsUnidNEgoc: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    cdsUnidMed: TCMClientDataSet;
    cdsUnidMedEleb: TCMClientDataSet;
    cdsArtigoEleb: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemElebCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescElebCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnBaixarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure TabTipoClick(Sender: TObject);
  private
    { Private declarations }
    ProdCasa    : TCtrlProdCasa;
    MovEstoque  : TCtrlMovEstoque;
    UnMedida    : TCtrlUnMedida;
    Almox       : TCtrlAlmox;
    UnidNegocio : TCtrlUnidNegocio;
    Artigo      : TCtrlArtigo;

    Procedure SetTipo( n : Integer );
    Procedure SetArtigo( n : Integer );

  public
    { Public declarations }
  end;

var
  FrmMTProdCasa: TFrmMTProdCasa;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DbaseDados, uModulo;

procedure TFrmMTProdCasa.FormCreate(Sender: TObject);
begin
  inherited;
  ProdCasa := TCtrlProdCasa.Create;
  ProdCasa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.InitializeAs(ProdCasa);

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.InitializeAs(ProdCasa);

  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs(ProdCasa);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs(ProdCasa);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(ProdCasa);

  edAlmox.Text := Modulo.sAlmoxaUsuario;
  edData.Date  := Date;

  cdsAlmox.Data      := Almox.ListAlmox(Sistema.IdEmpresa);
  cdsUnidNEgoc.Data  := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);


  dblcAlmox.LookUpValue := IntToStr(Modulo.iCodAlmoxa );
end;

procedure TFrmMTProdCasa.SetArtigo(n: Integer);
Begin
  cdsArtigo.Data     := ProdCasa.ListProdCasa(TTipoProdCasa( n ),Modulo.iCodCusteio);
  If n = 1 Then
     cdsArtigoEleb.Data := Artigo.ListArtigo;
end;

procedure TFrmMTProdCasa.SetTipo(n: Integer);
begin
    Img.Visible       := (n = 1);
    RgArtEleb.Visible := (n = 1);
    If n < 0 Then
       SetArtigo( 0 )
    Else
       SetArtigo( n );
end;

procedure TFrmMTProdCasa.FormShow(Sender: TObject);
begin
  inherited;
  SetTipo(-1);
end;

procedure TFrmMTProdCasa.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItem.Text) <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       edSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,dblcItem.LookUpValue,Modulo.iCodAlmoxa,edData.Date );
       cdsUnidMed.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString );
    End;
end;

procedure TFrmMTProdCasa.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDesc.Text) <> '' Then
    Begin
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       edSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,dblcDesc.LookUpValue,Modulo.iCodAlmoxa,edData.Date );
       cdsUnidMed.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString );
    End;

end;

procedure TFrmMTProdCasa.dblcItemElebCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDescEleb.Text) <> '' Then
    Begin
       dblcItemEleb.LookUpValue := dblcDescEleb.LookUpValue;
       cdsUnidMedEleb.Data := UnMedida.ListUnMedida(cdsArtigoEleb.FieldByName('CODPRODUTO').AsString );
    End;
end;

procedure TFrmMTProdCasa.dblcDescElebCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDescEleb.Text) <> '' Then
    Begin
       dblcItemEleb.LookUpValue := dblcDescEleb.LookUpValue;
       cdsUnidMedEleb.Data := UnMedida.ListUnMedida(cdsArtigoEleb.FieldByName('CODPRODUTO').AsString );
    End;
end;

procedure TFrmMTProdCasa.btnBaixarClick(Sender: TObject);
begin
  inherited;
   If (trim(dblcAlmox.Text) = '')  Then
      Begin
         MsgDlg('Almoxarifado Destino não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAlmox.SetFocus;
      End
   Else
   If EdNumReq.Value = 0 Then
      Begin
         MsgDlg('Número da baixa não foi preenchido','Erro',mtError,[mbOk],0);
         EdNumReq.SetFocus;
      End
   Else
   If Trim(EdData.Text) = '' Then
      Begin
         MsgDlg('Data de baixa não foi preenchida','Erro',mtError,[mbOk],0);
         EdData.SetFocus;
      End
   Else
   If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
   Else
   If Trim(dblcUN.Text) = '' Then
      Begin
         MsgDlg('Unidade de medida do artigo  não foi preenchida','Erro',mtError,[mbOk],0);
         dblcUN.SetFocus;
      End
   Else
   If edQtde.Value <= 0 Then
      Begin
         MsgDlg('Quantidade do artigo elaborado baixa não foi preenchida','Erro',mtError,[mbOk],0);
         edQtdeEleb.SetFocus;
      End
   Else
   If (Not RgArtEleb.Visible) And (Format('%17.5',[edSaldo.Value]) < Format('%17.5',[edQtde.Value]) ) Then
      Begin
         MsgDlg('Quantidade do artigo excede o saldo','Erro',mtError,[mbOk],0);
         edQtde.SetFocus;
      End
   Else
   If ( RgArtEleb.Visible ) And (Trim(dblcItemEleb.Text) = '') Then
      Begin
         MsgDlg('Artigo elaborado não foi preenchida','Erro',mtError,[mbOk],0);
         dblcItemEleb.SetFocus;
      End
   Else
   If ( RgArtEleb.Visible ) And (Trim(dblcUNEleb.Text) = '') Then
      Begin
         MsgDlg('Unidade de medida do artigo elaborado não foi preenchida','Erro',mtError,[mbOk],0);
         dblcUNEleb.SetFocus;
      End
   Else
   If ( RgArtEleb.Visible ) And (edQtdeEleb.Value <= 0) Then
      Begin
         MsgDlg('Quantidade do artigo elaborado baixa não foi preenchida','Erro',mtError,[mbOk],0);
         edQtdeEleb.SetFocus;
      End
   Else
      Begin
         If Not ProdCasa.BaixaProdCasa( TTipoProdCasa(tabTipo.TabIndex ),
                                        Sistema.IdEmpresa,
                                        (edQtde.Value * cdsArtigo.FieldByName('CUSTOMEDIO').AsFloat),
                                        edQtde.Value,
                                        Modulo.iCodAlmoxa,
                                        dblcItem.lookupValue,
                                        dblcUN.LookupValue,
                                        edData.Date,
                                        edNumReq.Text,
                                        StrToIntDef(dblcAtiv.LookupValue,-1),
                                        StrToIntDef(dblcAlmox.LookupValue,0),
                                        dblcItemEleb.lookupValue,
                                        dblcUNEleb.LookupValue,
                                        edQtdeEleb.Value )
         Then
            MsgDlg( ProdCasa.MessageInfo,'Erro',mtError,[mbOk],0)
         Else
            MsgDlg('Baixa realizada com sucesso','Informação',mtInformation,[mbOK],0);
         BtnLimpar.Click;
      End;
end;

procedure TFrmMTProdCasa.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edData.Date    := Date;
  edNumReq.Value := 0;
  dblcAtiv.Clear;
  dblcItem.Clear;
  dblcDesc.Clear;
  edSaldo.Clear;
  edQtde.Clear;
  dblcUN.Clear;
  If RgArtEleb.Visible Then
     Begin
        dblcItemEleb.Clear;
        dblcDescEleb.Clear;
        edQtdeEleb.Clear;
        dblcUNEleb.Clear;
     End;
end;

procedure TFrmMTProdCasa.edQtdeExit(Sender: TObject);
Var
   rQtde : Double;
begin
  inherited;
  If RgArtEleb.Visible Then
     Begin
        rQtde := UnMedida.QtdeToUnCustoMedio(dblcItem.LookUpValue,
                                            dblcUn.LookUpValue,
                                            edQtde.Value);
        If Format('%17.5f',[rQtde]) > Format('%17.5f',[edSaldo.Value]) Then
           Begin
              MsgDlg('Quantidade solicitado maior que a quantidade disponível','Erro',mtError,[mbOk],0);
              edQtde.Clear;
              edQtde.SetFocus;
          End;
     End;

end;

procedure TFrmMTProdCasa.TabTipoClick(Sender: TObject);
begin
  inherited;
  BtnLimpar.Click;
  SetTipo(TabTipo.TabIndex);
end;

end.
