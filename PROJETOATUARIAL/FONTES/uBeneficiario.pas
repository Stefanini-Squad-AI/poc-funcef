{===============================================================================
Unit    :  uBeneficiario
Form    :  frmBeneficiario

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 08/07/2005

Objetivo: Cadastrar os Beneficiários de um Participante.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uBeneficiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, {Mast, }DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, Mask, CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmBeneficiario = class(TfrmCadastro)
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    qryParentesco: TwwQuery;
    qryParent: TwwQuery;
    dsParent: TwwDataSource;
    qryInstrucao: TwwQuery;
    qryInstruc: TwwQuery;
    dsInstruc: TwwDataSource;
    wwQryDuracao: TwwQuery;
    wwDsDuracao: TwwDataSource;
    qryParentescoCD_GRAU_DEPENDENCIA: TStringField;
    qryParentescoDS_GRAU_DEPENDENCIA: TStringField;
    qryParentCD_GRAU_DEPENDENCIA: TStringField;
    qryParentDS_GRAU_DEPENDENCIA: TStringField;
    qryInstrucCD_GRAU_INSTRUCAO: TFloatField;
    qryInstrucDS_GRAU_INSTRUCAO: TStringField;
    MontaSelect: TMontaSelect;
    qryTipoBeneficio: TwwQuery;
    qryTipoBeneficioCD_TIPO_BENEF: TFloatField;
    qryTipoBeneficioSG_TIPO_BENEF: TStringField;
    qryTipoBeneficioDS_TIPO_BENEF: TStringField;
    qryBeneficiario: TwwQuery;
    qryBenef: TwwQuery;
    dsBenef: TwwDataSource;
    qryInstrucaoCD_GRAU_INSTRUCAO: TFloatField;
    qryInstrucaoDS_GRAU_INSTRUCAO: TStringField;
    wwQryDuracaoCD_DURACAO: TFloatField;
    wwQryDuracaoDS_DURACAO: TStringField;
    Label8: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBRdGrpSexo: TDBRadioGroup;
    DateEdit: TCMDateTimePicker;
    DBEdit3: TDBEdit;
    LkcTbParentesco: TwwDBLookupCombo;
    LkcTbInstrucao: TwwDBLookupCombo;
    wwDBLookupComboDuracao: TwwDBLookupCombo;
    DBLkpCmbSituacaoPlano: TwwDBLookupCombo;
    DBLkpCmbPlano: TwwDBLookupCombo;
    Label11: TLabel;
    QryPlano: TwwQuery;
    QrySituacaoPlano: TwwQuery;
    Label9: TLabel;
    LkcTbTipoBeneficio: TwwDBLookupCombo;
    Dock973: TDock97;
    Toolbar974: TToolbar97;
    btbtnValores: TBitBtn;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_BENEF_TITULAR: TFloatField;
    qryPrincipalCD_BENEFICIARIO: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryPrincipalCD_TIPO_BENEF: TFloatField;
    qryPrincipalCD_GRAU_DEPENDENCIA: TStringField;
    qryPrincipalCD_DURACAO: TFloatField;
    qryPrincipalCD_SITUACAO_PLANO: TFloatField;
    qryPrincipalCD_GRAU_INSTRUCAO: TFloatField;
    qryPrincipalNO_BENEFICIARIO: TStringField;
    qryPrincipalNR_MATRICULA: TStringField;
    qryPrincipalDT_NASC: TDateTimeField;
    qryPrincipalIR_SEXO: TStringField;
    qryPrincipalNR_IDADE_BENEFICIARIO: TFloatField;
    qryPrincipalTRGDTINCLUSAO: TDateTimeField;
    qryPrincipalTRGUSERINCLUSAO: TStringField;
    qryBeneficiarioCD_VERSAO: TFloatField;
    qryBeneficiarioCD_PARTIC: TFloatField;
    qryBeneficiarioCD_BENEF_TITULAR: TFloatField;
    qryBeneficiarioCD_BENEFICIARIO: TFloatField;
    qryBeneficiarioCD_PESSOA_PATROC: TFloatField;
    qryBeneficiarioCD_PESSOA_ENTID: TFloatField;
    qryBeneficiarioCD_PLANO: TFloatField;
    qryBeneficiarioCD_TIPO_BENEF: TFloatField;
    qryBeneficiarioCD_GRAU_DEPENDENCIA: TStringField;
    qryBeneficiarioCD_DURACAO: TFloatField;
    qryBeneficiarioCD_SITUACAO_PLANO: TFloatField;
    qryBeneficiarioCD_GRAU_INSTRUCAO: TFloatField;
    qryBeneficiarioNO_BENEFICIARIO: TStringField;
    qryBeneficiarioNR_MATRICULA: TStringField;
    qryBeneficiarioDT_NASC: TDateTimeField;
    qryBeneficiarioIR_SEXO: TStringField;
    qryBeneficiarioNR_IDADE_BENEFICIARIO: TFloatField;
    qryBeneficiarioTRGDTINCLUSAO: TDateTimeField;
    qryBeneficiarioTRGUSERINCLUSAO: TStringField;
    qryBenefCD_VERSAO: TFloatField;
    qryBenefCD_PARTIC: TFloatField;
    qryBenefCD_BENEF_TITULAR: TFloatField;
    qryBenefCD_BENEFICIARIO: TFloatField;
    qryBenefCD_PESSOA_PATROC: TFloatField;
    qryBenefCD_PESSOA_ENTID: TFloatField;
    qryBenefCD_PLANO: TFloatField;
    qryBenefCD_TIPO_BENEF: TFloatField;
    qryBenefCD_GRAU_DEPENDENCIA: TStringField;
    qryBenefCD_DURACAO: TFloatField;
    qryBenefCD_SITUACAO_PLANO: TFloatField;
    qryBenefCD_GRAU_INSTRUCAO: TFloatField;
    qryBenefNO_BENEFICIARIO: TStringField;
    qryBenefNR_MATRICULA: TStringField;
    qryBenefDT_NASC: TDateTimeField;
    qryBenefIR_SEXO: TStringField;
    qryBenefNR_IDADE_BENEFICIARIO: TFloatField;
    qryBenefTRGDTINCLUSAO: TDateTimeField;
    qryBenefTRGUSERINCLUSAO: TStringField;
    qryAuxMAX_CD: TFloatField;
    DBEdit1: TDBEdit;
    LkcTbBeneficiario: TwwDBLookupCombo;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryPrincipalAfterDelete(DataSet: TDataSet);
    procedure btbtnValoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBeneficiario: TfrmBeneficiario;
  WidReg: Integer;

implementation

uses FCadGrdValorBeneficiario, dBaseDados, FTelaAut,
  fParticipante;

{$R *.DFM}

procedure TfrmBeneficiario.FormCreate(Sender: TObject);
begin
  qryInstrucao.Open;
  qryParentesco.Open;
  qryTipoBeneficio.Open;

  qryBeneficiario.Close;
  qryBeneficiario.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
  qryBeneficiario.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;
  qryBeneficiario.Open;

  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;



  inherited;
  DBEdit1.BringToFront;

  qryParent.Open;
  qryInstruc.Open;
  qryBenef.Open;
  wwQryDuracao.open;
  QryPlano.Open;
  QrySituacaoPlano.Open;

  if qryPrincipal.RecordCount > 0 then
    btbtnValores.Enabled := true;
end;

procedure TfrmBeneficiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryInstrucao.Close;
  qryParentesco.Close;
  qryTipoBeneficio.Close;
  qryBeneficiario.Close;
  qryParent.Close;
  qryInstruc.Close;
  qryBenef.Close;
  QryPlano.Close;
  QrySituacaoPlano.Close;
end;

procedure TfrmBeneficiario.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SendToBack;
  LkcTbBeneficiario.Text := '';

  DBEdit2.SetFocus;
end;

procedure TfrmBeneficiario.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SendToBack;
  if qryPrincipal.FieldByName('CD_BENEF_TITULAR').isNull then
    LkcTbBeneficiario.Text := ''
  else
    LkcTbBeneficiario.Text := DBEdit1.Text;

  DBEdit2.SetFocus;
end;

procedure TfrmBeneficiario.bbtnConfirmarClick(Sender: TObject);
begin
  if (trim(DBEdit2.Text) = '') and
     (trim(DBEdit4.Text) = '') then
   begin
    MessageDlg('Informe a Matrícula do Beneficiário.', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
   end;

  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmBeneficiario.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.BringToFront;

  DBEdit2.SetFocus;

  if qryPrincipal.Active then
   begin
     if qryPrincipal.RecordCount > 0 then
       btbtnValores.Enabled := True
    else
       btbtnValores.Enabled := false;
   end;
end;

procedure TfrmBeneficiario.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryAux.Close;
    qryAux.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;
    qryAux.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
    qryAux.Open;

    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipante.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipante.Versao;
    qryPrincipal.FieldByName('CD_BENEFICIARIO').asInteger :=
                         (qryAux.FieldByName('MAX_CD').asInteger + 1);
   end;

  if Trim(LkcTbBeneficiario.Text) <> '' then
    qryPrincipal.FieldByName('CD_BENEF_TITULAR').asInteger :=
      qryBeneficiario.FieldByName('CD_BENEFICIARIO').asInteger
  else
    qryPrincipal.FieldByName('CD_BENEF_TITULAR').asInteger := frmParticipante.Participante;

  if Trim(LkcTbInstrucao.Text) = '' then
    qryPrincipal.FieldByName('CD_GRAU_INSTRUCAO').Clear
  else
    qryPrincipal.FieldByName('CD_GRAU_INSTRUCAO').asInteger :=
       qryInstrucao.FieldByName('CD_GRAU_INSTRUCAO').asInteger;

  if Trim(wwDBLookupComboDuracao.Text) = '' then
    qryPrincipal.FieldByName('CD_DURACAO').Clear
  else
    qryPrincipal.FieldByName('CD_DURACAO').asInteger :=
       wwQryDuracao.FieldByName('CD_DURACAO').asInteger;


  if DateEdit.Text = '' then
    qryPrincipal.FieldByName('DT_NASC').Value := null
  else
    qryPrincipal.FieldByName('DT_NASC').asDateTime := StrToDate(DateEdit.Text);

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_BENEFICIARIO').AsInteger;                
end;

procedure TfrmBeneficiario.qryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
   qryBeneficiario.Close;
   qryBeneficiario.Open;

   DBEdit1.BringToFront;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmBeneficiario.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_BENEFICIARIO',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmBeneficiario.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmBeneficiario.sbtnProcurarClick(Sender: TObject);
begin
  srchdlgProcura.Execute;
  sbtnProcurar.Down := False;  
end;

procedure TfrmBeneficiario.qryPrincipalAfterDelete(DataSet: TDataSet);
begin
  qryBeneficiario.Close;
  qryBeneficiario.Open;
end;

procedure TfrmBeneficiario.btbtnValoresClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;

  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
    AbrirForm(frmCadGrdValorBeneficiario, TfrmCadGrdValorBeneficiario, False);

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

end.
