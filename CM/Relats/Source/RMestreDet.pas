unit RMestreDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Db, Wwdatsrc, Qrctrls, quickrpt, ExtCtrls, DBTables, Wwquery, uSistema, 
  IvDictio, IvMulti, IvEMulti;

type
  TrelMestreDet = class(TrelSimples)
    qrMestre: TQRGroup;
    procedure qrMestreBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relMestreDet: TrelMestreDet;

implementation

{$R *.DFM}

Uses UAutorizacao, UMensErro;

procedure TrelMestreDet.qrMestreBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
 { if      Modulo.clCorMestre = 'CI' Then
    qrMestre.Color:=clSilver
  else if Modulo.clCorMestre = 'AZ' Then
     qrMestre.Color:=clAqua
  else if Modulo.clCorMestre = 'VD' Then
     qrMestre.Color:=clTeal
  else if Modulo.clCorMestre = 'VM' Then
     qrMestre.Color:=clRed
  else if Modulo.clCorMestre = 'AM' Then
     qrMestre.Color:=clYellow
  else if Modulo.clCorMestre = 'ES' Then
     qrMestre.Color:=Modulo.clCorMestreEsp
  else
     qrMestre.Color:=clWhite;
}
  qrMestre.Frame.DrawTop    := true;
  qrMestre.Frame.DrawBottom := true;
end;

end.
