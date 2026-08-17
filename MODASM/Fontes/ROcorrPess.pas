unit ROcorrPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TrelOcorrPess = class(TfrmSelPessoal)
    ds2: TwwDataSource;
    tblHstasm: TwwTable;
    tblOcorr: TwwTable;
    tblCargo2: TwwTable;
    qr: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrCabecalho: TQRBand;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    qrsubdt: TQRSubDetail;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrbCabDet: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlResult: TQRLabel;
    qrlAval: TQRLabel;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    tblHstasmIDPESSOA: TFloatField;
    tblHstasmCODTIPOOCMED: TFloatField;
    tblHstasmDATAREAL: TDateTimeField;
    tblHstasmCODCID: TFloatField;
    tblHstasmEXAMINADOR: TStringField;
    tblHstasmOBSERVACAO: TMemoField;
    tblHstasmDATAPLAN: TDateTimeField;
    tblHstasmAVALIACAO: TFloatField;
    tblHstasmLICENCA: TFloatField;
    QRLabel17: TQRLabel;
    qrlTotHor: TQRLabel;
    QRLabel3: TQRLabel;
    qrlabDatIni: TQRLabel;
    QRLabel5: TQRLabel;
    qrlabDatFim: TQRLabel;
    tblHstasmNUMSEQ: TFloatField;
    qrlblNomeCli: TQRLabel;
    QRSysData3: TQRSysData;
    QRDBText5: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPreview(Sender: TObject);
    procedure qrAfterPreview(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qrNeedData(Sender: TObject; var MoreData: Boolean);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relOcorrPess: TrelOcorrPess;
  TotPes, TotCur, TotHor : Integer;
  TotCus : Real;
  PrimVezSelPes : Boolean;
  
implementation

uses FCMPreview, FSelRelOcorr, uSistema;

{$R *.DFM}


procedure TrelOcorrPess.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblNomeCli.Caption := trim(Sistema.NomeEmpresa);
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';
  tblCargo2.Open;
  tblHstasm.Open;
  tblOcorr.Open;
  qrlabDatIni.Caption := frmSelRelOcorr.EdData1.Text;
  qrlabDatFim.Caption := frmSelRelOcorr.EdData2.Text;
  qrCabecalho.Enabled := (frmSelRelOcorr.rgTipoRel.ItemIndex = 0);
end;

procedure TrelOcorrPess.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TrelOcorrPess.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if  (tblHstasmDATAREAL.Value < frmSelRelOcorr.EdData1.Date) or
      (tblHstasmDATAREAL.Value > frmSelRelOcorr.EdData2.Date) then
       begin
          PrintBand := False;
          exit;
       end;

  TotCur := TotCur + 1;
  TotHor := TotHor + tblHstasmLICENCA.AsInteger;

  qrlResult.Caption := '    N/A';
  qrlAval.Caption := 'N/A';

  if  (tblHstasm.FieldByName('AVALIACAO').Value <> Null)  then begin
       qrlAval.Caption := tblHstasmAVALIACAO.AsString;

       if (tblOcorr.FieldByName('AVALMIN').Value >
           tblHstasm.FieldByName('AVALIACAO').Value)  then
           qrlResult.Caption := 'Inapt'
       else
           qrlResult.Caption := 'Apt';
       if tblPessoal.FieldByName('SEXO').Value = 'M' then
           qrlResult.Caption := qrlResult.Caption + 'o'  else
           qrlResult.Caption := qrlResult.Caption + 'a';
  end;
  PrintBand := (PrintBand) and (frmSelRelOcorr.rgTipoRel.ItemIndex = 0);
end;

procedure TrelOcorrPess.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
end;

procedure TrelOcorrPess.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
  tblHstasm.First;
  while not  tblHstasm.Eof  do begin
       if  (tblHstasmDATAREAL.Value >= frmSelRelOcorr.EdData1.Date) and
           (tblHstasmDATAREAL.Value <= frmSelRelOcorr.EdData2.Date)
           then begin
             PrintBand := True;
             break;
           end;
       tblHstasm.Next;
  end;
  tblHstasm.First;
  if  PrintBand  then  TotPes := TotPes + 1;
  PrintBand := (PrintBand) and (frmSelRelOcorr.rgTipoRel.ItemIndex = 0);
  qrbCabDet.Enabled := PrintBand;
end;
       
procedure TrelOcorrPess.qrPreview(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCMPreview,frmCMPreview);
  frmCMPreview.Caption := 'Visualizar Impressão: ' + Caption;
  frmCMPreview.SetPrinter(qr.QRPrinter);
end;

procedure TrelOcorrPess.qrAfterPreview(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsNormal;
  frmSelRelOcorr.WindowState := wsNormal;
end;

procedure TrelOcorrPess.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  qr.Visible := False;
  if  Imprime  then  qr.Print  else  qr.Preview;
end;

procedure TrelOcorrPess.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  PrimVezSelPes := True;
  TotPes := 0;
  TotCur := 0;
  TotHor := 0;
  TotCus := 0;
end;

procedure TrelOcorrPess.qrNeedData(Sender: TObject; var MoreData: Boolean);
begin
  inherited;
  if  PrimVezSelPes  then begin
      PrimVezSelPes := False;
      ds.DataSet.First;
  end
  else ds.DataSet.Next;
  MoreData := not ds.DataSet.Eof;
end;

end.
