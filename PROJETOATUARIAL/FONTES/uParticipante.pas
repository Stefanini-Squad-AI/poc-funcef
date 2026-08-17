{===============================================================================
Unit    :  uParticipante
Form    :  frmParticipante

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 20/07/2000

Objetivo: Cadastrar Participantes.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}

unit uParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  DBTables, Wwquery, wwdblook, Mask, ComCtrls, MontaSelect, CMProcura,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmParticipante = class(TfrmCadastro)
    qryCatProf: TwwQuery;
    qryEstCivil: TwwQuery;
    qryGrupoCalc: TwwQuery;
    qryCatProfCD_TIPO_CAT_PROF_ESP: TFloatField;
    qryCatProfDS_TIPO_CAT_PROF_ESP: TStringField;
    dsCatProf: TwwDataSource;
    qryPrincipal: TwwQuery;
    qryAux: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryGrupoCalcCD_GRUPO_PARTIC: TFloatField;
    qryGrupoCalcCD_PESSOA_PATROC: TFloatField;
    qryGrupoCalcCD_PESSOA_ENTID: TFloatField;
    qryGrupoCalcCD_PLANO: TFloatField;
    qryGrupoCalcNR_ORDEM: TFloatField;
    qryGrupoCalcNO_GRUPO_PARTIC: TStringField;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBRdGrpSexo: TDBRadioGroup;
    DBRdGrpTrabalho: TDBRadioGroup;
    LkcTbEstCivil: TwwDBLookupCombo;
    Label1: TLabel;
    LkcTbCatProf: TwwDBLookupCombo;
    Label4: TLabel;
    Label2: TLabel;
    LkcTbGrupoCalc: TwwDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    LkcTbSitPatroc: TwwDBLookupCombo;
    Label10: TLabel;
    LkcTbSitFundacao: TwwDBLookupCombo;
    qrySitFundacao: TwwQuery;
    qrySitPatroc: TwwQuery;
    qrySitFundacaoCD_SITUACAO_FUNDACAO: TFloatField;
    qrySitPatrocCD_SITUACAO_PATROC: TFloatField;
    qrySitPatrocDS_SITUACAO_PATROC: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryPrincipalCD_TIPO_CAT_PROF_ESP: TFloatField;
    qryPrincipalNR_MATRICULA: TStringField;
    qryPrincipalNO_PESSOA: TStringField;
    qryPrincipalCD_ESTADO_CIVIL: TStringField;
    qryPrincipalIR_SEXO: TStringField;
    qryPrincipalTP_PARTICIPANTE: TStringField;
    qryPrincipalIR_CONDICAO_TRABALHO: TStringField;
    qryPrincipalCD_GRUPO_CALCULO: TFloatField;
    qryPrincipalDS_REGIONAL: TStringField;
    qryPrincipalCD_SITUACAO_PATROC: TFloatField;
    qryPrincipalCD_SITUACAO_FUNDACAO: TFloatField;
    qryPrincipalNR_CPF: TStringField;
    qryEstCivilCD_ESTADO_CIVIL: TStringField;
    qryEstCivilDS_ESTADO_CIVIL: TStringField;
    Dock973: TDock97;
    Toolbar974: TToolbar97;
    ToolbarSep975: TToolbarSep97;
    btbtnBeneficiario: TBitBtn;
    btbtnValores: TBitBtn;
    btbtnTempo: TBitBtn;
    btbtnGExport: TBitBtn;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    ToolbarSep977: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep978: TToolbarSep97;
    qrySitFundacaoDS_SITUACAO_FUNDACAO: TStringField;
    btbtnDependente: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label11: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    QryPlano: TwwQuery;
    QryPlanoCD_PLANO: TFloatField;
    QryPlanoNO_PLANO: TStringField;
    QryPlanoAnterior: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    qryPrincipalCD_GRUPO_EXPORTACAO: TFloatField;
    qryPrincipalIR_FUNDACAO_ORIGEM: TStringField;
    qryPrincipalIR_PERTENCE_PATROCINADORA: TStringField;
    qryPrincipalCD_PLANO_ANTERIOR: TFloatField;
    qryPrincipalIR_MIGRACAO_PLANO: TStringField;
    qryPrincipalIR_DIRETOR: TStringField;
    qryPrincipalCD_VINCULA_PARTIC: TStringField;
    DBLkpVinculacao: TwwDBLookupCombo;
    Label12: TLabel;
    QryVinculaPartic: TwwQuery;
    QryVinculaParticCD_VINCULA_PARTIC: TStringField;
    QryVinculaParticDS_VINCULA_PARTIC: TStringField;
    Label13: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    QryOutrasFundacoes: TwwQuery;
    QryOutrasFundacoesCD_OUTRA_FUNDACAO: TFloatField;
    QryOutrasFundacoesDS_OUTRA_FUNDACAO: TStringField;
    qryPrincipalCD_OUTRA_FUNDACAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure btbtnValoresClick(Sender: TObject);
    procedure btbtnTempoClick(Sender: TObject);
    procedure btbtnBeneficiarioClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure SBtnGerarClick(Sender: TObject);
    procedure btbtnGExportClick(Sender: TObject);
    procedure btbtnDependenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Versao, Participante, Patroc, Entid, Plano: Integer;
  end;

var
  frmParticipante: TfrmParticipante;
  wIdReg: Integer;    

implementation

uses DRelatsAtuarial, uGlobal, FTelaAut, uDependente, uVersaoBase, FCadGrdTempo,
  FCadGrdValor, FCadGrdBeneficio, uProcura, FCadGrdGrupoExportacao,
  uBeneficiario, dBaseDados;

{$R *.DFM}

procedure TfrmParticipante.FormCreate(Sender: TObject);
begin
  if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
     exit;
   end;

   bbtnCancelar.Click;

  inherited;
  qryCatProf.Close;
  qryCatProf.Open;
  qryPlano.Open;
  qryPlanoAnterior.Open;
  qryGrupoCalc.Close;
  qryGrupoCalc.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
  qryGrupoCalc.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
  qryGrupoCalc.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
  qryGrupoCalc.Open;
  qryEstCivil.Open;
  qrySitPatroc.Open;
  qrySitFundacao.Open;
  if qryPrincipal.RecordCount > 0 then
   begin
    btbtnDependente.Enabled := true;
    btbtnBeneficiario.Enabled := true;
    btbtnTempo.Enabled := true;
    btbtnValores.Enabled := true;
    btbtnGExport.Enabled := true;
    SBtnGerar.Enabled := true;
   end;

  QryVinculaPartic.Open;
  QryOutrasFundacoes.Open;
  //---
end;

procedure TfrmParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryPlano.Close;
  qryPlanoAnterior.Close;
  qryEstCivil.Close;
  qryCatProf.Close;
  qryGrupoCalc.Close;
  qrySitPatroc.Close;
  qrySitFundacao.Close;

  QryVinculaPartic.Close;
  QryOutrasFundacoes.Close;
  //---
end;

procedure TfrmParticipante.bbtnConfirmarClick(Sender: TObject);
begin
  if (trim(DBEdit4.Text) = '') and (trim(DBEdit2.Text) = '') then
   begin
    ShowMessage('Informe a Matrícula do Participante !');
    DBEdit4.SetFocus;
    exit;
   end;
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  bbtnCancelar.Click;
end;

procedure TfrmParticipante.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;

  if qryPrincipal.Active then
   begin
    if qryPrincipal.RecordCount > 0 then
     begin
       btbtnDependente.Enabled := true;
       btbtnBeneficiario.Enabled := true;
       btbtnTempo.Enabled := true;
       btbtnValores.Enabled := true;
       btbtnGExport.Enabled := true;
       SBtnGerar.Enabled := true;
     end
    else
     begin
       btbtnDependente.Enabled := false;
       btbtnBeneficiario.Enabled := false;
       btbtnTempo.Enabled := false;
       btbtnValores.Enabled := false;
       btbtnGExport.Enabled := false;
       SBtnGerar.Enabled := false;
     end;
   end;

  if (DBEdit2.text = '') and (DBEdit4.text = '') then
   begin
     SBtnAlterar.Enabled := false;
     SBtnApagar.Enabled := false;
   end;
end;

procedure TfrmParticipante.sbtnInserirClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  btbtnDependente.Enabled := false;
  btbtnBeneficiario.Enabled := false;
  btbtnTempo.Enabled := false;
  btbtnValores.Enabled := false;
  btbtnGExport.Enabled := false;
  DBRadioGroup1.Enabled := false;
  SBtnGerar.Enabled := false;

  inherited;
  LkcTbCatProf.Text := '';
  LkcTbGrupoCalc.Text := '';
  LkcTbEstCivil.Text := '';
  LkcTbSitPatroc.Text := '';
  LkcTbSitFundacao.Text := '';
end;

procedure TfrmParticipante.sbtnAlterarClick(Sender: TObject);
begin
  btbtnDependente.Enabled := false;
  btbtnBeneficiario.Enabled := false;
  btbtnTempo.Enabled := false;
  btbtnValores.Enabled := false;
  btbtnGExport.Enabled := false;
  DBRadioGroup1.Enabled := false;
  SBtnGerar.Enabled := false;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  inherited;
end;

procedure TfrmParticipante.sbtnApagarClick(Sender: TObject);
begin
  Try
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  inherited;
  try
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except  end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  Except
    dtmBaseDados.dbBaseDados.RollBack;
  End;



  if qryPrincipal.RecordCount > 0 then
   begin
     btbtnDependente.Enabled := true;
     btbtnBeneficiario.Enabled := true;
     btbtnTempo.Enabled := true;
     btbtnValores.Enabled := true;
     btbtnGExport.Enabled := true;
     SBtnGerar.Enabled := true;
   end
  else
   begin
     btbtnDependente.Enabled := false;
     btbtnBeneficiario.Enabled := false;
     btbtnTempo.Enabled := false;
     btbtnValores.Enabled := false;
     btbtnGExport.Enabled := false;
     SBtnGerar.Enabled := false;
   end;
end;

procedure TfrmParticipante.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;

  qryCatProf.Close;
  qryGrupoCalc.Close;
  qryCatProf.Open;
  qryGrupoCalc.Open;

  if SBtnInserir.Down then
   begin
     qryAux.Close;
     qryAux.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     qryAux.Open;
     qryPrincipal.FieldByName('CD_PARTIC').AsInteger :=
                   (qryAux.FieldByName('Max_CD').asInteger + 1);

     qryPrincipal.FieldByName('CD_VERSAO').AsInteger := WG_CD_VERSAO;

     qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;

     qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;

     qryPrincipal.FieldByName('CD_PLANO').asInteger := WG_CD_PLANO;

     if Trim(qryPrincipal.FieldByName('TP_PARTICIPANTE').asString) = '' then
       qryPrincipal.FieldByName('TP_PARTICIPANTE').asString := 'A';

     if trim(LkcTbEstCivil.Text) = '' then
       qryPrincipal.FieldByName('CD_ESTADO_CIVIL').Clear
     else
       qryPrincipal.FieldByName('CD_ESTADO_CIVIL').asString:=
                     qryEstCivil.FieldByName('CD_ESTADO_CIVIL').asString;

     if trim(LkcTbCatProf.Text) = '' then
       qryPrincipal.FieldByName('CD_TIPO_CAT_PROF_ESP').Clear
     else
       qryPrincipal.FieldByName('CD_TIPO_CAT_PROF_ESP').asInteger :=
                     qryCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').asInteger;

     if trim(LkcTbGrupoCalc.Text) = '' then
       qryPrincipal.FieldByName('CD_GRUPO_CALCULO').Clear
     else
       qryPrincipal.FieldByName('CD_GRUPO_CALCULO').asInteger :=
                     qryGrupoCalc.FieldByName('CD_GRUPO_PARTIC').asInteger;

     if trim(LkcTbSitPatroc.Text) = '' then
       qryPrincipal.FieldByName('CD_SITUACAO_PATROC').Clear
     else
       qryPrincipal.FieldByName('CD_SITUACAO_PATROC').asInteger :=
                     qrySitPatroc.FieldByName('CD_SITUACAO_PATROC').asInteger;

     if trim(LkcTbSitFundacao.Text) = '' then
       qryPrincipal.FieldByName('CD_SITUACAO_FUNDACAO').Clear
     else
       qryPrincipal.FieldByName('CD_SITUACAO_FUNDACAO').asInteger :=
                     qrySitFundacao.FieldByName('CD_SITUACAO_FUNDACAO').asInteger;
   end
  else if sBtnAlterar.Down then
   begin
     if trim(LkcTbEstCivil.Text) = '' then
      qryPrincipal.FieldByName('CD_ESTADO_CIVIL').Clear
     else
       qryPrincipal.FieldByName('CD_ESTADO_CIVIL').asString :=
                     qryEstCivil.FieldByName('CD_ESTADO_CIVIL').asString;

     if trim(LkcTbCatProf.Text) = '' then
       qryPrincipal.FieldByName('CD_TIPO_CAT_PROF_ESP').Clear
     else
       qryPrincipal.FieldByName('CD_TIPO_CAT_PROF_ESP').asInteger :=
                     qryCatProf.FieldByName('CD_TIPO_CAT_PROF_ESP').asInteger;

     if trim(LkcTbGrupoCalc.Text) = '' then
       qryPrincipal.FieldByName('CD_GRUPO_CALCULO').Clear
     else
       qryPrincipal.FieldByName('CD_GRUPO_CALCULO').asInteger :=
                     qryGrupoCalc.FieldByName('CD_GRUPO_PARTIC').asInteger;

     if trim(LkcTbSitPatroc.Text) = '' then
       qryPrincipal.FieldByName('CD_SITUACAO_PATROC').Clear
     else
       qryPrincipal.FieldByName('CD_SITUACAO_PATROC').asInteger :=
                     qrySitPatroc.FieldByName('CD_SITUACAO_PATROC').asInteger;

     if trim(LkcTbSitFundacao.Text) = '' then
       qryPrincipal.FieldByName('CD_SITUACAO_FUNDACAO').Clear
     else
       qryPrincipal.FieldByName('CD_SITUACAO_FUNDACAO').asInteger :=
                     qrySitFundacao.FieldByName('CD_SITUACAO_FUNDACAO').asInteger;
   end;

  if DBRdGrpTrabalho.ItemIndex < 0 then
   qryPrincipal.FieldByName('IR_CONDICAO_TRABALHO').Value := null;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_PARTIC').AsInteger;

end;

procedure TfrmParticipante.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmParticipante.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_PARTIC',wIdReg,[]);
  QryPrincipal.EnableControls;
  qryEstCivil.Open;
  qryCatProf.Open;
  qryGrupoCalc.Open;
end;

procedure TfrmParticipante.btbtnValoresClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmCadGrdValor,TfrmCadGrdValor,False );
   end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;   
end;

procedure TfrmParticipante.btbtnTempoClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmCadGrdTempo, TfrmCadGrdTempo, False );
   end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;   
end;

procedure TfrmParticipante.btbtnDependenteClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmDependente, TfrmDependente, False );
   end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmParticipante.btbtnBeneficiarioClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmBeneficiario, TfrmBeneficiario, False );
   end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;   
end;

procedure TfrmParticipante.sbtnProcurarClick(Sender: TObject);
begin
  SBtnProcurar.Down := false;

  frmProcura := TfrmProcura.create(application);
  frmProcura.DataSet := qryPrincipal;
  frmProcura.Form := 'Participante';
  frmProcura.CD_VERSAO := intToStr(WG_CD_VERSAO);

  frmProcura.ShowModal;

  frmProcura.free;

  CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmParticipante.SBtnGerarClick(Sender: TObject);
begin
  SBtnGerar.Down := false;
  if qryPrincipal.IsEmpty then
    exit;

  dtmRelatsAtuarial.qryEmiteParticipante.Close;
  dtmRelatsAtuarial.qryEmitedependente.Close;
  dtmRelatsAtuarial.QryEmiteTempo.Close;
  dtmRelatsAtuarial.QryEmiteValor.Close;
  dtmRelatsAtuarial.qryEmiteBeneficio.Close;

  dtmRelatsAtuarial.QryEmiteParticipante.ParamByName('CD_PARTIC').asInteger :=
                  qryPrincipal.FieldByName('CD_PARTIC').asInteger;
  dtmRelatsAtuarial.QryEmiteParticipante.ParamByName('CD_VERSAO').asInteger :=
                  qryPrincipal.FieldByName('CD_VERSAO').asInteger;

  dtmRelatsAtuarial.qryEmiteParticipante.Open;
  dtmRelatsAtuarial.qryEmitedependente.Open;
  dtmRelatsAtuarial.QryEmiteTempo.Open;
  dtmRelatsAtuarial.QryEmiteValor.Open;
  dtmRelatsAtuarial.qryEmiteBeneficio.Open;

  dtmRelatsAtuarial.rpParticipante.Print;
end;

procedure TfrmParticipante.btbtnGExportClick(Sender: TObject);
begin
  frmCadGrdGrupoExportacao := TfrmCadGrdGrupoExportacao.create(Self);
end;

end.
