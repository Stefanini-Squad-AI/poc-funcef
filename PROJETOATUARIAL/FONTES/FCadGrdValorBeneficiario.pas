{===============================================================================
Unit    :  FCadGrdValor
Form    :  frmCadGrdValor

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/07/2000

Objetivo: Cadastrar os Valores dos Participantes.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdValorBeneficiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, wwdblook, Mask,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmCadGrdValorBeneficiario = class(TfrmCadastroGrid)
    Label8: TLabel;
    LkcTbTipoValor: TwwDBLookupCombo;
    Label4: TLabel;
    qryTipoValor: TwwQuery;
    dsTipoValor: TwwDataSource;
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryTipoValorCD_TIPO_VALOR: TFloatField;
    qryTipoValorDS_TIPO_VALOR: TStringField;
    EdtValor: TEdit;
    MontaSelect: TMontaSelect;
    qryPrincipalDS_TIPO_VALOR: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_BENEF_TITULAR: TFloatField;
    qryPrincipalCD_BENEFICIARIO: TFloatField;
    qryPrincipalCD_TIPO_VALOR: TFloatField;
    qryPrincipalVL_PARTICIPANTE: TFloatField;
    qryPrincipalTRGDTINCLUSAO: TDateTimeField;
    qryPrincipalTRGUSERINCLUSAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
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
  frmCadGrdValorBeneficiario: TfrmCadGrdValorBeneficiario;
  wIdReg: Integer;

implementation

uses uFuncGerais, fParticipante;

{$R *.DFM}

procedure TfrmCadGrdValorBeneficiario.FormCreate(Sender: TObject);
begin
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;
  inherited;
  qryTipoValor.Open;
end;

procedure TfrmCadGrdValorBeneficiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoValor.Close;
end;

procedure TfrmCadGrdValorBeneficiario.sbtnAlterarClick(Sender: TObject);
begin
  EdtValor.text := qryPrincipal.FieldByName('VL_PARTICIPANTE').asString;
  inherited;
  LkcTbTipoValor.Enabled := false;
end;

procedure TfrmCadGrdValorBeneficiario.sbtnInserirClick(Sender: TObject);
begin
  EdtValor.text := '';
  inherited;
  LkcTbTipoValor.Enabled := true;
end;

procedure TfrmCadGrdValorBeneficiario.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(LkcTbTipoValor.Text) =  '' then
   begin
     ShowMessage('Informe o Tipo de Valor');
     LkcTbTipoValor.SetFocus;
     exit;
   end;
  EdtValor.text := FormataFloat(EdtValor.text);
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadGrdValorBeneficiario.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadGrdValorBeneficiario.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipante.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipante.Versao;
   end;
  if trim(EdtValor.text) = '' then
    EdtValor.text := '0'; 
  qryPrincipal.FieldByName('VL_PARTICIPANTE').AsFloat := StrToFloat(EdtValor.text); 


  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TIPO_VALOR').AsInteger;
end;

procedure TfrmCadGrdValorBeneficiario.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadGrdValorBeneficiario.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TIPO_VALOR',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadGrdValorBeneficiario.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_TIPO_VALOR', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.
