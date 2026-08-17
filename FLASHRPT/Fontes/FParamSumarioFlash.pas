unit FParamSumarioFlash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamSumDCFlash = class(TfrmOkCancelar)
    Label1: TLabel;
    deDataRef: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamSumDCFlash: TfrmParamSumDCFlash;

implementation

{$R *.DFM}
uses uFlashRpt, uModulo, uMensErro;
procedure TfrmParamSumDCFlash.bbtnConfirmarClick(Sender: TObject);
var d,m,a: word;
begin
  inherited;
  if trim(deDataRef.Text) = '' then
  begin
    MsgDlg('Obrigatório preencher a data de Referência !','Erro',mtError,[mbok],0);
    deDataRef.SetFocus;
    Exit;
  end;

  DecodeDate(deDataRef.Date,a,m,d);
  with dtmFlashRpt do
  begin
    lblDataSumario.Caption := deDataRef.Text;
    qrySumarioImpostos.Close;
    qrySumarioImpostos.ParamByName('IDHOTEL').AsFloat := Modulo.iHotel;
    qrySumarioImpostos.ParamByName('DATAFIM').AsDateTime := deDataRef.Date;
    qrySumarioImpostos.ParamByName('DATAINI').AsDateTime := EncodeDate(a,m,1);
    qrySumarioImpostos.Open;

    qrySumarioFlash.Close;
    qrySumarioFlash.ParamByName('IDHOTEL').AsFloat := Modulo.iHotel;
    qrySumarioFlash.ParamByName('DATAFIM').AsDateTime := deDataRef.Date;
    qrySumarioFlash.ParamByName('DATAINI').AsDateTime := EncodeDate(a,m,1);
    qrySumarioFlash.Open;
  end;
end;

procedure TfrmParamSumDCFlash.FormCreate(Sender: TObject);
begin
  inherited;
  deDataRef.Date := Modulo.dDataSistema;
end;

end.
