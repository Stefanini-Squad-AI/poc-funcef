unit fCadProcessoRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, Db, DBClient, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls,
  Mask, uCMClientDataSet, DBTables, Provider, FCadastroMT, MontaSelect,
  uMensErro, wwdblook, JCLStrings, uCmTypes, wwdbedit, Wwdbspin,
  uCtrlRadTipoProc, uCtrlGrpProcesso, uCtrlRadEtapa, uCtrlGrupoRespon,
  uCtrlRadEtapaDest, frCndRADDoc, frCondRAD, uCtrlRadEtapaCond;

type
  TfrmCadProcessoRAD = class(TFrmCadastroMT)
    cdsEtapas: TCMClientDataSet;
    pgctrlProcesso: TPageControl;
    tbsDadosGerais: TTabSheet;
    tbsEtapas: TTabSheet;
    dsEtapas: TwwDataSource;
    dbgrdEtapas: TwwDBGrid;
    tbsDetalhesEtapas: TTabSheet;
    pnlControlesDet: TPanel;
    pnlDetalhesEtapa: TPanel;
    pnlAcoesEtapa: TPanel;
    spdbtnAprovacao: TSpeedButton;
    spdbtnRecusa: TSpeedButton;
    DockOkCancEtapas: TDock97;
    tb97Etapa: TToolbar97;
    bbtnOkEtapa: TBitBtn;
    bbtnCancelarEtapa: TBitBtn;
    dckEtapa: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsEtapa: TToolbarButton97;
    sbtnAltEtapa: TToolbarButton97;
    sbtnExcluiEtapa: TToolbarButton97;
    spdbtnCondicoes: TSpeedButton;
    Bevel1: TBevel;
    cdsCondicoes: TCMClientDataSet;
    spdbtnAvisos: TSpeedButton;
    ntbkEtapa: TNotebook;                                                                                   
    pnlAprovacao: TPanel;
    grpProxEtapa: TGroupBox;
    rbProximaEtapa: TRadioButton;
    rbEtapaEspecifica: TRadioButton;
    rbAprovaFinaliza: TRadioButton;
    rbAvancaCondicoes: TRadioButton;
    pnlRecusa: TPanel;
    grpRecusa: TGroupBox;
    grpObsRecusa: TGroupBox;
    lblObsRecusa: TLabel;
    pnlCondicoes: TPanel;
    pnlAvisos: TPanel;
    Label9: TLabel;
    cmbAvisos: TComboBox;
    grpAvisos: TGroupBox;
    pnlOutrosDestinatarios: TPanel;
    btnIncluiDest: TSpeedButton;
    btnExcluiDest: TSpeedButton;
    sttctxtOutrosDestinatarios: TStaticText;
    tbsTextos: TTabSheet;
    Label16: TLabel;
    CdsIDRADTIPOPROC: TFloatField;
    CdsNOME: TStringField;
    CdsIDGRUPOPROCESSO: TFloatField;
    CdsDESCRICAO: TMemoField;
    CdsIDREFERENCIA: TFloatField;
    CdsPRAZOESTIMADO: TStringField;
    CdsTXTAPROVARAD: TMemoField;
    CdsTXTAPROVARADRES: TMemoField;
    CdsTXTRECUSARAD: TMemoField;
    CdsTXTAPROVAETAPA: TMemoField;
    CdsTXTRECUSAETAPA: TMemoField;
    CdsTXTSOLICAPROV: TMemoField;
    cdsGrupoProcesso: TCMClientDataSet;
    cdsGrupoProcessoIDGRUPOPROCESSO: TFloatField;
    cdsGrupoProcessoDESCGRUPOPROCESSO: TStringField;
    cdsEventoGerador: TCMClientDataSet;
    cdsEventoGeradorIDREFERENCIA: TFloatField;
    cdsEventoGeradorDESCREFERENCIA: TStringField;
    cdsEventoGeradorDESCRICAO: TStringField;
    pnlDadosGerais: TPanel;
    lblNome: TLabel;
    lblGrupoProcessos: TLabel;
    lblDescricao: TLabel;
    lblPrazoRAD: TLabel;
    lblhRAD: TLabel;
    grEventoGerador: TGroupBox;
    memRef: TMemo;
    dblkpEventoGerador: TwwDBLookupCombo;
    dbedtNomeProcesso: TDBEdit;
    dbmemDescricaoProcesso: TDBMemo;
    dblkpGrupoProcessos: TwwDBLookupCombo;
    dbedtPrazoRAD: TDBEdit;
    pnlTextos: TPanel;
    Label2: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    dbMemTxtAprovaRAD: TDBMemo;
    dbMemTxtAprovaRADRes: TDBMemo;
    dbMemTxtRecusaRAD: TDBMemo;
    dbMemTxtAprovaEtapa: TDBMemo;
    dbMemTxtRecusaEtapa: TDBMemo;
    dbMemTxtSolicAprova: TDBMemo;
    cdsEtapasIDRADETAPA: TFloatField;
    cdsEtapasIDRADTIPOPROC: TFloatField;
    cdsEtapasNUMERO: TFloatField;
    cdsEtapasDESCRICAO: TStringField;
    cdsEtapasIDGRPRESPON: TFloatField;
    cdsEtapasPRAZOESTIMADO: TStringField;
    cdsEtapasFLGACAOAPROVA: TFloatField;
    cdsEtapasQTDEAUTORIZA: TFloatField;
    cdsEtapasNUMETAPADEST: TFloatField;
    cdsEtapasFLGPODERETORNAR: TFloatField;
    cdsEtapasFLGETAPARETORNO: TFloatField;
    cdsEtapasNUMETAPARET: TFloatField;
    cdsEtapasFLGPODERECUSAR: TFloatField;
    cdsEtapasFLGELSE: TFloatField;
    cdsEtapasNUMETAPAELSE: TFloatField;
    cdsEtapasFLGAVISOS: TFloatField;
    cdsEtapasFLGAVISOGRUPO: TFloatField;
    cdsEtapasFLGAVISOSOLIC: TFloatField;
    cdsEtapasAVISOOUTROS: TStringField;
    cdsEtapasNOMEGRUPORESPON: TStringField;
    cdsGrupoRespon: TCMClientDataSet;
    cdsGrupoResponIDGRPRESPON: TFloatField;
    cdsGrupoResponNOME: TStringField;
    cdsGrupoResponNIVEL: TFloatField;
    dbrdgrpQtdeAprova: TDBRadioGroup;
    dbspnQtdeAutoriza: TwwDBSpinEdit;
    cdsEtapasFLGQTDEAUTORIZA: TFloatField;
    dbnvgtrEtapas: TDBNavigator;
    pnlTopEtapas: TPanel;
    lblNumero: TLabel;
    dbspnNumero: TwwDBSpinEdit;
    lblDescEtapa: TLabel;
    dbedtDescEtapa: TDBEdit;
    lblGrupoRespon: TLabel;
    dblkpGrupoRespon: TwwDBLookupCombo;
    lblPrazoEtapa: TLabel;
    dbedtPrazoEtapa: TDBEdit;
    lblhEtapa: TLabel;
    dbchkbxRetorna: TDBCheckBox;
    dbchkbxRecusa: TDBCheckBox;
    dbrdgrpRetorno: TDBRadioGroup;
    dbchkAvisoGrupo: TDBCheckBox;
    dbchkAvisoSolic: TDBCheckBox;
    msDestAviso: TMontaSelect;
    cdsEtapaDest: TCMClientDataSet;
    cdsEtapaDestIDPESSOA: TFloatField;
    cdsEtapaDestIDRADETAPA: TFloatField;
    cdsEtapaDestNOME: TStringField;
    cdsEtapaDestEMAIL: TStringField;
    dsEtapaDest: TDataSource;
    dbgrdEtapaDest: TwwDBGrid;
    cdsEtapasAux: TCMClientDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField4: TStringField;
    dblkpNumProxEtapa: TwwDBLookupCombo;
    dblkpNumEtapaRetorno: TwwDBLookupCombo;
    pnlElse: TPanel;
    lblElse: TLabel;
    dblkpEtapaElse: TwwDBLookupCombo;
    cmbElse: TComboBox;
    procedure dbgrdEtapasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdCondicoesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure spdbtnAprovacaoClick(Sender: TObject);
    procedure rbProximaEtapaClick(Sender: TObject);
    procedure cmbAvisosChange(Sender: TObject);
    procedure ToolbarButton971Click(Sender: TObject);
    procedure ToolbarButton972Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pgctrlProcessoChange(Sender: TObject);
    procedure sbtnInsEtapaClick(Sender: TObject);
    procedure cmbElseChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpEventoGeradorKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtPrazoRADExit(Sender: TObject);
    procedure dbedtPrazoRADEnter(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure pgctrlProcessoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtnAltEtapaClick(Sender: TObject);
    procedure sbtnExcluiEtapaClick(Sender: TObject);
    procedure bbtnCancelarEtapaClick(Sender: TObject);
    procedure bbtnOkEtapaClick(Sender: TObject);
    procedure dbgrdEtapasDblClick(Sender: TObject);
    procedure dbedtPrazoEtapaEnter(Sender: TObject);
    procedure dbedtPrazoEtapaExit(Sender: TObject);
    procedure cdsEtapasAfterInsert(DataSet: TDataSet);
    procedure cdsEtapasAfterScroll(DataSet: TDataSet);
    procedure dbrdgrpQtdeAprovaClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure dbrdgrpRetornoClick(Sender: TObject);
    procedure dbchkbxRetornaClick(Sender: TObject);
    procedure btnIncluiDestClick(Sender: TObject);
    procedure btnExcluiDestClick(Sender: TObject);
    procedure cdsEtapaDestAfterInsert(DataSet: TDataSet);
    procedure CdsIDREFERENCIAChange(Sender: TField);
  private
    CtrlRadTipoProc  : TCtrlRadTipoProc;
    CtrlGrpProcesso  : TCtrlGrpProcesso;
    CtrlRadEtapa     : TCtrlRadEtapa;
    CtrlGrupoRespon  : TCtrlGrupoRespon;
    CtrlRadEtapaDest : TCtrlRadEtapaDest;
    CtrlRadEtapaCond : TCtrlRadEtapaCond; 

    iIdRADTipoProc : integer;
    iIdProxIdEtapa : integer;
    bPodeMudarTab  : boolean;

    frameCondRAD : TframeCondRAD;

    function CampoHora( sHoraDigitada : string ) : string;

    procedure HabilitaFundo( bPodeAlterar : boolean );
    procedure HabilitaAltEtapas( bPodeAlterar : boolean );
    procedure MudouAcaoAprova;

    procedure SelecionaEtapa;

    procedure FiltraDestinatarios;

    procedure ModoAlteracaoCond;
    procedure ModoBrowserCond;

    procedure SelecionaCondicoes( iIdRadTipoProc : integer );

    procedure SelecionaReferencia;
    procedure MontaFrameCondicoes;

    procedure PreencheAvisosPadrao;
  public
    procedure MsgErro( sMsg : string );
  end;

var
  frmCadProcessoRAD: TfrmCadProcessoRAD;

implementation

{$R *.DFM}

Uses uSistema, dBaseDados;

procedure TfrmCadProcessoRAD.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRadTipoProc := TCtrlRadTipoProc.Create;
  CtrlRadTipoProc.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlGrpProcesso := TCtrlGrpProcesso.Create;
  CtrlGrpProcesso.InitializeAs( CtrlRadTipoProc );

  CtrlRadEtapa := TCtrlRadEtapa.Create;
  CtrlRadEtapa.InitializeAs( CtrlRadTipoProc );

  CtrlGrupoRespon := TCtrlGrupoRespon.Create;
  CtrlGrupoRespon.InitializeAs( CtrlRadTipoProc );

  CtrlRadEtapaDest := TCtrlRadEtapaDest.Create;
  CtrlRadEtapaDest.InitializeAs( CtrlRadTipoProc );

  CtrlRadEtapaCond := TCtrlRadEtapaCond.Create;
  CtrlRadEtapaCond.InitializeAs( CtrlRadTipoProc );

  cdsGrupoProcesso.Data := CtrlGrpProcesso.ListaRadGrupoProcesso;
  cdsEventoGerador.Data := CtrlRadTipoProc.ListaEventoGerador;
  cdsGrupoRespon.Data   := CtrlGrupoRespon.ListaGrupoRespon;

  pgctrlProcesso.ActivePage := tbsDadosGerais;
end;

procedure TfrmCadProcessoRAD.FormDestroy(Sender: TObject);
begin
  CtrlRadTipoProc.Free;
  CtrlGrpProcesso.Free;
  CtrlRadEtapa.Free;
  CtrlGrupoRespon.Free;
  CtrlRadEtapaDest.Free;
  CtrlRadEtapaCond.Free;
  inherited;
end;

procedure TfrmCadProcessoRAD.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOk], 0 );
end;

procedure TfrmCadProcessoRAD.dbgrdEtapasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if not ( gdSelected in State ) then
    if ( cdsEtapas.RecNo mod 2 ) = 0 then
      ABrush.Color:= $00C0FFFF;
end;

procedure TfrmCadProcessoRAD.dbgrdCondicoesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if not ( gdSelected in State ) then
    if ( cdsCondicoes.RecNo mod 2 ) = 0 then
      ABrush.Color:= $00C0FFFF;
end;

procedure TfrmCadProcessoRAD.spdbtnAprovacaoClick(Sender: TObject);
begin
  inherited;
  if spdbtnAprovacao.Down then
    ntbkEtapa.ActivePage := 'Aprovacao'
  else if spdbtnRecusa.Down then
    ntbkEtapa.ActivePage := 'Recusa'
  else if spdbtnCondicoes.Down then
    ntbkEtapa.ActivePage := 'Condicoes'
  else
    ntbkEtapa.ActivePage := 'Avisos';
end;

procedure TfrmCadProcessoRAD.cmbAvisosChange(Sender: TObject);
begin
  inherited;
  cdsEtapasFLGAVISOS.AsInteger := cmbAvisos.ItemIndex + 1;
  grpAvisos.Enabled := ( cdsEtapasFLGAVISOS.AsInteger > 1 );
end;

procedure TfrmCadProcessoRAD.ToolbarButton971Click(Sender: TObject);
begin
  inherited;
{
  pnlTabela.SendToBack;
  cmbGrupoRespon.ItemIndex := -1;
  cmbTipoDoc.ItemIndex := -1;
  edtValMin.Text := '';
  edtValMax.Text := '';
  bbtnOkDet.Enabled := False;
  bbtnCancelarDet.Enabled := False;
  bbtnVoltarDet.Enabled := False;
}  
end;

procedure TfrmCadProcessoRAD.ToolbarButton972Click(Sender: TObject);
begin
  inherited;
{
  pnlTabela.SendToBack;
  cmbGrupoRespon.ItemIndex := cmbGrupoRespon.Items.IndexOf( cdsCondicoesGRUPORESPON.Text );
  cmbTipoDoc.ItemIndex := cmbTipoDoc.Items.IndexOf( cdsCondicoesTIPOPRODUTO.Text );
  edtValMin.Text := cdsCondicoesVALORMAX.AsString;
  edtValMax.Text := cdsCondicoesVALORMIN.AsString;
  bbtnOkDet.Enabled := False;
  bbtnCancelarDet.Enabled := False;
  bbtnVoltarDet.Enabled := False;
}  
end;

procedure TfrmCadProcessoRAD.BitBtn1Click(Sender: TObject);
begin
  inherited;
{
  bbtnOkDet.Enabled := True;
  bbtnCancelarDet.Enabled := True;
  bbtnVoltarDet.Enabled := True;
  ToolbarButton971.Down := False;
  ToolbarButton972.Down := False;
  pnlTabela.BringToFront;
}  
end;

procedure TfrmCadProcessoRAD.pgctrlProcessoChange(Sender: TObject);
//var
//  i : integer;
begin
  inherited;
{
  for i := 0 to ( pnlAprovacao.ControlCount - 1 ) do
    if pnlAprovacao.Controls[i].Name <> 'grpProxEtapa' then
      pnlAprovacao.Controls[i].Visible := ( cdsDetNUMERO.AsInteger > 0 );
  spdbtnAprovacao.Enabled := ( cdsDetNUMERO.AsInteger > 0 );
  spdbtnRecusa.Enabled := ( cdsDetNUMERO.AsInteger > 0 );
  spdbtnAvisos.Enabled := ( cdsDetNUMERO.AsInteger > 0 );
  rbAprovaFinaliza.Enabled := ( cdsDetNUMERO.AsInteger > 0 );
  lblGrupoRespon.Visible := ( cdsDetNUMERO.AsInteger > 0 );
  grpGrupoRespon.Visible := ( cdsDetNUMERO.AsInteger > 0 );
  lblPrazo.Visible := ( cdsDetNUMERO.AsInteger > 0 );
  edtPrazo.Visible := ( cdsDetNUMERO.AsInteger > 0 );

  if cdsDetNUMERO.AsInteger > 0 then
  begin
    grpProxEtapa.Caption := 'Ao aprovar esta etapa...';
    cmbElse.ItemIndex := 0;
    pnlElse.Enabled := True;
  end
  else
  begin
    grpProxEtapa.Caption := 'Ao iniciar o processo...';
    cmbElse.ItemIndex := 1;
    pnlElse.Enabled := false;
  end;
  cmbElseChange( nil );
}
end;

procedure TfrmCadProcessoRAD.sbtnInsEtapaClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  cdsEtapasAux.Data := cdsEtapas.Data;

  pgctrlProcesso.ActivePage := tbsDetalhesEtapas;
  tb97Etapa.Visible := True;
  bPodeMudarTab := False;
  cdsEtapas.Last;
  i := cdsEtapasNUMERO.AsInteger;
  cdsEtapas.Append;
  cdsEtapasNUMERO.AsInteger := i + 1;
  HabilitaAltEtapas( True );

  spdbtnRecusa.Enabled      := True;
  spdbtnAvisos.Enabled      := True;
  rbAprovaFinaliza.Enabled  := True;
  dbrdgrpQtdeAprova.Visible := True;
  dbspnQtdeAutoriza.Visible := True;
  pnlElse.Enabled           := True; 

  dbedtDescEtapa.SetFocus;
end;

procedure TfrmCadProcessoRAD.cmbElseChange(Sender: TObject);
begin
  inherited;
  cdsEtapasFLGELSE.AsInteger := cmbElse.ItemIndex + 1;
  dblkpEtapaElse.Visible := ( cmbElse.ItemIndex = 1 );
end;

procedure TfrmCadProcessoRAD.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MessageDlg('Palavras-chave disponíveis:' + #13+#10 + #13+#10 +
  '<#DESCETAPA>     Descrição da etapa.' + #13+#10 +
  '<#DESCRAD>     Descrição do processo RAD.' + #13+#10 +
  '<#NOMEDEST>     Nome do destinatário.' + #13+#10 +
  '<#NUMRAD>     Número do processo RAD.' + #13+#10 +
  '<#RESPONSAVEL>     Responsável pela aprovação ou recusa.' + #13+#10 +
  '<#DATAHORAINIETAPA>     Data e hora de início da etapa.' + #13+#10 +
  '<#DATAHORAINIRAD>     Data e hora de início do processo.' + #13+#10 +
  '<#DATAHORAFIMETAPA>     Data e hora de término da etapa.' + #13+#10 +
  '<#DATAHORAFIMRAD>     Data e hora de término do processo.' + #13+#10 +
  '<#RESSALVA>     Ressalva, motivo de recusa ou observcmação' + #13+#10,
  mtInformation, [mbOk], 0);
end;

procedure TfrmCadProcessoRAD.CmeCadastroInsert(Sender: TObject);
begin
  cds.Close;
  cds.CreateDataSet;

  cdsEtapas.Close;
  cdsEtapas.CreateDataSet;

  cdsEtapaDest.Close;
  cdsEtapaDest.CreateDataSet;

  SelecionaCondicoes( -1 );

  iIdRADTipoProc := 0;
  iIdProxIdEtapa := 1;

  cdsEtapas.Append;
  cdsEtapasNUMERO.AsInteger   := 0;
  CdsEtapasDESCRICAO.AsString := 'Definição da etapa inicial do processo.';
  cdsEtapas.Post;

  pgctrlProcesso.ActivePage := tbsDadosGerais;
  dbedtNomeProcesso.SetFocus;

  inherited;
end;

procedure TfrmCadProcessoRAD.dblkpEventoGeradorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( ( Ord( Key ) > 31 ) and ( Ord( Key ) < 127 ) ) or
     ( Ord( Key ) = VK_DELETE ) or ( Ord( Key ) = VK_BACK ) then
    Key := #0;
end;

procedure TfrmCadProcessoRAD.dbedtPrazoRADExit(Sender: TObject);
begin
  inherited;
  if Cds.State in [dsInsert, dsEdit] then
    if trim( CdsPRAZOESTIMADO.AsString ) <> ':' then
      CdsPRAZOESTIMADO.AsString := CampoHora( CdsPRAZOESTIMADO.AsString );
end;

procedure TfrmCadProcessoRAD.dbedtPrazoRADEnter(Sender: TObject);
begin
  inherited;
  if trim( dbedtPrazoRAD.Text ) = ':' then
  begin
    dbedtPrazoRAD.SelStart  := 2;
    dbedtPrazoRAD.SelLength := 1;
  end;
end;

procedure TfrmCadProcessoRAD.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  iEtapaAnt : integer;
begin
  inherited;
  Accept := False;

  if trim( dbedtNomeProcesso.Text ) = '' then
  begin
    pgctrlProcesso.ActivePage := tbsDadosGerais;
    MsgErro( 'Preencha o nome do processo.' );
    dbedtNomeProcesso.SetFocus;
    exit;
  end;

  if trim( dblkpGrupoProcessos.Text ) = '' then
  begin
    pgctrlProcesso.ActivePage := tbsDadosGerais;
    MsgErro( 'Selecione o grupo de processos.' );
    dblkpGrupoProcessos.SetFocus;
    exit;
  end;

  cdsEtapas.DisableControls;
  cdsEtapasAux.Data := cdsEtapas.Data;
  try
    cdsEtapas.First;
    iEtapaAnt := -1;
    while not cdsEtapas.Eof do
    begin

      if cdsEtapasNUMERO.AsInteger = iEtapaAnt then
      begin
        pgctrlProcesso.ActivePage := tbsEtapas;
        MsgErro( 'A etapa ' + IntToStr( iEtapaAnt ) + ' está duplicada.' );
        dbgrdEtapas.SetFocus;
        exit;
      end;
      iEtapaAnt := cdsEtapasNUMERO.AsInteger;

      if not cdsEtapasAux.Locate( 'NUMERO', cdsEtapasNUMETAPADEST.AsInteger, [] ) then
      begin
        sbtnAltEtapaClick( nil );
        ntbkEtapa.ActivePage := 'Aprovacao';
        spdbtnAprovacao.Down := True;
        MsgErro( 'A etapa "' + cdsEtapasNUMETAPADEST.AsString + '" não existe.' );
        dblkpNumProxEtapa.SetFocus;
        exit;        
      end;

      if not cdsEtapasAux.Locate( 'NUMERO', cdsEtapasNUMETAPARET.AsInteger, [] ) then
      begin
        sbtnAltEtapaClick( nil );
        ntbkEtapa.ActivePage := 'Recusa';
        spdbtnRecusa.Down := True;
        MsgErro( 'A etapa "' + cdsEtapasNUMETAPARET.AsString + '" não existe.' );
        dblkpNumEtapaRetorno.SetFocus;
        exit;
      end;

      if not cdsEtapasAux.Locate( 'NUMERO', cdsEtapasNUMETAPAELSE.AsInteger, [] ) then
      begin
        sbtnAltEtapaClick( nil );
        ntbkEtapa.ActivePage := 'Condicoes';
        spdbtnCondicoes.Down := True;
        MsgErro( 'A etapa "' + cdsEtapasNUMETAPAELSE.AsString + '" não existe.' );
        dblkpEtapaElse.SetFocus;
        exit;
      end;

      cdsEtapas.Next;
    end;
    cdsEtapas.First;
  finally
    cdsEtapas.EnableControls;
  end;


  Accept := True;
end;

procedure TfrmCadProcessoRAD.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pgctrlProcesso.ActivePage := tbsDadosGerais;
  dbedtNomeProcesso.SetFocus;
end;

procedure TfrmCadProcessoRAD.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRadTipoProc.GravaRadTipoProc( cds.Data, cdsEtapas.Data, cdsEtapaDest.Data );
end;

procedure TfrmCadProcessoRAD.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    cds.Data       := CtrlRadTipoProc.SelecionaRadTipoProc( StrToIntDef( MontaSelect.ValoresChave[0], 0 ) );
    iIdRADTipoProc := CdsIDRADTIPOPROC.AsInteger;

    pgctrlProcesso.ActivePage := tbsDadosGerais;

    cdsEtapas.Data := CtrlRadEtapa.SelecionaEtapasRAD( iIdRADTipoProc );

    try
      cdsEtapas.DisableControls;
      cdsEtapas.First;
      iIdProxIdEtapa := 0;
      while cdsEtapas.Eof do
      begin
        if iIdProxIdEtapa < cdsEtapasIDRADETAPA.AsInteger then
          iIdProxIdEtapa := cdsEtapasIDRADETAPA.AsInteger;
        cdsEtapas.Next;
      end;
      iIdProxIdEtapa := iIdProxIdEtapa + 1;
    finally
      cdsEtapas.First;
      cdsEtapas.EnableControls;
    end;

    cdsEtapaDest.Data := CtrlRadEtapaDest.SelecionaDestEtapa( iIdRADTipoProc );
    FiltraDestinatarios;

    SelecionaReferencia;
  end;
end;

procedure TfrmCadProcessoRAD.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRadTipoProc.GravaRadTipoProc( cds.Data, cdsEtapas.Data, cdsEtapaDest.Data );
end;

procedure TfrmCadProcessoRAD.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRadTipoProc.ExcluiRadTipoProc( iIdRADTipoProc );
  if Accept then
  begin
    cdsEtapas.Close;
    cdsEtapaDest.Close;
  end;
end;

procedure TfrmCadProcessoRAD.HabilitaFundo( bPodeAlterar : boolean );
begin
  pnlFundo.Enabled := True;

  pnlDadosGerais.Enabled := bPodeAlterar;
  pnlTextos.Enabled := bPodeAlterar;
  dckEtapa.Enabled := bPodeAlterar;

  bPodeMudarTab := True;
  HabilitaAltEtapas( False );
end;

procedure TfrmCadProcessoRAD.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  HabilitaFundo( CmeCadastro.Operacao in [ opInserir, opAlterar ] );
end;

procedure TfrmCadProcessoRAD.pgctrlProcessoChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  AllowChange := bPodeMudarTab;
end;

procedure TfrmCadProcessoRAD.sbtnAltEtapaClick(Sender: TObject);
begin
  inherited;
  cdsEtapasAux.Data := cdsEtapas.Data;
  if cdsEtapasAux.Locate( 'IDRADETAPA', cdsEtapasIDRADETAPA.AsInteger, [] ) then
    cdsEtapasAux.Delete;
  tb97Etapa.Visible := True;
  pgctrlProcesso.ActivePage := tbsDetalhesEtapas;
  HabilitaAltEtapas( True );
  bPodeMudarTab := False;
  cdsEtapas.Edit;
end;

procedure TfrmCadProcessoRAD.sbtnExcluiEtapaClick(Sender: TObject);
begin
  inherited;
  if cdsEtapasNUMERO.AsInteger > 0 then
    cdsEtapas.Delete;
end;

procedure TfrmCadProcessoRAD.bbtnCancelarEtapaClick(Sender: TObject);
begin
  inherited;
  cdsEtapas.Cancel;
  SelecionaEtapa;
  bPodeMudarTab := True;
  HabilitaAltEtapas( False );
  pgctrlProcesso.ActivePage := tbsEtapas;
  tb97Etapa.Visible := False;
end;

procedure TfrmCadProcessoRAD.bbtnOkEtapaClick(Sender: TObject);
begin
  inherited;
  
  if trim( dbspnNumero.Text ) = '' then
  begin
    MsgErro( 'Preencha o número da etapa.' );
    dbspnNumero.SetFocus;
    exit;
  end;

  if ( dbspnNumero.Value = 0 ) and pnlTopEtapas.Enabled then
  begin
    MsgErro( 'O número desta etapa não pode ser "0".' );
    dbspnNumero.SetFocus;
    exit;
  end;

  if trim( dbedtDescEtapa.Text ) = '' then
  begin
    MsgErro( 'Preencha a descrição da etapa.' );
    dbedtDescEtapa.SetFocus;
    exit;
  end;

 if dbspnNumero.Value > 0 then
  begin
    if trim( dblkpGrupoRespon.Text ) = '' then
    begin
      MsgErro( 'Selecione o grupo de responsabilidade.' );
      dblkpGrupoRespon.SetFocus;
      exit;
    end;
  end;

  if rbEtapaEspecifica.Checked then
  begin
    if trim( dblkpNumProxEtapa.Text ) = '' then
    begin
      ntbkEtapa.ActivePage := 'Aprovacao';
      spdbtnAprovacao.Down := True;
      MsgErro( 'Preencha o número da etapa destino.' );      
      dblkpNumProxEtapa.SetFocus;
      exit;
    end;
  end;

  if dbrdgrpQtdeAprova.ItemIndex = 0 then
  begin
    if trim( dbspnQtdeAutoriza.Text ) = '' then
    begin
      ntbkEtapa.ActivePage := 'Aprovacao';
      spdbtnAprovacao.Down := True;
      MsgErro( 'Preencha a quantidade de aprovações.' );
      dbspnQtdeAutoriza.SetFocus;
      exit;
    end;
  end;

  if dbrdgrpRetorno.ItemIndex = 1 then
  begin
    if trim( dblkpNumEtapaRetorno.Text ) = '' then
    begin
      ntbkEtapa.ActivePage := 'Recusa';
      spdbtnRecusa.Down := True;
      MsgErro( 'Preencha o número da etapa de retorno.' );
      dblkpNumEtapaRetorno.SetFocus;
      exit;
    end;
  end;

  if rbAvancaCondicoes.Checked and ( cmbElse.ItemIndex = 1 ) then
  begin
    if trim( dblkpEtapaElse.Text ) = '' then
    begin
      ntbkEtapa.ActivePage := 'Condicoes';
      spdbtnCondicoes.Down := True;
      MsgErro( 'Preencha o número da etapa destino caso nenhuma condição seja atendida.' );
      dblkpEtapaElse.SetFocus;
      exit;
    end;
  end;

  cdsEtapasNOMEGRUPORESPON.AsString := dblkpGrupoRespon.Text;
  cdsEtapas.Post;
  bPodeMudarTab := True;
  HabilitaAltEtapas( False );
  pgctrlProcesso.ActivePage := tbsEtapas;
  tb97Etapa.Visible := False;
end;


function TfrmCadProcessoRAD.CampoHora( sHoraDigitada : string ) : string;
var
  sCampo, sHora, sHoraMinuto, sMinuto : string;
  iHora, iMinuto : integer;
  iPos : integer;
begin
  sCampo  := trim( sHoraDigitada );
  iPos := Pos( ':', sCampo );
  sHora   := trim( Copy( sCampo, 1, iPos - 1 ) );
  sMinuto := trim( Copy( sCampo, iPos + 1, length( sCampo ) - iPos ) );
  iHora := StrToIntDef( sHora, 0 );
  iMinuto := StrToIntDef( sMinuto, 0 );
  if iMinuto >= 60 then iMinuto := 0;
  sHora   := StrPadLeft( IntToStr( iHora ) , 4, ' ' );
  sMinuto := FormatFloat( '00', iMinuto );
  sHoraMinuto := sHora + ':' + sMinuto;
  Result := sHoraMinuto;
end;

procedure TfrmCadProcessoRAD.dbgrdEtapasDblClick(Sender: TObject);
begin
  inherited;
  if cdsEtapas.Active then
    if cdsEtapas.RecordCount > 0 then
    begin
      if CmeCadastro.Operacao in [ opInserir, opAlterar ] then
        sbtnAltEtapaClick( nil )
      else
        pgctrlProcesso.ActivePage := tbsDetalhesEtapas;
    end;
end;

procedure TfrmCadProcessoRAD.dbedtPrazoEtapaEnter(Sender: TObject);
begin
  inherited;
  if trim( dbedtPrazoEtapa.Text ) = ':' then
  begin
    dbedtPrazoEtapa.SelStart  := 2;
    dbedtPrazoEtapa.SelLength := 1;
  end;
end;

procedure TfrmCadProcessoRAD.dbedtPrazoEtapaExit(Sender: TObject);
begin
  inherited;
  if Cds.State in [dsInsert, dsEdit] then
    if trim( cdsEtapasPRAZOESTIMADO.AsString ) <> ':' then
      cdsEtapasPRAZOESTIMADO.AsString := CampoHora( cdsEtapasPRAZOESTIMADO.AsString );
end;

procedure TfrmCadProcessoRAD.cdsEtapasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  rbProximaEtapa.Checked             := True;
  cdsEtapasIDRADETAPA.AsInteger      := iIdProxIdEtapa;
  inc( iIdProxIdEtapa );
  cdsEtapasFLGACAOAPROVA.AsInteger   := 1;
  cdsEtapasIDRADTIPOPROC.AsInteger   := CdsIDRADTIPOPROC.AsInteger;
  cdsEtapasFLGQTDEAUTORIZA.AsInteger := 1;
  cdsEtapasQTDEAUTORIZA.AsInteger    := 1;
  cdsEtapasFLGPODERETORNAR.AsInteger := 1;
  cdsEtapasFLGPODERECUSAR.AsInteger  := 0;
  cdsEtapasFLGETAPARETORNO.AsInteger := 1;
  cdsEtapasFLGAVISOS.AsInteger       := 3;
  cdsEtapasFLGAVISOGRUPO.AsInteger   := 0;
  cdsEtapasFLGAVISOSOLIC.AsInteger   := 1;
  cdsEtapasFLGELSE.AsInteger         := 1;
end;


procedure TfrmCadProcessoRAD.rbProximaEtapaClick(Sender: TObject);
begin
  inherited;
  if cdsEtapas.State in [dsInsert, dsEdit] then
  begin
    if rbProximaEtapa.Checked    then cdsEtapasFLGACAOAPROVA.AsInteger := 1;
    if rbEtapaEspecifica.Checked then cdsEtapasFLGACAOAPROVA.AsInteger := 2;
    if rbAprovaFinaliza.Checked  then cdsEtapasFLGACAOAPROVA.AsInteger := 3;
    if rbAvancaCondicoes.Checked then cdsEtapasFLGACAOAPROVA.AsInteger := 4;
    MudouAcaoAprova;
  end;
end;


procedure TfrmCadProcessoRAD.MudouAcaoAprova;
begin
  dblkpNumProxEtapa.Enabled := rbEtapaEspecifica.Checked;
  spdbtnCondicoes.Enabled   := rbAvancaCondicoes.Checked;
end;

procedure TfrmCadProcessoRAD.cdsEtapasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SelecionaEtapa;
end;

procedure TfrmCadProcessoRAD.dbrdgrpQtdeAprovaClick(Sender: TObject);
begin
  inherited;
  dbspnQtdeAutoriza.Enabled := ( dbrdgrpQtdeAprova.ItemIndex = 0 );
end;

procedure TfrmCadProcessoRAD.HabilitaAltEtapas(bPodeAlterar: boolean);
begin
  pnlTopEtapas.Enabled := ( bPodeAlterar and ( cdsEtapasNUMERO.AsString <> '0' ) );
  pnlAprovacao.Enabled := bPodeAlterar;
  pnlRecusa.Enabled    := bPodeAlterar;
  pnlCondicoes.Enabled := bPodeAlterar;
  pnlAvisos.Enabled    := bPodeAlterar;

  dbnvgtrEtapas.Visible  := not bPodeAlterar;
  TB97oKCancelar.Enabled := not bPodeAlterar;
end;

procedure TfrmCadProcessoRAD.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if Cds.IsEmpty then
  begin
    cdsEtapas.Close;
    cdsEtapaDest.Close;
    spdbtnAprovacao.Enabled := True;
    spdbtnRecusa.Enabled := True;
    spdbtnAvisos.Enabled := True;
  end;
end;

procedure TfrmCadProcessoRAD.PreencheAvisosPadrao;
begin
  CdsTXTAPROVARAD.AsString    :=
   'Sr(a). <#NOMEDEST>;' + #13#10 +
   'O processo no. <#NUMRAD> (<#DESCRAD>) foi aprovado por <#RESPONSAVEL> em <#DATAHORAAPROVA>.';

  CdsTXTAPROVARADRES.AsString :=
   'Sr(a). <#NOMEDEST>;' + #13#10 +
   'O processo no. <#NUMRAD> (<#DESCRAD>) foi aprovado por <#RESPONSAVEL> em <#DATAHORAAPROVA> com a seguinte ressalva:' + #13#10 +
   '<#RESSALVA>';

  CdsTXTRECUSARAD.AsString    :=
   'Sr(a). <#NOMEDEST>;' + #13#10 +
   'O processo no. <#NUMRAD> (<#DESCRAD>) foi recusado por <#RESPONSAVEL> em <#DATAHORAAPROVA> pelo seguinte motivo:' + #13#10 +
   '<#RESSALVA>';

  CdsTXTAPROVAETAPA.AsString  :=
   'Sr(a). <#NOMEDEST>;' + #13#10 +
   'A etapa <#DESCETAPA> do processo no. <#NUMRAD> (<#DESCRAD>) foi aprovado por <#RESPONSAVEL> em <#DATAHORAAPROVA>.';

  CdsTXTRECUSAETAPA.AsString  :=
   'Sr(a). <#NOMEDEST>;' + #13#10 +
   'A etapa <#DESCETAPA> do processo no. <#NUMRAD> (<#DESCRAD>) foi recusada por <#RESPONSAVEL> em <#DATAHORAAPROVA> pelo seguinte motivo:' + #13#10 +
   '<#RESSALVA>';

  CdsTXTSOLICAPROV.AsString   :=
   'Sr(a). <#NOMEDEST>;' + #13#10 +
   'A etapa <#DESCETAPA> do processo no. <#NUMRAD> (<#DESCRAD>) está pendente de sua aprovação desde <#DATAHORAETAPA>.';
end;

procedure TfrmCadProcessoRAD.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  PreencheAvisosPadrao;
end;

procedure TfrmCadProcessoRAD.dbrdgrpRetornoClick(Sender: TObject);
begin
  inherited;
  dblkpNumEtapaRetorno.Enabled := ( dbrdgrpRetorno.ItemIndex = 1 ) and dbchkbxRetorna.Checked;
end;

procedure TfrmCadProcessoRAD.dbchkbxRetornaClick(Sender: TObject);
begin
  inherited;
  dbrdgrpRetorno.Enabled       := dbchkbxRetorna.Checked;
  dblkpNumEtapaRetorno.Enabled := ( dbrdgrpRetorno.ItemIndex = 1 ) and dbchkbxRetorna.Checked;
end;

procedure TfrmCadProcessoRAD.btnIncluiDestClick(Sender: TObject);
begin
  inherited;
  msDestAviso.Executar;
  if msDestAviso.RetornouValor then
  begin
    cdsEtapaDest.Append;
    cdsEtapaDestIDRADETAPA.AsInteger := cdsEtapasIDRADETAPA.AsInteger;
    cdsEtapaDestIDPESSOA.AsString    := msDestAviso.ValoresChave[0];
    cdsEtapaDestNOME.AsString        := msDestAviso.ValoresChave[1];
    cdsEtapaDestEMAIL.AsString       := msDestAviso.ValoresChave[2];
    cdsEtapaDest.Post;
  end;
end;

procedure TfrmCadProcessoRAD.btnExcluiDestClick(Sender: TObject);
begin
  inherited;
  if cdsEtapaDest.Active then
    cdsEtapaDest.Delete;
end;

procedure TfrmCadProcessoRAD.cdsEtapaDestAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsEtapaDestIDRADETAPA.AsInteger := cdsEtapasIDRADETAPA.AsInteger;
end;

procedure TfrmCadProcessoRAD.FiltraDestinatarios;
begin
  cdsEtapaDest.Filtered := False;
  cdsEtapaDest.Filter := 'IDRADETAPA = ' + cdsEtapasIDRADETAPA.AsString;
  cdsEtapaDest.Filtered := True;
end;

procedure TfrmCadProcessoRAD.SelecionaEtapa;
begin
  case cdsEtapasFLGACAOAPROVA.AsInteger of
    1 : rbProximaEtapa.Checked    := True;
    2 : rbEtapaEspecifica.Checked := True;
    3 : rbAprovaFinaliza.Checked  := True;
    4 : rbAvancaCondicoes.Checked := True;
  end;
  MudouAcaoAprova;

  spdbtnRecusa.Enabled      := ( cdsEtapasNUMERO.AsInteger > 0 );
  spdbtnAvisos.Enabled      := ( cdsEtapasNUMERO.AsInteger > 0 );
  rbAprovaFinaliza.Enabled  := ( cdsEtapasNUMERO.AsInteger > 0 );
  dbrdgrpQtdeAprova.Visible := ( cdsEtapasNUMERO.AsInteger > 0 );
  dbspnQtdeAutoriza.Visible := ( cdsEtapasNUMERO.AsInteger > 0 );
  pnlElse.Enabled           := ( cdsEtapasNUMERO.AsInteger > 0 );

  dbspnQtdeAutoriza.Enabled    := ( cdsEtapasFLGQTDEAUTORIZA.AsInteger = 1 );
  dbrdgrpRetorno.Enabled       := ( cdsEtapasFLGPODERETORNAR.AsInteger = 1 );
  dblkpNumEtapaRetorno.Enabled := ( cdsEtapasFLGETAPARETORNO.AsInteger = 2 ) and ( cdsEtapasFLGPODERETORNAR.AsInteger = 1 );

  cmbAvisos.ItemIndex := cdsEtapasFLGAVISOS.AsInteger - 1;
  grpAvisos.Enabled := ( cdsEtapasFLGAVISOS.AsInteger > 1 );

  cmbElse.ItemIndex := cdsEtapasFLGELSE.AsInteger - 1;
  dblkpEtapaElse.Visible := ( cmbElse.ItemIndex = 1 );

  FiltraDestinatarios;

  if cdsEtapasNUMERO.AsInteger = 0 then
  begin
    if ( ntbkEtapa.ActivePage = 'Recusa' ) or ( ntbkEtapa.ActivePage = 'Avisos' ) then
    begin
      spdbtnAprovacao.Down := True;
      ntbkEtapa.ActivePage := 'Aprovacao';
    end;
  end;

  if ( ntbkEtapa.ActivePage = 'Condicoes' ) then
  begin
    if cdsEtapasFLGACAOAPROVA.AsInteger <> 4 then
    begin
      spdbtnAprovacao.Down := True;
      ntbkEtapa.ActivePage := 'Aprovacao';
    end;
  end;
end;

procedure TfrmCadProcessoRAD.CdsIDREFERENCIAChange(Sender: TField);
begin
  inherited;
  SelecionaReferencia;
end;

procedure TfrmCadProcessoRAD.SelecionaReferencia;
begin
  memRef.Text := '';
  if dblkpEventoGerador.Text <> '' then
  begin
    cdsEventoGerador.Locate( 'IDREFERENCIA', cdsIDREFERENCIA.AsInteger, [] );
    memRef.Text := cdsEventoGeradorDESCRICAO.AsString;
  end;
  SelecionaCondicoes( CdsIDREFERENCIA.AsInteger );
  MontaFrameCondicoes;
end;

procedure TfrmCadProcessoRAD.MontaFrameCondicoes;
begin
  if frameCondRAD <> nil then
  begin
    frameCondRAD.OnDestroy;
    FreeAndNil( frameCondRAD );
  end;

  case StrToIntDef( dblkpEventoGerador.LookupValue, -1 ) of
    27, 30 : frameCondRAD := TframeCndRADDoc.Create( Self );
  end;

  if frameCondRAD <> nil then
  begin
    frameCondRAD.Parent := pnlCondicoes;
    frameCondRAD.Align  := alClient;
    frameCondRAD.CtrlRadEtapaCond := CtrlRadEtapaCond;
    frameCondRAD.pnlElse := pnlElse;
    frameCondRAD.cdsCondicoes := cdsCondicoes;
    frameCondRAD.dsCondicoes.DataSet := frameCondRAD.cdsCondicoes;
    frameCondRAD.OnCreate;
    frameCondRAD.dsCondicoes.DataSet := cdsCondicoes;
    frameCondRAD.cdsEtapas.Data := cdsEtapas.Data;
    frameCondRAD.OnPrepare;
    frameCondRAD.ModoAlteracao      := ModoAlteracaoCond;
    frameCondRAD.ModoBrowser        := ModoBrowserCond;
    frameCondRAD.ModoBrowser;
  end;
end;


procedure TfrmCadProcessoRAD.SelecionaCondicoes( iIdRadTipoProc : integer );
begin
  cdsCondicoes.Close;
  case StrToIntDef( dblkpEventoGerador.LookupValue, -1 ) of
    27 : cdsCondicoes.Data := CtrlRadEtapaCond.SelecionaCondDoc( iIdRadTipoProc );
  else
    cdsCondicoes.Data := CtrlRadEtapaCond.SelecionaTodasCond( iIdRadTipoProc );
  end;
end;

procedure TfrmCadProcessoRAD.ModoAlteracaoCond;
begin
  pnlElse.Visible          := False;
  DockOkCancEtapas.Enabled := False;
  pnlAcoesEtapa.Enabled    := False;
  pnlTopEtapas.Enabled     := False;
end;

procedure TfrmCadProcessoRAD.ModoBrowserCond;
begin
  pnlElse.Visible          := True;
  DockOkCancEtapas.Enabled := True;
  pnlAcoesEtapa.Enabled    := True;
  pnlTopEtapas.Enabled     := True;
end;

end.

