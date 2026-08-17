{===============================================================================
Unit    :  uVariavel
Form    :  frmVariavel

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 15/07/2000

Objetivo: Cadastrar Variáveis.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uVariavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  DBTables, Wwquery, ComCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmVariavel = class(TfrmCadastro)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    TabSheet2: TTabSheet;
    dsFormula: TwwDataSource;
    DbGrdDet: TwwDBGrid;
    DBMemo1: TDBMemo;
    qryFormula: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipal: TwwQuery;
    qryFormulaNO_FORMULA: TStringField;
    qryFormulaNO_VARIAVEL: TStringField;
    BtBtnFormula: TBitBtn;
    DBMemoCampoBase: TDBMemo;
    QryPrincipalNO_VARIAVEL: TStringField;
    QryPrincipalIM_VARIAVEL: TStringField;
    QryPrincipalVL_DEFAULT: TFloatField;
    QryPrincipalDS_SQL_CAMPO_BANCO: TMemoField;
    QryPrincipalNO_FUNCAO: TStringField;
    QryPrincipalIR_OCOR_CALC_ATUARIAL: TStringField;
    QryPrincipalIR_TABUA: TStringField;
    QryPrincipalIR_DOMINIO_SISTEMA: TStringField;
    QryPrincipalNO_CAMPO_BANCO: TStringField;
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    MontaSelect: TMontaSelect;
    QryPrincipalDS_VARIAVEL: TStringField;
    function Nome_Valido(Cadeia : String): Boolean;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalBeforeEdit(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QryPrincipalPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QryPrincipalAfterDelete(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure BtBtnFormulaClick(Sender: TObject);
    procedure SBtnGerarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVariavel: TfrmVariavel;
  Wg_NoVarAnt: String;
  WidReg : String;

implementation

uses uSelecCampoVar, DRelatsAtuarial;

{$R *.DFM}

Function TfrmVariavel.Nome_Valido(Cadeia : String): Boolean;
Var
  WInd: Integer;
Begin
     Result := True;
     For WInd := 1 to Length(Cadeia) do
         If not (Cadeia[Wind] in ['0'..'9', 'A'..'Z', 'a'..'z', '_']) Then
            Result := False;
End;

procedure TfrmVariavel.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Enabled := false;
  DBEdit4.SetFocus;
end;

procedure TfrmVariavel.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
   begin
     ShowMessage('Informe o Nome da Variável !');
     if SBtnInserir.Down then
      DBEdit1.SetFocus;
     exit;
   end
  Else if not (Nome_Valido(qryPrincipal.FieldByName('NO_VARIAVEL').AsString)) Then
   Begin
     ShowMessage('Variável contém caracteres inválidos no nome');
     if SBtnInserir.Down then
      DBEdit1.SetFocus;
     exit;
   End;
  if trim(DBEdit4.Text) = '' then
   begin
     ShowMessage('Informe a Descrição da Variável !');
     DBEdit4.SetFocus;
     exit;
   end;
  if DBRadioGroup1.ItemIndex = -1 then
   begin
     ShowMessage('Informe se a variável é indexada !');
     DBRadioGroup1.SetFocus;
     exit;
   end;
  if DBRadioGroup2.ItemIndex = -1 then
   begin
     ShowMessage('Informe se a variável deve ou não ser armazenada !');
     DBRadioGroup2.SetFocus;
     exit;
   end;

  inherited;
  bbtnCancelar.Click;
  SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmVariavel.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmVariavel.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
  qryFormula.Open;
  PageControl.ActivePage := TabSheet1;
  SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmVariavel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryFormula.Close;
end;

procedure TfrmVariavel.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Enabled := true;
end;

procedure TfrmVariavel.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;

  if qryPrincipal.FieldByName('VL_DEFAULT').IsNull Then
        qryPrincipal.FieldByName('VL_DEFAULT').AsInteger := 0;

  if SBtnAlterar.Down then
   begin
     if qryPrincipal.State = dsEdit Then
       If not qryPrincipal.FieldByName('IR_DOMINIO_SISTEMA').IsNull Then
         If qryPrincipal.FieldByName('NO_VARIAVEL').AsString <> Wg_NoVarAnt Then
          Begin
            ShowMessage('Alteração do nome da variável não permitida !' + #13 +
            'Registro de utilização interna do sistema');
            qryPrincipal.Cancel;
            exit;
          End;
    if DBRadioGroup1.ItemIndex = 0 then
      qryPrincipal.FieldByName('IR_TABUA').asString := 'S'
    else if DBRadioGroup1.ItemIndex = 1 then
      qryPrincipal.FieldByName('IR_TABUA').asString := 'N';

    if DBRadioGroup2.ItemIndex = 0 then
      qryPrincipal.FieldByName('IR_OCOR_CALC_ATUARIAL').asString := 'S'
    else if DBRadioGroup2.ItemIndex = 1 then
      qryPrincipal.FieldByName('IR_OCOR_CALC_ATUARIAL').asString := 'N';
   end;

   wIdReg := '';
   if qryPrincipal.State = dsInsert Then
      wIdReg:=Qryprincipal.FieldByName('NO_VARIAVEL').AsString;

end;

procedure TfrmVariavel.QryPrincipalBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  Wg_NoVarAnt := qryPrincipal.FieldByname('NO_VARIAVEL').AsString;
end;

procedure TfrmVariavel.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmVariavel.QryPrincipalDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  ShowMessage('Operação não permitida !' + #13 +'Variável já utilizada em fórmula');
  SBtnAlterar.Down := false;
  Action := daAbort;
end;

procedure TfrmVariavel.QryPrincipalPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  ShowMessage('Operação não permitida !' + #13 +'Variável já utilizada em fórmula');
  bbtnCancelar.Click;
  Action := daAbort;
end;

procedure TfrmVariavel.QryPrincipalAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmVariavel.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg <> '' Then
     Begin
       Qryprincipal.Locate('NO_VARIAVEL',wIdReg,[]);
       wIdReg := '';
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmVariavel.sbtnApagarClick(Sender: TObject);
begin
  if (not qryPrincipal.FieldByName('IR_DOMINIO_SISTEMA').IsNull) and
     (qryPrincipal.FieldByName('IR_DOMINIO_SISTEMA').asString[1] = 'S')  Then
   Begin
     ShowMessage('Registro de utilização interna do sistema');
     qryPrincipal.Cancel;
     exit;
   End;
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpDates;  

  SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmVariavel.BtBtnFormulaClick(Sender: TObject);
begin
  Try
    Screen.Cursor := crHourGlass;
    frmSelecCampoVar := TfrmSelecCampoVar.Create(Self);
    frmSelecCampoVar.EditExpressao.text := QryPrincipal.fieldbyname('NO_CAMPO_BANCO').asString;
    frmSelecCampoVar.showmodal;

    if frmSelecCampoVar.bbtnSair.modalresult = mryes then
     begin
       QryPrincipal.Edit;

       QryPrincipal.fieldbyname('NO_CAMPO_BANCO').clear;
       QryPrincipal.fieldbyname('NO_CAMPO_BANCO').asstring :=
          frmSelecCampoVar.EditExpressao.Text;
       QryPrincipal.fieldbyname('DS_SQL_CAMPO_BANCO').clear;
       QryPrincipal.fieldbyname('DS_SQL_CAMPO_BANCO').asstring :=
          frmSelecCampoVar.EditSQLExpressao.Text;

       QryPrincipal.post;

       bbtnCancelar.Click;
     end;
  Finally
    Screen.Cursor := crDefault;
    frmSelecCampoVar.Release;
    frmSelecCampoVar := nil;
  End;
end;

procedure TfrmVariavel.SBtnGerarClick(Sender: TObject);
begin
  SBtnGerar.Down := false;
  if qryPrincipal.IsEmpty then
    exit;

  dtmRelatsAtuarial.rpVariavel.Print;    
end;

procedure TfrmVariavel.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('NO_VARIAVEL', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
