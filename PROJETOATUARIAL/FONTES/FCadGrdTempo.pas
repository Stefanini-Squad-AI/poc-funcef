{===============================================================================
Unit    :  FCadGrdTempo
Form    :  frmCadGrdTempo

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/07/2000

Objetivo: Cadastrar o Tempo dos Participantes.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdTempo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, wwDialog,
  ImgList, MontaSelect{, Mast};

type
  TfrmCadGrdTempo = class(TfrmCadastroGrid)
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
  frmCadGrdTempo: TfrmCadGrdTempo;
  wIdReg: Integer;

implementation

uses fParticipante;

{$R *.DFM}

procedure TfrmCadGrdTempo.FormCreate(Sender: TObject);
begin
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger := frmParticipante.Versao;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger := frmParticipante.Participante;
  inherited;
  qryTipoTempo.Open;
end;

procedure TfrmCadGrdTempo.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoTempo.Enabled := false;
  DateEdit.Text := qryPrincipal.FieldByName('DT_TEMPO').asString;  
end;

procedure TfrmCadGrdTempo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoTempo.Close;
end;

procedure TfrmCadGrdTempo.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadGrdTempo.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  LkcTbTipoTempo.Enabled := true;
  DateEdit.Text := '';  
end;

procedure TfrmCadGrdTempo.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadGrdTempo.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger := frmParticipante.Participante;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger := frmParticipante.Versao;
   end;
  if trim(DateEdit.Text) = '' then
    qryPrincipal.FieldByName('DT_TEMPO').Value := null
  else
    qryPrincipal.FieldByName('DT_TEMPO').asDateTime := StrToDate(DateEdit.Text);

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_TIPO_TEMPO').AsInteger;
end;

procedure TfrmCadGrdTempo.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadGrdTempo.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_TIPO_TEMPO',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

procedure TfrmCadGrdTempo.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_VERSAO;CD_PARTIC;CD_TIPO_TEMPO', VarArrayOf([StrToInt(MontaSelect.ValoresChave[0]),
                       StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2])]), []);

  sbtnProcurar.Down := False;
end;

end.
