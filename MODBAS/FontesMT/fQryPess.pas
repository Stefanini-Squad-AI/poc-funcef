unit fQryPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, Wwdatsrc, Wwdbigrd, Wwdbgrid,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmQryPess = class(TfrmSairAjuda)
    dbgrQuery: TwwDBGrid;
    opdlgDialogo: TOpenDialog;
    memoQuery: TMemo;
    Splitter1: TSplitter;
    svdlgDialogo: TSaveDialog;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    bbtnExecutar: TBitBtn;
    rbtnSalvar: TBitBtn;
    rbtnAbrir: TBitBtn;
    dsPessoal: TwwDataSource;
    CdsPessoal: TCMClientDataSet;
    CMSqlPessoal: TCMSqlParams;
    pnlNumReg: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure rbtnSalvarClick(Sender: TObject);
    procedure rbtnAbrirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbtnExecutarClick(Sender: TObject);
  end;

var
  frmQryPess: TfrmQryPess;

implementation

uses uMensErro, fAguarde, uCtrlFuncoesRH;

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
    bbtnExecutarClick(Sender);
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
      CdsPessoal.GotoBookmark(Marca);
      CdsPessoal.FreeBookmark(Marca);
      CdsPessoal.EnableControls;
{->}end;
begin
  if (CdsPessoal.IsEmpty) then
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
    for c:=0 To CdsPessoal.FieldCount-1 do
    begin
      if (Length(CdsPessoal.Fields[c].DisplayName) >= CdsPessoal.Fields[c].DisplayWidth) then
        wAcerto := 4
      else
        wAcerto := Trunc(CdsPessoal.Fields[c].DisplayWidth -
          Length(CdsPessoal.Fields[c].DisplayName)) + 2;

      if not(CdsPessoal.Fields[c].DataType in ([ftBlob, ftMemo])) then // Se não for BLOB...
      begin
        sLinha := sLinha + CdsPessoal.Fields[c].DisplayName + FU.Replicate(' ', wAcerto);
        sLinhaAux := sLinhaAux + FU.Replicate('-', Length(CdsPessoal.Fields[c].DisplayName)) +
          FU.Replicate(' ', wAcerto);
      end;
    end;
    Lista.Add(sLinha);
    Lista.Add(sLinhaAux);    

    // Gerar as linhas com os valores dos campos
    CdsPessoal.DisableControls;
    Marca := CdsPessoal.GetBookmark;
    CdsPessoal.First;
    while not(CdsPessoal.EOF) do
    begin
      sLinha := '';
      for c:=0 to CdsPessoal.FieldCount-1 do
      begin
        // Calcula tamanho Ate fim do Campo
        if (Length(CdsPessoal.Fields[c].DisplayName) >= CdsPessoal.Fields[c].DisplayWidth) then
          wAcerto := Trunc(Length(CdsPessoal.Fields[c].DisplayName) -
            Length(CdsPessoal.Fields[c].asString)) + 4
        else
          wAcerto := Trunc(CdsPessoal.Fields[c].DisplayWidth -
            Length(CdsPessoal.Fields[c].asString)) + 2;

        if not(CdsPessoal.Fields[c].DataType in ([ftBlob,ftMemo])) then // Se não for BLOB...
          sLinha := sLinha + CdsPessoal.Fields[c].asString + FU.Replicate(' ', wAcerto);
      end;
      Lista.Add(sLinha);
      CdsPessoal.Next;
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
  if (opdlgDialogo.Execute) then
    memoQuery.Lines.LoadFromFile(opdlgDialogo.FileName);
end;

procedure TfrmQryPess.bbtnExecutarClick(Sender: TObject);
begin
  frmAguarde.Pos := frmAguarde.Min;
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Executando Consulta ...');
  frmAguarde.UpDate;

  CdsPessoal.Close;
  CMSqlPessoal.SQL.Clear;
  CMSqlPessoal.SQL.Add(memoQuery.Text);
  try
    CMSqlPessoal.Open;
  except
    MsgDlg('Erro ao processar a Consulta.', 'Erro', mtError, [mbOk,mbHelp], 0);
  end;

  if not(CdsPessoal.IsEmpty) then
  begin
    CdsPessoal.Last;
    CdsPessoal.First;
    pnlNumReg.Caption := 'Num. Reg.: ' +IntToStr(CdsPessoal.RecordCount);
  end
  else
    pnlNumReg.Caption := 'Num. Reg.: 0';

  frmAguarde.Apaga;
end;

end.
