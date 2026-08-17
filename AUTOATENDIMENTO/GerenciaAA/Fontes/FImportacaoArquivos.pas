unit FImportacaoArquivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  FFrameDadosExportados, FileCtrl, JCLStrings, Db, DBClient, uModuloGerenciaAA,
  uCMClientDataSet, dBaseDados, uSistema, uCtrlWebLogAlteracao, uCtrlWebTransfDados;

type
  TfrmImportacaoArquivos = class(TfrmOkCancelar)
    pnlTop: TPanel;
    edtDir: TEdit;
    btnOpenDir: TSpeedButton;
    lblDir: TLabel;
    dlgDir: TProcuraDirDlg;
    btnOk: TBitBtn;
    lblDadosImportados: TLabel;
    pnlDadosImportados: TPanel;
    lblTxtDtTransf: TLabel;
    lblDtTransf: TLabel;
    frameDadosExportados: TframeDadosExportados;
    cdsWebLogAlteracao: TCMClientDataSet;
    cdsWebTransfDados: TCMClientDataSet;
    cdsWebTransfDadosIDWEBTRANSFDADOS: TFloatField;
    cdsWebTransfDadosDTTRANSF: TDateTimeField;
    cdsWebTransfDadosSITUACAO: TStringField;
    cdsWebTransfDadosNOMEBASE: TStringField;
    lblTxtNomeBase: TLabel;
    lblNomeBase: TLabel;
    procedure btnOpenDirClick(Sender: TObject);
    procedure dlgDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    WebLogAlteracao : TCtrlWebLogAlteracao;
    WebTransfDados  : TCtrlWebTransfDados;

    sDirectory : String;

    procedure MsgErro ( sMsg : String );
    procedure Reset;    
  public
    { Public declarations }
  end;

var
  frmImportacaoArquivos: TfrmImportacaoArquivos;

implementation

{$R *.DFM}

{ TfrmImportacaoArquivos }

procedure TfrmImportacaoArquivos.MsgErro(sMsg: String);
begin
  if StrFind( 'KEY VIOLATION', StrUpper( sMsg ) ) > 0 then
    sMsg := 'Estes dados já foram importados.';

  ShowMessage( sMsg );
end;

procedure TfrmImportacaoArquivos.btnOpenDirClick(Sender: TObject);
begin
  inherited;
  sDirectory := edtDir.Text;
  if dlgDir.Execute then
    edtDir.Text := sDirectory;
end;

procedure TfrmImportacaoArquivos.dlgDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sDirectory := Path;
end;

procedure TfrmImportacaoArquivos.btnOkClick(Sender: TObject);
var
  sDir, sIdPessoaAnt : string;
begin
  inherited;

  sIdPessoaAnt := '';

  sDir := edtDir.Text;
  if StrRight( sDir, 1 ) <> '\' then sDir := sDir + '\';

  if not DirectoryExists( sDir ) then
  begin
    ShowMessage('Diretório não encontrado.');
    edtDir.SetFocus;
    exit;
  end;

  if not FileExists( sDir + 'WEBTRANSFDADOS.txt' ) then
  begin
    ShowMessage('Arquivo WEBTRANSFDADOS.txt não encontrado.');
    edtDir.SetFocus;
    exit;
  end;

  if not FileExists( sDir + 'WEBLOGALTERACAO.txt' ) then
  begin
    ShowMessage('Arquivo WEBLOGALTERACAO.txt não encontrado.');
    edtDir.SetFocus;
    exit;
  end;

  //Recupera os dados dos arquivos
  cdsWebLogAlteracao.LoadFromFile( sDir + 'WEBLOGALTERACAO.txt' );
  cdsWebTransfDados.LoadFromFile( sDir + 'WEBTRANSFDADOS.txt' );

  frameDadosExportados.cdsWebLogAlteracao_Local.Data := cdsWebLogAlteracao.Data;
  lblNomeBase.Caption := cdsWebTransfDadosNOMEBASE.AsString;
  lblDtTransf.Caption := FormatDateTime( 'dd/mm/yyyy hh:nn:ss', cdsWebTransfDadosDTTRANSF.AsDateTime );

  if not frameDadosExportados.cdsWebLogAlteracao_Local.IsEmpty then
  begin
    frameDadosExportados.cdsWebLogAlteracao_Local.First;
    frameDadosExportados.MostraDetalhes;
  end;
end;

procedure TfrmImportacaoArquivos.FormCreate(Sender: TObject);
begin
  inherited;
  WebLogAlteracao := TCtrlWebLogAlteracao.Create;
  WebLogAlteracao.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  WebLogAlteracao.CdsWebLogAlteracao := cdsWebLogAlteracao;

  WebTransfDados := TCtrlWebTransfDados.Create;
  WebTransfDados.InitializeAs( WebLogAlteracao );
  WebTransfDados.CdsWebTransfDados := cdsWebTransfDados;

  frameDadosExportados.PreparaDetalhes;
end;

procedure TfrmImportacaoArquivos.FormDestroy(Sender: TObject);
begin
  WebLogAlteracao.Free;
  WebTransfDados.Free;
  inherited;
end;

procedure TfrmImportacaoArquivos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmImportacaoArquivos.Reset;
begin
  edtDir.Text := '';
  frameDadosExportados.cdsWebLogAlteracao_Local.Close;
  cdsWebLogAlteracao.Close;
  cdsWebTransfDados.Close;
  frameDadosExportados.pgrProgresso.Position := 0;
  frameDadosExportados.PreparaDetalhes;
  lblNomeBase.Caption := '';
  lblDtTransf.Caption := '';
end;

procedure TfrmImportacaoArquivos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  frameDadosExportados.pgrProgresso.Position := 0;
  frameDadosExportados.pgrProgresso.Max      := 2;

  if WebLogAlteracao.GravaWebLogAlteracao then
  begin
    frameDadosExportados.pgrProgresso.StepIt;
    if WebTransfDados.GravaWebTransfDados then
    begin
      frameDadosExportados.pgrProgresso.StepIt;
      ShowMessage('Dados importados com sucesso.');
    end;
  end;
  Reset;
end;

end.
