unit FMTAcompSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TEdNum, ComCtrls, Db,
  DBClient, uCMClientDataSet,uCtrlAlmox, uCtrlArtigo,uFuncaoGeral,
  uCtrlGrupoProd,uCtrlCentroCusto, uCtrlUsuarioSistema, Wwdatsrc,
  uCtrlSoliCompra, uCmSqlParams, TB97Tlwn, Menus, shellapi, wwriched;

type
  TFrmMTAcompSCI = class(TfrmSairAjuda)
    PgcSCI: TPageControl;
    TbFiltro: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    EdNumSCI: TEditNum;
    dblcCCust: TwwDBLookupCombo;
    GrpData: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edDataEmisIni: TCMDateTimePicker;
    EdDataNecIni: TCMDateTimePicker;
    edDataEmisFim: TCMDateTimePicker;
    EdDataNecFim: TCMDateTimePicker;
    RgStatus: TRadioGroup;
    Panel1: TPanel;
    dblcAlmox: TwwDBLookupCombo;
    dblcGrpProd: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUsu: TwwDBLookupCombo;
    TbResult: TTabSheet;
    Splitter1: TSplitter;
    plnReq: TPanel;
    plnlbReq: TPanel;
    fcLabel1: TfcLabel;
    GrdSCI: TwwDBGrid;
    plnItem: TPanel;
    plnLbItem: TPanel;
    fcLabel2: TfcLabel;
    GrdItem: TwwDBGrid;
    cdsArtigo: TCMClientDataSet;
    cdsUsu: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    btnLimpar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    cdsSCI: TCMClientDataSet;
    dsSCI: TwwDataSource;
    cdsItem: TCMClientDataSet;
    dsItens: TwwDataSource;
    twView: TToolWindow97;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    plnTitulo: TPanel;
    GrdItemOC: TwwDBGrid;
    cdsItemOC: TCMClientDataSet;
    dsItemOC: TwwDataSource;
    PopupMenu1: TPopupMenu;
    VisualizarOC1: TMenuItem;
    VisualizarRecebimento1: TMenuItem;
    GrdReceb: TwwDBGrid;
    dsReceb: TwwDataSource;
    cdsReceb: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    TbOservacao: TToolWindow97;
    Panel3: TPanel;
    btnFecha: TBitBtn;
    wwDBRichEdit1: TwwDBRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparClick(Sender: TObject);
    procedure EdNumSCIKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSelClick(Sender: TObject);
    procedure dsSCIDataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure VisualizarOC1Click(Sender: TObject);
    procedure VisualizarRecebimento1Click(Sender: TObject);
    procedure GrdItemDblClick(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
  private
    { Private declarations }
     Almox          : TCtrlAlmox;
     Artigo         : TCtrlArtigo;
     GrupoProd      : TCtrlGrupoProd;
     CentroCusto    : TCtrlCentroCusto;
     UsuarioSistema : TCtrlUsuarioSistema;
     SoliCompra     : TCtrlSoliCompra;
  public
    { Public declarations }
  end;

var
  FrmMTAcompSCI: TFrmMTAcompSCI;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTAcompSCI.FormCreate(Sender: TObject);
begin
  inherited;
  TbOservacao.Hide;
  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  SoliCompra := TCtrlSoliCompra.Create;
  SoliCompra.InitializeAs(Almox);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(Almox);

  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.InitializeAs(Almox);

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs(Almox);

  UsuarioSistema := TCtrlUsuarioSistema.Create;
  UsuarioSistema.InitializeAs(Almox);

  cdsCCusto.Data    := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');
  cdsUsu.Data       := UsuarioSistema.ListaUsuarioSistema;
  cdsGrupoProd.Data := GrupoProd.ListGrupoProd;
  cdsAlmox.Data     := Almox.ListAlmox(Sistema.IdEmpresa);
  cdsArtigo.Data    := Artigo.ListArtigo;

  PgcSCI.ActivePageIndex := 0;

end;

procedure TFrmMTAcompSCI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Almox.Free;
  Artigo.Free;
  GrupoProd.Free;
  CentroCusto.Free;
  UsuarioSistema.Free;

end;

procedure TFrmMTAcompSCI.btnLimparClick(Sender: TObject);
begin
  inherited;
  PgcSCI.ActivePageIndex := 0;

  EdNumSCI.Text         := '';
  RgStatus.ItemIndex    := 0;
  edDataEmisIni.Text    := '';
  EdDataNecIni.Text     := '';
  edDataEmisFim.Text    := '';
  edDataNecFim.Text     := '';
  dblcCCust.Text        := '';
  dblcAlmox.Text        := '';
  dblcGrpProd.Text      := '';
  dblcDesc.Text         := '';
  dblcUsu.Text          := '';
  //
  RgStatus.Enabled       := True;
  edDataEmisIni.Enabled  := True;
  EdDataNecIni.Enabled   := True;
  edDataEmisFim.Enabled  := True;
  edDataNecFim.Enabled   := True;
  dblcCCust.Enabled      := True;
  dblcAlmox.Enabled      := True;
  dblcGrpProd.Enabled    := True;
  dblcDesc.Enabled       := True;
end;

procedure TFrmMTAcompSCI.EdNumSCIKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
Case key of
    '0'..'9',#8:;
  Else
    Key := #0;
  End;
end;

procedure TFrmMTAcompSCI.BtnSelClick(Sender: TObject);
begin
  inherited;
  cdsSCI.Data := SoliCompra.ListAcompSCI(Sistema.IdEmpresa,
                                         StrToIntDef(EdNumSCI.Text,0),
                                         TStatusSCI(RgStatus.ItemIndex),
                                         FuncaoGeral.Decode(Trim(dblcCCust.Text)  ,'','',dblcCCust.LookupValue),
                                         StrToIntDef(dblcAlmox.LookupValue,0),
                                         FuncaoGeral.Decode(Trim(dblcGrpProd.Text),'','',dblcGrpProd.LookupValue),
                                         FuncaoGeral.Decode(Trim(dblcDesc.Text)   ,'','',dblcDesc.LookupValue),
                                         StrToIntDef(dblcUsu.LookupValue,0),
                                         edDataEmisIni.Date,
                                         edDataEmisFim.Date,
                                         EdDataNecIni.Date,
                                         EdDataNecFim.Date );


  PgcSCI.ActivePage := TbResult;
  GrdSCI.SetFocus;
end;

procedure TFrmMTAcompSCI.dsSCIDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  CdsItem.DisableControls;
  Try
    CdsItem.Data := SoliCompra.GetItem(cdsSCI.FieldByName('NUMSOLCOMPRA').asInteger,Modulo.iCodCusteio);
    TFloatField(CdsItem.FieldByName('VALORUN')).DisplayFormat := '#,##0.00';
    TFloatField(CdsItem.FieldByName('QTDEPEDIDA')).DisplayFormat := '#,##0.00';
    TFloatField(CdsItem.FieldByName('QTDEPENDENTE')).DisplayFormat := '#,##0.00';
  Finally
      CdsItem.EnableControls;
  End;

end;

procedure TFrmMTAcompSCI.BitBtn1Click(Sender: TObject);
begin
  inherited;
  twView.Hide;
end;

procedure TFrmMTAcompSCI.VisualizarOC1Click(Sender: TObject);
begin
  inherited;
  cdsItemOC.Data := SoliCompra.ListItemSolixOC(cdsItem.FieldByName('IDITEMSOLI').asFloat);
  TFloatField(CdsItemOC.FieldByName('VALORUN')).DisplayFormat := '#,##0.00';
  TFloatField(CdsItemOC.FieldByName('QTDEPEDIDA')).DisplayFormat := '#,##0.00';
  TFloatField(CdsItemOC.FieldByName('QTDERECEBIDA')).DisplayFormat := '#,##0.00';

  If Not cdsItemOC.IsEmpty Then
    Begin
       plnTitulo.Caption := ' Nº S.C.I.: '+cdsSCI.FieldByName('NUMSOLCOMPRA').asString+'     Artigo: '+cdsItem.FieldByName('DESCRICAO').asString;
       twView.Caption := 'Visualização da Ordem de Compra';
       GrdItemOC.BringToFront;
       twView.Show;
    End
  Else
     MsgDlg('Item '+cdsItem.FieldByName('DESCRICAO').asString+' não foi gerada O.C. para esta solicitação','Informação',mtInformation,[mbOK],0);
end;

procedure TFrmMTAcompSCI.VisualizarRecebimento1Click(Sender: TObject);
begin
  inherited;
  cdsReceb.Data := SoliCompra.ListItemSolixReceb(cdsItem.FieldByName('IDITEMSOLI').asFloat);
  TFloatField(cdsReceb.FieldByName('VLRUNITARIO')).DisplayFormat := '#,##0.00';
  TFloatField(cdsReceb.FieldByName('QTDE')).DisplayFormat := '#,##0.00';

  If Not cdsReceb.IsEmpty Then
    Begin
       plnTitulo.Caption := ' Nº S.C.I.: '+cdsSCI.FieldByName('NUMSOLCOMPRA').asString+'     Artigo: '+cdsItem.FieldByName('DESCRICAO').asString;
       twView.Caption := 'Visualização dos Recebimentos';
       GrdReceb.BringToFront;
       twView.Show;
    End
  Else
     MsgDlg('Item '+cdsItem.FieldByName('DESCRICAO').asString+' não foi efetuado o recebimento','Informação',mtInformation,[mbOK],0);

  
end;

procedure TFrmMTAcompSCI.GrdItemDblClick(Sender: TObject);
begin
  inherited;
  TbOservacao.Show; 
end;

procedure TFrmMTAcompSCI.btnFechaClick(Sender: TObject);
begin
  inherited;
  TbOservacao.Hide;
end;

end.
