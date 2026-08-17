unit FParamRelatCompRendPessFisica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCompRendReten, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, ExtCtrls, ComCtrls, TB97, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamRelatCompRendPessFis = class(TfrmCompRendReten)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelatCompRendPessFis: TfrmParamRelatCompRendPessFis;

implementation
 uses DRelatIRRF,uSistema;
{$R *.DFM}

procedure TfrmParamRelatCompRendPessFis.bbtnConfirmarClick(
  Sender: TObject);
var
ano : string;
begin

   ano:= edtData.text;
   dtmRelatIRRF.qryComRendRet.close;
   dtmRelatIRRF.qryComRendRet.ParamByName('sDataIni').AsString   :='01/01/'+ANO;
   dtmRelatIRRF.qryComRendRet.ParamByName('sDataFim').AsString   :='31/12/'+ANO;
   dtmRelatIRRF.qryComRendRet.ParamByName('iIdPessoa').AsInteger :=Sistema.idEmpresa;
   dtmRelatIRRF.qryComRendRet.Open;
   dtmRelatIRRF.rpComRendRetLabel38.text := ano;
   if CheckBox1.checked  then begin
      dtmRelatIRRF.rpComRendRetLabel67.text := edtNome.text;
      dtmRelatIRRF.rpComRendRetLabel69.text := dtdtData.text;
   end;
   inherited;
end;


procedure TfrmParamRelatCompRendPessFis.FormActivate(Sender: TObject);
VAR
DATA : STRING;
begin
   inherited;
   DATA := DATETIMETOSTR(DATE);
   edtData.TEXT := DATA[7]+DATA[8]+DATA[9]+DATA[10];
end;

end.
