unit fAplicaDiferenca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls;

type
  TfrmAplicaDiferenca = class(TfrmOkCancelar)
    qryMeses: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    CmbMesIni: TComboBox;
    CmbMesFin: TComboBox;
    qryValMesAnt: TwwQuery;
    qryValMesPos: TwwQuery;
    UpdValMesPos: TUpdateSQL;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    bCancela : boolean;
    procedure AplicaDiferencas;
    procedure DesFazer;
  public
    { Public declarations }
  end;

var
  frmAplicaDiferenca: TfrmAplicaDiferenca;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmAplicaDiferenca.FormCreate(Sender: TObject);
begin
  inherited;
  qryMeses.Close;
  qryMeses.Open;
  CmbMesIni.Clear;
  CmbMesFin.Clear;
  qryMeses.First;
  while not qryMeses.eof do
  begin
    CmbMesIni.Items.Add(qryMeses.fieldByName('MESCOBRANCA').asString);
    CmbMesFin.Items.Add(qryMeses.fieldByName('MESCOBRANCA').asString);
    qryMeses.Next;
  end;
end;


procedure TfrmAplicaDiferenca.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AplicaDiferencas;
end;

procedure TfrmAplicaDiferenca.AplicaDiferencas;
var difer : Extended;
begin
  QryValMesAnt.Close;
  QryValMesAnt.paramByName('MES').asString := trim(cmbMesIni.text);
  QryValMesAnt.Open;

  QryValMesPos.Close;
  QryValMesPos.paramByName('MES').asString := trim(cmbMesFin.text);
  QryValMesPos.Open;

  if QryValMesPos.IsEmpty then
  begin
    ShowMessage('Não é possível reajustar preparo já enviado!');
    exit;
  end;

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  QryValMesAnt.First;
  QryValMesPos.First;
  difer := 0;
  ProgressBar.Min := 0;
  ProgressBar.Max := QryValMesPos.RecordCount;
  bcancela := false;
  try
    try
      while (not QryValMesPos.eof) and (not bcancela) do
      begin
        application.processMessages;
        ProgressBar.StepIt;
        ProgressBar.Update;

        if qryValMesAnt.Locate('IDTITULAR', qryValMesPos.fieldByName('IDTITULAR').asString, []) then
        begin
          if qryValMesAnt.FieldByName('IDTITULAR').asInteger = qryValMesPos.fieldByName('IDTITULAR').asInteger then
          begin
            difer := qryValMesPos.fieldByName('VALORESPERADO').asFloat - qryValMesAnt.fieldByName('VALORESPERADO').asFloat;
            if difer > 0 then
            begin
              qryValMesPos.Edit;
              qryValMesPos.fieldByName('VALORESPERADO').asFloat := qryValMesPos.fieldByName('VALORESPERADO').asFloat + difer;
              qryValMesPos.ApplyUpdates;
            end;
          end;
        end;
        QryValMesPos.Next;
      end;
    except
      dtmBaseDados.dbBaseDados.RollBack;
    end;
  finally
    dtmBaseDados.dbBaseDados.Commit;
    showMessage('Valores Atualizados com Sucesso!');
  end;

  if bcancela = true then
  begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;

end;

procedure TfrmAplicaDiferenca.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bcancela := true;
end;

procedure TfrmAplicaDiferenca.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bcancela := true;
end;

procedure TfrmAplicaDiferenca.DesFazer;
var difer : Extended;
begin
  QryValMesAnt.Close;
  QryValMesAnt.paramByName('MES').asString := trim(cmbMesIni.text);
  QryValMesAnt.Open;

  QryValMesPos.Close;
  QryValMesPos.paramByName('MES').asString := trim(cmbMesFin.text);
  QryValMesPos.Open;

  if QryValMesPos.IsEmpty then
  begin
    ShowMessage('Não é possível reajustar preparo já enviado!');
    exit;
  end;

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  QryValMesAnt.First;
  QryValMesPos.First;
  difer := 0;
  ProgressBar.Min := 0;
  ProgressBar.Max := QryValMesPos.RecordCount;
  bcancela := false;
  try
    try
      while (not QryValMesPos.eof) and (not bcancela) do
      begin
        application.processMessages;
        ProgressBar.StepIt;
        ProgressBar.Update;

        if qryValMesAnt.Locate('IDTITULAR', qryValMesPos.fieldByName('IDTITULAR').asString, []) then
        begin
          if qryValMesAnt.FieldByName('IDTITULAR').asInteger = qryValMesPos.fieldByName('IDTITULAR').asInteger then
          begin
            difer := qryValMesPos.fieldByName('VALORESPERADO').asFloat - qryValMesAnt.fieldByName('VALORESPERADO').asFloat;
            if difer > 0 then
            begin
              qryValMesPos.Edit;
              qryValMesPos.fieldByName('VALORESPERADO').asFloat := qryValMesPos.fieldByName('VALORESPERADO').asFloat - difer;
              qryValMesPos.ApplyUpdates;
            end;
          end;
        end;
        QryValMesPos.Next;
      end;
    except
      dtmBaseDados.dbBaseDados.RollBack;
    end;
  finally
    dtmBaseDados.dbBaseDados.Commit;
    showMessage('Valores Atualizados com Sucesso!');
  end;

  if bcancela = true then
  begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;

end;

end.
