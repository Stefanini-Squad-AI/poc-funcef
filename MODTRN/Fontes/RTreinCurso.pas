unit RTreinCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  MAHlpBtn, StdCtrls, Buttons, Wwquery, wwdblook, IvDictio, IvMulti,
  IvEMulti;

type
  TrelTreinCurso = class(TrelMestreDet)
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
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    qrlAvTeor: TQRLabel;
    qrlAvPrat: TQRLabel;
    qrlResult: TQRLabel;
    QRDBText7: TQRDBText;
    qrlAvCurs: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    ds2: TwwDataSource;
    qrbTotais: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTotPes: TQRLabel;
    qrlTotCur: TQRLabel;
    qrlTotHor: TQRLabel;
    qrlTotCus: TQRLabel;
    Panel1: TPanel;
    pnBotoes: TPanel;
    bbtnOk: TBitBtn;
    bbtnCancela: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    qryCurso: TwwQuery;
    lstCodCurso: TListBox;
    qrbSubTot: TQRBand;
    qrlSubCus: TQRLabel;
    qrlSubHor: TQRLabel;
    qrlMdCurs: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    tblHsttrnNUMSEQ: TFloatField;
    qrlSubPes: TQRLabel;
    QRLabel1: TQRLabel;
    qryFuncio: TwwQuery;
    pnlFundo: TPanel;
    rgSelTudo: TRadioGroup;
    gbxCurso: TGroupBox;
    dblcCurso: TwwDBLookupCombo;
    lstCurso: TListBox;
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
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblCursoFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSubTotBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrAfterPreview(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relTreinCurso: TrelTreinCurso;
  TotPes, TotCur, TotHor, CurHor, CurPes, CurAvQ, CurAvT, SvItem : Integer;
  TotCus, CurCus : Real;
  TituBox: array[1..3] of string = ('Cursos','Tipos de Curso','Grupos de Treinamento');

implementation

uses fPrincipal, fSelRelTrein, RResumoTrein, FTelaAut;

{$R *.DFM}

procedure TrelTreinCurso.FormCreate(Sender: TObject);
begin
  inherited;
  tblCurso.Open;
  tblHsttrn.Open;
  tblPessoal.Open;
  if (frmSelRelTrein.cmbResumo.ItemIndex > 0) then
    qryFuncio.Open;

  qr.Visible := False;
  qr.ReportTitle := qr.ReportTitle + ' de ' + frmSelRelTrein.EdData1.Text +
                                     ' a '  + frmSelRelTrein.EdData2.Text;
end;

procedure TrelTreinCurso.FormShow(Sender: TObject);
begin
  inherited;
  Self.Top  := 143;
  Self.Left := 184;
end;

procedure TrelTreinCurso.tblHsttrnCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblHsttrnTOT_CUSTO.Value := tblHsttrnVALOR.Value;
  if  frmSelRelTrein.rgTipoCusto.ItemIndex = 0  then
      tblHsttrnTOT_CUSTO.Value := tblHsttrnTOT_CUSTO.Value +
                                  tblHsttrnDESP_VIAG.Value +
                                  tblHsttrnDESP_ESTAD.Value +
                                  tblHsttrnDESP_OUTR.Value;
end;

procedure TrelTreinCurso.qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  IndPrg : Integer;
  IdTip  : String;
begin
  inherited;
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
         IdTip := trim(qryFuncio.FieldByName('CODCENTROCUSTO').AsString)
      else
         IdTip := copy(trim(tblCurso.FieldByName('IdTipoCurso').AsString) + '0000000',1,7) +
                  copy(trim(qryFuncio.FieldByName('CODCENTROCUSTO').AsString)+'0000000000',1,10);
  frmSelRelTrein.SomaTipoCurso(IdTip, IndPrg,
                               tblHsttrn.FieldByName('TOT_CUSTO').Value,
                               tblHsttrn.FieldByName('DUR_TOT').Value);

  TotPes := TotPes + 1;
  CurPes := CurPes + 1;
  TotHor := TotHor + tblHsttrn.FieldByName('DUR_TOT').Value;
  TotCus := TotCus + tblHsttrn.FieldByName('TOT_CUSTO').Value;
  CurHor := CurHor + tblHsttrn.FieldByName('DUR_TOT').Value;
  CurCus := CurCus + tblHsttrn.FieldByName('TOT_CUSTO').Value;

  qrlResult.Caption := '    N/A';
  qrlAvTeor.Caption := 'N/A';
  qrlAvPrat.Caption := 'N/A';
  qrlAvCurs.Caption := 'N/A';
  if  (tblHsttrnDATREFIM.Value = 0)  then  exit;

  if  (tblHsttrnFLGAVALTEOR.Value = 1)  then
      qrlAvTeor.Caption := tblHsttrnAVALTEOR.AsString;
  if  (tblHsttrnFLGAVALPRAT.Value = 1)  then
      qrlAvPrat.Caption := tblHsttrnAVALPRAT.AsString;
  if  (tblHsttrnFLGAVALCURS.Value = 1)  then
  begin
    qrlAvCurs.Caption := tblHsttrnAVALCURSO.AsString;
    CurAvQ := CurAvQ + 1;
    CurAvT := CurAvT + tblHsttrnAVALCURSO.AsInteger;
  end;

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
     //if tblPessoal.FieldByName('SEXO').Value = 'M' then
          qrlResult.Caption := qrlResult.Caption + 'o';//  else
     //     qrlResult.Caption := qrlResult.Caption + 'a';
  end;
end;

procedure TrelTreinCurso.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
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
  qrbSubTot.Enabled := PrintBand;
  if  PrintBand  then  TotCur := TotCur + 1;
end;

procedure TrelTreinCurso.bbtnOkClick(Sender: TObject);
var
  Ind : Integer;
begin
  inherited;
  MsgTitulo  := qr.ReportTitle;
  qr.Visible := false;

  if not InputQuery('Título do Relatório','Confirme ou Altere :',MsgTitulo) then
    exit;

  qr.ReportTitle      := MsgTitulo;
  qrlblTitRel.Caption := MsgTitulo;
  iSelCurso           := rgSelTudo.ItemIndex;
  if (rgSelTudo.ItemIndex > 0) then
  begin
    sTipo := '(';
    for Ind:=0 to lstCodCurso.Items.Count-1 do
    begin
      if (Ind > 0) then
        sTipo := sTipo + ',';
      if (rgSelTudo.ItemIndex > 2) then
        sTipo := sTipo + QuotedStr(lstCodCurso.Items[Ind])
      else
        sTipo := sTipo + lstCodCurso.Items[Ind];
      end;
     sTipo := sTipo + ')';
  end;
  tblCurso.Filtered := False;
  tblCurso.First;
  tblCurso.Filtered := rgSelTudo.ItemIndex > 0;
  ModalResult := mrNone;
  if  Imprime  then  qr.Print  else  qr.Preview;
  Self.WindowState := wsNormal;
end;

procedure TrelTreinCurso.qrbTotaisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
  qrlTotCur.Caption := IntToStr(TotCur);
  qrlTotHor.Caption := IntToStr(TotHor);
  qrlTotCus.Caption := FloatToStrF(TotCus,ffFixed,12,2);
end;

procedure TrelTreinCurso.rgSelTudoClick(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  gbxCurso.Visible := (rgSelTudo.ItemIndex > 0);
  if  (rgSelTudo.ItemIndex > 0) then begin
      qryCurso.Close;
      qryCurso.SQL.Clear;
      lstCodCurso.Clear;
      lstCurso.Clear;
      gbxCurso.Caption := TituBox[rgSelTudo.ItemIndex];
      dblcCurso.Hint   := 'Informe ' + TituBox[rgSelTudo.ItemIndex] + ' Desejados';
      if  rgSelTudo.ItemIndex = 1  then
          sSql := 'Select IDCURSO, DESCRICAO from CURSO order by upper(DESCRICAO)';
      if  rgSelTudo.ItemIndex = 2  then
          sSql := 'Select IDTIPOCURSO as IDCURSO, DESCRICAO from TIPCURSO order by upper(DESCRICAO)';
      if  rgSelTudo.ItemIndex = 3  then
          sSql := 'Select CODGRPTREIN as IDCURSO, DESCGRPTREIN as DESCRICAO from GRPTREIN order by upper(DESCRICAO)';

      qryCurso.SQL.Add(sSql);
      qryCurso.Open;
      dblcCurso.SetFocus;
  end;
end;

procedure TrelTreinCurso.dblcCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstCurso.Items.Add(qryCurso.FieldByName('DESCRICAO').Value);
    lstCodCurso.Items.Add(qryCurso.FieldByName('IDCURSO').AsString);
  end;
end;


procedure TrelTreinCurso.lstCursoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCurso.Items.Count > 0)  then begin
      SvItem := lstCurso.ItemIndex;
      lstCurso.Items.Delete(SvItem);
      lstCodCurso.Items.Delete(SvItem);
  end;
end;

procedure TrelTreinCurso.tblCursoFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  I : Integer;
begin
  inherited;
     Accept := False;
     for  I := 0 to (lstCurso.Items.Count - 1) do begin
          if lstCurso.Items[I] = ''  then  break;
          if  ((rgSelTudo.ItemIndex = 1) and (lstCodCurso.Items[I] =
               tblCurso.FieldByName('IDCURSO').AsString))  or
              ((rgSelTudo.ItemIndex = 2) and (lstCodCurso.Items[I] =
               tblCurso.FieldByName('IDTIPOCURSO').AsString))  or
              ((rgSelTudo.ItemIndex = 3) and (lstCodCurso.Items[I] =
               tblCurso.FieldByName('CODGRPTREIN').AsString))
          then begin
             Accept := True;
             break;
          end;
     end;
end;

procedure TrelTreinCurso.DetailBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  CurHor := 0;
  CurPes := 0;
  CurCus := 0;
  CurAvQ := 0;
  CurAvT := 0;
end;

procedure TrelTreinCurso.qrbSubTotBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlSubHor.Caption := IntToStr(CurHor);
  qrlSubPes.Caption := IntToStr(CurPes);
  qrlSubCus.Caption := FloatToStrF(CurCus,ffFixed,12,2);
  qrlMdCurs.Caption := 'N/A';
  if  CurAvQ > 0 then
      qrlMdCurs.Caption := FloatToStrF(CurAvT/CurAvQ,ffFixed,10,0);
end;

procedure TrelTreinCurso.qrAfterPreview(Sender: TObject);
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

procedure TrelTreinCurso.qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  TotPes := 0;
  TotCur := 0;
  TotHor := 0;
  TotCus := 0;
  frmSelRelTrein.ZeraTipoCurso;
end;

procedure TrelTreinCurso.bbtnCancelaClick(Sender: TObject);
begin
  Close;
end;

end.
