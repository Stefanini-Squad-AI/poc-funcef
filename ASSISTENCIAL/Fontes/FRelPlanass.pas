unit FRelPlanass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmRelPlanass = class(TrelSimples)
    QRDBText2: TQRDBText;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPlanass: TfrmRelPlanass;

implementation

uses FCliente;

{$R *.DFM}


procedure TfrmRelPlanass.FormCreate(Sender: TObject);
begin
  inherited;
qryplanass.open;
//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;

procedure TfrmRelPlanass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// action := cafree;
end;



end.
