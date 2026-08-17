{===============================================================================
Unit    :  uPlanoBeneficio
Form    :  frmPlanoBeneficio

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar Planos de Benefício.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uPlanoBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Mask, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CmEventosCadastro,
  wwDialog, ImgList, MontaSelect;

type
  TfrmPlanoBeneficio = class(TfrmCadastro)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label6: TLabel;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    PnlDetalhe: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DbGrdDet: TwwDBGrid;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryDetalhe: TwwQuery;
    DsDet: TwwDataSource;
    UpdtSQLDet: TUpdateSQL;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LkcTbPatroc: TwwDBLookupCombo;
    LkcTbEntid: TwwDBLookupCombo;
    DtEdit1: TCMDateTimePicker;
    DtEdit2: TCMDateTimePicker;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    qryPatroc: TwwQuery;
    qryPatrocCD_PESSOA: TFloatField;
    qryPatrocNO_PESSOA: TStringField;
    qryEntid: TwwQuery;
    qryEntidCD_PESSOA: TFloatField;
    qryEntidNO_PESSOA: TStringField;
    qryAux: TwwQuery;
    QryPrincipalCD_PESSOA_PATROC: TFloatField;
    QryPrincipalCD_PESSOA_ENTID: TFloatField;
    QryPrincipalCD_PLANO: TFloatField;
    QryPrincipalNO_PLANO: TStringField;
    QryPrincipalDT_CRIACAO_PLANO: TDateTimeField;
    QryPrincipalDT_EXTINCAO_PLANO: TDateTimeField;
    QryPrincipalVL_MAIOR_SAL_CONTRIB: TFloatField;
    QryPrincipalDS_OBSERV: TMemoField;
    qryTipoBenef: TwwQuery;
    qryTipoBenefCD_TIPO_BENEF: TFloatField;
    qryTipoBenefDS_TIPO_BENEF: TStringField;
    LkcTbBenef: TwwDBLookupCombo;
    QryDetalheCD_PESSOA_PATROC: TFloatField;
    QryDetalheCD_PESSOA_ENTID: TFloatField;
    QryDetalheCD_PLANO: TFloatField;
    QryDetalheVL_MINIMO_BENEFICIO: TFloatField;
    QryDetalheVL_MAXIMO_BENEFICIO: TFloatField;
    QryDetalheCD_TIPO_BENEF: TFloatField;
    QryDetalheDS_TIPO_BENEF: TStringField;
    TbShObservacoes: TTabSheet;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    qryGrupoPartic: TwwQuery;
    EdtSalario: TEdit;
    DBEdit2: TDBEdit;
    EdtValMin: TEdit;
    EdtValMax: TEdit;
    MontaSelect: TMontaSelect;
    QryGrupoBeneficio: TwwQuery;
    QryDetalheCD_GRUPO_BENEFICIO: TFloatField;
    QryDetalheDS_GRUPO_BENEFICIO: TStringField;
    QryGrupoBeneficioCD_GRUPO_BENEFICIO: TFloatField;
    QryGrupoBeneficioDS_GRUPO_BENEFICIO: TStringField;
    Label10: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure AtualizaCombos;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanoBeneficio: TfrmPlanoBeneficio;
  wIdReg: String;  
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)

implementation

uses uFuncGerais;

{$R *.DFM}

// Dá um Refresh nos campos de Patrocinadora e Entidade Previdência
procedure TfrmPlanoBeneficio.AtualizaCombos;
begin
  if qryPrincipal.RecordCount = 0 then
   begin
    LkcTbPatroc.Text := '';
    LkcTbEntid.Text := '';
   end;
   
  if qryPatroc.Locate('CD_PESSOA',
                   qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger,
                   [loPartialKey]) then
    LkcTbPatroc.Text := qryPatroc.FieldByName('NO_PESSOA').asString;
  if qryEntid.Locate('CD_PESSOA',
                   qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger,
                   [loPartialKey]) then
    LkcTbEntid.Text := qryEntid.FieldByName('NO_PESSOA').asString;
end;

procedure TfrmPlanoBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
  qryPatroc.Open;
  qryEntid.Open;
  qryDetalhe.Open;
  qryTipoBenef.Open;
  AtualizaCombos;
  if (qryPrincipal.BOF) and (qryPrincipal.EOF) then
    PrincipalPost := false
  else
    PrincipalPost := true;
// Mostra Grid
  PgCtrlDetalhe.ActivePage := tbshDetalhe;
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible  :=True;

  QryGrupoBeneficio.Open;
  //---
end;

procedure TfrmPlanoBeneficio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryPatroc.Close;
  qryEntid.Close;
  qryDetalhe.Close;
  qryTipoBenef.Close;

  QryGrupoBeneficio.Open;
  //---  
end;

procedure TfrmPlanoBeneficio.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(EdtSalario.text) <> '' then
    EdtSalario.Text := FormataFloat(EdtSalario.Text);

  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe o Nome do Plano !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(LkcTbPatroc.text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    LkcTbPatroc.SetFocus;
    exit;
   end;
  if trim(LkcTbEntid.text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    LkcTbEntid.SetFocus;
    exit;
   end;
  if trim(DtEdit1.Text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DtEdit1.SetFocus;
    exit;
   end;
  inherited;
  LkcTbPatroc.Enabled := false;
  LkcTbEntid.Enabled := false;
  DBEdit1.SetFocus;
  DtEdit1.Visible := false;
  DtEdit2.Visible := false;
  DBEdit3.Visible := true;
  DBEdit4.Visible := true;
  bbtnCancelar.Click;
end;

procedure TfrmPlanoBeneficio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DbEdit2.Visible := true;
  EdtSalario.Visible := false;
  LkcTbPatroc.Enabled := false;
  LkcTbEntid.Enabled := false;
  DBEdit1.SetFocus;
  DtEdit1.Visible := false;
  DtEdit2.Visible := false;
  DBEdit3.Visible := true;
  DBEdit4.Visible := true;
  AtualizaCombos;

  BtIns.Enabled :=True;
  BtAlt.Enabled:=True;
  BtExcl.Enabled:=True;
  PgCtrlDetalhe.ActivePage := tbshDetalhe;

  if qryPrincipal.RecordCount = 0 then
    PrincipalPost := false
  else
    PrincipalPost := true;
end;

procedure TfrmPlanoBeneficio.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit2.Visible := false;
  EdtSalario.Visible := true;
  EdtSalario.Text := '';
  PrincipalPost := false;
  LkcTbPatroc.Enabled := true;
  LkcTbEntid.Enabled := true;
  LkcTbPatroc.Text := '';
  LkcTbEntid.Text := '';
  DtEdit1.Text := '';
  DtEdit2.Text := '';
  LkcTbPatroc.SetFocus;
  DtEdit1.Visible := true;
  DtEdit2.Visible := true;
  DBEdit3.Visible := false;
  DBEdit4.Visible := false;

  BtIns.Enabled :=False;
  BtAlt.Enabled:=False;
  BtExcl.Enabled:=False;
  PgCtrlDetalhe.ActivePage := tbshObservacoes;  
end;

procedure TfrmPlanoBeneficio.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DbEdit2.Visible := false;
  EdtSalario.Visible := true;
  EdtSalario.text := qryPrincipal.FieldByName('VL_MAIOR_SAL_CONTRIB').asString;
  PrincipalPost := false;
  LkcTbPatroc.Enabled := false;
  LkcTbEntid.Enabled := false;
  DtEdit1.Text := DBEdit3.Text;
  DtEdit2.Text := DBEdit4.Text;
  DtEdit1.Visible := true;
  DtEdit2.Visible := true;
  DBEdit3.Visible := false;
  DBEdit4.Visible := false;
  DBEdit1.SetFocus;

  BtIns.Enabled :=False;
  BtAlt.Enabled:=False;
  BtExcl.Enabled:=False;
  PgCtrlDetalhe.ActivePage := tbshObservacoes;
end;

procedure TfrmPlanoBeneficio.sbtnApagarClick(Sender: TObject);
begin
  If QryDetalhe.RecordCount > 0 then
   begin
    if MessageBox(0,'Deseja apagar todos os Benefícios?','Cálculo Atuarial',4) = IdYes Then
     Begin
      repeat
       qryDetalhe.Delete;
       qryDetalhe.ApplyUpdates;
       qryDetalhe.CommitUpdates;
       qryDetalhe.Close;
       qryDetalhe.Open;
      until qryDetalhe.RecordCount = 0;
     end
    else
     begin
      SBtnApagar.Down := false;
      exit;
     end;
   end
  else if MessageBox(0,'Deseja realmente apagar o Plano?','Cálculo Atuarial',4) <> IdYes Then
   begin
    SBtnApagar.Down := false;
    exit;
   end;

  qryPrincipal.Delete;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
  AtualizaCombos;
  SBtnApagar.Down := false;

  if qryPrincipal.RecordCount = 0 then
   begin
    BtIns.Enabled :=False;
    BtAlt.Enabled:=False;
    BtExcl.Enabled:=False;
    PrincipalPost := false;
   end
  else
    PrincipalPost := true;
end;

procedure TfrmPlanoBeneficio.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  if trim(DtEdit2.text) <> '' then
   begin
     if DtEdit1.Date >= DtEdit2.Date then
      Begin
       showmessage('Data de Extinção do Plano deve ser maior que a Data de Criação !');
       exit;
      End;
   end;

  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryPrincipal.FieldByName('CD_PESSOA_PATROC').AsInteger :=
             qryPatroc.FieldByName('CD_PESSOA').asInteger;
     qryPrincipal.FieldByName('CD_PESSOA_ENTID').AsInteger :=
             qryEntid.FieldByName('CD_PESSOA').asInteger;

     qryAux.ParamByName('Patroc').asInteger :=
             qryPatroc.FieldByName('CD_PESSOA').asInteger;
     qryAux.ParamByName('Entid').asInteger :=
             qryEntid.FieldByName('CD_PESSOA').asInteger;
     qryAux.Open;

     qryPrincipal.FieldByName('CD_PLANO').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);

     qryAux.Close;

     qryPrincipal.FieldByName('DT_CRIACAO_PLANO').AsDateTime := StrToDate(dtEdit1.Text);
     if trim(dtEdit2.Text) = '' then
       qryPrincipal.FieldByName('DT_EXTINCAO_PLANO').Value := null
     else
       qryPrincipal.FieldByName('DT_EXTINCAO_PLANO').AsDateTime := StrToDate(dtEdit2.Text);
   end
  // Caso Botão Alterar
  else if SBtnAlterar.Down then
   begin
     qryPrincipal.FieldByName('DT_CRIACAO_PLANO').AsDateTime := StrToDate(dtEdit1.Text);
     if trim(dtEdit2.Text) = '' then
       qryPrincipal.FieldByName('DT_EXTINCAO_PLANO').Value := null
     else
       qryPrincipal.FieldByName('DT_EXTINCAO_PLANO').AsDateTime := StrToDate(dtEdit2.Text);
   end;
  if trim(EdtSalario.text) = '' then
    EdtSalario.text := '0'; 
  qryPrincipal.FieldByName('VL_MAIOR_SAL_CONTRIB').asFloat := StrToFloat(EdtSalario.text);


  wIdReg := '';
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('NO_PLANO').AsString;
end;

procedure TfrmPlanoBeneficio.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
   PrincipalPost := true;
  except
   bbtnCancelar.Click;
   exit;
  end;     
end;

procedure TfrmPlanoBeneficio.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  AtualizaCombos;
end;

procedure TfrmPlanoBeneficio.BtInsClick(Sender: TObject);
begin
  if PrincipalPost then
   begin
    EdtValMin.Text := '';
    EdtValMax.Text := '';
    // Abaixa Botao
    BtIns.Down :=True;
    // Inabilita Botoes de Detalhe
    BtAlt.Enabled :=False;
    BtProc.Enabled:=False;
    BtExcl.Enabled:=False;
    // Esconde Grid Mostra Painel
    DbGrdDet.Visible  :=False;
    PnlDetalhe.Visible:=True;
    DbEdit4.SetFocus;

    LkcTbBenef.Text := '';
    LkcTbBenef.Enabled := true;
    
    // Inclui Novo Registro
    QryDetalhe.Append;
   end
  else
   begin
    BtIns.Down := false;
    exit;
   end;
end;

procedure TfrmPlanoBeneficio.btAltClick(Sender: TObject);
begin
  if PrincipalPost then
   begin
     EdtValMin.Text := qryDetalhe.FieldByName('VL_MINIMO_BENEFICIO').asString;
     EdtValMax.Text := qryDetalhe.FieldByName('VL_MAXIMO_BENEFICIO').asString;
    // Se Nao Houverem Registros de Detalhe, Sai
    If QryDetalhe.RecordCount=0 then
     begin
      BtAlt.Down := False;
      Exit;
     End;
    // Abaixa Botao
    BtAlt.Down    :=True;
    // Inabilita Botoes de Detalhe
    BtIns.Enabled :=False;
    BtProc.Enabled:=False;
    BtExcl.Enabled:=False;
    // Esconde Grid Mostra Painel
    DbGrdDet.Visible  :=False;
    PnlDetalhe.Visible:=True;
    DbEdit4.SetFocus;

    LkcTbBenef.Text := qryDetalhe.FieldByName('DS_TIPO_BENEF').asString;
    LkcTbBenef.Enabled := false;

    // Alterar Registro
    QryDetalhe.Edit;
   end
  else
   begin
    BtAlt.Down := False;
    exit;
   end;
end;

procedure TfrmPlanoBeneficio.BtExclClick(Sender: TObject);
begin
  if PrincipalPost then
   begin
    // Executa query de Detalhe
    With QryDetalhe Do
     Begin
      // Se Nao Houverem Registros de Detalhe, Sai
      If QryDetalhe.RecordCount=0 then
       begin
        Exit;
       End;
      // Se Confirmar, Exclui Registro Posicionado
      if MessageBox(0,'Deseja realmente apagar este registro ?','Cálculo Atuarial',4) = IdYes Then
       Begin
        Delete;
        ApplyUpdates;
        CommitUpDates;
        Close;
        Open;
       End;
     End;
   end
  else
    exit;
end;

procedure TfrmPlanoBeneficio.BtProcClick(Sender: TObject);
begin
// Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;
// Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmPlanoBeneficio.bbtnOkDetClick(Sender: TObject);
begin
  if trim(EdtValMin.Text) = '' then
    EdtValMin.Text := '0';
  if trim(EdtValMax.Text) = '' then
    EdtValMax.Text := '0';
  EdtValMin.Text := FormataFloat(EdtValMin.Text);
  EdtValMax.Text := FormataFloat(EdtValMax.Text);
  if trim(LkcTbBenef.text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    LkcTbBenef.SetFocus;
    exit;
   end;
  with qryDetalhe do
   begin
     try
      Post;
      ApplyUpDates;
      CommitUpDates;
     except
      bbtnCancelarDet.Click;
      exit;
     end;
   end;
  bbtnCancelarDet.Click; 
end;

procedure TfrmPlanoBeneficio.bbtnCancelarDetClick(Sender: TObject);
begin
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
end;

procedure TfrmPlanoBeneficio.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If BtIns.Down Then
   begin
     qryDetalhe.FieldByName('CD_PESSOA_PATROC').AsInteger :=
                  qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
     qryDetalhe.FieldByName('CD_PESSOA_ENTID').AsInteger :=
                  qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
     qryDetalhe.FieldByName('CD_PLANO').AsInteger :=
                  qryPrincipal.FieldByName('CD_PLANO').asInteger;
     qryDetalhe.FieldByName('CD_TIPO_BENEF').AsInteger :=
                  qryTipoBenef.FieldByName('CD_TIPO_BENEF').asInteger;
   end;

   qryDetalhe.FieldByName('VL_MINIMO_BENEFICIO').asFloat := StrToFloat(EdtValMin.Text);
   qryDetalhe.FieldByName('VL_MAXIMO_BENEFICIO').asFloat := StrToFloat(EdtValMax.Text);
end;

procedure TfrmPlanoBeneficio.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg <> '' Then
     Begin
       Qryprincipal.Locate('NO_PLANO',wIdReg,[]);
       wIdReg := '';
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmPlanoBeneficio.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_PESSOA_PATROC;CD_PESSOA_ENTID;CD_PLANO;', VarArrayOf([MontaSelect.ValoresChave[0],
                       MontaSelect.ValoresChave[1], MontaSelect.ValoresChave[2]]), []);

  sbtnProcurar.Down := False;
end;

end.
