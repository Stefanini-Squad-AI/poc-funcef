unit FExporta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, TB97, TB97Tlbr, ExtCtrls, ComCtrls, BfDialogs,
  BrowseFolder, uProcuraDir, Db, DBClient, uCMClientDataSet, JCLStrings, FileCtrl,
  DBTables, CMDatabase, uDatabase, uSistema, uCtrlWebLogAlteracao, uCtrlWebTransfDados;

type
  TfrmExporta = class(TForm)
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    pnlFundo: TPanel;
    pgcExportar: TPageControl;
    tabGravar: TTabSheet;
    tabBanco: TTabSheet;
    dlgDir: TProcuraDirDlg;
    lblDir: TLabel;
    edtDir: TEdit;
    btnOpenDir: TSpeedButton;
    lblHost: TLabel;
    edtHost: TEdit;
    edtLogin: TEdit;
    lblLogin: TLabel;
    edtSenha: TEdit;
    lblSenha: TLabel;
    dbExporta: TCMDatabase;
    sssExporta: TSession;
    pnlBottom: TPanel;
    pgrProgresso: TProgressBar;
    cdsWebLogAlteracao: TCMClientDataSet;
    cdsWebTransfDados: TCMClientDataSet;
    cdsWebTransfDadosIDWEBTRANSFDADOS: TFloatField;
    cdsWebTransfDadosDTTRANSF: TDateTimeField;
    cdsWebTransfDadosSITUACAO: TStringField;
    cdsWebTransfDadosNOMEBASE: TStringField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnOpenDirClick(Sender: TObject);
    procedure dlgDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    WebLogAlteracao : TCtrlWebLogAlteracao;
    WebTransfDados  : TCtrlWebTransfDados;

    sDirectory : String;

    procedure MsgErro ( sMsg : String );               
  public
    { Public declarations }
  end;

var
  frmExporta: TfrmExporta;

implementation

{$R *.DFM}

procedure TfrmExporta.bbtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExporta.btnOpenDirClick(Sender: TObject);
begin
  sDirectory := edtDir.Text;
  if dlgDir.Execute then
    edtDir.Text := sDirectory;
end;

procedure TfrmExporta.dlgDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  sDirectory := Path;
end;

procedure TfrmExporta.bbtnConfirmarClick(Sender: TObject);
var
  sDir : String;
begin
  pgrProgresso.Position := 0;

  //************************************************** Arquivos
  if pgcExportar.ActivePageIndex = 0 then
  begin
    if trim( edtDir.Text ) = '' then
    begin
      ShowMessage('O nome do diretório deve ser definido.');
      edtDir.SetFocus;
      exit;
    end;

    sDir := edtDir.Text;

    if StrRight( sDir, 1 ) <> '\' then
      sDir := sDir + '\';

    if ForceDirectories( sDir ) then
    begin
      cdsWebTransfDados.SaveToFile( sDir + 'WEBTRANSFDADOS.txt' );
      pgrProgresso.StepIt;
      cdsWebLogAlteracao.SaveToFile( sDir + 'WEBLOGALTERACAO.txt' );
      pgrProgresso.StepIt;

      ShowMessage('Arquivos salvos com sucesso.' + #13#10 +
                  'O número da transferência é ' +
                  cdsWebTransfDadosIDWEBTRANSFDADOS.AsString + '.' );
    end;
  end;



  //************************************************** Banco de dados
  if pgcExportar.ActivePageIndex = 1 then
  begin
    if trim( edtHost.Text ) = '' then
    begin
      ShowMessage('O nome do host deve ser definido.');
      edtHost.SetFocus;
      exit;
    end;

    if trim( edtLogin.Text ) = '' then
    begin
      ShowMessage('O login deve ser definido.');
      edtLogin.SetFocus;
      exit;
    end;

    if trim( edtSenha.Text ) = '' then
    begin
      ShowMessage('A senha deve ser preenchida.');
      edtSenha.SetFocus;
      exit;
    end;

    if dbExporta.Connected = False then
    begin
      dbExporta.Params.Values['USER NAME']   := edtLogin.Text;
      dbExporta.Params.Values['PASSWORD']    := edtSenha.Text;
      dbExporta.Params.Values['SERVER NAME'] := edtHost.Text;

      GeraDataBaseName( Self, dbExporta, True, sssExporta );

      dbExporta.Connected := True;

      edtHost.Enabled  := False;
      edtLogin.Enabled := False;
      edtSenha.Enabled := False;
    end;

    if WebTransfDados.GravaWebTransfDados then
    begin
      pgrProgresso.StepIt;
      if WebLogAlteracao.GravaWebLogAlteracao then
      begin
        pgrProgresso.StepIt;
        ShowMessage('Dados exportados com sucesso.' + #13#10 +
                    'O número da transferência é ' +
                    cdsWebTransfDadosIDWEBTRANSFDADOS.AsString + '.' );
      end;
    end;
  end;

  pgrProgresso.Position := 0;
  ModalResult := mrOk;
end;

procedure TfrmExporta.FormDestroy(Sender: TObject);
begin
  if dbExporta.Connected then dbExporta.Connected := False;

  WebLogAlteracao.Free;
  WebTransfDados.Free;

  inherited;
end;

procedure TfrmExporta.FormCreate(Sender: TObject);
begin
  WebLogAlteracao := TCtrlWebLogAlteracao.Create;
  WebLogAlteracao.Initialize( dbExporta, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  WebLogAlteracao.CdsWebLogAlteracao := cdsWebLogAlteracao;

  WebTransfDados := TCtrlWebTransfDados.Create;
  WebTransfDados.InitializeAs( WebLogAlteracao );
  WebTransfDados.CdsWebTransfDados := cdsWebTransfDados;

end;

procedure TfrmExporta.MsgErro(sMsg: String);
begin
  if StrFind( 'KEY VIOLATION', StrUpper( sMsg ) ) > 0 then
    sMsg := 'Estes dados já foram exportados.';
  ShowMessage( sMsg );
end;

end.
