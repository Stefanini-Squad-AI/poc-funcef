unit FMudaStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, DBCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr;

type
  TfrmMudaStatus = class(TfrmSairAjuda)
    dbrConcilia: TDBRadioGroup;
    qryAltStatus: TwwQuery;
    updAltStatus: TUpdateSQL;
    dsAltStatus: TwwDataSource;
    gbData: TGroupBox;
    dbedDataConcilia: TCMDateTimePicker;
    bbtnConfirma: TBitBtn;
    procedure dbrConciliaExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMudaStatus: TfrmMudaStatus;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,UAutorizacao,uSistema, FMovimFinanc,uFuncaoGeral;

procedure TfrmMudaStatus.dbrConciliaExit(Sender: TObject);
begin
  inherited;
  if qryAltStatus.FieldByName('STATUSCONCILIA').AsString = 'X' then
  Begin
     gbData.Enabled := True;
     qryAltStatus.FieldByName('DATACONCILIACAO').AsString:=DateToStr(Date);
  end
  else
  Begin
     gbData.Enabled := False;
     qryAltStatus.FieldByName('DATACONCILIACAO').AsString:='';
  end;
end;

procedure TfrmMudaStatus.bbtnSairClick(Sender: TObject);
begin
  qryAltStatus.CancelUpdates;
  inherited;
end;

procedure TfrmMudaStatus.bbtnConfirmaClick(Sender: TObject);
begin
  inherited;
  if (qryAltStatus.FieldByName('STATUSCONCILIA').AsString = 'X') and (qryAltStatus.FieldByName('DATACONCILIACAO').AsString = '') then
  Begin
     MsgDlg('Obrigatório preencher a data que esta lançamento bateu no Banco','Erro',mtError,[mbOk],0);
     dbedDataConcilia.SetFocus;
     exit;
  end;
  qryAltStatus.Post;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qryAltStatus]);
  bbtnSairClick(nil);
end;

procedure TfrmMudaStatus.FormActivate(Sender: TObject);
begin
  inherited;
  qryAltStatus.Close;
  qryAltStatus.SQL.Clear;
  qryAltStatus.SQL.Text:='SELECT CODLANCFINANC,STATUSCONCILIA,DATACONCILIACAO FROM MOVIMFINANC '+
                         'WHERE CODLANCFINANC = '+IntToStr(frmMovimFinanc.iCodLancFinanc);
  qryAltStatus.Open;
  qryAltStatus.Edit;
  dbrConcilia.SetFocus;
end;

end.
