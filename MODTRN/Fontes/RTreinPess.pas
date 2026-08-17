unit RTreinPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TrelTreinPess = class(TfrmSelPessoal)
    ds2: TwwDataSource;
    tblHsttrn: TwwTable;
    tblHsttrnTOT_CUSTO: TCurrencyField;
    tblCurso: TwwTable;
    tblCargo2: TwwTable;
    tblHsttrnIDPESSOA: TFloatField;
    tblHsttrnIDCURSO: TFloatField;
    tblHsttrnDATREINI: TDateTimeField;
    tblHsttrnDATREFIM: TDateTimeField;
    tblHsttrnDATPLINI: TDateTimeField;
    tblHsttrnDATPLFIM: TDateTimeField;
    tblHsttrnDUR_TEOR: TFloatField;
    tblHsttrnDUR_PRAT: TFloatField;
    tblHsttrnDUR_TOT: TFloatField;
    tblHsttrnFLGCONTROLE: TFloatField;
    tblHsttrnFLGAVALCURS: TFloatField;
    tblHsttrnAVALCURSO: TFloatField;
    tblHsttrnFLGAVALTEOR: TFloatField;
    tblHsttrnAVALTEOR: TFloatField;
    tblHsttrnFLGAVALPRAT: TFloatField;
    tblHsttrnAVALPRAT: TFloatField;
    tblHsttrnVALOR: TFloatField;
    tblHsttrnDESP_VIAG: TFloatField;
    tblHsttrnDESP_ESTAD: TFloatField;
    tblHsttrnDESP_OUTR: TFloatField;
    tblHsttrnIDENTIDINSTR: TFloatField;
    qr: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    qrsubdt: TQRSubDetail;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    qrlabDatIni: TQRLabel;
    QRLabel5: TQRLabel;
    qrlabDatFim: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrlResult: TQRLabel;
    qrlAvTeor: TQRLabel;
    qrlAvPrat: TQRLabel;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    qrlTotHor: TQRLabel;
    qrlTotCus: TQRLabel;
    tblHsttrnNUMSEQ: TFloatField;
    qrlblTitRel: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    tblEntid: TwwTable;
    dsTrn: TwwDataSource;
    QRDBText9: TQRDBText;
    tblInstrutor: TwwTable;
    tblHsttrnLOCALCURSO: TStringField;
    tblHsttrnIDINSTRUTOR: TFloatField;
    qrchldInstrutor: TQRChildBand;
    qrdbInstrutor: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    procedure tblHsttrnCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
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
  relTreinPess: TrelTreinPess;
  TotPes, TotCur, TotHor : Integer;
  TotCus : Real;
  PrimVezSelPes : Boolean;

implementation

uses FSelRelTrein, uSistema, RResumoTrein;

{$R *.DFM}

procedure TrelTreinPess.FormCreate(Sender: TObject);
begin
  inherited;
  qrlblIdent.Caption := Sistema.NomeModulo;
  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  tblCargo2.Open;
  tblHsttrn.Open;
  tblCurso.Open;
  tblEntid.Open;
  tblInstrutor.Open;
  qrlabDatIni.Caption := frmSelRelTrein.EdData1.Text;
  qrlabDatFim.Caption := frmSelRelTrein.EdData2.Text;
  qr.ReportTitle := qr.ReportTitle + ' de ' + frmSelRelTrein.EdData1.Text +
                                     ' a ' + frmSelRelTrein.EdData2.Text;
{  ColumnHeaderBand1.Enabled := (frmSelRelTrein.rgTipoRel.ItemIndex = 0);
  qrbCabDet.Enabled := (frmSelRelTrein.rgTipoRel.ItemIndex = 0);
  qrsubdt.Enabled := (frmSelRelTrein.rgTipoRel.ItemIndex = 0);
  DetailBand1.Enabled := (frmSelRelTrein.rgTipoRel.ItemIndex = 0); }
end;

procedure TrelTreinPess.tblHsttrnCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblHsttrnTOT_CUSTO.Value := tblHsttrnVALOR.Value;
  if  frmSelRelTrein.rgTipoCusto.ItemIndex = 0  then
      tblHsttrnTOT_CUSTO.Value := tblHsttrnTOT_CUSTO.Value +
                                  tblHsttrnDESP_VIAG.Value +
                                  tblHsttrnDESP_ESTAD.Value +
                                  tblHsttrnDESP_OUTR.Value;
end;

procedure TrelTreinPess.qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  IndPrg : Integer;
  IdTip  : String;
begin
  inherited;
  qrchldInstrutor.Enabled := False;

  if  ((tblHsttrnFLGCONTROLE.Value <> 1) and (frmSelRelTrein.rgIncluiExternos.ItemIndex = 1))
      or  not
         ( ( (tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
             (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
             (tblHsttrnDATPLFIM.Value > 0) and (FazRes1) ) or

           ( (tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
             (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
             (tblHsttrnDATPLFIM.Value = 0) and (FazRes2) ) or

           ( (tblHsttrnDATPLFIM.Value >= frmSelRelTrein.EdData1.Date) and
             (tblHsttrnDATPLFIM.Value <= frmSelRelTrein.EdData2.Date) and
             (tblHsttrnDATREFIM.Value = 0) and (FazRes3) ) or

           ( (tblHsttrnDATREFIM.Value = 0) and
             (tblHsttrnDATPLFIM.Value = 0) and (FazRes4) ) )

       then begin
          PrintBand := False;
          exit;
       end;

  // Preparo a Chamada da Rotina para Somar no Relat. Resumo
  if (tblHsttrnDATREFIM.Value > 0) and (tblHsttrnDATPLFIM.Value > 0) then IndPrg := 1;
  if (tblHsttrnDATREFIM.Value > 0) and (tblHsttrnDATPLFIM.Value = 0) then IndPrg := 2;
  if (tblHsttrnDATREFIM.Value = 0) and (tblHsttrnDATPLFIM.Value > 0) then IndPrg := 3;
  if (tblHsttrnDATREFIM.Value = 0) and (tblHsttrnDATPLFIM.Value = 0) then IndPrg := 4;
  IdTip := '-1';
  if  (tblCurso.FieldByName('IdTipoCurso').Value <> Null) or
      (frmSelRelTrein.cmbResumo.ItemIndex = 1)  then
      if frmSelRelTrein.cmbResumo.ItemIndex = 0 then
         IdTip := tblCurso.FieldByName('IdTipoCurso').AsString
      else if frmSelRelTrein.cmbResumo.ItemIndex = 1 then
         IdTip := trim(tblPessoal.FieldByName('CODCENTROCUSTO').AsString)
      else
         IdTip := copy(trim(tblCurso.FieldByName('IdTipoCurso').AsString) + '0000000',1,7) +
                  copy(trim(tblPessoal.FieldByName('CODCENTROCUSTO').AsString)+'0000000000',1,10);
  frmSelRelTrein.SomaTipoCurso(IdTip, IndPrg,
                               tblHsttrn.FieldByName('TOT_CUSTO').Value,
                               tblHsttrn.FieldByName('DUR_TOT').Value);
  //

  TotCur := TotCur + 1;
  TotHor := TotHor + tblHsttrn.FieldByName('DUR_TOT').Value;
  TotCus := TotCus + tblHsttrn.FieldByName('TOT_CUSTO').Value;

  qrlResult.Caption := '    N/A';
  qrlAvTeor.Caption := 'N/A';
  qrlAvPrat.Caption := 'N/A';
  if  (tblHsttrnDATREFIM.Value = 0)  then  exit;

  if  (tblHsttrnFLGAVALTEOR.Value = 1)  then
      qrlAvTeor.Caption := tblHsttrnAVALTEOR.AsString;
  if  (tblHsttrnFLGAVALPRAT.Value = 1)  then
      qrlAvPrat.Caption := tblHsttrnAVALPRAT.AsString;

  if ((tblCurso.FieldByName('TEMAVAL').Value = 1) and
      (tblHsttrn.FieldByName('FLGAVALTEOR').Value = 1) or
      (tblCurso.FieldByName('TEMAVPR').Value = 1) and
      (tblHsttrn.FieldByName('FLGAVALPRAT').Value = 1))
     then begin
       if ((tblCurso.FieldByName('TEMAVAL').Value = 1) and
           (tblHsttrn.FieldByName('FLGAVALTEOR').Value = 1)
       and (tblCurso.FieldByName('AVALIACAO').Value >
            tblHsttrn.FieldByName('AVALTEOR').Value)) or
       ((tblCurso.FieldByName('TEMAVPR').Value = 1) and
        (tblHsttrn.FieldByName('FLGAVALPRAT').Value = 1)
       and (tblCurso.FieldByName('AVALPRAT').Value >
            tblHsttrn.FieldByName('AVALPRAT').Value))  then
           qrlResult.Caption := 'Reprovad'
       else
           qrlResult.Caption := 'Aprovad';
     if tblPessoal.FieldByName('SEXO').Value = 'M' then
          qrlResult.Caption := qrlResult.Caption + 'o'  else
          qrlResult.Caption := qrlResult.Caption + 'a';
  end;
  qrchldInstrutor.Enabled := tblInstrutor.FieldByName('NOME').AsString <> '';
end;

procedure TrelTreinPess.qrbTotaisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
  qrlTotCus.Caption := FloatToStrF(TotCus,ffFixed,12,2);
end;

procedure TrelTreinPess.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
  tblHsttrn.First;
  while not  tblHsttrn.Eof  do begin
       if ((tblHsttrnFLGCONTROLE.Value = 1) or (frmSelRelTrein.rgIncluiExternos.ItemIndex = 0))
         and
         ( ( (tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
             (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
             (tblHsttrnDATPLFIM.Value > 0) and (FazRes1) ) or

           ( (tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
             (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
             (tblHsttrnDATPLFIM.Value = 0) and (FazRes2) ) or

           ( (tblHsttrnDATPLFIM.Value >= frmSelRelTrein.EdData1.Date) and
             (tblHsttrnDATPLFIM.Value <= frmSelRelTrein.EdData2.Date) and
             (tblHsttrnDATREFIM.Value = 0) and (FazRes3) ) or

           ( (tblHsttrnDATREFIM.Value = 0) and
             (tblHsttrnDATPLFIM.Value = 0) and (FazRes4) ) )

           then begin
             PrintBand := True;
             break;
           end;
       tblHsttrn.Next;
  end;
  tblHsttrn.First;

  if (PrintBand) then
    TotPes := TotPes + 1;
end;

procedure TrelTreinPess.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  MsgTitulo := qr.ReportTitle;
  qr.Visible := False;

  if not InputQuery('Título do Relatório','Confirme ou Altere :',MsgTitulo) then
    exit;

  qr.ReportTitle := MsgTitulo;
  ModalResult := mrNone;

  if (Imprime) then
    qr.Print
  else
    qr.Preview;
end;

procedure TrelTreinPess.qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  PrimVezSelPes := True;
  TotPes := 0;
  TotCur := 0;
  TotHor := 0;
  TotCus := 0;
  frmSelRelTrein.ZeraTipoCurso;
end;

procedure TrelTreinPess.qrAfterPreview(Sender: TObject);
begin
  inherited;
  with TrelResumoTrein.Create(Application) do
  begin
     //qr.OnPreview := nil;
     Show;
     Free;
  end;

  Self.WindowState           := wsNormal;
  frmSelRelTrein.WindowState := wsNormal;
end;

procedure TrelTreinPess.qrNeedData(Sender: TObject; var MoreData: Boolean);
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
