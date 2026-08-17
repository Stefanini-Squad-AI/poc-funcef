unit FRParamConfIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBTables, Wwquery, CMProcuraSubTipo;

type
  TfrmRParamConfIRRF = class(TfrmOkCancelar)
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    qryAux: TwwQuery;
    qryAuxNUMDOCUMENTO: TStringField;
    cmfcBeneficiario: TCMProcuraForCli;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamConfIRRF: TfrmRParamConfIRRF;

implementation
uses DRelatIRRF,uSistema;
{$R *.DFM}

procedure TfrmRParamConfIRRF.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   qryAux.Close;
   qryAux.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryAux.Open;
   //
   dtmRelatIRRF.lblConfIRRFPeriodo.caption    := 'Período: '+deDataIni.Text+' a '+deDataFim.Text;
   dtmRelatIRRF.lblConfIRRFAnaPeriodo.caption := 'Período: '+deDataIni.Text+' a '+deDataFim.Text;
   //
   dtmRelatIRRF.qryConfIRRF.Close;
   dtmRelatIRRF.qryConfIRRF.ParamByName('NUMDOCUMENTO').AsString := Copy(qryAuxNUMDOCUMENTO.AsString,1,8);
   dtmRelatIRRF.qryConfIRRF.ParamByName('DATAINI').AsString      := deDataIni.Text;
   dtmRelatIRRF.qryConfIRRF.ParamByName('DATAFIM').AsString      := deDataFim.Text;
   if Trim(cmfcBeneficiario.Text) <> '' then
      dtmRelatIRRF.qryConfIRRF.ParamByName('PNOMEBENEF').Asstring := cmfcBeneficiario.Text + '%'
   else
      dtmRelatIRRF.qryConfIRRF.ParamByName('PNOMEBENEF').Asstring := '%';

   dtmRelatIRRF.qryConfIRRF.Open;
   //
   dtmRelatIRRF.qryConfIRRFAna.Close;
   dtmRelatIRRF.qryConfIRRFAna.ParamByName('NUMDOCUMENTO').AsString := Copy(qryAuxNUMDOCUMENTO.AsString,1,8);
   dtmRelatIRRF.qryConfIRRFAna.ParamByName('DATAINI').AsString      := deDataIni.Text;
   dtmRelatIRRF.qryConfIRRFAna.ParamByName('DATAFIM').AsString      := deDataFim.Text;
   if Trim(cmfcBeneficiario.Text) <> '' then
      dtmRelatIRRF.qryConfIRRFAna.ParamByName('PNOMEBENEF').Asstring := cmfcBeneficiario.Text + '%'
   else
      dtmRelatIRRF.qryConfIRRFAna.ParamByName('PNOMEBENEF').Asstring := '%';
   dtmRelatIRRF.qryConfIRRFAna.Open;
   //
end;

end.
