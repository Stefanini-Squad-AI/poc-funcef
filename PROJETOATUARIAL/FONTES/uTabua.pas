{===============================================================================
Unit    :  uTabua
Form    :  frmTabua

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar Tábuas e suas Ocorrências

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uTabua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, {Mask, wwdbloot, }
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask,
  CmEventosCadastro, wwDialog, ImgList, DBTables, MontaSelect;

type
  TfrmTabua = class(TfrmCadastro)
    Label7: TLabel;
    Label8: TLabel;
    LkcTbTipoTabua: TwwDBLookupCombo;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    DbGrdDet: TwwDBGrid;
    PnlDetalhe: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    DBEdit1: TDBEdit;
    DtEdit: TCMDateTimePicker;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    QryPrincipal: TwwQuery;
    qryTipoTabua: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    QryDetalhe: TwwQuery;
    DsDet: TwwDataSource;
    UpdtSQLDet: TUpdateSQL;
    QryPrincipalCD_TABUA: TFloatField;
    QryPrincipalSG_TABUA: TStringField;
    QryPrincipalDS_TABUA: TStringField;
    QryPrincipalDT_REF_TABUA: TDateTimeField;
    QryPrincipalCD_TIPO_TABUA: TFloatField;
    QryPrincipalDS_TIPO_TABUA: TStringField;
    qryTipoTabuaCD_TIPO_TABUA: TFloatField;
    qryTipoTabuaDS_TIPO_TABUA: TStringField;
    QryDetalheCD_TABUA: TFloatField;
    QryDetalheNR_IDADE: TFloatField;
    QryDetalheNR_L_X: TFloatField;
    QryDetalheNR_P_X: TFloatField;
    QryDetalheNR_D_X: TFloatField;
    QryDetalheNR_Q_X: TFloatField;
    QryDetalheNR_I_X: TFloatField;
    BtExclAll: TSpeedButton;
    btbtnImportar: TBitBtn;
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    MontaSelect: TMontaSelect;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure BtExclAllClick(Sender: TObject);
    procedure btbtnImportarClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure QryDetalheAfterOpen(DataSet: TDataSet);
    procedure SBtnGerarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabua: TfrmTabua;
  WidReg, wIdRegDet: Integer;
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)

implementation

uses FTelaAut, uImportarTabua, DRelatsAtuarial;

{$R *.DFM}

procedure TfrmTabua.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
  qryTipoTabua.Open;
  qryDetalhe.Open;

  if (qryPrincipal.BOF) and (qryPrincipal.EOF) then
   begin
    PrincipalPost := false;
    btbtnImportar.Enabled := false;
   end
  else
   begin
    PrincipalPost := true;
    btbtnImportar.Enabled := true;
   end;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible  :=True;
  SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmTabua.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryTipoTabua.Close;
  qryDetalhe.Close;
end;

procedure TfrmTabua.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(DBEdit4.Text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DBEdit4.SetFocus;
    exit;
   end;
  if trim(LkcTbTipoTabua.text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    LkcTbTipoTabua.SetFocus;
    exit;
   end;
  inherited;

  DBEdit1.SetFocus;
  qryPrincipal.Close;
  qryPrincipal.Open;
  bbtnCancelar.Click;
end;

procedure TfrmTabua.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoTabua.Visible := false;
  DBEdit2.Visible := true;
  DtEdit.Visible := false;
  DBEdit3.Visible := true;

  BtIns.Enabled :=True;
  BtAlt.Enabled:=True;
  BtExcl.Enabled:=True;
  BtExclAll.Enabled:=True;


  if qryPrincipal.RecordCount = 0 then
   begin
     SBtnGerar.Enabled := false;
     PrincipalPost := false;
     btbtnImportar.Enabled := false;
   end
  else
   begin
     SBtnGerar.Enabled := true;
     PrincipalPost := true;
     btbtnImportar.Enabled := true;
   end;  
end;

procedure TfrmTabua.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  PrincipalPost := false;

  LkcTbTipoTabua.Visible := true;
  DBEdit2.Visible := false;
  DtEdit.Visible := true;
  DBEdit3.Visible := false;
  LkcTbTipoTabua.Text := '';
  DtEdit.Text := '';
  DBEdit1.SetFocus;
  btbtnImportar.Enabled := false;

  BtIns.Enabled :=False;
  BtAlt.Enabled:=False;
  BtExcl.Enabled:=False;
  BtExclAll.Enabled:=False;
end;

procedure TfrmTabua.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  PrincipalPost := false;

  LkcTbTipoTabua.Visible := true;
  DBEdit2.Visible := false;
  DtEdit.Visible := true;
  DBEdit3.Visible := false;
  LkcTbTipoTabua.Text := DBEdit2.text;
  DtEdit.Text := DBEdit3.text;
  DBEdit1.SetFocus;
  btbtnImportar.Enabled := false;

  BtIns.Enabled :=False;
  BtAlt.Enabled:=False;
  BtExcl.Enabled:=False;
  BtExclAll.Enabled:=False;
end;

procedure TfrmTabua.sbtnApagarClick(Sender: TObject);
begin
  If QryDetalhe.RecordCount > 0 then
   begin
    qryDetalhe.DisableControls;
    if MessageBox(0,'Deseja apagar todas as Ocorrências da Tábua ?','Cálculo Atuarial',4) = IdYes Then
     Begin
      repeat
       qryDetalhe.Delete;
       qryDetalhe.ApplyUpdates;
       qryDetalhe.CommitUpdates;
       qryDetalhe.Close;
       qryDetalhe.Open;
      until qryDetalhe.RecordCount = 0;
      SBtnApagar.Down := false;
     end
    else
     begin
       SBtnApagar.Down := false;
       exit;
     end;
    qryDetalhe.EnableControls; 
   end
  else if MessageBox(0,'Deseja realmente apagar a Tábua ?','Cálculo Atuarial',4) <> IdYes Then
   begin
    SBtnApagar.Down := false;
    exit;
   end; 

  SBtnApagar.Down := false; 
  qryPrincipal.Delete;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;

  if qryPrincipal.RecordCount = 0 then
   begin
    SBtnGerar.Enabled := false;
    BtIns.Enabled :=False;
    BtAlt.Enabled:=False;
    BtExcl.Enabled:=False;
    BtExclAll.Enabled:=False;
    PrincipalPost := false;
    btbtnImportar.Enabled := false;
    SBtnAlterar.Enabled := false;
    SBtnApagar.Enabled := false;
   end
  else
   begin
    SBtnGerar.Enabled := true;
    PrincipalPost := true;
    btbtnImportar.Enabled := true;
   end;
end;

procedure TfrmTabua.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     qryPrincipal.FieldByName('CD_TABUA').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;

     if trim(dtEdit.Text) = '' then
       qryPrincipal.FieldByName('DT_REF_TABUA').Value := null
     else
       qryPrincipal.FieldByName('DT_REF_TABUA').AsDateTime := StrToDate(dtEdit.Text);

     qryPrincipal.FieldByName('CD_TIPO_TABUA').AsInteger :=
             qryTipoTabua.FieldByName('CD_TIPO_TABUA').asInteger;
   end
  // Caso Botão Alterar
  else if SBtnAlterar.Down then
   begin
     if trim(dtEdit.Text) = '' then
       qryPrincipal.FieldByName('DT_REF_TABUA').Value := null
     else
       qryPrincipal.FieldByName('DT_REF_TABUA').AsDateTime := StrToDate(dtEdit.Text);

     qryPrincipal.FieldByName('CD_TIPO_TABUA').AsInteger :=
             qryTipoTabua.FieldByName('CD_TIPO_TABUA').asInteger;
   end;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TABUA').AsInteger;
end;

procedure TfrmTabua.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmTabua.BtInsClick(Sender: TObject);
begin
  if PrincipalPost then
   begin
    // Abaixa Botao
    BtIns.Down :=True;
    // Inabilita Botoes de Detalhe
    BtAlt.Enabled :=False;
    BtProc.Enabled:=False;
    BtExcl.Enabled:=False;
    BtExclAll.Enabled:=False;
    // Esconde Grid Mostra Painel
    DbGrdDet.Visible  :=False;
    PnlDetalhe.Visible:=True;
    DbEdit5.SetFocus;
    DBEdit5.Enabled := true;
    // Inclui Novo Registro
    QryDetalhe.Append;
   end
  else
   begin
    BtIns.Down := false;
    exit;
   end;
end;

procedure TfrmTabua.btAltClick(Sender: TObject);
begin
  if PrincipalPost then
   begin
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
    BtExclAll.Enabled:=False;
    // Esconde Grid Mostra Painel
    DbGrdDet.Visible  :=False;
    PnlDetalhe.Visible:=True;
    DbEdit6.SetFocus;
    DBEdit5.Enabled := false;
    // Alterar Registro
    QryDetalhe.Edit;
   end
  else
   begin
    BtAlt.Down := False;
    exit;
   end;
end;

procedure TfrmTabua.BtExclClick(Sender: TObject);
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
      if MessageBox(0,'Deseja realmente apagar este registro?','Cálculo Atuarial',4) = IdYes Then
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

procedure TfrmTabua.BtProcClick(Sender: TObject);
begin
// Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;
// Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmTabua.bbtnOkDetClick(Sender: TObject);
begin
  if trim(DBEdit5.text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DBEdit5.SetFocus;
    exit;
   end;
  with qryDetalhe do
   begin
     try
      Post;
      ApplyUpDates;
      CommitUpDates;
     except
      bbtnCancelar.Click;
      exit;
     end;
   end;
  bbtnCancelarDet.Click;
end;

procedure TfrmTabua.bbtnCancelarDetClick(Sender: TObject);
begin
// Levanta Botoes
  BtIns.Down :=False;
  BtAlt.Down :=False;
// Inabilita Botoes
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
  BtExclAll.Enabled:=True;

  DBEdit5.Enabled := true;
// ReExecuta a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible  :=True;
end;

procedure TfrmTabua.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If BtIns.Down Then
   begin
    qryDetalhe.FieldByName('CD_TABUA').AsInteger :=
                 qryPrincipal.FieldByName('CD_TABUA').asInteger;
    qryDetalhe.FieldByName('NR_IDADE').AsInteger := StrToInt(DBEdit5.text);
   end;

  wIdRegDet := 0;
  wIdReg := QryDetalhe.FieldByName('NR_IDADE').AsInteger;
end;

procedure TfrmTabua.BtExclAllClick(Sender: TObject);
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
      DisableControls;
      // Se Confirmar, Exclui Registro Posicionado
      if MessageBox(0,'Deseja realmente apagar Todos os Registros?','Cálculo Atuarial',4) = IdYes Then
       Begin
        repeat
         qryDetalhe.Delete;
         qryDetalhe.ApplyUpdates;
         qryDetalhe.CommitUpdates;
         qryDetalhe.Close;
         qryDetalhe.Open;
        until qryDetalhe.RecordCount = 0;
       End;
      EnableControls;
     End;
   end
  else
    exit;
end;

procedure TfrmTabua.btbtnImportarClick(Sender: TObject);
begin
  screen.cursor := crHourGlass;
  if (SBtnInserir.Down) or (SBtnAlterar.Down) then
    bbtnConfirmar.Click;
    
  AbrirForm(frmImportarTabua,TfrmImportarTabua,False );

  screen.cursor := crDefault;
  if frmImportarTabua.qryTabua.Locate('CD_TABUA',
     qryPrincipal.FieldByName('CD_TABUA').asInteger, []) then
       frmImportarTabua.DBCmbBxTabuaGeral.text :=
       qryPrincipal.FieldByName('DS_TABUA').asString;
    
  bbtnSair.Click;    
end;

procedure TfrmTabua.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TABUA',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmTabua.QryDetalheAfterOpen(DataSet: TDataSet);
begin
  qryDetalhe.DisableControls;
  If wIdRegDet > 0 Then
    qryDetalhe.Locate('NR_IDADE',wIdReg,[]);
  qryDetalhe.EnableControls;
end;

procedure TfrmTabua.SBtnGerarClick(Sender: TObject);
begin
  SBtnGerar.Down := false;
  if qryPrincipal.IsEmpty then
    exit;

  dtmRelatsAtuarial.qryEmiteTabua.Close;
  dtmRelatsAtuarial.qryEmiteTabua.ParamByName('CD_TABUA').asInteger :=
                                 qryPrincipal.FieldByName('CD_TABUA').asInteger;
  dtmRelatsAtuarial.qryEmiteTabua.Open;

  dtmRelatsAtuarial.rpTabua.Print;
  
  dtmRelatsAtuarial.qryEmiteTabua.Close;
end;

procedure TfrmTabua.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_TABUA', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

procedure TfrmTabua.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  DtEdit.Date := Date;
end;

end.
