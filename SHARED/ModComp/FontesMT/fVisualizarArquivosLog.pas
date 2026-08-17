unit fVisualizarArquivosLog;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CheckLst, ColorCheckListBox, ZipDir, ZipMstr, IvEMulti;

type
  TfrmVisualizarArquivosLog = class(TfrmSairAjuda)
    bbtnEMail: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    bbtnAbrirPasta: TBitBtn;
    chklstArquivosLog: TColorCheckListBox;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    ZipMaster: TZipMaster;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    Label3: TLabel;
    bbtnAtualizar: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnEMailClick(Sender: TObject);
    procedure bbtnAbrirPastaClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnAtualizarClick(Sender: TObject);
  private
    procedure CriarListaArquivos;
  end;

var
  frmVisualizarArquivosLog: TfrmVisualizarArquivosLog;

implementation

uses JclMapi, JclShell, JclFileUtils, uSistema, uCtrlFuncoesRH;

const
  TAM_NOME_ARQ = 29;

{$R *.dfm}

procedure TfrmVisualizarArquivosLog.FormCreate(Sender: TObject);
begin
  inherited;
  if not(DirectoryExists(FU.DirTempLog)) then
    CreateDir(FU.DirTempLog);

  CriarListaArquivos;
end;

procedure TfrmVisualizarArquivosLog.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstArquivosLog.Items.Count-1 do
    chklstArquivosLog.Checked[c] := true;
  chklstArquivosLog.Repaint;
end;

procedure TfrmVisualizarArquivosLog.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstArquivosLog.Items.Count-1 do
    chklstArquivosLog.Checked[c] := not(chklstArquivosLog.Checked[c]);
  chklstArquivosLog.Repaint;
end;

procedure TfrmVisualizarArquivosLog.bbtnEMailClick(Sender: TObject);
var
  c: integer;
  sArquivoLogZip: string;
  bChecou: boolean;
begin
  bChecou := false;
  for c:=0 to chklstArquivosLog.items.Count-1 do
    if (chklstArquivosLog.Checked[c]) then
    begin
      bChecou := true;
      break;
    end;

  if not(bChecou) then
  begin
    MessageDlg(('Pelo menos um arquivo deve ser marcado.'),
      mtInformation, [mbOK, mbHelp], 0);
    exit;
  end;

  sArquivoLogZip := FU.DirTempLog +'\Arquivos.zip';

  with (ZipMaster.FSpecArgs) do
  begin
    Clear;
    for c:=0 to chklstArquivosLog.items.Count-1 do
      if (chklstArquivosLog.Checked[c]) then
        Add(FU.DirTempLog +'\'+ Copy(chklstArquivosLog.Items[c],1,TAM_NOME_ARQ));
  end;
  ZipMaster.ZipFileName := sArquivoLogZip;
  ZipMaster.Add;

  JclSimpleSendMail(Sistema.EmailOnError, '',
  ('Arquivos de Log. Cliente: ') + Sistema.NomeEmpresa,
  ('Segue os arquivos de Log requisitados para análise.'),
    FU.DirTempLog +'\Arquivos.zip');

  if (FileExists(sArquivoLogZip)) then
    DeleteFile(sArquivoLogZip);
end;

procedure TfrmVisualizarArquivosLog.bbtnAbrirPastaClick(Sender: TObject);
begin
  //*ShellExecEx(FU.DirTempLog);

end;

procedure TfrmVisualizarArquivosLog.bbtnAtualizarClick(Sender: TObject);
begin
  CriarListaArquivos;
end;

procedure TfrmVisualizarArquivosLog.CriarListaArquivos;
var
  c: integer;
  Lista: TStringList;
begin
  chklstArquivosLog.Items.BeginUpdate;
  chklstArquivosLog.Items.Clear;
  Lista := TStringList.Create;
  BuildFileList(FU.DirTempLog + '\*.*', faArchive, Lista);
  try
    for c:=0 to Lista.Count-1 do
      chklstArquivosLog.Items.Add(Copy(Lista[c] +
        FU.Replicate(' ',TAM_NOME_ARQ),1,TAM_NOME_ARQ)+
        DateTimeToStr(FileDateToDateTime(FileAge(FU.DirTempLog + '\'+ Lista[c]))));
  finally
    Lista.Free;
  end;
  chklstArquivosLog.Items.EndUpdate;
end;

end.
