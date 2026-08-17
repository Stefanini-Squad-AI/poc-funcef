//---------------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Criação de Tipos de Contratos
//             e relacionamentos com Etapas e Tipos de Operacao
//             Form - FrmCadTipoContrato  /  Unit - FCadTipoContrato
// Data     .: 04/02/1999
// Autor    .: Alexandre Ramos
//---------------------------------------------------------------------------
unit FCadTitFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls,
  TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdblook,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, IvEMulti;

type
  TFrmCadTitFundo = class(TfrmCadastroCS)
    QryAux: TwwQuery;
    ImageList1: TImageList;
    DsAux: TwwDataSource;
    QryTipoInvest: TwwQuery;
    QryTipoOper: TwwQuery;
    UpdSubTipo: TUpdateSQL;
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
    QrySubTipoIDCUSTODIANTE: TFloatField;
    QrySubTipoPERCINDEX: TFloatField;
    QrySubTipoJUROSDIA: TFloatField;
    QrySubTipoCARENCIA: TFloatField;
    QrySubTipoPERIODICIDADE: TFloatField;
    QrySubTipoFLGSAQUEPARCIAL: TStringField;
    DsSubTipo: TwwDataSource;
    QryTipTit: TwwQuery;
    QryTipTitCODTIPRENFIXA: TStringField;
    QryTipTitDESCTIPRENFIXA: TStringField;
    QryTipTitFLGSERTITFIX: TStringField;
    QryTipTitFLGINDSWAPFIX: TStringField;
    QryTipTitFLGVLRAGIOOPER: TStringField;
    QryTipTitFLGIDLOTEFIX: TStringField;
    QryTipTitFLGDTCOMPRALOTE: TStringField;
    QryTipTitFLGQTDTITLOTE: TStringField;
    QryTipTitFLGSLDTITLOTE: TStringField;
    QryTipTitFLGVLRCOMPLOTE: TStringField;
    QryTipTitFLGIDALTTITFIX: TStringField;
    QryTipTitFLGDTEMITITFIX: TStringField;
    QryTipTitFLGDTVENCTITFIX: TStringField;
    QryTipTitFLGINDREAJFIX: TStringField;
    QryTipTitFLGDTINIJURFIX: TStringField;
    QryTipTitFLGDTBASEINDFIX: TStringField;
    QryTipTitFLGJURFIX: TStringField;
    QryTipTitFLGCODTPTXJUR: TStringField;
    QryTipTitFLGPREMIOFIX: TStringField;
    QryTipTitFLGCODTPTXPRE: TStringField;
    QryTipTitIDMOEDAREG: TFloatField;
    QryTipTitCODTIPTXJUROS: TFloatField;
    QryTipTitIDCLASSETIT: TFloatField;
    QryTipTitIDCUSTODIANTE: TFloatField;
    QryTipTitFLGPERCINDEX: TStringField;
    QryTipTitFLGINSTFIN: TStringField;
    QryTipTitFLGPU: TFloatField;
    QryTipTitFLLGPRORATA: TStringField;
    QryTipTitFLGINTERPOLA: TStringField;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    MontaSelect1: TMontaSelect;
    DsContrato: TwwDataSource;
    QryContrato: TwwQuery;
    UpdContrato: TUpdateSQL;
    QryTipoContrato: TwwQuery;
    QryTipoContratoIDTIPOCONTRINVEST: TFloatField;
    QryTipoContratoDESCTIPOCTINVEST: TStringField;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryIDMOEDACONTAB: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryFLGATIVO: TStringField;
    qryOBSINVESTIMENTO: TStringField;
    BtProcOperacao: TToolbarButton97;
    MSProcOperacao: TMontaSelect;
    QryContratoIDCONTRATOINVEST: TFloatField;
    QryContratoIDEMISSOR: TFloatField;
    QryContratoIDCORRETVALORES: TFloatField;
    QryContratoIDBOLSAVALORES: TFloatField;
    QryContratoIDTIPOCONTRINVEST: TFloatField;
    QryContratoIDINVESTIMENTO: TFloatField;
    QryContratoSERIE: TStringField;
    QryContratoIDLOTE: TStringField;
    QryContratoDATACOMPRALOTE: TDateTimeField;
    QryContratoDATAVENCIM: TDateTimeField;
    QryContratoVLRCOMPRATITLOTE: TFloatField;
    QryContratoQTDETITLOTE: TFloatField;
    QryContratoSALDOTITLOTE: TFloatField;
    QryContratoVLRRESGATE: TFloatField;
    QryContratoPRECOVENCIM: TFloatField;
    QryContratoIDCARTLASTRO: TFloatField;
    QryContratoIDCARTAVISTA: TFloatField;
    QryContratoPRZVENC: TFloatField;
    QryContratoQTDECOMPRATITLOTE: TFloatField;
    QryContratoDATACARENCIA: TDateTimeField;
    QryContratoANIVERSARIO: TFloatField;
    QryContratoULTSALDOQTD: TFloatField;
    QryContratoULTSALDOVALOR: TFloatField;
    QryContratoIDCONTRATOMESTRE: TFloatField;
    Panel1: TPanel;
    Label10: TLabel;
    DbLkcTipTit: TwwDBLookupCombo;
    Label14: TLabel;
    Label1: TLabel;
    DbEdDescInvest: TDBEdit;
    Label4: TLabel;
    DbLkcTipoContrato: TwwDBLookupCombo;
    Label3: TLabel;
    DbMemoObservacao: TDBMemo;
    DbLkcCustodiante: TwwDBLookupCombo;
    LbCustodiante: TLabel;
    DbEdPeriodicidade: TDBEdit;
    Label32: TLabel;
    DbEdCarencia: TDBEdit;
    Label12: TLabel;
    DbEdNumAlt: TDBEdit;
    Inativo: TDBCheckBox;
    DbLkcEmissor: TwwDBLookupCombo;
    Label29: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GrdDetalhe: TDBGrid;
    PnlDetalhe: TPanel;
    Label2: TLabel;
    Label34: TLabel;
    Label19: TLabel;
    Label33: TLabel;
    DbIdLote: TDBEdit;
    DbEdDtCarencia: TCMDateTimePicker;
    DbDtCompraTit: TCMDateTimePicker;
    DbEdAniversario: TDBEdit;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    BtInserir: TSpeedButton;
    BtAlterar: TSpeedButton;
    BtExcluir: TSpeedButton;
    Panel3: TPanel;
    BtExecutarOperacao: TBitBtn;
    StBarFundo: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtInserirClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure DbLkcTipTitChange(Sender: TObject);
    procedure DbLkcEmissorChange(Sender: TObject);
    procedure DbDtCompraTitExit(Sender: TObject);
    procedure BtExecutarOperacaoClick(Sender: TObject);
    procedure QryContratoAfterOpen(DataSet: TDataSet);
    procedure DbIdLoteExit(Sender: TObject);
    procedure BtProcOperacaoClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);    
  private
    { Private declarations }
    Procedure HabilitaBotoes;
    Procedure InabilitaBotoes;
    Procedure TrocaPainel;
    Procedure ReposicionaFilhos;
    Procedure MontaDescTitulo;
  public
    { Public declarations }
    IdClasseTitRenFix:Integer;
  end;

var
  FrmCadTitFundo: TFrmCadTitFundo;
// Variaveis de Transferencia de Informacoes entre Operacoes ...
  wIdCarteirainvest,  wIdOperacaoInvest,
  wIdInvestimento, wIdBolsaValores :Integer;
  wDocumento, wNumDocumento, wTipoCustodia, wIdCorretValores  :String;
  wQtdOperacao, wPrecoLote, wVlrOperacao :Double;
  wDtOperacao:TDate;

implementation

uses DBaseDados, UDataBase,UMensErro, UBibliotecaInvest, uSistema,
     FCadOperRenFixa, UOperacaoInvest, UOperComum, dOperComum;

{$R *.DFM}

procedure TFrmCadTitFundo.FormShow(Sender: TObject);
begin
  inherited;
// Habilita Botoes
  BbtnConfirmar.Enabled:=False;
  BbtnCancelar.Enabled :=False;
  SbtnAlterar.Enabled  :=True;
  SbtnApagar.Enabled   :=True;
// Abre as Querys
  QryTipoContrato.Open;
  Qry.Open;
  QryEmissor.Open;
  QryCustodiante.Open;
// Abre Tipos de Titulo de Acordo com SuperClasse
  IdClasseTitRenFix:=2;
  QryTipTit.Close;
  QryTipTit.ParamByName('IDCLASSETIT').AsInteger:=IdClasseTitRenFix;
  MontaSelect.Filtro.Add('( TIPOTITRENFIXA.IDCLASSETIT = '''+IntToStr(IdClasseTitRenFix)+''')');
  QryTipTit.Open;
  wDtOperacao := Date;
  MSProcOperacao.Filtro.Add('( INVESTIMENTO.IDINVESTIMENTO = '''+
                             Qry.FieldByName('IDINVESTIMENTO').AsString+''')');
End;


//------------------------------------------
// Botão Inserir
procedure TFrmCadTitFundo.sbtnInserirClick(Sender: TObject);
begin
// Inabilita Botoes
  InabilitaBotoes;

  Inherited;

// Inclui Resto dos Campos
  Qry.FieldByName('IDINVESTIMENTO').AsInteger := LeUltRegistro(Nil,'INVESTIMENTO');
  Qry.FieldByName('FLGATIVO').AsString :='S';

// SubtTipo Renda Fixa (TITRENFIXA)
  QrySubTipo.Append;
  QrySubTipo.FieldByName('IDTITRENFIXA').AsInteger :=
    Qry.FieldByName('IDINVESTIMENTO').AsInteger;
  QrySubTipo.FieldByName('DATAEMTITRENFIX').AsDateTime:= Date;
  QrySubTipo.Post;
  QrySubTipo.Edit;
End;

// Fim Procedures do Padrao \\
//-------------------------------------------------------------------------
procedure TFrmCadTitFundo.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
// Fecha Querys
  Qry.Close;
  QrySubTipo.Close;
  QryTipTit.Close;
  QryEmissor.Close;
  QryTipoContrato.Close;
  QryCustodiante.Close;

  inherited;
end;

//-----------------------------------------------
// Botao de Inclui Etapa ou Documento
procedure TFrmCadTitFundo.BtInserirClick(Sender: TObject);
begin
// Inabilita Botoes
  InabilitaBotoes;
// Troca Painel
  TrocaPainel;
// Incluir Contrato
  QryContrato.Append;
// Inclui Resto dos Campos
  QryContrato.FieldByName('IDCONTRATOINVEST').AsInteger := LeUltRegistro(Nil,'CONTRATOINVESTIM');
End;

//---------------------------------------------------------
// Botão Cancelar Detalhe
procedure TFrmCadTitFundo.bbtnCancelarDetClick(Sender: TObject);
begin
// Cancela Alteracao
  QryContrato.Cancel;
// Habilita Botoes
  HabilitaBotoes;
// Troca Painel
  TrocaPainel;
End;

//---------------------------------------------------------
// Botão Ok Detalhe
procedure TFrmCadTitFundo.bbtnOkDetClick(Sender: TObject);
begin
  Inherited;
  If BtInserir.Down=True Then Begin
// Inclui Resto dos Campos
    QryContrato.FieldByName('IDCONTRATOINVEST').AsInteger := LeUltRegistro(Nil,'CONTRATOINVESTIM');
  End;

  QryContrato.FieldByName('IDCONTRATOMESTRE').AsInteger :=
    QryContrato.FieldByName('IDCONTRATOINVEST').AsInteger;
  QryContrato.FieldByName('IDEMISSOR').AsInteger:=
    Qry.FieldByName('IDEMISSOR').AsInteger;
  QryContrato.FieldByName('IDTIPOCONTRINVEST').AsString:=DbLkcTipoContrato.LookupValue;
  QryContrato.FieldByName('IDINVESTIMENTO').AsInteger:=
    Qry.FieldByName('IDINVESTIMENTO').AsInteger;

// Confirma SubTitulo de Renda Fixa
  QryContrato.Post;
  QryContrato.ApplyUpdates;
  QryContrato.CommitUpdates;

// Habilita Botoes
  HabilitaBotoes;
// Troca Painel
  TrocaPainel;
end;

//-------------------------------------------------------------------------------
// Confirmar
procedure TFrmCadTitFundo.CmeCadastroConfirma(Sender: TObject);
Begin
  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

//---------------------------------------------------------
// Botão Excluir Detalhe
procedure TFrmCadTitFundo.BtExcluirClick(Sender: TObject);
begin
  inherited;
// Inabilita Botoes
  BtExcluir.Down:=False;
// Confirma Exclusao ou Nao
  If MsgDlg('Confirma Exclusão ?' , 'Mensagem do Sistema ',
     mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
    Exit;
  End;

// Excluir Contrato
  QryContrato.Delete;
  QryContrato.ApplyUpdates;
  QryContrato.CommitUpdates;
End;

//---------------------------------------------------------
// Botão Alterar Detalhe
procedure TFrmCadTitFundo.BtAlterarClick(Sender: TObject);
begin
  inherited;
// Alterar Contrato
  QryContrato.Edit;
// Inabilita Botoes
  InabilitaBotoes;
// Troca Painel
  TrocaPainel;
end;

procedure TFrmCadTitFundo.bbtnConfirmarClick(Sender: TObject);
begin
// Preenche outros dados
// INVESTIMENTO
  Qry.FieldByName('IDTIPOINVEST').AsInteger:=1;
// TITRENFIXA
  QrySubTipo.FieldByName('IDTITRENFIXA').AsInteger:=Qry.FieldByName('IDINVESTIMENTO').AsInteger;

// Heranca
//  Inherited

// Confirma Contrato
  Qry.Post;
  Qry.ApplyUpdates;
  Qry.CommitUpdates;

// Confirma SubTitulo de Renda Fixa
  QrySubTipo.Post;
  QrySubTipo.ApplyUpdates;
  QrySubTipo.CommitUpdates;

// Excuta Botao Cancelar
  BbtnCancelar.Click;
// Habilita Botoes
  HabilitaBotoes;
end;

procedure TFrmCadTitFundo.sbtnApagarClick(Sender: TObject);
begin
// Caso Tabela Vazia Sai
  If Qry.IsEmpty Then Begin
    MsgDlg('Tabela Vazia ','Mensagem do Sistema',MtError,[MbOk],0);
    sbtnApagar.Down:=False;
    Exit;
  End;
// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then Begin
    sbtnApagar.Down:=False;
    Exit;
  End;

// Tenta Excluir Detalhes
  Try
    DtmBaseDados.dbBaseDados.StartTransaction;
// (TITRENFIXA)
      If Not ExecutaQuery(QryAux,'DELETE FROM CM.TITRENFIXA WHERE IDTITRENFIXA = '''+
                          Qry.FieldByName('IDINVESTIMENTO').AsString+'''')Then
                          Abort;
// (INVESTIMENTO)
      If Not ExecutaQuery(QryAux,'DELETE FROM CM.INVESTIMENTO WHERE IDINVESTIMENTO = '''+
                          Qry.FieldByName('IDINVESTIMENTO').AsString+'''') Then
                          Abort;
// Confirma Transacao
    DtmBaseDados.dbBaseDados.Commit;
  Except
    On E:Exception Do Begin
      MsgDlg('Registro não pode ser excluido, Mensagem:  '+#13+E.Message ,
             'Mensagem do Sistema ',
              mtError , [mbOk], 0);
// Cancela Transacao
      DtmBaseDados.dbBaseDados.Rollback;
    End;
  End;
// Erança
//  inherited;
// Refaz Ambiente
  sbtnApagar.Down:=False;
  Qry.Close;
  Qry.Open;
end;

procedure TFrmCadTitFundo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Reposiona os Dependentes
  ReposicionaFilhos;
// Habilita Botoes
  HabilitaBotoes;

  PnlFundo.Enabled     := True;
end;

procedure TFrmCadTitFundo.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Edita SubTipo
  QrySubTipo.Edit;
// Inabilita Botoes
  InabilitaBotoes;
end;

procedure TFrmCadTitFundo.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
  WindowState := wsMaximized;  
end;

procedure TFrmCadTitFundo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
  If (MontaSelect.RetornouValor) Then Begin
   Qry.Locate('IDINVESTIMENTO',StrToInt(MontaSelect.ValoresChave[0]),[]);
   MSProcOperacao.Filtro.Add('( INVESTIMENTO.IDINVESTIMENTO = '''+
                             Qry.FieldByName('IDINVESTIMENTO').AsString+''')');
 End;
end;
//----------------------------------------------------------------------------------------
// Habilita Botoes
Procedure TFrmCadTitFundo.HabilitaBotoes;
Begin
// Habilita Botoes do Mestre
  sbtnInserir.Enabled  :=True;
  SbtnAlterar.Enabled  :=True;
  SbtnApagar.Enabled   :=True;
  sbtnProcurar.Enabled :=True;

// Habilita e Sobe  Botoes do Detalhe
  BtInserir.Enabled:=True; BtInserir.Down:=False;
  BtExcluir.Enabled:=True; BtExcluir.Down:=False;
  BtAlterar.Enabled:=True; BtAlterar.Down:=False;
  BtExecutarOperacao.Enabled:=True;
End;

//----------------------------------------------------------------------------------------
// Inabilita Botoes
Procedure TFrmCadTitFundo.InabilitaBotoes;
Begin
// Habilita Botoes do Mestre
  sbtnInserir.Enabled  :=False;
  SbtnAlterar.Enabled  :=False;
  SbtnApagar.Enabled   :=False;
  sbtnProcurar.Enabled :=False;

// Habilita Botoes do Detalhe
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
  BtExecutarOperacao.Enabled:=False;
End;

Procedure TFrmCadTitFundo.TrocaPainel;
Begin
// Troca Posicao do Painel/Grid
  GrdDetalhe.Visible := Not GrdDetalhe.Visible;
  PnlDetalhe.Visible := Not PnlDetalhe.Visible;
  StBarFundo.Visible := Not StBarFundo.Visible;
End;

procedure TFrmCadTitFundo.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Reposiona os Dependentes
  ReposicionaFilhos;
end;

Procedure TFrmCadTitFundo.ReposicionaFilhos;
Begin
// Abre Query com o SubTipo
  If Not Qry.IsEmpty Then Begin
    FazQuery(QrySubTipo,
      'SELECT	IDTITRENFIXA, CODTIPRENFIXA, SERIETITRENFIX, IDALTTITRENFIX,    '+
      'DATAEMTITRENFIX, DATAVENCTITRENFIX, INDEXRENFIX, DATAINIJURRENFIX,       '+
      'DATABASEINDRENFIX, JUROSRENFIX, CODTIPTXJUROS, PREMIORENFIX, VLRRESGATE, '+
      'CODTIPTXPREMIO, IDINDSWAPFIX, IDCUSTODIANTE, PERCINDEX, JUROSDIA,        '+
      'CARENCIA, PERIODICIDADE, FLGSAQUEPARCIAL '+
      'FROM CM.TITRENFIXA      '+
      'WHERE IDTITRENFIXA = '''+
        Qry.FieldByName('IDINVESTIMENTO').AsString+'''');

    FazQuery(QryContrato,
      ' SELECT  CON.IDCONTRATOINVEST, CON.IDEMISSOR, CON.IDCORRETVALORES, CON.IDBOLSAVALORES, CON.IDTIPOCONTRINVEST, '+
	   '         CON.IDINVESTIMENTO, CON.SERIE, CON.IDLOTE, CON.DATACOMPRALOTE, CON.DATAVENCIM, CON.VLRCOMPRATITLOTE, '+
      '         CON.QTDETITLOTE, CON.SALDOTITLOTE, CON.VLRRESGATE, CON.PRECOVENCIM, CON.IDCARTLASTRO,                '+
	   '         CON.IDCARTAVISTA, CON.PRZVENC, CON.QTDECOMPRATITLOTE, CON.DATACARENCIA, CON.ANIVERSARIO,             '+
      '         (0) AS ULTSALDOQTD,  (0) AS ULTSALDOVALOR,CON.IDTIPOCONTRINVEST,CON.IDCONTRATOMESTRE                 '+
      ' FROM CM.CONTRATOINVESTIM CON '+
      ' WHERE CON.IDINVESTIMENTO = '''+
        Qry.FieldByName('IDINVESTIMENTO').AsString+'''');

// Busca Tipo de Contrato e Posiciona o Combo
//    FazQuery(QryAux,
//      'SELECT * FROM CM.TIPOCONTRINVEST '+
//      ' WHERE IDTIPOCONTRINVEST = '''+
//      QryContrato.FieldByName('IDTIPOCONTRINVEST').AsString+'''');
    If Not (QryContrato.IsEmpty) And (QryContrato.FieldByName('IDTIPOCONTRINVEST').AsString <> '') Then Begin
      QryTipoContrato.Locate('IDTIPOCONTRINVEST',
                             QryContrato.FieldByName('IDTIPOCONTRINVEST').AsString,[]);
      DbLkcTipoContrato.Text := QryTipoContrato.FieldByName('DESCTIPOCTINVEST').AsString;
      DbLkcTipoContrato.Enabled := False;
    End Else Begin
      DbLkcTipoContrato.Enabled := True;
    End;
//    DbLkcTipoContrato.LookupValue := QryContrato.FieldByName('IDTIPOCONTRINVEST').AsString;
//    DbLkcTipoContrato.RefreshDisplay;
  End;
End;

Procedure TFrmCadTitFundo.MontaDescTitulo;
Begin
  If Qry.State In [DsInsert, DsEdit] Then
    Qry.FieldByName('DESCINVESTIMENTO').AsString:=
      DbLkcTipTit.Text+' - '+DbLkcEmissor.Text;
End;

procedure TFrmCadTitFundo.DbLkcTipTitChange(Sender: TObject);
begin
  inherited;
  MontaDescTitulo;
  If QrySubTipo.State In [DsInsert, DsEdit] Then Begin
    QrySubTipo.FieldByName('IDCUSTODIANTE').AsInteger :=
      QryTipTit.FieldByName('IDCUSTODIANTE').AsInteger;
  End;
end;

procedure TFrmCadTitFundo.DbLkcEmissorChange(Sender: TObject);
begin
  inherited;
  MontaDescTitulo;
end;

procedure TFrmCadTitFundo.DbDtCompraTitExit(Sender: TObject);
begin
  inherited;
// Preenche a Data de Data Base,  Iniciodo Titulo e Data da Operacao
  Try
    If QryContrato.State In [DsInsert, DsEdit] Then Begin
      If DbEdCarencia.Text =  '' Then DbEdCarencia.Text :='0';
      QryContrato.FieldByName('DATACARENCIA').AsDateTime:=
        StrToDate(DbDtCompraTit.Text)+StrToInt(DbEdCarencia.Text);
    End;
  Except
  End;
end;

procedure TFrmCadTitFundo.BtExecutarOperacaoClick(Sender: TObject);
begin
 inherited;
// Cria o Formulario de Operacaoes com Acoes
 Application.CreateForm(TFrmCadOperRenFixa,FrmCadOperRenFixa);

// Preeche Variaveis do Formulario
 FrmCadOperRenFixa.wEmContrato        := True;
 FrmCadOperRenFixa.wIdClasseTitRenFix := 2;

// FrmCadOperRenFixa.wIdTipoOperacao  := QryEtapas.FieldByName('IDTIPOOPERACAO').AsInteger;
// FrmCadOperRenFixa.wIdCarteiraInvest:= wIdCarteiraInvest;
// FrmCadOperRenFixa.wIdCorretValores := Qry.FieldByName('IDCORRETVALORES').AsString;
// FrmCadOperRenFixa.wIdBolsavalores  := Qry.FieldByName('IDBOLSAVALORES').AsInteger;
// FrmCadOperRenFixa.wNumDocumento    := wNumDocumento;
// FrmCadOperRenFixa.wVlrOperacao     := wVlrOperacao;
// FrmCadOperRenFixa.wQtdOperacao     := wQtdOperacao;
// FrmCadOperRenFixa.wPrecoLote       := wPrecoLote;

 FrmCadOperRenFixa.wIdInvestimento  := Qry.FieldByName('IDINVESTIMENTO').AsInteger;
 FrmCadOperRenFixa.wIdLote          := QryContrato.FieldByName('IDLOTE').AsString;
 FrmCadOperRenFixa.wDtOperacao      := wDtOperacao;

// Altera para Normal e Mostra Formulario
 FrmCadOperRenFixa.FormStyle:= FsNormal;
 FrmCadOperRenFixa.Visible  := False;
 FrmCadOperRenFixa.Top      := 70;
 FrmCadOperRenFixa.bbtnConfirmar.ModalResult:=MrNone;
 FrmCadOperRenFixa.ShowModal;

// Atualiza Variaveis de Trasferencia
 If FrmCadOperRenFixa.ModalResult = MrOk Then Begin
   wDtOperacao      := FrmCadOperRenFixa.wDtOperacao;
{
   wIdCarteiraInvest:= FrmCadOperRenFixa.wIdCarteiraInvest;
   wIdCorretValores := FrmCadOperRenFixa.wIdCorretValores;
   wIdInvestimento  := FrmCadOperRenFixa.wIdInvestimento;
   wIdBolsavalores  := FrmCadOperRenFixa.wIdBolsaValores;
   wNumDocumento    := FrmCadOperRenFixa.wNumDocumento;
   wQtdOperacao     := FrmCadOperRenFixa.wQtdOperacao;
   wPrecoLote       := FrmCadOperRenFixa.wPrecoLote;
   wVlrOperacao     := FrmCadOperRenFixa.wVlrOperacao;
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
}

// Grava Dados na OPERXCONTRATO (Operacoes do Contrato) // Caso Operacao Nova
{
   If FrmCadOperRenFixa.TipoOperacao = 'I' Then Begin
     ExecutaQuery(QryAux,
       'INSERT INTO OPERXCONTRATO                                '+
       '(IDCONTRATOINVEST, IDTIPOCONTRINVEST, SEQCONTRATOINVEST, '+
       ' IDOPERACAOINVEST, IDREGRADATAOPERUS, IDREGRAVLROPERUS,  '+
       ' DATAOPERPREVISTA, VLROPERPREVISTO) VALUES (             '+
       QryContrato.FieldByName('IDCONTRATOINVEST').AsString          +', '+
       QryContrato.FieldByName('IDTIPOCONTRINVEST').AsString         +', '+
       LstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)]+', '+
       IntToStr(wIdOperacaoInvest)                       +', '''+
       'Null, '+'Null, '+'Null, '+'0'+')');

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
}
 End;

// Libera Formulario
 FrmCadOperRenFixa.Free;
// Reabre a Query de Contratos
 QryContrato.Close;
 QryContrato.Open;
end;

procedure TFrmCadTitFundo.QryContratoAfterOpen(DataSet: TDataSet);
Var
  RecSaldos: TRecSaldos;
  wTotFundo:Double;
Begin
  inherited;
// Busca os Saldos de um Investimento/Lote
  QryContrato.DisableControls;
  QryContrato.First;
  wTotFundo:=0;
  While Not QryContrato.Eof Do Begin
    RecSaldos := OperacaoInvest.BuscaSaldosLote(
                   QryContrato.FieldByName('IDINVESTIMENTO').AsInteger,
                   QryContrato.FieldByName('IDLOTE').AsString,
                   Date);
    QryContrato.Edit;
    QryContrato.FieldByName('ULTSALDOQTD').AsFloat   := RecSaldos.SldQtdInvCart;
    QryContrato.FieldByName('ULTSALDOVALOR').AsFloat := RecSaldos.SldVlrInvCart;
    wTotFundo := wTotFundo+RecSaldos.SldVlrInvCart;
    QryContrato.Post;
    QryContrato.Next;
  End;

  StBarFundo.Panels.Items[1].Text:= FloatToStrF(wTotFundo,FFNumber,16,2)+'     ';
  QryContrato.First;
  QryContrato.EnableControls;
end;

procedure TFrmCadTitFundo.DbIdLoteExit(Sender: TObject);
begin
  inherited;
// Caso inserindo busca dados da serie
  If (QryContrato.State In [DsInsert, DsEdit]) And (DbIdLote.Text <> '') And
     ((QryContrato.RecordCount > 0))
  Then Begin
// Caso Existam contratos com o mesmo IdLote Nao permite
//    If FazQuery(QryAux,'SELECT IDLOTE FROM CONTRATOINVESTIM '+
//                       'WHERE IDLOTE = '+QuotedStr(Trim(DbIdLote.Text)))
    If FazQuery(QryAux,'SELECT IDLOTE FROM CONTRATOINVESTIM '+
                       'WHERE IDLOTE = '+QuotedStr(Trim(DbIdLote.Text))+
                       ' AND IDCONTRATOMESTRE = '+
                         QuotedStr(QryContrato.FieldByName('IDCONTRATOINVEST').AsString))
    Then Begin
// Mostra Mensagem e Cancela Lote
      Beep;
      MsgDlg('Lote '+QuotedStr(Trim(DbIdLote.Text))+' já Existente.','Mensagem do Sistema ',mtError,[MbOk],0);
      QryContrato.FieldByName('IDLOTE').AsString  := '';
    End;
  End;
end;

procedure TFrmCadTitFundo.BtProcOperacaoClick(Sender: TObject);
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

end.

// **--> By Alexandre Ramos, Serious Developer ..






