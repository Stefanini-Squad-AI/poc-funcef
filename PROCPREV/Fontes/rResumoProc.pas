unit RResumoProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, IvDictio, IvMulti, IvEMulti, Db,
  DBTables, Wwquery;

type
  TrelResumoProc = class(TrelSimples)
    qrLabelMaxOrig: TQRLabel;
    qrLabelRiscoProvavel: TQRLabel;
    qrLabelMaxOrig2: TQRLabel;
    qrLabelSobreProvavel: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    qrlTot4: TQRLabel;
    qrlTot1: TQRLabel;
    qrlTot2: TQRLabel;
    qrlTot3: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel1: TQRLabel;
    qrlTQP: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrLabelEconomia: TQRLabel;
    qrLabelValorReal: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrlTot5: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relResumoProc: TrelResumoProc;
  TotQt: integer;
  TotCt1, TotCt2, TotCt3, TotCt4, TotCt5: real;

implementation

uses FSelRelProc;

{$R *.DFM}

procedure TrelResumoProc.FormCreate(Sender: TObject);
begin
  inherited;
  qr.DataSet := frmSelRelProc.qryResumo;
  qrLabelMaxOrig.Caption := 'Risco Máximo';

  //if (frmSelRelProc.rgRisco.ItemIndex = 1) then
  //  qrLabelMaxOrig.Caption := 'Risco Original';

  qrLabelMaxOrig2.Caption := 'Sobre Máximo';
  //if (frmSelRelProc.rgRisco.ItemIndex = 1) then
  //  qrLabelMaxOrig2.Caption := 'Sobre Original';

  qrlblTitRel.Caption := qr.ReportTitle;

  qr.Visible := false;
  if not(Imprime) then
    qr.Preview
  else
    qr.Print;
end;

procedure TrelResumoProc.qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  TotQt  := 0;
  TotCt1 := 0;
  TotCt2 := 0;
  TotCt3 := 0;
  TotCt4 := 0;
  TotCt5 := 0;
  qrLabelMaxOrig.Enabled        := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrLabelMaxOrig2.Enabled       := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrLabelRiscoProvavel.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrLabelValorReal.Enabled      := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrLabelEconomia.Enabled       := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrLabelSobreProvavel.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  
end;

procedure TrelResumoProc.qrAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TrelResumoProc.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  TotQt  := TotQt  + frmSelRelProc.qryResumo.FieldByName('QTDPROC').AsInteger;
  TotCt1 := TotCt1 + frmSelRelProc.qryResumo.FieldByName('VALRECLAMADO').AsFloat;
  TotCt2 := TotCt2 + frmSelRelProc.qryResumo.FieldByName('VALESTIMADO').AsFloat;
  TotCt3 := TotCt3 + frmSelRelProc.qryResumo.FieldByName('VALREAL').AsFloat;
  TotCt4 := TotCt4 + frmSelRelProc.qryResumo.FieldByName('ECONRECLAMADO').AsFloat;
  TotCt5 := TotCt5 + frmSelRelProc.qryResumo.FieldByName('ECONESTIMADO').AsFloat;
  PrintBand := frmSelRelProc.qryResumo.FieldByName('QTDPROC').AsInteger > 0;
end;

procedure TrelResumoProc.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTQP.Caption  := IntToStr(TotQt);
  qrlTot1.Caption := FormatFloat('##,###,###,###',TotCt1);
  qrlTot2.Caption := FormatFloat('##,###,###,###',TotCt2);
  qrlTot3.Caption := FormatFloat('##,###,###,###',TotCt3);
  qrlTot4.Caption := FormatFloat('##,###,###,###',TotCt4);
  qrlTot5.Caption := FormatFloat('##,###,###,###',TotCt5);

  TotQt  := 0;
  TotCt1 := 0;
  TotCt2 := 0;
  TotCt3 := 0;
  TotCt4 := 0;
  TotCt5 := 0;
end;

end.
