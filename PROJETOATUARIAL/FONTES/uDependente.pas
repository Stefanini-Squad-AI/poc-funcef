{===============================================================================
Unit    :  uDependente
Form    :  frmDependente

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 24/07/2000

Objetivo: Cadastrar os Dependententes de um Participante.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, Mask, CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmDependente = class(TfrmCadastro)
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
    qryInstrucaoCD_GRAU_INSTRUCAO: TFloatField;
    qryInstrucaoDS_GRAU_INSTRUCAO: TStringField;
    wwQryDuracaoCD_DURACAO: TFloatField;
    wwQryDuracaoDS_DURACAO: TStringField;
    QrySituacaoPlano: TwwQuery;
    QrySituacaoPlanoCD_SITUACAO_PLANO: TFloatField;
    QrySituacaoPlanoDS_SITUACAO_PLANO: TStringField;
    Label8: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBRdGrpSexo: TDBRadioGroup;
    DateEdit: TCMDateTimePicker;
    DBEdit3: TDBEdit;
    LkcTbParentesco: TwwDBLookupCombo;
    LkcTbInstrucao: TwwDBLookupCombo;
    wwDBLookupComboDuracao: TwwDBLookupCombo;
    DBLkpCmbSituacaoPlano: TwwDBLookupCombo;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_DEPENDENTE: TFloatField;
    qryPrincipalNO_DEPENDENTE: TStringField;
    qryPrincipalCD_GRAU_INSTRUCAO: TFloatField;
    qryPrincipalCD_GRAU_DEPENDENCIA: TStringField;
    qryPrincipalCD_DURACAO: TFloatField;
    qryPrincipalNR_MATRICULA: TStringField;
    qryPrincipalDT_NASC: TDateTimeField;
    qryPrincipalIR_SEXO: TStringField;
    qryPrincipalNR_ANOS_DEPENDENTE: TFloatField;
    qryPrincipalTRGDTINCLUSAO: TDateTimeField;
    qryPrincipalTRGUSERINCLUSAO: TStringField;
    qryPrincipalCD_SITUACAO_PLANO: TFloatField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDependente: TfrmDependente;
  WidReg: Integer;

implementation

uses fParticipante;

{$R *.DFM}

procedure TfrmDependente.FormCreate(Sender: TObject);
begin
  qryInstrucao.Open;
  qryParentesco.Open;


  QrySituacaoPlano.Open;
  //---

  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;

  inherited;

  qryParent.Open;
  qryInstruc.Open;
  wwQryDuracao.open;
end;

procedure TfrmDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryInstrucao.Close;
  qryParentesco.Close;
  qryParent.Close;
  qryInstruc.Close;

  
  QrySituacaoPlano.Close;
  //---
end;

procedure TfrmDependente.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmDependente.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmDependente.bbtnConfirmarClick(Sender: TObject);
begin
  if (trim(DBEdit2.Text) = '') and
     (trim(DBEdit4.Text) = '') then
   begin
    ShowMessage('Informe a Matrícula do Dependente !');
    DBEdit4.SetFocus;
    exit;
   end;

  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmDependente.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmDependente.qryPrincipalBeforePost(DataSet: TDataSet);
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
    qryPrincipal.FieldByName('CD_DEPENDENTE').asInteger :=
                         (qryAux.FieldByName('Max_CD').asInteger + 1);
   end;

  if Trim(LkcTbParentesco.Text) = '' then
    qryPrincipal.FieldByName('CD_GRAU_DEPENDENCIA').Clear
  else
    qryPrincipal.FieldByName('CD_GRAU_DEPENDENCIA').asString :=
       qryParentesco.FieldByName('CD_GRAU_DEPENDENCIA').asString;

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
  wIdReg := Qryprincipal.FieldByName('CD_DEPENDENTE').AsInteger;
end;

procedure TfrmDependente.qryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmDependente.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_DEPENDENTE',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmDependente.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmDependente.sbtnProcurarClick(Sender: TObject);
begin
  srchdlgProcura.Execute;
  sbtnProcurar.Down := False;
end;

end.

