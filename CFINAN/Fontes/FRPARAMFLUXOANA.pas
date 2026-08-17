unit FRPARAMFLUXOANA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmRParamFluxoAna = class(TfrmOkCancelar)
    deDataIni: TCMDateTimePicker;
    lblDataIni: TLabel;
    deDataFim: TCMDateTimePicker;
    lblDataFinal: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamFluxoAna: TfrmRParamFluxoAna;

implementation

{$R *.DFM}

Uses DRelatoriosCFinan,USistema,UMensErro;

procedure TfrmRParamFluxoAna.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim(deDataIni.text) = '' then begin
     MsgDlg('Obrigatório preencher da data inicial','Erro',mtError,[mbOk],0);
     deDataIni.SetFocus;
     exit;
  end;
  if trim(deDataFim.text) = '' then begin
     MsgDlg('Obrigatório preencher da data final','Erro',mtError,[mbOk],0);
     deDataFim.SetFocus;
     exit;
  end;
  if deDataIni.Date > deDataFim.Date then begin
     MsgDlg('Data inicial não pode ser maior que data final','Erro',mtError,[mbOk],0);
     deDataIni.SetFocus;
     exit;
  end;
  with dtmRelatoriosCFinan do begin
     qryFluxoReaAna.Close;
     qryFluxoReaAna.ParamByName('pDATAINI').AsString   := deDataIni.Text;
     qryFluxoReaAna.ParamByName('pDATAFIM').AsString   := deDataFim.Text;
     qryFluxoReaAna.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
     qryFluxoReaAna.Open;
  end;
end;

end.
