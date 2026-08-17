unit ROcorrTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  MAHlpBtn, StdCtrls, Buttons, Wwquery, wwdblook, IvDictio, IvMulti,
  IvEMulti;

type
  TrelOcorrTipo = class(TrelMestreDet)
    tblHstasm: TwwTable;
    tblOcorr: TwwTable;
    ds: TwwDataSource;
    tblPessoal: TwwTable;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    ds2: TwwDataSource;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    qrlTotHor: TQRLabel;
    qrbSubTot: TQRBand;
    qrlSubHor: TQRLabel;
    qrlMdCurs: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    tblHstasmIDPESSOA: TFloatField;
    tblHstasmCODTIPOOCMED: TFloatField;
    tblHstasmDATAREAL: TDateTimeField;
    tblHstasmCODCID: TFloatField;
    tblHstasmEXAMINADOR: TStringField;
    tblHstasmOBSERVACAO: TMemoField;
    tblHstasmDATAPLAN: TDateTimeField;
    tblHstasmAVALIACAO: TFloatField;
    tblHstasmLICENCA: TFloatField;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrlAval: TQRLabel;
    qrlResult: TQRLabel;
    QRLabel6: TQRLabel;
    qrlabDatIni: TQRLabel;
    QRLabel7: TQRLabel;
    qrlabDatFim: TQRLabel;
    tblHstasmNUMSEQ: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure tblOcorrFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qrbSubTotBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relOcorrTipo: TrelOcorrTipo;
  TotPes, TotCur, TotHor, CurHor, CurAvQ, CurAvT : Integer;
  TotCus, CurCus : Real;

implementation

uses FSelRelOcor2;

{$R *.DFM}






procedure TrelOcorrTipo.FormCreate(Sender: TObject);
begin
  inherited;
  tblOcorr.Open;
  tblHstasm.Open;
  tblPessoal.Open;
  qr.Visible := False;
  qrlabDatIni.Caption := frmSelRelOcor2.EdData1.Text;
  qrlabDatFim.Caption := frmSelRelOcor2.EdData2.Text;
  //ColumnHeaderBand1.Enabled := (frmSelRelOcorr.rgTipoRel.ItemIndex = 0);
  tblOcorr.Filtered := frmSelRelOcor2.rgSelTudo.ItemIndex = 1;
end;

procedure TrelOcorrTipo.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if  (tblHstasmDATAREAL.Value < frmSelRelOcor2.EdData1.Date) or
      (tblHstasmDATAREAL.Value > frmSelRelOcor2.EdData2.Date) then
       begin
          PrintBand := False;
          exit;
       end;

  TotPes := TotPes + 1;
  TotHor := TotHor + tblHstasmLICENCA.AsInteger;

  CurHor := CurHor + 1;

  qrlResult.Caption := '    N/A';
  qrlAval.Caption := 'N/A';

  if  (tblHstasm.FieldByName('AVALIACAO').Value <> Null)  then begin
       qrlAval.Caption := tblHstasmAVALIACAO.AsString;
       CurAvQ := CurAvQ + 1;
       CurAvT := CurAvT + tblHstasmAVALIACAO.AsInteger;
       if (tblOcorr.FieldByName('AVALMIN').Value >
           tblHstasm.FieldByName('AVALIACAO').Value)  then
           qrlResult.Caption := 'Inapt'
       else
           qrlResult.Caption := 'Apt';
       //if tblPessoal.FieldByName('SEXO').Value = 'M' then
           qrlResult.Caption := qrlResult.Caption + 'o';//  else
       //    qrlResult.Caption := qrlResult.Caption + 'a';
  end;
  PrintBand := (PrintBand) and (frmSelRelOcor2.rgTipoRel.ItemIndex = 0);
end;

procedure TrelOcorrTipo.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
  tblHstasm.First;
  while not  tblHstasm.Eof  do begin
       if  (tblHstasmDATAREAL.Value >= frmSelRelOcor2.EdData1.Date) and
           (tblHstasmDATAREAL.Value <= frmSelRelOcor2.EdData2.Date)
           then begin
             PrintBand := True;
             break;
           end;
       tblHstasm.Next;
  end;
  tblHstasm.First;
  qrbSubTot.Enabled := PrintBand;
  if  PrintBand  then  TotCur := TotCur + 1;
  CurHor := 0;
  CurAvQ := 0;
  CurAvT := 0;
end;




procedure TrelOcorrTipo.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
end;


procedure TrelOcorrTipo.tblOcorrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  I : Integer;
begin
  inherited;
     Accept := False;
     for  I := 0 to (frmSelRelOcor2.lstOcorr.Items.Count - 1) do begin
          if frmSelRelOcor2.lstOcorr.Items[I] = ''  then  break;
          if frmSelRelOcor2.lstCodOcorr.Items[I] =
             tblOcorr.FieldByName('CODTIPOOCMED').AsString  then begin
             Accept := True;
             break;
          end;
     end;
end;






procedure TrelOcorrTipo.qrbSubTotBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlSubHor.Caption := IntToStr(CurHor);
  qrlMdCurs.Caption := 'N/A';
  if  CurAvQ > 0 then
      qrlMdCurs.Caption := FloatToStrF(CurAvT/CurAvQ,ffFixed,10,0);
end;

procedure TrelOcorrTipo.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  TotPes := 0;
  TotCur := 0;
  TotHor := 0;
end;

end.
