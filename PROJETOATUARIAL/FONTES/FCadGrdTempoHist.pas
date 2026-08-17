{===============================================================================
Unit    :  FCadGrdTempoHist
Form    :  frmCadGrdTempoHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/08/2000

Objetivo: Consultar Tempo da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdTempoHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, wwDialog,
  ImgList, MontaSelect{, Mast};

type
  TfrmCadGrdTempoHist = class(TfrmCadastroGrid)
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryPrincipalDS_TIPO_TEMPO: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_TIPO_TEMPO: TFloatField;
    qryPrincipalDT_TEMPO: TDateTimeField;
    qryPrincipalQT_DIA_TEMPO: TFloatField;
    qryPrincipalQT_MES_TEMPO: TFloatField;
    qryPrincipalQT_ANO_TEMPO: TFloatField;
    LkcTbTipoTempo: TwwDBLookupCombo;
    Label4: TLabel;
    qryTipoTempo: TwwQuery;
    dsTipoTempo: TwwDataSource;
    qryTipoTempoCD_TIPO_TEMPO: TFloatField;
    qryTipoTempoDS_TIPO_TEMPO: TStringField;
    qryTipoTempoIR_DOMINIO_SISTEMA: TStringField;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DateEdit: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
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
  frmCadGrdTempoHist: TfrmCadGrdTempoHist;
  wIdReg: Integer;

implementation

uses uParticipanteHist;

{$R *.DFM}

procedure TfrmCadGrdTempoHist.FormCreate(Sender: TObject);
begin
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipanteHist.Participante;
  inherited;
  qryTipoTempo.Open;
end;

procedure TfrmCadGrdTempoHist.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoTempo.Enabled := false;
  DateEdit.Text := qryPrincipal.FieldByName('DT_TEMPO').asString;  
end;

procedure TfrmCadGrdTempoHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoTempo.Close;
end;

procedure TfrmCadGrdTempoHist.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(LkcTbTipoTempo.Text) = '' then
   begin
     ShowMessage('Informe o Tipo de Tempo');
     LkcTbTipoTempo.SetFocus;
     exit;
   end;
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadGrdTempoHist.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoTempo.Enabled := true;
  DateEdit.Text := '';  
end;

procedure TfrmCadGrdTempoHist.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadGrdTempoHist.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipanteHist.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipanteHist.Versao;
   end;
  qryPrincipal.FieldByName('DT_TEMPO').asDateTime := StrToDate(DateEdit.Text);

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TIPO_TEMPO').AsInteger;
end;

procedure TfrmCadGrdTempoHist.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadGrdTempoHist.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TIPO_TEMPO',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadGrdTempoHist.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_TIPO_TEMPO', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.
