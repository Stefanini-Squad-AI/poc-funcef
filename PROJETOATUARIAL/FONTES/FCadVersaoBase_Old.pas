{===============================================================================
Unit    :  FCadVersaoBase
Form    :  frmCadVersaoBase

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 19/07/2000

Objetivo: Cadastrar as Versões da Base de Dados.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadVersaoBase_Old;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  DBTables, {wquert, }Mask, wwdblook, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, {Mask, }CmEventosCadastro, wwDialog, ImgList,
  MontaSelect;

type
  TfrmCadVersaoBase_Old = class(TfrmCadastro)
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    DateEdit: TCMDateTimePicker;
    Label7: TLabel;
    LkcTbPatroc: TwwDBLookupCombo;
    Label8: TLabel;
    LkcTbEntid: TwwDBLookupCombo;
    Label3: TLabel;
    LkcTbPlano: TwwDBLookupCombo;
    qryEntid: TwwQuery;
    qryEntidNO_PESSOA: TStringField;
    qryEntidCD_PESSOA: TFloatField;
    qryPatroc: TwwQuery;
    qryPatrocNO_PESSOA: TStringField;
    qryPatrocCD_PESSOA: TFloatField;
    qryPlano: TwwQuery;
    qryPlanoCD_PLANO: TFloatField;
    qryPlanoNO_PLANO: TStringField;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    qryPlan: TwwQuery;
    qryPlanNO_PLANO: TStringField;
    dsPlan: TwwDataSource;
    qryEnt: TwwQuery;
    qryEntNO_PESSOA: TStringField;
    dsEnt: TwwDataSource;
    qryPat: TwwQuery;
    qryPatNO_PESSOA: TStringField;
    dsPat: TwwDataSource;
    GroupBox1: TGroupBox;
    qryBasePlano: TwwQuery;
    dsBasePlano: TwwDataSource;
    UpdtSQLBasePlano: TUpdateSQL;
    DBChkBxBaseHist: TDBCheckBox;
    qryPatCD_PESSOA: TFloatField;
    qryEntCD_PESSOA: TFloatField;
    qryPlanCD_PLANO: TFloatField;
    QryPrincipalCD_VERSAO: TFloatField;
    QryPrincipalDS_VERSAO: TStringField;
    QryPrincipalDT_GERACAO: TDateTimeField;
    QryPrincipalLOGIN: TStringField;
    QryPrincipalDT_REFER_BASE: TDateTimeField;
    QryPrincipalIR_BASE_HISTORICA: TStringField;
    QryPrincipalCD_VERSAO_1: TFloatField;
    QryPrincipalCD_PESSOA_PATROC: TFloatField;
    QryPrincipalCD_PESSOA_ENTID: TFloatField;
    QryPrincipalCD_PLANO: TFloatField;
    qryBasePlanoCD_VERSAO: TFloatField;
    qryBasePlanoCD_PESSOA_PATROC: TFloatField;
    qryBasePlanoCD_PESSOA_ENTID: TFloatField;
    qryBasePlanoCD_PLANO: TFloatField;
    wwQryExcluiParticipante: TwwQuery;
    MontaSelect: TMontaSelect;
    procedure LkcTbPatrocChange(Sender: TObject);
    procedure LkcTbEntidChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure qryBasePlanoBeforePost(DataSet: TDataSet);
    procedure qryBasePlanoAfterPost(DataSet: TDataSet);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    versao_nova, versao_velha: Integer;
    op: Char;
  end;

var
  frmCadVersaoBase_Old: TfrmCadVersaoBase_Old;
  wIdReg: Integer;
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)  

implementation

uses uSistema, uImportarVersaoBase, dBaseDados, FAnimacao;

{$R *.DFM}

procedure TfrmCadVersaoBase_Old.LkcTbPatrocChange(Sender: TObject);
begin
  if trim(LkcTbPatroc.Text) <> '' then
    LkcTbEntid.Enabled := True
  else
   begin
    LkcTbEntid.Text := '';
    LkcTbEntid.Enabled := False;
    LkcTbPlano.Text := '';
    LkcTbPlano.Enabled := False;
   end;
end;

procedure TfrmCadVersaoBase_Old.LkcTbEntidChange(Sender: TObject);
begin
  if trim(LkcTbEntid.Text) <> '' then
    LkcTbPlano.Enabled := True
  else
   begin
    LkcTbPlano.Text := '';
    LkcTbPlano.Enabled := False;
   end;

  if LkcTbPlano.Enabled then
   begin
    qryPlano.Close;
    qryPlano.ParamByName('CD_PESSOA_PATROC').asInteger :=
      qryPatroc.FieldByName('CD_PESSOA').asInteger;
    qryPlano.ParamByName('CD_PESSOA_ENTID').asInteger :=
      qryEntid.FieldByName('CD_PESSOA').asInteger;
    qryPlano.Open;  
   end;
end;

procedure TfrmCadVersaoBase_Old.FormCreate(Sender: TObject);
begin
  inherited;
  qryBasePlano.Open;
  qryPatroc.Open;
  qryEntid.Open;
  qryPlano.Open;

  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;

  qryPat.ParamByName('CD_PESSOA_PATROC').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPat.Open;

  qryEnt.ParamByName('CD_PESSOA_ENTID').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryEnt.Open;
  
  qryPlan.ParamByName('CD_PESSOA_PATROC').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPlan.ParamByName('CD_PESSOA_ENTID').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryPlan.Open;

  if (qryPrincipal.BOF) and (qryPrincipal.EOF) then
    PrincipalPost := false
  else
    PrincipalPost := true;  
end;

procedure TfrmCadVersaoBase_Old.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryBasePlano.Close;
  qryPatroc.Close;
  qryEntid.Close;
  qryPlano.Close;

  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;
end;

procedure TfrmCadVersaoBase_Old.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.Text) = '' then
   begin
    ShowMessage('Informe a Descrição da Versão !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(DateEdit.Text) = '' then
   begin
    ShowMessage('Informe a Data de Referência da Base !');
    DateEdit.SetFocus;
    exit;
   end;     
  if trim(LkcTbPlano.Text) = '' then
   begin
    ShowMessage('Selecione a Entidade/Patrocinadora/Plano !');
    LkcTbPatroc.SetFocus;
    exit;
   end;
  inherited;

  bbtnCancelar.Click;

  if op = 'N' then
   begin
     screen.cursor := crHourGlass;
     if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
     dtmBaseDados.dbBaseDados.StartTransaction;

     RestauraBaseHistorico(qryPrincipal.FieldByName('CD_VERSAO').asInteger,
                        qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger,
                        qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger,
                        qryPrincipal.FieldByName('CD_PLANO').asInteger,
                        versao_velha);

     if uImportarVersaoBase.cancelado then
      begin
        dtmBaseDados.dbBaseDados.RollBack;
        screen.cursor := crDefault;
        exit;
      end
     else
     if uImportarVersaoBase.falhou then
      begin
       dtmBaseDados.dbBaseDados.RollBack;
       try
         frmAnimacao.Close;
         frmAnimacao.Free;
       except  end;
       screen.cursor := crDefault;
       ShowMessage('Houve erros durante a Importação.');
       close;
       exit;
      end
     else
      begin
       dtmBaseDados.dbBaseDados.Commit;
       ShowMessage('Dados importados com Sucesso !!!');
       close;
      end;

     screen.cursor := crDefault;
     close;
   end;                     

  qryBasePlano.Close;
  qryBasePlano.Open;
  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;
  qryPat.ParamByName('CD_PESSOA_PATROC').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPat.Open;

  qryEnt.ParamByName('CD_PESSOA_ENTID').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryEnt.Open;

  qryPlan.ParamByName('CD_PESSOA_PATROC').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPlan.ParamByName('CD_PESSOA_ENTID').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryPlan.Open;  
end;

procedure TfrmCadVersaoBase_Old.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DateEdit.Visible := false;
  DBEdit4.Visible := true;

  DateEdit.Enabled := true;
  DBEdit3.Visible := true;
  LkcTbPatroc.Visible := false;
  DBEdit5.Visible := true;
  LkcTbEntid.Visible := false;
  DBEdit6.Visible := true;
  LkcTbPlano.Visible := false;
  DBChkBxBaseHist.Enabled := true;

  DBEdit1.SetFocus;

  if not(bbtnCancelar.Enabled) then
    bbtnCancelar.Enabled := true;
  if not(bbtnSair.Enabled) then
    bbtnSair.Enabled := true;
  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;
  qryPat.Open;
  qryEnt.Open;
  qryPlan.Open;  

  if qryPrincipal.RecordCount = 0 then
    PrincipalPost := false
  else
    PrincipalPost := true;     
end;

procedure TfrmCadVersaoBase_Old.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  PrincipalPost := false;
  DBEdit2.Text := Sistema.NomeUsuario;

  DateEdit.Visible := true;
  DBEdit4.Visible := false;
  DateEdit.Text := '';

  DBEdit3.Visible := false;
  LkcTbPatroc.Visible := true;
  DBEdit5.Visible := false;
  LkcTbEntid.Visible := true;
  DBEdit6.Visible := false;
  LkcTbPlano.Visible := true;
  DBChkBxBaseHist.Enabled := false;
  LkcTbPatroc.Text := '';
  LkcTbEntid.Text := '';
  LkcTbPlano.Text := '';

  DBEdit1.SetFocus;
end;

procedure TfrmCadVersaoBase_Old.sbtnAlterarClick(Sender: TObject);
begin
//Não permite alterar Versão da Base de Histórico
  if DBChkBxBaseHist.Checked then
   begin
    ShowMessage('Impossível Alterar uma Base de Histórico. ');
    SBtnAlterar.Down := false;
    exit;
   end;
    
  inherited;
  PrincipalPost := false;
  DateEdit.Visible := true;
  DateEdit.Enabled := false;
  DBEdit4.Visible := false;
  DateEdit.Text := DBEdit4.Text;

  DBEdit3.Visible := false;
  LkcTbPatroc.Visible := true;
  DBEdit5.Visible := false;
  LkcTbEntid.Visible := true;
  DBEdit6.Visible := false;
  LkcTbPlano.Visible := true;
  DBChkBxBaseHist.Enabled := false;
  LkcTbPatroc.Text := DBEdit3.Text;
  LkcTbEntid.Text := DBEdit5.Text;
  LkcTbPlano.Text := DBEdit6.Text;

  DBEdit1.SetFocus;
end;

procedure TfrmCadVersaoBase_Old.sbtnApagarClick(Sender: TObject);
var
  CD_VERSAO : integer;



begin
//Não permite excluir Versão da Base de Histórico
  if DBChkBxBaseHist.Checked then
   begin
     ShowMessage('Não é permitido excluir versão pertencente a Base de Histórico. ');
     SBtnApagar.Down := false;
     exit;
   end;

  if MessageBox(0,'Deseja excluir a Versão da Base de Dados ? Os dados de participantes desta versão também serão excluidos ! ','Cálculo Atuarial',4) = IdYes Then
     begin
       //-- Eclui Participantes
       CD_VERSAO :=  QryPrincipal.fieldByName('CD_VERSAO').asinteger;

       wwQryExcluiParticipante.close;
       wwQryExcluiParticipante.sql[0] := 'delete from  FI_VALOR_PARTICIPANTE   where CD_VERSAO = ' + inttostr(CD_VERSAO);
       wwQryExcluiParticipante.execsql;

       wwQryExcluiParticipante.close;
       wwQryExcluiParticipante.sql[0] := 'delete from  FI_TEMPO_PARTICIPANTE   where CD_VERSAO = ' + inttostr(CD_VERSAO);
       wwQryExcluiParticipante.execsql;

       wwQryExcluiParticipante.close;
       wwQryExcluiParticipante.sql[0] := 'delete from  FI_GRUPO_EXPORT_PARTIC   where CD_VERSAO = ' + inttostr(CD_VERSAO);
       wwQryExcluiParticipante.execsql;

       wwQryExcluiParticipante.close;
       wwQryExcluiParticipante.sql[0] := 'delete from  FI_DEPENDENTE   where CD_VERSAO = ' + inttostr(CD_VERSAO);
       wwQryExcluiParticipante.execsql;

       wwQryExcluiParticipante.close;
       wwQryExcluiParticipante.sql[0] := 'delete from  FI_PARTICIPANTE   where CD_VERSAO = ' + inttostr(CD_VERSAO);
       wwQryExcluiParticipante.execsql;

       //-----------------------------------------
       qryBasePlano.Delete;
       qryBasePlano.ApplyUpdates;
       qryBasePlano.CommitUpdates;
       //Atualiza Queries
       qryBasePlano.Close;
       qryBasePlano.Open;

       qryPrincipal.Delete;
       qryPrincipal.ApplyUpdates;
       qryPrincipal.CommitUpdates;

    end;

  SBtnApagar.Down := false;

  if qryPrincipal.RecordCount = 0 then
    PrincipalPost := false
  else
    PrincipalPost := true;

  qryBasePlano.Close;
  qryBasePlano.Open;
  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;
  qryPat.ParamByName('CD_PESSOA_PATROC').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPat.Open;

  qryEnt.ParamByName('CD_PESSOA_ENTID').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryEnt.Open;

  qryPlan.ParamByName('CD_PESSOA_PATROC').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPlan.ParamByName('CD_PESSOA_ENTID').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryPlan.Open;
end;

procedure TfrmCadVersaoBase_Old.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
     qryAux.Open;
     qryPrincipal.FieldByName('CD_VERSAO').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;

     qryPrincipal.FieldByName('DT_GERACAO').asDateTime := now;
     qryPrincipal.FieldByName('LOGIN').asString := Sistema.NomeUsuario; 
     qryPrincipal.FieldByName('IR_BASE_HISTORICA').asString := 'N';
     qryPrincipal.FieldByName('DT_REFER_BASE').asDateTime := StrToDate(DateEdit.Text);
   end;

  wIdReg := Qryprincipal.FieldByName('CD_VERSAO').AsInteger;
end;

procedure TfrmCadVersaoBase_Old.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;

   PrincipalPost := true;
   If SBtnInserir.Down Then
    qryBasePlano.Insert
   else If sbtnAlterar.Down Then
     qryBasePlano.Edit;

   qryBasePlanoBeforePost(qryBasePlano);
   qryBasePlanoAfterPost(qryBasePlano);
  except
   bbtnCancelar.Click;
   exit;
  end;
  qryBasePlano.Close;
  qryBasePlano.Open;
end;

procedure TfrmCadVersaoBase_Old.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
   Qryprincipal.Locate('CD_VERSAO',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadVersaoBase_Old.qryBasePlanoBeforePost(DataSet: TDataSet);
begin
  inherited;
  If (SBtnInserir.Down) and (PrincipalPost) Then
   begin
    qryBasePlano.FieldByName('CD_VERSAO').asInteger :=
                      qryPrincipal.FieldByName('CD_VERSAO').AsInteger;
    qryBasePlano.FieldByName('CD_PESSOA_PATROC').asInteger :=
                      qryPatroc.FieldByName('CD_PESSOA').asInteger;
    qryBasePlano.FieldByName('CD_PESSOA_ENTID').asInteger :=
                      qryEntid.FieldByName('CD_PESSOA').asInteger;
    qryBasePlano.FieldByName('CD_PLANO').asInteger :=
                      qryPlano.FieldByName('CD_PLANO').asInteger;
   end
  else If (SBtnAlterar.Down) and (PrincipalPost) Then
   begin
    qryBasePlano.FieldByName('CD_VERSAO').asInteger :=
                      qryPrincipal.FieldByName('CD_VERSAO').AsInteger;
    qryBasePlano.FieldByName('CD_PESSOA_PATROC').asInteger :=
                      qryPatroc.FieldByName('CD_PESSOA').asInteger;
    qryBasePlano.FieldByName('CD_PESSOA_ENTID').asInteger :=
                      qryEntid.FieldByName('CD_PESSOA').asInteger;
    qryBasePlano.FieldByName('CD_PLANO').asInteger :=
                      qryPlano.FieldByName('CD_PLANO').asInteger;
   end;
end;

procedure TfrmCadVersaoBase_Old.qryBasePlanoAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   if PrincipalPost then
    begin
      PrincipalPost := false;
      qryBasePlano.ApplyUpdates;
      qryBasePlano.CommitUpdates;
    end;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmCadVersaoBase_Old.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  qryBasePlano.Close;
  qryBasePlano.Open;
  qryPat.Close;
  qryEnt.Close;
  qryPlan.Close;

  qryPat.ParamByName('CD_PESSOA_PATROC').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPat.Open;

  qryEnt.ParamByName('CD_PESSOA_ENTID').asInteger :=
                qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryEnt.Open;

  qryPlan.ParamByName('CD_PESSOA_PATROC').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
  qryPlan.ParamByName('CD_PESSOA_ENTID').asInteger :=
                 qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
  qryPlan.Open;
end;

procedure TfrmCadVersaoBase_Old.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
