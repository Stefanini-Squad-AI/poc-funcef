{===============================================================================
Unit    :  uEntidadePrevidencia
Form    :  frmEntidadePrevidencia

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar Entidades de Previdência.
          "Link para cadastrar seus Contatos"

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uEntidadePrevidencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DBTables, Wwquery,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmEntidadePrevidencia = class(TfrmCadastro)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    btbtnEndereco: TBitBtn;
    QryPrincipal: TwwQuery;
    qryEntid: TwwQuery;
    dsEntid: TwwDataSource;
    UpdtSQLEntid: TUpdateSQL;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    QryPrincipalCD_PESSOA: TFloatField;
    QryPrincipalNO_PESSOA: TStringField;
    QryPrincipalNR_CGC: TStringField;
    QryPrincipalDS_OBSERV: TMemoField;
    QryPrincipalCD_UF: TStringField;
    qryEntidCD_PESSOA_ENTID: TFloatField;
    btbtnContatos: TBitBtn;
    qryContatos: TwwQuery;
    qryPlano: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryEntidBeforePost(DataSet: TDataSet);
    procedure qryEntidAfterPost(DataSet: TDataSet);
    procedure btbtnEnderecoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btbtnContatosClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
   CodPessoa: Integer;
   form: String;
  end;

var
  frmEntidadePrevidencia: TfrmEntidadePrevidencia;
  WidReg: Integer;
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)

implementation

uses uImportacaoTOTALPREV, uEndereco, FTelaAut, uContatos, FPrincipal,
  dBaseDados, FAnimacao, uImportaTotalPrev;

{$R *.DFM}

procedure TfrmEntidadePrevidencia.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
   begin
    ShowMessage('Informe o Nome da Entidade de Previdência !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
  bbtnCancelar.Click;
end;

procedure TfrmEntidadePrevidencia.sbtnInserirClick(Sender: TObject);
begin
  btbtnEndereco.Enabled := false;
  btbtnContatos.Enabled := false;

  inherited;
  PrincipalPost := false;
  DbEdit1.SetFocus;
end;

procedure TfrmEntidadePrevidencia.sbtnAlterarClick(Sender: TObject);
begin
  btbtnEndereco.Enabled := false;
  btbtnContatos.Enabled := false;
  
  inherited;
  PrincipalPost := false;
  DbEdit1.SetFocus;
end;

procedure TfrmEntidadePrevidencia.sbtnApagarClick(Sender: TObject);
begin
  qryContatos.Close;
  qryContatos.Open;
  if qryContatos.RecordCount > 0 then
   begin
    ShowMessage('Exclua primeiro os Contatos da Entidade !');
    SBtnApagar.Down := false;            
    exit;
   end;
  qryContatos.Close;

  qryPlano.Close;
  qryPlano.Open;
  if qryPlano.RecordCount > 0 then
   begin
    ShowMessage('Exclua o(s) Plano(s) de Benefício da Entidade !');
    SBtnApagar.Down := false;
    exit;
   end;
  qryPlano.Close;

  If QryEntid.RecordCount > 0 then
   begin
    if MessageBox(0,'Deseja apagar a Entidade de Previdência ?','Cálculo Atuarial',4) = IdYes Then
     Begin
      qryEntid.Delete;
      qryEntid.ApplyUpdates;
      qryEntid.CommitUpdates;
      //Atualiza Queries
      qryEntid.Close;
      qryentid.Open;
     end
    else
     begin
      SBtnApagar.Down := false;
      exit;
     end;
   end;

   qryPrincipal.Delete;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
   SBtnApagar.Down := false;

  if qryPrincipal.RecordCount = 0 then
   begin
    btbtnEndereco.Enabled := false;
    btbtnContatos.Enabled := false;
   end
  else
   begin
    btbtnEndereco.Enabled := true;
    btbtnContatos.Enabled := true;
   end; 
end;

procedure TfrmEntidadePrevidencia.FormShow(Sender: TObject);
begin
  CodPessoa := 0;
  inherited;
  qryPrincipal.Open;
  qryEntid.Open;

  if qryPrincipal.RecordCount = 0 then
   begin
    btbtnEndereco.Enabled := false;
    btbtnContatos.Enabled := false;
   end
  else
   begin
    btbtnEndereco.Enabled := true;
    btbtnContatos.Enabled := true;
   end; 
end;

procedure TfrmEntidadePrevidencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (form = 'ImportaTabelasAux') and not(qryPrincipal.IsEmpty) then
   begin
    if MessageBox(0,'Importação pronta para ser executada.'+ #13#10+
                    'Deseja continuar?','Cálculo Atuarial',4) <> IdYes Then
     begin
      CodPessoa := 0;
      qryPrincipal.Close;
      qryentid.Close;
      inherited;
      Exit;
    end;

    Try
      Screen.Cursor := crHourGlass;
      InsereTabelasAuxiliares(qryPrincipal.FieldByName('CD_PESSOA').asInteger);
    finally
     Screen.Cursor := crDefault;
     form := ' ';
    end; //try-finally
   end; //if

  CodPessoa := 0;
  qryPrincipal.Close;
  qryEntid.Close;
  inherited;
end;

procedure TfrmEntidadePrevidencia.QryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_PESSOA').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     CodPessoa := (qryAux.FieldByName('Max_CD').asInteger + 1);        
     qryAux.Close;
   end
  else if SBtnAlterar.Down then
     CodPessoa := qryPrincipal.FieldByName('CD_PESSOA').asInteger;

  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_PESSOA').AsInteger;
end;

procedure TfrmEntidadePrevidencia.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;

   PrincipalPost := true;
   If SBtnInserir.Down Then
    qryEntid.Insert
   else If sbtnAlterar.Down Then
     qryEntid.Edit;

   qryEntidBeforePost(qryEntid);
   qryEntidAfterPost(qryEntid);
  except
   bbtnCancelar.Click;
   exit;
  end;   
end;

procedure TfrmEntidadePrevidencia.qryEntidBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If (SBtnInserir.Down) and (PrincipalPost) Then
   begin
     qryAux.Open;
     qryEntid.FieldByName('CD_PESSOA_ENTID').AsInteger :=
             qryAux.FieldByName('Max_CD').asInteger;
     qryAux.Close;
   end;
end;

procedure TfrmEntidadePrevidencia.qryEntidAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   if PrincipalPost then
    begin
      PrincipalPost := false;
      qryEntid.ApplyUpdates;
      qryEntid.CommitUpdates;
    end;
  except
   bbtnCancelar.Click;
   exit;
  end;      
end;

procedure TfrmEntidadePrevidencia.btbtnEnderecoClick(Sender: TObject);
begin
  If (SBtnInserir.Down) or (sbtnAlterar.Down) Then
    bbtnConfirmar.Click
  else
    CodPessoa := qryPrincipal.FieldByName('CD_PESSOA').asInteger;    

  // Form Para Cadastrar Endereço
  AbrirForm(frmEndereco,TfrmEndereco,False );
end;

procedure TfrmEntidadePrevidencia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if qryPrincipal.RecordCount = 0 then
   begin
    btbtnEndereco.Enabled := false;
    btbtnContatos.Enabled := false;
   end
  else
   begin
    btbtnEndereco.Enabled := true;
    btbtnContatos.Enabled := true;
   end; 
end;

procedure TfrmEntidadePrevidencia.btbtnContatosClick(Sender: TObject);
begin
  If (SBtnInserir.Down) or (sbtnAlterar.Down) Then
    bbtnConfirmar.Click
  else
    CodPessoa := qryPrincipal.FieldByName('CD_PESSOA').asInteger;    

  // Form Para Cadastrar os Contatos
  AbrirForm(frmContatos,TfrmContatos,False );
end;

procedure TfrmEntidadePrevidencia.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_PESSOA',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

end.
