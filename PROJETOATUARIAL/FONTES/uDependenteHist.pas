{===============================================================================
Unit    :  uDependenteHist
Form    :  frmDependenteHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/08/2000

Objetivo: Consultar Dependententes da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uDependenteHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, Mask, CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmDependenteHist = class(TfrmCadastro)
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBRdGrpSexo: TDBRadioGroup;
    DBRdGrpTitular: TDBRadioGroup;
    DateEdit: TCMDateTimePicker;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBRdGrpDuracao: TDBRadioGroup;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    LkcTbParentesco: TwwDBLookupCombo;
    DBEdit6: TDBEdit;
    LkcTbInstrucao: TwwDBLookupCombo;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    qryParentesco: TwwQuery;
    qry1: TwwQuery;
    ds1: TwwDataSource;
    qryInstrucao: TwwQuery;
    qry2: TwwQuery;
    ds2: TwwDataSource;
    qryInstrucaoCD_GRAU_INSTRUCAO: TFloatField;
    qryInstrucaoDS_GRAU_INSTRUCAO: TStringField;
    qry2CD_GRAU_INSTRUCAO: TFloatField;
    qry2DS_GRAU_INSTRUCAO: TStringField;
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
    qryPrincipalIR_E_TITULAR_PENSAO: TStringField;
    qryParentescoCD_GRAU_DEPENDENCIA: TStringField;
    qryParentescoDS_GRAU_DEPENDENCIA: TStringField;
    qry1CD_GRAU_DEPENDENCIA: TStringField;
    qry1DS_GRAU_DEPENDENCIA: TStringField;
    MontaSelect: TMontaSelect;
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
  frmDependenteHist: TfrmDependenteHist;
  WidReg: Integer;

implementation

uses uParticipanteHist;

{$R *.DFM}

procedure TfrmDependenteHist.FormCreate(Sender: TObject);
begin
  qryInstrucao.Open;
  qryParentesco.Open;

  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipanteHist.Participante;

  inherited;
  qry1.Open;
  qry2.Open;  
end;

procedure TfrmDependenteHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryInstrucao.Close;
  qryParentesco.Close;
  qry1.Close;
  qry2.Close;
end;

procedure TfrmDependenteHist.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Visible := false;
  DateEdit.Visible := true;
  DBEdit6.Visible := false;
  LkcTbParentesco.Visible := true;
  DBEdit5.Visible := false;
  LkcTbInstrucao.Visible := true;
  DateEdit.Text := '';
  LkcTbParentesco.Text := '';
  LkcTbInstrucao.Text := '';

  DBEdit2.SetFocus;  
end;

procedure TfrmDependenteHist.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Visible := false;
  DateEdit.Visible := true;
  DBEdit6.Visible := false;
  LkcTbParentesco.Visible := true;
  DBEdit5.Visible := false;
  LkcTbInstrucao.Visible := true;
  DateEdit.Text := DBEdit1.Text;
  LkcTbParentesco.Text := DBEdit6.Text;
  LkcTbInstrucao.Text := DBEdit5.Text;

  DBEdit2.SetFocus;
end;

procedure TfrmDependenteHist.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmDependenteHist.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Visible := true;
  DateEdit.Visible := false;
  DBEdit6.Visible := true;
  LkcTbParentesco.Visible := false;
  DBEdit5.Visible := true;
  LkcTbInstrucao.Visible := false;

  DBEdit2.SetFocus;
end;

procedure TfrmDependenteHist.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryAux.Close;
    qryAux.ParamByName('CD_PARTIC').asInteger := frmParticipanteHist.Participante;
    qryAux.ParamByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
    qryAux.Open;

    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipanteHist.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
    qryPrincipal.FieldByName('CD_DEPENDENTE').asInteger :=
                         (qryAux.FieldByName('Max_CD').asInteger + 1);
   end;

  if DateEdit.Text = '' then
    qryPrincipal.FieldByName('DT_NASC').Value := null
  else
    qryPrincipal.FieldByName('DT_NASC').asDateTime := StrToDate(DateEdit.Text);

  qryPrincipal.FieldByName('CD_GRAU_DEPENDENCIA').asInteger :=
                qryParentesco.FieldByName('CD_GRAU_DEPENDENCIA').asInteger;
  qryPrincipal.FieldByName('CD_GRAU_INSTRUCAO').asInteger :=
                qryInstrucao.FieldByName('CD_GRAU_INSTRUCAO').asInteger;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_DEPENDENTE').AsInteger;                
end;

procedure TfrmDependenteHist.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmDependenteHist.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_DEPENDENTE',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmDependenteHist.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmDependenteHist.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_DEPENDENTE', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.

