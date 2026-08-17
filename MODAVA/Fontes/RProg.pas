unit RProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TrelProg = class(TfrmSelPessoal)
    qr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    qrlTitulo: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrCabecalho: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    qrMestre: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    qrlTotPes: TQRLabel;
    QRLabel7: TQRLabel;
    qrlDataProg: TQRLabel;
    tblCargo2: TwwTable;
    tblHstaval: TwwTable;
    tblGrupo: TwwTable;
    dsCar: TwwDataSource;
    tblHstcon2: TwwTable;
    dsAval: TwwDataSource;
    tblTipAval: TwwTable;
    procedure qrMestreBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure tblHstavalFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qrPreview(Sender: TObject);
    procedure qrAfterPreview(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relProg: TrelProg;
  TotPes : Integer;
  DataRef, DatBase : TDate;
  TemProg : Boolean;

implementation

uses FCMPreview, FSelRelProg, uSistema;

{$R *.DFM}

procedure TrelProg.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblNomeCli.Caption := trim(Sistema.NomeEmpresa);
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';
  tblTipAval.Open;
  tblHstaval.Open;
  tblHstcon2.Open;
  tblCargo2.Open;
  tblGrupo.Open;

  if (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) then
      qrlPeriodo.Caption := qrlPeriodo.Caption + 'Não Especificado'
  else
    qrlPeriodo.Caption := qrlPeriodo.Caption +
                          frmSelRelProg.EdData1.Text + ' a ' +
                          frmSelRelProg.EdData2.Text;
end;

procedure TrelProg.qrMestreBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ProxSeq : Integer;
begin
  inherited;
  PrintBand := (not tblGrupo.Eof) and
               (tblGrupo.FieldByName('CODGRPFUNC').Value =
                tblCargo2.FieldByName('CODGRPFUNC').Value) and
               (tblGrupo.FieldByName('INTERVALO').Value <> Null);
  if  not  PrintBand  then  exit;
  DataRef := tblPessoal.FieldByName('DATACARGO').Value;
  TemProg := False;
  if  (not tblHstaval.Eof)  then  begin
      tblHstaval.Last;
      if  tblHstaval.FieldByName('DATAREAL').Value <> Null  then
          DataRef := tblHstaval.FieldByName('DATAREAL').Value;
      tblHstaval.First;
      while  (not  tblHstaval.Eof) and
             (tblHstaval.FieldByName('DATAREAL').Value = Null) do begin
         if  (tblHstaval.FieldByName('DATAPLAN').Value > DataRef) then begin
             TemProg := True;
             DataRef := tblHstaval.FieldByName('DATAPLAN').Value;
         end;
         tblHstaval.Next;
      end;
  end;
  if  (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) then DatBase := Date
  else  DatBase := frmSelRelProg.EdData1.Date;

  if  not  TemProg  then
      DataRef := int(DataRef +
               (int ( (DatBase - DataRef) * 12 / 365.25
                     / tblGrupo.FieldByName('INTERVALO').Value) + 1) *
               365.25 / 12 * tblGrupo.FieldByName('INTERVALO').Value);

  PrintBand := (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) or
               ((DataRef >= frmSelRelProg.EdData1.Date) and
                (DataRef <= frmSelRelProg.EdData2.Date));
  if  PrintBand  then  begin
      TotPes := TotPes + 1;
      qrlDataProg.Caption := DateToStr(DataRef);
      if  (frmSelRelProg.rgPrograma.ItemIndex = 0) and
                                   (not  TemProg)  then  begin
           tblHstaval.Insert;
           tblHstaval.FieldByName('IDPESSOA').Value :=
                 tblPessoal.FieldByName('IDPESSOA').Value;
           tblHstaval.FieldByName('CODTIPOAVAL').Value := 0;
           tblHstaval.FieldByName('DATAPLAN').Value  := DataRef;
           tblHstcon2.Refresh;
           tblHstcon2.Last;
           if  tblHstcon2.FieldByName('NUMSEQ').Value = Null then
               ProxSeq := 1
           else  ProxSeq := tblHstcon2.FieldByName('NUMSEQ').Value + 1;
           tblHstaval.FieldByName('NUMSEQ').Value := ProxSeq;
           tblHstaval.Post;
      end;
  end;
end;

procedure TrelProg.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := TotPes > 0;
  if  not  PrintBand  then  exit;
  qrlTotPes.Caption := IntToStr(TotPes);
end;

procedure TrelProg.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TrelProg.tblHstavalFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := tblTipAval.FindKey([tblHstaval.FieldByName('CODTIPOAVAL').Value]);
end;

procedure TrelProg.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  qr.Visible := False;
  if  Imprime  then  qr.Print  else  qr.Preview;
end;

procedure TrelProg.qrPreview(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCMPreview,frmCMPreview);
  frmCMPreview.Caption := 'Visualizar Impressão: ' + Caption;
  frmCMPreview.SetPrinter(qr.QRPrinter);
end;

procedure TrelProg.qrAfterPreview(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsNormal;
  frmSelRelProg.WindowState := wsNormal;
end;

procedure TrelProg.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  TotPes := 0;
end;

end.
