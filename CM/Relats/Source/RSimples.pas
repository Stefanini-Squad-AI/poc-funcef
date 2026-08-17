unit RSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RHeadFoot, Qrctrls, Db, Wwdatsrc, quickrpt, ExtCtrls, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti;

type
  TrelSimples = class(TrelHeadFoot)
    qrCabecalho: TQRBand;
    QrLabelFixo: TQRLabel;
    DetailBand1: TQRBand;
    QrLabel4: TQRLabel;
    procedure qrCabecalhoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    //clCorCab,clCorMestre : String;
  public
    { Public declarations }
  end;

var
  relSimples: TrelSimples;

implementation

{$R *.DFM}

Uses USistema, UAutorizacao, UMensErro;

procedure TrelSimples.qrCabecalhoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{
  if      Modulo.clCorCab = 'CI' Then
     qrCabecalho.Color:=clSilver
  else if Modulo.clCorCab = 'AZ' Then
     qrCabecalho.Color:=clAqua
  else if Modulo.clCorCab = 'VD' Then
     qrCabecalho.Color:=clTeal
  else if Modulo.clCorCab = 'VM' Then
     qrCabecalho.Color:=clRed
  else if Modulo.clCorCab = 'AM' Then
     qrCabecalho.Color:=clYellow
  else if Modulo.clCorCab = 'ES' Then
     qrCabecalho.Color:=Modulo.clCorCabEsp
  else
     qrCabecalho.Color:=clWhite;
}
  qrCabecalho.Frame.DrawTop    := true;
  qrCabecalho.Frame.DrawBottom := true;
end;

end.
