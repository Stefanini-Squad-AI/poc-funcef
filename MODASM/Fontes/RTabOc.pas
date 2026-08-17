unit RTabOc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti;

type
  TrelTabOc = class(TrelSimples)
    qryTabOcorr: TwwQuery;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure qryTabOcorrFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relTabOc: TrelTabOc;

implementation

uses FSelRelTabOc;

{$R *.DFM}





procedure TrelTabOc.FormCreate(Sender: TObject);
begin
  inherited;
  qryTabOcorr.Filtered := (frmSelRelTabOc.rgSelTudo.ItemIndex = 1);
  qryTabOcorr.Open;
end;

procedure TrelTabOc.qryTabOcorrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  IND : Integer;
begin
  inherited;
  Accept := False;
  for  IND := 0  to  (frmSelRelTabOc.lstOcorr.Items.Count - 1) do begin
       if frmSelRelTabOc.lstOcorr.Items[IND] = ''  then  exit;
       if frmSelRelTabOc.lstOcorr.Items[IND] =
          qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value  then begin
                  Accept := True;
                  exit;
       end;
  end;
end;

end.
