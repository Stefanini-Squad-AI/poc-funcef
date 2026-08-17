unit FTesteDatas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmTesteDatas = class(TfrmOkCancelar)
    Label14: TLabel;
    dDataIni: TCMDateTimePicker;
    Label1: TLabel;
    dDataFim: TCMDateTimePicker;
    Label2: TLabel;
    dDataTR: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtDC: TEdit;
    edtFeriados: TEdit;
    edtSabados: TEdit;
    edtDomingos: TEdit;
    edtDU: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteDatas: TfrmTesteDatas;

implementation

uses URendaFixa, UDiasUteisInv;

{$R *.DFM}

procedure TfrmTesteDatas.bbtnConfirmarClick(Sender: TObject);
var
  a,b : TDateTime;
begin
  inherited;
  // Data da Próxima TR após último aniversário em relação a data inicial
  dDataTR.Text     := DateToStr(RendaFixa.BuscaUltimoTRPoupanca(StrToDate(dDataIni.Text),1,StrToDate(dDataFim.Text)));
  // Dias Corridos
  edtDC.Text       := IntToStr(DiasUteisInv.IntervaloDias(StrToDate(dDataIni.Text), StrToDate(dDataFim.Text)));
  // Feriados
  edtFeriados.Text := IntToStr(DiasUteisInv.ContaFeriados(StrToDate(dDataIni.Text), StrToDate(dDataFim.Text), -1,1,'',True,False));
  // Sábados
  edtSabados.Text  := IntToStr(DiasUteisInv.ContaSabados(StrToDate(dDataIni.Text), StrToDate(dDataFim.Text)));
  // Domingos
  edtDomingos.Text := IntToStr(DiasUteisInv.ContaDomingos(StrToDate(dDataIni.Text), StrToDate(dDataFim.Text)));
  // Dias Úteis
  edtDU.Text       := IntToStr(DiasUteisInv.IntervaloDiasUteis(StrToDate(dDataIni.Text), StrToDate(dDataFim.Text), -1,1,'',True,False,False));
end;

end.
