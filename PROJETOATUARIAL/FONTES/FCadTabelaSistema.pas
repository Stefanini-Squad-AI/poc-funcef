{===============================================================================
Unit    :  FCadTabelaSistema
Form    :  frmCadTabelaSistema

Autor   : Paulo André M. de Carvalho
Empresa : Fórmula Informática Ltda.

Data    : 13/05/1999

Objetivo: Permite a importação da estrutura das tabelas diretamente do banco
          e a atualização de atributos adicionais para viabilizar as rotinas
          de enquadramento e de importação de arquivos Texto.

Propriedades Publicadas:

Métodos Públicos:


Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
================================================================================}
unit FCadTabelaSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Mask, ComCtrls, DBTables, Wwquery,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmCadTabelaSistema = class(TfrmCadastro)
    Label5: TLabel;
    DBEdtNoTabela: TDBEdit;
    Label6: TLabel;
    DBEdtSqAtualizacao: TDBEdit;
    BtBtnImportar: TBitBtn;
    qryAuxLe: TQuery;
    qryAuxAtualiza: TQuery;
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryDetalhe: TwwQuery;
    dsDetalhe: TwwDataSource;
    UpdtSQLDetalhe: TUpdateSQL;
    qryGrupo: TwwQuery;
    dsGrupo: TwwDataSource;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    PnlDetalhe: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DBEdtNomeCampo: TDBEdit;
    DBEdtDescrCampo: TDBEdit;
    DBRdGrpTipoAtributo: TDBRadioGroup;
    GrpBxTamanho: TGroupBox;
    DBEdit1: TDBEdit;
    DBRdGrpObrigatorio: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBLkpCmbBxGrupoDado: TDBLookupComboBox;
    GrpBxOrdem: TGroupBox;
    DBEdit2: TDBEdit;
    DBEdtTabLookup: TDBEdit;
    DBEdtTabAtribLookup: TDBEdit;
    DbGrdDet: TwwDBGrid;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    TbShtPK: TTabSheet;
    TbShtFK: TTabSheet;
    qryFK: TwwQuery;
    qryPk: TwwQuery;
    dsPk: TwwDataSource;
    dsFk: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    MontaSelect: TMontaSelect;
    QryAtualizaConstraints: TQuery;
    QryExcluiConstraints: TQuery;
    qryPrincipalNO_TABELA: TStringField;
    qryPrincipalSQ_ATUALIZACAO: TFloatField;
    qryDetalheNO_TABELA: TStringField;
    qryDetalheNO_ATRIBUTO_TABELA: TStringField;
    qryDetalheDS_ATRIBUTO_TABELA: TStringField;
    qryDetalheTP_ATRIBUTO: TStringField;
    qryDetalheNR_TAM_ATRIBUTO_TABELA: TFloatField;
    qryDetalheIR_MANDATORIO: TStringField;
    qryDetalheIR_CARGA_OBRIGATORIA: TStringField;
    qryDetalheNR_ORDEM: TFloatField;
    qryDetalheNO_TABELA_LOOKUP: TStringField;
    qryDetalheNO_ATRIBUTO_TABELA_LOOKUP: TStringField;
    qryDetalheCD_GRUPO: TFloatField;
    qryGrupoCD_GRUPO: TFloatField;
    qryGrupoNO_GRUPO: TStringField;
    qryGrupoNR_ORDEM: TFloatField;
    qryPkNO_TABELA: TStringField;
    qryPkNO_ATRIBUTO_TABELA: TStringField;
    qryPkNO_PK_TABELA: TStringField;
    qryPkNR_ORDEM: TFloatField;
    qryFKNO_TABELA: TStringField;
    qryFKNO_ATRIBUTO_TABELA: TStringField;
    qryFKNO_TABELA_FK: TStringField;
    qryFKNO_ATRIBUTO_TABELA_FK: TStringField;
    qryFKNO_FK_TABELA: TStringField;
    qryFKNR_ORDEM: TFloatField;
    procedure BtBtnImportarClick(Sender: TObject);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure qryPrincipalAfterDelete(DataSet: TDataSet);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryPrincipalUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure qryDetalheAfterPost(DataSet: TDataSet);
    procedure qryDetalheBeforePost(DataSet: TDataSet);
    procedure qryDetalheAfterDelete(DataSet: TDataSet);
    procedure qryDetalheUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DBLkpCmbBxGrupoDadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    WidReg : String;
    Function ExcluiEstrutura     : Boolean; // Exclui a estrutura de tabelas carregadas
    Function ExcluiTabela ( Tabela : String ) : Boolean; // Exclui dados de uma tabela específica
    Function ImportaTabelas      : Boolean; // Importa a relação de tabelas - FI_TABELA
    Function ImportaAtribTabelas : Boolean; // Importa os atributos das tabelas e suas características - FI_ATRIBUTO_TABELA
    Function ImportaPKTabelas    : Boolean; // Importa as chaves primárias das tabelas - FI_PK_TABELA
    Function ImportaFKTabelas    : Boolean; // Importa as chasves estrangeiras das tabelas - FI_FK_TABELA
    Procedure SetDetalhe;
  public
    { Public declarations }
  end;

function CtrlDown : Boolean;
function ShiftDown : Boolean;

var
  frmCadTabelaSistema: TfrmCadTabelaSistema;
  const wCreator = 'CM';

implementation


uses uImportarEstruturaBanco, FAnimacao;

{$R *.DFM}

procedure TfrmCadTabelaSistema.BtBtnImportarClick(Sender: TObject);
begin
  if MessageDlg('Este procedimento efetuará a importação da estrutura das tabelas a partir do catálogo do banco de dados corrente. Deseja continuar?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     Exit;

  //-- Cria Form de Animação
  Application.CreateForm(TfrmAnimacao, frmAnimacao);
  frmAnimacao.SetAnimacao ('Preparando para exclusão...',0,True,True,aviDeleteFile);

  QryAtualizaConstraints.ExecSQL;
  QryExcluiConstraints.ExecSQL;

  //Exclui estrutura do banco de dados carregada
  If not ExcluiEstrutura Then
     Begin
       ShowMessage ('Erro no processo de exlusão da estrutura do banco. Impossível continuar');
       Exit;
     End;

  //Importa Tabelas
  If not ImportaTabelas Then
     Begin
       ShowMessage ('Erro no processo de importação das tabelas. Impossível continuar');
       Exit;
     End;

  //Importa Atributos das Tabelas
  If not ImportaAtribTabelas Then
     Begin
       ShowMessage ('Erro no processo de importação dos atributos das tabelas. Impossível continuar');
       Exit;
     End;

  //Importa PKs das Tabelas
  If not ImportaPKTabelas Then
     Begin
       ShowMessage ('Erro no processo de importação das PKs das tabelas. Impossível continuar');
       Exit;
     End;

  //Importa Fks das Tabelas
  If not ImportaFKTabelas Then
     Begin
       ShowMessage ('Erro no processo de importação das FKs das tabelas. Impossível continuar');
       Exit;
     End;

  frmAnimacao.Close;
  frmAnimacao.Free;

  ShowMessage ('Importação efetuada com sucesso');      
end;


//--------------------------------------------------------------------
//-- ExcluiEstrutura
//----------------------------------------------------------------------//
Function TfrmCadTabelaSistema.ExcluiEstrutura : Boolean;
Begin

  Result := False;

  // Exclui dados FI_FK_TABELA
  If Not ExcluiTabela ('FI_FK_TABELA') Then
     Exit;

  // Exclui dados FI_FK_TABELA
  If Not ExcluiTabela ('FI_PK_TABELA') Then
     Exit;

  // Exclui dados FI_LAYOUT_ARQUIVO_TABELA_VALOR
  If Not ExcluiTabela ('FI_LAYOUT_ARQUIVO_TABELA_VALOR') Then
     Exit;

  // Exclui dados FI_LAYOUT_ARQUIVO_TABELA
  If Not ExcluiTabela ('FI_LAYOUT_ARQUIVO_TABELA') Then
     Exit;

  // Exclui dados FI_LAYOUT_ARQUIVO
  If Not ExcluiTabela ('FI_LAYOUT_ARQUIVO') Then
     Exit;

  // Exclui dados FI_FK_TABELA
  If Not ExcluiTabela ('FI_ATRIBUTO_TABELA') Then
     Exit;

  // Exclui dados FI_FK_TABELA
  If Not ExcluiTabela ('FI_TABELA') Then
     Exit;

  Result := True;

End;

//--------------------------------------------------------------------
//-- ExcluiTabela
//----------------------------------------------------------------------//
Function TfrmCadTabelaSistema.ExcluiTabela ( Tabela : String ) : Boolean;
Var TextoSql : String;
    wLinhas : Integer;
Begin

  Result := True;

  TextoSql := 'SELECT * FROM ' + Tabela;

  With qryAuxAtualiza Do
    Begin
      Close;
      Sql.Clear;
      Sql.Text := TextoSql;
      Open;

      //-- Animação de Exclusão das Tabelas
      frmAnimacao.SetAnimacao ('Excluindo ' + Tabela + '...',qryAuxAtualiza.RecordCount,True,True,aviDeleteFile);
      wLinhas := 0;

      While Not Eof DO
        Try
          Delete;
          if frmAnimacao.Cancel Then
            Begin
              frmAnimacao.Close;
              frmAnimacao.Free;
              ShowMessage('Processamento cancelado por intervenção do usuário');
              Result := False;
              Exit;
            End
          Else
            Begin
              wLinhas := wLinhas + 1;
              frmAnimacao.SetProgressBar(wLinhas);
            End;
        Except on E: Exception do
         begin
           Result := False;
           Exit;
         end;
        End;
      Close;
    End;

End;

//--------------------------------------------------------------------
//-- ImportaTabelas
//----------------------------------------------------------------------//
Function TfrmCadTabelaSistema.ImportaTabelas : Boolean;
var wLinhas : Integer;
Begin

  Result := True;

  SetSqlLeTabs(QryAuxLe,wCreator);
  QryAuxAtualiza.Sql.Text := 'SELECT * FROM FI_TABELA';

  QryAuxLe.Open;
  QryAuxAtualiza.Open;

  //-- Animação de Exclusão das Tabelas
  frmAnimacao.SetAnimacao('Carregando Tabelas..',QryAuxLe.RecordCount,True,True,aviCopyFiles);
  wLinhas := 0;

  While Not QryAuxLe.EOF Do
    Begin
      QryAuxAtualiza.Append;
      QryAuxAtualiza.FieldByName('NO_TABELA').AsString :=
      QryAuxLe.FieldByName('NO_TABELA').AsString;
      Try
        QryAuxAtualiza.Post;
        QryAuxLe.Next;
        if frmAnimacao.Cancel Then
          Begin
            frmAnimacao.Close;
            frmAnimacao.Free;
            ShowMessage('Processamento cancelado por intervenção do usuário');
            Result := False;
            Exit;
          End
        Else
          Begin
            wLinhas := wLinhas + 1;
            frmAnimacao.SetProgressBar(wLinhas);
          End;
      Except
        Result := False;
        QryAuxLe.Close;
        QryAuxAtualiza.Close;
        Exit;
      End;
    End;

  QryAuxLe.Close;
  QryAuxAtualiza.Close;

End;

//--------------------------------------------------------------------
//-- ImportaAtribTabelas
//----------------------------------------------------------------------//
Function TfrmCadTabelaSistema.ImportaAtribTabelas : Boolean;
var wLinhas : Integer;
Begin

  Result := True;

  SetSqlLeAtribTabs(QryAuxLe,wCreator);
  QryAuxAtualiza.Sql.Text := 'SELECT * FROM FI_ATRIBUTO_TABELA';

  QryAuxLe.Open;
  QryAuxAtualiza.Open;

  //-- Animação de Exclusão das Tabelas
  frmAnimacao.SetAnimacao('Carregando Atributos Tabelas...',QryAuxLe.RecordCount,True,True,aviCopyFiles);
  wLinhas := 0;

  While Not QryAuxLe.EOF Do
    Begin
      QryAuxAtualiza.Insert;
      QryAuxAtualiza.FieldByName('NO_TABELA').AsString := QryAuxLe.FieldByName('NO_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NO_ATRIBUTO_TABELA').AsString := QryAuxLe.FieldByName('NO_ATRIBUTO_TABELA').AsString;
      QryAuxAtualiza.FieldByName('TP_ATRIBUTO').AsString := QryAuxLe.FieldByName('TP_ATRIBUTO').AsString;
      QryAuxAtualiza.FieldByName('NR_TAM_ATRIBUTO_TABELA').AsInteger := QryAuxLe.FieldByName('NR_TAM_ATRIBUTO_TABELA').AsInteger;
      QryAuxAtualiza.FieldByName('IR_MANDATORIO').AsString := QryAuxLe.FieldByName('IR_MANDATORIO').AsString;
      QryAuxAtualiza.FieldByName('NR_ORDEM').AsInteger := QryAuxLe.FieldByName('NR_ORDEM').AsInteger;
      QryAuxAtualiza.FieldByName('IR_CARGA_OBRIGATORIA').AsString := 'N';
      Try
        QryAuxAtualiza.Post;
        QryAuxLe.Next;
        if frmAnimacao.Cancel Then
          Begin
            frmAnimacao.Close;
            frmAnimacao.Free;
            ShowMessage('Processamento cancelado por intervenção do usuário');
            Result := False;
            Exit;
          End
        Else
          Begin
            wLinhas := wLinhas + 1;
            frmAnimacao.SetProgressBar(wLinhas);
          End;
      Except
        Result := False;
        QryAuxLe.Close;
        QryAuxAtualiza.Close;
        Exit;
      End;
    End;

  QryAuxLe.Close;
  QryAuxAtualiza.Close;

End;

//--------------------------------------------------------------------
//-- ImportaPKTabelas
//----------------------------------------------------------------------//
Function TfrmCadTabelaSistema.ImportaPKTabelas : Boolean;
var wLinhas : Integer;
Begin

  Result := True;

  SetSqlLePKTabs(QryAuxLe,wCreator);
  QryAuxAtualiza.Sql.Text := 'SELECT * FROM FI_PK_TABELA';

  QryAuxLe.Open;
  QryAuxAtualiza.Open;

  //-- Animação de Exclusão das Tabelas
  frmAnimacao.SetAnimacao ('Carregando PKs...',QryAuxLe.RecordCount,True,True,aviCopyFiles);
  wLinhas := 0;

  While Not QryAuxLe.EOF Do
    Begin
      QryAuxAtualiza.Append;
      QryAuxAtualiza.FieldByName('NO_TABELA').AsString := QryAuxLe.FieldByName('NO_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NO_ATRIBUTO_TABELA').AsString := QryAuxLe.FieldByName('NO_ATRIBUTO_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NO_PK_TABELA').AsString := QryAuxLe.FieldByName('NO_PK_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NR_ORDEM').AsInteger := QryAuxLe.FieldByName('NR_ORDEM').AsInteger;
      Try
        QryAuxAtualiza.Post;
        QryAuxLe.Next;
        if frmAnimacao.Cancel Then
          Begin
            frmAnimacao.Close;
            frmAnimacao.Free;
            ShowMessage('Processamento cancelado por intervenção do usuário');
            Result := False;
            Exit;
          End
        Else
          Begin
            wLinhas := wLinhas + 1;
            frmAnimacao.SetProgressBar(wLinhas);
          End;
      Except
        Result := False;
        QryAuxLe.Close;
        QryAuxAtualiza.Close;
        Exit;
      End;
    End;

  QryAuxLe.Close;
  QryAuxAtualiza.Close;

End;

//--------------------------------------------------------------------
//-- ImportaFKTabelas
//----------------------------------------------------------------------//
Function TfrmCadTabelaSistema.ImportaFKTabelas : Boolean;
var wLinhas : Integer;
Begin

  Result := True;

  SetSqlLeFKTabs(QryAuxLe,wCreator);
  QryAuxAtualiza.Sql.Text := 'SELECT * FROM FI_FK_TABELA';

  QryAuxLe.Open;
  QryAuxAtualiza.Open;

  //-- Animação de Exclusão das Tabelas
  frmAnimacao.SetAnimacao ('Carregando FKs...',QryAuxLe.RecordCount,True,True,aviCopyFiles);
  wLinhas := 0;

  While Not QryAuxLe.EOF Do
    Begin
      QryAuxAtualiza.Append;
      QryAuxAtualiza.FieldByName('NO_TABELA').AsString := QryAuxLe.FieldByName('NO_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NO_ATRIBUTO_TABELA').AsString := QryAuxLe.FieldByName('NO_ATRIBUTO_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NO_TABELA_FK').AsString := QryAuxLe.FieldByName('NO_TABELA_FK').AsString;
      QryAuxAtualiza.FieldByName('NO_ATRIBUTO_TABELA_FK').AsString := QryAuxLe.FieldByName('NO_ATRIBUTO_TABELA_FK').AsString;
      QryAuxAtualiza.FieldByName('NO_FK_TABELA').AsString := QryAuxLe.FieldByName('NO_FK_TABELA').AsString;
      QryAuxAtualiza.FieldByName('NR_ORDEM').AsInteger := QryAuxLe.FieldByName('NR_ORDEM').AsInteger;
      Try
        QryAuxAtualiza.Post;
        QryAuxLe.Next;
        if frmAnimacao.Cancel Then
          Begin
            frmAnimacao.Close;
            frmAnimacao.Free;
            ShowMessage('Processamento cancelado por intervenção do usuário');
            Result := False;
            Exit;
          End
        Else
          Begin
            wLinhas := wLinhas + 1;
            frmAnimacao.SetProgressBar(wLinhas);
          End;
      Except
        Result := False;
        QryAuxLe.Close;
        QryAuxAtualiza.Close;
        Exit;
      End;
    End;

  QryAuxLe.Close;
  QryAuxAtualiza.Close;

End;

procedure TfrmCadTabelaSistema.qryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   QryPrincipal.ApplyUpdates;
   QryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmCadTabelaSistema.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.DisableControls;
  If wIdReg <> '' Then
     Begin
       Qryprincipal.Locate('NO_TABELA',wIdReg,[]);
       wIdReg := '';
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTabelaSistema.qryPrincipalAfterDelete(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadTabelaSistema.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  WIdReg := '';
  If QryPrincipal.State = dsInsert Then
     Begin
       QryPrincipal.FieldByName('NO_TABELA').AsString :=
       UPPERCASE(QryPrincipal.FieldByName('NO_TABELA').AsString);
       WIdReg := QryPrincipal.FieldByName('NO_TABELA').AsString;
     End;
end;

procedure TfrmCadTabelaSistema.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdtNoTabela.Enabled := True;
  DBEdtNoTabela.SetFocus;
// Inabilita Detalhe
  SetDetalhe;
end;

procedure TfrmCadTabelaSistema.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdtNoTabela.Enabled := False;
  DBEdtSqAtualizacao.SetFocus;
// Inabilita Detalhe
  SetDetalhe;
end;

//Habilita/Inabilita Detalhe
Procedure TfrmCadTabelaSistema.SetDetalhe;
Begin
  If QryPrincipal.State in [dsInsert,dsEdit] Then
     PgCtrlDetalhe.Enabled := False
  Else
    If QryPrincipal.IsEmpty Then
       PgCtrlDetalhe.Enabled := False
    Else
       PgCtrlDetalhe.Enabled := True;
End;


procedure TfrmCadTabelaSistema.qryPrincipalUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  qryPrincipal.RevertRecord;
  UpdateAction := uaAbort;
end;

procedure TfrmCadTabelaSistema.bbtnConfirmarClick(Sender: TObject);
begin

  // Efetua Críticas;
  If QryPrincipal.FieldByName('NO_TABELA').Isnull Then
     Begin
       ShowMessage('Informe o Nome da Tabela!');
       DBEdtNoTabela.SetFocus;
       Exit;
     End;

  // Herança
  inherited;

  // Cancela
  bbtnCancelar.Click;
  // Habilita Detalhe
  SetDetalhe;

end;

procedure TfrmCadTabelaSistema.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdtNoTabela.Enabled := False;
  // Abilita Botoes de Detalhe
  SetDetalhe;
end;

procedure TfrmCadTabelaSistema.FormShow(Sender: TObject);
begin
  inherited;
  QryPrincipal.Open;
  QryDetalhe.Open;
  QryGrupo.Open;
  qryPK.Open;
  qryFK.Open;
end;

procedure TfrmCadTabelaSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryPrincipal.Close;
  QryDetalhe.Close;
  QryGrupo.Close;
  qryPK.Close;
  qryFK.Close;
end;

procedure TfrmCadTabelaSistema.BtInsClick(Sender: TObject);
begin
  inherited;
  // Abaixa Botao
  BtIns.Down:=True;
  // Inabilita Botoes de Detalhe
  BtAlt.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
  // Esconde Grid Mostra Painel
  DbGrdDet.Visible:=False;
  PnlDetalhe.Visible:=True;

  // Inclui Novo Registro
  QryDetalhe.Append;
end;

procedure TfrmCadTabelaSistema.btAltClick(Sender: TObject);
begin
  // Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalhe.RecordCount=0 then begin
     BtAlt.Down:=False;
     Exit;
  End;
  // Abaixa Botao
  BtAlt.Down:=True;
  // Inabilita Botoes de Detalhe
  BtIns.Enabled:=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
  // Esconde Grid Mostra Painel
  DbGrdDet.Visible:=False;
  PnlDetalhe.Visible:=True;
  // Alterar Registro
  QryDetalhe.Edit;
end;

procedure TfrmCadTabelaSistema.BtProcClick(Sender: TObject);
begin
  inherited;
  // Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;
  // Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmCadTabelaSistema.BtExclClick(Sender: TObject);
begin
  inherited;

  // Se Vazio, Sai
  If QryDetalhe.RecordCount=0 then Exit;

  // Se Confirmar, Exclui Registro Posicionado
  If MessageBox(0,'Confirma ?','Mensagem do Sistema ',1) = IdOk Then
     QryDetalhe.Delete;
end;

procedure TfrmCadTabelaSistema.bbtnOkDetClick(Sender: TObject);
begin
  // Efetua Críticas;
  If QryDetalhe.FieldByName('NO_TABELA_LOOKUP').Isnull Then
     Begin
       If NOT QryDetalhe.FieldByName('NO_ATRIBUTO_TABELA_LOOKUP').Isnull Then
          Begin
            ShowMessage('Informe o nome da tabela Lookup!');
            DBEdtTabLookup.SetFocus;
            Exit;
          End;
     End
  Else
     Begin
       If QryDetalhe.FieldByName('NO_ATRIBUTO_TABELA_LOOKUP').Isnull Then
          Begin
            ShowMessage('Informe o nome do atributo da tabela Lookup!');
            DBEdtTabAtribLookup.SetFocus;
            Exit;
          End;
     End;



  QryDetalhe.Post;
  bbtnCancelarDet.Click;

end;

procedure TfrmCadTabelaSistema.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Cancela Operacao
  QryDetalhe.Cancel;
// Levanta Botoes
  BtIns.Down :=False;
  BtAlt.Down :=False;
// Inabilita Botoes
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
// ReExecuta a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible  :=True;
// Mostra Incluidos
  DbGrdDet.ApplySelected;
end;

procedure TfrmCadTabelaSistema.qryDetalheAfterPost(DataSet: TDataSet);
begin
  try
   QryDetalhe.ApplyUpdates;
   QryDetalhe.CommitUpdates;
   QryDetalhe.Close;
   QryDetalhe.Open;
  except on E: Exception do
    ShowMessage(E.Message); 
  end;
end;

procedure TfrmCadTabelaSistema.qryDetalheBeforePost(DataSet: TDataSet);
begin
  If not QryDetalhe.FieldByName('NO_TABELA_LOOKUP').Isnull Then
     QryDetalhe.FieldByName('NO_TABELA_LOOKUP').AsString :=
     UPPERCASE(QryDetalhe.FieldByName('NO_TABELA_LOOKUP').AsString);

  If not QryDetalhe.FieldByName('NO_ATRIBUTO_TABELA_LOOKUP').Isnull Then
     QryDetalhe.FieldByName('NO_ATRIBUTO_TABELA_LOOKUP').AsString :=
     UPPERCASE(QryDetalhe.FieldByName('NO_ATRIBUTO_TABELA_LOOKUP').AsString);
end;

procedure TfrmCadTabelaSistema.qryDetalheAfterDelete(DataSet: TDataSet);
begin
  QryDetalhe.ApplyUpdates;
  QryDetalhe.CommitUpdates;
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

procedure TfrmCadTabelaSistema.qryDetalheUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  qryDetalhe.RevertRecord;
  UpdateAction := uaAbort;
end;

procedure TfrmCadTabelaSistema.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('NO_TABELA', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

procedure TfrmCadTabelaSistema.DBLkpCmbBxGrupoDadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    DBLkpCmbBxGrupoDado.KeyValue := Null;
end;

function CtrlDown : Boolean;
var
  State : TKeyboardState;
begin
  GetKeyboardState(State) ;
  Result := ((State[vk_Control] And 128) <> 0) ;
end;

function ShiftDown : Boolean;
var
  State : TKeyboardState;
begin
  GetKeyboardState(State) ;
  Result := ((State[vk_Shift] and 128) <> 0) ;
end;

end.
