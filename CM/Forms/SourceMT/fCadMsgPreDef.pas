unit fCadMsgPreDef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, ComCtrls, wwdblook, fcButton, fcImgBtn, fcShapeBtn,
  fcClearPanel, fcButtonGroup, fcOutlookList, fcOutlookBar, uCtrlMsgPreDef,
  uSistema, dBaseDados, uMensErro, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmCadMsgPreDef = class(TFrmCadastroMT)
    cdsContexto: TCMClientDataSet;
    pnlEdicao: TPanel;
    PageControl: TPageControl;
    tabComposicao: TTabSheet;
    pnlComposicao: TPanel;
    Splitter2: TSplitter;
    pnlTags: TPanel;
    pnlBottomTag: TPanel;
    dbmemTexto: TDBMemo;
    tabVisualizacao: TTabSheet;
    pnlTop: TPanel;
    lblDescricao: TLabel;
    lblObs: TLabel;
    lblCodigo: TLabel;
    dbedtDescricao: TDBEdit;
    dbmemObs: TDBMemo;
    dbedtCodigo: TDBEdit;
    cdsTags: TCMClientDataSet;
    dtsTags: TDataSource;
    pnlHelp: TPanel;
    pnlBottomHelp: TPanel;
    lblTag: TLabel;
    dbedtTag: TDBEdit;
    lblExemplo: TLabel;
    dbedtExemplo: TDBEdit;
    dbmemDescricao: TDBMemo;
    pnldescHelp: TPanel;
    lblDescTag: TLabel;
    pnlAllContexto: TPanel;
    pnlContexto: TPanel;
    lblContexto: TLabel;
    lbTags: TListBox;
    cdsTagsView: TCMClientDataSet;
    memVisualizacao: TMemo;
    edtContexto: TEdit;
    btnSelecionaContexto: TSpeedButton;
    msContexto: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure cdsTagsAfterClose(DataSet: TDataSet);
    procedure cdsTagsAfterOpen(DataSet: TDataSet);
    procedure CdsAfterClose(DataSet: TDataSet);
    procedure CdsAfterCancel(DataSet: TDataSet);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbmemTextoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbmemTextoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbTagsDblClick(Sender: TObject);
    procedure lbTagsClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btnSelecionaContextoClick(Sender: TObject);
  private

    bMaximizado : boolean;
    iHeight : integer;
    iWidth  : integer;

    iUltContexto : integer;

    CtrlMsgPreDef : TCtrlMsgPreDef;

    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    procedure MaximizaJanela;
    procedure RestauraJanela;

    procedure SelecionaContexto( sDesc : string );

    function TagByIndex( iIndex : integer ) : string;

  public
    procedure MsgErro( sMsg : string );
  end;

var
  frmCadMsgPreDef: TfrmCadMsgPreDef;

implementation

{$R *.DFM}

{ TfrmCadMsgPreDef }

procedure TfrmCadMsgPreDef.MaximizaJanela;
begin
  Height := Application.MainForm.ClientHeight - 60;
  Width  := Application.MainForm.ClientWidth - 6;
  Top    := 0;
  Left   := 0;
  bMaximizado := True;
end;


procedure TfrmCadMsgPreDef.RestauraJanela;
begin
  Height := iHeight;
  Width  := iWidth;
  Top    := round( ( ( Application.MainForm.ClientHeight - 60 ) - Height ) / 2 );
  Left   := round( ( ( Application.MainForm.ClientWidth  - 6  ) - Width  ) / 2 );
  bMaximizado := False;
end;

procedure TfrmCadMsgPreDef.WMSysCommand(var Msg: TWMSysCommand);
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

procedure TfrmCadMsgPreDef.FormCreate(Sender: TObject);
begin
  inherited;
  iHeight := Height;
  iWidth  := Width;

  CtrlMsgPreDef := TCtrlMsgPreDef.Create;
  CtrlMsgPreDef.Initialize( DtmBaseDados.dbBaseDados, True,
   Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlMsgPreDef.CdsMsgPreDef := cds;

  cdsContexto.Data := CtrlMsgPreDef.ListaContextos( Sistema.IdModulo );

  cds.Data := CtrlMsgPreDef.SelecionaMsgPreDef( -1 );

  MontaSelect.Filtro.Add( 'MSGCONTEXTO.IDMODULO = ' + IntToStr( Sistema.IdModulo ) );
  msContexto.Filtro.Add(  'MSGCONTEXTO.IDMODULO = ' + IntToStr( Sistema.IdModulo ) );

  bMaximizado := False;
  MaximizaJanela;
end;

procedure TfrmCadMsgPreDef.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOk], 0 );
end;

procedure TfrmCadMsgPreDef.FormDestroy(Sender: TObject);
var
  i : integer;
begin
  CtrlMsgPreDef.Free;

  for i := 0 to lbTags.Items.Count - 1 do
    DisposeStr( PString( lbTags.Items.Objects[i] ) );

  inherited;
end;

procedure TfrmCadMsgPreDef.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if trim( dbedtDescricao.Text )= '' then
  begin
    MsgErro( 'Preencha a descrição.' );
    dbedtDescricao.SetFocus;
    exit;
  end;

  if trim( edtContexto.Text )= '' then
  begin
    MsgErro( 'Selecione o contexto.' );
    edtContexto.SetFocus;
    exit;
  end;

  if trim( dbmemTexto.Text )= '' then
  begin
    MsgErro( 'Preencha o texto.' );
    dbmemTexto.SetFocus;
    exit;
  end;

  Accept := True;
end;

procedure TfrmCadMsgPreDef.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  iUltContexto := -1;
  SelecionaContexto( '' );
  dbedtDescricao.SetFocus; 
end;

procedure TfrmCadMsgPreDef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  begin
    cds.Data := CtrlMsgPreDef.SelecionaMsgPreDef( StrTointDef( MontaSelect.ValoresChave[0], 0 ) );
    SelecionaContexto( MontaSelect.ValoresChave[1] );
  end;
end;

procedure TfrmCadMsgPreDef.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlMsgPreDef.GravaMsgPreDef;
end;

procedure TfrmCadMsgPreDef.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;                
  Accept := CtrlMsgPreDef.GravaMsgPreDef;
end;

procedure TfrmCadMsgPreDef.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlMsgPreDef.GravaMsgPreDef;
end;

procedure TfrmCadMsgPreDef.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  cds.Data := CtrlMsgPreDef.SelecionaMsgPreDef( cds.FieldByName('IDMSGPREDEF').AsInteger );
  SelecionaContexto( CtrlMsgPreDef.RecuperaDescContexto( cds.FieldByName('IDMSGCONTEXTO').AsInteger ) );
end;

procedure TfrmCadMsgPreDef.SelecionaContexto( sDesc : string );
var
  i : integer;
begin
  cdsTags.Close;

  edtContexto.Text := sDesc;

  for i := 0 to lbTags.Items.Count - 1 do
    DisposeStr( PString( lbTags.Items.Objects[i] ) );

  lbTags.Items.Clear;
  if cds.Active then
    if cds.FieldByName('IDMSGCONTEXTO').AsInteger > 0 then
    begin
      cdsTags.Data := CtrlMsgPreDef.SelecionaTags( cds.FieldByName('IDMSGCONTEXTO').AsInteger );
      iUltContexto := cds.FieldByName('IDMSGCONTEXTO').AsInteger;
      cdsTags.First;
      while not cdsTags.Eof do
      begin
        lbTags.Items.AddObject( cdsTags.FieldByName('NOMEEXIB').AsString, TObject( LongInt( NewStr( cdsTags.FieldByName('TAG').AsString ) ) ) );
        cdsTags.Next;
      end;
      cdsTags.First;      
    end;
end;


procedure TfrmCadMsgPreDef.cdsTagsAfterClose(DataSet: TDataSet);
begin
  inherited;
  pnlBottomTag.Visible := False;
end;

procedure TfrmCadMsgPreDef.cdsTagsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pnlBottomTag.Visible := True;
end;

procedure TfrmCadMsgPreDef.CdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  SelecionaContexto( '' );
end;

procedure TfrmCadMsgPreDef.CdsAfterCancel(DataSet: TDataSet);
begin
  inherited;
  SelecionaContexto( CtrlMsgPreDef.RecuperaDescContexto( cds.FieldByName('IDMSGCONTEXTO').AsInteger ) );
end;

procedure TfrmCadMsgPreDef.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  SelecionaContexto( '' );
end;

procedure TfrmCadMsgPreDef.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := tabComposicao;
end;


procedure TfrmCadMsgPreDef.dbmemTextoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ( Source = lbTags );
end;

procedure TfrmCadMsgPreDef.dbmemTextoDragDrop(Sender, Source: TObject; X,  Y: Integer);
var
  iCursorPos : integer;
  sAntes, sDepois : string;
  sTag : string;
begin
   iCursorPos := LoWord( SendMessage( dbmemTexto.Handle, EM_CHARFROMPOS, 0, MakeLParam( X, Y ) ) );
   sTag := '<#' + TagByIndex( lbTags.ItemIndex ) + '>';
   sAntes  := Copy( dbmemTexto.Text, 1, iCursorPos );
   sDepois := Copy( dbmemTexto.Text, iCursorPos + 1, length( dbmemTexto.Text ) - iCursorPos );
   dbmemTexto.Text := sAntes + sTag + sDepois;
   dbmemTexto.SelStart  := iCursorPos;
   dbmemTexto.SelLength := length( sTag );
   dbmemTexto.SetFocus;
end;

function TfrmCadMsgPreDef.TagByIndex( iIndex : integer ): string;
begin
  Result := PString( lbTags.Items.Objects[ iIndex ] )^;
end;

procedure TfrmCadMsgPreDef.lbTagsDblClick(Sender: TObject);
var
  iCursorPos, iSelLength : integer;
  sAntes, sDepois : string;
  sTag : string;
begin
   inherited;
   iCursorPos := dbmemTexto.SelStart + 1;
   iSelLength := dbmemTexto.SelLength;
   sTag := '<#' + TagByIndex( lbTags.ItemIndex ) + '>';
   sAntes  := Copy( dbmemTexto.Text, 1, iCursorPos - 1 );
   sDepois := Copy( dbmemTexto.Text, iCursorPos, length( dbmemTexto.Text ) - ( iCursorPos + iSelLength - 1 ) );
   dbmemTexto.Text := sAntes + sTag + sDepois;
   dbmemTexto.SelStart  := iCursorPos - 1;
   dbmemTexto.SelLength := length( sTag );
   dbmemTexto.SetFocus;
end;

procedure TfrmCadMsgPreDef.lbTagsClick(Sender: TObject);
begin
  inherited;
  cdsTags.Locate( 'TAG', TagByIndex( lbTags.ItemIndex ), [] );
end;

procedure TfrmCadMsgPreDef.PageControlChange(Sender: TObject);
var
  sAux : string;
begin
  inherited;
  if PageControl.ActivePage = tabVisualizacao then
  begin
    cdsTagsView.Data := cdsTags.Data;

    if cdsTagsView.IsEmpty then
      exit;

    sAux := Cds.FieldByName('TEXTO').AsString;
    cdsTagsView.First;
    while not cdsTagsView.Eof do
    begin
      sAux := StringReplace( sAux, '<#' + cdsTagsView.FieldByName('TAG').AsString + '>',
       cdsTagsView.FieldByName('EXEMPLOCONT').AsString, [rfIgnoreCase, rfReplaceAll] );
      cdsTagsView.Next;
    end;
    
    memVisualizacao.Text := sAux;
  end;
end;

procedure TfrmCadMsgPreDef.btnSelecionaContextoClick(Sender: TObject);
begin
  inherited;
  if Sender = btnSelecionaContexto then
    if cds.FieldByName('IDMSGCONTEXTO').AsInteger > 0 then
      if MessageDlg('Se o contexto for alterado, as tags atualmente existentes na mensagem ' +
       'poderão ser inválidas ou serem substituídas por conteúdos diferentes dos previstos.' +
       #13+#10 + 'Confirma a mudança de contexto?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

  msContexto.Executar;
  if msContexto.RetornouValor then
  begin
    if CtrlMsgPreDef.ExisteMsgParaContexto( cds.FieldByName('IDMSGPREDEF').AsInteger,
     StrToInt( msContexto.ValoresChave[0] ) ) then
    begin
      MsgErro( 'Só pode haver uma mensagem cadastrada para o contexto selecionado.' );
      btnSelecionaContextoClick( nil );
      exit;
    end;

    cds.FieldByName('IDMSGCONTEXTO').AsInteger := StrToInt( msContexto.ValoresChave[0] );
    SelecionaContexto( msContexto.ValoresChave[1] );
  end;
end;

end.
