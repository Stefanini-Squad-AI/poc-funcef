unit FQryPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmQryPess = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryPessoal: TwwQuery;
    dbgrQuery: TwwDBGrid;
    rbtnSalvar: TBitBtn;
    opdlgDialogo: TOpenDialog;
    memoQuery: TMemo;
    Splitter1: TSplitter;
    rbtnAbrir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    svdlgDialogo: TSaveDialog;
    lblNumReg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbtnSalvarClick(Sender: TObject);
    procedure rbtnAbrirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQryPess: TfrmQryPess;

implementation

uses uMensErro, fAguarde, uFuncoesUteis;

{$R *.DFM}

procedure TfrmQryPess.FormCreate(Sender: TObject);
begin
  inherited;
  memoQuery.Text := '';
end;

procedure TfrmQryPess.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
    bbtnConfirmarClick(Sender);
end;

procedure TfrmQryPess.rbtnSalvarClick(Sender: TObject);
var
  wAcerto, c: integer;
  Lista: TStringList;
  sLinha, sLinhaAux: string;
  OutPutFile: TextFile;
  Marca: TBookMark;
{->}procedure Finalizar;
    begin
      CloseFile(OutPutFile);
      Lista.Free;
      qryPessoal.GotoBookmark(Marca);
      qryPessoal.FreeBookmark(Marca);
      qryPessoal.EnableControls;
{->}end;
begin
  if (qryPessoal.IsEmpty) then
  begin
    MessageDlg('Resultado vazio.', mtError, [mbOk, mbHelp], 0);
    exit;
  end;

  if (svdlgDialogo.Execute) then
  begin
    sLinha := '';
    sLinhaAux := '';
    Lista := TStringList.Create;

    // Gerar a sLinha de Cabecalho
    for c:=0 To qryPessoal.FieldCount-1 do
    begin
      if (Length(qryPessoal.Fields[c].DisplayName) >= qryPessoal.Fields[c].DisplayWidth) then
        wAcerto := 4
      else
        wAcerto := Trunc(qryPessoal.Fields[c].DisplayWidth -
          Length(qryPessoal.Fields[c].DisplayName)) + 2;

      if not(qryPessoal.Fields[c].DataType in ([ftBlob, ftMemo])) then // Se não for BLOB...
      begin
        sLinha := sLinha + qryPessoal.Fields[c].DisplayName + Replicate(' ', wAcerto);
        sLinhaAux := sLinhaAux + Replicate('-', Length(qryPessoal.Fields[c].DisplayName)) +
          Replicate(' ', wAcerto);
      end;
    end;
    Lista.Add(sLinha);
    Lista.Add(sLinhaAux);    

    // Gerar as linhas com os valores dos campos
    qryPessoal.DisableControls;
    Marca := qryPessoal.GetBookmark;
    qryPessoal.First;
    while not(qryPessoal.EOF) do
    begin
      sLinha := '';
      for c:=0 to qryPessoal.FieldCount-1 do
      begin
        // Calcula tamanho Ate fim do Campo
        if (Length(qryPessoal.Fields[c].DisplayName) >= qryPessoal.Fields[c].DisplayWidth) then
          wAcerto := Trunc(Length(qryPessoal.Fields[c].DisplayName) -
            Length(qryPessoal.Fields[c].asString)) + 4
        else
          wAcerto := Trunc(qryPessoal.Fields[c].DisplayWidth -
            Length(qryPessoal.Fields[c].asString)) + 2;

        if not(qryPessoal.Fields[c].DataType in ([ftBlob,ftMemo])) then // Se não for BLOB...
          sLinha := sLinha + qryPessoal.Fields[c].asString + Replicate(' ', wAcerto);
      end;
      Lista.Add(sLinha);
      qryPessoal.Next;
    end;

    // Gravação do arquivo de saída
    try
      AssignFile(OutPutFile, svdlgDialogo.FileName);

      // Tenta Abrir o Arquivo para Gravacao
      try
        ReWrite(OutPutFile);
      except
        Finalizar;
        MsgDlg('Não consigo criar o arquivo '+ExtractFileName(svdlgDialogo.FileName)+'.',
          'Erro', mtError, [mbOk, mbHelp], 0);
        exit;
      end;

      // Inserir as linhas de resultado no arquivo
      for c:=0 to Lista.Count-1 do
        WriteLn(OutPutFile, Lista.Strings[c]);

      Finalizar;
    except
      Finalizar;
      MsgDlg('Não escrever no arquivo '+ExtractFileName(svdlgDialogo.FileName)+'.',
        'Erro', mtError, [mbOk, mbHelp], 0);
    end;
  end;
end;

procedure TfrmQryPess.rbtnAbrirClick(Sender: TObject);
begin
  inherited;
  if (opdlgDialogo.Execute) then
    memoQuery.Lines.LoadFromFile(opdlgDialogo.FileName);
end;

procedure TfrmQryPess.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Min;
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra ('Executando Consulta ...');
  frmAguarde.UpDate;

  qryPessoal.Close;
  qryPessoal.SQL.Clear;
  qryPessoal.SQL.Add(memoQuery.Text);
  try
    qryPessoal.Open;
  except
    MsgDlg('Erro ao processar a Consulta !','Erro',mtError,[mbOk,mbHelp],0);
  end;

  if not(qryPessoal.IsEmpty) then
  begin
    qryPessoal.Last; qryPessoal.First;
    lblNumReg.Caption := 'Num. Reg.: ' +IntToStr(qryPessoal.RecordCount);
  end
  else
    lblNumReg.Caption := 'Num. Reg.: 0';
    
  frmAguarde.Apaga;
end;

end.
