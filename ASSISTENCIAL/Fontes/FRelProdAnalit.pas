unit FRelProdAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, Qrctrls, Db, Wwdatsrc, DBTables, Wwquery, quickrpt, ExtCtrls,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmRelProdAnalit = class(TrelMestreDet)
    qryprod: TwwQuery;
    dsprod: TwwDataSource;
    QRDBText1: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand2: TQRBand;
    qryforn: TwwQuery;
    dsforn: TwwDataSource;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryprodBeforeOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
//  mCliente : string ;
    { Public declarations }
  end;

var
  frmRelProdAnalit: TfrmRelProdAnalit;

implementation

uses FParamProdAnalit, FCliente;

{$R *.DFM}




procedure TfrmRelProdAnalit.FormCreate(Sender: TObject);
begin
  inherited;
qryprod.open;
qryplanass.open;
qryforn.open;
//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;

procedure TfrmRelProdAnalit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// action := cafree;
end;

procedure TfrmRelProdAnalit.qryprodBeforeOpen(DataSet: TDataSet);
begin
  inherited;


   if frmParamProdAnalit.DBLkpCmbplanass.text <>  '' then
      qryprod.sql.add(' AND PRODASS.IDPRODASS ='+frmParamProdAnalit.qryplanass.fieldbyname('idplanass').AsString+'');


end;

end.
