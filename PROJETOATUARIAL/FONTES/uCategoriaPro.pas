{===============================================================================
Unit    :  uCategoriaPro
Form    :  frmCategoriaPro

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar as Categorias Profissionais de uma Patrocinadora

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uCategoriaPro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, wwdblook, DBTables, Wwquery;

type
  TfrmCategoriaPro = class(TfrmCadastro)
    Label1: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    LkcTbTipoCatProf: TwwDBLookupCombo;
    DBEdit8: TDBEdit;
    qryCatProf: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    dsTipoCatProf: TwwDataSource;
    qryTipoCatProf: TwwQuery;
    qryTipoCatProfDS_TIPO_CAT_PROF_ESP: TStringField;
    qryTipoCatProfCD_TIPO_CAT_PROF_ESP: TFloatField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    qryCatProfNO_PESSOA: TStringField;
    qryCatProfDS_TIPO_CAT_PROF_ESP: TStringField;
    qryCatProfCD_PESSOA_PATROC: TFloatField;
    qryCatProfCD_TIPO_CAT_PROF_ESP: TFloatField;
    qryCatProfNR_IDADE_APOSENT_FEM: TFloatField;
    qryCatProfNR_IDADE_APOSENT_MASC: TFloatField;
    qryCatProfNR_TEMPO_SERVICO_FEM: TFloatField;
    qryCatProfNR_TEMPO_SERVICO_MASC: TFloatField;
    qryCatProfNR_TEMPO_CONTRIB_FEM: TFloatField;
    qryCatProfNR_TEMPO_CONTRIB_MASC: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryCatProfBeforePost(DataSet: TDataSet);
    procedure qryCatProfAfterPost(DataSet: TDataSet);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryCatProfAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoriaPro: TfrmCategoriaPro;
  WidReg: Integer;

implementation

uses uPatrocinadora;

{$R *.DFM}

procedure TfrmCategoriaPro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCatProf.Close;
  qryTipoCatProf.Close;
end;

procedure TfrmCategoriaPro.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoCatProf.Visible := true;
  LkcTbTipoCatProf.Enabled := true;
  DBEdit8.Visible := false;
  LkcTbTipoCatProf.SetFocus;
end;

procedure TfrmCategoriaPro.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoCatProf.Visible := true;
  DBEdit8.Visible := false;
  LkcTbTipoCatProf.Text := DBEdit8.Text;
  LkcTbTipoCatProf.Enabled := false;
  DBEdit2.SetFocus;
end;

procedure TfrmCategoriaPro.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(LkcTbTipoCatProf.text) = '' then
   begin
    ShowMessage('Informe o Tipo de Categoria Profissional !');
    LkcTbTipoCatProf.SetFocus;
    exit;
   end;
  inherited;
  bbtnCancelar.Click;
  DBEdit8.SetFocus;
end;

procedure TfrmCategoriaPro.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoCatProf.Visible := false;
  DBEdit8.Visible := true;
  DBEdit8.SetFocus;
end;

procedure TfrmCategoriaPro.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryCatProf.ApplyUpdates;
  qryCatProf.CommitUpdates;
  wIdReg := 0;  
end;

procedure TfrmCategoriaPro.qryCatProfBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryCatProf.FieldByName('CD_PESSOA_PATROC').AsInteger :=
             frmPatrocinadora.CodPessoa;
     qryCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger :=
             qryTipoCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').asInteger;
   end
  else If SBtnAlterar.Down Then
     qryCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger :=
             qryTipoCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').asInteger;

  wIdReg := 0;
  wIdReg := qryCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger;
end;

procedure TfrmCategoriaPro.qryCatProfAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryCatProf.ApplyUpdates;
   qryCatProf.CommitUpdates;
   qryCatProf.Close;
   qryCatProf.Open;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmCategoriaPro.DBEdit1Change(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   DBEDit1.Text := frmPatrocinadora.DBEdit1.text;
end;

procedure TfrmCategoriaPro.FormCreate(Sender: TObject);
begin
  // Passa os Parâmetros necessários
  qryCatProf.Close;
  qryCatProf.ParamByName('CD').asInteger := frmPatrocinadora.CodPessoa;
  qryCatProf.Open;

  DBEDit1.Text := frmPatrocinadora.DBEdit1.text;
  inherited;
  qryTipoCatProf.Open; //abre a Query Tipos de Categoria Profissional  
end;

procedure TfrmCategoriaPro.qryCatProfAfterOpen(DataSet: TDataSet);
begin
  qryCatProf.DisableControls;
  If wIdReg > 0 Then
    qryCatProf.Locate('CD_TIPO_CAT_PROF_ESP',wIdReg,[]);
  qryCatProf.EnableControls;
end;

end.
