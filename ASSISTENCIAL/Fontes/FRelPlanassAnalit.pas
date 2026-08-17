unit FRelPlanassAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmRelPlanassAnalit = class(TrelSimples)
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPlanassAnalit: TfrmRelPlanassAnalit;

implementation

uses FCliente;

{$R *.DFM}






procedure TfrmRelPlanassAnalit.FormCreate(Sender: TObject);
begin
  inherited;
QRYPLANASS.OPEN;
//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;

procedure TfrmRelPlanassAnalit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// action := cafree;
end;



end.
