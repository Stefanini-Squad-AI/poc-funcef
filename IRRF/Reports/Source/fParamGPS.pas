unit fParamGPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, uMensErro;

type
  TfrmrptParamGPS = class(TfrmParamReports_Padrao)
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    rgData: TRadioGroup;
    lblPerApu: TLabel;
    edPerApur: TEdit;
    lblNatureza: TLabel;
    dblcJuros: TwwDBLookupCombo;
    Label1: TLabel;
    dblcMulta: TwwDBLookupCombo;
    rgVisualizaGPS: TRadioGroup;
    cdsJurosMulta: TCMClientDataSet;
    sqlJurosMulta: TCMSqlParams;
    procedure bbtnConfirmarClick(Sender: TObject);

  private // Private declarations

    function VerificaPreenchimento: Boolean;


  public  // Public declarations


  end;



var
  frmrptParamGPS: TfrmrptParamGPS;



implementation
{$R *.DFM}
uses
  uSistema, uVerificaPreenchimento;



procedure TfrmrptParamGPS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if not(VerificaPreenchimento) then Exit;

  Cmp_Padrao.ParamValues[0].AsDateTime := edtDataIni.Date;
  Cmp_Padrao.ParamValues[1].AsDateTime := edtDataFim.Date;
  Cmp_Padrao.ParamValues[2].AsInteger  := rgVisualizaGPS.ItemIndex;
end;



function TfrmrptParamGPS.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    if length(trim(edtDataIni.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

    if length(trim(edtDataFim.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

    // ---------------------------------------------------------------------------------------------

  except
    on ev : EValidacao do
    begin
      Screen.Cursor := crDefault;
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



end.
