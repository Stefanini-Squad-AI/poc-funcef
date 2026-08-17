{===============================================================================
Unit    :  FCadGrdBeneficio
Form    :  frmCadGrdBeneficio

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/07/2000

Objetivo: Cadastrar os Benefícios dos Participantes.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, Mask, wwdblook,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmCadGrdBeneficio = class(TfrmCadastroGrid)
    LkcTbBeneficio: TwwDBLookupCombo;
    Label4: TLabel;
    qryBeneficio: TwwQuery;
    dsBeneficio: TwwDataSource;
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryBeneficioCD_TIPO_BENEF: TFloatField;
    qryBeneficioSG_TIPO_BENEF: TStringField;
    qryBeneficioDS_TIPO_BENEF: TStringField;
    qryPrincipalDS_TIPO_BENEF: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_TIPO_BENEF: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrdBeneficio: TfrmCadGrdBeneficio;
  wIdReg: Integer;  

implementation

uses uGlobal, fParticipante;

{$R *.DFM}

procedure TfrmCadGrdBeneficio.FormCreate(Sender: TObject);
begin
  qryPrincipal.Close;
  qryBeneficio.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;
  qryPrincipal.ParamByName('CD_PESSOA_PATROC').asInteger := frmParticipante.Patroc;
  qryPrincipal.ParamByName('CD_PESSOA_ENTID').asInteger := frmParticipante.Entid;

  qryBeneficio.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
  qryBeneficio.ParamByName('CD_PESSOA_PATROC').asInteger := frmParticipante.Patroc;
  qryBeneficio.ParamByName('CD_PESSOA_ENTID').asInteger := frmParticipante.Entid;
  inherited;
  qryBeneficio.Open;
end;

procedure TfrmCadGrdBeneficio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (qryPrincipal.isEmpty) and
     (frmParticipante.qryPrincipal.fieldByName('TP_PARTICIPANTE').asString = 'B') then
   begin
     frmParticipante.qryPrincipal.Edit;
     frmParticipante.qryPrincipal.FieldByName('TP_PARTICIPANTE').asString := 'A';
     frmParticipante.qryPrincipal.Post;
   end
  else if (not (qryPrincipal.isEmpty)) and
     (frmParticipante.qryPrincipal.fieldByName('TP_PARTICIPANTE').asString = 'A') then
   begin
     frmParticipante.qryPrincipal.Edit;
     frmParticipante.qryPrincipal.FieldByName('TP_PARTICIPANTE').asString := 'B';
     frmParticipante.qryPrincipal.Post;
   end;
   
  inherited;
  qryBeneficio.Close;
end;

procedure TfrmCadGrdBeneficio.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  LkcTbBeneficio.Enabled := true;
end;

procedure TfrmCadGrdBeneficio.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  LkcTbBeneficio.Enabled := false;
end;

procedure TfrmCadGrdBeneficio.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(LkcTbBeneficio.Text) = '' then
   begin
     ShowMessage('Informe o Tipo de Benefício');
     LkcTbBeneficio.SetFocus;
     exit;
   end;
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadGrdBeneficio.sbtnApagarClick(Sender: TObject);
begin
  try
    inherited;
    qryPrincipal.ApplyUpdates;
    qryPrincipal.CommitUpdates;
  except
    bbtnCancelar.Click;
  end;  
end;

procedure TfrmCadGrdBeneficio.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipante.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipante.Versao;
    qryPrincipal.FieldByName('CD_PESSOA_PATROC').AsInteger := frmParticipante.Patroc;
    qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger := frmParticipante.Entid;
    qryPrincipal.FieldByName('CD_PLANO').AsInteger := frmParticipante.Plano;
   end;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TIPO_BENEF').AsInteger;
end;

procedure TfrmCadGrdBeneficio.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadGrdBeneficio.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TIPO_BENEF',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadGrdBeneficio.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_TIPO_BENEF', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.
