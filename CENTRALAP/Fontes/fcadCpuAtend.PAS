unit fcadCpuAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Mask, wwdbedit, StdCtrls, wwdblook, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uDataBase;

type
  TfrmCadCpuAtend = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    DblkLocalAtend: TwwDBLookupCombo;
    dbeCPU: TwwDBEdit;
    qryLocalAtend: TwwQuery;
    qryLocalAtendIDLOCALATEND: TFloatField;
    qryLocalAtendDESCLOCALATEND: TStringField;
    qryLocalAtendIDTIPOATEND: TFloatField;
    qryIDCPUATEND: TFloatField;
    qryDESCCPUATEND: TStringField;
    qryLocalAtendXcpu: TwwQuery;
    UPDLocalAtendXCPU: TUpdateSQL;
    qryLocalAtendXcpuIDLOCALATENDXCPU: TFloatField;
    qryLocalAtendXcpuIDCPUATEND: TFloatField;
    qryLocalAtendXcpuIDLOCALATEND: TFloatField;
    qryAux: TwwQuery;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure qryBeforeDelete(DataSet: TDataSet);
    procedure qryAfterDelete(DataSet: TDataSet);
    procedure qryAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCpuAtend: TfrmCadCpuAtend;

implementation

{$R *.DFM}

procedure TfrmCadCpuAtend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaselect.RetornouValor then
  begin
    qry.Close;
    qry.ParamByname('IDCPUATEND').asInteger := strToIntDef(montaselect.ValoresChave[1], - 1);
    qry.Open;
    DblkLocalAtend.LookupValue := montaselect.ValoresChave[2];
  end;
end;

procedure TfrmCadCpuAtend.FormShow(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByname('IDCPUATEND').asInteger := - 1;
  qry.Open;
  qryLocalAtend.Open;
  qryLocalAtendXcpu.Open;
end;

procedure TfrmCadCpuAtend.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if qry.state = dsInsert then
  begin

    qryAux.Close;
    qryAux.ParamByName('CPU').asString := Uppercase(Trim(dbeCPU.text));
    qryAux.Open;
    if not qryAux.IsEmpty then
    begin
      MessageDlg('Esta CPU já foi cadastrada.'+#13#10+'Não se pode cadastrar a mesma CPU mais de uma vez.', mtCustom, [mbOK], 0);
      abort;
    end;

    if (DbeCPU.Text = '') then
    begin
      MessageDlg('O campo CPU de Atendimento é obrigatório', mtCustom, [mbOK], 0);
      if DbeCPU.Canfocus then DbeCPU.SetFocus;
      abort;
    end;

    if (DblkLocalAtend.Text = '') or (DblkLocalAtend.LookupValue = '') then
    begin
      MessageDlg('O campo Local de Atendimento é obrigatório', mtCustom, [mbOK], 0);
      if DblkLocalAtend.Canfocus then DblkLocalAtend.SetFocus;
      abort;
    end;

    qryLocalAtendXcpu.Append;
    qryLocalAtendXcpuIDLOCALATENDXCPU.AsInteger := LeUltRegistro(nil,'LOCALATENDXCPU');
  end
  else if qry.state = dsEdit then
  begin
    qryLocalAtendXcpu.Locate('IDCPUATEND', qryIDCPUATEND.asInteger, []);
    qryLocalAtendXcpu.Edit;
  end;

  if qry.state in [dsEdit, dsInsert] then
  begin
    qryLocalAtendXcpuIDLOCALATEND.AsInteger     := strToIntDef(DblkLocalAtend.LookupValue, -1);
    qryLocalAtendXcpuIDCPUATEND.AsInteger       := qryIDCPUATEND.asInteger;

    qry.post;
    qry.ApplyUpdates;
    qryLocalAtendXcpu.Post;
    qryLocalAtendXcpu.ApplyUpdates;
  end;
end;


procedure TfrmCadCpuAtend.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  QryIDCPUATEND.AsInteger   := LeUltRegistro(nil,'CPUATEND');
end;

procedure TfrmCadCpuAtend.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByname('IDCPUATEND').asInteger := - 1;
  qry.Open;
  DblkLocalAtend.LookupValue := '';
  DblkLocalAtend.Text := '';
end;

procedure TfrmCadCpuAtend.qryBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if qryLocalAtendXcpu.Locate('IDCPUATEND', qryIDCPUATEND.asInteger, []) then
  begin
    qryLocalAtendXcpu.Delete;
    qryLocalAtendXcpu.ApplyUpdates;
  end;
end;

procedure TfrmCadCpuAtend.qryAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DblkLocalAtend.LookupValue := '';
  DblkLocalAtend.Text := '';
end;

procedure TfrmCadCpuAtend.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DblkLocalAtend.LookupValue := '';
  DblkLocalAtend.Text := '';
end;

end.
