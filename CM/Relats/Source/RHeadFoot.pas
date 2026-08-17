unit RHeadFoot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RPai, quickrpt, ExtCtrls, Qrctrls, IvDictio, IvMulti, IvEMulti;

type
  TrelHeadFoot = class(TrelPai)
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    qrlblTitRel: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relHeadFoot: TrelHeadFoot;

implementation

{$R *.DFM}

Uses USistema;


procedure TrelHeadFoot.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';
end;

end.
