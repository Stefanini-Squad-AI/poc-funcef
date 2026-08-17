// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)     :  Jéssica Lana Nunes dos Santos
// Data         :  05/03/2009
// Pendência    : SOL 109421 KINTANA 496332
// Descricao    :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fRecebeRecadTXT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery;

type
  TfrmRecebeRecadTXT = class(TfrmOkCancelar)
    odArqImportar: TOpenDialog;
    qryPesquisa: TwwQuery;
    qryGrava: TwwQuery;
    qryAux: TwwQuery;
    Panel1: TPanel;
    Label1: TLabel;
    edtEndArquivo: TEdit;
    btnAbreDialogo: TButton;
    pnlFront: TPanel;
    btnImportarDados: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblMatricula: TLabel;
    lblNome: TLabel;
    lblDataCarta: TLabel;
    lblDatalimite: TLabel;
    lblDataRecebimento: TLabel;
    lblMensagem: TLabel;
    pnlResult: TPanel;
    memResult: TMemo;
    Label7: TLabel;
    Bevel1: TBevel;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    BtnVoltar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnAbreDialogoClick(Sender: TObject);
    procedure btnImportarDadosClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  tfArquivo   : TextFile;
  sLinha      : string;

  procedure TelaInicial;

  public
    { Public declarations }
  end;

var
  frmRecebeRecadTXT: TfrmRecebeRecadTXT;

implementation

uses uDataBase, fAguarde, Usistema;

{$R *.DFM}

procedure TfrmRecebeRecadTXT.FormShow(Sender: TObject);
begin
  inherited;
  pnlFront.BringToFront;
  TelaInicial;
end;

procedure TfrmRecebeRecadTXT.btnAbreDialogoClick(Sender: TObject);
begin
  inherited;
  if odArqImportar.Execute then
  begin
    AssignFile(tfArquivo, odArqImportar.FileName);
    edtEndArquivo.Text := odArqImportar.FileName;

    //  Abrindo arquivo para apenas para testar a primeira linha
    Reset(tfArquivo);
    Readln(tfArquivo, sLinha);

    TelaInicial;

    qryPesquisa.Close;
    qryPesquisa.ParamByName('MATRICULA').AsString := Copy(sLinha,1,10);
    qryPesquisa.Open;

    If qryPesquisa.IsEmpty Then Begin
      lblMensagem.Font.Color     := clRed;
      lblMensagem.Caption        := 'Não foi encontrado registro compatível. '+
                                    'Talvez o arquivo já tenha sido importado.';
     End Else Begin
      lblMatricula.Caption       := Copy(sLinha,1,10);
      lblNome.Caption            := qryPesquisa.FieldByName('NOME').AsString;
      lblDataCarta.Caption       := qryPesquisa.FieldByName('DATAEMISSAORECAD').AsString;
      lblDatalimite.Caption      := qryPesquisa.FieldByName('DATALIMITERECAD').AsString;
      lblDataRecebimento.Caption := Copy(sLinha,38,10);

      lblMensagem.Font.Color     := clBlue;
      lblMensagem.Caption        := 'Confira os dados acima e clique no botão abaixo '+
                                    'para começar a importação.';
      btnImportarDados.Enabled   := True;
    End;
    CloseFile(tfArquivo);
  end;
end;

procedure TfrmRecebeRecadTXT.btnImportarDadosClick(Sender: TObject);
Var
bOk    : Boolean;
iQuant : Integer;
begin
  inherited;
  frmAguarde.Mostra('Importando dados do TXT e baixando pendência de recadastramento.');

  pnlResult.BringToFront;
  memResult.Lines.Clear;
  memResult.Lines.Add('Processo iniciado em '+DateTimeToStr(now)+'.');

  Reset(tfArquivo);

  While not Eof(tfArquivo) do
   Begin
     ReadLn(tfArquivo, sLinha);

     qryAux.Close;
     qryAux.ParamByName('MATRICULA').AsString    := Copy(sLinha,1,10);
     qryAux.ParamByName('DATANASCIMENTO').AsDate :=   StrToDate(Copy(sLinha,25,2)+'/'+
                                                            Copy(sLinha,27,2)+'/'+
                                                            Copy(sLinha,29,4));
     qryAux.Open;

     iQuant := 0;

     While not qryAux.Eof do
      Begin
       StartTransacao;
       qryGrava.Close;
       Inc(iQuant);
       Try
        qryGrava.ParamByName('DATARECEB').AsDate   := StrToDate(Copy(sLinha,38,2)+'/'+
                                                                Copy(sLinha,41,2)+'/'+
                                                                Copy(sLinha,44,4));
        qryGrava.ParamByName('IDTITULAR').AsInteger   := qryAux.FieldByName('IDTITULAR').AsInteger;
        qryGrava.ParamByName('IDPESSOA').AsInteger    := qryAux.FieldByName('IDPESSOA').AsInteger;
        qryGrava.ParamByName('IDBENEFICIO').AsInteger := qryAux.FieldByName('IDBENEFICIO').AsInteger;

        qryGrava.ExecSQL;
        bOk := True;

        
        Try
          If Not Sistema.GravaLogOperacoes(Self.Caption) Then
            raise exception.Create('Erro ao gravar Log.')
        Except
        End;


        CommitTransacao;
       Except
        bOk := False;
        RollBackTransacao;
       End;
       qryAux.Next;
      End;
      If bOk
       Then memResult.Lines.Add('Matrícula '+Trim(Copy(sLinha,1,10))+
                               ' Titular '+Trim(qryAux.FieldByName('NOMETITULAR').AsString)+
                               ' Recebedor '+Trim(qryAux.FieldByName('NOMERECEBEDOR').AsString)+
                               ' Recebido '+Trim(IntToStr(iQuant))+' beneficiário(s) com sucesso.')
       Else memResult.Lines.Add('*** Erro no recebimento da Matrícula '+Trim(Copy(sLinha,1,10))+
                               ' Titular '+Trim(qryAux.FieldByName('NOMETITULAR').AsString)+
                               ' Recebedor '+Trim(qryAux.FieldByName('NOMERECEBEDOR').AsString)+
                               '. Verifique.');
   End;
  btnImportarDados.Enabled := False;

  CloseFile(tfArquivo);
  frmAguarde.Apaga;

  memResult.Lines.Add('Processo encerrado em '+DateTimeToStr(now)+'.');

  ShowMessage('Fim da importação dos dados.');
  TelaInicial;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TfrmRecebeRecadTXT.TelaInicial;
begin
  lblMatricula.Caption       := '';
  lblNome.Caption            := '';
  lblDataCarta.Caption       := '';
  lblDatalimite.Caption      := '';
  lblDataRecebimento.Caption := '';
  lblMensagem.Caption        := '';

  btnImportarDados.Enabled   := False;
end;

procedure TfrmRecebeRecadTXT.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  If savedlg.Execute
  Then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmRecebeRecadTXT.BtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlFront.BringToFront;
end;

procedure TfrmRecebeRecadTXT.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  odArqImportar.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  SaveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
