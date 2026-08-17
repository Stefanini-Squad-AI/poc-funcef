unit fPRelArqPagEletr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FileCtrl, checklst, Db, DBTables, Wwquery,
  Grids, DBGrids, usistema, dbasedados;

type
  TfrmPRelArqPagEletr = class(TfrmOkCancelar)
    FileListBox1: TFileListBox;
    GroupBox1: TGroupBox;
    ListaDir: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    GroupBox2: TGroupBox;
    ListaArquivo: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    bbtnPatroInverte: TBitBtn;
    bbtnPatroTodas: TBitBtn;
    qryAux: TwwQuery;
    procedure ListaDirClick(Sender: TObject);
    procedure FilterComboBox1Change(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    iTamValor,
    iColValor  :Integer;
    Function IdentArquivo(Arquivo: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmPRelArqPagEletr: TfrmPRelArqPagEletr;

implementation

Uses uMensErro, DRelGeral, fAguarde;

{$R *.DFM}

procedure TfrmPRelArqPagEletr.ListaDirClick(Sender: TObject);
var
   iCont : Integer;
begin
  inherited;
  // Preenche a listaarquivo com os arquivos vindo do FileListBox1.
  FileListBox1.Refresh;
  ListaArquivo.Items.Clear;
  for iCont := 0 to FileListBox1.Items.Count - 1 do
    ListaArquivo.Items.Add(FileListBox1.Items.Strings[iCont]);
end;

procedure TfrmPRelArqPagEletr.FilterComboBox1Change(Sender: TObject);
begin
  inherited;
  ListaDir.OnClick(Self);
end;

procedure TfrmPRelArqPagEletr.bbtnPatroTodasClick(Sender: TObject);
var iCont: Integer;
begin
  inherited;
  for iCont := 0 to ListaArquivo.Items.Count - 1 do
    ListaArquivo.Checked[iCont] := True;
end;

procedure TfrmPRelArqPagEletr.bbtnPatroInverteClick(Sender: TObject);
var
   iCont  : Integer;
begin
  inherited;
  for iCont := 0 to ListaArquivo.Items.Count - 1 do
    ListaArquivo.Checked[iCont] := Not ListaArquivo.Checked[iCont];
end;

procedure TfrmPRelArqPagEletr.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // Garante não disparar o relatório.
  ModalResult := mrNone;
end;

procedure TfrmPRelArqPagEletr.bbtnConfirmarClick(Sender: TObject);
var
   iCont,
   iNumLinhas      : Integer;
   dValor          : Double;
   Arquivo         : TextFile;
   sCaminho,
   sLinha          : String;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Processa a leitura dos arquivos.
  // 1º passo: percorrer o ListArquivo sabendo qual está marcado.
  // 2º passo: ler arquivo somando os valores.

  DtmRelGeral.qryArqPagEletr.Close;
  DtmRelGeral.qryArqPagEletr.Open;
  for iCont := 0 to ListaArquivo.Items.Count - 1 do
  begin
    if ListaArquivo.Checked[iCont] then
    begin
      // Se for raiz o componente colaca "\"
      if Copy(ListaDir.Directory,Length(ListaDir.Directory),1) = '\' then
        sCaminho := ListaDir.Directory+ListaArquivo.Items[iCont]
      else sCaminho := ListaDir.Directory+'\'+ListaArquivo.Items[iCont];
      AssignFile(Arquivo,sCaminho);
      if not IdentArquivo(ListaArquivo.Items[iCont]) then
      begin
        ModalResult := mrNone;
        Exit;
      end;
      Reset(Arquivo);
      iNumLinhas := 0;
      dValor     := 0;

      repeat
        ReadLn(Arquivo,sLinha);
        if not (sLinha[1] in ['0','9']) then
        begin
          try
            dValor := dValor + StrToFloat(Copy(sLinha,iColValor,iTamValor));
          except
          end;
          Inc(iNumLinhas);
        end;
      until eof(Arquivo);

      DtmRelGeral.qryArqPagEletr.Insert;
      DtmRelGeral.qryArqPagEletr.FieldByName('QUANTIDADE').AsInteger := iNumLinhas;
      DtmRelGeral.qryArqPagEletr.FieldByName('VALOR').AsFloat        := dValor/100;
      DtmRelGeral.qryArqPagEletr.FieldByName('QUEBRA').AsString      := 'A';
      if dValor <> 0 then
        DtmRelGeral.qryArqPagEletr.FieldByName('NOMEARQ').AsString     := ListaArquivo.Items[iCont]
      else DtmRelGeral.qryArqPagEletr.FieldByName('NOMEARQ').AsString  := ListaArquivo.Items[iCont]+' - (PROBLEMAS NO LAYOUT)';
      DtmRelGeral.qryArqPagEletr.Post;
    end;
  end;
  frmAguarde.Mostra('Aguarde... Montando Relatório!')
end;

Function TfrmPRelArqPagEletr.IdentArquivo(Arquivo: String):Boolean;
begin
  // identifica os parametros do arquivo
  Result := True;
  with qryAux do
  begin
    Sql.Clear;
    Sql.Add('SELECT TAMVALOR, COLVALOR FROM BANCOPORTFORMA ');
    Sql.Add('WHERE PREFIXOARQ LIKE '+
            UpperCase(QuotedStr(Copy(Arquivo,1,2)+'%'))+' ');
    Sql.Add('AND IDMODULO = 18');
    Open;
    if not IsEmpty then
    begin
      try
        iTamValor := FieldByName('TAMVALOR').AsInteger;
        iColValor := FieldByName('COLVALOR').AsInteger;
      except
        ShowMessage('Não há definição do Layout para o arquivo: '+Arquivo+','+#13+
                    'Defina o Layout no Cadastro de Banco Portador Forma.');
        frmAguarde.Apaga;
        Result := False;
        Exit;
      end;
    end
    else
    begin
      ShowMessage('Não há definição do Layout para o arquivo: '+Arquivo+','+#13+
                  'Defina o Layout no Cadastro de Banco Portador Forma.');
      frmAguarde.Apaga;
      Result := False;
      Exit;
    end;
    Close;
  end;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/06/2003 A 06/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR FILTRO DO CAMPO IDMODULO DA FOLHA NAS CONSULTAS DA BANCOPORTORMA.    |
| APAGAR O FORM FRMAGUARDE EM CASO DE ERRO NA EMISSÃO DO RELATÓRIO.            |
|                                                                              |
|------------------------------------------------------------------------------}

