unit FConexao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Registry, JCLStrings, uSistema, uCmCrypto, Db,
  DBClient, uCMClientDataSet, FileCtrl, uCmTypes, dBaseDados, BfDialogs,
  BrowseFolder, uProcuraDir, ADODB, DBTables, CMDatabase, ImgList, TB97Ctls,
  DBCtrls, uCtrlWebInterface, ShellAPI;

type
  TfrmConexao = class(TfrmOkCancelar)
    dlgOpenDir: TProcuraDirDlg;
    grpBDE: TGroupBox;
    lblHost: TLabel;
    edtHost: TEdit;
    lblLogin: TLabel;
    edtLogin: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    grpMeio: TGroupBox;
    rbADO: TRadioButton;
    rbBDE: TRadioButton;
    lblLocalizacao: TLabel;
    edtDiretorio: TEdit;
    grpADO: TGroupBox;
    rbConnectionString: TRadioButton;
    rbArqVinc: TRadioButton;
    pnlArqVinc: TPanel;
    lblArqVinc: TLabel;
    edtArquivoVinculacao: TEdit;
    spbArqVinc: TSpeedButton;
    pnlConnectionString: TPanel;
    lblConnectionString: TLabel;
    edtConnectionString: TEdit;
    spbPreencheConnectionString: TSpeedButton;
    dlgOpenFile: TOpenDialog;
    dbBDEConnection: TCMDatabase;
    dbADOConnection: TADOConnection;
    Toolbar971: TToolbar97;
    btnTeste: TBitBtn;
    cbPreparaQuery: TCheckBox;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    ImlPadrao: TImageList;
    lblInterface: TLabel;
    dblkpInterface: TDBLookupComboBox;
    cdsInterface: TCMClientDataSet;
    cdsInterfaceIDWEBINTERFACE: TFloatField;
    cdsInterfaceNOMEINTERFACE: TStringField;
    cdsInterfaceENDLOGIN: TStringField;
    cdsInterfaceEMAIL: TStringField;
    cdsInterfaceTIMEOUT: TFloatField;
    cdsInterfaceMENUALTURA: TFloatField;
    cdsInterfaceMENULARGURA: TFloatField;
    cdsInterfaceMENUTAMFONTE: TFloatField;
    cdsInterfaceMENUPOSX: TFloatField;
    cdsInterfaceMENUPOSY: TFloatField;
    cdsInterfaceMENUDISTANCIA: TFloatField;
    cdsInterfaceMENUNOMEFONTE: TStringField;
    cdsInterfaceMENUCORFONTE: TStringField;
    cdsInterfaceMENUCORFONTESEL: TStringField;
    cdsInterfaceMENUCORFUNDO: TStringField;
    cdsInterfaceMENUCORFUNDOSEL: TStringField;
    cdsInterfaceFLGUSAMENU: TStringField;
    cdsInterfaceFLGUSALAYERS: TStringField;
    cdsInterfaceFLGDEMO: TStringField;
    cdsInterfaceFLGJANELARELAT: TStringField;
    dtsInterface: TDataSource;
    spbCfgArq: TSpeedButton;
    lblComandoConexao: TLabel;
    memComandoConexao: TMemo;
    lblObsComandoConexao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtIdWebInterfaceKeyPress(Sender: TObject; var Key: Char);
    procedure dlgOpenDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure rbConnectionStringClick(Sender: TObject);
    procedure rbArqVincClick(Sender: TObject);
    procedure spbPreencheConnectionStringClick(Sender: TObject);
    procedure spbArqVincClick(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure rbADOClick(Sender: TObject);
    procedure rbBDEClick(Sender: TObject);
    procedure spbCfgArqClick(Sender: TObject);
  private
    CMCrypto : TCMCrypto;
    sDirAux : string;

    WebInterface : TCtrlWebInterface;

    //Estados: 1 - Tela vazia. Pode consultar e incluir
    //         2 - Dados consultados na janela. Pode consultar, incluir, alterar e excluir.
    //         3 - Dados sendo alterados. Pode confirmar e cancelar.
    procedure EstadoDaJanela( iEstado : integer );

    procedure LimpaTudo;

    procedure MsgErro ( sMsg : String );

    procedure LeDados;
    function SalvaDados : Boolean;

    function ValidaConexao : boolean; 

  public
    { Public declarations }
  end;

var
  frmConexao: TfrmConexao;

implementation

{$R *.DFM}

procedure TfrmConexao.FormCreate(Sender: TObject);
begin
  inherited;
  CMCrypto := TCMCrypto.Create;

  WebInterface := TCtrlWebInterface.Create;

  WebInterface.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  cdsInterface.Data := WebInterface.SelecionaTodos;   

  LimpaTudo;
  EstadoDaJanela( 1 );
end;


procedure TfrmConexao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
  begin
    LimpaTudo;
    EstadoDaJanela( 1 );
  end;


  if sbtnAlterar.Down then
  begin
    LeDados;
    EstadoDaJanela( 2 );
  end;

  sbtnInserir.Down := False;
  sbtnAlterar.Down := False;
  sbtnProcurar.Down := False;
end;

procedure TfrmConexao.LeDados;
var
  sText : TStringList;
  sAux : string;
begin
  sAux := edtDiretorio.Text;
  LimpaTudo;
  edtDiretorio.Text := sAux;

  sbtnInserir.Down := False;
  sbtnAlterar.Down := False;
  sbtnProcurar.Down := False;

  edtDiretorio.Text := trim( edtDiretorio.Text );

  if edtDiretorio.Text = '' then exit;

  sText := TStringList.Create;
  try

    if FileExists( edtDiretorio.Text + 'AutoAtendimento.cfg' ) then
    begin
      CMCrypto.CMDecryptFileToStringList( edtDiretorio.Text + 'AutoAtendimento.cfg',
       '360487D03EE2480CA5A16169E36B981C96941E0454F84257BA9FBF47686CA727', sText );

      edtHost.Text              := sText.Values['HOST'];
      edtLogin.Text             := sText.Values['LOGIN'];
      edtSenha.Text             := sText.Values['SENHA'];
      if      sText.Values['CONEXAO'] = '0' then rbADO.Checked := True
      else if sText.Values['CONEXAO'] = '1' then rbBDE.Checked := True;
      dblkpInterface.KeyValue   := sText.Values['IDWEBINTERFACE'];
      if      sText.Values['CONADO'] = '0' then rbConnectionString.Checked := True
      else if sText.Values['CONADO'] = '1' then rbArqVinc.Checked          := True;
      edtConnectionString.Text  := sText.Values['CONNECTIONSTRING'];
      edtArquivoVinculacao.Text := sText.Values['ARQVINC'];
      memComandoConexao.Text    := StringReplace( sText.Values['COMANDOCONEXAO'], '§', #13#10, [rfReplaceAll] );
      cbPreparaQuery.Checked    := ( sText.Values['PREPARAQUERY'] = 'S' );

      EstadoDaJanela( 2 );
    end
    else
      MessageDlg('Arquivo de configuração não encontrado na pasta especificada.', mtError, [mbOK], 0);

  finally
    sText.Free;
  end;
end;

procedure TfrmConexao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if SalvaDados then
    LeDados;
end;

function TfrmConexao.SalvaDados: Boolean;
var
  sText : TStringList;
begin
  Result := False;

  edtHost.Text  := trim( edtHost.Text );
  edtLogin.Text := trim( edtLogin.Text );
  edtSenha.Text := trim( edtSenha.Text );
  edtConnectionString.Text := trim( edtConnectionString.Text );
  edtArquivoVinculacao.Text := trim( edtArquivoVinculacao.Text );

  if dblkpInterface.KeyValue <= 0 then
  begin
    ShowMessage( 'O campo "Id. da Interface" deve ser preenchido.' );
    dblkpInterface.SetFocus;
    exit;
  end;

  if not ValidaConexao then
    exit;

  sText := TStringList.Create;
  try

    sText.Values['LOGIN']          := edtLogin.Text;
    sText.Values['SENHA']          := edtSenha.Text;
    sText.Values['HOST']           := edtHost.Text;
    sText.Values['IDWEBINTERFACE'] := dblkpInterface.KeyValue;
    if      rbADO.Checked then sText.Values['CONEXAO'] := '0'
    else if rbBDE.Checked then sText.Values['CONEXAO'] := '1';
    if      rbConnectionString.Checked then sText.Values['CONADO'] := '0'
    else if rbArqVinc.Checked          then sText.Values['CONADO'] := '1';
    sText.Values['CONNECTIONSTRING'] := edtConnectionString.Text;
    sText.Values['ARQVINC']          := edtArquivoVinculacao.Text;
    if   cbPreparaQuery.Checked then sText.Values['PREPARAQUERY'] := 'S'
    else                             sText.Values['PREPARAQUERY'] := 'N';
    sText.Values['COMANDOCONEXAO']   := StringReplace( memComandoConexao.Text, #13#10, '§', [rfReplaceAll] );

    CMCrypto.CMEncryptFileFromStringList( edtDiretorio.Text + 'AutoAtendimento.cfg',
     '360487D03EE2480CA5A16169E36B981C96941E0454F84257BA9FBF47686CA727', sText );

  finally
    sText.Free;
  end;

  Result := True;
end;

procedure TfrmConexao.FormDestroy(Sender: TObject);
begin
  inherited;
  CMCrypto.Free;
  WebInterface.Free;
end;

procedure TfrmConexao.edtIdWebInterfaceKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmConexao.dlgOpenDirSelectionChanged(Sender: TObject; Wnd: HWND;
  Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
begin
  inherited;
  sDirAux := Path;
end;

procedure TfrmConexao.rbConnectionStringClick(Sender: TObject);
begin
  inherited;
  pnlConnectionString.Visible := True;
  pnlArqVinc.Visible          := False;
end;

procedure TfrmConexao.rbArqVincClick(Sender: TObject);
begin
  inherited;
  pnlConnectionString.Visible := False;
  pnlArqVinc.Visible          := True;
end;

procedure TfrmConexao.spbPreencheConnectionStringClick(Sender: TObject);
begin
  inherited;
  edtConnectionString.Text := 'Provider=MSDAORA;Persist Security Info=True;User ID=:LOGIN;Password=:PASSWORD;Data Source=:HOST;';
end;

procedure TfrmConexao.spbArqVincClick(Sender: TObject);
begin
  inherited;
  dlgOpenFile.FileName := edtArquivoVinculacao.Text;
  if dlgOpenFile.Execute then
    edtArquivoVinculacao.Text := dlgOpenFile.FileName;
end;

procedure TfrmConexao.btnTesteClick(Sender: TObject);
begin
  inherited;

  if not ValidaConexao then
    exit;

  dbADOConnection.Connected := False;
  dbBDEConnection.Connected := False;

  try
    try

      if rbADO.Checked then
      begin
        if rbArqVinc.Checked then
          dbADOConnection.ConnectionString := 'FILE NAME=' + edtArquivoVinculacao.Text
        else
          dbADOConnection.ConnectionString := edtConnectionString.Text;
        dbADOConnection.Connected := True;
      end;

      if rbBDE.Checked then
      begin
        dbBDEConnection.Params.Values['USER NAME']   := edtLogin.Text;
        dbBDEConnection.Params.Values['PASSWORD']    := edtSenha.Text;
        dbBDEConnection.Params.Values['SERVER NAME'] := edtHost.Text;
        dbBDEConnection.Connected := True;
      end;

      ShowMessage( 'Conexão feita com sucesso.' );

    except
      On E : Exception do
        ShowMessage('A conexão com o banco de dados não foi possível. Erro: ' + E.Message );
    end;

  finally
    dbADOConnection.Connected := False;
    dbBDEConnection.Connected := False;
  end;
end;

procedure TfrmConexao.sbtnProcurarClick(Sender: TObject);
var
  sAux : string;
begin
  inherited;

  while True do
  begin
    dlgOpenDir.Directory := edtDiretorio.Text;
    if dlgOpenDir.Execute then
    begin
      sAux := trim( sDirAux );
      if sAux = '' then exit;

      if StrRight( sAux, 1 ) <> '\' then
        sAux := trim( sAux ) + '\';

      if FileExists( sAux + 'AutoAtendimento.cfg' ) then
      begin
        edtDiretorio.Text := sAux;
        LeDados;
        break;
      end;

      MessageDlg('Arquivo de configuração não encontrado na pasta especificada.', mtError, [mbOK], 0);

    end
    else
      break;
  end;
end;

procedure TfrmConexao.sbtnInserirClick(Sender: TObject);
var
  sAux : string;
begin
  inherited;
  dlgOpenDir.Directory := edtDiretorio.Text;
  if dlgOpenDir.Execute then
  begin
    sAux := trim( sDirAux );
    if sAux = '' then exit;

    if StrRight( sAux, 1 ) <> '\' then
      sAux := trim( sAux ) + '\';

    if FileExists( sAux + 'AutoAtendimento.cfg' ) then
      if MessageDlg('Já há um arquivo de configuração nesta pasta. Deseja sobrescrevê-lo?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

    LimpaTudo;
    
    edtDiretorio.Text := sAux;

    EstadoDaJanela( 3 );
  end
  else
    sbtnInserir.Down := False;
end;

procedure TfrmConexao.EstadoDaJanela(iEstado: integer);
begin
  if iEstado = 1 then
  begin
    sbtnInserir.Enabled       := True;
    sbtnAlterar.Enabled       := False;
    sbtnApagar.Enabled        := False;
    sbtnProcurar.Enabled      := True;
    btnTeste.Enabled          := False;
    bbtnConfirmar.Enabled     := False;
    bbtnCancelar.Enabled      := False;
    pnlFundo.Enabled          := False;
  end;
  if iEstado = 2 then
  begin
    sbtnInserir.Enabled       := True;
    sbtnAlterar.Enabled       := True;
    sbtnApagar.Enabled        := True;
    sbtnProcurar.Enabled      := True;
    btnTeste.Enabled          := True;
    bbtnConfirmar.Enabled     := False;
    bbtnCancelar.Enabled      := False;
    pnlFundo.Enabled          := False;
  end;
  if iEstado = 3 then
  begin
    sbtnInserir.Enabled       := False;
    sbtnAlterar.Enabled       := False;
    sbtnApagar.Enabled        := False;
    sbtnProcurar.Enabled      := False;
    btnTeste.Enabled          := False;
    bbtnConfirmar.Enabled     := True;
    bbtnCancelar.Enabled      := True;
    pnlFundo.Enabled          := True;
  end;
end;

procedure TfrmConexao.LimpaTudo;
begin
  edtDiretorio.Text := '';
  edtHost.Text := '';
  edtLogin.Text  := '';
  edtSenha.Text  := '';
  dblkpInterface.KeyValue := -1;
  rbADO.Checked  := True;
  rbBDE.Checked  := False;
  cbPreparaQuery.Checked := False;
  rbArqVinc.Checked := True;
  rbConnectionString.Checked := False;
  edtConnectionString.Text := '';
  edtArquivoVinculacao.Text := '';
  grpADO.Visible := True;
  grpBDE.Visible := False;
end;

procedure TfrmConexao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  EstadoDaJanela( 3 );
end;

procedure TfrmConexao.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirma exclusão do arquivo de configuração desta pasta?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    edtDiretorio.Text := trim( edtDiretorio.Text );

    if edtDiretorio.Text = '' then exit;

    if FileExists( edtDiretorio.Text + 'AutoAtendimento.cfg' ) then
    begin
      if DeleteFile( edtDiretorio.Text + 'AutoAtendimento.cfg' ) then
      begin
        LimpaTudo;
        EstadoDaJanela( 1 );
      end;
    end
    else
      MessageDlg('Arquivo de configuração não encontrado na pasta especificada.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmConexao.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmConexao.rbADOClick(Sender: TObject);
begin
  inherited;
  grpADO.Visible := True;
  grpBDE.Visible := False;
end;

procedure TfrmConexao.rbBDEClick(Sender: TObject);
begin
  inherited;
  grpADO.Visible := False;
  grpBDE.Visible := True;
end;

procedure TfrmConexao.spbCfgArqClick(Sender: TObject);
begin
  inherited;
  if not FileExists( edtArquivoVinculacao.Text ) then
  begin
    MessageDlg('Não foi possível encontrar o arquivo de vinculação de dados.', mtError, [mbOK], 0);
    exit;
  end;
  ShellExecute( Handle, 'Open', PChar( edtArquivoVinculacao.Text ), Nil, Nil, sw_shownormal );
end;

function TfrmConexao.ValidaConexao: boolean;
begin
  Result := False;

  if rbADO.Checked then
  begin
    Result := False;

    if rbArqVinc.Checked and ( edtArquivoVinculacao.Text = '' )  then
    begin
      ShowMessage( 'O arquivo de vinculação deve ser definido.' );
      edtArquivoVinculacao.SetFocus;
      exit;
    end;

    if rbConnectionString.Checked and ( edtConnectionString.Text = '' )  then
    begin
      ShowMessage( 'A "Connection String" deve ser definida.' );
      edtConnectionString.SetFocus;
      exit;
    end;

  end
  else
  begin

    if edtHost.Text = '' then
    begin
      ShowMessage( 'O campo "Host" deve ser preenchido.' );
      edtHost.SetFocus;
      exit;
    end;

    if edtLogin.Text = '' then
    begin
      ShowMessage( 'O campo "Login" deve ser preenchido.' );
      edtLogin.SetFocus;
      exit;
    end;

    if edtSenha.Text = '' then
    begin
      ShowMessage( 'O campo "Senha" deve ser preenchido.' );
      edtSenha.SetFocus;
      exit;
    end;

  end;

  Result := True;
end;

end.
