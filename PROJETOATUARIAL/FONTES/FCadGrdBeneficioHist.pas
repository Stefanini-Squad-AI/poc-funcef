{===============================================================================
Unit    :  FCadGrdBeneficioHist
Form    :  frmCadGrdBeneficioHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/08/2000

Objetivo: Consultar Benefícios da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdBeneficioHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, Mask, wwdblook,
  MontaSelect, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadGrdBeneficioHist = class(TfrmCadastroGrid)
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryPrincipalDS_TIPO_BENEF: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_TIPO_BENEF: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
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
  frmCadGrdBeneficioHist: TfrmCadGrdBeneficioHist;
  wIdReg: Integer;  

implementation

uses uGlobal, uParticipanteHist;

{$R *.DFM}

procedure TfrmCadGrdBeneficioHist.FormCreate(Sender: TObject);
begin
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipanteHist.Participante;
  qryPrincipal.ParamByName('CD_PESSOA_PATROC').asInteger := frmParticipanteHist.Patroc;
  qryPrincipal.ParamByName('CD_PESSOA_ENTID').asInteger := frmParticipanteHist.Entid;
  inherited;
end;

procedure TfrmCadGrdBeneficioHist.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadGrdBeneficioHist.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipanteHist.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
    qryPrincipal.FieldByName('CD_PESSOA_PATROC').AsInteger := frmParticipanteHist.Patroc;
    qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger := frmParticipanteHist.Entid;
    qryPrincipal.FieldByName('CD_PLANO').AsInteger := frmParticipanteHist.Plano;
   end;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TIPO_BENEF').AsInteger;
end;

procedure TfrmCadGrdBeneficioHist.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadGrdBeneficioHist.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TIPO_BENEF',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadGrdBeneficioHist.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_TIPO_BENEF', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.
