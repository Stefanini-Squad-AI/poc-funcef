unit fParamConfIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CMProcuraSubTipo, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmparamConfIRRF = class(TfrmParamReports_Padrao)
    cmfcBeneficiario: TCMProcuraForCli;
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmparamConfIRRF: TfrmparamConfIRRF;

implementation

{$R *.DFM}

procedure TfrmparamConfIRRF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamValues[0].AsString := cmfcBeneficiario.Text;
  Cmp_Padrao.ParamValues[1].AsString := deDataIni.text;
  Cmp_Padrao.ParamValues[2].AsString := deDataFim.text;
end;

procedure TfrmparamConfIRRF.FormCreate(Sender: TObject);
begin
  inherited;
  deDataIni.Date := Date;
  deDataFim.Date := Date;
end;

end.
