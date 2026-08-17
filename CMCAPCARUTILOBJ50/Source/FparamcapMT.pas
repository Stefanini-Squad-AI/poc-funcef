{------------------------------------------------------------------------------
 Data      : 29/08/2011
 Autor     : José Roberto Marque
 Pendência : SOL: 136242 / Kintana: 813941
 Descrição : Criado 3 parametros na paramcap: VlrMinIRRF, VlrMinCS e
             VlrBaseINSS todos na aba "Lançamento de documentos".
{------------------------------------------------------------------------------
 Data      : 30/07/2007
 Autor     : Marcus Oliveira
 Pendência : 25312
 Descrição : Criado 2 parametros na paramcap: IdPlanoPrev e IdPatro.
{------------------------------------------------------------------------------
  Analista : Marcus Oliveira - 07/05/2007
  Aba      : Lançamento de documentos
  Descrição: A Pedido do Alex, removido a palavra Contabil do texto:
             No Rateio do Documento, Obrigar o Mesmo Plano Previdenciário "Contabil" Somente
             para Desembolsos/Recebimentos Positivos
{------------------------------------------------------------------------------
 Rotinas   : HabilitaTabControls
 Data      : 24/11/2006
 Autor     : Rodolpho da Silva
 Pendência : 23832
 Descrição : Implementar método para desabilitar/habilitar as Tabs e evitar
             que o usuário manipule os controles SEM clicar no botão alterar
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotinas   : Divs
 Data      : 02/06/2006
 Autor     : Alex Pereira
 Pendência : 22515
 Descrição : Modificar parametrização contábil tabela aranha
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotinas   : procure pelo número da pendência
 Data      : 27/04/2005
 Autor     : André Tavares
 Pendência : 19097
 Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Contas a Pagar e Receber   }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Cadastro de parâmetros do sistema                   }
{                                                       }
{ Analista Responsável: Fabio Barros                    }
{ Atualizado Em: 29/07/2002                             }
{                                                       }
{ Atualizado Em: 20/05/2003                             }
{ Flavio Dias - criação de parâmetro para geração do RAD}
{ na criação do lote  (tbsRadLote)                      }
{*******************************************************}

unit FparamcapMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, StdCtrls, ComCtrls, Mask,
  DBCtrls, cmseldlg, wwidlg,UMenserro, Wwdatsrc, MAHlpBtn, Buttons,
  ToolWin, wwdbedit, Wwdbspin, wwdblook, TB97, TB97Ctls, TB97Tlbr,
  MontaSelect, Wwdotdot, Wwdbcomb, Printers, IvDictio, IvMulti,
  IvEMulti, uModulo, Grids, Wwdbigrd, Wwdbgrid, TREdit, BfDialogs,
  BrowseFolder, uProcuraDir, ImgList, CMDBLookupCombo, CmEventosCadastro,
  DBClient, uCMClientDataSet, uCMTypes, uCmSqlParams, uCtrlParamIntegra,
  FCadastroMT, uCtrlRamoFornecedor, uCtrlTipoAlterador, uCtrlTipoCliente,
  uCtrlPortadorForma, uCtrlTipoDocRecPag, uCtrlParamCap, uCtrlTipoRecebDesemb,
  uIntegraBack;

CONST
   NUMASS_CAP = 28;
   NUMASS_CAR = 4;

Type
   TParamRel = Record
      IDMODULO      : Integer;
      IDPESSOA      : Integer;
      NOMECOMPO     : String;
      DESCRICAO     : String;
      VALOR         : String;
      NOMERALATORIO : String;
End;

type
  TfrmParamCapMT = class(TFrmCadastroMT)
    PageContas: TPageControl;
    TbsGeralI: TTabSheet;
    grpMascara: TGroupBox;
    dbedMascara: TDBEdit;
    grpIntegracao: TGroupBox;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    GroupBox1: TGroupBox;
    wwDBSpinEdit7: TwwDBSpinEdit;
    DirDlg: TProcuraDirDlg;
    ImlReports: TImageList;
    TbsGeralII: TTabSheet;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    wwDBLookupCombo7: TwwDBLookupCombo;
    wwDBLookupCombo8: TwwDBLookupCombo;
    wwDBLookupCombo9: TwwDBLookupCombo;
    CkbCalcBaixa: TDBCheckBox;
    CkbTalao: TDBCheckBox;
    TbsBaixas: TTabSheet;
    GrpHistFinanc: TGroupBox;
    dblkcmbfinan: TwwDBLookupCombo;
    GbAlt: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo4: TwwDBLookupCombo;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    dbrgrpLancaFin: TDBRadioGroup;
    RgCanceLote: TDBRadioGroup;
    TbsRelatorios: TTabSheet;
    Panel1: TPanel;
    Pnldocpendentes: TPanel;
    TreeAssin: TTreeView;
    grpIntervalos: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dias: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBSpinEdit2: TwwDBSpinEdit;
    wwDBSpinEdit3: TwwDBSpinEdit;
    wwDBSpinEdit4: TwwDBSpinEdit;
    wwDBSpinEdit5: TwwDBSpinEdit;
    wwDBSpinEdit6: TwwDBSpinEdit;
    CkcFloatContabil: TDBCheckBox;
    GroupBox3: TGroupBox;
    wwDBEdit1: TwwDBEdit;
    Label13: TLabel;
    DBCheckBox3: TDBCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    DbeReports: TwwDBEdit;
    SpeedButton2: TSpeedButton;
    MsReports: TMontaSelect;
    GpbTipoDesemb: TGroupBox;
    RgTipoRd1: TDBCheckBox;
    RgTipoRd2: TDBCheckBox;
    dbrgStatusFinanc: TDBRadioGroup;
    LblAdtoForCli: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    LblRamoTipoForCli: TLabel;
    CbCli: TwwDBLookupCombo;
    CmDblRamoForn: TCMDBLookupCombo;
    LblEmisCqCarta: TLabel;
    dbedLocal: TDBEdit;
    CmbTipODocCpmf: TwwDBLookupCombo;
    Label17: TLabel;
    CmbContasCaixaCheque: TwwDBLookupCombo;
    Label5ContascaixaCheque: TLabel;
    sqlModImp: TCMSqlParams;
    cdsModImp: TCMClientDataSet;
    cdsTipoCli: TCMClientDataSet;
    cdsAltJurosCor: TCMClientDataSet;
    cdsRamoForn: TCMClientDataSet;
    cdsJuros: TCMClientDataSet;
    cdsAltAbatDesc: TCMClientDataSet;
    cdsFormaRecPag: TCMClientDataSet;
    sqlHistFinanc: TCMSqlParams;
    cdsTipoDoc: TCMClientDataSet;
    cdsDesembolso: TCMClientDataSet;
    cdsHistFinanc: TCMClientDataSet;
    cdsTipoDocCPMF: TCMClientDataSet;
    cdsParamRel: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    dbchkModAdDocPG: TDBCheckBox;
    tbsRadLote: TTabSheet;
    dbrgRADLote: TDBRadioGroup;
    GrbIntegraOrc: TGroupBox;
    spdIntegraOrc: TSpeedButton;
    NspdIntegraOrc: TSpeedButton;
    chkFloatdiasuteis: TDBCheckBox;
    tbsIntegacao: TTabSheet;
    GroupBox4: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    ChkContaContabil: TDBCheckBox;
    ChkContaContabilPass: TDBCheckBox;
    GroupBox5: TGroupBox;
    chkPcp1: TDBCheckBox;
    chkPcp2: TDBCheckBox;
    chkPcp3: TDBCheckBox;
    chkPcp4: TDBCheckBox;
    chkPcp5: TDBCheckBox;
    chkPcp6: TDBCheckBox;
    chkPcp7: TDBCheckBox;
    chkPcp8: TDBCheckBox;
    panTipoRecDes: TPanel;
    ChkObrigaUsuario: TDBCheckBox;
    tbstLancDoc: TTabSheet;
    CkbEmiteChq: TDBCheckBox;
    ChkObrigaFormaPagto: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    ChkObrigaProg: TDBCheckBox;
    dbckbRestringeAcesso: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    chkbRateio: TDBCheckBox;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    cmbPlanoPrev: TwwDBLookupCombo;
    Label6: TLabel;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    cmbPatro: TwwDBLookupCombo;
    dbChkDesvinculaCentrocusto: TDBCheckBox;
    dbckLogfinan: TDBCheckBox;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label12: TLabel;
    wwDBEdit3: TwwDBEdit;
    GroupBox8: TGroupBox;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtVLRMINIRRF: TDBRealEdit;
    edtVLRMINCS: TDBRealEdit;
    edtVLRBASEINSS2: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);


    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TreeAssinEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TreeAssinEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DbeReportsExit(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure dbedMascaraKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure spdIntegraOrcClick(Sender: TObject);
    procedure NspdIntegraOrcClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    _RamoFornecedor  : TCtrlRamoFornecedor;
    _TipoAlterador   : TCtrlTipoAlterador;
    _TipoCliente     : TCtrlTipoCliente;
    _PortadorForma   : TCtrlPortadorForma;
    _TipoDocumento   : TCtrlTipoDocRecPag;
    _TipoRecebDesemb : TCtrlTipoRecebDesemb;
    _ParamCAP        : TCtrlParamCAP;


    LstParamRel : TStringList;
    ParamRel    : Array [0..28] of TParamRel;
    sOldMascara : String;
    procedure MontaArvoreParamRelats;

    // Rodolpho da Silva - P: 23832 - 24/11/2006
    procedure HabilitaTabControls(bHabilitar: boolean);

  public
    { Public declarations }
  end;

var
  frmParamCapMT: TfrmParamCapMT;


implementation

uses USistema, UAutorizacao, uFuncaoGeral, uDataBase, dBaseDados;

{$R *.DFM}

procedure TfrmParamCapMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  pnlFundo.Enabled      := True;
  grpIntegracao.Enabled := bbtnConfirmar.Enabled;
  GrbIntegraOrc.Enabled := bbtnConfirmar.Enabled;
  sbtnAlterar.Enabled   := True;
End;

procedure TfrmParamCapMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  PageContas.ActivePage := TbsGeralI;
end;

Procedure TfrmParamCapMT.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  sqlAux.SQL.Clear;
  sqlAux.SQL.Text := 'SELECT CODDOCUMENTO FROM DOCUMENTO WHERE ROWNUM = 1';
  sqlAux.Open;
  if (not cdsAux.IsEmpty) and
     (Trim(sOldMascara) <> Trim(cds.FieldByName('MASCARANODOCUM').AsString)) then
  begin
    MsgDlg('A máscara para o número do documento não pode ser alterada pois existem documentos lançados','Aviso',mtError,[mbOk],0);
    Exit;
  end;

  if dbedMascara.Text  = ''  then
  begin
    MsgDlg('Indicar a máscara para desembolso','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    If dbedMascara.CanFocus Then dbedMascara.SetFocus;
    Exit;
  end;

  if wwdbspinedit1.text  = ''  then
  begin
    MsgDlg('Indicar os parâmetros para o relatório','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if wwdbspinedit1.CanFocus then wwdbspinedit1.SetFocus;
    exit;
  end;

  if (wwdbspinedit2.Text <> '') and
     (wwdbspinedit2.value < wwdbspinedit1.value) then
  begin
    MsgDlg('O parâmetro digitado ten de ser maior que o anterior','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if wwdbspinedit2.CanFocus then wwdbspinedit2.SetFocus;
    exit;
  end;

  if (wwdbspinedit3.Text <> '') and
     (wwdbspinedit3.Value < wwdbspinedit2.Value) then
  begin
    MsgDlg('O parâmetro digitado ten de ser maior que o anterior','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if wwdbspinedit3.CanFocus then wwdbspinedit3.SetFocus;
    exit;
  end;

  if (wwdbspinedit4.Text <> '') and
     (wwdbspinedit4.Value < wwdbspinedit3.value) then
  begin
    MsgDlg('O parâmetro digitado ten de ser maior que o anterior','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if wwdbspinedit4.CanFocus then  wwdbspinedit4.SetFocus;
    exit;
  end;

  if (wwdbspinedit5.Text <> '') and
     (wwdbspinedit5.Value < wwdbspinedit4.Value) then
  begin
    MsgDlg('O parâmetro digitado ten de ser maior que o anterior','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if wwdbspinedit5.CanFocus then wwdbspinedit5.SetFocus;
    exit;
  end;

  if (wwdbspinedit6.Text <> '') and
     (wwdbspinedit6.Value < wwdbspinedit5.Value) then
  begin
    MsgDlg('O parâmetro digitado ten de ser maior que o anterior','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if wwdbspinedit6.CanFocus then wwdbspinedit6.SetFocus;
    exit;
  end;

  if (dbrgrpLancafin.Value = '') And (ParamIntegra.RecPag = 'P') then
  begin
    MsgDlg('Indicar o momento de Lançamento no financeiro','Aviso',mtError,[mbOk],0);
    exit;
  end;

  if dbedLocal.Text = '' then
  begin
    MsgDlg('Indicar o Local de Emissão dos Cheques','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsGeralI;
    if dbedLocal.CanFocus then dbedLocal.SetFocus;
    exit;
  end;

  if (cds.FieldByName('IntegraContab').AsString <> 'S') AND
     (cds.FieldByName('IntegraContab').AsString <> 'N') then
  begin
    MsgDlg('Indicar se existe integração com a contabilidade','Aviso',mtError,[mbOk],0);
    exit;
  end;
  Accept := True;
end;

procedure TfrmParamCapMT.BitBtn1Click(Sender: TObject);
begin
  cds.FieldByName('IntegraContab').AsString := 'S';
  inherited;
end;

procedure TfrmParamCapMT.BitBtn2Click(Sender: TObject);
begin
  cds.FieldByName('IntegraContab').AsString := 'N';
  inherited;
end;

procedure TfrmParamCapMT.FormCreate(Sender: TObject);
Var
  X, TotAss: Integer;
begin
  // início - andre tavares - pendencia 19543 - 05/08/2005
  tbsRadLote.TabVisible  := sistema.idmodulo <> 4;
  GrbIntegraOrc.Visible  := sistema.idmodulo <> 4;
  Label17.Enabled        := sistema.idmodulo <> 4;
  CmbTipODocCpmf.Enabled := sistema.idmodulo <> 4;
  DBCheckBox4.Enabled    := sistema.idmodulo <> 4;
  DBCheckBox5.Enabled    := sistema.idmodulo <> 4;
  DBCheckBox6.Enabled    := sistema.idmodulo <> 4;
  // fim - andre tavares - pendencia 19543 - 05/08/2005

  _RamoFornecedor     := TCtrlRamoFornecedor.Create;
  _TipoAlterador      := TCtrlTipoAlterador.Create;
  _TipoCliente        := TCtrlTipoCliente.Create;
  _PortadorForma      := TCtrlPortadorForma.Create;
  _TipoDocumento      := TCtrlTipoDocRecPag.Create;
  _TipoRecebDesemb    := TCtrlTipoRecebDesemb.Create;
  _ParamCAP           := TCtrlParamCAP.Create;

  _RamoFornecedor.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _TipoAlterador.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _TipoCliente.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _PortadorForma.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _TipoDocumento.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _TipoRecebDesemb.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _ParamCAP.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  _ParamCap._cds      := cds;
  _ParamCap._cdsRel   := cdsParamRel;

  cdsTipoCli.Data     := _TipoCliente.ListaTipoCliente(0);
  cdsRamoForn.Data    := _RamoFornecedor.ListaRamoFornecedor(0);
  cdsAltJurosCor.Data := _TipoAlterador.ListTipoalterador(Sistema.IdEmpresa,
                                                          ParamIntegra.RecPag, 0,
                                                          FuncaoGeral.Decode(ParamIntegra.RecPag, 'P', 'C', 'D'));

  cdsAltAbatDesc.Data := _TipoAlterador.ListTipoalterador(Sistema.IdEmpresa,
                                                          ParamIntegra.RecPag, 0,
                                                          FuncaoGeral.Decode(ParamIntegra.RecPag, 'P', 'D', 'C'));

  cdsJuros.Data       := _TipoAlterador.ListTipoalterador(Sistema.IdEmpresa,
                                                          ParamIntegra.RecPag, 0,
                                                          FuncaoGeral.Decode(ParamIntegra.RecPag, 'P', 'C', 'D'));

  cdsFormaRecPag.Data := _PortadorForma.ListPortadorFormaParamCap(ParamIntegra.RecPag, Sistema.IdEmpresa);
  cdsTipoDoc.Data     := _TipoDocumento.ListTipoDocRecPag(ParamIntegra.RecPag, 0);
  cdsTipoDocCPMF.Data := _TipoDocumento.ListTipoDocRecPag(ParamIntegra.RecPag, 0);

  MsReports.Filtro.Add('REPORTS.IDMODULO = ' + IntToStr(Sistema.IdModulo));
  PageContas.ActivePage := TbsGeralI;


  chkFloatdiasuteis.Visible := ParamIntegra.RecPag = 'R'; // andre tavares - 14/09/2004 - pendência 16954

  LstParamRel := TStringList.Create;
  if ParamIntegra.RecPag = 'R' then
  begin
    CkbCalcBaixa.Visible        := True;
    GbAlt.Top                   := 8;
    GrpHistFinanc.Top           := 130;
    CmDblRamoForn.Visible       := False;
    GpbTipoDesemb.Caption       := 'Cadastro de Tipos de Recebimento';
    ChkObrigaFormaPagto.Caption := 'Obriga Indicação de Tipos de Cobrança no Momento do Lançamento do Documento';
    // CATIA P:19394 20/06/2006
    ChkObrigaUsuario.Caption    := 'Obriga Preenchimento do campo "Usuario que lançou o documento"';
    ChkObrigaProg.Visible       := true;
    // FIM
    Caption                     := 'Parametros do Contas a Receber';
    LblAdtoForCli.caption       := 'Código do Adiantamento de Cliente';
    grpMascara.caption          := 'Máscara Recebimento';
    LblEmisCqCarta.caption      := 'Local de Emissão de Cartas';
    dbrgrpLancaFin.Visible      := False;
    RgCanceLote.Visible         := False;
    CkbEmiteChq.Visible         := False;
    CkbTalao.Visible            := False;
    dbrgrpLancaFin.Items.Clear;
    dbrgrpLancaFin.Items.Add('Exclusivamente no Recebimento do Documento');
    dbrgrpLancaFin.Items.Add('Emissão de Chq/Bord ou Recebimento do Doc.');
    Label5ContascaixaCheque.Visible := False;
    CmbContasCaixaCheque.Visible    := False;
    panTipoRecDes.Caption := 'Por TIPO DE RECEBIMENTO';
    ChkContaContabil.Caption     := 'Conta Contábil a Crédito';
    ChkContaContabilPass.Caption := 'Conta Contábil a Débito';
    for x:= 1 to 8 do
      (FindComponent('ChkPcp'+IntToStr(x)) as TDBCheckBox).Caption := 'Tipo de Recebimento' +
            (FindComponent('ChkPcp'+IntToStr(x)) as TDBCheckBox).Caption;
  end
  else
  begin
    CmDblRamoForn.Visible     := True;
    CkbCalcBaixa.Visible      := False;
    GbAlt.Top                 := 5;
    GrpHistFinanc.Top         := 86;
    Caption                   := 'Parametros do Contas a Pagar';
    LblAdtoForCli.caption     := 'Código do Adiantamento a Fornecedores';
    grpMascara.caption        := 'Máscara Desembolso';
    LblRamoTipoForCli.Caption := 'Ramo de Fornecedor Para Adiantamento';
    //CATIA P: 19394    20/06/2006
    chkobrigausuario.Visible   := False;
    chkobrigaprog.Visible      := True;

    dbrgrpLancaFin.Items.Clear;
    dbrgrpLancaFin.Items.Add('Exclusivamente no Pagamento do Documento');
    dbrgrpLancaFin.Items.Add('Emissão de Chq/Bord ou Pagamento do Doc.');
    panTipoRecDes.Caption        := 'Por TIPO DE DESEMBOLSO';
    ChkContaContabil.Caption     := 'Conta Contábil a Débito';
    ChkContaContabilPass.Caption := 'Conta Contábil a Crédito';
    for x:= 1 to 8 do
      (FindComponent('ChkPcp'+IntToStr(x)) as TDBCheckBox).Caption := 'Tipo de Desembolso' +
            (FindComponent('ChkPcp'+IntToStr(x)) as TDBCheckBox).Caption;
  end;
  cds.Data := _ParamCAP.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  
  inherited;

  if not cds.IsEmpty then
  begin
    if cds.FieldByName('INTEGRACONTAB').AsString = 'S' then
      sbtnSim.Down := True
    else
      sbtnNao.Down := True;

    //início - andre tavares - pendência 16971 - 18/10/2004
    if cds.FieldByName('FLGINTEGRAORC').AsString = 'S' then
      spdIntegraOrc.Down := True
    else
      NspdIntegraOrc.Down := True;
    //fim - andre tavares - pendência 16971 - 18/10/2004

    // Inicio Sol:136242 Kintana 813941 - José Roberto Marque
    {
    if Cds.FieldByName('VLRMINIRRF').AsFloat > 0 then
       wwVlrMinIRRF.Text := FloatToStr(Cds.FieldByName('VLRMINIRRF').AsFloat)
    else
       wwVlrMinIRRF.Text := '0.00';
    {
    if Cds.FieldByName('VLRMINCS').AsFloat > 0 then
       wwVlrMinCS.Text := FloatToStr(Cds.FieldByName('VLRMINCS').AsFloat)
    else
       wwVlrMinCS.Text := '0.00';
    {
    if Cds.FieldByName('VLRBASEINSS').AsFloat > 0 then
       wWVlrBaseINSS.Text := FloatToStr(Cds.FieldByName('VLRBASEINSS').AsFloat)
    else
       wWVlrBaseINSS.Text := '0.00';
    {}
    // fim Sol:136242 Kintana 813941 - José Roberto Marque

  end;

  cdsParamRel.Data := _ParamCAP.ListParamREL(Sistema.IDModulo, Sistema.IDEmpresa);
  if cdsParamRel.IsEmpty then
  begin
    if ParamIntegra.RecPag = 'P' then
    begin
      TotAss := NUMASS_CAP;
      ParamRel[0].IDMODULO:= Sistema.IdModulo; ParamRel[0].IDPESSOA:= Sistema.IdEmpresa; ParamRel[0].NOMERALATORIO:= 'Borderô Tipo Ordem de Pagamento'; ParamRel[0].NOMECOMPO:= 'Lbl1';  ParamRel[0].DESCRICAO:= 'Assinatura 1';
      ParamRel[1].IDMODULO:= Sistema.IdModulo; ParamRel[1].IDPESSOA:= Sistema.IdEmpresa; ParamRel[1].NOMERALATORIO:= 'Borderô Tipo Ordem de Pagamento'; ParamRel[1].NOMECOMPO:= 'Lbl2';  ParamRel[1].DESCRICAO:= 'Assinatura 2';
      ParamRel[2].IDMODULO:= Sistema.IdModulo; ParamRel[2].IDPESSOA:= Sistema.IdEmpresa; ParamRel[2].NOMERALATORIO:= 'Borderô Tipo Ordem de Pagamento'; ParamRel[2].NOMECOMPO:= 'Lbl3';  ParamRel[2].DESCRICAO:= 'Assinatura 3';
      ParamRel[3].IDMODULO:= Sistema.IdModulo; ParamRel[3].IDPESSOA:= Sistema.IdEmpresa; ParamRel[3].NOMERALATORIO:= 'Borderô Tipo Ordem de Pagamento'; ParamRel[3].NOMECOMPO:= 'Lbl4';  ParamRel[3].DESCRICAO:= 'Assinatura 4';

      ParamRel[4].IDMODULO:= Sistema.IdModulo; ParamRel[4].IDPESSOA:= Sistema.IdEmpresa; ParamRel[4].NOMERALATORIO:= 'Borderô Tipo Débito em Conta'; ParamRel[4].NOMECOMPO:= 'LblC1'; ParamRel[4].DESCRICAO:= 'Assinatura 1';
      ParamRel[5].IDMODULO:= Sistema.IdModulo; ParamRel[5].IDPESSOA:= Sistema.IdEmpresa; ParamRel[5].NOMERALATORIO:= 'Borderô Tipo Débito em Conta'; ParamRel[5].NOMECOMPO:= 'LblC2'; ParamRel[5].DESCRICAO:= 'Assinatura 2';
      ParamRel[6].IDMODULO:= Sistema.IdModulo; ParamRel[6].IDPESSOA:= Sistema.IdEmpresa; ParamRel[6].NOMERALATORIO:= 'Borderô Tipo Débito em Conta'; ParamRel[6].NOMECOMPO:= 'LblC3'; ParamRel[6].DESCRICAO:= 'Assinatura 3';
      ParamRel[7].IDMODULO:= Sistema.IdModulo; ParamRel[7].IDPESSOA:= Sistema.IdEmpresa; ParamRel[7].NOMERALATORIO:= 'Borderô Tipo Débito em Conta'; ParamRel[7].NOMECOMPO:= 'LblC4'; ParamRel[7].DESCRICAO:= 'Assinatura 4';

      ParamRel[8].IDMODULO := Sistema.IdModulo; ParamRel[8].IDPESSOA := Sistema.IdEmpresa; ParamRel[8].NOMERALATORIO := 'SLIP de Pagamentos'; ParamRel[8].NOMECOMPO := 'Lbls1'; ParamRel[8].DESCRICAO := 'Assinatura 1';
      ParamRel[9].IDMODULO := Sistema.IdModulo; ParamRel[9].IDPESSOA := Sistema.IdEmpresa; ParamRel[9].NOMERALATORIO := 'SLIP de Pagamentos'; ParamRel[9].NOMECOMPO := 'Lbls2'; ParamRel[9].DESCRICAO := 'Assinatura 2';
      ParamRel[10].IDMODULO:= Sistema.IdModulo; ParamRel[10].IDPESSOA:= Sistema.IdEmpresa; ParamRel[10].NOMERALATORIO:= 'SLIP de Pagamentos'; ParamRel[10].NOMECOMPO:= 'Lbls3'; ParamRel[10].DESCRICAO:= 'Assinatura 3';

      ParamRel[11].IDMODULO:= Sistema.IdModulo; ParamRel[11].IDPESSOA:= Sistema.IdEmpresa; ParamRel[11].NOMERALATORIO:= 'Aprovação de Documentos'; ParamRel[11].NOMECOMPO:= 'Lbla1'; ParamRel[11].DESCRICAO:= 'Assinatura 1';
      ParamRel[12].IDMODULO:= Sistema.IdModulo; ParamRel[12].IDPESSOA:= Sistema.IdEmpresa; ParamRel[12].NOMERALATORIO:= 'Aprovação de Documentos'; ParamRel[12].NOMECOMPO:= 'Lbla2'; ParamRel[12].DESCRICAO:= 'Assinatura 2';
      ParamRel[13].IDMODULO:= Sistema.IdModulo; ParamRel[13].IDPESSOA:= Sistema.IdEmpresa; ParamRel[13].NOMERALATORIO:= 'Aprovação de Documentos'; ParamRel[13].NOMECOMPO:= 'Lbla3'; ParamRel[13].DESCRICAO:= 'Assinatura 3';
      ParamRel[14].IDMODULO:= Sistema.IdModulo; ParamRel[14].IDPESSOA:= Sistema.IdEmpresa; ParamRel[14].NOMERALATORIO:= 'Aprovação de Documentos'; ParamRel[14].NOMECOMPO:= 'Lbla4'; ParamRel[14].DESCRICAO:= 'Assinatura 4';

      ParamRel[15].IDMODULO:= Sistema.IdModulo; ParamRel[15].IDPESSOA:= Sistema.IdEmpresa; ParamRel[15].NOMERALATORIO:= 'Autorização de Pagamentos'; ParamRel[15].NOMECOMPO:= 'Lblag1'; ParamRel[15].DESCRICAO:= 'Assinatura 1';
      ParamRel[16].IDMODULO:= Sistema.IdModulo; ParamRel[16].IDPESSOA:= Sistema.IdEmpresa; ParamRel[16].NOMERALATORIO:= 'Autorização de Pagamentos'; ParamRel[16].NOMECOMPO:= 'Lblag2'; ParamRel[16].DESCRICAO:= 'Assinatura 2';
      ParamRel[17].IDMODULO:= Sistema.IdModulo; ParamRel[17].IDPESSOA:= Sistema.IdEmpresa; ParamRel[17].NOMERALATORIO:= 'Autorização de Pagamentos'; ParamRel[17].NOMECOMPO:= 'Lblag3'; ParamRel[17].DESCRICAO:= 'Assinatura 3';
      ParamRel[18].IDMODULO:= Sistema.IdModulo; ParamRel[18].IDPESSOA:= Sistema.IdEmpresa; ParamRel[18].NOMERALATORIO:= 'Autorização de Pagamentos'; ParamRel[18].NOMECOMPO:= 'Lblag4'; ParamRel[18].DESCRICAO:= 'Assinatura 4';
      ParamRel[19].IDMODULO:= Sistema.IdModulo; ParamRel[19].IDPESSOA:= Sistema.IdEmpresa; ParamRel[19].NOMERALATORIO:= 'Autorização de Pagamentos'; ParamRel[19].NOMECOMPO:= 'Lblag5'; ParamRel[19].DESCRICAO:= 'Assinatura 5';

      ParamRel[20].IDMODULO:= Sistema.IdModulo; ParamRel[20].IDPESSOA:= Sistema.IdEmpresa; ParamRel[20].NOMERALATORIO:= 'Cópia de Cheque'; ParamRel[20].NOMECOMPO:= 'LblChq1'; ParamRel[20].DESCRICAO:= 'Assinatura 1';
      ParamRel[21].IDMODULO:= Sistema.IdModulo; ParamRel[21].IDPESSOA:= Sistema.IdEmpresa; ParamRel[21].NOMERALATORIO:= 'Cópia de Cheque'; ParamRel[21].NOMECOMPO:= 'LblChq2'; ParamRel[21].DESCRICAO:= 'Assinatura 2';
      ParamRel[22].IDMODULO:= Sistema.IdModulo; ParamRel[22].IDPESSOA:= Sistema.IdEmpresa; ParamRel[22].NOMERALATORIO:= 'Cópia de Cheque'; ParamRel[22].NOMECOMPO:= 'LblChq3'; ParamRel[22].DESCRICAO:= 'Assinatura 3';
      ParamRel[23].IDMODULO:= Sistema.IdModulo; ParamRel[23].IDPESSOA:= Sistema.IdEmpresa; ParamRel[23].NOMERALATORIO:= 'Cópia de Cheque'; ParamRel[23].NOMECOMPO:= 'LblChq4'; ParamRel[23].DESCRICAO:= 'Assinatura 4';

      ParamRel[24].IDMODULO:= Sistema.IdModulo; ParamRel[24].IDPESSOA:= Sistema.IdEmpresa; ParamRel[24].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[24].NOMECOMPO:= 'Lblfa1'; ParamRel[24].DESCRICAO:= 'Assinatura 1';
      ParamRel[25].IDMODULO:= Sistema.IdModulo; ParamRel[25].IDPESSOA:= Sistema.IdEmpresa; ParamRel[25].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[25].NOMECOMPO:= 'Lblfa2'; ParamRel[25].DESCRICAO:= 'Assinatura 2';
      ParamRel[26].IDMODULO:= Sistema.IdModulo; ParamRel[26].IDPESSOA:= Sistema.IdEmpresa; ParamRel[26].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[26].NOMECOMPO:= 'Lblfa3'; ParamRel[26].DESCRICAO:= 'Assinatura 3';
      ParamRel[27].IDMODULO:= Sistema.IdModulo; ParamRel[27].IDPESSOA:= Sistema.IdEmpresa; ParamRel[27].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[27].NOMECOMPO:= 'Lblfa4'; ParamRel[27].DESCRICAO:= 'Assinatura 4';
      ParamRel[28].IDMODULO:= Sistema.IdModulo; ParamRel[28].IDPESSOA:= Sistema.IdEmpresa; ParamRel[28].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[28].NOMECOMPO:= 'Lblfa5'; ParamRel[28].DESCRICAO:= 'Assinatura 5';
    end
    else
    begin
      TotAss := NUMASS_CAR;
      ParamRel[0].IDMODULO:= Sistema.IdModulo; ParamRel[0].IDPESSOA:= Sistema.IdEmpresa; ParamRel[0].NOMERALATORIO:= 'Guia de Recebimentos'; ParamRel[0].NOMECOMPO:= 'Lblag1'; ParamRel[0].DESCRICAO:= 'Assinatura 1';
      ParamRel[1].IDMODULO:= Sistema.IdModulo; ParamRel[1].IDPESSOA:= Sistema.IdEmpresa; ParamRel[1].NOMERALATORIO:= 'Guia de Recebimentos'; ParamRel[1].NOMECOMPO:= 'Lblag2'; ParamRel[1].DESCRICAO:= 'Assinatura 2';
      ParamRel[2].IDMODULO:= Sistema.IdModulo; ParamRel[2].IDPESSOA:= Sistema.IdEmpresa; ParamRel[2].NOMERALATORIO:= 'Guia de Recebimentos'; ParamRel[2].NOMECOMPO:= 'Lblag3'; ParamRel[2].DESCRICAO:= 'Assinatura 3';
      ParamRel[3].IDMODULO:= Sistema.IdModulo; ParamRel[3].IDPESSOA:= Sistema.IdEmpresa; ParamRel[3].NOMERALATORIO:= 'Guia de Recebimentos'; ParamRel[3].NOMECOMPO:= 'Lblag4'; ParamRel[3].DESCRICAO:= 'Assinatura 4';
      ParamRel[4].IDMODULO:= Sistema.IdModulo; ParamRel[4].IDPESSOA:= Sistema.IdEmpresa; ParamRel[4].NOMERALATORIO:= 'Guia de Recebimentos'; ParamRel[4].NOMECOMPO:= 'Lblag5'; ParamRel[4].DESCRICAO:= 'Assinatura 5';
    end;
    for X := 0 to TotAss do
    begin
      cdsParamRel.Append;
      cdsParamRel.FieldByName('IDMODULO').AsFloat       := ParamRel[X].IDMODULO;
      cdsParamRel.FieldByName('IDPESSOA').AsFloat       := ParamRel[X].IDPESSOA;
      cdsParamRel.FieldByName('NOMECOMPO').AsString     := ParamRel[X].NOMECOMPO;
      cdsParamRel.FieldByName('DESCRICAO').AsString     := ParamRel[X].DESCRICAO;
      cdsParamRel.FieldByName('VALOR').AsString         := '';
      cdsParamRel.FieldByName('NOMERELATORIO').AsString := ParamRel[X].NOMERALATORIO;
      cdsParamRel.Post;
    end;
     _ParamCAP.GravaRelatorio;
  end;

  if cdsParamRel.RecordCount <= 24 then
  begin
    if ParamIntegra.RecPag = 'P' then
    begin
      TotAss := 4;
      ParamRel[0].IDMODULO:= Sistema.IdModulo; ParamRel[0].IDPESSOA:= Sistema.IdEmpresa; ParamRel[0].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[0].NOMECOMPO:= 'Lblfa1'; ParamRel[0].DESCRICAO:= 'Assinatura 1';
      ParamRel[1].IDMODULO:= Sistema.IdModulo; ParamRel[1].IDPESSOA:= Sistema.IdEmpresa; ParamRel[1].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[1].NOMECOMPO:= 'Lblfa2'; ParamRel[1].DESCRICAO:= 'Assinatura 2';
      ParamRel[2].IDMODULO:= Sistema.IdModulo; ParamRel[2].IDPESSOA:= Sistema.IdEmpresa; ParamRel[2].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[2].NOMECOMPO:= 'Lblfa3'; ParamRel[2].DESCRICAO:= 'Assinatura 3';
      ParamRel[3].IDMODULO:= Sistema.IdModulo; ParamRel[3].IDPESSOA:= Sistema.IdEmpresa; ParamRel[3].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[3].NOMECOMPO:= 'Lblfa4'; ParamRel[3].DESCRICAO:= 'Assinatura 4';
      ParamRel[4].IDMODULO:= Sistema.IdModulo; ParamRel[4].IDPESSOA:= Sistema.IdEmpresa; ParamRel[4].NOMERALATORIO:= 'Ficha Financeira para Pagamento'; ParamRel[4].NOMECOMPO:= 'Lblfa5'; ParamRel[4].DESCRICAO:= 'Assinatura 5';
    end
    else
      TotAss := -1;

    for X := 0 To TotAss do
    begin
      cdsParamRel.Append;
      cdsParamRel.FieldByName('IDMODULO').AsFloat       := ParamRel[X].IDMODULO;
      cdsParamRel.FieldByName('IDPESSOA').AsFloat       := ParamRel[X].IDPESSOA;
      cdsParamRel.FieldByName('NOMECOMPO').AsString     := ParamRel[X].NOMECOMPO;
      cdsParamRel.FieldByName('DESCRICAO').AsString     := ParamRel[X].DESCRICAO;
      cdsParamRel.FieldByName('VALOR').AsString         := '';
      cdsParamRel.FieldByName('NOMERELATORIO').AsString := ParamRel[X].NOMERALATORIO;
      cdsParamRel.Post;
    end;
     _ParamCAP.GravaRelatorio;
  end;
  if (cds.FieldByName('FLGRADLOTE').IsNull) or (cds.FieldByName('FLGRADLOTE').AsFloat = 0)  Then
     dbrgRADLote.ItemIndex :=0 ;
  sqlModImp.Open;
  MontaArvoreParamRelats;

  // Rodolpho da Silva - P: 23832 - 24/11/2006
  HabilitaTabControls(False);
end;




procedure TfrmParamCapMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _RamoFornecedor.Free;
  _TipoAlterador.Free;
  _TipoCliente.Free;
  _PortadorForma.Free;
  _TipoDocumento.Free;
  _TipoRecebDesemb.Free;
  _ParamCap.Free;
   LstParamRel.Free;

  if ParamIntegra.RecPag = 'R' then
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAR)
  else
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAP);

  IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB',IntegraBack.RecPag);
  
  //início - andre tavares - pendência 16971 - 18/10/2004
  IntegraBack.BuscaParamIntegra('PARAMCAP','FLGINTEGRAORC',IntegraBack.RecPag);
  //fim - andre tavares - pendência 16971 - 18/10/2004


  Modulo.BuscaParamCap(Sistema.IdEmpresa);
end;

procedure TfrmParamCapMT.sbtnSimClick(Sender: TObject);
begin
  sbtnSim.Down := True;
  cds.FieldByName('IntegraContab').AsString := 'S';
  inherited;

end;

procedure TfrmParamCapMT.sbtnNaoClick(Sender: TObject);
begin
  sbtnNao.Down := True;
  cds.FieldByName('IntegraContab').AsString := 'N';
  inherited;

end;

procedure TfrmParamCapMT.CmeCadastroInsert(Sender: TObject);
begin
   Inherited;
   cds.FieldByName('RECPAG').AsString             := ParamIntegra.RecPag;
   cds.FieldByName('IDPESSOA').AsInteger          := Sistema.idEmpresa;
   cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
   cds.FieldByName('LANCAFINANC').AsString        := 'N';
   cds.FieldByName('FLGESTEXCFINANC').AsString    := 'S';
end;




procedure TfrmParamCapMT.CmeCadastroEdit(Sender: TObject);
var llancfinanc : string;
begin
  if cds.IsEmpty then
    CmeCadastro.Insert(Self)
  else
  begin
    llancfinanc := cds.FieldByName('LANCAFINANC').AsString;
    Inherited;
    cds.FieldByName('LANCAFINANC').AsString := llancfinanc;
  end;
  sOldMascara := Trim(cds.FieldByName('MASCARANODOCUM').AsString);
  if cds.FieldByName('FLGSTATUSFINANC').IsNull then  cds.FieldByName('FLGSTATUSFINANC').AsString := 'N';
  if cds.FieldByName('FLGRADLOTE').IsNull then cds.FieldByName('FLGRADLOTE').AsFloat := 0;
  cds.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
  cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
  cds.FieldByName('HISTPADFINAN').AsInteger      := cdsHistFinanc.FieldByName('HISTPADFINAN').AsInteger;

  // Rodolpho da Silva - P: 23832 - 24/11/2006
  HabilitaTabControls(True);

end;




procedure TfrmParamCapMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if cdsParamRel.UpdateStatus in [usModified, usInserted, usDeleted]  then
  begin
    cdsParamRel.CancelUpdates;
    MontaArvoreParamRelats;
  end;
  PageContas.ActivePage := TbsGeralI;
end;

procedure TfrmParamCapMT.bbtnConfirmarClick(Sender: TObject);
begin
  if dblkcmbfinan.Text = '' then
  begin
    MsgDlg('O Histórico do Financeiro tem que ser selecionado','Aviso',mtError,[mbOk],0);
    PageContas.ActivePage := TbsBaixas;
    if dblkcmbfinan.CanFocus then dblkcmbfinan.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmParamCapMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsDesembolso.Data  := _TipoRecebDesemb.ListTiporecebdesemb(ParamIntegra.RecPag, Sistema.IdEmpresa);
  dbedMascara.ReadOnly := not cdsdesembolso.IsEmpty;
  cdsDesembolso.Close;

  sqlHistfinanc.Open;
  //Marcus Oliveira P.25312 03/07/2007
  sqlPlano.Open;
  sqlPatro.Open;

  if (cdsHistfinanc.Locate('HISTPADFINAN', cds.FieldByName('HISTPADFINAN').Asinteger,[])) then
    dblkcmbfinan.Text := cdsHistFinanc.FieldByName('DESCRICAO').AsString;

  cdsAltAbatDesc.Data := _TipoAlterador.ListTipoalterador(Sistema.IdEmpresa,
                                                          ParamIntegra.RecPag, 0,
                                                          FuncaoGeral.Decode(ParamIntegra.RecPag, 'P', 'D', 'C'));

  cdsJuros.Data       := _TipoAlterador.ListTipoalterador(Sistema.IdEmpresa,
                                                          ParamIntegra.RecPag, 0,
                                                          FuncaoGeral.Decode(ParamIntegra.RecPag, 'P', 'C', 'D'));
end;

procedure TfrmParamCapMT.TreeAssinEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
var
  sAux: String;
begin
  inherited;
  sAux := LstParamRel[Node.AbsoluteIndex];
  cdsParamRel.Locate('IDPARAMRELATS',sAux,[]);
  cdsParamRel.Edit;
  cdsParamRel.FieldByName('VALOR').AsString := S;
  cdsParamRel.Post;
end;

procedure TfrmParamCapMT.TreeAssinEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := ((Node.ImageIndex = 2) And (CmeCadastro.Operacao in [OpInserir,OpAlterar]));
end;

procedure TfrmParamCapMT.MontaArvoreParamRelats;
var
  sOldNome : string;
  TreeNome, TreeDescricao, TreeFilho: TTreeNode;
begin
  sOldNome := '';
  TreeNome := nil;

  TreeAssin.Items.Clear;
  LstParamRel.Clear;

  cdsParamRel.First;
  while not cdsParamRel.Eof do
  begin
    if SoldNome <> cdsParamRel.FieldByName('NOMERELATORIO').AsString then
    begin
      TreeNome                  := TreeAssin.Items.Add(nil, cdsParamRel.FieldByName('NOMERELATORIO').AsString);
      TreeNome.ImageIndex       := 0;
      TreeNome.SelectedIndex    := 0;
      LstParamRel.Add(cdsParamRel.FieldByName('IDPARAMRELATS').AsString);
    end;
    TreeDescricao               := TreeAssin.Items.AddChild(TreeNome, cdsParamRel.FieldByName('DESCRICAO').AsString);
    LstParamRel.Add(cdsParamRel.FieldByName('IDPARAMRELATS').AsString);
    TreeDescricao.ImageIndex    := 1;
    TreeDescricao.SelectedIndex := 1;
    if Trim(cdsParamRel.FieldByName('VALOR').AsString) = '' then
      TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,'Clique Para Inserir\Alterar Assinatura')
    else
      TreeFilho := TreeAssin.Items.AddChild(TreeDescricao, cdsParamRel.FieldByName('VALOR').AsString);

    LstParamRel.Add(cdsParamRel.FieldByName('IDPARAMRELATS').AsString);
    TreeFilho.ImageIndex        := 2;
    TreeFilho.SelectedIndex     := 2;
    SOldNome                    := cdsParamRel.FieldByName('NOMERELATORIO').AsString;
    cdsParamRel.Next;
  end;
end;

procedure TfrmParamCapMT.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if MsReports.Executar = MrOk then
  begin
    cds.FieldByName('IDREPORTS').AsFloat := StrToFloat(MsReports.ValoresChave[0]);
    cds.FieldByName('ORIGEMCM').AsFloat  := StrToFloat(MsReports.ValoresChave[1]);
    cds.FieldByName('NAME').AsString     := MsReports.ValoresChave[2];
  end;
end;

procedure TfrmParamCapMT.DbeReportsExit(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [OpInserir,OpAlterar]) and (Trim(DbeReports.Text) = '') then
  begin
    cds.FieldByName('IDREPORTS').Clear;
    cds.FieldByName('ORIGEMCM').Clear;
    cds.FieldByName('NAME').Clear;
  end;
end;

procedure TfrmParamCapMT.dbedMascaraKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Sender is TDbEdit) then
  begin
    if (key = '.') and (Copy(dbedMascara.Text,Length((Sender as TDbEdit).Text),1) = '.') then
    begin
      MessageBeep(0);
      ShowMessage('Máscara Inválida');
      key := #0;
    end
    else
      if (key <> '9') and (key <> '0') and (key <> '.') and (key <> #8) then
      begin
        MessageBeep(0);
        ShowMessage('Máscara Inválida');
        key := #0;
      end
      else
        if (key <> '9') and (key <> '0') and (Length((Sender as TDbEdit).Text) = 0)  then
        begin
          MessageBeep(0);
          ShowMessage('Máscara Inválida');
          key := #0;
        end;
  end;
end;

procedure TfrmParamCapMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ParamCAP.GravaParamCap;
  _ParamCAP.GravaRelatorio;
end;




procedure TfrmParamCapMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ParamCAP.GravaParamCap;
  _ParamCAP.GravaRelatorio;

  // Rodolpho da Silva - P: 23832 - 24/11/2006
  HabilitaTabControls(False);
end;




//início - andre tavares - pendência 16971 - 18/10/2004
procedure TfrmParamCapMT.spdIntegraOrcClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGINTEGRAORC').AsString := 'S';
end;

procedure TfrmParamCapMT.NspdIntegraOrcClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGINTEGRAORC').AsString := 'N';
end;
//fim - andre tavares - pendência 16971 - 18/10/2004




procedure TfrmParamCapMT.HabilitaTabControls(bHabilitar: boolean);
var
  i: integer;
begin
   for i :=  0 to (PageContas.PageCount - 1) do
      PageContas.Pages[i].Enabled := bHabilitar;
end;




procedure TfrmParamCapMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  HabilitaTabControls(false);
end;

procedure TfrmParamCapMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  cds.Data := _ParamCAP.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
end;

end.

