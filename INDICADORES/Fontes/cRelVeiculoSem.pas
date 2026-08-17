unit cRelVeiculoSem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mImovel,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelVeiculoSem = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmdtIni: TCMDateTimePicker;
    cmdtFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  cfgRelVeiculoSem: TcfgRelVeiculoSem;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelVeiculoSem.FormCreate(Sender: TObject);
begin
  inherited;
  molImovel1.iImovel := -1;
end;

procedure TcfgRelVeiculoSem.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then begin
    cmp_Padrao.ParamByName('idImovel').AsInteger := molImovel1.iImovel;
    if cmdtIni.Text <> '' then
         cmp_Padrao.ParamByName('dtIni').AsDateTime := cmdtIni.Date
    else cmp_Padrao.ParamByName('dtIni').AsDateTime := -1;
    if cmdtFim.Text <> '' then
         cmp_Padrao.ParamByName('dtFim').AsDateTime := cmdtFim.Date
    else cmp_Padrao.ParamByName('dtFim').AsDateTime := -1;

    if bbtnConfirmar.ModalResult <> mrOk then begin
       bbtnConfirmar.ModalResult := mrOk;
       bbtnConfirmar.Click;
    end;
  end;
end;

function TcfgRelVeiculoSem.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if (cmdtIni.Date > 0) and (cmdtFim.Date > 0) and (cmdtIni.Date > cmdtFim.Date) then
        raise EValidacao.CreateVal('Datas inicial não deve ser superior a data final',cmdtIni);
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
