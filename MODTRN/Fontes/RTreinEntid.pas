unit RTreinEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  MAHlpBtn, StdCtrls, Buttons, Wwquery, wwdblook, IvDictio, IvMulti, IvEMulti;

type
  TrelTreinEntid = class(TrelMestreDet)
    tblHsttrn: TwwTable;
    tblHsttrnTOT_CUSTO: TCurrencyField;
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
    tblCurso: TwwTable;
    ds: TwwDataSource;
    tblPessoal: TwwTable;
    QRDBText1: TQRDBText;
    ds2: TwwDataSource;
    qrbTotais: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotHor: TQRLabel;
    qrlTotCus: TQRLabel;
    Panel1: TPanel;
    pnBotoes: TPanel;
    bbtnOk: TBitBtn;
    bbtnCancelar: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    qryPessoal: TwwQuery;
    lstCodSelec: TListBox;
    qrbSubTot: TQRBand;
    qrlSubCus: TQRLabel;
    qrlSubHor: TQRLabel;
    qrlMdCurs: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qryPessoal2: TwwQuery;
    tblHsttrnNUMSEQ: TFloatField;
    qrsubdt: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    qrlAvTeor: TQRLabel;
    qrlAvPrat: TQRLabel;
    qrlResult: TQRLabel;
    QRDBText7: TQRDBText;
    qrlAvCurs: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qryFuncio: TwwQuery;
    tblInstrutor: TwwTable;
    qrchldInstrutor: TQRChildBand;
    qrdbInstrutor: TQRDBText;
    QRLabel6: TQRLabel;
    tblHsttrnLOCALCURSO: TStringField;
    tblHsttrnIDINSTRUTOR: TFloatField;
    pnlFundo: TPanel;
    rgSelTudo: TRadioGroup;
    gbxSelec: TGroupBox;
    dblcSelec: TwwDBLookupCombo;
    lstSelec: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure tblHsttrnCalcFields(DataSet: TDataSet);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnOkClick(Sender: TObject);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rgSelTudoClick(Sender: TObject);
    procedure dblcSelecCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstSelecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSubTotBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qrAfterPreview(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relTreinEntid: TrelTreinEntid;
  TotCus, CurCus: real;
  TotPes, TotCur, TotHor, CurHor, CurAvQ, CurAvT, SvItem: integer;

implementation

uses fSelRelTrein, rResumoTrein;

{$R *.DFM}

procedure TrelTreinEntid.FormCreate(Sender: TObject);
begin
  inherited;
  qryPessoal.Open;
  tblHsttrn.Open;
  tblCurso.Open;
  tblInstrutor.Open;
  tblPessoal.Open;
  qryPessoal2.Open;
  if (frmSelRelTrein.cmbResumo.ItemIndex > 0) then
    qryFuncio.Open;

  qr.Visible     := false;
  qr.ReportTitle := qr.ReportTitle + ' de ' + frmSelRelTrein.EdData1.Text +
                                     ' a '  + frmSelRelTrein.EdData2.Text;
end;

procedure TrelTreinEntid.FormShow(Sender: TObject);
begin
  inherited;
  Self.Top  := 143;
  Self.Left := 184;
end;

procedure TrelTreinEntid.dblcSelecCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Modified) then
  begin
    lstSelec.Items.Add(qryPessoal2.FieldByName('NOME').asString);
    lstCodSelec.Items.Add(qryPessoal2.FieldByName('IDPESSOA').asString);
  end;
end;

procedure TrelTreinEntid.lstSelecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstSelec.Items.Count > 0) then
  begin
    SvItem := lstSelec.ItemIndex;
    lstSelec.Items.Delete(SvItem);
    lstCodSelec.Items.Delete(SvItem);
  end;
end;

procedure TrelTreinEntid.bbtnOkClick(Sender: TObject);
begin
  MsgTitulo  := qr.ReportTitle;
  qr.Visible := false;

  if not InputQuery('Título do Relatório','Confirme ou Altere :',MsgTitulo) then
    exit;

  qr.ReportTitle      := MsgTitulo;
  qrlblTitRel.Caption := MsgTitulo;
  ModalResult         := mrNone;

  if (Imprime) then
    qr.Print
  else
    qr.Preview;

  Self.WindowState := wsNormal;
end;

procedure TrelTreinEntid.bbtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TrelTreinEntid.rgSelTudoClick(Sender: TObject);
begin
  gbxSelec.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TrelTreinEntid.tblHsttrnCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblHsttrnTOT_CUSTO.Value := tblHsttrnVALOR.Value;
  if (frmSelRelTrein.rgTipoCusto.ItemIndex = 0) then
    tblHsttrnTOT_CUSTO.Value := tblHsttrnTOT_CUSTO.Value  +
                                tblHsttrnDESP_VIAG.Value  +
                                tblHsttrnDESP_ESTAD.Value +
                                tblHsttrnDESP_OUTR.Value;
end;

procedure TrelTreinEntid.qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  TotPes := 0;
  //TotCur := 0;
  TotHor := 0;
  TotCus := 0;
  frmSelRelTrein.ZeraTipoCurso;
end;

procedure TrelTreinEntid.qrAfterPreview(Sender: TObject);
begin
  inherited;
  with TrelResumoTrein.Create(Application) do
  begin
     qr.OnPreview := nil;
     Show;
     Free;
  end;

  Self.WindowState           := wsNormal;
  frmSelRelTrein.WindowState := wsNormal;
end;

procedure TrelTreinEntid.qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  IndPrg: integer;
  IdTip : string;
begin
  inherited;
  qrchldInstrutor.Enabled := false;
  if  ((tblHsttrnFLGCONTROLE.Value <> 1) and (frmSelRelTrein.rgIncluiExternos.ItemIndex = 1))
      or  not
     (((tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
       (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
       (tblHsttrnDATPLFIM.Value > 0) and (FazRes1)) or

      ((tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
       (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
       (tblHsttrnDATPLFIM.Value = 0) and (FazRes2)) or

      ((tblHsttrnDATPLFIM.Value >= frmSelRelTrein.EdData1.Date) and
       (tblHsttrnDATPLFIM.Value <= frmSelRelTrein.EdData2.Date) and
       (tblHsttrnDATREFIM.Value = 0) and (FazRes3)) or

       ((tblHsttrnDATREFIM.Value = 0) and
        (tblHsttrnDATPLFIM.Value = 0) and (FazRes4))) then
  begin
    PrintBand := false;
    exit;
  end;

  // Preparo a Chamada da Rotina para Somar no Relat. Resumo
  if (tblHsttrnDATREFIM.Value > 0) and (tblHsttrnDATPLFIM.Value > 0) then IndPrg := 1;
  if (tblHsttrnDATREFIM.Value > 0) and (tblHsttrnDATPLFIM.Value = 0) then IndPrg := 2;
  if (tblHsttrnDATREFIM.Value = 0) and (tblHsttrnDATPLFIM.Value > 0) then IndPrg := 3;
  if (tblHsttrnDATREFIM.Value = 0) and (tblHsttrnDATPLFIM.Value = 0) then IndPrg := 4;
  IdTip := '-1';
  if not(tblCurso.FieldByName('IdTipoCurso').IsNull) or
     (frmSelRelTrein.cmbResumo.ItemIndex = 1) then
    if (frmSelRelTrein.cmbResumo.ItemIndex = 0) then
      IdTip := tblCurso.FieldByName('IdTipoCurso').asString
    else
    if (frmSelRelTrein.cmbResumo.ItemIndex = 1) then
      IdTip := trim(qryFuncio.FieldByName('CODCENTROCUSTO').asString)
    else
      IdTip := Copy(Trim(tblCurso.FieldByName('IdTipoCurso').asString) + '0000000',1,7) +
               Copy(Trim(qryFuncio.FieldByName('CODCENTROCUSTO').asString)+'0000000000',1,10);

  frmSelRelTrein.SomaTipoCurso(IdTip, IndPrg,
    tblHsttrn.FieldByName('TOT_CUSTO').Value, tblHsttrn.FieldByName('DUR_TOT').Value);

  TotPes := TotPes + 1;
  TotHor := TotHor + tblHsttrn.FieldByName('DUR_TOT').Value;
  TotCus := TotCus + tblHsttrn.FieldByName('TOT_CUSTO').Value;
  CurHor := CurHor + tblHsttrn.FieldByName('DUR_TOT').Value;
  CurCus := CurCus + tblHsttrn.FieldByName('TOT_CUSTO').Value;

  qrlResult.Caption := '    N/A';
  qrlAvTeor.Caption := 'N/A';
  qrlAvPrat.Caption := 'N/A';
  qrlAvCurs.Caption := 'N/A';
  if (tblHsttrnDATREFIM.Value = 0) then
    exit;

  if (tblHsttrnFLGAVALTEOR.Value = 1) then
    qrlAvTeor.Caption := tblHsttrnAVALTEOR.asString;

  if (tblHsttrnFLGAVALPRAT.Value = 1) then
    qrlAvPrat.Caption := tblHsttrnAVALPRAT.asString;

  if (tblHsttrnFLGAVALCURS.Value = 1) then
  begin
    qrlAvCurs.Caption := tblHsttrnAVALCURSO.asString;
    CurAvQ := CurAvQ + 1;
    CurAvT := CurAvT + tblHsttrnAVALCURSO.AsInteger;
  end;

  if ((tblCurso.FieldByName('TEMAVAL').Value = 1) and
      (tblHsttrn.FieldByName('FLGAVALTEOR').Value = 1) or
      (tblCurso.FieldByName('TEMAVPR').Value = 1) and
      (tblHsttrn.FieldByName('FLGAVALPRAT').Value = 1)) then
  begin
    if ((tblCurso.FieldByName('TEMAVAL').Value = 1) and
        (tblHsttrn.FieldByName('FLGAVALTEOR').Value = 1) and
        (tblCurso.FieldByName('AVALIACAO').Value > tblHsttrn.FieldByName('AVALTEOR').Value)) or
       ((tblCurso.FieldByName('TEMAVPR').Value = 1) and
        (tblHsttrn.FieldByName('FLGAVALPRAT').Value = 1) and
        (tblCurso.FieldByName('AVALPRAT').Value > tblHsttrn.FieldByName('AVALPRAT').Value)) then
      qrlResult.Caption := 'Reprovad'
    else
      qrlResult.Caption := 'Aprovad';

    //if tblPessoal.FieldByName('SEXO').Value = 'M' then
    qrlResult.Caption := qrlResult.Caption + 'o';//  else
    //qrlResult.Caption := qrlResult.Caption + 'a';
  end;
  qrchldInstrutor.Enabled := (tblInstrutor.FieldByName('NOME').asString <> '');
end;

procedure TrelTreinEntid.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  I: integer;
begin
  inherited;
  PrintBand := (rgSelTudo.ItemIndex = 0);
  if (rgSelTudo.ItemIndex = 1) then
  begin
    for I:=0 to lstSelec.Items.Count-1 do
    begin
      if (lstSelec.Items[I] = '') then
        break;

      if (lstCodSelec.Items[I] = qryPessoal.FieldByName('IDPESSOA').asString) then
      begin
        PrintBand := true;
        break;
      end;
    end;
  end;

  if (PrintBand) then
  begin
    PrintBand := false;
    tblHsttrn.First;
    while not(tblHsttrn.EOF) do
    begin
       if ((tblHsttrnFLGCONTROLE.Value = 1) or (frmSelRelTrein.rgIncluiExternos.ItemIndex = 0))
         and
         (((tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
           (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
           (tblHsttrnDATPLFIM.Value  > 0) and (FazRes1)) or

          ((tblHsttrnDATREFIM.Value >= frmSelRelTrein.EdData1.Date) and
           (tblHsttrnDATREFIM.Value <= frmSelRelTrein.EdData2.Date) and
           (tblHsttrnDATPLFIM.Value  = 0) and (FazRes2)) or

          ((tblHsttrnDATPLFIM.Value >= frmSelRelTrein.EdData1.Date) and
           (tblHsttrnDATPLFIM.Value <= frmSelRelTrein.EdData2.Date) and
           (tblHsttrnDATREFIM.Value  = 0) and (FazRes3)) or

          ((tblHsttrnDATREFIM.Value = 0) and
           (tblHsttrnDATPLFIM.Value = 0) and (FazRes4))) then
      begin
        PrintBand := True;
        break;
      end;
      tblHsttrn.Next;
    end;
    tblHsttrn.First;
  end;
  qrbSubTot.Enabled       := PrintBand;
  qrSubDt.Enabled         := PrintBand;
  qrchldInstrutor.Enabled := false;
  //if  PrintBand  then  TotCur := TotCur + 1;
end;

procedure TrelTreinEntid.DetailBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  CurHor := 0;
  CurCus := 0;
  CurAvQ := 0;
  CurAvT := 0;
end;

procedure TrelTreinEntid.qrbSubTotBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlSubHor.Caption := IntToStr(CurHor);
  qrlSubCus.Caption := FloatToStrF(CurCus,ffFixed,12,2);
  qrlMdCurs.Caption := 'N/A';
  if (CurAvQ > 0) then
    qrlMdCurs.Caption := FloatToStrF(CurAvT / CurAvQ,ffFixed,10,0);
end;

procedure TrelTreinEntid.qrbTotaisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  //qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
  qrlTotCus.Caption := FloatToStrF(TotCus,ffFixed,12,2);
end;

end.
