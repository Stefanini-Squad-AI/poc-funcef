//------------------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS - Fabio
// Objetivo .: Formulário de Pesquisa e seleção de Tipos de Contratos
//             Form - FrmConsTipoContrato  /  Unit - FConsTipoContrato
// Data     .: 18/08/1999
// Autor    .: Alexandre Ramos
//------------------------------------------------------------------------------
unit FConsTipoContRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls,
  TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdblook,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMProcuraMask,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList
  {$IFNDEF VER0505}, uCMTypes {$ENDIF};

type
  TFrmConsTipoContRenFix = class(TfrmCadastroCS)
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
    Label5: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DsAux: TwwDataSource;
    DsEtapaAnteced: TwwDataSource;
    Label13: TLabel;
    dblcTipoOper: TwwDBLookupCombo;
    QryTipoOperacao: TwwQuery;
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
    QryInvestimento: TwwQuery;
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
    DbSerie: TDBEdit;
    DbIdLote: TDBEdit;
    Lable1: TLabel;
    Label7: TLabel;
    DbDtVencimento: TCMDateTimePicker;
    Label6: TLabel;
    DbPrecoVenc: TDBEdit;
    Label15: TLabel;
    QryTipoContratoIDTIPOCONTRINVEST: TFloatField;
    QryTipoContratoDESCTIPOCTINVEST: TStringField;
    Panel3: TPanel;
    BtExecutarOperacao: TBitBtn;
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
    qryDESCTIPOCONTRATO: TStringField;
    TbDadosTitulo: TTabSheet;
    Label10: TLabel;
    DbLkcTipTit: TwwDBLookupCombo;
    Label14: TLabel;
    DbLkcEmissor: TwwDBLookupCombo;
    DbLkcMoeda: TwwDBLookupCombo;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    Label18: TLabel;
    DbEdit2: TDBEdit;
    DBDateEdit1: TCMDateTimePicker;
    Label19: TLabel;
    Label20: TLabel;
    DBDateEdit2: TCMDateTimePicker;
    DBDateEdit4: TCMDateTimePicker;
    Label22: TLabel;
    DbLkcIndexTit: TwwDBLookupCombo;
    Label23: TLabel;
    DBEdit3: TDBEdit;
    Label24: TLabel;
    DbLkcTipoJuros: TwwDBLookupCombo;
    Label25: TLabel;
    DBDateEdit3: TCMDateTimePicker;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit5: TDBEdit;
    DbLkcTipoPremio: TwwDBLookupCombo;
    Label28: TLabel;
    DBEdit4: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit6: TDBEdit;
    Inativo: TDBCheckBox;
    DBMemo1: TDBMemo;
    Bevel3: TBevel;
    Label21: TLabel;
    QryTipoJuros: TwwQuery;
    QryMoeda: TwwQuery;
    QryTipTit: TwwQuery;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    DsSubTipo: TwwDataSource;
    QrySubTipo: TwwQuery;
    QrySubTipoIDTITRENFIXA: TFloatField;
    QrySubTipoCODTIPRENFIXA: TStringField;
    QrySubTipoSERIETITRENFIX: TStringField;
    QrySubTipoIDALTTITRENFIX: TStringField;
    QrySubTipoDATAEMTITRENFIX: TDateTimeField;
    QrySubTipoDATAVENCTITRENFIX: TDateTimeField;
    QrySubTipoINDEXRENFIX: TFloatField;
    QrySubTipoDATAINIJURRENFIX: TDateTimeField;
    QrySubTipoDATABASEINDRENFIX: TDateTimeField;
    QrySubTipoJUROSRENFIX: TFloatField;
    QrySubTipoCODTIPTXJUROS: TFloatField;
    QrySubTipoPREMIORENFIX: TFloatField;
    QrySubTipoCODTIPTXPREMIO: TFloatField;
    QrySubTipoIDINDSWAPFIX: TFloatField;
    QrySubTipoVLRRESGATE: TFloatField;
    UpdSubTipo: TUpdateSQL;
    UpdTitulo: TUpdateSQL;
    QryTitulo: TwwQuery;
    DsTitlulo: TwwDataSource;
    LbCustodiante: TLabel;
    DbLkcCustodiante: TwwDBLookupCombo;
    QryCustodiante: TwwQuery;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QrySubTipoIDCUSTODIANTE: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    Bevel1: TBevel;
    Image1: TImage;
    Label3: TLabel;
    DBEdit7: TDBEdit;
    qryIDTIPOINVEST: TFloatField;
    qryPRZVENC: TFloatField;
    DbEdPrazo: TDBEdit;
    LbPrazo: TLabel;
    Label4: TLabel;
    DBEdit8: TDBEdit;
    LbPerInd: TLabel;
    DbEdPerInd: TDBEdit;
    QrySubTipoPERCINDEX: TFloatField;
    QrySubTipoJUROSDIA: TFloatField;
    BtProcOperacao: TToolbarButton97;
    MSProcOperacao: TMontaSelect;
    QryClass: TwwQuery;
    QryCLASSINVXINVEST: TwwQuery;
    QryClassCODTIPTITULO: TStringField;
    QryClassCODCLASSINVEST: TStringField;
    QryClassIDTIPOINVEST: TFloatField;
    QryClassDTENQUADRA: TDateTimeField;
    QryClassCODTABCLASSINV: TStringField;
    ChkSaque: TDBCheckBox;
    QrySubTipoCARENCIA: TFloatField;
    QrySubTipoPERIODICIDADE: TFloatField;
    QrySubTipoFLGSAQUEPARCIAL: TStringField;
    edtCarencia: TDBEdit;
    Label12: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    qryDATACARENCIA: TDateTimeField;
    qryANIVERSARIO: TFloatField;
    edtAniversario: TDBEdit;
    Label33: TLabel;
    DBDateEdit5: TCMDateTimePicker;
    Label34: TLabel;
    DbLkcCarteira: TwwDBLookupCombo;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit9: TDBEdit;
    qryQTDECOMPRATITLOTE: TFloatField;
    qryIDCARTAVISTA: TFloatField;
    qryIDCARTLASTRO: TFloatField;
    QryBuscaCarteira: TwwQuery;
    BtNovoDoc: TBitBtn;
    qryIDCONTRATOMESTRE: TFloatField;
    TbOutrosDados: TTabSheet;
    Bevel2: TBevel;
    QrySubTipoDIASCOTACOMPRA: TFloatField;
    QrySubTipoDIASCOTAVENDA: TFloatField;
    QrySubTipoSALDOVLRRESGATE: TFloatField;
    QrySubTipoNUMCASASDEC: TFloatField;
    QrySubTipoDATAINITR: TDateTimeField;
    QrySubTipoINDEXRENFIX2: TFloatField;
    QrySubTipoDATABASEINDRENFX2: TDateTimeField;
    QrySubTipoPERCINDEX2: TFloatField;
    QrySubTipoJUROSRENFIX2: TFloatField;
    QrySubTipoCODTIPTXJUROS2: TFloatField;
    QrySubTipoDATAINIJURRENFIX2: TDateTimeField;
    QrySubTipoPREMIODIA: TFloatField;
    QrySubTipoFLGINDICE2: TStringField;
    LblPzAnbid: TLabel;
    LblPzTJLP: TLabel;
    QrySubTipoDIASPRAZOANBID: TFloatField;
    QrySubTipoDIASPRAZOANBID2: TFloatField;
    DBDateEditDtIniTR: TCMDateTimePicker;
    LblDtIniTR: TLabel;
    DBEditPzAnbid: TDBEdit;
    DBEditPzTJLP: TDBEdit;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    DbLkcIndexTit2: TwwDBLookupCombo;
    Label41: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    DBDateEdit7: TCMDateTimePicker;
    Label42: TLabel;
    DBDateEdit6: TCMDateTimePicker;
    Label38: TLabel;
    Label39: TLabel;
    DbEdPerInd2: TDBEdit;
    Label40: TLabel;
    DBEdit11: TDBEdit;
    qryTpPeriodicidade: TwwQuery;
    qryTpPeriodicidadeNOME: TStringField;
    qryTpPeriodicidadeIDTPPERIODICIDADE: TFloatField;
    DbLkpPeriodicidade: TwwDBLookupCombo;
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
    procedure QryTituloAfterScroll(DataSet: TDataSet);
    Procedure AtualizaCampos;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DbDtVencimentoExit(Sender: TObject);
    procedure DbSerieExit(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure DbLkcTipTitChange(Sender: TObject);
    procedure QryTipTitAfterScroll(DataSet: TDataSet);
    procedure DbIdLoteKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DbEdPrazoExit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    Procedure MontaDescTitulo;
    procedure DbLkcEmissorChange(Sender: TObject);
    procedure DBDateEdit2Change(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DbLkcTipoJurosExit(Sender: TObject);
    procedure DbDescContratoExit(Sender: TObject);
    procedure BtProcOperacaoClick(Sender: TObject);
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure BtNovoDocClick(Sender: TObject);
    procedure DbLkcIndexTit2Exit(Sender: TObject);
    procedure DbLkcIndexTitExit(Sender: TObject);
  private
    lstIndice	:TStringList;
    function  VerificaEntrada : boolean;
    procedure FechaEAbre( Monta :Boolean );
    procedure IncluiClassInvXInvest;
    // Calcula Valor da Volta
    Function CalculaVlrVolta(IdInvestimento, Tipo, IndexRenFix, TamPerJuros: Integer;
                             Lote, EfetNomi, FlgPU, FlgInterpola, FlgProRata: String;
                             dDataAtu, DataBaseIndex, DataIniJur, DataVencTitulo:TDateTime;
                             VlrCompraTit, JurosDia, PercIndex: Double): Double;

    { Private declarations }
  public
    { Public declarations }
    TipoContrato:String;
    IdClasseTitRenFix:Integer;
  end;

var
  FrmConsTipoContRenFix: TFrmConsTipoContRenFix;
  wIndex	:Integer;
  wNivel	:Integer;
  wOrdAnt:Integer;
// Variaveis de Transferencia de Informacoes entre Operacoes ...
  wIdCarteirainvest,  wIdOperacaoInvest,
  wIdInvestimento, wIdBolsaValores :Integer;
  wDocumento, wNumDocumento, wTipoCustodia, wIdCorretValores  :String;
  wQtdOperacao, wPrecoLote, wVlrOperacao :Double;
  wDtOperacao:TDate;


implementation

uses DBaseDados,UDataBase,UMensErro, USistema, FCadOperRenFixa, UBibliotecaInvest,
     FFechaBoleta, FConsTipoContrato, UOperacaoInvest, UOperComum, dOperComum,
     UDiasUteisInv,UDiasUteis,Math;

{$R *.DFM}

procedure TFrmConsTipoContRenFix.FormShow(Sender: TObject);
begin
 inherited;
// ShowMessage(IntToStr(IdClasseTitRenFix));
// Mostra Tela de Cadastro
 Panel1.Visible   :=False;
 Label13.Visible  :=False;
 TvDetalhe.Visible:=True;
 PageControl1.ActivePage:=TbDadosTitulo;
// Abre as Querys
 QryTipoContrato.Open;
 QrySubTipo.Open;
 QryTitulo.Open;
// Qry.Open;
 QryTipoOperacao.Open;
 QryRegraData.Open;
 QryRegraValor.Open;
 QryMoeda.Open;
 QryTipoJuros.Open;
 QryBuscaCarteira.Open; 
// Abre Tipos de Titulo de Acordo com SuperClasse
 QryTipTit.ParamByName('IDCLASSETIT').AsInteger:=IdClasseTitRenFix;
 MontaSelect.Filtro.Add('( TIPOTITRENFIXA.IDCLASSETIT = '''+IntToStr(IdClasseTitRenFix)+''')');

 QryTipTit.Open;
 QryEmissor.Open;
 qryTpPeriodicidade.Open;
 QryCustodiante.Open;
// Qrys Novas
 QryInvestimento.Open;
 QryBuscaCorretora.Open;
 QryBolsaValores.Open;

 FechaEAbre( True );

// Inabilita Botoes
 BbtnConfirmar.Enabled:=False;
 BbtnCancelar.Enabled :=False;
// SbtnAlterar.Enabled  :=True;
// SbtnApagar.Enabled   :=True;
// Inicia Variaveis de Transferencia entre Operacaoes
 wIdCarteiraInvest:=0;
// wIdCorretValores :=0;
 wIdCorretValores := '';
 wDtOperacao      :=Date;
 wTipoCustodia    :='';

 PnlFundo.Enabled:=True;
// Inicia Valores
 wDocumento:='';
End;

//------------------------------------------
// Monta a Arvore (TreeView)
Procedure TFrmConsTipoContRenFix.MontaArvore;
var
	Node	:TTreeNode;
Begin
// Limpa TreeView
 TVDetalhe.Items.Clear;
// Caso Não tenha Contratos Cancela a Montagem da Arvore
 If Qry.IsEmpty Then Begin
   Exit;
 End;

// Inclui Tabelas no TreeView
 TVDetalhe.Items.Add(Nil, QryTipoContrato.FieldByName('DESCTIPOCTINVEST').AsString);
 TVDetalhe.Items[0].ImageIndex   	:=1;       // Icones
 TVDetalhe.Items[0].SelectedIndex	:=1;

 try
   lstIndice	:= TStringList.Create;
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
procedure TFrmConsTipoContRenFix.CmeCadastroConfirma(Sender: TObject);
Begin
  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

//-------------------------------------------
// Retorno da Procura
procedure TFrmConsTipoContRenFix.CmeCadastroFind(Sender: TObject);
begin
   If Not Qry.Active Then Qry.Open;
   If (MontaSelect.ValoresChave.Count > 0) And
      (MontaSelect.ValoresChave[0] <> '') Then Begin
      Qry.Locate('IDCONTRATOINVEST',StrToInt(MontaSelect.ValoresChave[0]),[]);
      QryTipoContrato.Locate('IDTIPOCONTRINVEST',StrToInt(MontaSelect.ValoresChave[1]),[]);
      FechaEAbre( True );
   End;
   if (DbLkcIndexTit.Text = 'TR') or (DbLkcIndexTit2.Text = 'TR') then
   begin
      DBDateEditDtIniTR.Visible := True;
      LblDtIniTR.Visible := True;
   end
   else if (DbLkcIndexTit.Text = 'ANBID') or (DbLkcIndexTit2.Text = 'ANBID') then
   begin
      DBEditPzAnbid.Visible := True;
      LblPzAnbid.Visible := True;
   end
   else if (DbLkcIndexTit.Text = 'TJLP') or (DbLkcIndexTit2.Text = 'TJLP') then
   begin
      DBEditPzTJLP.Visible := True;
      LblPzTJLP.Visible := True;
   end;
end;

//---------------------------------------------------------------
// Botão Inserir
procedure TFrmConsTipoContRenFix.sbtnInserirClick(Sender: TObject);
begin
// Abre a Tabela Principal caso não esteja
  If Not Qry.Active Then Qry.Open;
// Busca o Tipo de Contrato
  MSBuscaTipoContrato.Executar;
  If (MSBuscaTipoContrato.ValoresChave.Count > 0) and (MSBuscaTipoContrato.ValoresChave[0] <> '') then	begin
    QryTipoContrato.Locate('IDTIPOCONTRINVEST',StrToInt(MSBuscaTipoContrato.ValoresChave[0]),[]);
    FechaEAbre( True );
  End Else Begin
    sbtnInserir.Down:=False;
    Exit;
  end;
// Inicia a Transacao
  DtmBaseDados.dbBaseDados.StartTransaction;
// Heranca
  Inherited;
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
  BtExecutarOperacao.Enabled:=False;
  PageControl1.ActivePage:=TbDadosTitulo;
  Qry.FieldByName('DESCTIPOCONTRATO').AsString:=
    QryTipoContrato.FieldByName('DESCTIPOCTINVEST').AsString;

// Inclui as Chaves das Tabela (CONTRATO ,INVESTIMENTO, TITRENFIXA  )
  Qry.FieldByName('IDCONTRATOINVEST').AsInteger :=
    LeUltRegistro(Nil,'CONTRATOINVESTIM');
  Qry.Post;
  Qry.Edit;
// Titulo (INVESTIMENTO)
  QryTitulo.Append;
  QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger :=
    LeUltRegistro(Nil,'INVESTIMENTO');
  QryTitulo.Post;
  QryTitulo.Edit;
// Preenche com Moeda Preferencial e Flag Ativo "S"
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then Begin
    QryTitulo.FieldByName('IDMOEDACONTAB').AsInteger :=
      QryAux.FieldByName('MOECODIGO').AsInteger;
  End;
  QryTitulo.FieldByName('FLGATIVO').AsString :='S';
// SubTipo Renda Fixa (TITRENFIXA)
  QrySubTipo.Append;
  QrySubTipo.FieldByName('IDTITRENFIXA').AsInteger :=
    QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger;
  QrySubTipo.FieldByName('DATAEMTITRENFIX').AsDateTime:= Date;
  QrySubTipo.FieldByName('FLGSAQUEPARCIAL').AsString  :='N';
  QrySubTipo.FieldByName('FLGINDICE2').AsString       :='N';

  QrySubTipo.Post;
  QrySubTipo.Edit;

end;

// Fim Procedures do Padrao \\
//----------------------------------------------------------------------------\\

procedure TFrmConsTipoContRenFix.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
// Confirma Cancelamento
  If (Qry.State In [DsEdit, DsInsert]) Then Begin
    If (MsgDlg('Deseja realmente sair deste contrato ?',
      'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then Begin
      Action:=caNone;
      Exit;
    End;
  End;

// Fecha Querys
  Qry.Close;
  QryTipoContrato.Close;
  QryEtapas.Close;
  QryEtapaAnteced.Close;
  QryMoeda.Open;
  QryTipoJuros.Open;
  QryTipTit.Close;
  QryEmissor.Close;
  QryTitulo.Close;
  QrySubTipo.Close;
// Qrys Novas
  QryInvestimento.Close;
  QryBuscaCorretora.Close;
  QryBolsaValores.Close;
  QryCustodiante.Close;
  QryBuscaCarteira.Close;;

  LstIndice.Free;

  inherited;
end;

//-------------------------------------------------------------
// Botao de Inclui Etapa ou Documento
procedure TFrmConsTipoContRenFix.BtInserirClick(Sender: TObject);
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
//  Panel2.Left   := 2;
//  Panel2.Top    := 32;
End;

procedure TFrmConsTipoContRenFix.TvDetalheChange(Sender: TObject; Node: TTreeNode);
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

//------------------------------------------------------------------------------
// Botão Cancelar Detalhe
procedure TFrmConsTipoContRenFix.bbtnCancelarDetClick(Sender: TObject);
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
procedure TFrmConsTipoContRenFix.LkcDocumentosNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Documento não Encontrado !!!');
  Accept:=False;
end;

//---------------------------------------------------------------
procedure TFrmConsTipoContRenFix.bbtnRegraDataClick(Sender: TObject);
begin
	inherited;
	if Sender = bbtnRegraData then
   	   OperComum.ChamaRegra(qryRegraData.FieldByName('IdRegra').AsString,0)
	else
   	   OperComum.ChamaRegra(qryRegraValor.FieldByName('IdRegra').AsString,0);
end;

procedure TFrmConsTipoContRenFix.DBLkRegraDataChange(Sender: TObject);
begin
	inherited;
//   bbtnRegraData.Enabled	:= DBLkRegraData.Text <> '';
end;

procedure TFrmConsTipoContRenFix.DBLKRegraValorChange(Sender: TObject);
begin
	inherited;
//   bbtnRegraValor.Enabled	:= DBLkRegraValor.Text <> '';
end;

procedure TFrmConsTipoContRenFix.FechaEAbre( Monta :Boolean );
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
procedure TFrmConsTipoContRenFix.TvDetalheCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  AllowCollapse :=False;
end;

procedure TFrmConsTipoContRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TFrmConsTipoContRenFix.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TFrmConsTipoContRenFix.BtExecutarOperacaoClick(Sender: TObject);
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
 QryEtapas.Locate('SEQCONTRATOINVEST',Indice,[] );

// Cria o Formulario de Operacaoes com Acoes
 Application.CreateForm(TFrmCadOperRenFixa,FrmCadOperRenFixa);

// Preeche Variaveis do Formulario
 FrmCadOperRenFixa.wEmContrato      := True;
 FrmCadOperRenFixa.wIdTipoOperacao  := QryEtapas.FieldByName('IDTIPOOPERACAO').AsInteger;
 FrmCadOperRenFixa.wIdCarteiraInvest:= wIdCarteiraInvest;
 FrmCadOperRenFixa.wIdClasseTitRenFix := IdClasseTitRenFix;
// FrmCadOperRenFixa.wIdCorretValores := Qry.FieldByName('IDCORRETVALORES').AsInteger;
 FrmCadOperRenFixa.wIdCorretValores := Qry.FieldByName('IDCORRETVALORES').AsString;
 FrmCadOperRenFixa.wIdInvestimento  := Qry.FieldByName('IDINVESTIMENTO').AsInteger;
 FrmCadOperRenFixa.wIdBolsavalores  := Qry.FieldByName('IDBOLSAVALORES').AsInteger;
 FrmCadOperRenFixa.wIdLote          := Qry.FieldByName('IDLOTE').AsString;
 FrmCadOperRenFixa.wNumDocumento    := wNumDocumento;
 FrmCadOperRenFixa.wQtdOperacao     := wQtdOperacao;
 FrmCadOperRenFixa.wPrecoLote       := wPrecoLote;
 FrmCadOperRenFixa.wVlrOperacao     := wVlrOperacao;
 FrmCadOperRenFixa.wDtOperacao      := QrySubTipo.FieldByName('DATAEMTITRENFIX').AsDateTime;

// Altera para Normal e Mostra Formulario
 FrmCadOperRenFixa.FormStyle:= FsNormal;
 FrmCadOperRenFixa.Visible  := False;
 FrmCadOperRenFixa.Top      := 70;
 FrmCadOperRenFixa.bbtnConfirmar.ModalResult:=MrNone;
 FrmCadOperRenFixa.ShowModal;

// Atualiza Variaveis de Trasferencia
 If FrmCadOperRenFixa.ModalResult = MrOk Then Begin
   wIdCarteiraInvest:= FrmCadOperRenFixa.wIdCarteiraInvest;
   wIdCorretValores := FrmCadOperRenFixa.wIdCorretValores;
   wIdInvestimento  := FrmCadOperRenFixa.wIdInvestimento;
   wIdBolsavalores  := FrmCadOperRenFixa.wIdBolsaValores;
   wNumDocumento    := FrmCadOperRenFixa.wNumDocumento;
   wQtdOperacao     := FrmCadOperRenFixa.wQtdOperacao;
   wPrecoLote       := FrmCadOperRenFixa.wPrecoLote;
   wVlrOperacao     := FrmCadOperRenFixa.wVlrOperacao;
   wDtOperacao      := FrmCadOperRenFixa.wDtOperacao;
   wTipoCustodia    := FrmCadOperRenFixa.wTipoCustodia;
   wIdOperacaoInvest:= wIdPrincipal;
   FrmCadOperRenFixa.wEmContrato:= False;
   wDocumento       := FrmCadOperRenFixa.wNumDocumento;

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
// Grava Dados na OPERXCONTRATO (Operacoes do Contrato) // Caso Operacao Nova
   If FrmCadOperRenFixa.TipoOperacao = 'I' Then Begin
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

// Busca Quantidade de Operacoes deste Contrato
     If FazQuery(QryAux,'SELECT COUNT(*) AS QTDOPERCONTR FROM OPERXCONTRATO '+
                        'WHERE IDCONTRATOINVEST = '+QuotedStr(Qry.FieldByName('IDCONTRATOINVEST').AsString))
     Then Begin
// Caso seja igual a 1 (Primeira) Regrava Valor da Oeracao e o PU
       If (QryAux.FieldByName('QTDOPERCONTR').AsInteger = 1) And
          (FrmCadOperRenFixa.wNaturOper = 'A') Then Begin
         DecimalSeparator :='.';
         ExecutaQuery(QryAux,
           'UPDATE CONTRATOINVESTIM SET VLRCOMPRATITLOTE  = '+FloatToStr(wVlrOperacao)+', '+
           '                            QTDECOMPRATITLOTE = '+FloatToStr(wQtdOperacao)+
           'WHERE IDCONTRATOINVEST = '+QuotedStr(Qry.FieldByName('IDCONTRATOINVEST').AsString));
         DecimalSeparator :=',';
       End;
     End;
   End;
 End;
// Libera Formulario
 FrmCadOperRenFixa.Free;
end;

procedure TFrmConsTipoContRenFix.bbtnSairClick(Sender: TObject);
begin
// Caso exista uma transação em aberto, Cancela
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.RollBack;
    
  wIdCarteiraInvest:= 0;
  wIdCorretValores := '';
  wIdInvestimento  := 0;
  wIdBolsavalores  := 0;
  wNumDocumento    := '';
  wQtdOperacao     := 0;
  wPrecoLote       := 0;
  wVlrOperacao     := 0;
  wDtOperacao      := Date;
  wTipoCustodia    := '';
  inherited;
end;

procedure TFrmConsTipoContRenFix.bbtnConfirmarClick(Sender: TObject);
var
bConfirmaCadastro:boolean;
Begin

  If VerificaEntrada Then Begin

    If DbLkcTipTit.Text='' Then Begin
      MsgDlg('Tipo de Titulo deve ser informado ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      TbDadosTitulo.Visible:=True;
      DbLkcTipTit.SetFocus;
      Exit;
    End;

    Screen.Cursor := crHourGlass;
// Caso Incluindo Preenche Dados
    If sbtnInserir.Down = True Then Begin
      Qry.FieldByName('IDTIPOCONTRINVEST').AsInteger:=
        QryTipoContrato.FieldByName('IDTIPOCONTRINVEST').AsInteger;
      Qry.FieldByName('IDCONTRATOMESTRE').AsInteger :=
        Qry.FieldByName('IDCONTRATOINVEST').AsInteger;
      QryTitulo.FieldByName('IDTIPOINVEST').AsInteger:=1;
      Qry.FieldByName('IDINVESTIMENTO').AsInteger:=
        QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger;
      Qry.FieldByName('IDEMISSOR').AsInteger:=
        QryTitulo.FieldByName('IDEMISSOR').AsInteger;
    End;
// Dados Comuns
      Qry.FieldByName('DATAVENCIM').AsDateTime:=
        QrySubTipo.FieldByName('DATAVENCTITRENFIX').AsDateTime;

// Titulo (INVESTIMENTO)
    Try

// Confirma Titulo
      QryTitulo.Post;
      QryTitulo.ApplyUpdates;
      QryTitulo.CommitUpdates;

// Confirma SubTitulo de Renda Fixa
      QrySubTipo.Post;
      QrySubTipo.ApplyUpdates;
      QrySubTipo.CommitUpdates;

// Confirma Contrato
      Qry.Post;
      Qry.ApplyUpdates;
      Qry.CommitUpdates;

// Inclui registro na ClassInvXInvest (Caso Incluindo)
     If sbtnInserir.Down Then Begin
       IncluiClassInvXInvest;
// Inclui a Operacao (Caso Incluindo)
//       QryEtapas.First;
//       ExecutaOperRenFix(QryEtapas.FieldByName('IDTIPOOPERACAO').AsInteger,
//                         QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger,
//                         -1,
//                         Qry.FieldByName('IDCARTLASTRO').AsInteger,
//                         Qry.FieldByName('IDCARTLASTRO').AsInteger,
//                         Qry.FieldByName('IDLOTE').AsString,
//                         Qry.FieldByName('QTDECOMPRATITLOTE').AsFloat,
//                         QrySubTipo.FieldByName('VLRRESGATE').AsFloat,
//                         QrySubTipo.FieldByName('DATAEMTITRENFIX').AsDateTime);
     End;

// Confirma a Transacao
      DtmBaseDados.dbBaseDados.Commit;
    Except
// Cancela a Transacao
      DtmBaseDados.dbBaseDados.RollBack;
      CmeCadastro.AtualizaBotoes(Self);
      Raise;
      PnlFundo.Enabled:=True;
      Exit;
    End;
// Reprodução da Heranca
    bConfirmaCadastro := True;

    //CmeCadastro.BeforeConfirma(self,bConfirmaCadastro);
    If bConfirmaCadastro Then
    Begin
       CmeCadastro.Confirma(Self);
       if Qry.IsEmpty then
          CmeCadastro.Operacao := opVazio
       else
          CmeCadastro.Operacao := opIdle;
       If sbtnInserir.Down Then
          PageControl1.ActivePage:=TbEtapas;
       CmeCadastro.AtualizaBotoes(Self);
    End;
// Habilita Botoes
    BtExecutarOperacao.Enabled:=True;
    Screen.Cursor    := crDefault;
    PnlFundo.Enabled :=True;
// Monta a Arvore
    FechaEAbre(True);
  End;
end;

procedure TFrmConsTipoContRenFix.DbVlrCompraKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmConsTipoContRenFix.bbtnCancelarClick(Sender: TObject);
begin
// Cancela Titulo
    QryTitulo.Cancel;
    QryTitulo.CancelUpdates;
// Cancela  SubTitulo de Renda Fixa
    QrySubTipo.Cancel;
    QrySubTipo.CancelUpdates;
// Cancela  Contrato
    Qry.Cancel;
    Qry.CancelUpdates;
// Heranca
  inherited;
// Cancela a Transacao
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.RollBack;

  BtExecutarOperacao.Enabled:=True;
  PnlFundo.Enabled:=True;
end;

procedure TFrmConsTipoContRenFix.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Localiza o Tipo de Contrato
  If Not Qry.IsEmpty Then Begin
    QryTipoContrato.Locate('IDTIPOCONTRINVEST',
      Qry.FieldByName('IDTIPOCONTRINVEST').AsInteger,[]);
// Localiza o Titulo do Contrato
    QryTitulo.Locate('IDINVESTIMENTO',
      Qry.FieldByName('IDINVESTIMENTO').AsInteger,[]);

// MUDA APARENCIA DA TELA DE ACORDO COM A SUPPER CLASSE
// CDB/RDB
    If IdClasseTitRenFix = 1 Then Begin
       Lable1.Visible  :=True;
       DbSerie.Visible :=True;
       DbLkcCustodiante.Visible :=True;
       LbCustodiante.Visible    :=True;

// FUNDOS
    End Else If IdClasseTitRenFix = 2 Then Begin
       Lable1.Visible  :=False;
       DbSerie.Visible :=False;
       DbLkcCustodiante.Visible :=False;
       LbCustodiante.Visible    :=False;

    End;
  End;

end;

procedure TFrmConsTipoContRenFix.BtFecharBoletaClick(Sender: TObject);
begin
  inherited;
// Pega o Numero do Documento, Caso Documento esteja Preenchido Mostra Consulta
  If InputQuery('Mensagem do Sistema ', 'Entre com o Numero do Documento ',wDocumento) Then Begin
    FrmConsTipoContRenFix.Repaint;
// Pega Data da Operacao Deste Documento
    FazQuery(QryAux,'SELECT DATAOPERACAO FROM OPERACAOINVEST WHERE NUMDOCUMENTO = '''+
                    wDocumento+'''');
// Caso não exista o Documento sai fora
    If QryAux.IsEmpty Then Begin
      MsgDlg('Documento não encontrado', 'Mensagem do Sistema',MtError,[MbOk],0);
      Exit;
    End;
// Calcula as Despesas e Mostra o Formulario
    CalcDespesasDoc(QryAux.FieldByName('DATAOPERACAO').AsDateTime,
                    wDocumento, Qry.FieldByName('IDLOTE').AsString);
    Application.CreateForm(TFrmFechaBoleta,FrmFechaBoleta);
    FrmFechaBoleta.wDocumento:=wDocumento;
    FrmFechaBoleta.ShowModal;
    FrmFechaBoleta.Free;
  End Else Begin
  End;
end;

procedure TFrmConsTipoContRenFix.QryTituloAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Abre Query com o SubTipo
  If Not Qry.IsEmpty Then Begin

    FazQuery(QrySubTipo,
              'SELECT	IDTITRENFIXA, CODTIPRENFIXA, SERIETITRENFIX, IDALTTITRENFIX,     '+
              'DATAEMTITRENFIX, DATAVENCTITRENFIX, INDEXRENFIX, DATAINIJURRENFIX,       '+
              'DATABASEINDRENFIX, JUROSRENFIX, CODTIPTXJUROS, PREMIORENFIX, VLRRESGATE, '+
              'CODTIPTXPREMIO, IDINDSWAPFIX, IDCUSTODIANTE, PERCINDEX, JUROSDIA,        '+
              'CARENCIA, PERIODICIDADE, FLGSAQUEPARCIAL, SALDOVLRRESGATE, NUMCASASDEC,  '+
              'DATAINITR, INDEXRENFIX2, DATABASEINDRENFX2, PERCINDEX2, JUROSRENFIX2,    '+
              'CODTIPTXJUROS2, DATAINIJURRENFIX2, FLGINDICE2, DIASCOTACOMPRA,           '+
              'DIASCOTAVENDA, PREMIODIA,DIASPRAZOANBID,DIASPRAZOANBID2 '+
              'FROM TITRENFIXA     '+
              'WHERE IDTITRENFIXA = '''+
              QryTitulo.FieldByName('IDINVESTIMENTO').AsString+'''');
    AtualizaCampos;
  End;
end;

Procedure TFrmConsTipoContRenFix.AtualizaCampos;
Begin
// Funcionalidade de Sumir os Campos de
// Acordo com o tipo de Titulo
  If Not Qry.IsEmpty Then Begin
// Numero de Serie
    If (QryTipTit.FieldByName('FLGSERTITFIX').AsString = 'I') Then Begin
      Label18.Visible :=False;
      DbEdit2.Visible :=False;
    End Else Begin
      Label18.Visible :=True;
      DbEdit2.Visible :=True;
    End;

// Data de Emissao
    If (QryTipTit.FieldByName('FLGDTEMITITFIX').AsString = 'I') Then Begin
      Label19.Visible :=False;
      DBDateEdit1.Visible:=False;
    End Else Begin
      Label19.Visible :=True;
      DBDateEdit1.Visible:=True;
    End;
// Data de Vencimento
    If (QryTipTit.FieldByName('FLGDTVENCTITFIX').AsString = 'I') Then Begin
      Label20.Visible :=False;
      DBDateEdit2.Visible:=False;
    End Else Begin
      Label20.Visible :=True;
      DBDateEdit2.Visible:=True;
    End;
// Numero Alternativo
    If (QryTipTit.FieldByName('FLGIDALTTITFIX').AsString = 'I') Then Begin
      Label29.Visible :=False;
      DbEdit4.Visible:=False;
    End Else Begin
      Label29.Visible :=True;
      DbEdit4.Visible:=True;
    End;
// Data inicio do Juros
    If (QryTipTit.FieldByName('FLGDTINIJURFIX').AsString = 'I') Then Begin
      Label26.Visible :=False;
      DBDateEdit3.Visible:=False;
    End Else Begin
      Label26.Visible :=True;
      DBDateEdit3.Visible:=True;
    End;
// Data Base do Juros
    If (QryTipTit.FieldByName('FLGDTBASEINDFIX').AsString = 'I') Then Begin
      Label22.Visible :=False;
      DBDateEdit4.Visible:=False;
    End Else Begin
      Label22.Visible :=True;
      DBDateEdit4.Visible:=True;
    End;
// Juros
    If (QryTipTit.FieldByName('FLGJURFIX').AsString = 'I')  Then Begin
      Label24.Visible :=False;
      DbEdit3.Visible:=False;
    End Else Begin
      Label24.Visible :=True;
      DbEdit3.Visible:=True;
    End;
// Indexador do Titulo
    If (QryTipTit.FieldByName('FLGINDREAJFIX').AsString = 'I') Then Begin
      Label23.Visible :=False;
      DbLkcIndexTit.Visible:=False;
      //DBEdit6.Enabled := False;
    End Else Begin
      Label23.Visible :=True;
      DbLkcIndexTit.Visible:=True;
      DBEdit6.Enabled := True;
    End;

// Tipo de Taxa de Juros
    If (QryTipTit.FieldByName('FLGCODTPTXJUR').AsString = 'I') Then Begin
      Label25.Visible :=False;
      DbLkcTipoJuros.Visible:=False;
    End Else Begin
      Label25.Visible :=True;
      DbLkcTipoJuros.Visible:=True;
    End;

// Premio do Titulo
    If (QryTipTit.FieldByName('FLGPREMIOFIX').AsString = 'I')Then Begin
      Label27.Visible :=False;
      DbEdit5.Visible :=False;
    End Else Begin
      Label27.Visible :=True;
      DbEdit5.Visible :=True;
    End;
// Tipo de Premio do Titulo
    If (QryTipTit.FieldByName('FLGCODTPTXPRE').AsString = 'I') Then Begin
      Label28.Visible :=False;
      DbLkcTipoPremio.Visible:=False;
    End Else Begin
      Label28.Visible :=True;
      DbLkcTipoPremio.Visible:=True;
    End;
// Percentual do Indice
    If (QryTipTit.FieldByName('FLGPERCINDEX').AsString = 'I') Then Begin
      LbPerInd.Visible :=False;
       DbEdPerInd.Visible:=False;
    End Else Begin
      LbPerInd.Visible :=True;
      DbEdPerInd.Visible:=True;
    End;

// Carencia
    If (QryTipTit.FieldByName('FLGCARENCIA').AsString = 'I') Then Begin
       Label12.Visible     := False;
       edtCarencia.Visible := False;
    End Else Begin
      Label12.Visible     := True;
      edtCarencia.Visible := True;
    End;

// Periodicidade
    If (QryTipTit.FieldByName('FLGPERIODICIDADE').AsString = 'I') Then Begin
       Label32.Visible          := False;
       //edtPeriodicidade.Visible := False;
       DbLkpPeriodicidade.Visible := False;
    End Else Begin
      Label32.Visible          := True;
      //edtPeriodicidade.Visible := True;
      DbLkpPeriodicidade.Visible := True;
    End;

// Aniversario
    If (QryTipTit.FieldByName('FLGANIVERSARIO').AsString = 'I') Then Begin
       Label33.Visible        := False;
       edtAniversario.Visible := False;
    End Else Begin
      Label33.Visible        := True;
      edtAniversario.Visible := True;
    End;
{// Data Inicio TIR
    If (QryTipTit.FieldByName('FLGDTINITR').AsString = 'I') Then Begin
       Label43.Visible     := False;
       DBDateEdit8.Visible := False;
    End Else Begin
      Label43.Visible     := True;
      DBDateEdit8.Visible := True;
    End;}
  End;
End;

procedure TFrmConsTipoContRenFix.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Inicia a Transacao
  DtmBaseDados.dbBaseDados.StartTransaction;
// Altera estados das Querys para edicao
  QryTitulo.Edit;
  QrySubTipo.Edit;
end;

procedure TFrmConsTipoContRenFix.DbDtVencimentoExit(Sender: TObject);
begin
  inherited;
// Preenche a Data de Vencimento do Titulo
  If QrySubTipo.State In [DsInsert, DsEdit] Then
    QrySubTipo.FieldByName('DATAVENCTITRENFIX').AsDateTime:=
      StrToDate(DbDtVencimento.Text);
end;

procedure TFrmConsTipoContRenFix.DbSerieExit(Sender: TObject);
begin
  inherited;
// Preenche a Numero de Serie do Titulo
  If QrySubTipo.State In [DsInsert, DsEdit] Then
    QrySubTipo.FieldByName('SERIETITRENFIX').AsString:=DbSerie.Text;
end;

procedure TFrmConsTipoContRenFix.DBDateEdit1Exit(Sender: TObject);
begin
  inherited;
// Preenche a Data de Data Base,  Iniciodo Titulo e Data da Operacao
  If QrySubTipo.State In [DsInsert, DsEdit] Then Begin
    QrySubTipo.FieldByName('DATABASEINDRENFIX').AsDateTime:=
      StrToDate(DBDateEdit1.Text);
    QrySubTipo.FieldByName('DATAINIJURRENFIX').AsDateTime :=
      StrToDate(DBDateEdit1.Text);
  End;
  If SbtnInserir.Down Then
    wDtOperacao := StrToDate(DBDateEdit1.Text);
end;

procedure TFrmConsTipoContRenFix.DbLkcTipTitChange(Sender: TObject);
Var
  wSQL:String;
begin
  inherited;
// Preenche Tipo de Juros com o Default do Tipo de Titulo
  If QrySubTipo.State In [DsInsert, DsEdit] Then Begin
    DbLkcTipoJuros.Value:=QryTipTit.FieldByName('CODTIPTXJUROS').AsString;

    QrySubTipo.FieldByName('IDCUSTODIANTE').AsInteger :=
        QryTipTit.FieldByName('IDCUSTODIANTE').AsInteger;

// Monta Pesquisa do emissor de acordom com o Flag de  instituicao Financeira
// do tipo de Titulo
    wSQL:= ' SELECT IDEMISSOR, SIGLAEMISSOR FROM EMISSOR ';

    If QryTipTit.FieldByName('FLGINSTFIN').AsString = 'S' Then
      wSQL:= wSQL + ' WHERE FLGINSTFIN = ''S''';

      wSQL:= wSQL + '  ORDER BY SIGLAEMISSOR ';

    FazQuery(QryEmissor,wSQL);
  End;

  AtualizaCampos;
// Monta Descricao do Titulo
  MontaDescTitulo;
end;

procedure TFrmConsTipoContRenFix.QryTipTitAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmConsTipoContRenFix.DbIdLoteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmConsTipoContRenFix.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmConsTipoContRenFix.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmConsTipoContRenFix.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmConsTipoContRenFix.DbEdPrazoExit(Sender: TObject);
begin
  inherited;
  If (Trim(DbEdPrazo.Text) <> '') Then Begin
    // Preenche a Data de Data Base,  Iniciodo Titulo e Data da Operacao
    If QrySubTipo.State In [DsInsert, DsEdit] Then Begin
      QrySubTipo.FieldByName('DATAVENCTITRENFIX').AsDateTime:=
        StrToDate(DBDateEdit1.Text)+StrToInt(DbEdPrazo.Text);
      QrySubTipo.FieldByName('DATAINIJURRENFIX').AsDateTime :=
        StrToDate(DBDateEdit1.Text);
    End;
  End;
end;

procedure TFrmConsTipoContRenFix.DBEdit8Exit(Sender: TObject);
begin
  inherited;
// Preenche a Data de Data Base,  Iniciodo Titulo e Data da Operacao
  If (QrySubTipo.State In [DsInsert, DsEdit]) And
     ( (DbLkcIndexTit.Visible = False) Or (DbLkcIndexTit.Text = '') ) Then Begin
// Calcula Valor dos Resgate
    QrySubTipo.FieldByName('VLRRESGATE').AsFloat:=
       CalculaVlrVolta(
         QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger,
         2,
         QrySubTipo.FieldByName('INDEXRENFIX').AsInteger,
         QryTipoJuros.FieldByName('TAMPERJUROS').AsInteger,
         Qry.FieldByName('IDLOTE').AsString,
         QryTipoJuros.FieldByName('EFETNOMI').AsString,
         QryTipTit.FieldByName('FLGPU').AsString,
         QryTipTit.FieldByName('FLGINTERPOLA').AsString,
         QryTipTit.FieldByName('FLLGPRORATA').AsString,
         QrySubTipo.FieldByName('DATAVENCTITRENFIX').AsDateTime,
         QrySubTipo.FieldByName('DATABASEINDRENFIX').AsDateTime,
         QrySubTipo.FieldByName('DATAINIJURRENFIX').AsDateTime,
         QrySubTipo.FieldByName('DATAVENCTITRENFIX').AsDateTime,
         Qry.FieldByName('VLRCOMPRATITLOTE').AsFloat,
         QrySubTipo.FieldByName('JUROSDIA').AsFloat,
         QrySubTipo.FieldByName('PERCINDEX').AsFloat);

{
      OperacaoInvest.CalculaInvRenFixAtu(
        QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger,2,
        Qry.FieldByName('IDLOTE').AsString,
        QrySubTipo.FieldByName('DATAVENCTITRENFIX').AsDateTime);
}
  End;
  If SbtnInserir.Down Then
    Try
      wVlrOperacao:=StrtoFloat(DBEdit8.Text);
    Except
      wVlrOperacao:=0;
    End;
end;

Procedure TFrmConsTipoContRenFix.MontaDescTitulo;
Begin
  If QryTitulo.State In [DsInsert, DsEdit] Then
    QryTitulo.FieldByName('DESCINVESTIMENTO').AsString:=
      DbLkcTipTit.Text+'-'+DbLkcEmissor.Text+'-'+DBDateEdit2.Text;
End;

procedure TFrmConsTipoContRenFix.DbLkcEmissorChange(Sender: TObject);
begin
  inherited;
  MontaDescTitulo;
end;

procedure TFrmConsTipoContRenFix.DBDateEdit2Change(Sender: TObject);
begin
  inherited;
  MontaDescTitulo;
end;

procedure TFrmConsTipoContRenFix.sbtnApagarClick(Sender: TObject);
begin
// Verifica se Contrato tem filhos
//  If FazQuery(QryAux,
//    'SELECT IDHISTCARTINV  FROM HISTCARTINV '+
//    ' WHERE (IDINVESTIMENTO  = '+Qry.FieldByName('IDINVESTIMENTO').AsString+')') Then Begin
//       MsgDlg('Registro possui detalhes. Não pode ser excluído.',
//          'Exclusão', mtWarning, [mbOK],0);
//       sbtnApagar.Down := False;
//       Exit;
//  End;

  If (MsgDlg('Deseja realmente excluir este registro ?',
    'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then Begin
// Inicia Transação
    DtmBaseDados.dbBaseDados.StartTransaction;

// Deleta Filhotes \\
    Try

// (HISTCARTINV)
      If Not ExecutaQuery(QryAux,'DELETE FROM HISTCARTINV WHERE IDINVESTIMENTO = '''+
                          Qry.FieldByName('IDINVESTIMENTO').AsString+'''')Then
                          Abort;

// (HISTCLASSCART)
      If Not ExecutaQuery(QryAux,'DELETE FROM HISTCLASSCART WHERE IDINVESTIMENTO = '''+
                          QryTitulo.FieldByName('IDINVESTIMENTO').AsString+'''')Then
                          Abort;
// (CLASSINVXINVEST)
      If Not ExecutaQuery(QryAux,'DELETE FROM CLASSINVXINVEST WHERE IDINVESTIMENTO = '''+
                          QryTitulo.FieldByName('IDINVESTIMENTO').AsString+'''')Then
                          Abort;
// (TITRENFIXA)
      If Not ExecutaQuery(QryAux,'DELETE FROM TITRENFIXA WHERE IDTITRENFIXA = '''+
                          QryTitulo.FieldByName('IDINVESTIMENTO').AsString+'''')Then
                          Abort;
// (OPERXCONTRATO)
      If Not ExecutaQuery(QryAux,'DELETE FROM OPERXCONTRATO WHERE IDCONTRATOINVEST = '''+
                          Qry.FieldByName('IDCONTRATOINVEST').AsString+'''') Then
                          Abort;
// (CONTRATOINVESTIM)
      If Not ExecutaQuery(QryAux,'DELETE FROM CONTRATOINVESTIM WHERE IDCONTRATOINVEST = '''+
                          Qry.FieldByName('IDCONTRATOINVEST').AsString+'''') Then
                          Abort;
// (INVESTIMENTO)
      If Not ExecutaQuery(QryAux,'DELETE FROM INVESTIMENTO WHERE IDINVESTIMENTO = '''+
                          QryTitulo.FieldByName('IDINVESTIMENTO').AsString+'''') Then
                          Abort;
// Confirma Transação
      DtmBaseDados.dbBaseDados.Commit;
    Except
// Rollback na Transação
      On E:Exception Do Begin
        MsgDlg('Erro ao Excluir, com a mensagem:'+#13+#13+E.Message,
               'Mensagem do Sistema', MtError,[MbOk],0);
// Como ocorreu erro
        DtmBaseDados.dbBaseDados.Rollback;
      End;
    End;
// Acerta Pagina
  End;
// Heranca
//  inherited;
  SbtnApagar.Down := False;
end;

procedure TFrmConsTipoContRenFix.DBEdit7Change(Sender: TObject);
begin
  inherited;
  If SbtnInserir.Down Then wNumDocumento:=DBEdit7.Text;
end;

procedure TFrmConsTipoContRenFix.DBEdit7Exit(Sender: TObject);
begin
  inherited;
// Caso inserindo busca dados da serie
  If (Ds.DataSet.State In [DsInsert, DsEdit]) And (DbIdLote.Text <> '') And
     ((Qry.RecordCount > 0) And
      (Qry.FieldByName('IDLOTE').AsString <> Qry.FieldByName('IDLOTE').OldValue))
  Then Begin
// Caso Existam contratos com o mesmo IdLote Nao permite
//    If FazQuery(QryAux,'SELECT IDLOTE FROM CONTRATOINVESTIM '+
//                       'WHERE IDLOTE = '+QuotedStr(Trim(DbIdLote.Text)))
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

procedure TFrmConsTipoContRenFix.DbLkcTipoJurosExit(Sender: TObject);
begin
  inherited;
  If (Ds.DataSet.State In [DsInsert, DsEdit]) And
     (DBEdit3.Text <> '') And (DbLkcTipoJuros.LookUpValue <> '') Then Begin
     QrySubTipo.FieldByName('JUROSDIA').AsFloat:=
        OperComum.CalculaJurosDia(StrToFloat(DBEdit3.Text), StrToInt(DbLkcTipoJuros.LookUpValue));
  End;
end;

procedure TFrmConsTipoContRenFix.DbDescContratoExit(Sender: TObject);
begin
  inherited;
//  If (DbLkcTipTit.Enabled = True) And (DbLkcTipTit.Visible = True) Then
//    DbLkcTipTit.SetFocus;
end;

procedure TFrmConsTipoContRenFix.BtProcOperacaoClick(Sender: TObject);
begin
// Busca o Tipo de Contrato
  MSProcOperacao.Executar;
  If MSProcOperacao.RetornouValor then begin
// Cria o Formulario de Operacaoes com Acoes
    Application.CreateForm(TFrmCadOperRenFixa,FrmCadOperRenFixa);
// Altera para Normal e Mostra Formulario
    FrmCadOperRenFixa.FormStyle:= FsNormal;
    FrmCadOperRenFixa.Visible  := False;
    FrmCadOperRenFixa.Top      := 99;
    FrmCadOperRenFixa.bbtnConfirmar.ModalResult:=MrNone;
    FrmCadOperRenFixa.wIdOperacao := StrToInt(MSProcOperacao.ValoresChave[0]);
    FrmCadOperRenFixa.wEmPesquisa := True;
    FrmCadOperRenFixa.ShowModal;
    FrmCadOperRenFixa.wEmPesquisa := False;
    FrmCadOperRenFixa.Free;
  End Else Begin
  End;
  BtProcOperacao.Down:=False;
end;

Procedure TFrmConsTipoContRenFix.IncluiClassInvXInvest;
Begin
//  Ao incluir contrato de renda fixa:
//  - Buscar na tabela CLASSINVXTIPTIT os registros que tenha o
//    Tipo de Titulo = ao do investimento sendo cadastrado.

//  - Guardar a tabela e o código de classificação destes registros

//  - Incluir na tabela CLASSINCXINVEST estes dados mais o identificador
//    deste investimento e a data do sistema.

  QryClass.Close;
  QryClass.ParamByName('CODTIPTITULO').AsString :=
      QryTipTit.FieldByName('CODTIPRENFIXA').AsString;
  QryClass.Open;

  While Not (QryClass.EOF) Do Begin
    QryCLASSINVXINVEST.ParamByName('CODTABCLASSINV').AsString  :=
       QryClass.FieldByName('CODTABCLASSINV').AsString;
    QryCLASSINVXINVEST.ParamByName('CODCLASSINVEST').AsString  :=
       QryClass.FieldByName('CODCLASSINVEST').AsString;
    QryCLASSINVXINVEST.ParamByName('IDINVESTIMENTO').AsInteger :=
       QryTitulo.FieldByName('IDINVESTIMENTO').AsInteger;
    QryCLASSINVXINVEST.ParamByName('DTENQUADRA').AsDateTime :=
       QrySubTipo.FieldByName('DATAEMTITRENFIX').AsDateTime;
    Try
      QryCLASSINVXINVEST.ExecSql;
    Except
      ShowMessage('Erro no Insert da Tabela CLASSINVXINVEST. IdInvestimento = '+
                   QryTitulo.FieldByName('IDINVESTIMENTO').AsString+'');
    End;
    QryClass.Next;
  End;
End;

Function TFrmConsTipoContRenFix.VerificaEntrada : boolean;
Begin
   Result := True;
//
// Numero de Serie
    If (QryTipTit.FieldByName('FLGSERTITFIX').AsString = 'O' ) and
       (Trim(DbEdit2.Text) = '')   Then Begin
       MsgDlg('Numero de Serie deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdit2.SetFocus;
       Result := False;
       Exit;
    End;

// Data de Emissao
    If (QryTipTit.FieldByName('FLGDTEMITITFIX').AsString = 'O') and
       (Trim(DBDateEdit1.Text) = '')   Then Begin
       MsgDlg('Data de Emissao deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBDateEdit1.SetFocus;
       Result := False;
       Exit;
    End;
// Data de Vencimento
    If (QryTipTit.FieldByName('FLGDTVENCTITFIX').AsString = 'O') and
       (Trim(DBDateEdit2.Text) = '')   Then Begin
       MsgDlg('Data de Vencimento deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBDateEdit2.SetFocus;
       Result := False;
       Exit;
    End;
// Numero Alternativo
    If (QryTipTit.FieldByName('FLGIDALTTITFIX').AsString = 'O') and
       (Trim(DbEdit4.Text) = '')   Then Begin
       MsgDlg('Numero Alternativo deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdit4.SetFocus;
       Result := False;
       Exit;
    End;

// Data inicio do Juros
    If (QryTipTit.FieldByName('FLGDTINIJURFIX').AsString = 'O') and
       (Trim(DBDateEdit3.Text) = '')   Then Begin
       MsgDlg('Data inicio do Juros deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBDateEdit3.SetFocus;
       Result := False;
       Exit;
    End;
    
// Data Base do Juros
    If (QryTipTit.FieldByName('FLGDTBASEINDFIX').AsString = 'O') and
       (Trim(DBDateEdit4.Text) = '')   Then Begin
       MsgDlg('Data Base do Juros deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBDateEdit4.SetFocus;
       Result := False;
       Exit;
    End;

// Juros
    If (QryTipTit.FieldByName('FLGJURFIX').AsString = 'O') and
       (Trim(DbEdit3.Text) = '')   Then Begin
       MsgDlg('Juros deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdit3.SetFocus;
       Result := False;
       Exit;
    End;
    
// Indexador do Titulo
    If (QryTipTit.FieldByName('FLGINDREAJFIX').AsString = 'O') and
       (Trim(DbLkcIndexTit.Text) = '')   Then Begin
       MsgDlg('Indexador do Titulo deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbLkcIndexTit.SetFocus;
       Result := False;
       Exit;
    End;

// Tipo de Taxa de Juros
    If (QryTipTit.FieldByName('FLGCODTPTXJUR').AsString = 'O') and
       (Trim(DbLkcTipoJuros.Text) = '')   Then Begin
       MsgDlg('Tipo de Taxa de Juros deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbLkcTipoJuros.SetFocus;
       Result := False;
       Exit;
    End;
// Premio do Titulo
    If (QryTipTit.FieldByName('FLGPREMIOFIX').AsString = 'O') and
       (Trim(DbEdit5.Text) = '')   Then Begin
       MsgDlg('Premio do Titulo deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdit5.SetFocus;
       Result := False;
       Exit;
    End;

// Tipo de Premio do Titulo
    If (QryTipTit.FieldByName('FLGCODTPTXPRE').AsString = 'O') AND
       (Trim(DbLkcTipoPremio.Text) = '')   Then Begin
       MsgDlg('Tipo de Premio do Titulo deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbLkcTipoPremio.SetFocus;
       Result := False;
       Exit;
    End;

// Carencia
    If  (QryTipTit.FieldByName('FLGCARENCIA').AsString = 'O') AND
       (Trim(edtCarencia.Text) = '')   Then Begin
       MsgDlg('Carência deve ser informada ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       edtCarencia.SetFocus;
       Result := False;
       Exit;
    End;

// Periodicidade
    If (QryTipTit.FieldByName('FLGPERIODICIDADE').AsString = 'O')  And
       (Trim(DbLkpPeriodicidade.Text) = '') Then Begin
       MsgDlg('Periodicidade deve ser informada ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbLkpPeriodicidade.SetFocus;
       Result := False;
       Exit;
    End;

// Aniversario
    If (QryTipTit.FieldByName('FLGANIVERSARIO').AsString = 'O') And
       (Trim(edtAniversario.Text) = '') Then Begin
       MsgDlg('Aniversário deve ser informado ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       edtAniversario.SetFocus;
       Result := False;
       Exit;
    End;

// Percentual do Indice
    If (QryTipTit.FieldByName('FLGPERCINDEX').AsString = 'O') AND
       (Trim(DbEdPerInd.Text) = '')   Then Begin
       MsgDlg('Percentual do Índice deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdPerInd.SetFocus;
       Result := False;
       Exit;
    End;

// Percentual do Indice
    If (Trim(QrySubTipo.FieldByName('INDEXRENFIX').AsString) <> '') and
       (Trim(DbEdPerInd.Text) = '') then
    Begin
       MsgDlg('Percentual do Índice deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdPerInd.SetFocus;
       Result := False;
       Exit;
    End;

    If (Trim(QrySubTipo.FieldByName('INDEXRENFIX2').AsString) <> '') and
       (Trim(DbEdPerInd2.Text) = '') then
    Begin
       MsgDlg('Percentual do Índice 2 deve ser informado. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DbEdPerInd2.SetFocus;
       Result := False;
       Exit;
    End;

    if (DbLkcIndexTit.Text = 'TR') and (DBDateEditDtIniTR.Text = '') then
    begin
       MsgDlg('Data de início de TR deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBDateEditDtIniTR.SetFocus;
       Result := False;
       Exit;
    end
    else if (DbLkcIndexTit.Text = 'ANBID') and (DBEditPzAnbid.Text = '') then
    begin
       MsgDlg('Prazo da ANBID deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBEditPzAnbid.SetFocus;
       Result := False;
       Exit;
    end
    else if (DbLkcIndexTit.Text = 'TJLP') and (DBEditPzTJLP.Text = '') then
    begin
       MsgDlg('Prazo da TJLP deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBEditPzTJLP.SetFocus;
       Result := False;
       Exit;
    end
    else if (DbLkcIndexTit2.Text = 'ANBID') and (DBEditPzAnbid.Text = '') then
    begin
       MsgDlg('Prazo da ANBID deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBEditPzAnbid.SetFocus;
       Result := False;
       Exit;
    end
    else if (DbLkcIndexTit2.Text = 'TJLP') and (DBEditPzTJLP.Text = '') then
    begin
       MsgDlg('Prazo da TJLP deve ser informada. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
       DBEditPzTJLP.SetFocus;
       Result := False;
       Exit;
    end;
End;

procedure TFrmConsTipoContRenFix.DBDateEdit2Exit(Sender: TObject);
begin
  inherited;
  If (Trim(DbEdPrazo.Text) <> '') Then Begin
    // Preenche a Data de Data Base,  Inicio do Titulo e Data da Operacao
    If QrySubTipo.State In [DsInsert, DsEdit] Then Begin
      Qry.FieldByName('PRZVENC').AsString:=
        FloatToStr(StrToDate(DBDateEdit2.Text)-StrToDate(DBDateEdit1.Text));
    End;
  End;
end;

procedure TFrmConsTipoContRenFix.BtNovoDocClick(Sender: TObject);
begin
  inherited;
// Cria Numeracao do Lote (Usa a do documento)
  If Qry.State In [DsInsert, DsEdit] Then
    Qry.FieldByName('IDLOTE').AsString:=
      'RF-'+Copy(DBDateEdit1.Text,9,2)+'/'+FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENFIX'+Copy(DBDateEdit1.Text,9,2)));
    wNumDocumento:=Qry.FieldByName('IDLOTE').AsString;
end;

procedure TFrmConsTipoContRenFix.DbLkcIndexTit2Exit(Sender: TObject);
begin
   inherited;
      DBDateEditDtIniTR.Visible := False;
      LblDtIniTR.Visible := False;
      DBEditPzAnbid.Visible := False;
      LblPzAnbid.Visible := False;
      DBEditPzTJLP.Visible := False;
      LblPzTJLP.Visible := False;
   if DbLkcIndexTit2.Text = 'TR' then
   begin
      DBDateEditDtIniTR.Visible := True;
      LblDtIniTR.Visible := True;
   end
   else if DbLkcIndexTit2.Text = 'ANBID' then
   begin
      DBEditPzAnbid.Visible := True;
      LblPzAnbid.Visible := True;
   end
   else if DbLkcIndexTit2.Text = 'TJLP' then
   begin
      DBEditPzTJLP.Visible := True;
      LblPzTJLP.Visible := True;
   end;
end;

procedure TFrmConsTipoContRenFix.DbLkcIndexTitExit(Sender: TObject);
begin
  inherited;
      DBDateEditDtIniTR.Visible := False;
      LblDtIniTR.Visible := False;
      DBEditPzAnbid.Visible := False;
      LblPzAnbid.Visible := False;
      DBEditPzTJLP.Visible := False;
      LblPzTJLP.Visible := False;
   if DbLkcIndexTit.Text = 'TR' then
   begin
      DBDateEditDtIniTR.Visible := True;
      LblDtIniTR.Visible := True;
   end
   else if DbLkcIndexTit.Text = 'ANBID' then
   begin
      DBEditPzAnbid.Visible := True;
      LblPzAnbid.Visible := True;
   end
   else if DbLkcIndexTit.Text = 'TJLP' then
   begin
      DBEditPzTJLP.Visible := True;
      LblPzTJLP.Visible := True;
   end;
end;

// Função que Calcula Valor da Volta do Titulo
// Tipo = 1 (Atualiza para Data Informada), Tipo = 2 (Atualiza para Data de Vencimento)
// Se Tipo = 1 e não informou Data, assume data corrente.
Function TFrmConsTipoContRenFix.CalculaVlrVolta(IdInvestimento, Tipo, IndexRenFix,TamPerJuros: Integer;
                                           Lote, EfetNomi, FlgPU, FlgInterpola, FlgProRata: String;
                                           dDataAtu, DataBaseIndex, DataIniJur, DataVencTitulo:TDateTime;
                                           VlrCompraTit, JurosDia, PercIndex: Double): Double;
Var
   QryLocal  :TwwQuery;
   wCotacao1, wCotacao2, wParam1, wParam2 : Double;
   iIntervalo : integer;
Begin
    wCotacao1:=0;
    wCotacao2:=0;
    wParam1  :=0;
    wParam2  :=0;
    Result   :=0;
    // Cria Objetos Locais
    QryLocal := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';
    // Define data de Processo
    if Tipo = 1 then
       if DateToStr(dDataAtu) = '' then
          dDataAtu := Date
    else
       dDataAtu := DataVencTitulo;
    // Se a Atualização é feita por PU
    if FlgPU = '1' then
    begin
       // Busca Cotacao do Investimento
       WCotacao1 := OperComum.BuscaCotacaoInvest(IdInvestimento, dDataAtu, True);
       Result := WCotacao1;
    end
    else
    begin
       // Busca Nova Cotação por Indice/Juros
       Result := VlrCompraTit;
      if IndexRenFix <> 0 then begin
         // Efetua Correção pelo Indice
         wCotacao1 := OperComum.LeMoeda(IndexRenFix, DataBaseIndex,
                                             FlgProRata, FlgInterpola);
         wCotacao2 := OperComum.LeMoeda(IndexRenFix,
                                             dDataAtu,
                                             FlgProRata, FlgInterpola);
         If wCotacao1 <> 0 Then
            if PercIndex = 0 then
               Result := ((Result*wCotacao2)/wCotacao1)
            else
               Result := Result * (((wCotacao2/wCotacao1 - 1) * QryLocal.FieldByName('PERCINDEX').asFloat) + 1);
      end;
      If JurosDia <> 0 Then
      Begin
         // Efetua Correção pelos Juros
         iIntervalo   := DiasUteisInv.IntervaloDiasUteis( DataIniJur, dDataAtu, -1, 1, '',True, False, False);
         if TamPerJuros = 252 then // DU
            iIntervalo   := DiasUteisInv.IntervaloDiasUteis( DataIniJur, dDataAtu, -1, 1, '',True, False, False)
         else // DC
            iIntervalo := DiasUteis.IntervaloDias(DataIniJur, dDataAtu);

         If EfetNomi = 'E' Then
         begin
            Result := Result * Power((1 + JurosDia / 100), iIntervalo);
            Result := StrToFloat(FormatFloat('#0.00',Result));
         end
         Else
         begin
            Result := Result *(1 + JurosDia)*iIntervalo;
            Result := StrToFloat(FormatFloat('#0.00',Result));
         end;
      End;
    End;
    // Libera Objetos Locais
    QryLocal.Free;
End;


end.



