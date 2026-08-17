{===============================================================================
Unit    :  uItemHipotese
Form    :  frmItemHipotese

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 01/08/2000

Objetivo: Cadastrar Ítens de Hipótese.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
04/05/2006    Claudio R.       Inclui o item "Juros" no "Natureza de Item", pois
                               pois na Propriedade Value tinham os items "FJPT"
----------    -----------      -------------------------------------------------                               
================================================================================}
unit uItemHipotese;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Mask, DBTables, Wwquery, CmEventosCadastro, wwDialog, ImgList,
  MontaSelect;

type
  TfrmItemHipotese = class(TfrmCadastro)
    DBRdGrpNatureza: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBCmbBxTabuaGeral: TwwDBLookupCombo;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    DBEdtVariavel: TDBEdit;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    QryPrincipalCD_ITEM_HIPOTESE: TFloatField;
    QryPrincipalCD_TIPO_TABUA: TFloatField;
    QryPrincipalDS_ITEM_HIPOTESE: TStringField;
    QryPrincipalIR_ITEM_HIPOTESE: TStringField;
    QryPrincipalNO_VARIAVEL: TStringField;
    qryTabua: TwwQuery;
    qryTabuaCD_TIPO_TABUA: TFloatField;
    qryTabuaDS_TIPO_TABUA: TStringField;
    qryTabuaIR_DOMINIO_SISTEMA: TStringField;
    qryTab: TwwQuery;
    dsTab: TwwDataSource;
    qryTabDS_TIPO_TABUA: TStringField;
    MontaSelect: TMontaSelect;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBRdGrpNaturezaChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemHipotese: TfrmItemHipotese;
  wIdReg: Integer;

implementation

uses FTelaAut, uListaVariaveis;

{$R *.DFM}

procedure TfrmItemHipotese.SpeedButton1Click(Sender: TObject);
begin
   If (trim(DBEdit1.text) = '') or
      (DBRdGrpNatureza.ItemIndex = 3)  then
      exit;

   If (SBtnInserir.Down) or (SBtnAlterar.Down) then
   Begin
      AbrirForm(FrmListaVariaveis,TFrmListaVariaveis,False );
      frmListaVariaveis.NoVariavel := '';
      frmListaVariaveis.Op := 'H';
   End;
end;

procedure TfrmItemHipotese.FormCreate(Sender: TObject);
begin
   inherited;
   qryTabua.Open;
   qryTab.Open;
end;

procedure TfrmItemHipotese.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTabua.Close;
  qryTab.Close;
  inherited;
end;

procedure TfrmItemHipotese.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
  DBCmbBxTabuaGeral.Visible := true;
  DBEdit3.Visible := false;
  DBCmbBxTabuaGeral.Text := '';
end;

procedure TfrmItemHipotese.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
  DBCmbBxTabuaGeral.Visible := true;
  DBEdit3.Visible := false;
  DBCmbBxTabuaGeral.Text := DBEdit3.Text;
end;

procedure TfrmItemHipotese.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmItemHipotese.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
   begin
    ShowMessage('Informe a Descrição !');
    DBEdit1.SetFocus;
    exit;
   end;
  if DBRdGrpNatureza.ItemIndex = -1 then
   begin
    ShowMessage('Informe a Natureza do Ítem !');
    DBRdGrpNatureza.SetFocus;
    exit;
   end;

  if (DBRdGrpNatureza.ItemIndex = 3) and
     ((DBEdtVariavel.Text) <> '') then
   DBEdtVariavel.Text := '';
  if (DBRdGrpNatureza.ItemIndex < 3) and
      ((DBCmbBxTabuaGeral.Text) = '') then
   qryPrincipal.FieldByName('CD_TIPO_TABUA').Value := null;   

  inherited;

  bbtnCancelar.Click;
end;

procedure TfrmItemHipotese.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
     qryAux.Open;
     qryPrincipal.FieldByName('CD_ITEM_HIPOTESE').asInteger :=
                           (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;

  if trim(DBCmbBxTabuaGeral.Text) = '' then
    qryPrincipal.FieldByName('CD_TIPO_TABUA').Value := null
  else
    qryPrincipal.FieldByName('CD_TIPO_TABUA').asInteger :=
                        qryTabua.FieldByName('CD_TIPO_TABUA').asInteger;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_ITEM_HIPOTESE').AsInteger;
end;

procedure TfrmItemHipotese.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end; 
end;

procedure TfrmItemHipotese.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_ITEM_HIPOTESE',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmItemHipotese.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBCmbBxTabuaGeral.Visible := false;
  DBEdit3.Visible := true;
end;

procedure TfrmItemHipotese.DBRdGrpNaturezaChange(Sender: TObject);
begin
  if DBRdGrpNatureza.ItemIndex = 3 then
   begin
     DBCmbBxTabuaGeral.Enabled := true;
     DBEdtVariavel.Text := '';
   end  
  else
   begin
     DBCmbBxTabuaGeral.Text := '';
     DBCmbBxTabuaGeral.Enabled := false;
   end;  
end;

procedure TfrmItemHipotese.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_ITEM_HIPOTESE', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
