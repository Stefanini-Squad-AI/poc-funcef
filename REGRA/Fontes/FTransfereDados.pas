unit FTransfereDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Wwquery;

type
  TFrmTransfereDados = class(TForm)
    BatchMove: TBatchMove;
    TbDestino: TTable;
    DbDbDestino: TDatabase;
    DbDbFonte: TDatabase;
    GrpBxTarget: TGroupBox;
    EdTabelaDestino: TEdit;
    GrpBxSource: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtTransfer: TBitBtn;
    RdGrpOptions: TRadioGroup;
    BtConfirma: TBitBtn;
    BtCancela: TBitBtn;
    QrySource: TQuery;
    CbBancoFonte: TComboBox;
    CbBancoDestino: TComboBox;
    EdTabelaFonte: TComboBox;
    procedure BtTransferClick(Sender: TObject);
    procedure RdGrpOptionsClick(Sender: TObject);
    procedure BtConfirmaClick(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure CbBancoFonteExit(Sender: TObject);
    procedure EdTabelaFonteExit(Sender: TObject);
    procedure CbBancoDestinoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CbBancoFonteChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransfereDados: TFrmTransfereDados;

implementation

{$R *.DFM}

//---------------------------------------------
// Executa Transferencia
procedure TFrmTransfereDados.BtTransferClick(Sender: TObject);
begin
// Testa dados
  If (CbBancoFonte.Text = '') Or (EdTabelaFonte.Text = '') Or
     (CbBancoDestino.Text = '') Or (EdTabelaDestino.Text = '') Then Begin
    MessageDlg('Empty Parameters ',MtError,[MbOk],0);
    CbBancoFonte.SetFocus;
    Exit;
  End;


//******************************************************************************
// Configura Banco de Fonte e Connecta caso não esteja

// Testa se o Alias de Fonte é Valido
  If Not Session.IsAlias(CbBancoFonte.Text) Then Begin
    MessageDlg('Source Database does not exist !!',MtError,[MbOk],0);
    CbBancoFonte.SetFocus;
    Exit;
  End;

// Tenta Conectar
  If Not DbDbFonte.Connected Or (DbDbFonte.AliasName <> CbBancoFonte.Text)
  Then Begin
// Caso o Banco de dados Não seja SQL muda Transolation
    If Not DbDbFonte.IsSQLBased Then
      DbDbFonte.TransIsolation:=tiDirtyRead;
    DbDbFonte.Connected:=False;
    DbDbFonte.AliasName:=CbBancoFonte.Text;
    Try
      DbDbFonte.Connected :=True;
    Except
      MessageDlg('Unable to Connect to BDE Database Alias !!',MtError,[MbOk],0);
      CbBancoFonte.SetFocus;
      Exit;
    End;
  End;
// Abre Tabela de Fonte
  QrySource.Sql.Clear;
  QrySource.Sql.Add('SELECT * FROM '+EdTabelaFonte.Text);
  Try
    QrySource.Open;
  Except
    On E:Exception Do Begin
      MessageDlg('Source Table, does not exist !!' ,MtError,[MbOk],0);
      EdTabelaFonte.SetFocus;
      Exit;
    End;
  End;

//******************************************************************************
// Configura Banco de Destino e Connecta caso Não esteja

// Testa se o Alias de destino é Valido
  If Not Session.IsAlias(CbBancoDestino.Text) Then Begin
    MessageDlg('Target Database does not exist !!',MtError,[MbOk],0);
    CbBancoDestino.SetFocus;
    Exit;
  End;

// Tenta Conectar
  If Not DbDbDestino.Connected Then Begin
// Caso o Banco de dados Não seja SQL muda Transolation
    If Not DbDbDestino.IsSQLBased Then DbDbDestino.TransIsolation:=tiDirtyRead;
    DbDbDestino.Connected:=False;
    DbDbDestino.AliasName:=CbBancoDestino.Text;
    Try
      DbDbDestino.Connected :=True;
    Except
      MessageDlg('Enabled to Connect to BDE Database Alias !!',MtError,[MbOk],0);
      CbBancoDestino.SetFocus;
      Exit;
    End;
  End;
// Tenta Abrir o Tabela de Fonte
  Try
    TbDestino.Close;
    TbDestino.TableName:=EdTabelaDestino.Text;
    TbDestino.Open;
  Except
    On E:Exception Do Begin
      If RdGrpOptions.ItemIndex <> 3 Then Begin
        MessageDlg('Target Table, does not exist !!' ,MtError,[MbOk],0);
        EdTabelaFonte.SetFocus;
        Exit;
      End;
    End;
  End;
//-----------------------------------------
// Inicia Transação
  DbDbDestino.StartTransaction;
//-----------------------------------------
// Configura e executa o BatchMove
  Try
    BatchMove.Execute;
    BtConfirma.Enabled:=True;
    BtCancela.Enabled :=True;
    BtTransfer.Enabled:=False;
  Except
    On E:Exception Do Begin
      MessageDlg('Error Transfering Data, with Message :'+#13+E.Message,MtError,[MbOk],0);
      CbBancoFonte.SetFocus;
// Cancela a Transacao
      DbDbDestino.Rollback;
      Exit;
    End;
  End;
  BtConfirma.SetFocus;
end;

//------------------------------------
// Altera Opcoes do BatchMove
procedure TFrmTransfereDados.RdGrpOptionsClick(Sender: TObject);
begin
  Case RdGrpOptions.ItemIndex Of
    0: BatchMove.Mode:=batAppend;
    1: BatchMove.Mode:=batUpdate;
    2: BatchMove.Mode:=batAppendUpdate;
    3: BatchMove.Mode:=batCopy;
    4: BatchMove.Mode:=batDelete;
  End;
end;

//-----------------------------------------
// Confirma Transação
procedure TFrmTransfereDados.BtConfirmaClick(Sender: TObject);
begin
  DbDbDestino.Commit;
  BtConfirma.Enabled:=False;
  BtCancela.Enabled :=False;
  BtTransfer.Enabled:=True;
end;

//-----------------------------------------
// Cancela Transação
procedure TFrmTransfereDados.BtCancelaClick(Sender: TObject);
begin
// Cancela a Transacao
  DbDbDestino.Rollback;

  BtConfirma.Enabled:=False;
  BtCancela.Enabled :=False;
  BtTransfer.Enabled:=True;
end;

//-----------------------------------------
// Desconecta Banco de Dados
procedure TFrmTransfereDados.CbBancoFonteExit(Sender: TObject);
begin
// Caso Altere o Banco Desconecta
  If DbDbFonte.Connected Then Begin
    DbDbFonte.Connected:=False;
  End;

end;

procedure TFrmTransfereDados.EdTabelaFonteExit(Sender: TObject);
begin
// Preenche Texto do Destino
  EdTabelaDestino.Text:=EdTabelaFonte.Text;
end;



procedure TFrmTransfereDados.CbBancoDestinoExit(Sender: TObject);
begin
// Caso Altere o Banco Desconecta
  If DbDbDestino.Connected Then Begin
    DbDbDestino.Connected:=False;
  End;
end;

procedure TFrmTransfereDados.FormShow(Sender: TObject);
begin
// Popula o Combo dos Bancos
  Session.GetAliasNames(CbBancoFonte.Items);
  Session.GetAliasNames(CbBancoDestino.Items);
end;

procedure TFrmTransfereDados.CbBancoFonteChange(Sender: TObject);
begin
// Testa se Banco de Destino é Valido
  If Not Session.IsAlias(CbBancoDestino.Text) Then Begin
    MessageDlg('Source Database does not exist !!',MtError,[MbOk],0);
    CbBancoDestino.SetFocus;
    Exit;
  End;

// Tenta Conectar com Banco Fonte
  If Not (DbDbFonte.Connected) Or (DbDbFonte.AliasName <> CbBancoFonte.Text)
  Then Begin
// Caso o Banco de dados Não seja SQL muda Transolation
    If Not DbDbFonte.IsSQLBased Then
      DbDbFonte.TransIsolation:=tiDirtyRead;
    DbDbFonte.Connected:=False;
    DbDbFonte.AliasName:=CbBancoFonte.Text;
    Try
      DbDbFonte.Connected :=True;
    Except
      MessageDlg('Unable to Connect to BDE Database Alias !!',MtError,[MbOk],0);
      CbBancoFonte.SetFocus;
      Exit;
    End;
  End;
// Pega Tabelas e Mostra no Combo de Tabelas Fonte
  DbDbFonte.Session.GetTableNames(DbDbFonte.DataBaseName,'',False,False,EdTabelaFonte.Items);
end;

end.
