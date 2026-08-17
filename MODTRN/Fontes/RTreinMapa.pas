unit RTreinMapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt, TB97,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TrelTreinMapa = class(TfrmSelPessoal)
    ds2: TwwDataSource;
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
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    qrlabDatIni: TQRLabel;
    QRLabel5: TQRLabel;
    qrlabDatFim: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrbTotais: TQRBand;
    QRLabel18: TQRLabel;
    qrlTotPes: TQRLabel;
    tblHsttrnNUMSEQ: TFloatField;
    qrlblTitRel: TQRSysData;
    dsTrn: TwwDataSource;
    qrlCurso1: TQRLabel;
    qrlCurso2: TQRLabel;
    qrlCurso3: TQRLabel;
    qrlCurso4: TQRLabel;
    qrlCurso5: TQRLabel;
    qrlCurso6: TQRLabel;
    qrlResult1: TQRLabel;
    qrlResult2: TQRLabel;
    qrlResult3: TQRLabel;
    qrlResult4: TQRLabel;
    qrlResult5: TQRLabel;
    qrlResult6: TQRLabel;
    QRLabel1: TQRLabel;
    qrlCurso7: TQRLabel;
    qrlCurso8: TQRLabel;
    qrlCurso9: TQRLabel;
    qrlCurso10: TQRLabel;
    qrlResult7: TQRLabel;
    qrlResult8: TQRLabel;
    qrlResult9: TQRLabel;
    qrlResult10: TQRLabel;
    qryCurso: TwwQuery;
    qryPacote: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure qrbTotaisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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
  relTreinMapa: TrelTreinMapa;
  TotPes, LimCursos : Integer;
  PrimVezSelPes : Boolean;
  Resultado : array[1..10] of String;
  CodCurso  : Variant;

implementation

uses FSelRelMapaTrein, uSistema;

{$R *.DFM}




procedure TrelTreinMapa.FormCreate(Sender: TObject);
var
  Ind : Integer;
  sAux: String;
begin
  inherited;
  qrlCurso1.Caption := '';
  qrlCurso2.Caption := '';
  qrlCurso3.Caption := '';
  qrlCurso4.Caption := '';
  qrlCurso5.Caption := '';
  qrlCurso6.Caption := '';
  qrlCurso7.Caption := '';
  qrlCurso8.Caption := '';
  qrlCurso9.Caption := '';
  qrlCurso10.Caption := '';

  sAux := '';
  if (frmSelRelMapaTrein.rgPacote.ItemIndex = 0) and
     (frmSelRelMapaTrein.lstPacote.Items.Count > 0) then
  begin
     for Ind := 1 to frmSelRelMapaTrein.lstPacote.Items.Count do
     begin
        if Ind > 1  then  sAux := sAux + ',';
        sAux := sAux + frmSelRelMapaTrein.lstCodPacote.Items[Ind-1];
     end;

     qryPacote.Close;
     qryPacote.Sql.Clear;
     qryPacote.Sql.Add('Select IDCURSO from CURSO where IDPACOTE in (' + sAux + ')');
     qryPacote.Open;
     sAux := '';
     Ind  := 0;
     while not qryPacote.EOF do
     begin
         inc(Ind);
         if Ind > 1  then  sAux := sAux + ',';
         sAux := sAux + qryPacote.FieldByName('IDCURSO').AsString;
         qryPacote.Next;
     end;
  end;

  if (frmSelRelMapaTrein.rgCurso.ItemIndex = 0) and
     (frmSelRelMapaTrein.lstCurso.Items.Count > 0) then
  begin
     for Ind := 1 to frmSelRelMapaTrein.lstCurso.Items.Count do
     begin
        if sAux <> ''  then  sAux := sAux + ',';
        sAux := sAux + frmSelRelMapaTrein.lstCodCurso.Items[Ind-1];
     end;
  end;

  qryCurso.Close;
  qryCurso.Sql.Clear;
  qryCurso.Sql.Add('Select IDCURSO,' +
                   'DECODE(ABREV,NULL,SUBSTR(DESCRICAO,1,10),ABREV) AS ABREV ' +
                   'from CURSO where IDCURSO in (' + sAux + ')' +
                   'order by upper(ABREV)');
  qryCurso.Open;
  qrlblIdent.Caption := Sistema.NomeModulo;
  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  tblHsttrn.Open;
  qrlabDatIni.Caption := frmSelRelMapaTrein.EdData1.Text;
  qrlabDatFim.Caption := frmSelRelMapaTrein.EdData2.Text;
  qr.ReportTitle := qr.ReportTitle + ' de ' + frmSelRelMapaTrein.EdData1.Text +
                                     ' a ' + frmSelRelMapaTrein.EdData2.Text;

  LimCursos := 10;
  if qryCurso.RecordCount < 10  then
     LimCursos := qryCurso.RecordCount;

  Ind := 0;
  CodCurso := VarArrayCreate([1, LimCursos], varInteger);
  while not qryCurso.EOF do
  begin
      inc(Ind);
      if Ind > LimCursos then break;
      CodCurso[Ind] := qryCurso.FieldByName('IDCURSO').AsInteger;
      if    Ind = 1 then qrlCurso1.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 2 then qrlCurso2.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 3 then qrlCurso3.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 4 then qrlCurso4.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 5 then qrlCurso5.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 6 then qrlCurso6.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 7 then qrlCurso7.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 8 then qrlCurso8.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else  if Ind = 9 then qrlCurso9.Caption :=
                      qryCurso.FieldByName('ABREV').AsString
      else            qrlCurso10.Caption :=
                      qryCurso.FieldByName('ABREV').AsString;
      qryCurso.Next;
  end;
end;

procedure TrelTreinMapa.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TrelTreinMapa.qrbTotaisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotPes.Caption := IntToStr(TotPes);
end;

procedure TrelTreinMapa.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Ind : Integer;
begin
  inherited;
  for Ind := 1 to 10 do  Resultado[Ind] := '';
  tblHsttrn.First;
  while not  tblHsttrn.Eof  do
  begin
     for Ind := 1 to LimCursos do
       if  tblHsttrnIDCURSO.AsInteger = CodCurso[Ind] then
       begin
         if  (tblHsttrnDATREFIM.Value >= frmSelRelMapaTrein.EdData1.Date) and
             (tblHsttrnDATREFIM.Value <= frmSelRelMapaTrein.EdData2.Date) and
             (tblHsttrnDATPLFIM.Value > 0) and (FazRes1) then
             Resultado[Ind] := 'R ' + tblHsttrnDATREFIM.AsString;

         if  (tblHsttrnDATREFIM.Value >= frmSelRelMapaTrein.EdData1.Date) and
             (tblHsttrnDATREFIM.Value <= frmSelRelMapaTrein.EdData2.Date) and
             (tblHsttrnDATPLFIM.Value = 0) and (FazRes2) then
             Resultado[Ind] := 'N ' + tblHsttrnDATREFIM.AsString;

         if  (tblHsttrnDATPLFIM.Value >= frmSelRelMapaTrein.EdData1.Date) and
             (tblHsttrnDATPLFIM.Value <= frmSelRelMapaTrein.EdData2.Date) and
             (tblHsttrnDATREFIM.Value = 0) and (FazRes3) then
             Resultado[Ind] := 'P ' + tblHsttrnDATPLFIM.AsString;

         if  (tblHsttrnDATREFIM.Value = 0) and
             (tblHsttrnDATPLFIM.Value = 0) and (FazRes4) then
             Resultado[Ind] := 'P Sem Data' + tblHsttrnDATREFIM.AsString;


       end;

     tblHsttrn.Next;
  end;
  tblHsttrn.First;
  PrintBand := False;
  for Ind := 1 to 10 do
      if Resultado[Ind] <> '' then PrintBand := True;
  PrintBand := (PrintBand) or (frmSelRelMapaTrein.cbxNada.Checked);
  if PrintBand then TotPes := TotPes + 1;
  qrlResult1.Caption := Resultado[1];
  qrlResult2.Caption := Resultado[2];
  qrlResult3.Caption := Resultado[3];
  qrlResult4.Caption := Resultado[4];
  qrlResult5.Caption := Resultado[5];
  qrlResult6.Caption := Resultado[6];
  qrlResult7.Caption := Resultado[7];
  qrlResult8.Caption := Resultado[8];
  qrlResult9.Caption := Resultado[9];
  qrlResult10.Caption := Resultado[10];
end;

procedure TrelTreinMapa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  MsgTitulo := qr.ReportTitle;
  qr.Visible := False;
  if not InputQuery('Título do Relatório','Confirme ou Altere :',MsgTitulo) then
    exit;
  qr.ReportTitle := MsgTitulo;
  ModalResult := mrNone;
  if  Imprime  then  qr.Print  else  qr.Preview;
end;


procedure TrelTreinMapa.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  PrimVezSelPes := True;
  TotPes := 0;
end;

procedure TrelTreinMapa.qrNeedData(Sender: TObject; var MoreData: Boolean);
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
