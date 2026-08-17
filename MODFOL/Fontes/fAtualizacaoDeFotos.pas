unit fAtualizacaoDeFotos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FileCtrl, DBTables, Db, DBClient, uCmSqlParams,
  Grids, DBGrids, Wwquery, Wwdatsrc, CMSQLScript, MontaSelect, ComCtrls,
  Wwdbigrd, Wwdbgrid;

type
  TfrmAtualizacaoDeFotos = class(TfrmSairAjuda)
    LblArquivos: TLabel;
    lblQtdeArquivos: TLabel;
    LblidFuncionario: TLabel;
    LblQtdfunciorios: TLabel;
    DrbDrive: TDriveComboBox;
    DlbPastas: TDirectoryListBox;
    FlbArquivos: TFileListBox;
    bbtnExecutar: TBitBtn;
    QryPessoa: TQuery;
    imgDoc: TImage;
    qryImagens: TQuery;
    grdFiles: TwwDBGrid;
    cdsFiles: TClientDataSet;
    dsFiles: TDataSource;
    cdsFilesArquivo: TStringField;
    cdsFilesErro: TBooleanField;
    cdsFilesLocal: TStringField;
    Function RemoveExt(pStrValue: String): String;
    procedure DrbDriveChange(Sender: TObject);
    procedure DlbPastasChange(Sender: TObject);
    procedure bbtnExecutarClick(Sender: TObject);
    procedure cdsFilesAfterScroll(DataSet: TDataSet);
    procedure grdFilesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmAtualizacaoDeFotos: TfrmAtualizacaoDeFotos;
  Cor : String;

implementation

Uses uCMFileUtils;

{$R *.DFM}

Function TfrmAtualizacaoDeFotos.RemoveExt(pStrValue: String): String;
Var
   i: integer;
Begin
   i := Pos('.', pStrValue);
   If i <> 0 Then
      result := copy(pStrValue, 1, i - 1)
   Else
      result := pStrValue;
End;


procedure TfrmAtualizacaoDeFotos.DrbDriveChange(Sender: TObject);
begin
  inherited;
  DlbPastas.Drive := DrbDrive.Drive;
end;

procedure TfrmAtualizacaoDeFotos.DlbPastasChange(Sender: TObject);
var
  x: integer;
begin
  inherited;
  cdsFiles.EmptyDataSet;
  for x := 0 to FlbArquivos.Items.Count - 1 do
  begin
    cdsFiles.Append;
    cdsFiles.FieldByName('Arquivo').AsString := FlbArquivos.Items.Strings[x];
    cdsFiles.FieldByName('Erro').AsBoolean   := False;
    cdsFiles.FieldByName('Local').AsString   := FlbArquivos.Directory + '\' + FlbArquivos.Items.Strings[x];
    cdsFiles.Post;
  end;

  lblQtdeArquivos.Caption := inttostr(cdsFiles.RecordCount);
end;

procedure TfrmAtualizacaoDeFotos.bbtnExecutarClick(Sender: TObject);
var
  x : integer;
  sFileName, sNewFile: String;
  bDeleteFile: Boolean;
  idImagem, idPessoa: Integer;
begin
  inherited;

  cdsFiles.First;
  while not(cdsFiles.Eof) do
  Begin

    idPessoa := 0;
    idImagem := 0;

    sFileName := cdsFiles.FieldByName('Local').AsString;

    If (Pos('.jpg', LowerCase(sFileName)) <> 0) Or
       (Pos('.jpeg', LowerCase(sFileName)) <> 0) Then
    Begin
       sNewFile := cmGetTempPath + IntToStr(GetTickCount) + '.bmp';
       CMJPegToBitmap(sFileName, sNewFile);
       sFileName := sNewFile;
       bDeleteFile := True;
    End;

    imgDoc.Picture.LoadFromFile(sFileName); //Assign(FieldByName('Imagem'));
    imgDoc.Refresh;

    QryPessoa.Close;
    QryPessoa.Prepare;
    QryPessoa.ParamByName('matricula').asString := RemoveExt(cdsFiles.FieldByName('Arquivo').AsString);
    QryPessoa.Open;

    idImagem := QryPessoa.FieldByName('idimagem').AsInteger;
    idPessoa := QryPessoa.FieldByName('idPessoa').AsInteger;

    if idPessoa = 0 Then
    Begin
      cdsFiles.Edit;
      cdsFiles.FieldByName('Erro').AsBoolean := True;
      cdsFiles.Post
    end
    else
    Begin
      cdsFiles.Edit;
      cdsFiles.FieldByName('Erro').AsBoolean := False;
      cdsFiles.Post;

      if idImagem > 0 then
      begin
        qryImagens.Close;
        qryImagens.SQL.Text := 'update imagens set imagem = :imagem where idimagem = :idimagem';
        qryImagens.ParamByName('idimagem').AsInteger := idImagem;
        qryImagens.ParamByName('imagem').LoadFromFile(sFileName, ftBlob);
        qryImagens.ExecSQL;
      end
      else
      begin
        // Obtendo o novo idImagem
        qryImagens.Close;
        qryImagens.SQL.Text := 'select SEQIMAGENS.NEXTVAL from dual';
        qryImagens.Open;
        idImagem := qryImagens.Fields[0].AsInteger;

        // Inserindo a Imagem
        qryImagens.Close;
        qryImagens.SQL.Text := 'insert into imagens(idimagem, imagem, descrimagem) values (:idimagem, :imagem, :descrimagem)';
        qryImagens.ParamByName('idimagem').AsInteger := idImagem;
        qryImagens.ParamByName('imagem').LoadFromFile(sFileName, ftBlob);
        qryImagens.ParamByName('descrimagem').AsString := 'Foto';
        qryImagens.ExecSQL;

        // Assosciar a Pessoa
        qryImagens.Close;
        qryImagens.SQL.Text := 'update pessoa set idimagem = :idimagem where idpessoa = :idpessoa';
        qryImagens.ParamByName('idpessoa').AsInteger := idpessoa;
        qryImagens.ParamByName('idimagem').AsInteger := idimagem;
        qryImagens.ExecSQL;
      end;

    end;

    If bDeleteFile Then DeleteFile(sFileName);

    cdsFiles.Next;
  end;

  cdsFiles.First;

end;

procedure TfrmAtualizacaoDeFotos.cdsFilesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if cdsFiles.FieldByName('Local').AsString <> '' then
  begin
    imgDoc.Picture.LoadFromFile(cdsFiles.FieldByName('Local').AsString);
    LblQtdfunciorios.Caption := RemoveExt(cdsFiles.FieldByName('Arquivo').AsString);
  end;
end;

procedure TfrmAtualizacaoDeFotos.grdFilesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if cdsFiles.FieldByName('Erro').AsBoolean then
    ABrush.Color := clRed;
end;

end.



