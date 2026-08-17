unit fCadSindi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwdatsrc, Wwquery, MAHlpBtn,
  TB97Tlbr, Buttons, TB97Ctls, TB97, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, CheckLst, ComCtrls, CMDBLookupCombo, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, wwdblook, ExtCtrls,
  TabControlDetalhe, wwdbedit, Mask;

type
  TfrmCadSindi = class(TfrmPessoa)
    tbsSindi: TTabSheet;
    tbshAliquotas: TTabSheet;
    dbgAliquotas: TwwDBGrid;
    dsAliq: TwwDataSource;
    qryAliq: TwwQuery;
    qryAliqIDFAIXAALIQSIND: TFloatField;
    qryAliqVALLIMITEFAIXA: TFloatField;
    qryAliqTAXADAFAIXA: TFloatField;
    qryAliqIDSINDICATO: TFloatField;
    updAliq: TUpdateSQL;
    qryMoeda: TwwQuery;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    speMes: TwwDBSpinEdit;
    dbedPiso: TwwDBEdit;
    dbedMT: TwwDBEdit;
    edNomeMes: TEdit;
    speMesContr: TwwDBSpinEdit;
    edNomeMes2: TEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PessoaChangeSubtipo(IdPessoa: Integer);
    procedure PessoaSaveSubtipo(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure qrySubTipoAfterScroll(DataSet: TDataSet);
    procedure qryAliqAfterInsert(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure speMesChange(Sender: TObject);
    procedure speMesContrChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
  end;

var
  frmCadSindi: TfrmCadSindi;

implementation

uses dBaseDados;

{$R *.DFM}

procedure TfrmCadSindi.FormCreate(Sender: TObject);
begin
  inherited;
  qryMoeda.Open;
  qryAliq.Prepare;
  speMes.Enabled       := false;
  speMesContr.Enabled  := false;
  dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryMoeda.Close;
  qryAliq.Close;
  qryAliq.UnPrepare;
end;

procedure TfrmCadSindi.PessoaChangeSubtipo(IdPessoa: Integer);
begin
  inherited;
  if (qryAliq.Active) and (qryAliq.CachedUpdates) then
    qryAliq.CancelUpdates;

  qryAliq.Close;
  qryAliq.ParamByName('IdPessoa').value := IdPessoa;
  qryAliq.Open;
end;

procedure TfrmCadSindi.PessoaSaveSubtipo(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qryAliq]);
end;

procedure TfrmCadSindi.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 3) then
    dbgAliquotas.Enabled := true;
end;

procedure TfrmCadSindi.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 3) then
    dbgAliquotas.Enabled := true;
end;

procedure TfrmCadSindi.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 3) then
    dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.qrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  speMesChange(nil);
  speMesContrChange(nil);
  speMes.Enabled       := not(qry.IsEmpty);
  speMesContr.Enabled  := not(qry.IsEmpty);
end;

procedure TfrmCadSindi.qryAliqAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryAliq.FieldByName('IdSindicato').Value := qry.FieldByName('IdPessoa').Value;
end;

procedure TfrmCadSindi.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 3) then
    dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if (tbcDetalhe.TabIndex > 3) then
    dbgAliquotas.Enabled := false;
end;

procedure TfrmCadSindi.speMesChange(Sender: TObject);
begin
  if (Trim(speMes.Text) <> '') then
    edNomeMes.Text := LongMonthNames[Round(speMes.Value)]
  else
    edNomeMes.Text := '';
end;

procedure TfrmCadSindi.speMesContrChange(Sender: TObject);
begin
  if (Trim(speMesContr.Text) <> '') then
    edNomeMes2.Text := LongMonthNames[Round(speMesContr.Value)]
  else
    edNomeMes2.Text := '';
end;

end.
