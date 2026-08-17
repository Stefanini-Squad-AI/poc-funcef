unit RProgPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TrelProgPess = class(TfrmSelPessoal)
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrbCabDet: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    tblHstasmIDPESSOA: TFloatField;
    tblHstasmCODTIPOOCMED: TFloatField;
    tblHstasmDATAREAL: TDateTimeField;
    tblHstasmDATAPLAN: TDateTimeField;
    QRLabel3: TQRLabel;
    qrlabDatIni: TQRLabel;
    QRLabel5: TQRLabel;
    qrlabDatFim: TQRLabel;
    tblPeriodo: TwwTable;
    qrlDatPlan: TQRLabel;
    qrlObserv: TQRLabel;
    tblHstasmNUMSEQ: TFloatField;
    dsHst: TwwDataSource;
    qrlblNomeCli: TQRLabel;
    QRSysData3: TQRSysData;
    QRDBText5: TQRDBText;
    qryUltSeq: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
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
  relProgPess: TrelProgPess;
  TotPes, TotCur : Integer;
  DatBase, DatRef : TDateTime;
  ACHEI : Boolean;
  JATEM : Boolean;
  PrimVezSelPes : Boolean;
  
implementation

uses FCMPreview, FSelRelProg, uSistema;

{$R *.DFM}         

procedure TrelProgPess.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblNomeCli.Caption := trim(Sistema.NomeEmpresa);
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';
  tblCargo2.Open;
  tblPeriodo.Open;
  tblHstasm.Open;
  tblOcorr.Open;
  qrlabDatIni.Caption := frmSelRelProg.EdData1.Text;
  qrlabDatFim.Caption := frmSelRelProg.EdData2.Text;
  if (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) then
  begin
      qrlabDatIni.Caption := 'Não Especificado';
      qrlabDatFim.Caption := '';
  end;

end;

procedure TrelProgPess.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TrelProgPess.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   IND : Real;
   INX : Integer;
   ProxSeq : Integer;
begin
  inherited;
  PrintBand := False;
  if  ((tblPeriodo.FieldByName('IDCARGO').Value <> Null) and
       (tblPeriodo.FieldByName('IDCARGO').Value <>
        tblPessoal.FieldByName('IDCARGO').Value)) or
       (tblPeriodo.FieldByName('PERIODO').Value = 0) then exit;

  if  (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) then
        DatRef := Date
  else  DatRef := frmSelRelProg.EdData1.Date;

  DatBase := tblPessoal.FieldByName('DATANASC').Value;
  if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  then
         DatBase := tblPessoal.FieldByName('DATAADMISSAO').Value;
  if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  and
      (tblPeriodo.FieldByName('IDCARGO').Value <> Null)  then
         DatBase := tblPessoal.FieldByName('DATACARGO').Value;
  if  (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> '**********')  and
      (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> Null) then
       begin
           for  INX := 1  to  10  do
                if  (copy(tblPessoal.FieldByName('CODCENTROCUSTO').Value, INX, 1) <>
                     copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1))
                and (copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1) <> '*')
                then exit;

           if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2) and
                (tblPessoal.FieldByName('DATALOTACAO').Value > DatBase)  then
                DatBase := tblPessoal.FieldByName('DATALOTACAO').Value;
       end;

  if   (((DatRef - DatBase) /
        365.25 < tblPeriodo.FieldByName('LIMINFERIOR').Value)  or
       ((DatRef - DatBase) /
        365.25 > tblPeriodo.FieldByName('LIMSUPERIOR').Value)) then exit;

  JATEM := False;
  tblHstasm.First;
  while not  tblHstasm.Eof  do begin
       if  (tblPeriodo.FieldByName('CODTIPOOCMED').Value =
            tblHstasm.FieldByName('CODTIPOOCMED').Value) and
           (tblHstasmDATAREAL.Value > 0)  then
           begin
              if  DatBase < tblHstasmDATAREAL.Value  then
                  DatBase := tblHstasmDATAREAL.Value;
           end;
       if  (tblPeriodo.FieldByName('CODTIPOOCMED').Value =
            tblHstasmCODTIPOOCMED.Value) and
           ((frmSelRelProg.rgSelPeriodo.ItemIndex = 1) or
            ((tblHstasmDATAPLAN.Value >=
             frmSelRelProg.EdData1.Date)  and
             (tblHstasmDATAPLAN.Value <=
              frmSelRelProg.EdData2.Date))) and
           (tblHstasmDATAREAL.Value = 0)  then
           begin
               DatBase := tblHstasmDATAPLAN.Value;
               JATEM := True;
               PrintBand := True;
               break;
           end;
       tblHstasm.Next;
  end;
  tblHstasm.First;

  if DatBase < tblPessoal.FieldByName('DATAADMISSAO').Value then
     DatBase := tblPessoal.FieldByName('DATAADMISSAO').Value;

  if (frmSelRelProg.rgSelPeriodo.ItemIndex = 0) then
      IND := int((DatRef - DatBase) /
                 (tblPeriodo.FieldByName('PERIODO').Value * 30.4375))
  else
      IND := 1;
      
  while   ((frmSelRelProg.rgSelPeriodo.ItemIndex = 1) or
           (DatBase + IND * round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375)
             <=  frmSelRelProg.EdData2.Date)) and (not JATEM)  do
  begin
      if  (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) or
          (DatBase + IND * round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375)
           >= DatRef)  then
      begin
           DatBase := DatBase + IND *
              round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375);
           if DayOfWeek(DatBase) = 7 then DatBase := DatBase + 2;
           if DayOfWeek(DatBase) = 1 then DatBase := DatBase + 1;
           PrintBand := True;
           if frmSelRelProg.rgPrograma.ItemIndex = 0 then begin
                tblHstasm.Insert;
                tblHstasmIDPESSOA.Value :=
                   tblPessoal.FieldByName('IDPESSOA').Value;
                tblHstasmCODTIPOOCMED.Value :=
                   tblPeriodo.FieldByName('CODTIPOOCMED').Value;
                tblHstasmDATAPLAN.Value  := DatBase;
                qryUltSeq.Close;
                qryUltSeq.ParamByName('IDPESSOA').asInteger :=
                          tblPessoal.FieldByName('IDPESSOA').asInteger;
                qryUltSeq.ParamByName('CODTIPOOCMED').asInteger :=
                          tblPeriodo.FieldByName('CODTIPOOCMED').asInteger;
                qryUltSeq.Open;
                ProxSeq := qryUltSeq.FieldByName('ULTSEQ').asInteger + 1;
                tblHstasmNUMSEQ.Value  := ProxSeq;
                tblHstasm.Post;
           end;
           break;
      end;
      IND := IND + 1;
  end;

  if  PrintBand  then
  begin
      TotCur := TotCur + 1;
      qrlDatPlan.Caption := DateToStr(DatBase);
      qrlObserv.Caption := 'A Programar';
      if  JATEM  then  qrlObserv.Caption := 'Já Programado'
      else if frmSelRelProg.rgPrograma.ItemIndex = 0 then
              qrlObserv.Caption := 'Programado Agora';
  end;

end;

procedure TrelProgPess.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTotCur.Caption := IntToStr(TotCur);

end;

procedure TrelProgPess.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   IND : Real;
   INX : Integer;
begin
  inherited;
  PrintBand := False;

  if  (frmSelRelProg.rgSelPeriodo.ItemIndex = 1) then
        DatRef := Date
  else  DatRef := frmSelRelProg.EdData1.Date;

  tblPeriodo.First;
  if  tblPeriodo.Eof  then  exit;
  while not  tblPeriodo.Eof  do
   begin
     if  ((tblPeriodo.FieldByName('IDCARGO').Value <> Null) and
          (tblPeriodo.FieldByName('IDCARGO').Value <>
           tblPessoal.FieldByName('IDCARGO').Value)) or
          (tblPeriodo.FieldByName('PERIODO').Value = 0) then
       begin
         tblPeriodo.Next;
         Continue;
       end;
     DatBase := tblPessoal.FieldByName('DATANASC').Value;
     if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  then
         DatBase := tblPessoal.FieldByName('DATAADMISSAO').Value;
     if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  and
         (tblPeriodo.FieldByName('IDCARGO').Value <> Null)  then
         DatBase := tblPessoal.FieldByName('DATACARGO').Value;
     if  (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> '**********')  and
         (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> Null) then
         begin
           ACHEI := True;
           for  INX := 1  to  10  do
                if  (copy(tblPessoal.FieldByName('CODCENTROCUSTO').Value, INX, 1) <>
                     copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1))
                and (copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1) <> '*')  then
                   begin
                     ACHEI := False;
                     break;
                   end;
                if not ACHEI then
                   begin
                      tblPeriodo.Next;
                      Continue;
                   end;
           if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2) and
                (tblPessoal.FieldByName('DATALOTACAO').Value > DatBase)  then
                DatBase := tblPessoal.FieldByName('DATALOTACAO').Value;
         end;

     if   (((DatRef - DatBase) /
            365.25 < tblPeriodo.FieldByName('LIMINFERIOR').Value)  or
          ((DatRef - DatBase) /
            365.25 > tblPeriodo.FieldByName('LIMSUPERIOR').Value)) then
     begin
         tblPeriodo.Next;
         Continue;
     end;
     tblHstasm.First;
     while not  tblHstasm.Eof  do
      begin
       if  (tblPeriodo.FieldByName('CODTIPOOCMED').Value =
            tblHstasm.FieldByName('CODTIPOOCMED').Value) and
           (tblHstasmDATAREAL.Value > 0)  then
           begin
              if  DatBase < tblHstasmDATAREAL.Value  then
                  DatBase := tblHstasmDATAREAL.Value;
           end;
       if  (tblPeriodo.FieldByName('CODTIPOOCMED').Value =
            tblHstasmCODTIPOOCMED.Value) and
           ((frmSelRelProg.rgSelPeriodo.ItemIndex = 1) or
            ((tblHstasmDATAPLAN.Value >=
              frmSelRelProg.EdData1.Date)  and
             (tblHstasmDATAPLAN.Value <=
              frmSelRelProg.EdData2.Date))) and
           (tblHstasmDATAREAL.Value = 0)  then
           begin
               PrintBand := True;
               tblPeriodo.First;
               break;
           end;
       tblHstasm.Next;
      end;
     tblHstasm.First;

     if DatBase < tblPessoal.FieldByName('DATAADMISSAO').Value then
        DatBase := tblPessoal.FieldByName('DATAADMISSAO').Value;

     if (frmSelRelProg.rgSelPeriodo.ItemIndex = 0) then
     begin
         IND := int((frmSelRelProg.EdData1.Date - DatBase) /
                 (tblPeriodo.FieldByName('PERIODO').Value * 30.4375));
         while  (DatBase + IND * round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375)  <=
             frmSelRelProg.EdData2.Date) and (not PrintBand) do begin
                if  DatBase + IND * round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375)
                    >= frmSelRelProg.EdData1.Date  then
                    begin
                       DatBase := DatBase + IND *
                         round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375);
                       PrintBand := True;
                       tblPeriodo.First;
                       break;
                    end;
                IND := IND + 1;
         end;
     end
     else
     begin
         DatBase := DatBase + round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375);
         PrintBand := True;
     end;
     if PrintBand  then  break;
     tblPeriodo.Next;
   end;
  tblPeriodo.First;
  qrbCabDet.Enabled := PrintBand;
  if PrintBand  then  TotPes := TotPes + 1;
end;







procedure TrelProgPess.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  qr.Visible := False;
  if  Imprime  then  qr.Print  else  qr.Preview;
end;

procedure TrelProgPess.qrPreview(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCMPreview,frmCMPreview);
  frmCMPreview.Caption := 'Visualizar Impressão: ' + Caption;
  frmCMPreview.SetPrinter(qr.QRPrinter);
end;

procedure TrelProgPess.qrAfterPreview(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsNormal;
  frmSelRelProg.WindowState := wsNormal;
end;

procedure TrelProgPess.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  PrimVezSelPes := True;
  TotPes := 0;
  TotCur := 0;
end;

procedure TrelProgPess.qrNeedData(Sender: TObject; var MoreData: Boolean);
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
