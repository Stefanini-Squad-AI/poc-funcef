unit RProgTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, DBTables, Wwquery, Db, Wwdatsrc,
  Wwtable, MAHlpBtn, StdCtrls, Buttons, wwdblook, IvDictio, IvMulti,
  IvEMulti;

type
  TrelProgTipo = class(TrelMestreDet)
    QRLabel3: TQRLabel;
    qrlabDatIni: TQRLabel;
    QRLabel5: TQRLabel;
    qrlabDatFim: TQRLabel;
    tblFuncio: TwwTable;
    tblHstasm: TwwTable;
    tblHstasmIDPESSOA: TFloatField;
    tblHstasmCODTIPOOCMED: TFloatField;
    tblHstasmDATAREAL: TDateTimeField;
    tblHstasmDATAPLAN: TDateTimeField;
    tblPeriodo: TwwTable;
    tblCargo: TwwTable;
    dsX: TwwDataSource;
    ds2: TwwDataSource;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    qryTabPer: TwwQuery;
    tblSituacao: TwwTable;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    qrbPessoas: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrlDatPlan: TQRLabel;
    qrlObserv: TQRLabel;
    qrbSubTot: TQRBand;
    QRLabel6: TQRLabel;
    qrlNumPes: TQRLabel;
    tblHstasmNUMSEQ: TFloatField;
    dsHst: TwwDataSource;
    tblPesFis: TwwTable;
    tblPessoa: TwwTable;
    qryUltSeq: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure tblFuncioFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qryTabPerFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPessoasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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
  relProgTipo: TrelProgTipo;
  TotPes, TotCur, NumPes : Integer;
  DatBase, DatRef : TDateTime;
  ACHEI : Boolean;
  JATEM : Boolean;

implementation

uses FSelRelProg2;

{$R *.DFM}



procedure TrelProgTipo.FormCreate(Sender: TObject);
begin
  inherited;
  qr.Visible := False;
  tblFuncio.Open;
  tblCargo.Open;
  qryTabPer.Open;
  tblPeriodo.Open;
  tblHstasm.Open;
  tblSituacao.Open;
  tblPesFis.Open;
  tblPessoa.Open;
  qrlabDatIni.Caption := frmSelRelProg2.EdData1.Text;
  qrlabDatFim.Caption := frmSelRelProg2.EdData2.Text;

  if (frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) then
  begin
      qrlabDatIni.Caption := 'Não Especificado';
      qrlabDatFim.Caption := '';
  end;

  tblFuncio.Filtered := True;
  //ModalResult := mrNone;
  qryTabPer.Filtered := (frmSelRelProg2.rgSelTudo.ItemIndex = 1);
  qrlblTitRel.Caption := qr.ReportTitle;
end;

procedure TrelProgTipo.tblFuncioFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  tblSituacao.FindKey([tblFuncio.FieldByName('IDSITFUNC').Value]);
  Accept := tblSituacao.FieldByName('TIPOSIT').Value <> 'D';
end;

procedure TrelProgTipo.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   IND : Real;
   INX : Integer;
begin
  inherited;
  PrintBand := False;
  tblPeriodo.First;
  if  tblPeriodo.Eof  then  exit;
  while not  tblPeriodo.Eof  do  begin
    tblFuncio.First;
    if  tblFuncio.Eof  then  exit;
    while not  tblFuncio.Eof  do  begin
     {if  (tblSituacao.FieldByName('TIPOSIT').Value = 'D') then  begin
         tblFuncio.Next;
         Continue;
     end;}
     if  ((tblPeriodo.FieldByName('IDCARGO').Value <> Null) and
        (tblPeriodo.FieldByName('IDCARGO').Value <>
         tblFuncio.FieldByName('IDCARGO').Value)) or
        (tblPeriodo.FieldByName('PERIODO').Value = 0) then begin
         tblFuncio.Next;
         Continue;
     end;

     if  (frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) then
           DatRef := Date
     else  DatRef := frmSelRelProg2.EdData1.Date;

     DatBase := tblPesFis.FieldByName('DATANASC').Value;
     if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  then
         DatBase := tblFuncio.FieldByName('DATAADMISSAO').Value;
     if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  and
         (tblPeriodo.FieldByName('IDCARGO').Value <> Null)  then
         DatBase := tblFuncio.FieldByName('DATACARGO').Value;
     if  (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> '**********')  and
         (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> Null) then
     begin
           ACHEI := True;
           for  INX := 1  to  10  do
                if  (copy(tblFuncio.FieldByName('CODCENTROCUSTO').Value, INX, 1) <>
                     copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1))
                and (copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1) <> '*')  then
                   begin
                     ACHEI := False;
                     break;
                   end;
                if not ACHEI then
                   begin
                      tblFuncio.Next;
                      Continue;
                   end;
           if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2) and
                (tblFuncio.FieldByName('DATALOTACAO').Value > DatBase)  then
                DatBase := tblFuncio.FieldByName('DATALOTACAO').Value;
     end;

     if   (((DatRef - DatBase) /
              365.25 < tblPeriodo.FieldByName('LIMINFERIOR').Value)  or
             ((DatRef - DatBase) /
              365.25 > tblPeriodo.FieldByName('LIMSUPERIOR').Value)) then
     begin
         tblFuncio.Next;
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
           ((frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) or
            ((tblHstasmDATAPLAN.Value >=
              frmSelRelProg2.EdData1.Date)   and
             (tblHstasmDATAPLAN.Value <=
              frmSelRelProg2.EdData2.Date))) and
           (tblHstasmDATAREAL.Value = 0)  then
           begin
               PrintBand := True;
               tblFuncio.First;
               break;
           end;
       tblHstasm.Next;
      end;
     tblHstasm.First;

     if DatBase < tblFuncio.FieldByName('DATAADMISSAO').Value then
        DatBase := tblFuncio.FieldByName('DATAADMISSAO').Value;

     if (frmSelRelProg2.rgSelPeriodo.ItemIndex = 0) then
     begin
         IND := int((frmSelRelProg2.EdData1.Date - DatBase) /
                 (tblPeriodo.FieldByName('PERIODO').Value * 30.4375));
         while  (DatBase + IND * tblPeriodo.FieldByName('PERIODO').Value * 30.4375  <=
             frmSelRelProg2.EdData2.Date) and (not PrintBand) do begin
                if  DatBase + IND * tblPeriodo.FieldByName('PERIODO').Value *
                    30.4375  >= frmSelRelProg2.EdData1.Date  then
                    begin
                       DatBase := DatBase + IND *
                         tblPeriodo.FieldByName('PERIODO').Value * 30.4375;
                       PrintBand := True;
                       tblFuncio.First;
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
     tblFuncio.Next;
    end;
    tblFuncio.First;
    if PrintBand  then  break;
    tblPeriodo.Next;
  end;
  tblPeriodo.First;
  if PrintBand  then  TotCur := TotCur + 1;
  NumPes := 0;
  qrbSubTot.Enabled := PrintBand;
end;


procedure TrelProgTipo.qryTabPerFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  IND : Integer;
begin
  inherited;
  Accept := False;
  for  IND := 0  to  (frmSelRelProg2.lstOcorr.Items.Count - 1) do begin
       if frmSelRelProg2.lstOcorr.Items[IND] = ''  then  exit;
       if frmSelRelProg2.lstCodOcorr.Items[IND] =
          qryTabPer.FieldByName('CODTIPOOCMED').AsString  then begin
                  Accept := True;
                  exit;
       end;
  end;
end;


procedure TrelProgTipo.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TrelProgTipo.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  inherited;
  PrintBand := False;
end;

procedure TrelProgTipo.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTotCur.Caption := IntToStr(TotCur);
  PrintBand := (TotCur > 1);
end;


procedure TrelProgTipo.qrbPessoasBeforePrint(Sender: TQRCustomBand;
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
        tblFuncio.FieldByName('IDCARGO').Value)) or
       (tblPeriodo.FieldByName('PERIODO').Value = 0) then exit;

  if  (frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) then
        DatRef := Date
  else  DatRef := frmSelRelProg2.EdData1.Date;

  DatBase := tblPesFis.FieldByName('DATANASC').Value;
  if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  then
         DatBase := tblFuncio.FieldByName('DATAADMISSAO').Value;
  if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2)  and
      (tblPeriodo.FieldByName('IDCARGO').Value <> Null)  then
         DatBase := tblFuncio.FieldByName('DATACARGO').Value;
  if  (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> '**********')  and
      (tblPeriodo.FieldByName('CODCENTROCUSTO').Value <> Null) then
       begin
           for  INX := 1  to  10  do
                if  (copy(tblFuncio.FieldByName('CODCENTROCUSTO').Value, INX, 1) <>
                     copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1))
                and (copy(tblPeriodo.FieldByName('CODCENTROCUSTO').Value, INX, 1) <> '*')
                then exit;

           if  (tblPeriodo.FieldByName('INDTEMPO').Value = 2) and
                (tblFuncio.FieldByName('DATALOTACAO').Value > DatBase)  then
                DatBase := tblFuncio.FieldByName('DATALOTACAO').Value;
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
           ((frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) or
            ((tblHstasmDATAPLAN.Value >=
             frmSelRelProg2.EdData1.Date)  and
             (tblHstasmDATAPLAN.Value <=
              frmSelRelProg2.EdData2.Date))) and
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

  if DatBase < tblFuncio.FieldByName('DATAADMISSAO').Value then
     DatBase := tblFuncio.FieldByName('DATAADMISSAO').Value;

  if (frmSelRelProg2.rgSelPeriodo.ItemIndex = 0) then
      IND := int((DatRef - DatBase) /
                 (tblPeriodo.FieldByName('PERIODO').Value * 30.4375))
  else
      IND := 1;

  while   ((frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) or
           (DatBase + IND * round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375)
             <=  frmSelRelProg2.EdData2.Date)) and (not JATEM)  do
  begin
      if  (frmSelRelProg2.rgSelPeriodo.ItemIndex = 1) or
          (DatBase + IND * round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375)
           >= DatRef)  then
      begin
           DatBase := DatBase + IND *
              round(tblPeriodo.FieldByName('PERIODO').Value * 30.4375);
           if DayOfWeek(DatBase) = 7 then DatBase := DatBase + 2;
           if DayOfWeek(DatBase) = 1 then DatBase := DatBase + 1;
           PrintBand := True;
           if frmSelRelProg2.rgPrograma.ItemIndex = 0 then begin
                tblHstasm.Insert;
                tblHstasmIDPESSOA.Value :=
                   tblFuncio.FieldByName('IDPESSOA').Value;
                tblHstasmCODTIPOOCMED.Value :=
                   tblPeriodo.FieldByName('CODTIPOOCMED').Value;
                tblHstasmDATAPLAN.Value  := DatBase;
                qryUltSeq.Close;
                qryUltSeq.ParamByName('IDPESSOA').asInteger :=
                          tblFuncio.FieldByName('IDPESSOA').asInteger;
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

  if  PrintBand  then begin
      TotPes := TotPes + 1;
      NumPes := NumPes + 1;
      qrlDatPlan.Caption := DateToStr(DatBase);
      qrlObserv.Caption := 'A Programar';
      if  JATEM  then  qrlObserv.Caption := 'Já Programado'
      else if frmSelRelProg2.rgPrograma.ItemIndex = 0 then
              qrlObserv.Caption := 'Programado Agora';
  end;

end;


procedure TrelProgTipo.qrbSubTotBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlNumPes.Caption := IntToStr(NumPes);
end;

procedure TrelProgTipo.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  TotPes := 0;
  NumPes := 0;
  TotCur := 0;
end;

end.
