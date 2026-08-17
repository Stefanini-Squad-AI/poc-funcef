{===============================================================================
Unit    :  uFormula
Form    :  frmFormula

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 15/07/2000

Objetivo: Cadastrar Fórmulas.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uFormula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DBTables, Wwquery,
  uVarCalc, uExpresCalc, CmEventosCadastro, wwDialog, ImgList, MontaSelect,
  DBClient, CMDBLookupCombo;

type
  TfrmFormula = class(TfrmCadastro)
    Label7: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBEdtVarResult: TDBEdit;
    DBEdtVarInicial: TDBEdit;
    Label1: TLabel;
    DBEdtVarFinal: TDBEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PgCtrlDetalhe: TPageControl;
    TbShExrpessao: TTabSheet;
    DBMmExpressao: TDBMemo;
    TbShRotinas: TTabSheet;
    DbGrdDet: TwwDBGrid;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipalCD_FORMULA: TFloatField;
    QryPrincipalNO_VARIAVEL_RESULT: TStringField;
    QryPrincipalNO_VARIAVEL_INICIAL: TStringField;
    QryPrincipalNO_VARIAVEL_FINAL: TStringField;
    qryAux: TwwQuery;
    qryVariavelFormula: TwwQuery;
    qryVariavelFormulaCD_FORMULA: TFloatField;
    qryVariavelFormulaNO_VARIAVEL: TStringField;
    UpdateSQL: TUpdateSQL;
    qryRotina: TwwQuery;
    dsRotina: TwwDataSource;
    qryRotinaDS_GRUPO_FORMULA: TStringField;
    btbtnExpressao: TBitBtn;
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    MontaSelect: TMontaSelect;
    QryExcluiVariaveisFormula: TwwQuery;
    ClntDtStGrupoFormula: TClientDataSet;
    QryPrincipalIR_GRUPO_FORMULA: TStringField;
    Label3: TLabel;
    ClntDtStGrupoFormulaIR_GRUPO_FORMULA: TStringField;
    ClntDtStGrupoFormulaDS_GRUPO_FORMULA: TStringField;
    DBLkpCmbBxGrupoFormula: TDBLookupComboBox;
    DtSrcGrupoFormula: TDataSource;
    QryPrincipalDS_FORMULA: TMemoField;
    QryPrincipalNO_VARIAVEL_INICIAL2: TStringField;
    Label4: TLabel;
    DBEdtVarInicial2: TDBEdit;
    SpeedButton4: TSpeedButton;
    QryPrincipalNO_FORMULA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure btbtnExpressaoClick(Sender: TObject);
    procedure QryPrincipalDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QryPrincipalBeforeDelete(DataSet: TDataSet);
    procedure qryVariavelFormulaAfterPost(DataSet: TDataSet);
    procedure DBEdtVarResultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SBtnGerarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DBLkpCmbBxGrupoFormulaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    Function FormatExpresText : String;
    procedure ExcluiVariavelFormula(CodFormula : Integer);
    procedure AtualizaVariavelFormula(CodFormula : Integer);
    procedure IncluiVariavelFormula(CodFormula : Integer; NomeVariavel : String);
  public
    { Public declarations }
  end;

var
  frmFormula: TfrmFormula;
  Wg_Chave : Integer;
  Wg_Variavel : TVarCalc;
  Wg_Formula  : TExpresCalc;

implementation

uses FTelaAut, uListaVariaveis, uExpressao, uFuncGerais,
     DRelatsAtuarial;

{$R *.DFM}

Function TfrmFormula.FormatExpresText : String;
Var
  WFormula: String;
  WI: Integer;
Begin
  WFormula := '';
  WI := 0;
  While WI <= DBMmExpressao.Lines.Count Do
    Begin
      WFormula := WFormula + DBMmExpressao.Lines[WI];
      WI := WI + 1;
    End;
  Result := WFormula;
End;

procedure TfrmFormula.ExcluiVariavelFormula(CodFormula : Integer);
Begin
  QryExcluiVariaveisFormula.ParamByName('CD_FORMULA').asInteger := CodFormula;
  QryExcluiVariaveisFormula.ExecSQL;
  //---
End;

procedure TfrmFormula.IncluiVariavelFormula(CodFormula : Integer; NomeVariavel : String);
Begin
//Se encontrar algum registro igual então não grava
  if qryVariavelFormula.Locate('CD_FORMULA;NO_VARIAVEL',
                       VarArrayOf([CodFormula, NomeVariavel]), []) then
    exit;

  qryVariavelFormula.Insert;
  qryVariavelFormula.FieldByName('CD_FORMULA').AsInteger := CodFormula;
  qryVariavelFormula.FieldByName('NO_VARIAVEL').AsString := NomeVariavel;
  Try
    qryVariavelFormula.Post;
  Except
    qryVariavelFormula.Cancel;
  End;
End;

procedure TfrmFormula.AtualizaVariavelFormula(CodFormula : Integer);
var
  WI : Integer;
begin
  //Abre a qry para iniciar atualização de variáveis
  qryVariavelFormula.Close;
  qryVariavelFormula.ParamByName('CD_FORMULA').AsInteger := CodFormula;
  qryVariavelFormula.Open;

  if DBEdtVarResult.Text <> '' Then
   IncluiVariavelFormula(CodFormula,DBEdtVarResult.Text);

  if DBEdtVarInicial.Text <> '' Then
   IncluiVariavelFormula(CodFormula,DBEdtVarInicial.Text);

  if DBEdtVarFinal.Text <> '' Then
   IncluiVariavelFormula(CodFormula,DBEdtVarFinal.Text);

  IF DBMmExpressao.Text <> '' Then
   Begin
    WI := 0;
    While (Wg_Formula.Ftipo_token[WI] <> '')
      AND (WI < Wg_Formula.Ftipo_token.Count) DO
        Begin
          If Wg_Formula.Ftipo_token[WI] = 'VARIAVEL' Then
            IncluiVariavelFormula(CodFormula,Wg_Formula.FToken[WI]);
           WI := WI + 1;
         End;
   End;
  qryVariavelFormula.Close;
End;

procedure TfrmFormula.FormShow(Sender: TObject);
begin
  inherited;
  PgCtrlDetalhe.ActivePage := TbShExrpessao;
  SBtnGerar.enabled := SBtnAlterar.Enabled;

  DBLkpCmbBxGrupoFormula.KeyValue := QryPrincipalIR_GRUPO_FORMULA.asString;
end;

procedure TfrmFormula.SpeedButton1Click(Sender: TObject);
begin
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
   begin
     AbrirForm(FrmListaVariaveis,TFrmListaVariaveis,False );
     frmListaVariaveis.NoVariavel := '';
     frmListaVariaveis.Op := 'R';
   end;
end;

procedure TfrmFormula.SpeedButton2Click(Sender: TObject);
begin
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
   begin
    AbrirForm(FrmListaVariaveis,TFrmListaVariaveis,False );
    frmListaVariaveis.NoVariavel := '';
    frmListaVariaveis.Op := 'I';
   end; 
end;

procedure TfrmFormula.SpeedButton3Click(Sender: TObject);
begin
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
   begin
    AbrirForm(FrmListaVariaveis,TFrmListaVariaveis,False );
    frmListaVariaveis.NoVariavel := '';
    frmListaVariaveis.Op := 'F';
   end; 
end;

procedure TfrmFormula.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_FORMULA').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;//if sBtnInserir.down

   if DBEdtVarInicial.Text = '' Then
     qryPrincipal.FieldByName('NO_VARIAVEL_INICIAL').Value := Null
   Else
    If Get_String_Index(Wg_Variavel.Fvariavel,DBEdtVarInicial.Text) = -1 Then
     Begin
      Wg_Variavel.Destroy;
      Raise Exception.Create('Variável somatório inicial inválida');
      DBEdtVarInicial.SetFocus;
     End;

   if DBEdtVarFinal.Text = '' Then
     qryPrincipal.FieldByName('NO_VARIAVEL_FINAL').Value := Null
   Else
    if Get_String_Index(Wg_Variavel.Fvariavel,DBEdtVarFinal.Text) = -1 Then
     Begin
      Raise Exception.Create('Variável de somatório final inválida');
      DBEdtVarFinal.SetFocus;
     End;

   if DBEdtVarResult.Text = '' Then
     qryPrincipal.FieldByName('NO_VARIAVEL_RESULT').Value := Null
   Else
    if Get_String_Index(Wg_Variavel.Fvariavel,DBEdtVarResult.Text) = -1 Then
     Begin
      Raise Exception.Create('Variável de resultado inválida');
      DBEdtVarResult.SetFocus;
     End;

   If DBMmExpressao.Text <> '' Then
    If not Wg_Formula.Expressao_Valida(FormatExpresText) Then
     Begin
      DBMmExpressao.SetFocus;
      Raise Exception.Create(Wg_Formula.Ferros);
     End;

  Wg_Chave := qryPrincipal.FieldByName('CD_FORMULA').AsInteger;
end;

procedure TfrmFormula.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpDates;

   ExcluiVariavelFormula(Wg_Chave);
   AtualizaVariavelFormula(Wg_Chave);

   bbtnCancelar.Click;
  except
   bbtnCancelar.Click;
   exit;
  end;    
end;

procedure TfrmFormula.sbtnApagarClick(Sender: TObject);
begin
  inherited;

  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;

  SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmFormula.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If Wg_Chave > 0 Then
    Qryprincipal.Locate('CD_FORMULA',Wg_Chave,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmFormula.bbtnConfirmarClick(Sender: TObject);
begin
  if DBEdit1.text = '' then
   begin
     ShowMessage('Informe o Nome da Fórmula !');
     DBEdit1.SetFocus;
     exit;
   end;

  if (Trim(DBEdtVarInicial2.Text) <> '') and (Trim(DBEdtVarInicial.Text) = '') then
   begin
     MessageDlg('Informe a Variável Inicial 1.', mtWarning, [mbOk], 0);
     DBEdtVarInicial.SetFocus;
     Exit;
   end;

  inherited;
  SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmFormula.sbtnInserirClick(Sender: TObject);
begin
  btbtnExpressao.Enabled := true;

  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmFormula.sbtnAlterarClick(Sender: TObject);
begin
  btbtnExpressao.Enabled := true;

  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmFormula.btbtnExpressaoClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
    exit;
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
   begin
    AbrirForm(FrmExpressao,TFrmExpressao,False );
    frmExpressao.EditExpressao.Text := DBMmExpressao.Text;
    frmExpressao.DsFormula := DBMmExpressao.Text;
  end;
end;

procedure TfrmFormula.QryPrincipalDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('Fórmula já utilizada em rotina de cálculo - Operação não permitida');
  Action := daAbort;
end;

procedure TfrmFormula.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Wg_Variavel.Free;
  Wg_Formula.Free;
  qryRotina.Close;
  ClntDtStGrupoFormula.Close;

  inherited;
end;

procedure TfrmFormula.FormCreate(Sender: TObject);
begin
  ClntDtStGrupoFormula.CreateDataSet;
  ClntDtStGrupoFormula.AppendRecord(['C', 'Fórmula da Rotina de Cálculo Atuarial']);
  ClntDtStGrupoFormula.AppendRecord(['T', 'Rotina de Cálculo da Tabela de Comutação']);
  ClntDtStGrupoFormula.AppendRecord(['A', 'Ajuste de Cálculo da Tabela de Comutação']);

  Wg_Variavel := TVarCalc.Create(Self);
  Wg_Formula := TExpresCalc.Create;
  Wg_Formula.FVarCalcList := @Wg_Variavel;
  qryRotina.Open;

  inherited;  
end;

procedure TfrmFormula.QryPrincipalBeforeDelete(DataSet: TDataSet);
begin
  ExcluiVariavelFormula(qryPrincipal.FieldByName('CD_FORMULA').AsInteger);
end;

procedure TfrmFormula.qryVariavelFormulaAfterPost(DataSet: TDataSet);
begin
  try
   qryVariavelFormula.ApplyUpdates;
   qryVariavelFormula.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;   
end;

procedure TfrmFormula.DBEdtVarResultKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
   if key = VK_DELETE then
     (Sender as TDBEdit).text := '';
end;

procedure TfrmFormula.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  btbtnExpressao.Enabled := false;
end;

procedure TfrmFormula.SBtnGerarClick(Sender: TObject);
begin
  SBtnGerar.Down := false;
  if qryPrincipal.IsEmpty then
    exit;

  dtmRelatsAtuarial.rpFormula.Print;
end;

procedure TfrmFormula.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_FORMULA', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

procedure TfrmFormula.DBLkpCmbBxGrupoFormulaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (QryPrincipal.State in [dsInsert, dsEdit]) and (Key = VK_DELETE) then
    QryPrincipalIR_GRUPO_FORMULA.Clear;
end;

procedure TfrmFormula.SpeedButton4Click(Sender: TObject);
begin
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
   begin
    AbrirForm(FrmListaVariaveis, TFrmListaVariaveis, False );
    frmListaVariaveis.NoVariavel := '';
    frmListaVariaveis.Op := 'Z';
   end; 
end;

end.
