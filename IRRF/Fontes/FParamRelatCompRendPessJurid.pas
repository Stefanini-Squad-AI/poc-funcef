//******************************************************************************
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .Ajustando o padrão da mascara atual do CNPJ para
//                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.  
//******************************************************************************
unit FParamRelatCompRendPessJurid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCompRendReten, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, ExtCtrls, ComCtrls, TB97, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamRelatCompRendPessJur = class(TfrmCompRendReten)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    rgTipo: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelatCompRendPessJur: TfrmParamRelatCompRendPessJur;

implementation
uses DRelatIRRF,uSistema;
{$R *.DFM}

procedure TfrmParamRelatCompRendPessJur.bbtnConfirmarClick(
  Sender: TObject);
var
DATA,ANO : string;
begin
   inherited;
   ANO:= edtData.TEXT;
   dtmRelatIRRF.qryComRenJuridica.close;
   dtmRelatIRRF.qryComRenJuridica.ParamByName('sDataIni').AsString   :='01/01/'+ANO;
   dtmRelatIRRF.qryComRenJuridica.ParamByName('sDataFim').AsString   :='31/12/'+ANO;
   dtmRelatIRRF.qryComRenJuridica.ParamByName('iIdPessoa').AsInteger :=Sistema.idEmpresa;
   if rgTipo.ItemIndex = 0 then begin
      dtmRelatIRRF.qryComRenJuridica.ParamByName('sTipo').AsString   :='J';
      dtmRelatIRRF.ppDBText5.DisplayFormat := 'AA.AAA.AAA\/AAAA\-99;0;_';    // Paulo Nobre -   WO34233
      dtmRelatIRRF.ppLabel3.Caption        := 'NA FONTE - PESSOA JURÍDICA';
      dtmRelatIRRF.ppLabel13.Caption       := '02   PESSOA JURÍDICA BENEFICIÁRIA DOS RENDIMENTOS';
      dtmRelatIRRF.ppLabel16.Caption       := 'CNPJ';
      dtmRelatIRRF.ppLabel17.Caption       := 'NOME EMPRESARIAL';
   end else begin
      dtmRelatIRRF.qryComRenJuridica.ParamByName('sTipo').AsString   :='F';
      dtmRelatIRRF.ppDBText5.DisplayFormat := '999.999.999-99;0;_';
      dtmRelatIRRF.ppLabel3.Caption        := 'NA FONTE - PESSOA FÍSICA';
      dtmRelatIRRF.ppLabel13.Caption       := '02   PESSOA FÍSICA BENEFICIÁRIA DOS RENDIMENTOS';
      dtmRelatIRRF.ppLabel16.Caption       := 'CPF';
      dtmRelatIRRF.ppLabel17.Caption       := 'NOME';
   end;
   dtmRelatIRRF.qryComRenJuridica.Open;
   DATA := DATETIMETOSTR(DATE);
   dtmRelatIRRF.rpComRenJuridicaLabel22.Text := 'ANO - CALENDÁRIO: '+ano;
   if CheckBox1.checked  then begin
      dtmRelatIRRF.ppLabel39.caption := edtNome.text;
      dtmRelatIRRF.ppLabel41.caption := dtdtData.text;
   end;
end;

procedure TfrmParamRelatCompRendPessJur.FormActivate(Sender: TObject);
VAR
DATA : STRING;
begin
   inherited;
   DATA := DATETIMETOSTR(DATE);
   edtData.TEXT := DATA[7]+DATA[8]+DATA[9]+DATA[10];
end;

end.
