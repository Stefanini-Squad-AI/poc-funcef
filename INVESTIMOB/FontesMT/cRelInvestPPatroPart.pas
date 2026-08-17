{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 17/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit cRelInvestPPatroPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, wwdblook, uModuloImobiliario;

type
  TcfgRelInvestPPatroPart = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    GroupBox1: TGroupBox;
    edtDataSaldo: TCMDateTimePicker;
    Label2: TLabel;
    DBcboPlanoPrev: TwwDBLookupCombo;
    Label1: TLabel;
    DBcboPatrocinadora: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelInvestPPatroPart: TcfgRelInvestPPatroPart;

implementation

uses
  uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados,
  dLookImobiliario;

{$R *.DFM}

procedure TcfgRelInvestPPatroPart.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  if VerificaPreenchimento then
    begin
      inherited;
      cmp_Padrao.ParamByName('dDataSaldo').AsDateTime := edtDataSaldo.Date;
      if DBcboPatrocinadora.LookupValue <> '' then
        cmp_Padrao.ParamByName('PPatro').AsInteger := StrToInt(DBcboPatrocinadora.LookupValue);
      if DBcboPlanoPrev.LookupValue <> '' then
        cmp_Padrao.ParamByName('PPlano').AsInteger := StrToInt(DBcboPlanoPrev.LookupValue);

      // Carrega variáveis com os parametros de cores de linha e separadores
      iPosCor  := 0;
      CorLinha := cboCorLinha.SelectedColor;
      ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
      cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
      cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
      cmp_Padrao.ParamByName('iPosCor').AsInteger    := iPosCor;

      if bbtnConfirmar.ModalResult <> mrOk then begin
         bbtnConfirmar.ModalResult := mrOk;
         bbtnConfirmar.Click;
      end;
    end;
end;

procedure TcfgRelInvestPPatroPart.FormCreate(Sender: TObject);
begin
  inherited;
  dtmLookImobiliario.qryLookPatrocinadora.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
  dtmLookImobiliario.qryLookPatrocinadora.Active := True;
  dtmLookImobiliario.qryLookPlanoPrev.Active     := True;
  edtDataSaldo.Date := Date();
end;

function TcfgRelInvestPPatroPart.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if edtDataSaldo.Text = '' then
      raise EValidacao.CreateVal('Informe a data para o cálculo!',edtDataSaldo);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

end.
