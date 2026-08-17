unit RAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TrelAval = class(TfrmSelPessoal)
    qr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    qrCabecalho: TQRBand;
    QRLabel4: TQRLabel;
    qrMestre: TQRBand;
    qrsubdt: TQRSubDetail;
    QRDBText1: TQRDBText;
    tblHstaval: TwwTable;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    tblCargo2: TwwTable;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrlMax: TQRLabel;
    qrlPerc: TQRLabel;
    qrbCabDet: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotHst: TQRLabel;
    qrlMedAva: TQRLabel;
    qrlPercTot: TQRLabel;
    qrlTitulo: TQRLabel;
    QRLabel6: TQRLabel;
    qrlDataIni: TQRLabel;
    qrlDataFim: TQRLabel;
    qrla: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrMestreBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qrPreview(Sender: TObject);
    procedure qrAfterPreview(Sender: TObject);
    procedure qrNeedData(Sender: TObject; var MoreData: Boolean);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relAval: TrelAval;
  TotPes, TotHst, TotAva : Integer;
  PrimVezSelPes : Boolean;
  
implementation

uses fCMPreview, FSelRelAval, uSistema;

{$R *.DFM}

procedure TrelAval.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblNomeCli.Caption := trim(Sistema.NomeEmpresa);
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';
  tblHstaval.Open;
  tblCargo2.Open;
  qrlMax.Caption := frmSelRelAval.spedGrauMax.Text;
  qrlTitulo.Caption := qrlTitulo.Caption +
     frmSelRelAval.qryTipAval.FieldByName('DESCRTIPOAVAL').asString;
  qrlDataIni.Caption := frmSelRelAval.EdData1.Text;
  qrlDataFim.Caption := frmSelRelAval.EdData2.Text;
end;

procedure TrelAval.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TrelAval.qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := (tblHstaval.FieldByName('DATAREAL').asDateTime >=
                frmSelRelAval.EdData1.Date) and
               (tblHstaval.FieldByName('DATAREAL').asDateTime <=
                frmSelRelAval.EdData2.Date) and
               (tblHstaval.FieldByName('CODTIPOAVAL').asString =
                frmSelRelAval.qryTipAval.FieldByName('CODTIPOAVAL').asString);

  if (PrintBand) then
  begin
    TotHst := TotHst + 1;
    qrlPerc.Caption := '0,00';
    if not(tblHstaval.FieldByName('AVALIACAO').IsNull) then
    begin
      qrlPerc.Caption := FloatToStrF(tblHstaval.FieldByName('AVALIACAO').asInteger * 100 /
        frmSelRelAval.spedGrauMax.Value,ffFixed,6,2);
      TotAva := TotAva + tblHstaval.FieldByName('AVALIACAO').asInteger;
    end;
  end;
end;


procedure TrelAval.qrMestreBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := false;
  tblHstaval.First;

  while not (tblHstaval.EOF) do
  begin
    if (tblHstaval.FieldByName('DATAREAL').asDateTime >= frmSelRelAval.EdData1.Date) and
       (tblHstaval.FieldByName('DATAREAL').asDateTime <= frmSelRelAval.EdData2.Date) and
       (tblHstaval.FieldByName('CODTIPOAVAL').asString = frmSelRelAval.qryTipAval.FieldByName('CODTIPOAVAL').asString) then
    begin
      PrintBand := True;
      break;
    end;
    tblHstaval.Next;
  end;
  tblHstaval.First;
  qrbCabDet.Enabled := PrintBand;
  if (PrintBand) then
    TotPes := TotPes + 1;
end;

procedure TrelAval.qrbTotaisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := TotHst > 0;
  if not(PrintBand) then
    exit;
  qrlTotPes.Caption  := IntToStr(TotPes);
  qrlTotHst.Caption  := IntToStr(TotHst);
  qrlMedAva.Caption  := FloatToStrF(TotAva / TotHst,ffFixed,6,0);
  qrlPercTot.Caption := FloatToStrF((TotAva * 100 / TotHst) / frmSelRelAval.spedGrauMax.Value,ffFixed,6,2);
end;

procedure TrelAval.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  qr.Visible  := false;
  if (Imprime) then
    qr.Print
  else
    qr.Preview;
end;

procedure TrelAval.qrPreview(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCMPreview,frmCMPreview);
  frmCMPreview.Caption := 'Visualizar Impressão: ' + Caption;
  frmCMPreview.SetPrinter(qr.QRPrinter);
end;

procedure TrelAval.qrAfterPreview(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsNormal;
  frmSelRelAval.WindowState := wsNormal;
end;

procedure TrelAval.qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  PrimVezSelPes := True;
  TotPes := 0;
  TotAva := 0;
  TotHst := 0;
end;

procedure TrelAval.qrNeedData(Sender: TObject; var MoreData: Boolean);
begin
  inherited;
  if (PrimVezSelPes) then
  begin
    PrimVezSelPes := false;
    ds.DataSet.First;
  end
  else
    ds.DataSet.Next;
  MoreData := not(ds.DataSet.EOF);
end;

end.
