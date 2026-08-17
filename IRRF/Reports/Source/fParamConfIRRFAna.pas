unit fParamConfIRRFAna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CMProcuraSubTipo;

type
  TfrmParamConfIRRFAna = class(TfrmParamReports_Padrao)
    cmfcBeneficiario: TCMProcuraForCli;
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamConfIRRFAna: TfrmParamConfIRRFAna;

implementation

{$R *.DFM}

procedure TfrmParamConfIRRFAna.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamValues[0].AsString := cmfcBeneficiario.Text;
  Cmp_Padrao.ParamValues[1].AsString := deDataIni.text;
  Cmp_Padrao.ParamValues[2].AsString := deDataFim.text;
end;

end.
