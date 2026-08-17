unit fLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls;

type
  TFrmLog = class(TfrmOkCancelar)
    ReLog: TRichEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLog: TFrmLog;

implementation

uses UModulo;

{$R *.DFM}

procedure TFrmLog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  //Canclose := Modulo.FechaLog;
  //Modulo.FechaLog := False;
end;

end.
