unit FRParamDispFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmRParamDispFinanc = class(TfrmOkCancelar)
    edDataRef: TCMDateTimePicker;
    lblDataRef: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamDispFinanc: TfrmRParamDispFinanc;

implementation

uses DRelatoriosCFinan, USistema, UMensErro;

{$R *.DFM}

procedure TfrmRParamDispFinanc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim(edDataRef.Text) = '' then begin
     MsgDlg('Obrigatório indicar a data de referência','Erro',mtError,[mbOk],0);
     edDataRef.SetFocus;
     exit;
  end;
  //
  dtmRelatoriosCFinan.qryDispFinanc.Close;
  dtmRelatoriosCFinan.qryDispFinanc.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  dtmRelatoriosCFinan.qryDispFinanc.ParamByName('pDATAREF').AsString   := edDataRef.Text;
  dtmRelatoriosCFinan.qryDispFinanc.Open;
end;

end.
