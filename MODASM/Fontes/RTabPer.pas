unit RTabPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TrelTabPer = class(TrelSimples)
    qryTabOcorr: TwwQuery;
    tblCargo: TwwTable;
    ds: TwwDataSource;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlBaseado: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryTabOcorrFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relTabPer: TrelTabPer;
  BaseadoEm : array[1..2] of String;

implementation

uses FSelRelTabPer;

{$R *.DFM}

procedure TrelTabPer.FormCreate(Sender: TObject);
begin
  inherited;
  qryTabOcorr.Filtered := (frmSelRelTabPer.rgSelTudo.ItemIndex = 1);
  qryTabOcorr.Open;
  tblCargo.Open;
  BaseadoEm[1] := '  Idade  ';
  BaseadoEm[2] := 'Exposição';
end;

procedure TrelTabPer.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlBaseado.Caption := BaseadoEm[qryTabOcorr.FieldByName('INDTEMPO').AsInteger];
end;

procedure TrelTabPer.qryTabOcorrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  IND : Integer;
begin
  inherited;
  Accept := False;
  for  IND := 0  to  (frmSelRelTabPer.lstOcorr.Items.Count - 1) do begin
       if frmSelRelTabPer.lstOcorr.Items[IND] = ''  then  exit;
       if frmSelRelTabPer.lstOcorr.Items[IND] =
          qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value  then begin
                  Accept := True;
                  exit;
       end;
  end;
end;

end.
