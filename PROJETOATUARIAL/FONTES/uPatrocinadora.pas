{===============================================================================
Unit    :  uPatrocinadora
Form    :  frmPatrocinadora

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar Patrocinadoras.
          "Link para cadastrar seus Contatos, e Categorias Profissionais"

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uPatrocinadora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Mask, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, wwDialog,
  ImgList, MontaSelect{, Wwquert};

type
  TfrmPatrocinadora = class(TfrmCadastro)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    Label7: TLabel;
    btbtnEndereco: TBitBtn;
    qryPatroc: TwwQuery;
    UpdtSQLPatroc: TUpdateSQL;
    dsPatroc: TwwDataSource;
    DBEdit2: TDBEdit;
    qryPatrocCD_PESSOA_PATROC: TFloatField;
    QryPrincipalCD_PESSOA: TFloatField;
    QryPrincipalNO_PESSOA: TStringField;
    QryPrincipalNR_CGC: TStringField;
    QryPrincipalDS_OBSERV: TMemoField;
    dtEdit: TCMDateTimePicker;
    QryPrincipalCD_UF: TStringField;
    btbtnCatProf: TBitBtn;
    btbtnContatos: TBitBtn;
    QryPrincipalDT_REAJUSTE_SALARIO: TDateTimeField;
    qryPatrocDT_REAJUSTE_SALARIO: TDateTimeField;
    qryContatos: TwwQuery;
    qryCatProf: TwwQuery;
    qryPlano: TwwQuery;
    MontaSelect: TMontaSelect;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnEnderecoClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPatrocBeforePost(DataSet: TDataSet);
    procedure qryPatrocAfterPost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btbtnCatProfClick(Sender: TObject);
    procedure btbtnContatosClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodPessoa: Integer;
  end;

var
  frmPatrocinadora: TfrmPatrocinadora;
  WidReg: Integer;
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)

implementation

uses uEndereco, FTelaAut, uCategoriaPro, uContatos;

{$R *.DFM}

procedure TfrmPatrocinadora.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
   begin
    ShowMessage('Informe o Nome da Patrocinadora !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(dtEdit.Text) = '' then
   begin
    ShowMessage('Informe a Data de Reajuste !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
  bbtnCancelar.Click;
  DBEdit2.Visible := true;
  dtEdit.Visible := false;
end;

procedure TfrmPatrocinadora.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;

   PrincipalPost := true;
   If SBtnInserir.Down Then
    qryPatroc.Insert
   else If sbtnAlterar.Down Then
     qryPatroc.Edit;

   qryPatrocBeforePost(qryPatroc);
   qryPatrocAfterPost(qryPatroc);
  except
   bbtnCancelar.Click;
   exit;
  end;     
end;

procedure TfrmPatrocinadora.sbtnApagarClick(Sender: TObject);
begin
  qryContatos.Close;
  qryContatos.Open;
  if qryContatos.RecordCount > 0 then
   begin
    ShowMessage('Exclua primeiro os Contatos da Patrocinadora !');
    SBtnApagar.Down := false;
    exit;
   end;
  qryContatos.Close;

  qryCatProf.Close;
  qryCatProf.Open;
  if qryCatProf.RecordCount > 0 then
   begin
    ShowMessage('Exclua primeiro a(s) Categoria(s) Profissional(is) da Patrocinadora !');
    SBtnApagar.Down := false;
    exit;
   end;
  qryCatProf.Close;

  qryPlano.Close;
  qryPlano.Open;
  if qryPlano.RecordCount > 0 then
   begin
    ShowMessage('Exclua o(s) Plano(s) de Benefício da Patrocinadora !');
    SBtnApagar.Down := false;
    exit;
   end;
  qryPlano.Close;

  If QryPatroc.RecordCount > 0 then
   begin
    if MessageBox(0,'Deseja apagar a Patrocinadora ?','Cálculo Atuarial',4) = IdYes Then
     Begin
      qryPatroc.Delete;
      qryPatroc.ApplyUpdates;
      qryPatroc.CommitUpdates;
      //Atualiza Query
      qryPatroc.Close;
      qryPatroc.Open;
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
    btbtnCatProf.Enabled := false;
   end
  else
   begin
    btbtnEndereco.Enabled := true;
    btbtnContatos.Enabled := true;
    btbtnCatProf.Enabled := true;
   end;
end;

procedure TfrmPatrocinadora.sbtnInserirClick(Sender: TObject);
begin
  btbtnEndereco.Enabled := false;
  btbtnContatos.Enabled := false;
  btbtnCatProf.Enabled := false;
  
  inherited;
  PrincipalPost := false;
  dtEdit.text := '';
  DBEdit2.Visible := false;
  dtEdit.Visible := true;
  qryPatroc.Insert;
  DbEdit1.SetFocus;
end;

procedure TfrmPatrocinadora.sbtnAlterarClick(Sender: TObject);
begin
  btbtnEndereco.Enabled := false;
  btbtnContatos.Enabled := false;
  btbtnCatProf.Enabled := false;
  
  inherited;
  PrincipalPost := false;
  dtEdit.Text := DBEdit2.text;
  DBEdit2.Visible := false;
  dtEdit.Visible := true;
  qryPatroc.Edit;
  DbEdit1.SetFocus;
end;

procedure TfrmPatrocinadora.FormShow(Sender: TObject);
begin
  CodPessoa := 0;
  inherited;
  qryPrincipal.Open;
  qryPatroc.Open;

  if qryPrincipal.RecordCount = 0 then
   begin
    btbtnEndereco.Enabled := false;
    btbtnContatos.Enabled := false;
    btbtnCatProf.Enabled := false;
   end
  else
   begin
    btbtnEndereco.Enabled := true;
    btbtnContatos.Enabled := true;
    btbtnCatProf.Enabled := true;
   end;
end;

procedure TfrmPatrocinadora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CodPessoa := 0;
  qryPrincipal.Close;
  qryPatroc.Close;
  inherited;
end;

procedure TfrmPatrocinadora.btbtnEnderecoClick(Sender: TObject);
begin
  If (SBtnInserir.Down) or (sbtnAlterar.Down) Then
    bbtnConfirmar.Click
  else
    CodPessoa := qryPrincipal.FieldByName('CD_PESSOA').asInteger;

  // Form Para Cadastrar Endereço
  AbrirForm(frmEndereco,TfrmEndereco,False );
end;

procedure TfrmPatrocinadora.QryPrincipalBeforePost(DataSet: TDataSet);
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

procedure TfrmPatrocinadora.qryPatrocBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If (SBtnInserir.Down) and (PrincipalPost) Then
   begin
     qryAux.Open;
     qryPatroc.FieldByName('CD_PESSOA_PATROC').AsInteger :=
             qryAux.FieldByName('Max_CD').asInteger;
     qryPatroc.FieldByName('DT_REAJUSTE_SALARIO').AsDateTime :=
             StrToDate(dtEdit.Text);
   end
  // Caso Botao Alterar Altera a Data de Rajuste Salarial
  else If (sbtnAlterar.Down) and (PrincipalPost) Then
    qryPatroc.FieldByName('DT_REAJUSTE_SALARIO').AsDateTime :=
            StrToDate(dtEdit.Text);
end;

procedure TfrmPatrocinadora.qryPatrocAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   if PrincipalPost then
    begin
      PrincipalPost := false;
      qryPatroc.ApplyUpdates;
      qryPatroc.CommitUpdates;
    end;
  except
   bbtnCancelar.Click;
   exit;
  end;      
end;

procedure TfrmPatrocinadora.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.Visible := true;
  dtEdit.Visible := false;

  if qryPrincipal.RecordCount = 0 then
   begin
    btbtnEndereco.Enabled := false;
    btbtnContatos.Enabled := false;
    btbtnCatProf.Enabled := false;
   end
  else
   begin
    btbtnEndereco.Enabled := true;
    btbtnContatos.Enabled := true;
    btbtnCatProf.Enabled := true;
   end;
end;

procedure TfrmPatrocinadora.btbtnCatProfClick(Sender: TObject);
begin
  If (SBtnInserir.Down) or (sbtnAlterar.Down) Then
    bbtnConfirmar.Click
  else
    CodPessoa := qryPrincipal.FieldByName('CD_PESSOA').asInteger;

  // Form Para Cadastrar Categoria Profissional
  AbrirForm(frmCategoriaPro,TfrmCategoriaPro,False );
end;

procedure TfrmPatrocinadora.btbtnContatosClick(Sender: TObject);
begin
  If (SBtnInserir.Down) or (sbtnAlterar.Down) Then
    bbtnConfirmar.Click
  else
    CodPessoa := qryPrincipal.FieldByName('CD_PESSOA').asInteger;

  // Form Para Cadastrar Endereço
  AbrirForm(frmContatos,TfrmContatos,False );
end;

procedure TfrmPatrocinadora.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_PESSOA',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmPatrocinadora.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_PESSOA', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;  
end;

end.
