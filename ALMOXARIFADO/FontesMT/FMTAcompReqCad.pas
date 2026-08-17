{-------------------------------------------------------------------------------
 Data       : 18.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22576
 Descrição  : Tornei a aba Filtro como aba default
              Alterei os grids de requisição e Itens de requisição. Os SQLs foram
              alterados na sua origem de localização.
----------------------------------------------------------------------------------}

unit FMTAcompReqCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TEdNum, ComCtrls, Db,
  Wwdatsrc, DBClient, uCMClientDataSet, uCtrlAlmox, uCtrlArtigo,
  uCtrlGrupoProd,uCtrlCentroCusto, uCtrlUsuarioSistema,
  uCtrlReqMat, uFuncaoGeral, DBTables, Wwquery, TB97Tlwn, uCmSqlParams, uCtrlCadPlanCentCust, uCtrlParamGlobal;

type
  TFrmMTAcompReqCad = class(TfrmSairAjuda)
    dsItens: TwwDataSource;
    dsReq: TwwDataSource;
    dsAtend: TwwDataSource;
    PgcReq: TPageControl;
    TbFiltro: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label13: TLabel;
    EdNumReq: TEditNum;
    dblcCCust: TwwDBLookupCombo;
    GrpData: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edDataReqIni: TCMDateTimePicker;
    EdDataNecIni: TCMDateTimePicker;
    edDataAtendIni: TCMDateTimePicker;
    edDataReqFim: TCMDateTimePicker;
    EdDataNecFim: TCMDateTimePicker;
    edDataAtendFim: TCMDateTimePicker;
    RgStatus: TRadioGroup;
    Panel1: TPanel;
    btSelecionar: TBitBtn;
    dblcAlmox: TwwDBLookupCombo;
    dblcGrpProd: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    BtnLimpar: TBitBtn;
    dblcUsu: TwwDBLookupCombo;
    TbResult: TTabSheet;
    Splitter1: TSplitter;
    plnReq: TPanel;
    plnlbReq: TPanel;
    fcLabel1: TfcLabel;
    GrdReq: TwwDBGrid;
    plnItem: TPanel;
    plnLbItem: TPanel;
    fcLabel2: TfcLabel;
    GrdItem: TwwDBGrid;
    cdsAtend: TCMClientDataSet;
    cdsReq: TCMClientDataSet;
    cdsItem: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    cdsUsu: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    twViewAtend: TToolWindow97;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    plnTitulo: TPanel;
    GrdAtend: TwwDBGrid;
    cdsParamGlobal: TCMClientDataSet;
    cdsPlanCentCusto: TCMClientDataSet;
    cboPlano: TwwDBLookupCombo;
    Label14: TLabel;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure EdNumReqKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumReqExit(Sender: TObject);
    procedure dsReqDataChange(Sender: TObject; Field: TField);
    procedure BtnLimparClick(Sender: TObject);
    procedure edDataReqIniEnter(Sender: TObject);
    procedure EdDataNecIniEnter(Sender: TObject);
    procedure edDataAtendIniExit(Sender: TObject);
    procedure dblcGrpProdExit(Sender: TObject);
    procedure dblcDescExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdItemDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cboPlanoChange(Sender: TObject);
  private
     CtrlCadPlanCentCust : TCtrlCadPlanCentCust;
     CtrlParamGlobal     : TCtrlParamGlobal;
     ReqMat         : TCtrlReqMat;
     Almox          : TCtrlAlmox;
     Artigo         : TCtrlArtigo;
     GrupoProd      : TCtrlGrupoProd;
     CentroCusto    : TCtrlCentroCusto;
     UsuarioSistema : TCtrlUsuarioSistema;
  public
    { Public declarations }
  end;

var
  FrmMTAcompReqCad: TFrmMTAcompReqCad;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DbaseDados;

procedure TFrmMTAcompReqCad.FormCreate(Sender: TObject);
begin
  inherited;
  ReqMat := TCtrlReqMat.Create;
  ReqMat.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  
  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs(ReqMat);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(ReqMat);

  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.InitializeAs(ReqMat);

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs(ReqMat);

  UsuarioSistema := TCtrlUsuarioSistema.Create;
  UsuarioSistema.InitializeAs(ReqMat);

  // Marchetti - Pendencia 27699
  CtrlCadPlanCentCust := TCtrlCadPlanCentCust.Create;
  CtrlParamGlobal     := TCtrlParamGlobal.Create;
  
  CtrlCadPlanCentCust.InitializeAs(ReqMat);
  CtrlParamGlobal.InitializeAs(ReqMat);

  cdsParamGlobal.Data   := CtrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);
  cdsPlanCentCusto.Data := CtrlCadPlanCentCust.Lista(-1);
  cboPlano.LookupValue  := cdsParamGlobal.FieldByName('IDPLANCENTCUST').AsString;

//  cdsCCusto.Data    := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');

  // Fim Marchetti - Pendencia 27699

  cdsUsu.Data       := UsuarioSistema.ListaUsuarioSistema;
  cdsGrupoProd.Data := GrupoProd.ListGrupoProd;
  cdsAlmox.Data     := Almox.ListAlmox(Sistema.IdEmpresa);
  cdsArtigo.Data    := Artigo.ListArtigo;

  pgcReq.ActivePage := tbFiltro;
end;

procedure TFrmMTAcompReqCad.EdNumReqKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Case key of
    '0'..'9',#8:;
  Else
    Key := #0;
  End;

end;

procedure TFrmMTAcompReqCad.EdNumReqExit(Sender: TObject);
begin
  inherited;
  RgStatus.ItemIndex    := 0;
  edDataReqIni.Text     := '';
  EdDataNecIni.Text     := '';
  edDataAtendIni.Text   := '';
  edDataReqFim.Text     := '';
  edDataNecFim.Text     := '';
  edDataAtendFim.Text   := '';
  dblcCCust.Text        := '';
  dblcAlmox.Text        := '';
  dblcGrpProd.Text      := '';
  dblcDesc.Text         := '';
  dblcUsu.Text          := '';
  //
  RgStatus.Enabled       := True;
  edDataReqIni.Enabled   := True;
  EdDataNecIni.Enabled   := True;
  edDataAtendIni.Enabled := True;
  edDataReqFim.Enabled   := True;
  edDataNecFim.Enabled   := True;
  edDataAtendFim.Enabled := True;
  dblcCCust.Enabled      := True;
  dblcAlmox.Enabled      := True;
  dblcGrpProd.Enabled    := True;
  dblcDesc.Enabled       := True;
end;

procedure TFrmMTAcompReqCad.dsReqDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  CdsItem.DisableControls;
  Try
    CdsItem.Data := ReqMat.GetItemReqMat(cdsReq.FieldByName('NUMREQUISICAO').asInteger);
    TFloatField(CdsItem.FieldByName('VALORUN')).DisplayFormat := '#,##0.00';
    TFloatField(CdsItem.FieldByName('QTDEPEDIDA')).DisplayFormat := '#,##0.00';
    TFloatField(CdsItem.FieldByName('QTDEPENDENTE')).DisplayFormat := '#,##0.00';
  Finally
      CdsItem.EnableControls;
  End;
end;

procedure TFrmMTAcompReqCad.BtnLimparClick(Sender: TObject);
begin
  inherited;
  EdNumReq.Text         := '';
  RgStatus.ItemIndex    := 0;
  edDataReqIni.Text     := '';
  EdDataNecIni.Text     := '';
  edDataAtendIni.Text   := '';
  edDataReqFim.Text     := '';
  edDataNecFim.Text     := '';
  edDataAtendFim.Text   := '';
  dblcCCust.Text        := '';
  dblcAlmox.Text        := '';
  dblcGrpProd.Text      := '';
  dblcDesc.Text         := '';
  dblcUsu.Text          := '';
  //
  RgStatus.Enabled       := True;
  edDataReqIni.Enabled   := True;
  EdDataNecIni.Enabled   := True;
  edDataAtendIni.Enabled := True;
  edDataReqFim.Enabled   := True;
  edDataNecFim.Enabled   := True;
  edDataAtendFim.Enabled := True;
  dblcCCust.Enabled      := True;
  dblcAlmox.Enabled      := True;
  dblcGrpProd.Enabled    := True;
  dblcDesc.Enabled       := True;
end;

procedure TFrmMTAcompReqCad.edDataReqIniEnter(Sender: TObject);
begin
  inherited;
 If (edDataReqFim.Text) <> '' Then
     Begin
         If edDataReqFim.Date < edDataReqIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataReqIni.SetFocus;
           End;
     End;
end;

procedure TFrmMTAcompReqCad.EdDataNecIniEnter(Sender: TObject);
begin
  inherited;
 If (edDataReqIni.Text) <> '' Then
     Begin
         If edDataReqFim.Date <  edDataReqIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataReqFim.SetFocus;
           End;

     End;
end;

procedure TFrmMTAcompReqCad.edDataAtendIniExit(Sender: TObject);
begin
  inherited;
  If (edDataAtendFim.Text) <> '' Then
     Begin
         If edDataAtendFim.Date <  edDataAtendIni.Date Then
           Begin
              MsgDlg('Data inicial não pode ser maior que a'+#13+#10+'data final.','Erro',mtError,[mbOK],0);
              edDataAtendIni.SetFocus;
           End;
     End;
end;

procedure TFrmMTAcompReqCad.dblcGrpProdExit(Sender: TObject);
begin
  inherited;
  If (Trim(dblcGrpProd.Text) <> '') Then
      dblcDesc.Text := '';
end;

procedure TFrmMTAcompReqCad.dblcDescExit(Sender: TObject);
begin
  inherited;
  If (Trim(dblcDesc.Text) <> '') Then
      dblcGrpProd.Text := '';
end;

procedure TFrmMTAcompReqCad.FormActivate(Sender: TObject);
begin
  inherited;
  if Sistema.IdRAD <> 0 then
     btSelecionar.Click;
end;

procedure TFrmMTAcompReqCad.btSelecionarClick(Sender: TObject);
Var
   IdRad : Double;
begin
  inherited;
  IdRad := 0;
  If Sistema.UsaRAD  Then
     IdRad := Sistema.IdRAD;

  cdsReq.Data := ReqMat.ListReqCad(Sistema.IdEmpresa,
                                   IdRad,
                                   StrToIntDef(EdNumReq.Text,0),
                                   TStatusReq(RgStatus.ItemIndex),
                                   FuncaoGeral.Decode(Trim(dblcCCust.Text)  ,'','',dblcCCust.LookupValue),
                                   StrToIntDef(dblcAlmox.LookupValue,0),
                                   FuncaoGeral.Decode(Trim(dblcGrpProd.Text),'','',dblcGrpProd.LookupValue),
                                   FuncaoGeral.Decode(Trim(dblcDesc.Text)   ,'','',dblcDesc.LookupValue),
                                   StrToIntDef(dblcUsu.LookupValue,0),
                                   edDataReqIni.Date,
                                   edDataReqFim.Date,
                                   EdDataNecIni.Date,
                                   EdDataNecFim.Date,
                                   edDataAtendIni.Date,
                                   edDataAtendFim.Date);


  PgcReq.ActivePage := TbResult;
  GrdReq.SetFocus;
end;

procedure TFrmMTAcompReqCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlParamGlobal );
  FreeAndNil( CtrlCadPlanCentCust );

  ReqMat.Free;
  Almox.Free;
  Artigo.Free;
  GrupoProd.Free;
  CentroCusto.Free;
  UsuarioSistema.Free;
  inherited;

end;

procedure TFrmMTAcompReqCad.GrdItemDblClick(Sender: TObject);
begin
  inherited;
  cdsAtend.Data := ReqMat.GetAtendimentoItem(cdsReq.FieldByName('NUMREQUISICAO').asFloat,
                                             cdsItem.FieldByName('CODARTIGO').asString);

  If Not cdsAtend.IsEmpty Then
    Begin
       plnTitulo.Caption := ' Requisição: '+cdsReq.FieldByName('NUMREQUISICAO').asString+'     Artigo: '+cdsItem.FieldByName('DESCRICAO').asString;
       twViewAtend.Show;
    End
  Else
     MsgDlg('Item '+cdsItem.FieldByName('DESCRICAO').asString+' não foi atendido','Informação',mtInformation,[mbOK],0);
end;

procedure TFrmMTAcompReqCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  twViewAtend.Hide;
end;

procedure TFrmMTAcompReqCad.cboPlanoChange(Sender: TObject);
begin
   inherited;
   cdsCCusto.Data    := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A', StrToInt(cboPlano.LookupValue));
end;



end.
