//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Pesquisa e seleção de Tipos de Contratos
//             Form - FrmConsTipoContrato  /  Unit - FConsTipoContrato
// Data     .: 18/08/1999
// Autor    .: Alexandre Ramos
//------------------------------------------------------------------
// Alteração .: Alexandre Ramos
// Data      .: 29/11/1999
// Descrição .: Caso Altere a Identificação do Lote altera nas Tabelas
//              que a Possuem (HISTCARTUNV/OPERACAOINVEST/HISTCUSTODIA)
//------------------------------------------------------------------
unit FConsTipoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls,
  TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdblook,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMProcuraMask,
  Menus, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList
 {$IFNDEF VER0505}, uCMTypes {$ENDIF};


type
  TFrmConsTipoContrato = class(TfrmCadastroCS)
    Label2: TLabel;
    DbDescContrato: TDBEdit;
    QryAux: TwwQuery;
    PageControl1: TPageControl;
    TbEtapas: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    BtInserir: TSpeedButton;
    DsEtapas: TwwDataSource;
    TvDetalhe: TTreeView;
    ImageList1: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    dbeNomeEtapa: TDBEdit;
    Label5: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DsAux: TwwDataSource;
    DsEtapaAnteced: TwwDataSource;
    Label13: TLabel;
    dblcTipoOper: TwwDBLookupCombo;
    qryTipoOperacao: TwwQuery;
    qryEtapas: TwwQuery;
    Label8: TLabel;
    Label9: TLabel;
    DBLkRegraData: TwwDBLookupCombo;
    DBLKRegraValor: TwwDBLookupCombo;
    bbtnRegraValor: TBitBtn;
    bbtnRegraData: TBitBtn;
    QryRegraValor: TwwQuery;
    qryRegraData: TwwQuery;
    QryEtapaAnteced: TwwQuery;
    BtAlterar: TSpeedButton;
    BtExcluir: TSpeedButton;
    MSBuscaTipoContrato: TMontaSelect;
    QryTipoContrato: TwwQuery;
    DsTipoContrato: TwwDataSource;
    TbDados: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    QryInvestimento: TwwQuery;
    LkcInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    QryBuscaCorretora: TwwQuery;
    DbLkcBuscaCorretor: TwwDBLookupCombo;
    Label11: TLabel;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryBuscaCorretoraIDCORRETVALORES: TFloatField;
    QryBuscaCorretoraSGLCORRETVALORES: TStringField;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    QryBolsaValoresMOECODIGO: TFloatField;
    DbLkcBolsa: TwwDBLookupCombo;
    Label6: TLabel;
    DbSerie: TDBEdit;
    DbIdLote: TDBEdit;
    Lable1: TLabel;
    Label7: TLabel;
    DbDtVencimento: TCMDateTimePicker;
    Label12: TLabel;
    DbPrecoVenc: TDBEdit;
    Label15: TLabel;
    QryTipoContratoIDTIPOCONTRINVEST: TFloatField;
    QryTipoContratoDESCTIPOCTINVEST: TStringField;
    Panel3: TPanel;
    BtExecutarOperacao: TBitBtn;
    BtFecharBoleta: TBitBtn;
    qryIDCONTRATOINVEST: TFloatField;
    qryIDTIPOCONTRINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryIDCORRETVALORES: TFloatField;
    qryIDBOLSAVALORES: TFloatField;
    qrySERIE: TStringField;
    qryIDLOTE: TStringField;
    qryDATACOMPRALOTE: TDateTimeField;
    qryDATAVENCIM: TDateTimeField;
    qryVLRCOMPRATITLOTE: TFloatField;
    qryPRECOVENCIM: TFloatField;
    qryQTDETITLOTE: TFloatField;
    qrySALDOTITLOTE: TFloatField;
    qryVLRRESGATE: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryDESCTIPOCONTRATO: TStringField;
    PnlSaldoContrato: TPanel;
    Label10: TLabel;
    qryIDCARTLASTRO: TFloatField;
    qryIDCARTAVISTA: TFloatField;
    DbLkcCartLastro: TwwDBLookupCombo;
    Label14: TLabel;
    QryBuscaCarteira: TwwQuery;
    QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField;
    QryBuscaCarteiraDESCCARTINVEST: TStringField;
    DbLkcCartaVista: TwwDBLookupCombo;
    Label16: TLabel;
    BtNovoDoc: TBitBtn;
    qryIDCONTRATOMESTRE: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure MontaArvore;
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtInserirClick(Sender: TObject);
    procedure TvDetalheChange(Sender: TObject; Node: TTreeNode);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure LkcDocumentosNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure bbtnRegraDataClick(Sender: TObject);
    procedure DBLkRegraDataChange(Sender: TObject);
    procedure DBLKRegraValorChange(Sender: TObject);
    procedure TvDetalheCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtExecutarOperacaoClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbVlrCompraKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure BtFecharBoletaClick(Sender: TObject);
    procedure DbSerieExit(Sender: TObject);
    procedure LkcInvestimentoChange(Sender: TObject);
    procedure DbIdLoteExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure BtNovoDocClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Procurar : boolean;
    lstIndice	:TStringList;
	 procedure FechaEAbre( Monta :Boolean );
    procedure PreencheVariaveisTransf;
    { Private declarations }
  public
    { Public declarations }
    TipoContrato, wIdLote :String;
    wOrdenado : boolean;
  end;

var
  FrmConsTipoContrato: TFrmConsTipoContrato;
  wIndex	:Integer;
  wNivel	:Integer;
  wOrdAnt:Integer;
// Variaveis de Transferencia de Informacoes entre Operacoes ...
  wIdCarteirainvest, wIdCorretValores, wIdOperacaoInvest,
  wIdAcao, wIdBolsaValores, WIdCustodiante, wIdCartLastro, wIdCartOriDest :Integer;
  wDocumento, wNumDocumento, wTipoCustodia :String;
  wQtdOperacao, wPrecoLote:Double;
  wDtOperacao:TDate;


implementation

uses DBaseDados, UDataBase, UMensErro, USistema, FCadOperAcao, UBibliotecaInvest,
     FFechaBoleta, UOperacaoInvest, UOperComum, dOperComum;

{$R *.DFM}

procedure TFrmConsTipoContrato.FormShow(Sender: TObject);
begin
 inherited;
// Mostra Tela de Cadastro
 Panel1.Visible   :=False;
 Label13.Visible  :=False;
 TvDetalhe.Visible:=True;
 PageControl1.ActivePage:=TbDados;
// Abre as Querys
 QryTipoContrato.Open;
 Qry.Open;
 QryTipoOperacao.Open;
 QryRegraData.Open;
 QryRegraValor.Open;
// Qrys Novas
 QryInvestimento.Open;
 QryBuscaCorretora.Open;
 QryBolsaValores.Open;
 QryBuscaCarteira.Open;

 If wOrdenado = True Then Begin
    Qry.Locate('IDLOTE',wIdLote,[]);
 End;
 FechaEAbre( True );

// Inabilita Botoes
 BbtnConfirmar.Enabled:=False;
 BbtnCancelar.Enabled :=False;
 SbtnAlterar.Enabled  :=True;
 SbtnApagar.Enabled   :=True;
// Inicia Variaveis de Transferencia entre Operacaoes
 wIdCarteiraInvest:=0;
 wIdCorretValores :=0;
 wDtOperacao      :=Date;
 wTipoCustodia    :='';

 PnlFundo.Enabled:=True;
// Inicia Valores
 wDocumento:='';  
End;

//------------------------------------------
// Monta a Arvore (TreeView)
Procedure TFrmConsTipoContrato.MontaArvore;
var
	Node	:TTreeNode;
Begin
// Limpa TreeView
 TVDetalhe.Items.Clear;
// Inclui Tabelas no TreeView
 TVDetalhe.Items.Add(Nil, QryTipoContrato.FieldByName('DESCTIPOCTINVEST').AsString);
 TVDetalhe.Items[0].ImageIndex   	:=1;       // Icones
 TVDetalhe.Items[0].SelectedIndex	:=1;

 try
   lstIndice.Clear;
   lstIndice.Add(	'0='+ QryTipoContrato.FieldByName('IDTIPOCONTRINVEST').AsString );
 except
   lstIndice	:= TStringList.Create;
   lstIndice.Add(	'0='+ QryTipoContrato.FieldByName('IDTIPOCONTRINVEST').AsString );
 end;

 While not( QryEtapaAnteced.Eof ) do begin
// Inclui Tabela no TreeView
		TvDetalhe.Items.AddChild(TvDetalhe.Items[
      	QryEtapaAnteced.FieldByName('INDICEPAI').AsInteger],
    		QryEtapaAnteced.FieldByName('DESCETAPA').AsString);
// inclui Ponteiro do Node no Vetor
		lstIndice.Add(	QryEtapaAnteced.FieldByName('INDICE').AsString	+'='+
        						QryEtapaAnteced.FieldByName('SEQCONTRATOINVEST').AsString );
// Inclui Icone e Expande Ramo
    	TVDetalhe.Items[QryEtapaAnteced.FieldByName('INDICE').AsInteger].ImageIndex   :=2;
    	TVDetalhe.Items[QryEtapaAnteced.FieldByName('INDICE').AsInteger].SelectedIndex:=2;
// Proximo Registro Etapa
    	QryEtapaAnteced.Next;
 End;
 TVDetalhe.FullExpand;
 TvDetalhe.TopItem:=TvDetalhe.Items[0];
End;

//-- Procedures do Padrão --\\

//----------------------------------------------
// Confirmar
procedure TFrmConsTipoContrato.CmeCadastroConfirma(Sender: TObject);
Begin
  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

//-------------------------------------------
// Retorno da Procura
procedure TFrmConsTipoContrato.CmeCadastroFind(Sender: TObject);
begin
 If (MontaSelect.ValoresChave.Count > 0) And
    (MontaSelect.ValoresChave[0] <> '') Then Begin
   Qry.Locate('IDCONTRATOINVEST',StrToInt(MontaSelect.ValoresChave[0]),[]);
   QryTipoContrato.Locate('IDTIPOCONTRINVEST',StrToInt(MontaSelect.ValoresChave[1]),[]);
   Procurar := True;
   FechaEAbre( True );
 End;
end;

//---------------------------------------------------------------
// Botão Inserir
procedure TFrmConsTipoContrato.sbtnInserirClick(Sender: TObject);
begin
  Procurar := False;
// Busca o Tipo de Contrato
  MSBuscaTipoContrato.Executar;
  If (MSBuscaTipoContrato.ValoresChave.Count > 0) and (MSBuscaTipoContrato.ValoresChave[0] <> '') then	begin
    QryTipoContrato.Locate('IDTIPOCONTRINVEST',StrToInt(MSBuscaTipoContrato.ValoresChave[0]),[]);
    FechaEAbre( True );
  End Else Begin
    sbtnInserir.Down:=False;
    Exit;
  end;
// Heranca  
  Inherited;

// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
  BtExecutarOperacao.Enabled:=False;
  PageControl1.ActivePage:=TbDados;
  Qry.FieldByName('DESCTIPOCONTRATO').AsString:=
    QryTipoContrato.FieldByName('DESCTIPOCTINVEST').AsString;
end;

// Fim Procedures do Padrao \\
//----------------------------------------------------------------------------\\

procedure TFrmConsTipoContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Fecha Querys
  Qry.Close;
  QryTipoContrato.Close;
  QryEtapas.Close;
  QryEtapaAnteced.Close;
  LstIndice.Free;
// Qrys Novas
  QryInvestimento.Close;
  QryBuscaCorretora.Close;
  QryBolsaValores.Close;
  QryBuscaCarteira.Close;

  inherited;
end;

//-------------------------------------------------------------
// Botao de Inclui Etapa ou Documento
procedure TFrmConsTipoContrato.BtInserirClick(Sender: TObject);
Var
  Indice:Integer;
begin
// Caso Node Vazio
	If (TvDetalhe.Selected = nil) Then Begin
   	ShowMessage('Item não Escolhido !!!!! ');
   	BtInserir.Down:=False;
   	Exit;
	End;
// Inabilita Botoes
	BtInserir.Enabled:=False;
	BtExcluir.Enabled:=False;
	BtAlterar.Enabled:=False;
// Sb1.Enabled      :=False;
// Mostra Tela de Cadastro
	TvDetalhe.Visible:=False;
	Panel1.Visible   :=True;
//	Label13.Visible  :=True;
// Caso 1 Nivel
  If (wNivel = 0) Then
    Label13.Caption  := 'Contrato .: '+TvDetalhe.Selected.Text
  Else
    Label13.Caption  := ''+TvDetalhe.Selected.Text;

// Buscar Etapa Escolhida
	 Indice	:= StrToInt(lstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)]);
	 QryEtapas.Locate('SEQCONTRATOINVEST',Indice,[] );

// Mostra Etapa
  Label1.Caption:= 'Dados da Etapa';
  Panel2.Visible:= True;
  Panel2.Left   := 2;
  Panel2.Top    := 32;
End;

procedure TFrmConsTipoContrato.TvDetalheChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
// Guarda Dados do Escolhido
  wNivel :=Node.Level;
  wIndex :=Node.AbsoluteIndex;
// Caso Nivel = 0 Desabilita Botoes
  If wNivel = 0 Then Begin
    BtExcluir.Enabled:=False;
    BtAlterar.Enabled:=False;
  End Else Begin
// Abilita Botoes
    BtInserir.Enabled:=True;
    BtExcluir.Enabled:=True;
    BtAlterar.Enabled:=True;
  End;
End;

//---------------------------------------------------------
// Botão Cancelar Detalhe
procedure TFrmConsTipoContrato.bbtnCancelarDetClick(Sender: TObject);
begin
// Mostra Treeview
  Panel1.Visible   :=False;
  Label13.Visible  :=False;
  TvDetalhe.Visible:=True;
// Abilita Botoes
  If wNivel = 0 Then Begin
    BtInserir.Enabled:=True;
   // Sb1.Enabled      :=True;
  End Else Begin
    BtInserir.Enabled:=True;
    BtExcluir.Enabled:=True;
    BtAlterar.Enabled:=True;
    //Sb1.Enabled      :=True;
  End;
// Sobe Botoes
  BtInserir.Down:=False;
  BtExcluir.Down:=False;
  BtAlterar.Down:=False;
// Esconde o Painel
  Panel2.Visible:=False;
  TvDetalhe.SetFocus;
  PnlFundo.Enabled:= True;
End;

//---------------------------------------------------------
// Botão Ok Detalhe
procedure TFrmConsTipoContrato.LkcDocumentosNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Documento não Encontrado !!!');
  Accept:=False;
end;

//---------------------------------------------------------------
procedure TFrmConsTipoContrato.bbtnRegraDataClick(Sender: TObject);
begin
	inherited;
	if Sender = bbtnRegraData then
   	   OperComum.ChamaRegra(qryRegraData.FieldByName('IdRegra').AsString,0)
	else
   	   OperComum.ChamaRegra(qryRegraValor.FieldByName('IdRegra').AsString,0);
end;

procedure TFrmConsTipoContrato.DBLkRegraDataChange(Sender: TObject);
begin
	inherited;
//   bbtnRegraData.Enabled	:= DBLkRegraData.Text <> '';
end;

procedure TFrmConsTipoContrato.DBLKRegraValorChange(Sender: TObject);
begin
	inherited;
//   bbtnRegraValor.Enabled	:= DBLkRegraValor.Text <> '';
end;

procedure TFrmConsTipoContrato.FechaEAbre( Monta :Boolean );
begin
 QryEtapas.Close;
	QryEtapas.ParamByName('IDTIPOCONTRINVEST').AsString	:= QryTipoContrato.FieldByName('IDTIPOCONTRINVEST').AsString;
 QryEtapas.Open;

 QryEtapaAnteced.Close;
	QryEtapaAnteced.ParamByName('IDTIPOCONTRINVEST').AsString	:= QryTipoContrato.FieldByName('IDTIPOCONTRINVEST').AsString;
	QryEtapaAnteced.Open;

 If Monta Then MontaArvore;
end;

//----------------------------------------------------------------
// Quando Implodindo - Não Permite
procedure TFrmConsTipoContrato.TvDetalheCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  AllowCollapse :=False;
end;

procedure TFrmConsTipoContrato.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
end;

procedure TFrmConsTipoContrato.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
//  Procurar := True;
end;

procedure TFrmConsTipoContrato.BtExecutarOperacaoClick(Sender: TObject);
Var
  Indice : Integer;
begin
 inherited;
// Caso Node Vazio
 If (TvDetalhe.Selected = nil) Then Begin
   ShowMessage('Item não Escolhido !!!!! ');
   BtInserir.Down:=False;
   Exit;
 End;
// Busca a Etapa ...
 Indice:=StrToInt(LstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)]);
 QryEtapas.Locate( 'SEQCONTRATOINVEST',Indice,[] );

// Cria o Formulario de Operacaoes com Acoes
 Application.CreateForm(TFrmCadOperAcao,FrmCadOperAcao);

// Altera para Normal configura o form
 FrmCadOperAcao.FormStyle:= fsNormal;
 FrmCadOperAcao.Visible  := False;
 FrmCadOperAcao.Top      := 80;
 FrmCadOperAcao.bbtnConfirmar.ModalResult:=MrNone;

// Preeche Variaveis do Formulario
 FrmCadOperAcao.wEmContrato      := True;
 FrmCadOperAcao.wIdTipoOperacao  := QryEtapas.FieldByName('IDTIPOOPERACAO').AsInteger;
// FrmCadOperAcao.wIdCarteiraInvest:= wIdCarteiraInvest;
 FrmCadOperAcao.wIdCorretValores := Qry.FieldByName('IDCORRETVALORES').AsInteger;
 FrmCadOperAcao.wIdAcao          := Qry.FieldByName('IDINVESTIMENTO').AsInteger;
 FrmCadOperAcao.wIdBolsavalores  := Qry.FieldByName('IDBOLSAVALORES').AsInteger;
 FrmCadOperAcao.wIdLote          := Qry.FieldByName('IDLOTE').AsString;
 FrmCadOperAcao.wNumDocumento    := wNumDocumento;
 FrmCadOperAcao.wQtdOperacao     := wQtdOperacao;
 FrmCadOperAcao.wPrecoLote       := wPrecoLote;
 FrmCadOperAcao.wDtOperacao      := wDtOperacao;
 FrmCadOperAcao.wIdCartBasica    := Qry.FieldByName('IDCARTLASTRO').AsInteger;
 FrmCadOperAcao.wIdCartOriDest   := Qry.FieldByName('IDCARTAVISTA').AsInteger;
 FrmCadOperAcao.wIdCustodiante   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

// Exibe o form para ações do usuário
 FrmCadOperAcao.ShowModal;

// Atualiza Variaveis de Trasferencia
 If FrmCadOperAcao.ModalResult = MrOk Then Begin
   wIdCarteiraInvest:= FrmCadOperAcao.wIdCarteiraInvest;
   wIdCorretValores := FrmCadOperAcao.wIdCorretValores;
   wIdAcao          := FrmCadOperAcao.wIdAcao;
   wIdBolsavalores  := FrmCadOperAcao.wIdBolsaValores;
   wIdCustodiante   := FrmCadOperAcao.wIdCustodiante;
   wNumDocumento    := FrmCadOperAcao.wNumDocumento;
   wQtdOperacao     := FrmCadOperAcao.wQtdOperacao;
   wPrecoLote       := FrmCadOperAcao.wPrecoLote;
   wDtOperacao      := FrmCadOperAcao.wDtOperacao;
   wTipoCustodia    := FrmCadOperAcao.wTipoCustodia;
   wIdCartLastro    := FrmCadOperAcao.wIdCartBasica;
   wIdCartOriDest   := FrmCadOperAcao.wIdCartOriDest;

   wIdOperacaoInvest:= wIdPrincipal;
   FrmCadOperAcao.wEmContrato:= False;
   wDocumento       := FrmCadOperAcao.wNumDocumento;

// Controla Dados do Contrato (Saldos e etc....)
   If (wTipoCustodia = 'B') Then Begin
     Try
       Qry.Edit;
// Aumenta Qtd de Titulos
       Qry.FieldByName('QTDETITLOTE').AsFloat:=
         Qry.FieldByName('QTDETITLOTE').AsFloat+wQtdOperacao;
// Aumenta Saldo dos Titulos
       Qry.FieldByName('SALDOTITLOTE').AsFloat:=
         Qry.FieldByName('SALDOTITLOTE').AsFloat+wQtdOperacao;
// Atualiza Dados
       Qry.Post;
       Qry.ApplyUpdates;
       Qry.CommitUpdates;
     Except
       Raise;
     End;
   End Else If (wTipoCustodia = 'D') Or (wTipoCustodia = 'X') Then Begin
     Try
       Qry.Edit;
// Aumenta Saldo dos Titulos
       Qry.FieldByName('SALDOTITLOTE').AsFloat:=
         Qry.FieldByName('SALDOTITLOTE').AsFloat-wQtdOperacao;
// Atualiza Dados
       Qry.Post;
       Qry.ApplyUpdates;
       Qry.CommitUpdates;
     Except
       Raise;
     End;
   End;
// Grava Dados na OPERXCONTRATO (Operacoes do Contrato)
   ExecutaQuery(QryAux,
     'INSERT INTO OPERXCONTRATO                                '+
     '(IDCONTRATOINVEST, IDTIPOCONTRINVEST, SEQCONTRATOINVEST, '+
     ' IDOPERACAOINVEST, IDREGRADATAOPERUS, IDREGRAVLROPERUS,  '+
     ' DATAOPERPREVISTA, VLROPERPREVISTO) VALUES (             '+
     Qry.FieldByName('IDCONTRATOINVEST').AsString          +', '+
     Qry.FieldByName('IDTIPOCONTRINVEST').AsString         +', '+
     LstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)]+', '+
     IntToStr(wIdOperacaoInvest)                       +', '''+
     QryEtapas.FieldByName('IDREGRADATAOPER').AsString +''', '''+
     QryEtapas.FieldByName('IDREGRAVALOROPER').AsString+''', '+
     'Null, '+'0'+')');
 End;
// Libera Formulario, antes do bloco Try para certeza de destruir o objeto
 FrmCadOperAcao.Free;

end;

procedure TFrmConsTipoContrato.bbtnSairClick(Sender: TObject);
begin
  inherited;

  wIdCarteiraInvest:= 0;
  wIdCorretValores := 0;
  wIdAcao          := 0;
  wIdBolsavalores  := 0;
  wIdCustodiante   := 0;
  wNumDocumento    := '';
  wQtdOperacao     := 0;
  wPrecoLote       := 0;
  wDtOperacao      := Date;
  wTipoCustodia    :='';

  If Procurar = True Then
     PreencheVariaveisTransf;
end;

procedure TFrmConsTipoContrato.bbtnConfirmarClick(Sender: TObject);
var
bConfirmaCadastro : boolean;
begin

// Caso inserindo busca dados da serie
  If (Ds.DataSet.State In [DsInsert, DsEdit]) And (DbIdLote.Text <> '') And
     ((Qry.RecordCount > 0) And (DbIdLote.Text <> Qry.FieldByName('IDLOTE').OldValue))
  Then Begin
// Caso Existam contratos com o mesmo IdLote Nao permite
    If FazQuery(QryAux,'SELECT IDLOTE FROM CONTRATOINVESTIM '+
                       'WHERE IDLOTE = '+QuotedStr(Trim(DbIdLote.Text)))
    Then Begin
// Mostra Mensagem e Cancela Lote
      Beep;
      MsgDlg('Lote '+QuotedStr(Trim(DbIdLote.Text))+' já Existente.','Mensagem do Sistema ',mtError,[MbOk],0);
      Qry.FieldByName('IDLOTE').AsString  := Qry.FieldByName('IDLOTE').OldValue;
      DbIdLote.SetFocus;
      Exit;
    End;
  End;
// Muda Cursor
  Screen.Cursor := crHourGlass;
// Caso Incluindo Preenche Dados
  If sbtnInserir.Down = True Then Begin
    Qry.FieldByName('IDCONTRATOINVEST').AsInteger :=
      LeUltRegistro(Nil,'CONTRATOINVESTIM');
    Qry.FieldByName('IDCONTRATOMESTRE').AsInteger :=
      Qry.FieldByName('IDCONTRATOINVEST').AsInteger;
    Qry.FieldByName('IDTIPOCONTRINVEST').AsInteger:=
      QryTipoContrato.FieldByName('IDTIPOCONTRINVEST').AsInteger;
    Qry.FieldByName('IDEMISSOR').AsInteger:=
      QryInvestimento.FieldByName('IDEMISSOR').AsInteger;
  End;

//  If (sbtnInserir.Down = True) or (sbtnProcurar.Down = True) Then
  If (sbtnInserir.Down = True) Then
  // Preenche Variáveis de transferência
     PreencheVariaveisTransf;

     // Caso o Valor tenha sido Alterado Altera nas Tabelas Abaixo
  If (Ds.DataSet.State In [DsEdit]) Then Begin
    If ((Qry.RecordCount > 0) And (Qry.FieldByName('IDLOTE').AsString <>
         Qry.FieldByName('IDLOTE').OldValue))
    Then Begin
      Try
//            DtmBaseDados.DbBaseDados.StartTransaction;
// Altera o Id do Lote na OPERACAOINVEST
        ExecutaQuery(QryAux,
                'UPDATE OPERACAOINVEST SET IDLOTE = '+QuotedStr(Trim(DbIdLote.Text))+'  '+
                'WHERE IDLOTE = '+QuotedStr(Qry.FieldByName('IDLOTE').OldValue));
// Altera o Id do Lote na HISTCARTINV
        ExecutaQuery(QryAux,
                'UPDATE HISTCARTINV SET IDLOTE = '+QuotedStr(Trim(DbIdLote.Text))+'  '+
                'WHERE IDLOTE = '+QuotedStr(Qry.FieldByName('IDLOTE').OldValue));
// Altera o Id do Lote na HISTCUSTODIA
        ExecutaQuery(QryAux,
                'UPDATE HISTCUSTODIA SET IDLOTE = '+QuotedStr(Trim(DbIdLote.Text))+'  '+
                'WHERE IDLOTE = '+QuotedStr(Qry.FieldByName('IDLOTE').OldValue));
      Except
        MsgDlg('Erro ao Atualiza Subitens do Lote '+QuotedStr(Trim(DbIdLote.Text)),
               'Mensagem do Sistema ',mtError,[MbOk],0);
//            DtmBaseDados.DbBaseDados.RollBack;
      End;
    End;
  End;

// Reprodução da Heranca
  bConfirmaCadastro := True;
//  CmeCadastro.BeforeConfirma(self,bConfirmaCadastro);
  If bConfirmaCadastro Then Begin
//   bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);
    CmeCadastro.Confirma(Self);
    if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio
    end else begin
      CmeCadastro.Operacao := opIdle;
    end;
//    if bInsert then sbtnInserir.Click else
    If sbtnInserir.Down Then PageControl1.ActivePage:=TbEtapas;
    CmeCadastro.AtualizaBotoes(Self);
  end;

// Habilita Botoes
  BtExecutarOperacao.Enabled:=True;
  Screen.Cursor := crDefault;
  PnlFundo.Enabled:=True;
end;

procedure TFrmConsTipoContrato.DbVlrCompraKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmConsTipoContrato.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  BtExecutarOperacao.Enabled:=True;
  PnlFundo.Enabled:=True;
end;

procedure TFrmConsTipoContrato.qryAfterScroll(DataSet: TDataSet);
Var
  wSaldoInutil, wSaldoQtdInvest:Double;
begin
  inherited;
  QryTipoContrato.Locate('IDTIPOCONTRINVEST',
    Qry.FieldByName('IDTIPOCONTRINVEST').AsInteger,[]);

// Preenche o Painel com o Saldo do Contrato
  OperComum.BuscaTodosSaldosInvestLote(Qry.FieldByName('IDCARTLASTRO').AsInteger,
                                      0{IDCARTEIRAGERENC},  
                                      Qry.FieldByName('IDINVESTIMENTO').AsInteger,
                                      99999999, -1,
                                      Qry.FieldByName('IDLOTE').AsString,
                                      DateToStr(Date), wSaldoQtdInvest, wSaldoInutil,
                                      wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                      wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                      wSaldoInutil, wSaldoInutil,
                                      wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                      wSaldoInutil, wSaldoInutil,wSaldoInutil);

  PnlSaldoContrato.Caption:= FormatFloat('###,###,###,##0.00',wSaldoQtdInvest)+' ';

end;

procedure TFrmConsTipoContrato.BtFecharBoletaClick(Sender: TObject);
begin
  inherited;
// Pega o Numero do Documento, Caso Documento esteja Preenchido Mostra Consulta
  If InputQuery('Mensagem do Sistema ', 'Entre com o Numero do Documento ',wDocumento) Then Begin
    FrmConsTipoContrato.Repaint;
// Pega Data da Operacao Deste Documento
    FazQuery(QryAux,'SELECT DATAOPERACAO FROM OPERACAOINVEST WHERE NUMDOCUMENTO = '''+
                    wDocumento+'''');
// Caso não exista o Documento sai fora
    If QryAux.IsEmpty Then Begin
      MsgDlg('Documento não encontrado', 'Mensagem do Sistema',MtError,[MbOk],0);
      Exit;
    End;
// Calcula as Despesas e Mostra o Formulario
//    CalcDespesasDoc(QryAux.FieldByName('DATAOPERACAO').AsDateTime,
//                    wDocumento, Qry.FieldByName('IDLOTE').AsString);
    Application.CreateForm(TFrmFechaBoleta,FrmFechaBoleta);
    FrmFechaBoleta.wDocumento:=wDocumento;
    FrmFechaBoleta.wIdLote   :=Qry.FieldByName('IDLOTE').AsString ;

    FrmFechaBoleta.ShowModal;
    FrmFechaBoleta.Free;
  End Else Begin
  End;
end;

procedure TFrmConsTipoContrato.DbSerieExit(Sender: TObject);
Var
  wPrecoVencimento: Double;
  wDataVencimento : TDate;
begin
  inherited;
  wPrecoVencimento :=0;wDataVencimento:=0;

// Caso inserindo busca dados da serie
  If (Ds.DataSet.State In [DsInsert, DsEdit]) And (DbSerie.Text <> '') And
     (LkcInvestimento.LookupValue <> '') And (Not Qry.IsEmpty) //And
//     ((Qry.RecordCount > 0) And (Qry.FieldByName('SERIE').OldValue <> Qry.FieldByName('SERIE').AsString))
    Then Begin

// Busca Contratos com a Mesma Série e Investimento
    If FazQuery(QryAux,'SELECT SERIE, DATAVENCIM, PRECOVENCIM FROM CONTRATOINVESTIM  '+
                       'WHERE SERIE          = '+QuotedStr(Trim(DbSerie.Text))+' AND '+
                       '      IDINVESTIMENTO = '+LkcInvestimento.LookupValue+'       '+
                       'ORDER BY DATAVENCIM DESC')
      Then Begin
// Guarda dados
      wPrecoVencimento:= QryAux.FieldByName('PRECOVENCIM').AsFloat;
      wDataVencimento := QryAux.FieldByName('DATAVENCIM').AsDateTime;

    End Else Begin

// Nao Encontrou, Busca Contratos com a Mesma Série
      If FazQuery(QryAux,'SELECT SERIE, DATAVENCIM, PRECOVENCIM FROM CONTRATOINVESTIM '+
                         'WHERE SERIE = '+QuotedStr(Trim(DbSerie.Text)))
        Then Begin
// Guarda dados
        wDataVencimento := QryAux.FieldByName('DATAVENCIM').AsDateTime;
      End;

    End;
// Atualiza Dados
    Qry.FieldByName('PRECOVENCIM').AsFloat  := wPrecoVencimento;

    If wDataVencimento <> 0 Then
      Qry.FieldByName('DATAVENCIM').AsDateTime:= wDataVencimento
    Else
      Qry.FieldByName('DATAVENCIM').AsString  := '';

  End;
end;

procedure TFrmConsTipoContrato.LkcInvestimentoChange(Sender: TObject);
begin
  inherited;
  DbSerieExit(Self);
end;

procedure TFrmConsTipoContrato.DbIdLoteExit(Sender: TObject);
begin
  inherited;
// Caso inserindo busca dados da serie
  If (Ds.DataSet.State In [DsInsert, DsEdit]) And (DbIdLote.Text <> '')
//  And ((Qry.RecordCount > 0) And
//      (Qry.FieldByName('IDLOTE').AsString <> Qry.FieldByName('IDLOTE').OldValue))
  Then Begin
// Caso Existam contratos com o mesmo IdLote Nao permite
    If FazQuery(QryAux,'SELECT IDLOTE FROM CONTRATOINVESTIM '+
                       'WHERE IDLOTE = '+QuotedStr(Trim(DbIdLote.Text))+
                       ' AND IDCONTRATOMESTRE = '+
                         QuotedStr(Qry.FieldByName('IDCONTRATOINVEST').AsString))
    Then Begin
// Mostra Mensagem e Cancela Lote
      Beep;
      MsgDlg('Lote '+QuotedStr(Trim(DbIdLote.Text))+' já Existente.','Mensagem do Sistema ',mtError,[MbOk],0);
      Qry.FieldByName('IDLOTE').AsString  := Qry.FieldByName('IDLOTE').OldValue;;
    End;
  End;

end;

procedure TFrmConsTipoContrato.PreencheVariaveisTransf;
Var
  Indice:Integer;
begin
{  If wOrdenado = True Then Begin
    With FrmCadOrdMovInv Do Begin
// Busca o Tipo de Operacao
      Indice:=StrToInt(LstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)]);
      QryEtapas.Locate( 'SEQCONTRATOINVEST',Indice,[] );
// Guarda Tipo de Operacao
      wTipOper:=QryEtapas.FieldByName('IDTIPOOPERACAO').AsString;

// Insere Registro na Ordem
      sbtnInserirClick(self);

// Executa o change da combo de corretora para pegar (ou não) o num doc
      cboCorretoraChange(self);

// Preenche os campos da tela em comum
      DbLkcTipoOperacao.LookupValue:= QryEtapas.FieldByName('IDTIPOOPERACAO').AsString;
      DbLkcTipoOperacao.RefreshDisplay;

      cboCorretora.LookupValue     := DbLkcBuscaCorretor.LookupValue;
      cboCorretora.Text            := DbLkcBuscaCorretor.Text;
      cboInvestimento.LookupValue  := LkcInvestimento.LookupValue;
      cboInvestimento.Text         := LkcInvestimento.Text;
      DblkcCarteira.LookupValue    := DbLkcCartLastro.LookupValue;
      DblkcCarteira.Text           := DbLkcCartLastro.Text;
      PnlIdLote.Caption            := DbIdLote.Text;


    End;
  End;
}
end;

procedure TFrmConsTipoContrato.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  Procurar := False;
end;

procedure TFrmConsTipoContrato.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  Procurar := False;
end;

procedure TFrmConsTipoContrato.BtNovoDocClick(Sender: TObject);
begin
  inherited;
  {
  If Qry.State In [DsInsert, DsEdit] Then
    Qry.FieldByName('IDLOTE').AsString:=
       'RV-'+Copy(DateToStr(Date),9,2)+'/'+FormatFloat('0000',
              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(Date),9,2)));

  }
// Cria Numeracao do Lote (Usa a do documento)
  If Qry.State In [DsInsert, DsEdit] Then
    Qry.FieldByName('IDLOTE').AsString:=
       Copy(DateToStr(Date),8,2)+'/'+FormatFloat('0000',
              LeUltRegistro(Nil,'CONTLOTERENVAR'+Copy(DateToStr(Date),8,2)));
    wNumDocumento:=Qry.FieldByName('IDLOTE').AsString;
end;

procedure TFrmConsTipoContrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

end.

// **--> By Alexandre Ramos, Serious Developer ..


