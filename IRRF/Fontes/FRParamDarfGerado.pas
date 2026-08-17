unit FRParamDarfGerado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmRParamDarfGerado = class(TfrmOkCancelar)
    gbDatas: TGroupBox;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamDarfGerado: TfrmRParamDarfGerado;

implementation

{$R *.DFM}

Uses uMensErro, dRelatIRRF;

procedure TfrmRParamDarfGerado.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatIRRF.rpDarfGeradoLabel2.Caption := deDataIni.Text+' - '+deDataFim.Text;
  with dtmRelatIRRF.qryDarfGerado do begin
     Close;
     ParamByName('DATAINI').AsString := deDataIni.Text;
     ParamByName('DATAFIM').AsString := deDataFim.Text;
     Open;
  end;
end;

end.
