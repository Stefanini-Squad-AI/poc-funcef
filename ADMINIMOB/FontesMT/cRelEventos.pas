unit cRelEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, mContrato;

type
  TcfgRelEventos = class(TfrmParamReports_Padrao)
    molContrato: TmolContrato;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    dDtInicio: TwwDBDateTimePicker;
    dDtFim: TwwDBDateTimePicker;
    Label2: TLabel;
    cmbTipoEvento: TComboBox;
    Label3: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function VerificaPreenchimento : boolean;
  public
    { Public declarations }
  end;

var
  cfgRelEventos: TcfgRelEventos;

implementation

uses
  uVerificaPreenchimento, UMensErro;
  
{$R *.DFM}

procedure TcfgRelEventos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if VerificaPreenchimento then
  begin

    cmp_Padrao.ParamByName('iIdContratoImovel').AsInteger := molContrato.iContrato;

    if dDtInicio.Text <> '' then begin
      cmp_Padrao.ParamByName('dDtInicio').AsDateTime := dDtInicio.DateTime;
      cmp_Padrao.ParamByName('dDtFim').AsDateTime := dDtFim.DateTime;
    end
    else begin
      cmp_Padrao.ParamByName('dDtInicio').AsDateTime := -1;
      cmp_Padrao.ParamByName('dDtFim').AsDateTime := -1;
    end;

    cmp_Padrao.ParamByName('sFlgTipoEvento').AsString := trim( Copy( cmbTipoEvento.Text, 1, 2 ) );

    if bbtnConfirmar.ModalResult <> mrOk then
    begin
      bbtnConfirmar.ModalResult := mrOk;
      bbtnConfirmar.Click;
    end;

  end;  
end;

function TcfgRelEventos.VerificaPreenchimento: boolean;
begin
  Result := False;
  try

    if ( ( dDtInicio.Text = '' ) and ( dDtFim.Text <> '' ) ) then
      raise EValidacao.CreateVal('A data inicial não foi preenchida', dDtInicio );

    if ( ( dDtInicio.Text <> '') and ( dDtFim.Text = '' ) ) then
      raise EValidacao.CreateVal('A data final não foi preenchida', dDtFim );

    if ( dDtInicio.Date > dDtFim.Date ) then
      raise EValidacao.CreateVal('A data inicial deve ser anterior à data final.', dDtInicio );

    Result := True;

  except
    on ev : EValidacao do
    begin
      if ev.Show then
        MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
        ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TcfgRelEventos.FormCreate(Sender: TObject);
begin
  inherited;
  cmp_Padrao.ParamByName('iIdContratoImovel').AsInteger := -1; 
end;

end.
