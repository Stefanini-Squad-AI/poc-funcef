unit RCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RPai, ExtCtrls, quickrpt, Qrctrls,FPRelCarta;

type
  TrelCarta = class(TrelPai)
    DetailBand1: TQRBand;
    qrdbredCarta: TQRDBRichText;
    procedure qrBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relCarta: TrelCarta;

implementation



{$R *.DFM}




procedure TrelCarta.qrBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  qr.PrinterSettings.Copies := frmPrelCarta.spedCopias.Value;
end;

end.
