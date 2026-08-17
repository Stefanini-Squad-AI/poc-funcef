unit fDataHora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  MskEdDlg, Db, DBTables, Wwquery, wwdblook;

type
  TfrmDataHora = class(TfrmOkCancelar)
    cmDTPdata: TCMDateTimePicker;
    Data: TLabel;
    Hora: TLabel;
    eddlghorainicio: TcmMaskEditDlg;
    qryTipoAtend: TwwQuery;
    dblkTipoAtendimento: TwwDBLookupCombo;
    Label1: TLabel;
    Bevel1: TBevel;
    qryParamCentralAp: TwwQuery;
    qryParamCentralApIDTIPOATENDPADRAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkTipoAtendimentoChange(Sender: TObject);
  private
    { Private declarations }
    SysTime: TSystemTime;
    DTime : TTime;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
  public
    { Public declarations }
  end;

var
  frmDataHora: TfrmDataHora;
  TipoAtend : Double;

implementation

{$R *.DFM}

procedure TfrmDataHora.FormCreate(Sender: TObject);
begin
  inherited;
  TipoAtend := 0;
end;

procedure TfrmDataHora.bbtnConfirmarClick(Sender: TObject);
var   SysTime: TSystemTime;
begin
  cmDTPdata.DateTime := cmDTPdata.Date + strToTime(eddlghorainicio.text);
  DateTimeToSystemTime(cmDTPdata.DateTime, SysTime);
  SetLocalTime(SysTime);

  TipoAtend := strToInt(dblkTipoAtendimento.LookupValue);
  bbtnSairClick(sender);
  inherited;
end;

procedure TfrmDataHora.FormShow(Sender: TObject);
begin
  inherited;
  cmDTPdata.Date := Now;
  Dtime := Now;
  DecodeTime(DTime, Hour, Min, Sec, MSec);
  eddlghorainicio.text :=  intToStr(Hour) + ':'+ IntTostr(Min);
  qryparamCentralAp.Close;
  qryparamCentralAp.Open;
  qryTipoAtend.Close;
  qryTipoAtend.Open;
  qryTipoAtend.Locate('IDTIPOATEND', qryparamCentralApIDTIPOATENDPADRAO.ASinteger,[loCaseInsensitive, loPartialKey]);
  dblkTipoAtendimento.LookupValue := InttoStr(qryparamCentralApIDTIPOATENDPADRAO.AsInteger);
  TipoAtend := strToFloat(dblkTipoAtendimento.LookupValue);
end;

procedure TfrmDataHora.bbtnCancelarClick(Sender: TObject);
begin
  cmDTPdata.Date := Now;
  Dtime := Now;
  DecodeTime(DTime, Hour, Min, Sec, MSec);
  eddlghorainicio.text :=  intToStr(Hour) + ':'+ IntTostr(Min);
  inherited;
end;

procedure TfrmDataHora.dblkTipoAtendimentoChange(Sender: TObject);
begin
  inherited;
  TipoAtend := strToFloat(dblkTipoAtendimento.LookupValue);
end;

end.
