unit FRelProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery;

type
  TfrmRelProd = class(TrelSimples)
    QRDBText2: TQRDBText;
    qryprod: TwwQuery;
    dsprod: TwwDataSource;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryprodBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProd: TfrmRelProd;

implementation

uses FParamProdAnalit, FCliente;

{$R *.DFM}





procedure TfrmRelProd.FormCreate(Sender: TObject);
begin
  inherited;
qryprod.open;
//GetRegNomeCliente(qrlblNomeCli,'Assistencial');
//GetRegLogo(QRImage1);
end;

procedure TfrmRelProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
// action := cafree;
end;


procedure TfrmRelProd.qryprodBeforeOpen(DataSet: TDataSet);
begin
  inherited;



   if frmParamProdAnalit.DBLkpCmbplanass.text <>  '' then
      qryprod.sql.add(' AND PRODASS.IDPRODASS ='+frmParamProdAnalit.qryplanass.fieldbyname('idplanass').AsString+'');


end;


end.
