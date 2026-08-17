// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------
//******************************************************************************
// Data     : 06/10/2004
// AL_1
// Motivo   : Montagem do Lay out do arquivo
//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário para Importar Cotações de Ações vinda de Arquivo Texto
//             Predefinido .
// Form     .: FrmImportaCotacoes - Unit .: FImportaCotacoes
// Data     .: 15/03/1999
// Autor    .: Alexandre Ramos  **--> Serious Developer ..
//------------------------------------------------------------------
// AL_1
//Lay out do Arquivo TXT
//Campo            Posicao   Tamanho
//SIGLAACAOBOLSA : (1:10)    -> 10
//VLRABERTURA    : (11:30)   -> 20
//VLRFECHAMENTO  : (31:50)   -> 20
//VLRMAXIMA      : (51:70)   -> 20
//VLRMINIMA      : (71:90)   -> 20
//VLRMEDIA       : (91:110)  -> 20
//VOLNEGOCIADO   : (111:130) -> 20

unit FImportaCotacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook, ComCtrls, Mask,
  DBLookup, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, uSistema;

type
  TFrmImportaCotacoes = class(TfrmOkCancelar)
    Label1: TLabel;
    Edit1: TEdit;
    SB1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    QryCotacoes: TwwQuery;
    DsCotacoes: TwwDataSource;
    QryAux: TwwQuery;
    DsAux: TwwDataSource;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    DsBolsaValores: TwwDataSource;
    Label2: TLabel;
    DbLkcBolsa: TwwDBLookupCombo;
    Animate1: TAnimate;
    Label3: TLabel;
    DateEdit1: TCMDateTimePicker;
    Label4: TLabel;
    procedure SB1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImportaCotacoes: TFrmImportaCotacoes;

implementation

Uses UBibliotecaInvest, UMensErro;

Var
  wArquivoImportacao:TextFile;
  wLinha:String;

{$R *.DFM}


procedure TFrmImportaCotacoes.SB1Click(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then
    Edit1.Text := UpperCase(OpenDialog1.FileName);

end;

procedure TFrmImportaCotacoes.FormShow(Sender: TObject);
begin
  inherited;
  QryBolsaValores.Open;
end;

procedure TFrmImportaCotacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryBolsaValores.Close;
end;
//----------------------------------------------------------------
// Botao Confirmar
procedure TFrmImportaCotacoes.bbtnConfirmarClick(Sender: TObject);
begin
// Critica Dados
  If (DbLkcBolsa.Text  = '') Or (Edit1.Text   = '') Then Begin
    ShowMessage('Faltam Preencher Campos ...');
    DbLkcBolsa.SetFocus;
    Exit;
  End;
// Testa se Arquivo Especificado Existe
  If Not (FileExists(Edit1.Text)) Then Begin
    ShowMessage('Arquivo não Existe ou Inválido ...');
    Edit1.SetFocus;
    Exit;
  End;
// Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
  If Not VerificaFechamentoOperacao(DateEdit1.Text) Then Begin
    Exit;
  End;

// Tenta Abrir o Arquivo
  Try
// Seta Arquivo, a Variavel ...
    AssignFile(wArquivoImportacao, Edit1.Text);
// Abre Arquivo para Leitura
    Reset(wArquivoImportacao);
  Except
    ShowMessage('Arquivo Inválido ...');
    Exit;
  End;
// Testa se Arquivo esta Vazio
  If Eof(wArquivoImportacao) Then Begin
    ShowMessage('Arquivo está vazio ...');
    Edit1.SetFocus;
    Exit;
  End;
// Liga Animate
  FrmImportaCotacoes.Height := 290;
  FrmImportaCotacoes.Update;
  Label4.Visible  :=True;
  Label4.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;
// Inicia Processamento
  While Not Eof(wArquivoImportacao) Do Begin
// Lê a Linha
    Readln(wArquivoImportacao,wLinha);
// Verifica se Existe a Acao \\
// Caso Exista
    If FazQuery(QryAux,
      'SELECT IDACAO,IDEMISSOR,QTDELOTE ' +
      'FROM ACOESXBOLSA '+
      'WHERE IDBOLSAVALORES = '''+
      QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
      '      SIGLAACAOBOLSA = '''+Trim(Copy(wLinha,1,10))+'''') Then Begin;

// Pesquisa se Cotacao Já Existe
      If Not FazQuery(QryCotacoes,
        'SELECT IDACAO ' +
        'FROM COTACAOACAO '+
        'WHERE IDBOLSAVALORES = '''+
        QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
        '      DATACOTAACAO   = TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'') AND '+
        '      IDACAO         = '''+QryAux.FieldByName('IDACAO').AsString+'''') Then Begin;
// Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
        Try
// Executa Query
          ExecutaQuery(QryCotacoes,
            'INSERT INTO COTACAOACAO '                                    +
            '(IDBOLSAVALORES, IDEMISSOR, QTDELOTE, DATACOTAACAO, IDACAO, '+
            'VLRABERTURA, VLRFECHAMENTO, VLRMAXIMA, VLRMINIMA, '          +
            'VLRMEDIA, VOLNEGOCIADO ) VALUES '                            +
            '('''+QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''', '+
            ''''+QryAux.FieldByName('IDEMISSOR').AsString+''', ' +
            ''''+QryAux.FieldByName('QTDELOTE').AsString+''', '  +
            'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
            ''''+QryAux.FieldByName('IDACAO').AsString+''', '    +
            ''''+Trim(Copy(wLinha,11,20))+''', '    +
            ''''+Trim(Copy(wLinha,31,20))+''', '    +
            ''''+Trim(Copy(wLinha,51,20))+''', '    +
            ''''+Trim(Copy(wLinha,71,20))+''', '    +
            ''''+Trim(Copy(wLinha,91,20))+''', '    +
            ''''+Trim(Copy(wLinha,111,20))+''')'    );

        Except
          ShowMessage('Erro na inclusão de registro !');
        End;
      End Else Begin
// Caso Exista Atualiza Cotacao
        Try
// Executa Query
          ExecutaQuery(QryCotacoes,
            'UPDATE COTACAOACAO '+
            'SET QTDELOTE  = ''' +QryAux.FieldByName('QTDELOTE').AsString+''', '+
            'VLRABERTURA   = ''' +Trim(Copy(wLinha,11,20))+''', '   +
            'VLRFECHAMENTO = ''' +Trim(Copy(wLinha,31,20))+''', '   +
            'VLRMAXIMA     = ''' +Trim(Copy(wLinha,51,20))+''', '   +
            'VLRMINIMA     = ''' +Trim(Copy(wLinha,71,20))+''', '   +
            'VLRMEDIA      = ''' +Trim(Copy(wLinha,91,20))+''', '   +
            'VOLNEGOCIADO  = ''' +Trim(Copy(wLinha,111,20))+''''    +
            'WHERE IDBOLSAVALORES = '''+
              QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
            '      DATACOTAACAO   = TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'') AND '+
            '      IDACAO         = '''+QryAux.FieldByName('IDACAO').AsString+'''');
        Except
          ShowMessage('Erro na alteração do registro !');
        End;
      End;
    End;
  End;

  inherited;
// Fecha op Arquivo
  CloseFile(wArquivoImportacao);
// Desliga Animate
  Label4.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;
  FrmImportaCotacoes.Height := 220;

  MsgDlg('Importação OK!','Mensagem do Sistema',MtInformation,[MbOk],0);
end;

procedure TFrmImportaCotacoes.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Jéssica Lana SOL 109421 KINTANA 496332

end;

end.


