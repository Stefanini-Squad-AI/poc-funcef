{--------------------------------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 25420
Descrição: Implementada a referência-RAD para o sistema de Cotas Patrimoniais.
           Implementada chamada ao frame de condições de Cotas Patrimoniais.
--------------------------------------------------------------------------------------------------}

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
  uCtrlRadEtapaDest, uCtrlRadEtapaCond,
  frCondRAD, frCndRADDoc, frCndRADGeral, frCndRADSolicCompra,
  frCndRADReqMaterial, frCndRADvalor, fRenumerarEtapas, frCndRADDestacViagem,
  frCndRADOrdemCompra, frCndRADCotacao;

const
  CR = #13#10;

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
    dckEtapa: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsEtapa: TToolbarButton97;
    sbtnAltEtapa: TToolbarButton97;
    sbtnExcluiEtapa: TToolbarButton97;
    cdsCondicoes: TCMClientDataSet;
    tbsTextos: TTabSheet;
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
    lblTxtAprovaRAD: TLabel;
    lblTxtAprovaEtapa: TLabel;
    lblTxtAprovaRADRes: TLabel;
    lblTxtRecusaRAD: TLabel;
    lblTxtRecusaEtapa: TLabel;
    lblTxtSolicAprova: TLabel;
    btnTags: TSpeedButton;
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
    cdsEtapasFLGQTDEAUTORIZA: TFloatField;
    msDestAviso: TMontaSelect;
    cdsEtapaDest: TCMClientDataSet;
    cdsEtapaDestIDPESSOA: TFloatField;
    cdsEtapaDestIDRADETAPA: TFloatField;
    cdsEtapaDestNOME: TStringField;
    cdsEtapaDestEMAIL: TStringField;
    dsEtapaDest: TDataSource;
    cdsEtapasAux: TCMClientDataSet;
    cdsEtapasAuxNUMERO: TFloatField;
    cdsEtapasAuxDESCRICAO: TStringField;
    cdsEtapasAuxNOMEGRUPORESPON: TStringField;
    cdsEtapasAuxPRAZOESTIMADO: TStringField;
    cdsEtapasAuxIDRADETAPA: TFloatField;
    cdsEtapasAuxIDRADTIPOPROC: TFloatField;
    cdsEtapasAuxIDGRPRESPON: TFloatField;
    cdsEtapasAuxFLGACAOAPROVA: TFloatField;
    cdsEtapasAuxFLGQTDEAUTORIZA: TFloatField;
    cdsEtapasAuxQTDEAUTORIZA: TFloatField;
    cdsEtapasAuxNUMETAPADEST: TFloatField;
    cdsEtapasAuxFLGPODERETORNAR: TFloatField;
    cdsEtapasAuxFLGETAPARETORNO: TFloatField;
    cdsEtapasAuxNUMETAPARET: TFloatField;
    cdsEtapasAuxFLGPODERECUSAR: TFloatField;
    cdsEtapasAuxFLGELSE: TFloatField;
    cdsEtapasAuxNUMETAPAELSE: TFloatField;
    cdsEtapasAuxFLGAVISOS: TFloatField;
    cdsEtapasAuxFLGAVISOGRUPO: TFloatField;
    cdsEtapasAuxFLGAVISOSOLIC: TFloatField;
    cdsEtapasAuxAVISOOUTROS: TStringField;
    CdsFLGATIVO: TFloatField;
    dbcbAtivo: TDBCheckBox;
    btnAvisosPadroes: TSpeedButton;
    DockOkCancEtapas: TDock97;
    tb97Etapa: TToolbar97;
    bbtnOkEtapa: TBitBtn;
    bbtnCancelarEtapa: TBitBtn;
    pnlDetalhes: TPanel;
    pnlTopDetalhes: TPanel;
    dbnvgtrEtapas: TDBNavigator;
    pnlTopEtapas: TPanel;
    lblNumero: TLabel;
    lblDescEtapa: TLabel;
    lblGrupoRespon: TLabel;
    lblPrazoEtapa: TLabel;
    lblhEtapa: TLabel;
    dbspnNumero: TwwDBSpinEdit;
    dbedtDescEtapa: TDBEdit;
    dblkpGrupoRespon: TwwDBLookupCombo;
    dbedtPrazoEtapa: TDBEdit;
    pnlDetalhesEtapa: TPanel;
    pnlAcoesEtapa: TPanel;
    spdbtnAprovacao: TSpeedButton;
    spdbtnRecusa: TSpeedButton;
    spdbtnCondicoes: TSpeedButton;
    bvlSeparador: TBevel;
    spdbtnAvisos: TSpeedButton;
    ntbkEtapa: TNotebook;
    pnlAprovacao: TPanel;
    grpProxEtapa: TGroupBox;
    rbProximaEtapa: TRadioButton;
    rbEtapaEspecifica: TRadioButton;
    rbAprovaFinaliza: TRadioButton;
    rbAvancaCondicoes: TRadioButton;
    dblkpNumProxEtapa: TwwDBLookupCombo;
    dbrdgrpQtdeAprova: TDBRadioGroup;
    dbspnQtdeAutoriza: TwwDBSpinEdit;
    pnlRecusa: TPanel;
    grpRecusa: TGroupBox;
    dbchkbxRetorna: TDBCheckBox;
    dbchkbxRecusa: TDBCheckBox;
    dbrdgrpRetorno: TDBRadioGroup;
    dblkpNumEtapaRetorno: TwwDBLookupCombo;
    pnlCondicoes: TPanel;
    pnlElse: TPanel;
    lblElse: TLabel;
    dblkpEtapaElse: TwwDBLookupCombo;
    cmbElse: TComboBox;
    pnlAvisos: TPanel;
    lblAvisos: TLabel;
    cmbAvisos: TComboBox;
    grpAvisos: TGroupBox;
    pnlOutrosDestinatarios: TPanel;
    btnIncluiDest: TSpeedButton;
    btnExcluiDest: TSpeedButton;
    sttctxtOutrosDestinatarios: TStaticText;
    dbgrdEtapaDest: TwwDBGrid;
    dbchkAvisoGrupo: TDBCheckBox;
    dbchkAvisoSolic: TDBCheckBox;
    sbtnRenumeraEtapas: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    procedure dbgrdEtapasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdCondicoesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure spdbtnAprovacaoClick(Sender: TObject);
    procedure rbProximaEtapaClick(Sender: TObject);
    procedure cmbAvisosChange(Sender: TObject);
    procedure sbtnInsEtapaClick(Sender: TObject);
    procedure cmbElseChange(Sender: TObject);
    procedure btnTagsClick(Sender: TObject);
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
    procedure cdsCondicoesAfterInsert(DataSet: TDataSet);
    procedure cdsCondicoesAfterOpen(DataSet: TDataSet);
    procedure btnAvisosPadroesClick(Sender: TObject);
    procedure sbtnRenumeraEtapasClick(Sender: TObject);
  private
    CtrlRadTipoProc  : TCtrlRadTipoProc;
    CtrlGrpProcesso  : TCtrlGrpProcesso;
    CtrlRadEtapa     : TCtrlRadEtapa;
    CtrlGrupoRespon  : TCtrlGrupoRespon;
    CtrlRadEtapaDest : TCtrlRadEtapaDest;
    CtrlRadEtapaCond : TCtrlRadEtapaCond; 

    iIdRADTipoProc   : integer;
    iIdProxIdEtapa   : integer;
    bPodeMudarTab    : boolean;
    iProxIdCond      : integer;
    iProxOrdemCond   : integer;

    iHeight : integer;
    iWidth  : integer;

    bMaximizado : boolean;

    frameCondRAD : TframeCondRAD;

    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    procedure MaximizaJanela;
    procedure RestauraJanela;

    function CampoHora( sHoraDigitada : string ) : string;

    procedure HabilitaFundo( bPodeAlterar : boolean );
    procedure HabilitaAltEtapas( bPodeAlterar : boolean );
    procedure MudouAcaoAprova;

    procedure SelecionaEtapa;

    procedure FiltraDestinatarios;
    procedure FiltraCondicoes;

    procedure ModoAlteracaoCond;
    procedure ModoBrowserCond;

    procedure SelecionaCondicoes;

    procedure LookupEtapas;

    procedure SelecionaReferencia;
    procedure MontaFrameCondicoes;

    procedure PreencheAvisosPadrao;
    procedure RecuperaRad( iId : integer );
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
  ntbkEtapa.ActivePage      := 'Aprovacao'; 

  bMaximizado := False;
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

procedure TfrmCadProcessoRAD.sbtnInsEtapaClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  LookupEtapas;

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

  grpProxEtapa.Caption := 'Ao aprovar esta etapa...';

  dbedtDescEtapa.SetFocus;
end;

procedure TfrmCadProcessoRAD.cmbElseChange(Sender: TObject);
begin
  inherited;
  cdsEtapasFLGELSE.AsInteger := cmbElse.ItemIndex + 1;
  dblkpEtapaElse.Visible := ( cmbElse.ItemIndex = 1 );
end;

procedure TfrmCadProcessoRAD.btnTagsClick(Sender: TObject);
begin
  inherited;
  MessageDlg('Palavras-chave disponíveis:' + #13+#10 + #13+#10 +
   '<#DESCRAD>     Descrição do processo RAD.' + #13+#10 +
   '<#DESCETAPA>     Descrição da etapa.' + #13+#10 +
   '<#NOMEDEST>     Nome do destinatário.' + #13+#10 +
   '<#NUMRAD>     Número do processo RAD.' + #13+#10 +
   '<#RESPONSAVELRECUSA>     Responsável pela recusa.' + #13+#10 +
   '<#DATAHORAINIRAD>     Data e hora de início do processo.' + #13+#10 +
   '<#DATAHORAINIETAPA>     Data e hora de início da etapa.' + #13+#10 +
   '<#DATAHORAFIMRAD>     Data e hora de término do processo.' + #13+#10 +
   '<#DATAHORAFIMETAPA>     Data e hora de término da etapa.' + #13+#10 +
   '<#DATAHORAPREVFIMETAPA>     Data e hora previstas para término da etapa.' + #13+#10 + 
   '<#OBSRAD>     Observação sobre o processo.' + #13+#10 +
   '<#OBSRECUSA>     Observação, ressalva ou motivo de recusa da etapa.' + #13+#10 +
   '<#VALOR>     Valor.' + #13+#10 +
   '<#CODCENTROCUSTO>     Código do Centro de Custo.' + #13+#10 +
   '<#DESCCENTROCUSTO>     Descrição do Centro de Custo.' + #13+#10 +
   '<#CODCENTRORESPON>     Código do Centro de Custo.' + #13+#10 +
   '<#DESCCENTRORESPON>     Descrição do Centro de Responsabilidade.' + #13+#10 +
   '<#GRUPOPROD>     Grupo de Produtos.' + #13+#10 +
   '<#ATIVXPROJ>     Atividade x Projeto.' + #13+#10 +
   '<#TIPODOC>     Tipo de Documento.' + #13+#10,
   mtInformation, [mbOk], 0);
end;

procedure TfrmCadProcessoRAD.CmeCadastroInsert(Sender: TObject);
begin
  memRef.Text := '';

  cds.Close;
  cds.CreateDataSet;

  cdsEtapas.Close;
  cdsEtapas.CreateDataSet;

  cdsEtapaDest.Close;
  cdsEtapaDest.CreateDataSet;

  iIdRADTipoProc := 0;
  iIdProxIdEtapa := 1;

  cdsEtapas.Append;
  cdsEtapasNUMERO.AsInteger   := 0;
  cdsEtapasDESCRICAO.AsString := 'Definição da etapa inicial do processo.';
  cdsEtapas.Post;

  SelecionaEtapa;

  SelecionaCondicoes;

  pgctrlProcesso.ActivePage := tbsDadosGerais;
  dbedtNomeProcesso.SetFocus;

  MontaFrameCondicoes;

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
  iIdEtapa, iIdEtapaCond, iNumero,
  iEtapaAnt : integer;
  bPrazoTotal, bPrazoEtapa : boolean;
  sNome, sMsgPrazo : string;
begin
  inherited;
  Accept := False;

  if StrToIntDef( trim( StringReplace( cdsPRAZOESTIMADO.AsString, ':', '', [] ) ), 0 ) = 0 then
  begin
    cds.Edit;
    cdsPRAZOESTIMADO.Clear;
    cds.Post;
  end;                           

  if trim( dblkpEventoGerador.Text ) <> '' then
  begin
    if cdsFLGATIVO.AsInteger = 1 then
    begin
      sNome := CtrlRadTipoProc.ReferenciaUsada( CdsIDRADTIPOPROC.AsInteger, CdsIDREFERENCIA.AsInteger );
      if sNome <> '' then
      begin
        pgctrlProcesso.ActivePage := tbsDadosGerais;
        MsgErro( 'Este evento gerador já está sendo utilizado pelo tipo de processo "' + sNome + '".' );
        dblkpEventoGerador.SetFocus;
        exit;
      end;
    end;
  end;

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

      if rbEtapaEspecifica.Checked then
        if not cdsEtapasAux.Locate( 'NUMERO', cdsEtapasNUMETAPADEST.AsInteger, [] ) then
        begin
          sbtnAltEtapaClick( nil );
          ntbkEtapa.ActivePage := 'Aprovacao';
          spdbtnAprovacao.Down := True;
          MsgErro( 'A etapa "' + cdsEtapasNUMETAPADEST.AsString + '" não existe.' );
          dblkpNumProxEtapa.SetFocus;
          exit;
        end;

      if dbrdgrpRetorno.ItemIndex = 1 then
        if not cdsEtapasAux.Locate( 'NUMERO', cdsEtapasNUMETAPARET.AsInteger, [] ) then
        begin
          sbtnAltEtapaClick( nil );
          ntbkEtapa.ActivePage := 'Recusa';
          spdbtnRecusa.Down := True;
          MsgErro( 'A etapa "' + cdsEtapasNUMETAPARET.AsString + '" não existe.' );
          dblkpNumEtapaRetorno.SetFocus;
          exit;
        end;

      if cdsEtapasFLGELSE.AsInteger = 2 then
      begin

        if not cdsEtapasAux.Locate( 'NUMERO', cdsEtapasNUMETAPAELSE.AsInteger, [] ) then
        begin
          sbtnAltEtapaClick( nil );
          ntbkEtapa.ActivePage := 'Condicoes';
          spdbtnCondicoes.Down := True;
          MsgErro( 'A etapa "' + cdsEtapasNUMETAPAELSE.AsString + '" não existe.' );
          dblkpEtapaElse.SetFocus;
          exit;
        end;

        if cdsEtapasNUMETAPAELSE.AsInteger <= cdsEtapasNUMERO.AsInteger then
        begin
          sbtnAltEtapaClick( nil );
          ntbkEtapa.ActivePage := 'Condicoes';
          spdbtnCondicoes.Down := True;
          MsgErro( 'Não é possível avançar para uma etapa igual ou anterior à atual.' );
          dblkpEtapaElse.SetFocus;
          exit;
        end;
      end;

      if ( cdsEtapasFLGACAOAPROVA.AsInteger = 2 ) and 
         ( cdsEtapasNUMETAPADEST.AsInteger <= cdsEtapasNUMERO.AsInteger ) then
      begin
        sbtnAltEtapaClick( nil );
        ntbkEtapa.ActivePage := 'Aprovacao';
        spdbtnAprovacao.Down := True;
        MsgErro( 'Não é possível avançar para uma etapa igual ou anterior à atual.' );
        dblkpNumProxEtapa.SetFocus;
        exit;
      end;


      if ( cdsEtapasNUMERO.AsInteger > 0 ) and
         ( cdsEtapasFLGPODERETORNAR.AsInteger = 1 ) and
         ( cdsEtapasFLGETAPARETORNO.AsInteger = 2 ) and
         ( cdsEtapasNUMETAPARET.AsInteger >= cdsEtapasNUMERO.AsInteger ) then
      begin
        sbtnAltEtapaClick( nil );
        ntbkEtapa.ActivePage := 'Recusa';
        spdbtnRecusa.Down := True;
        MsgErro( 'Não é possível retornar para uma etapa igual ou posterior à atual.' );
        dblkpNumEtapaRetorno.SetFocus;
        exit;
      end;


      if ( cdsEtapasNUMERO.AsInteger > 0 ) and
         ( cdsEtapasFLGPODERETORNAR.AsInteger = 1 ) and
         ( cdsEtapasFLGETAPARETORNO.AsInteger = 2 ) and
         ( cdsEtapasNUMETAPARET.AsInteger = 0 ) then
      begin
        sbtnAltEtapaClick( nil );
        ntbkEtapa.ActivePage := 'Recusa';
        spdbtnRecusa.Down := True;
        MsgErro( 'Não é possível retornar para a etapa 0.' );
        dblkpNumEtapaRetorno.SetFocus;
        exit;
      end;



      //Teste do preenchimento dos prazos
      if cdsEtapasNUMERO.AsInteger > 0 then
      begin
        sMsgPrazo := '';
        bPrazoTotal := ( trim( CdsPRAZOESTIMADO.AsString       ) <> '' ) and ( trim( cdsPRAZOESTIMADO.AsString       ) <> ':' );
        bPrazoEtapa := ( trim( cdsEtapasPRAZOESTIMADO.AsString ) <> '' ) and ( trim( cdsEtapasPRAZOESTIMADO.AsString ) <> ':' );
        if bPrazoTotal and ( not bPrazoEtapa ) then sMsgPrazo := 'O prazo estimado das etapas é obrigatório quando o processo possui um prazo.';
        if ( not bPrazoTotal ) and bPrazoEtapa then sMsgPrazo := 'O prazo estimado das etapas deve ficar em branco quando o processo não possui um prazo.';
        if sMsgPrazo <> '' then
        begin
          sbtnAltEtapaClick( nil );
          MsgErro( sMsgPrazo );
          dbedtPrazoEtapa.SetFocus;
          exit;
        end;
      end;

      cdsEtapas.Next;
    end;

    if cdsEtapasFLGACAOAPROVA.AsInteger <> 3 then
    begin
      sbtnAltEtapaClick( nil );
      ntbkEtapa.ActivePage := 'Aprovacao';
      spdbtnAprovacao.Down := True;
      MsgErro( 'A última etapa do processo deve obrigatoriamente encerrá-lo."' );
      exit;
    end;

    cdsEtapas.First;

    if cdsEtapas.RecordCount > 1 then
    begin
      cdsEtapas.Next;

      if cdsEtapasFLGPODERETORNAR.AsInteger = 1 then
        if cdsEtapasFLGETAPARETORNO.AsInteger = 1 then
        begin
          sbtnAltEtapaClick( nil );
          ntbkEtapa.ActivePage := 'Recusa';
          spdbtnRecusa.Down := True;
          MsgErro( 'Não é possível retornar para a etapa 0.' );
          dbrdgrpRetorno.SetFocus;
          exit;
        end;

      cdsEtapas.First;
    end;


  finally
    cdsEtapas.EnableControls;
  end;

  try
    cdsCondicoes.Filtered := False;
    cdsCondicoes.DisableControls;
    while not cdsCondicoes.Eof do
    begin
      iIdEtapa     := cdsCondicoes.FieldByName('IDRADETAPA').AsInteger;
      iIdEtapaCond := cdsCondicoes.FieldByName('IDRADETAPACOND').AsInteger;

      cdsEtapasAux.First;
      cdsEtapasAux.Locate( 'IDRADETAPA', cdsCondicoes.FieldByName('IDRADETAPA').AsInteger, [] );

      //Se não for para avançar conforme condições, ignora estas validações
      if cdsEtapasAux.FieldByName('FLGACAOAPROVA').AsInteger <> 4 then
      begin
        cdsCondicoes.Next;
        Continue;
      end;

      iNumero := cdsEtapasAux.FieldByName('NUMERO').AsInteger;

      cdsEtapasAux.First;

      if not cdsEtapasAux.Locate( 'NUMERO', cdsCondicoes.FieldByName('NUMETAPADEST').AsInteger, [] ) then
      begin
        ntbkEtapa.ActivePage := 'Condicoes';
        spdbtnCondicoes.Down := True;
        cdsEtapas.Locate( 'IDRADETAPA', iIdEtapa, [] );
        cdsCondicoes.Filtered := True;
        cdsCondicoes.Locate( 'IDRADETAPACOND', iIdEtapaCond, [] );
        sbtnAltEtapaClick( nil );
        frameCondRAD.btnAlterarClick( nil );
        MsgErro( 'A etapa "' + cdsCondicoes.FieldByName('NUMETAPADEST').AsString + '" não existe.' );
        frameCondRAD.dblkpNumEtapaDest.SetFocus;
        exit;
      end;


      if cdsCondicoes.FieldByName('NUMETAPADEST').AsInteger <= iNumero then
      begin
        ntbkEtapa.ActivePage := 'Condicoes';
        spdbtnCondicoes.Down := True;
        cdsEtapas.Locate( 'IDRADETAPA', iIdEtapa, [] );
        cdsCondicoes.Filtered := True;
        cdsCondicoes.Locate( 'IDRADETAPACOND', iIdEtapaCond, [] );
        sbtnAltEtapaClick( nil );
        frameCondRAD.btnAlterarClick( nil );
        MsgErro( 'Não é possível avançar para uma etapa igual ou anterior à atual.' );
        frameCondRAD.dblkpNumEtapaDest.SetFocus;
        exit;
      end;

      cdsCondicoes.Next;
    end;
  finally
    cdsCondicoes.EnableControls;
  end;
  cdsCondicoes.Filtered := True;

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
  Accept := CtrlRadTipoProc.GravaRadTipoProc( cds.Data, cdsEtapas.Data, cdsEtapaDest.Data, cdsCondicoes.Data );
end;

procedure TfrmCadProcessoRAD.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    RecuperaRad( StrToIntDef( MontaSelect.ValoresChave[0], 0 ) );
end;

procedure TfrmCadProcessoRAD.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRadTipoProc.GravaRadTipoProc( cds.Data, cdsEtapas.Data, cdsEtapaDest.Data, cdsCondicoes.Data );
  RecuperaRad( CdsIDRADTIPOPROC.AsInteger );
end;

procedure TfrmCadProcessoRAD.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRadTipoProc.ExcluiRadTipoProc( iIdRADTipoProc );
  if Accept then
  begin
    memRef.Text := '';
    cdsEtapas.Close;
    cdsEtapaDest.Close;
    cdsCondicoes.Close;
    MontaFrameCondicoes;
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
  LookupEtapas;

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

  if StrToIntDef( trim( StringReplace( cdsEtapasPRAZOESTIMADO.AsString, ':', '', [] ) ), 0 ) = 0 then
    cdsEtapasPRAZOESTIMADO.Clear;
  
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

  if rbAvancaCondicoes.Checked then
  begin
    if cdsCondicoes.RecordCount = 0 then
    begin
      ntbkEtapa.ActivePage := 'Condicoes';
      spdbtnCondicoes.Down := True;
      MsgErro( 'Inclua pelo menos uma condição.' );      
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
  cdsEtapasFLGPODERETORNAR.AsInteger := 0;
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
  pnlTopEtapas.Enabled  := ( bPodeAlterar and ( cdsEtapasNUMERO.AsString <> '0' ) );
  pnlAprovacao.Enabled  := bPodeAlterar;
  pnlRecusa.Enabled     := bPodeAlterar;
  pnlCondicoes.Enabled  := bPodeAlterar;
  pnlAvisos.Enabled     := bPodeAlterar;

  dbnvgtrEtapas.Visible := not bPodeAlterar;
  bbtnConfirmar.Enabled := not bPodeAlterar;
  bbtnCancelar.Enabled  := not bPodeAlterar;
end;

procedure TfrmCadProcessoRAD.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  memRef.Text := '';
  if Cds.IsEmpty then
  begin
    cdsEtapas.Close;
    cdsEtapaDest.Close;
    cdsCondicoes.Close;
    MontaFrameCondicoes;
    spdbtnAprovacao.Enabled := True;
    spdbtnRecusa.Enabled := True;
    spdbtnAvisos.Enabled := True;
  end;
end;

procedure TfrmCadProcessoRAD.PreencheAvisosPadrao;
begin
  CdsTXTAPROVARAD.AsString    :=
   'Sr(a). <#NOMEDEST>;' + CR + CR +
   'O processo no. <#NUMRAD> ("<#DESCRAD>") foi aprovado em <#DATAHORAFIMRAD>h.';

  CdsTXTRECUSARAD.AsString    :=
   'Sr(a). <#NOMEDEST>;' + CR + CR +
   'O processo no. <#NUMRAD> ("<#DESCRAD>") foi recusado por <#RESPONSAVELRECUSA> em <#DATAHORAFIMRAD>h pelo seguinte motivo:' + CR + CR +
   '<#OBSRECUSA>';

  CdsTXTAPROVAETAPA.AsString  :=
   'Sr(a). <#NOMEDEST>;' + CR + CR +
   'A etapa "<#DESCETAPA>" do processo no. <#NUMRAD> ("<#DESCRAD>") foi aprovado em <#DATAHORAFIMETAPA>h.';

  CdsTXTAPROVARADRES.AsString :=
   'Sr(a). <#NOMEDEST>;' + CR + CR +
   'A etapa "<#DESCETAPA>" do processo no. <#NUMRAD> ("<#DESCRAD>") foi aprovado em <#DATAHORAFIMETAPA>h com ressalva(s).';

  CdsTXTRECUSAETAPA.AsString  :=
   'Sr(a). <#NOMEDEST>;' + CR + CR +
   'A etapa "<#DESCETAPA>" do processo no. <#NUMRAD> ("<#DESCRAD>") foi recusada por <#RESPONSAVELRECUSA> em <#DATAHORAFIMETAPA>h pelo seguinte motivo:' + CR + CR +
   '<#OBSRECUSA>';

  CdsTXTSOLICAPROV.AsString   :=
   'Sr(a). <#NOMEDEST>;' + CR + CR +
   'A etapa "<#DESCETAPA>" do processo no. <#NUMRAD> ("<#DESCRAD>", de R$ <#VALOR> ), está pendente de sua aprovação desde <#DATAHORAINIETAPA>h.';
end;

procedure TfrmCadProcessoRAD.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsFLGATIVO.AsInteger := 1;
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
    if cdsEtapaDest.RecordCount > 0 then
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

  dbspnQtdeAutoriza.Enabled    := ( cdsEtapasFLGQTDEAUTORIZA.AsInteger = 1 );
  dbrdgrpRetorno.Enabled       := ( cdsEtapasFLGPODERETORNAR.AsInteger = 1 );
  dblkpNumEtapaRetorno.Enabled := ( cdsEtapasFLGETAPARETORNO.AsInteger = 2 ) and ( cdsEtapasFLGPODERETORNAR.AsInteger = 1 );

  cmbAvisos.ItemIndex := cdsEtapasFLGAVISOS.AsInteger - 1;
  grpAvisos.Enabled := ( cdsEtapasFLGAVISOS.AsInteger > 1 );

  cmbElse.ItemIndex := cdsEtapasFLGELSE.AsInteger - 1;
  dblkpEtapaElse.Visible := ( cmbElse.ItemIndex = 1 );

  FiltraDestinatarios;
  FiltraCondicoes;

  if cdsEtapasNUMERO.AsInteger > 0 then
    grpProxEtapa.Caption := 'Ao aprovar esta etapa...'
  else
    grpProxEtapa.Caption := 'Ao iniciar o processo...';

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
  SelecionaCondicoes;
  MontaFrameCondicoes;
end;

procedure TfrmCadProcessoRAD.ModoAlteracaoCond;
begin
  cmbElse.Visible          := False;
  DockOkCancEtapas.Visible := False;
  pnlAcoesEtapa.Enabled    := False;
  pnlTopEtapas.Enabled     := False;
end;

procedure TfrmCadProcessoRAD.ModoBrowserCond;
begin
  cmbElse.Visible          := True;
  DockOkCancEtapas.Visible := True;
  pnlAcoesEtapa.Enabled    := True;
  pnlTopEtapas.Enabled     := ( dbspnNumero.Value > 0 );
end;

procedure TfrmCadProcessoRAD.FiltraCondicoes;
begin
  cdsCondicoes.Filtered := False;
  if cdsEtapas.IsEmpty then
  begin
    iProxOrdemCond := 1;
    exit;
  end;
  cdsCondicoes.Filter := 'IDRADETAPA = ' + cdsEtapasIDRADETAPA.AsString;
  cdsCondicoes.Filtered := True;
  cdsCondicoes.Filtered := False;
  if cdsEtapas.IsEmpty then
  begin
    iProxOrdemCond := 1;
    exit;
  end;
  cdsCondicoes.Filter := 'IDRADETAPA = ' + cdsEtapasIDRADETAPA.AsString;
  cdsCondicoes.Filtered := True;
  if cdsCondicoes.IsEmpty then
  begin
    iProxOrdemCond := 1;
    exit;
  end
  else
  begin
    cdsCondicoes.Last;
    iProxOrdemCond := cdsCondicoes.FieldByName('ORDEM').AsInteger + 1;
    cdsCondicoes.First;
  end;
end;

procedure TfrmCadProcessoRAD.cdsCondicoesAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsCondicoes.FieldByName('IDRADETAPA').AsInteger     := cdsEtapasIDRADETAPA.AsInteger;
  cdsCondicoes.FieldByName('ORDEM').AsInteger          := iProxOrdemCond;
  inc( iProxOrdemCond );
  cdsCondicoes.FieldByName('IDRADETAPACOND').AsInteger := iProxIdCond;
  inc( iProxIdCond );
end;


procedure TfrmCadProcessoRAD.MontaFrameCondicoes;
var
  iRadRef : integer;
begin
  if frameCondRAD <> nil then
  begin
    frameCondRAD.OnDestroy;
    FreeAndNil( frameCondRAD );
  end;

  iRadRef := StrToIntDef( dblkpEventoGerador.LookupValue, -1 );

  if RADReferencia( iRadRef, rrDoc ) then
    frameCondRAD := TframeCndRADDoc.Create( Self );
  if RADReferencia( iRadRef, rrOrdemCompra ) then
    frameCondRAD := TframeCndRADOrdemCompra.Create( Self );
  if RADReferencia( iRadRef, rrSolicCompra ) then
    frameCondRAD := TframeCndRADSolicCompra.Create( Self );
  if RADReferencia( iRadRef, rrPagtoLote ) then
    frameCondRAD := TframeCndRADValor.Create( Self );
  if RADReferencia( iRadRef, rrReqMaterial ) then
    frameCondRAD := TframeCndRADReqMaterial.Create( Self );
  if RADReferencia( iRadRef, rrDestacaViagem ) then
    frameCondRAD := TframeCndRADDestacViagem.Create( Self );
  if RADReferencia( iRadRef, rrCotacao ) then
    frameCondRAD := TframeCndRADCotacao.Create( Self );
  if RADReferencia( iRadRef, rrCotasPatrim) then
    frameCondRAD := TframeCndRADValor.Create( Self ); //amf 22.05.2007 25420.


  if iRadRef = -1 then
    frameCondRAD := TframeCndRADGeral.Create( Self );

  if frameCondRAD <> nil then
  begin
    frameCondRAD.Parent  := pnlCondicoes;
    frameCondRAD.CtrlRadEtapaCond := CtrlRadEtapaCond;
    frameCondRAD.pnlElse := pnlElse;
    frameCondRAD.cdsCondicoes := cdsCondicoes;
    frameCondRAD.dsCondicoes.DataSet := frameCondRAD.cdsCondicoes;
    frameCondRAD.OnCreate;
    frameCondRAD.dsCondicoes.DataSet := cdsCondicoes;
    frameCondRAD.dblkpNumEtapaDest.LookupTable := cdsEtapasAux;
    frameCondRAD.OnPrepare;
    frameCondRAD.ModoAlteracao      := ModoAlteracaoCond;
    frameCondRAD.ModoBrowser        := ModoBrowserCond;
    frameCondRAD.ModoBrowser;
  end;
end;


procedure TfrmCadProcessoRAD.SelecionaCondicoes;
begin
  cdsCondicoes.Close;
  cdsCondicoes.Data := CtrlRadEtapaCond.SelecionaTodasCond( iIdRadTipoProc );
  if cdsCondicoes.IsEmpty then
    iProxIdCond := 1
  else
  begin
    cdsCondicoes.Last;
    iProxIdCond := cdsCondicoes.FieldByName('IDRADETAPACOND').AsInteger + 1;
    cdsCondicoes.First;
  end;
  FiltraCondicoes;
end;


procedure TfrmCadProcessoRAD.cdsCondicoesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( cdsCondicoes.FieldByName('VLRINICIAL') ).DisplayFormat := '#,##0.00';
  TFloatField( cdsCondicoes.FieldByName('VLRINICIAL') ).Editformat    := '#,##0.00';
  TFloatField( cdsCondicoes.FieldByName('VLRFINAL') ).DisplayFormat   := '#,##0.00';
  TFloatField( cdsCondicoes.FieldByName('VLRFINAL') ).Editformat      := '#,##0.00';
end;

procedure TfrmCadProcessoRAD.RecuperaRad(iId: integer);
begin
  cds.Data       := CtrlRadTipoProc.SelecionaRadTipoProc( iId );

  iIdRADTipoProc := CdsIDRADTIPOPROC.AsInteger;

  pgctrlProcesso.ActivePage := tbsDadosGerais;

  cdsEtapas.Data := CtrlRadEtapa.SelecionaEtapasRAD( iIdRADTipoProc );

  try
    cdsEtapas.DisableControls;
    cdsEtapas.First;
    iIdProxIdEtapa := 0;
    while not cdsEtapas.Eof do
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

procedure TfrmCadProcessoRAD.LookupEtapas;
begin
  cdsEtapasAux.Data := cdsEtapas.Data;
  cdsEtapasAux.Locate( 'NUMERO', 0, [] );
  cdsEtapasAux.Delete;
  cdsEtapasAux.First;
end;

procedure TfrmCadProcessoRAD.btnAvisosPadroesClick(Sender: TObject);
begin
  inherited;
  if MessageDlg( 'Deseja sobrescrever o conteúdo atual dos avisos pelo padrão?', mtConfirmation,
   [mbYes, mbNo], 0) = mrYes then
    PreencheAvisosPadrao;
end;

procedure TfrmCadProcessoRAD.MaximizaJanela;
begin
  Height := Application.MainForm.ClientHeight - 60;
  Width  := Application.MainForm.ClientWidth - 6;
  Top    := 0;
  Left   := 0;
  bMaximizado := True;
end;

procedure TfrmCadProcessoRAD.RestauraJanela;
begin
  Height := iHeight;
  Width  := iWidth;
  Top    := round( ( ( Application.MainForm.ClientHeight - 60 ) - Height ) / 2 );
  Left   := round( ( ( Application.MainForm.ClientWidth  - 6  ) - Width  ) / 2 );
  bMaximizado := False;
end;

procedure TfrmCadProcessoRAD.WMSysCommand(var Msg: TWMSysCommand);
begin
  if ( Msg.CmdType = SC_MAXIMIZE ) or( Msg.CmdType = 61490 ) then
  begin
    if bMaximizado then
      RestauraJanela
    else
      MaximizaJanela;
    exit;
  end;
  inherited;
end;


procedure TfrmCadProcessoRAD.sbtnRenumeraEtapasClick(Sender: TObject);
var
  iDiferenca, iNumEtapaSelecionada, iNovoNumeroInicial : integer;
  cds_Etapas, cds_Condicoes : TClientDataset;
begin
  inherited;
  if cdsEtapasNUMERO.AsInteger <= 0 then exit;

  cds_Etapas    := TClientDataset.Create( nil );
  cds_Condicoes := TClientDataset.Create( nil );
  frmRenumerarEtapas := TfrmRenumerarEtapas.Create( nil );
  try
    frmRenumerarEtapas.dbspnNumero.Value    := cdsEtapasNUMERO.AsInteger + 1;
    frmRenumerarEtapas.dbspnNumero.MinValue := cdsEtapasNUMERO.AsInteger + 1;
    if frmRenumerarEtapas.ShowModal = mrOk then
    begin
      iNumEtapaSelecionada := cdsEtapasNUMERO.AsInteger;
      iNovoNumeroInicial   := trunc( frmRenumerarEtapas.dbspnNumero.Value );
      iDiferenca           := iNovoNumeroInicial - iNumEtapaSelecionada;

      cdsCondicoes.Filtered := False;

      cds_Etapas.Data    := cdsEtapas.Data;
      cds_Condicoes.Data := cdsCondicoes.Data;

      cds_Etapas.First;
      while not cds_Etapas.Eof do
      begin
        cds_Etapas.Edit;

        if cds_Etapas.FieldByName('NUMERO').AsInteger >= iNumEtapaSelecionada then
          cds_Etapas.FieldByName('NUMERO').AsInteger := cds_Etapas.FieldByName('NUMERO').AsInteger + iDiferenca;

        if cds_Etapas.FieldByName('NUMETAPADEST').AsInteger >= iNumEtapaSelecionada then
          cds_Etapas.FieldByName('NUMETAPADEST').AsInteger := cds_Etapas.FieldByName('NUMETAPADEST').AsInteger + iDiferenca;

        if cds_Etapas.FieldByName('NUMETAPARET').AsInteger >= iNumEtapaSelecionada then
          cds_Etapas.FieldByName('NUMETAPARET').AsInteger := cds_Etapas.FieldByName('NUMETAPARET').AsInteger + iDiferenca;

        if cds_Etapas.FieldByName('NUMETAPAELSE').AsInteger >= iNumEtapaSelecionada then
          cds_Etapas.FieldByName('NUMETAPAELSE').AsInteger := cds_Etapas.FieldByName('NUMETAPAELSE').AsInteger + iDiferenca;

        cds_Etapas.Post;

        cds_Etapas.Next;
      end;

      cds_Condicoes.First;
      while not cds_Condicoes.Eof do
      begin
        cds_Condicoes.Edit;

        if cds_Condicoes.FieldByName('NUMETAPADEST').AsInteger >= iNumEtapaSelecionada then
          cds_Condicoes.FieldByName('NUMETAPADEST').AsInteger := cds_Condicoes.FieldByName('NUMETAPADEST').AsInteger + iDiferenca;

        cds_Condicoes.Post;

        cds_Condicoes.Next;
      end;

      cdsEtapas.Data    := cds_Etapas.Data;
      cdsCondicoes.Data := cds_Condicoes.Data;

      cdsEtapas.Locate( 'NUMERO', iNovoNumeroInicial, [] );
    end;
  finally
    frmRenumerarEtapas.Free;
    cds_Etapas.Free;
    cds_Condicoes.Free;
  end;
end;

end.
