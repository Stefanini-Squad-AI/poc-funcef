unit FMTBaixaPerda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CMDBLookupCombo, TREdit, Mask, DBCtrls, wwdblook, Db, DBClient,
  uCMClientDataSet,uCtrlArtigo, uCtrlUnMedida, uCtrlUnidNegocio,
  uCtrlMovEstoque, Wwdatsrc, uCtrlBaixaPerda, uCtrlTipoPerda;

type
  TFrmMTBaixaPerda = class(TfrmSairAjuda)
    Label1: TLabel;
    lbALmox: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    pnlDet: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edQtde: TRealEdit;
    dblcUN: TwwDBLookupCombo;
    DbUN: TDBEdit;
    dblcDesc: TwwDBLookupCombo;
    dblcItem: TwwDBLookupCombo;
    edValb: TRealEdit;
    dblcPerda: TCMDBLookupCombo;
    edAlmox: TEdit;
    edData: TCMDateTimePicker;
    edNumReq: TRealEdit;
    dblcAtiv: TwwDBLookupCombo;
    cdsUnidNegoc: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    cdsUnMedida: TCMClientDataSet;
    dsArtigo: TwwDataSource;
    cdsTipoPerda: TCMClientDataSet;
    BtnBaixa: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    edSaldo: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcUNEnter(Sender: TObject);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edQtdeExit(Sender: TObject);
    procedure BtnBaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Artigo      : TCtrlArtigo;
    UnMedida    : TCtrlUnMedida;
    UnidNegocio : TCtrlUnidNegocio;
    BaixaPerda  : TCtrlBaixaPerda;
    TipoPerda   : TCtrlTipoPerda;
    MovEstoque  : TCtrlMovEstoque;
    //
    Procedure Limpa;
  public
    { Public declarations }
  end;

var
  FrmMTBaixaPerda: TFrmMTBaixaPerda;

implementation

{$R *.DFM}

Uses uMensErro, uModulo, DBaseDados, uSistema;

procedure TFrmMTBaixaPerda.FormCreate(Sender: TObject);
begin
  inherited;
  edAlmox.Text := Modulo.sAlmoxaUsuario;
  edData.Date  := Date;

  BaixaPerda  := TCtrlBaixaPerda.Create;
  BaixaPerda.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  TipoPerda := TCtrlTipoPerda.Create;
  TipoPerda.InitializeAs(BaixaPerda);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(BaixaPerda);

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.InitializeAs(BaixaPerda);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs(BaixaPerda);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.InitializeAs(BaixaPerda);

  cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
  cdsArtigo.Data    := Artigo.ListArtigo;
  cdsTipoPerda.Data := TipoPerda.ListTipoPerda;
end;

procedure TFrmMTBaixaPerda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Artigo.Free;
  UnMedida.Free;
  UnidNegocio.Free;
end;

procedure TFrmMTBaixaPerda.dblcUNEnter(Sender: TObject);
begin
  inherited;
  cdsUnMedida.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString);
end;

procedure TFrmMTBaixaPerda.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDesc.Text) <> '' Then
    Begin
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       edSaldo.Value        := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                                    dblcItem.LookUpValue,
                                                    Modulo.iCodAlmoxa,
                                                    edData.Date);
    End;

end;

procedure TFrmMTBaixaPerda.Limpa;
begin
   dblcPerda.Text := '';
   edNumReq.Value := 0;
   dblcItem.Text  := '';
   dblcDesc.Text  := '';
   dblcUN.Text    := '';
   edSaldo.Value  := 0;
   DbUN.Text      := '';
   edValb.Value   := 0;
   edQtde.Value   := 0;

   If dblcPerda.CanFocus Then
      dblcPerda.SetFocus;
end;

procedure TFrmMTBaixaPerda.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 If Trim(dblcItem.Text) <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       edSaldo.Value        := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                                    dblcItem.LookUpValue,
                                                    Modulo.iCodAlmoxa,
                                                    edData.Date);
    End;

end;

procedure TFrmMTBaixaPerda.edQtdeExit(Sender: TObject);
Var
   rQtde : Double;
begin
  inherited;
  rQtde := UnMedida.QtdeToUnCustoMedio(dblcItem.LookupValue,
                                       dblcUn.LookUpValue,
                                       edQtde.Value );

  If Format('%17.5f',[rQtde]) > Format('%17.5f',[edSaldo.Value]) Then
    Begin
       MsgDlg('Quantidade solicitado maior que a quantidade disponível','Erro',mtError,[mbOk],0);
       edQtde.Clear;
       edQtde.SetFocus;
       Exit;
   End;
  edValb.Value := Artigo.GetCustoMedio(dblcItem.LookupValue,Modulo.iCodCusteio);

end;

procedure TFrmMTBaixaPerda.BtnBaixaClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcPerda.Text) = '' Then
      Begin
         MsgDlg('Tipo de perda não foi preenchida','Erro',mtError,[mbOk],0);
         dblcPerda.SetFocus;
      End
   Else
   If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
   Else
   If Trim(dblcItem.Text) = '' Then
      Begin
         MsgDlg('Artigo não foi preenchida','Erro',mtError,[mbOk],0);
         dblcItem.SetFocus;
      End
   Else
   If Trim(dblcUN.Text) = '' Then
     Begin
         MsgDlg('Unidade de medida não foi preenchida','Erro',mtError,[mbOk],0);
         dblcUN.SetFocus;
     End
   Else
   If EdNumReq.Value = 0 Then
      Begin
         MsgDlg('Número da requisição não foi preenchido','Erro',mtError,[mbOk],0);
         EdNumReq.SetFocus;
      End
   Else
   If edQtde.Value = 0 Then
      Begin
         MsgDlg('Quatidade baixada não foi preenchido','Erro',mtError,[mbOk],0);
         edQtde.SetFocus;
      End
   Else
   If Trim(EdData.Text) = '' Then
      Begin
         MsgDlg('Data de requisição não foi preenchida','Erro',mtError,[mbOk],0);
         EdData.SetFocus;
      End
   Else
      Begin
         If  BaixaPerda.RealizaBaixa(StrToIntDef(dblcPerda.LookupValue,-1),
                                     Sistema.IdEmpresa,
                                     edValb.Value,
                                     edQtde.Value,
                                     Modulo.iCodCusteio,
                                     Modulo.iCodAlmoxa,
                                     cdsArtigo.FieldByName('CODARTIGO').AsString,
                                     dblcUn.LookupValue,
                                     edData.Date,
                                     edNumReq.Text,
                                     Modulo.sCCustoAlmoxa,
                                     StrToIntDef(dblcAtiv.LookupValue,0) )
         Then
            MsgDlg('Baixa realizado com sucesso','Informação',mtInformation,[mbOk],0)
         Else
            MsgDlg(BaixaPerda.MessageInfo,'Erro',mtError,[mbOk],0);

         Limpa;
      End;
end;

procedure TFrmMTBaixaPerda.FormShow(Sender: TObject);
begin
  inherited;
  limpa;
end;

end.
