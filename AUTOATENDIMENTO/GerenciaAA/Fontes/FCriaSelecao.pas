unit FCriaSelecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, BfDialogs, BrowseFolder, uProcuraDir;

type
  TfrmCriaSelecao = class(TfrmOkCancelar)
    grpAtencao: TGroupBox;
    lblMsg: TLabel;
    lblTipoUsuario: TLabel;
    dlgOpenDir: TProcuraDirDlg;
    edtDiretorio: TEdit;
    spbAbreDir: TSpeedButton;
    procedure spbAbreDirClick(Sender: TObject);
    procedure dlgOpenDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    sDirAux : string;
  public
    { Public declarations }
  end;

var
  frmCriaSelecao: TfrmCriaSelecao;

implementation

{$R *.DFM}

procedure TfrmCriaSelecao.spbAbreDirClick(Sender: TObject);
begin
  inherited;
  dlgOpenDir.Directory := edtDiretorio.Text;
  if dlgOpenDir.Execute then
    edtDiretorio.Text := sDirAux;
end;

procedure TfrmCriaSelecao.dlgOpenDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sDirAux := Path;
end;

procedure TfrmCriaSelecao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim( edtDiretorio.Text ) = '' then
  begin
    ShowMessage('É necessário escolher o diretório dos arquivos HTML.');
    exit;
  end;

  ModalResult := mrOk;
end;

end.
