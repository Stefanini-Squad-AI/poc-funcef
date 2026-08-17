{===============================================================================
Unit    :  uParticipanteHist
Form    :  frmParticipanteHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/08/2000

Objetivo: Consultar Participantes da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}

unit uParticipanteHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  DBTables, Wwquery, wwdblook, Mask, ComCtrls, MontaSelect, CMProcura,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmParticipanteHist = class(TfrmCadastro)
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBRdGrpSexo: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    DBRdGrpTrabalho: TDBRadioGroup;
    Label1: TLabel;
    DBEdit9: TDBEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    DBEdit8: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    qryPrincipal: TwwQuery;
    dsGrupoCalc: TwwDataSource;
    qrGrupoCalc: TwwQuery;
    qrGrupoCalcCD_GRUPO_PARTIC: TFloatField;
    qrGrupoCalcCD_PESSOA_PATROC: TFloatField;
    qrGrupoCalcCD_PESSOA_ENTID: TFloatField;
    qrGrupoCalcCD_PLANO: TFloatField;
    qrGrupoCalcNR_ORDEM: TFloatField;
    qrGrupoCalcNO_GRUPO_PARTIC: TStringField;
    qrSitPatroc: TwwQuery;
    dsSitPatroc: TwwDataSource;
    dsSitFundacao: TwwDataSource;
    qrSitFundacao: TwwQuery;
    qrEstCivil: TwwQuery;
    dsEstCivil: TwwDataSource;
    qrCatProf: TwwQuery;
    qrCatProfCD_TIPO_CAT_PROF_ESP: TFloatField;
    qrCatProfDS_TIPO_CAT_PROF_ESP: TStringField;
    dscrCatProf: TwwDataSource;
    qrSitFundacaoCD_SITUACAO_FUNDACAO: TFloatField;
    qrSitPatrocCD_SITUACAO_PATROC: TFloatField;
    qrSitPatrocDS_SITUACAO_PATROC: TStringField;
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
    qrEstCivilCD_ESTADO_CIVIL: TStringField;
    qrEstCivilDS_ESTADO_CIVIL: TStringField;
    Dock973: TDock97;
    Toolbar974: TToolbar97;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    ToolbarSep977: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    btbtnDependente: TBitBtn;
    btbtnBeneficios: TBitBtn;
    btbtnValores: TBitBtn;
    btbtnTempo: TBitBtn;
    qrSitFundacaoDS_SITUACAO_FUNDACAO: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    QryPlano: TwwQuery;
    QryPlanoNO_PLANO: TStringField;
    QryPlanoCD_PLANO: TFloatField;
    QryPlanoAnterior: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    dsPlano: TwwDataSource;
    dsPlanoAnterior: TwwDataSource;
    qryPrincipalCD_GRUPO_EXPORTACAO: TFloatField;
    qryPrincipalIR_FUNDACAO_ORIGEM: TStringField;
    qryPrincipalIR_PERTENCE_PATROCINADORA: TStringField;
    qryPrincipalCD_PLANO_ANTERIOR: TFloatField;
    qryPrincipalIR_MIGRACAO_PLANO: TStringField;
    qryPrincipalIR_DIRETOR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);

    procedure btbtnValoresClick(Sender: TObject);
    procedure btbtnBeneficiosClick(Sender: TObject);
    procedure btbtnTempoClick(Sender: TObject);
    procedure btbtnDependenteClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure SBtnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Versao, Participante, Patroc, Entid, Plano: Integer;
  end;

var
  frmParticipanteHist: TfrmParticipanteHist;
  wIdReg: Integer;


implementation

uses DRelatsAtuarial, uGlobal, FTelaAut, uVersaoBase, uProcura, FCadGrdValorHist,
     FCadGrdBeneficioHist, FCadGrdTempoHist, uDependenteHist;

{$R *.DFM}

procedure TfrmParticipanteHist.FormCreate(Sender: TObject);
begin
  inherited;
  qrCatProf.Open;
  qryPlano.Open;
  qryPlanoAnterior.Open;
  qrGrupoCalc.Open;
  qrEstCivil.Open;
  qrSitFundacao.Open;
  qrSitPatroc.Open;
  if qryPrincipal.RecordCount > 0 then
   begin
    btbtnDependente.Enabled := true;
    btbtnTempo.Enabled := true;
    btbtnValores.Enabled := true;
    btbtnBeneficios.Enabled := true;
 
    SBtnGerar.Enabled := true;
   end;
end;

procedure TfrmParticipanteHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrCatProf.Close;
  qryPlano.Close;
  qryPlanoAnterior.Close;
  qrGrupoCalc.Close;
  qrEstCivil.Close;
  qrSitFundacao.Close;
  qrSitPatroc.Close;
end;

procedure TfrmParticipanteHist.bbtnConfirmarClick(Sender: TObject);
begin
  if (trim(DBEdit4.Text) = '') and (trim(DBEdit2.Text) = '') then
   begin
    ShowMessage('Informe a Matrícula do Participante !');
    DBEdit4.SetFocus;
    exit;
   end;
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmParticipanteHist.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if qryPrincipal.Active then
   begin
    if qryPrincipal.RecordCount > 0 then
     begin
       btbtnDependente.Enabled := true;
       btbtnTempo.Enabled := true;
       btbtnValores.Enabled := true;
       btbtnBeneficios.Enabled := true;
       SBtnGerar.Enabled := true;
     end
    else
     begin
       btbtnDependente.Enabled := false;
       btbtnTempo.Enabled := false;
       btbtnValores.Enabled := false;
       btbtnBeneficios.Enabled := false;
       SBtnGerar.Enabled := false;
     end;
   end;

  if (DBEdit2.text = '') and (DBEdit4.text = '') then
   begin
     SBtnAlterar.Enabled := false;
     SBtnApagar.Enabled := false;
   end; 
end;

procedure TfrmParticipanteHist.sbtnInserirClick(Sender: TObject);
begin
  btbtnDependente.Enabled := false;
  btbtnTempo.Enabled := false;
  btbtnValores.Enabled := false;
  btbtnBeneficios.Enabled := false;
  DBRadioGroup1.Enabled := false;
  SBtnGerar.Enabled := false;

  inherited;

end;

procedure TfrmParticipanteHist.sbtnAlterarClick(Sender: TObject);
begin
  btbtnDependente.Enabled := false;
  btbtnTempo.Enabled := false;
  btbtnValores.Enabled := false;
  btbtnBeneficios.Enabled := false;
  DBRadioGroup1.Enabled := false;
  SBtnGerar.Enabled := false;
  inherited;
end;

procedure TfrmParticipanteHist.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  try
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except  end; 

  if qryPrincipal.RecordCount > 0 then
   begin
     btbtnDependente.Enabled := true;
     btbtnTempo.Enabled := true;
     btbtnValores.Enabled := true;
     btbtnBeneficios.Enabled := true;
     SBtnGerar.Enabled := true;
   end
  else
   begin
     btbtnDependente.Enabled := false;
     btbtnTempo.Enabled := false;
     btbtnValores.Enabled := false;
     btbtnBeneficios.Enabled := false;
     SBtnGerar.Enabled := false;
   end;
end;

procedure TfrmParticipanteHist.btbtnValoresClick(Sender: TObject);
begin
  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmCadGrdValorHist,TfrmCadGrdValorHist,False );
   end;
end;

procedure TfrmParticipanteHist.btbtnBeneficiosClick(Sender: TObject);
begin
  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    Patroc := qryPrincipal.FieldByName('CD_PESSOA_PATROC').asInteger;
    Entid := qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger;
    Plano := qryPrincipal.FieldByName('CD_PLANO').asInteger;
    AbrirForm(frmCadGrdBeneficioHist,TfrmCadGrdBeneficioHist,False );
   end;
end;

procedure TfrmParticipanteHist.btbtnTempoClick(Sender: TObject);
begin
  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmCadGrdTempoHist,TfrmCadGrdTempoHist,False );
   end;
end;

procedure TfrmParticipanteHist.btbtnDependenteClick(Sender: TObject);
begin
  if (qryPrincipal.RecordCount <> 0) and (qryPrincipal.State = dsBrowse) then
   begin
    Versao := qryPrincipal.FieldByName('CD_VERSAO').asInteger;
    Participante := qryPrincipal.FieldByName('CD_PARTIC').asInteger;
    AbrirForm(frmDependenteHist,TfrmDependenteHist,False );
   end;
end;

procedure TfrmParticipanteHist.sbtnProcurarClick(Sender: TObject);
begin
  SBtnProcurar.Down := false;

  frmProcura := TfrmProcura.create(application);
  frmProcura.DataSet := qryPrincipal;
  frmProcura.Form := 'ParticipanteHist';
  frmProcura.CD_VERSAO := IntToStr(Versao);

  frmProcura.ShowModal;

  frmProcura.free;
end;

procedure TfrmParticipanteHist.SBtnGerarClick(Sender: TObject);
begin
  SBtnGerar.Down := false;
  if qryPrincipal.IsEmpty then
    exit;

  dtmRelatsAtuarial.qryEmiteParticipanteHist.Close;
  dtmRelatsAtuarial.qryEmitedependenteHist.Close;
  dtmRelatsAtuarial.QryEmiteTempoHist.Close;
  dtmRelatsAtuarial.QryEmiteValorHist.Close;
  dtmRelatsAtuarial.qryEmiteBeneficioHist.Close;

  dtmRelatsAtuarial.QryEmiteParticipanteHist.ParamByName('CD_PARTIC').asInteger :=
                  qryPrincipal.FieldByName('CD_PARTIC').asInteger;
  dtmRelatsAtuarial.QryEmiteParticipanteHist.ParamByName('CD_VERSAO').asInteger :=
                  qryPrincipal.FieldByName('CD_VERSAO').asInteger;

  dtmRelatsAtuarial.qryEmiteParticipanteHist.Open;
  dtmRelatsAtuarial.qryEmitedependenteHist.Open;
  dtmRelatsAtuarial.QryEmiteTempoHist.Open;
  dtmRelatsAtuarial.QryEmiteValorHist.Open;
  dtmRelatsAtuarial.qryEmiteBeneficioHist.Open;

  dtmRelatsAtuarial.rpParticipanteHist.Print;
end;

end.
