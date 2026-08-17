unit rProcSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QuickRpt,
  Qrctrls, ExtCtrls, Db, DBTables, Wwtable, Wwdatsrc, QRExport;

type
  TRelProcSint = class(TForm)
    ds2: TwwDataSource;
    tblObjeto: TwwTable;
    qr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    QRSysData3: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    qllMes1: TQRLabel;
    qllMes3: TQRLabel;
    qllMes5: TQRLabel;
    qllMes4: TQRLabel;
    qllMes6: TQRLabel;
    qllMes7: TQRLabel;
    qllMes9: TQRLabel;
    qllMes8: TQRLabel;
    qllMes10: TQRLabel;
    qllMes11: TQRLabel;
    qllMes2: TQRLabel;
    qllMes12: TQRLabel;
    QRLabel23: TQRLabel;
    DetailBand1: TQRBand;
    qrdbNumJCJ: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlTotProc1: TQRLabel;
    qrlTotMax1: TQRLabel;
    qrlTotEst1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrlTotProc2: TQRLabel;
    qrlTotProc3: TQRLabel;
    qrlTotProc4: TQRLabel;
    qrlTotProc5: TQRLabel;
    qrlTotProc6: TQRLabel;
    qrlTotProc7: TQRLabel;
    qrlTotProc8: TQRLabel;
    qrlTotProc9: TQRLabel;
    qrlTotProc10: TQRLabel;
    qrlTotProc11: TQRLabel;
    qrlTotProc12: TQRLabel;
    qrlTotProc: TQRLabel;
    qrlTotMax2: TQRLabel;
    qrlTotEst2: TQRLabel;
    qrlTotMax3: TQRLabel;
    qrlTotEst3: TQRLabel;
    qrlTotMax4: TQRLabel;
    qrlTotEst4: TQRLabel;
    qrlTotMax5: TQRLabel;
    qrlTotEst5: TQRLabel;
    qrlTotMax6: TQRLabel;
    qrlTotEst6: TQRLabel;
    qrlTotMax7: TQRLabel;
    qrlTotEst7: TQRLabel;
    qrlTotMax8: TQRLabel;
    qrlTotEst8: TQRLabel;
    qrlTotMax9: TQRLabel;
    qrlTotEst9: TQRLabel;
    qrlTotMax10: TQRLabel;
    qrlTotEst10: TQRLabel;
    qrlTotMax11: TQRLabel;
    qrlTotEst11: TQRLabel;
    qrlTotMax12: TQRLabel;
    qrlTotEst12: TQRLabel;
    qrlTotCus: TQRLabel;
    qrlTotAtual: TQRLabel;
    qrlTotEnt1: TQRLabel;
    qrlTotEnt2: TQRLabel;
    qrlTotEnt3: TQRLabel;
    qrlTotEnt4: TQRLabel;
    qrlTotEnt5: TQRLabel;
    qrlTotEnt6: TQRLabel;
    qrlEntMax1: TQRLabel;
    qrlEntMax2: TQRLabel;
    qrlEntMax3: TQRLabel;
    qrlEntMax4: TQRLabel;
    qrlEntMax5: TQRLabel;
    qrlEntMax6: TQRLabel;
    qrlEntEst1: TQRLabel;
    qrlEntEst2: TQRLabel;
    qrlEntEst3: TQRLabel;
    qrlEntEst4: TQRLabel;
    qrlEntEst5: TQRLabel;
    qrlEntEst6: TQRLabel;
    qrlTotEnt7: TQRLabel;
    qrlEntMax7: TQRLabel;
    qrlEntEst7: TQRLabel;
    qrlTotEnt8: TQRLabel;
    qrlEntMax8: TQRLabel;
    qrlEntEst8: TQRLabel;
    qrlTotEnt9: TQRLabel;
    qrlEntMax9: TQRLabel;
    qrlEntEst9: TQRLabel;
    qrlTotEnt10: TQRLabel;
    qrlEntMax10: TQRLabel;
    qrlEntEst10: TQRLabel;
    qrlTotEnt11: TQRLabel;
    qrlEntMax11: TQRLabel;
    qrlEntEst11: TQRLabel;
    qrlTotEnt12: TQRLabel;
    qrlEntMax12: TQRLabel;
    qrlEntEst12: TQRLabel;
    qrlTotEntT: TQRLabel;
    qrlEntMaxT: TQRLabel;
    qrlEntEstT: TQRLabel;
    qrlTotSai1: TQRLabel;
    qrlSaiMax1: TQRLabel;
    qrlSaiEst1: TQRLabel;
    qrlTotSai2: TQRLabel;
    qrlSaiMax2: TQRLabel;
    qrlSaiEst2: TQRLabel;
    qrlTotSai3: TQRLabel;
    qrlSaiMax3: TQRLabel;
    qrlSaiEst3: TQRLabel;
    qrlTotSai4: TQRLabel;
    qrlSaiMax4: TQRLabel;
    qrlSaiEst4: TQRLabel;
    qrlTotSai5: TQRLabel;
    qrlSaiMax5: TQRLabel;
    qrlSaiEst5: TQRLabel;
    qrlTotSai6: TQRLabel;
    qrlSaiMax6: TQRLabel;
    qrlSaiEst6: TQRLabel;
    qrlTotSai7: TQRLabel;
    qrlSaiMax7: TQRLabel;
    qrlSaiEst7: TQRLabel;
    qrlTotSai8: TQRLabel;
    qrlSaiMax8: TQRLabel;
    qrlSaiEst8: TQRLabel;
    qrlTotSai9: TQRLabel;
    qrlSaiMax9: TQRLabel;
    qrlSaiEst9: TQRLabel;
    qrlTotSai10: TQRLabel;
    qrlSaiMax10: TQRLabel;
    qrlSaiEst10: TQRLabel;
    qrlTotAco1: TQRLabel;
    qrlReaAco1: TQRLabel;
    qrlTotAco2: TQRLabel;
    qrlReaAco2: TQRLabel;
    qrlTotAco3: TQRLabel;
    qrlReaAco3: TQRLabel;
    qrlTotAco4: TQRLabel;
    qrlReaAco4: TQRLabel;
    qrlTotAco5: TQRLabel;
    qrlReaAco5: TQRLabel;
    qrlTotAco6: TQRLabel;
    qrlReaAco6: TQRLabel;
    qrlTotAco7: TQRLabel;
    qrlReaAco7: TQRLabel;
    qrlTotAco8: TQRLabel;
    qrlReaAco8: TQRLabel;
    qrlTotAco9: TQRLabel;
    qrlReaAco9: TQRLabel;
    qrlTotAco10: TQRLabel;
    qrlReaAco10: TQRLabel;
    qrlTotDec1: TQRLabel;
    qrlReaDec1: TQRLabel;
    qrlTotDec2: TQRLabel;
    qrlReaDec2: TQRLabel;
    qrlTotDec3: TQRLabel;
    qrlReaDec3: TQRLabel;
    qrlTotDec4: TQRLabel;
    qrlReaDec4: TQRLabel;
    qrlTotDec5: TQRLabel;
    qrlReaDec5: TQRLabel;
    qrlTotDec6: TQRLabel;
    qrlReaDec6: TQRLabel;
    qrlTotDec7: TQRLabel;
    qrlReaDec7: TQRLabel;
    qrlTotDec8: TQRLabel;
    qrlReaDec8: TQRLabel;
    qrlTotDec9: TQRLabel;
    qrlReaDec9: TQRLabel;
    qrlTotDec10: TQRLabel;
    qrlReaDec10: TQRLabel;
    qrlTotOut1: TQRLabel;
    qrlReaOut1: TQRLabel;
    qrlTotOut2: TQRLabel;
    qrlReaOut2: TQRLabel;
    qrlTotOut3: TQRLabel;
    qrlReaOut3: TQRLabel;
    qrlTotOut4: TQRLabel;
    qrlReaOut4: TQRLabel;
    qrlTotOut5: TQRLabel;
    qrlReaOut5: TQRLabel;
    qrlTotOut6: TQRLabel;
    qrlReaOut6: TQRLabel;
    qrlTotOut7: TQRLabel;
    qrlReaOut7: TQRLabel;
    qrlTotOut8: TQRLabel;
    qrlReaOut8: TQRLabel;
    qrlTotOut9: TQRLabel;
    qrlReaOut9: TQRLabel;
    qrlTotOut10: TQRLabel;
    qrlReaOut10: TQRLabel;
    qrlTotSai11: TQRLabel;
    qrlTotSai12: TQRLabel;
    qrlTotSaiT: TQRLabel;
    qrlSaiMax11: TQRLabel;
    qrlSaiMax12: TQRLabel;
    qrlSaiMaxT: TQRLabel;
    qrlSaiEst11: TQRLabel;
    qrlSaiEst12: TQRLabel;
    qrlSaiEstT: TQRLabel;
    qrlTotAco11: TQRLabel;
    qrlTotAco12: TQRLabel;
    qrlTotAcoT: TQRLabel;
    qrlReaAco11: TQRLabel;
    qrlReaAco12: TQRLabel;
    qrlReaAcoT: TQRLabel;
    qrlTotDec11: TQRLabel;
    qrlTotDec12: TQRLabel;
    qrlTotDecT: TQRLabel;
    qrlReaDec11: TQRLabel;
    qrlReaDec12: TQRLabel;
    qrlReaDecT: TQRLabel;
    qrlTotOut11: TQRLabel;
    qrlTotOut12: TQRLabel;
    qrlTotOutT: TQRLabel;
    qrlReaOut11: TQRLabel;
    qrlReaOut12: TQRLabel;
    qrlReaOutT: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    qrlTotRea1: TQRLabel;
    qrlPerMax1: TQRLabel;
    qrlPerEst1: TQRLabel;
    qrlTotRea2: TQRLabel;
    qrlPerMax2: TQRLabel;
    qrlPerEst2: TQRLabel;
    qrlTotRea3: TQRLabel;
    qrlPerMax3: TQRLabel;
    qrlPerEst3: TQRLabel;
    qrlTotRea4: TQRLabel;
    qrlPerMax4: TQRLabel;
    qrlPerEst4: TQRLabel;
    qrlTotRea5: TQRLabel;
    qrlPerMax5: TQRLabel;
    qrlPerEst5: TQRLabel;
    qrlTotRea6: TQRLabel;
    qrlPerMax6: TQRLabel;
    qrlPerEst6: TQRLabel;
    qrlTotRea7: TQRLabel;
    qrlPerMax7: TQRLabel;
    qrlPerEst7: TQRLabel;
    qrlTotRea8: TQRLabel;
    qrlPerMax8: TQRLabel;
    qrlPerEst8: TQRLabel;
    qrlTotRea9: TQRLabel;
    qrlPerMax9: TQRLabel;
    qrlPerEst9: TQRLabel;
    qrlTotRea10: TQRLabel;
    qrlTotRea11: TQRLabel;
    qrlTotRea12: TQRLabel;
    qrlTotReaT: TQRLabel;
    qrlPerMax10: TQRLabel;
    qrlPerMax11: TQRLabel;
    qrlPerMax12: TQRLabel;
    qrlPerMaxT: TQRLabel;
    qrlPerEst10: TQRLabel;
    qrlPerEst11: TQRLabel;
    qrlPerEst12: TQRLabel;
    qrlPerEstT: TQRLabel;
    QRLabel27: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRTextFilter: TQRTextFilter;
    procedure FormCreate(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  end;

var
  RelProcSint: TRelProcSint;

implementation

uses uMensErro, uSistema, uValorAtual, fSelRelSint, uFuncoesUteisRH;

var
  TotProc, TotEnt, TotSai, TotAco, TotDec, TotOut: Integer;
  TotCus, TotAtu, ValAtu, ValMax, ValReal : Double;
  TTEntMax, TTEntPrv, TTSaiMax, TTSaiPrv, TTValAco, TTValDec, TTValOut, TTValRea : Double;
  ValorReclamado, ValorReal : Double;
  TotQtdPrc, TotQtdEnt, TotQtdSai, TotQtdAco, TotQtdDec, TotQtdOut : array[1..12] of Integer;
  TotValMax, TotEntMax, TotSaiMax : array[1..12] of Double;
  TotValPrv, TotEntPrv, TotSaiPrv : array[1..12] of Double;
  TotValRea, TotValAco, TotValDec, TotValOut : array[1..12] of Double;
  sMesRef  : String;

const
  arrSit: array[0..1] of String[9] = ('Aberto','Encer.');

{$R *.DFM}

procedure TRelProcSint.FormCreate(Sender: TObject);
var
  Ind: integer;
  msg: string;
begin
  inherited;
  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  qrlblIdent.Caption   := Sistema.NomeModulo;

  if (frmSelRelSint.cmbMes.ItemIndex <= 8) then
    sMesRef := '0'+IntToStr(frmSelRelSint.cmbMes.ItemIndex+1)
  else
    sMesRef := IntToStr(frmSelRelSint.cmbMes.ItemIndex+1);

  qr.ReportTitle := qr.ReportTitle + ' - ' +
    Trim(frmSelRelSint.cmbMes.Items[frmSelRelSint.cmbMes.ItemIndex]) +'/'+
    frmSelRelSint.spedAno.Text;

  tblObjeto.Open;
  Ind := frmSelRelSint.cmbMes.ItemIndex + 1;
  if (Ind > 11) then
    Ind := 0;

  qllMes1.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes2.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes3.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes4.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes5.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes6.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes7.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes8.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes9.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes10.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes11.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);
  inc(Ind);
  if (Ind > 11) then
    Ind := 0;

  qllMes12.Caption := copy(frmSelRelSint.cmbMes.Items[Ind],1,3);

  msg        := qr.ReportTitle;
  qr.Visible := false;
  if not(InputQuery('Título do Relatório','Confirme ou Altere :',msg)) then
    exit;

  qr.ReportTitle := msg;
  qr.Visible     := false;

  if (MsgDlg('Deseja Visualizar o Relatório ?',
            LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    qr.Preview
  else
    qr.Print;

  Close;
end;

procedure TRelProcSint.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  Ind: integer;
begin
  inherited;
  TotProc:=0;  TotCus:=0;   TotAtu:=0;   TTEntMax:=0; TTEntPrv:=0;
  TTSaiMax:=0; TTSaiPrv:=0; TTValAco:=0; TTValDec:=0; TTValOut:=0;
  TTValRea:=0; TotEnt:=0;   TotSai:=0;   TotAco:=0;   TotDec:=0;
  TotOut:=0;

  for Ind:=1 to 12 do
  begin
    TotQtdPrc[Ind] := 0;
    TotValMax[Ind] := 0;
    TotValPrv[Ind] := 0;
    TotValRea[Ind] := 0;
    TotQtdEnt[Ind] := 0;
    TotQtdSai[Ind] := 0;
    TotQtdAco[Ind] := 0;
    TotQtdDec[Ind] := 0;
    TotQtdOut[Ind] := 0;
    TotEntMax[Ind] := 0;
    TotSaiMax[Ind] := 0;
    TotEntPrv[Ind] := 0;
    TotSaiPrv[Ind] := 0;
    TotValAco[Ind] := 0;
    TotValDec[Ind] := 0;
    TotValOut[Ind] := 0;
  end;
end;

procedure TRelProcSint.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Ind, MesAtual, AnoAtual: integer;
  MesStr, PrxMes,AnoStr, PrxAno: string;
begin
  inherited;
  if (PrintBand) then
  begin
    ValMax  := 0;
    ValAtu  := 0;
    ValReal := 0;
    tblObjeto.First;
    while not(tblObjeto.EOF) do
    begin
      ValorReclamado := ValorAtual(tblObjeto.FieldByName('VALORRECL').AsFloat,
        iff(frmSelRelSint.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString='',
            frmSelRelSint.qryProcesso.FieldByName('DATANOTIF').AsString,
            frmSelRelSint.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString),
        frmSelRelSint.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
        frmSelRelSint.qryProcesso.FieldByName('IDREGRA').AsString,
        frmSelRelSint.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
        frmSelRelSint.qryProcesso.FieldByName('INDTAXACONV').AsInteger);

      ValorReal := ValorAtual(tblObjeto.FieldByName('VALORSENTENCA').AsFloat,
        frmSelRelSint.qryProcesso.FieldByName('DATAEFETENC').AsString,
        frmSelRelSint.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
        frmSelRelSint.qryProcesso.FieldByName('IDREGRA').AsString,
        frmSelRelSint.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
        frmSelRelSint.qryProcesso.FieldByName('INDTAXACONV').AsInteger);

      ValAtu  := ValAtu + ValorReclamado -
        ((100 - tblObjeto.FieldByName('PERCPROB').asFloat) * ValorReclamado / 100);

      ValMax  := ValMax  + ValorReclamado;
      ValReal := ValReal + ValorReal;
      tblObjeto.Next;
    end;

    for Ind:=1 to 12 do
    begin
      MesAtual := Ind + frmSelRelSint.cmbMes.ItemIndex + 1;
      AnoAtual := frmSelRelSint.spedAno.Value - 1;

      if (MesAtual > 12) then
      begin
        MesAtual := MesAtual - 12;
        AnoAtual := AnoAtual + 1;
      end;
      MesStr := '0' + IntToStr(MesAtual);
      MesStr := copy(MesStr,length(MesStr)-1,2);
      PrxMes := '0' + IntToStr(MesAtual+1);
      PrxMes := copy(PrxMes,length(PrxMes)-1,2);
      if (PrxMes = '13') then
        PrxMes := '01';

      AnoStr := IntToStr(AnoAtual);
      PrxAno := IntToStr(AnoAtual);
      if (MesAtual = 12) then
        PrxAno := IntToStr(AnoAtual + 1);
        
      if ((frmSelRelSint.qryProcesso.FieldByName('DATANOTIF').IsNull) or
          (frmSelRelSint.qryProcesso.FieldByName('DATANOTIF').Value <
           StrToDate('01/' + PrxMes + '/' + PrxAno)))  and
           //StrToDate('01/' + MesStr + '/' + AnoStr)))  and
         ((frmSelRelSint.qryProcesso.FieldByName('DATAEFETENC').IsNull) or
          (frmSelRelSint.qryProcesso.FieldByName('DATAEFETENC').Value >=
           StrToDate('01/' + PrxMes + '/' + PrxAno)))  then
          //StrToDate('01/' + MesStr + '/' + AnoStr)))  then
      begin
        TotProc := TotProc + 1;
        TotCus  := TotCus + ValMax;
        TotAtu  := TotAtu + ValAtu;
        TotQtdPrc[Ind] := TotQtdPrc[Ind] + 1;
        TotValMax[Ind] := TotValMax[Ind] + ValMax;
        TotValPrv[Ind] := TotValPrv[Ind] + ValAtu;
      end;

      if (not frmSelRelSint.qryProcesso.FieldByName('DATANOTIF').IsNull) and
         (frmSelRelSint.qryProcesso.FieldByName('DATANOTIF').Value >=
          StrToDate('01/' + MesStr + '/' + AnoStr))  and
         (frmSelRelSint.qryProcesso.FieldByName('DATANOTIF').Value <
          StrToDate('01/' + PrxMes + '/' + PrxAno))  then
      begin
        TotEnt    := TotEnt + 1;
        TTEntMax  := TTEntMax + ValMax;
        TTEntPrv  := TTEntPrv + ValAtu;
        TotQtdEnt[Ind] := TotQtdEnt[Ind] + 1;
        TotEntMax[Ind] := TotEntMax[Ind] + ValMax;
        TotEntPrv[Ind] := TotEntPrv[Ind] + ValAtu;
      end;

      if (not frmSelRelSint.qryProcesso.FieldByName('DATAEFETENC').IsNull) and
         (frmSelRelSint.qryProcesso.FieldByName('DATAEFETENC').Value >=
          StrToDate('01/' + MesStr + '/' + AnoStr)) and
         (frmSelRelSint.qryProcesso.FieldByName('DATAEFETENC').Value <
          StrToDate('01/' + PrxMes + '/' + PrxAno)) then
      begin
        TotSai    := TotSai + 1;
        TTSaiMax  := TTSaiMax + ValMax;
        TTSaiPrv  := TTSaiPrv + ValAtu;
        TTValRea  := TTValRea + ValReal;
        TotQtdSai[Ind] := TotQtdSai[Ind] + 1;
        TotSaiMax[Ind] := TotSaiMax[Ind] + ValMax;
        TotSaiPrv[Ind] := TotSaiPrv[Ind] + ValAtu;
        TotValRea[Ind] := TotValRea[Ind] + ValReal;

        if (frmSelRelSint.qryProcesso.FieldByName('TIPOENCER').AsString = 'S') then
        begin   // Sentença
          TotDec    := TotDec + 1;
          TTValDec  := TTValDec + ValReal;
          TotQtdDec[Ind] := TotQtdDec[Ind] + 1;
          TotValDec[Ind] := TotValDec[Ind] + ValReal;
        end
        else
        if (frmSelRelSint.qryProcesso.FieldByName('TIPOENCER').AsString = 'C') then
        begin   // Acordo
          TotAco    := TotAco + 1;
          TTValAco  := TTValAco + ValReal;
          TotQtdAco[Ind] := TotQtdAco[Ind] + 1;
          TotValAco[Ind] := TotValAco[Ind] + ValReal;
        end
        else
        begin   // Outro
          TotOut    := TotOut + 1;
          TTValOut  := TTValOut + ValReal;
          TotQtdOut[Ind] := TotQtdOut[Ind] + 1;
          TotValOut[Ind] := TotValOut[Ind] + ValReal;
        end;
      end;
    end;
  end;
  PrintBand := false;
end;

procedure TRelProcSint.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotProc.Caption  := ''; //IntToStr(TotProc);
  qrlTotCus.Caption   := ''; //FormatFloat('###,##0',TotCus/1000);
  qrlTotAtual.Caption := ''; //FormatFloat('###,##0',TotAtu/1000);

  qrlTotProc1.Caption := IntToStr(TotQtdPrc[1]);
  qrlTotMax1.Caption  := FormatFloat('###,##0',TotValMax[1]/1000);
  qrlTotEst1.Caption  := FormatFloat('###,##0',TotValPrv[1]/1000);

  qrlTotProc2.Caption := IntToStr(TotQtdPrc[2]);
  qrlTotMax2.Caption  := FormatFloat('###,##0',TotValMax[2]/1000);
  qrlTotEst2.Caption  := FormatFloat('###,##0',TotValPrv[2]/1000);

  qrlTotProc3.Caption := IntToStr(TotQtdPrc[3]);
  qrlTotMax3.Caption  := FormatFloat('###,##0',TotValMax[3]/1000);
  qrlTotEst3.Caption  := FormatFloat('###,##0',TotValPrv[3]/1000);

  qrlTotProc4.Caption := IntToStr(TotQtdPrc[4]);
  qrlTotMax4.Caption  := FormatFloat('###,##0',TotValMax[4]/1000);
  qrlTotEst4.Caption  := FormatFloat('###,##0',TotValPrv[4]/1000);

  qrlTotProc5.Caption := IntToStr(TotQtdPrc[5]);
  qrlTotMax5.Caption  := FormatFloat('###,##0',TotValMax[5]/1000);
  qrlTotEst5.Caption  := FormatFloat('###,##0',TotValPrv[5]/1000);

  qrlTotProc6.Caption := IntToStr(TotQtdPrc[6]);
  qrlTotMax6.Caption  := FormatFloat('###,##0',TotValMax[6]/1000);
  qrlTotEst6.Caption  := FormatFloat('###,##0',TotValPrv[6]/1000);

  qrlTotProc7.Caption := IntToStr(TotQtdPrc[7]);
  qrlTotMax7.Caption  := FormatFloat('###,##0',TotValMax[7]/1000);
  qrlTotEst7.Caption  := FormatFloat('###,##0',TotValPrv[7]/1000);

  qrlTotProc8.Caption := IntToStr(TotQtdPrc[8]);
  qrlTotMax8.Caption  := FormatFloat('###,##0',TotValMax[8]/1000);
  qrlTotEst8.Caption  := FormatFloat('###,##0',TotValPrv[8]/1000);

  qrlTotProc9.Caption := IntToStr(TotQtdPrc[9]);
  qrlTotMax9.Caption  := FormatFloat('###,##0',TotValMax[9]/1000);
  qrlTotEst9.Caption  := FormatFloat('###,##0',TotValPrv[9]/1000);

  qrlTotProc10.Caption := IntToStr(TotQtdPrc[10]);
  qrlTotMax10.Caption  := FormatFloat('###,##0',TotValMax[10]/1000);
  qrlTotEst10.Caption  := FormatFloat('###,##0',TotValPrv[10]/1000);

  qrlTotProc11.Caption := IntToStr(TotQtdPrc[11]);
  qrlTotMax11.Caption  := FormatFloat('###,##0',TotValMax[11]/1000);
  qrlTotEst11.Caption  := FormatFloat('###,##0',TotValPrv[11]/1000);

  qrlTotProc12.Caption := IntToStr(TotQtdPrc[12]);
  qrlTotMax12.Caption  := FormatFloat('###,##0',TotValMax[12]/1000);
  qrlTotEst12.Caption  := FormatFloat('###,##0',TotValPrv[12]/1000);

  qrlTotEnt1.Caption := IntToStr(TotQtdEnt[1]);
  qrlEntMax1.Caption := FormatFloat('###,##0',TotEntMax[1]/1000);
  qrlEntEst1.Caption := FormatFloat('###,##0',TotEntPrv[1]/1000);

  qrlTotEnt2.Caption := IntToStr(TotQtdEnt[2]);
  qrlEntMax2.Caption := FormatFloat('###,##0',TotEntMax[2]/1000);
  qrlEntEst2.Caption := FormatFloat('###,##0',TotEntPrv[2]/1000);

  qrlTotEnt3.Caption := IntToStr(TotQtdEnt[3]);
  qrlEntMax3.Caption := FormatFloat('###,##0',TotEntMax[3]/1000);
  qrlEntEst3.Caption := FormatFloat('###,##0',TotEntPrv[3]/1000);

  qrlTotEnt4.Caption := IntToStr(TotQtdEnt[4]);
  qrlEntMax4.Caption := FormatFloat('###,##0',TotEntMax[4]/1000);
  qrlEntEst4.Caption := FormatFloat('###,##0',TotEntPrv[4]/1000);

  qrlTotEnt5.Caption := IntToStr(TotQtdEnt[5]);
  qrlEntMax5.Caption := FormatFloat('###,##0',TotEntMax[5]/1000);
  qrlEntEst5.Caption := FormatFloat('###,##0',TotEntPrv[5]/1000);

  qrlTotEnt6.Caption := IntToStr(TotQtdEnt[6]);
  qrlEntMax6.Caption := FormatFloat('###,##0',TotEntMax[6]/1000);
  qrlEntEst6.Caption := FormatFloat('###,##0',TotEntPrv[6]/1000);

  qrlTotEnt7.Caption := IntToStr(TotQtdEnt[7]);
  qrlEntMax7.Caption := FormatFloat('###,##0',TotEntMax[7]/1000);
  qrlEntEst7.Caption := FormatFloat('###,##0',TotEntPrv[7]/1000);

  qrlTotEnt8.Caption := IntToStr(TotQtdEnt[8]);
  qrlEntMax8.Caption := FormatFloat('###,##0',TotEntMax[8]/1000);
  qrlEntEst8.Caption := FormatFloat('###,##0',TotEntPrv[8]/1000);

  qrlTotEnt9.Caption := IntToStr(TotQtdEnt[9]);
  qrlEntMax9.Caption := FormatFloat('###,##0',TotEntMax[9]/1000);
  qrlEntEst9.Caption := FormatFloat('###,##0',TotEntPrv[9]/1000);

  qrlTotEnt10.Caption := IntToStr(TotQtdEnt[10]);
  qrlEntMax10.Caption := FormatFloat('###,##0',TotEntMax[10]/1000);
  qrlEntEst10.Caption := FormatFloat('###,##0',TotEntPrv[10]/1000);

  qrlTotEnt11.Caption := IntToStr(TotQtdEnt[11]);
  qrlEntMax11.Caption := FormatFloat('###,##0',TotEntMax[11]/1000);
  qrlEntEst11.Caption := FormatFloat('###,##0',TotEntPrv[11]/1000);

  qrlTotEnt12.Caption := IntToStr(TotQtdEnt[12]);
  qrlEntMax12.Caption := FormatFloat('###,##0',TotEntMax[12]/1000);
  qrlEntEst12.Caption := FormatFloat('###,##0',TotEntPrv[12]/1000);

  qrlTotEntT.Caption := IntToStr(TotEnt);
  qrlEntMaxT.Caption := FormatFloat('###,##0',TTEntMax/1000);
  qrlEntEstT.Caption := FormatFloat('###,##0',TTEntPrv/1000);

  qrlTotSai1.Caption := IntToStr(TotQtdSai[1]);
  qrlSaiMax1.Caption := FormatFloat('###,##0',TotSaiMax[1]/1000);
  qrlSaiEst1.Caption := FormatFloat('###,##0',TotSaiPrv[1]/1000);

  qrlTotSai2.Caption := IntToStr(TotQtdSai[2]);
  qrlSaiMax2.Caption := FormatFloat('###,##0',TotSaiMax[2]/1000);
  qrlSaiEst2.Caption := FormatFloat('###,##0',TotSaiPrv[2]/1000);

  qrlTotSai3.Caption := IntToStr(TotQtdSai[3]);
  qrlSaiMax3.Caption := FormatFloat('###,##0',TotSaiMax[3]/1000);
  qrlSaiEst3.Caption := FormatFloat('###,##0',TotSaiPrv[3]/1000);

  qrlTotSai4.Caption := IntToStr(TotQtdSai[4]);
  qrlSaiMax4.Caption := FormatFloat('###,##0',TotSaiMax[4]/1000);
  qrlSaiEst4.Caption := FormatFloat('###,##0',TotSaiPrv[4]/1000);

  qrlTotSai5.Caption := IntToStr(TotQtdSai[5]);
  qrlSaiMax5.Caption := FormatFloat('###,##0',TotSaiMax[5]/1000);
  qrlSaiEst5.Caption := FormatFloat('###,##0',TotSaiPrv[5]/1000);

  qrlTotSai6.Caption := IntToStr(TotQtdSai[6]);
  qrlSaiMax6.Caption := FormatFloat('###,##0',TotSaiMax[6]/1000);
  qrlSaiEst6.Caption := FormatFloat('###,##0',TotSaiPrv[6]/1000);

  qrlTotSai7.Caption := IntToStr(TotQtdSai[7]);
  qrlSaiMax7.Caption := FormatFloat('###,##0',TotSaiMax[7]/1000);
  qrlSaiEst7.Caption := FormatFloat('###,##0',TotSaiPrv[7]/1000);

  qrlTotSai8.Caption := IntToStr(TotQtdSai[8]);
  qrlSaiMax8.Caption := FormatFloat('###,##0',TotSaiMax[8]/1000);
  qrlSaiEst8.Caption := FormatFloat('###,##0',TotSaiPrv[8]/1000);

  qrlTotSai9.Caption := IntToStr(TotQtdSai[9]);
  qrlSaiMax9.Caption := FormatFloat('###,##0',TotSaiMax[9]/1000);
  qrlSaiEst9.Caption := FormatFloat('###,##0',TotSaiPrv[9]/1000);

  qrlTotSai10.Caption := IntToStr(TotQtdSai[10]);
  qrlSaiMax10.Caption := FormatFloat('###,##0',TotSaiMax[10]/1000);
  qrlSaiEst10.Caption := FormatFloat('###,##0',TotSaiPrv[10]/1000);

  qrlTotSai11.Caption := IntToStr(TotQtdSai[11]);
  qrlSaiMax11.Caption := FormatFloat('###,##0',TotSaiMax[11]/1000);
  qrlSaiEst11.Caption := FormatFloat('###,##0',TotSaiPrv[11]/1000);

  qrlTotSai12.Caption := IntToStr(TotQtdSai[12]);
  qrlSaiMax12.Caption := FormatFloat('###,##0',TotSaiMax[12]/1000);
  qrlSaiEst12.Caption := FormatFloat('###,##0',TotSaiPrv[12]/1000);

  qrlTotSaiT.Caption := IntToStr(TotSai);
  qrlSaiMaxT.Caption := FormatFloat('###,##0',TTSaiMax/1000);
  qrlSaiEstT.Caption := FormatFloat('###,##0',TTSaiPrv/1000);

  qrlTotAco1.Caption := IntToStr(TotQtdAco[1]);
  qrlReaAco1.Caption := FormatFloat('###,##0',TotValAco[1]/1000);

  qrlTotAco2.Caption := IntToStr(TotQtdAco[2]);
  qrlReaAco2.Caption := FormatFloat('###,##0',TotValAco[2]/1000);

  qrlTotAco3.Caption := IntToStr(TotQtdAco[3]);
  qrlReaAco3.Caption := FormatFloat('###,##0',TotValAco[3]/1000);

  qrlTotAco4.Caption := IntToStr(TotQtdAco[4]);
  qrlReaAco4.Caption := FormatFloat('###,##0',TotValAco[4]/1000);

  qrlTotAco5.Caption := IntToStr(TotQtdAco[5]);
  qrlReaAco5.Caption := FormatFloat('###,##0',TotValAco[5]/1000);

  qrlTotAco6.Caption := IntToStr(TotQtdAco[6]);
  qrlReaAco6.Caption := FormatFloat('###,##0',TotValAco[6]/1000);

  qrlTotAco7.Caption := IntToStr(TotQtdAco[7]);
  qrlReaAco7.Caption := FormatFloat('###,##0',TotValAco[7]/1000);

  qrlTotAco8.Caption := IntToStr(TotQtdAco[8]);
  qrlReaAco8.Caption := FormatFloat('###,##0',TotValAco[8]/1000);

  qrlTotAco9.Caption := IntToStr(TotQtdAco[9]);
  qrlReaAco9.Caption := FormatFloat('###,##0',TotValAco[9]/1000);

  qrlTotAco10.Caption := IntToStr(TotQtdAco[10]);
  qrlReaAco10.Caption := FormatFloat('###,##0',TotValAco[10]/1000);

  qrlTotAco11.Caption := IntToStr(TotQtdAco[11]);
  qrlReaAco11.Caption := FormatFloat('###,##0',TotValAco[11]/1000);

  qrlTotAco12.Caption := IntToStr(TotQtdAco[12]);
  qrlReaAco12.Caption := FormatFloat('###,##0',TotValAco[12]/1000);

  qrlTotAcoT.Caption := IntToStr(TotAco);
  qrlReaAcoT.Caption := FormatFloat('###,##0',TTValAco/1000);

  qrlTotDec1.Caption := IntToStr(TotQtdDec[1]);
  qrlReaDec1.Caption := FormatFloat('###,##0',TotValDec[1]/1000);

  qrlTotDec2.Caption := IntToStr(TotQtdDec[2]);
  qrlReaDec2.Caption := FormatFloat('###,##0',TotValDec[2]/1000);

  qrlTotDec3.Caption := IntToStr(TotQtdDec[3]);
  qrlReaDec3.Caption := FormatFloat('###,##0',TotValDec[3]/1000);

  qrlTotDec4.Caption := IntToStr(TotQtdDec[4]);
  qrlReaDec4.Caption := FormatFloat('###,##0',TotValDec[4]/1000);

  qrlTotDec5.Caption := IntToStr(TotQtdDec[5]);
  qrlReaDec5.Caption := FormatFloat('###,##0',TotValDec[5]/1000);

  qrlTotDec6.Caption := IntToStr(TotQtdDec[6]);
  qrlReaDec6.Caption := FormatFloat('###,##0',TotValDec[6]/1000);

  qrlTotDec7.Caption := IntToStr(TotQtdDec[7]);
  qrlReaDec7.Caption := FormatFloat('###,##0',TotValDec[7]/1000);

  qrlTotDec8.Caption := IntToStr(TotQtdDec[8]);
  qrlReaDec8.Caption := FormatFloat('###,##0',TotValDec[8]/1000);

  qrlTotDec9.Caption := IntToStr(TotQtdDec[9]);
  qrlReaDec9.Caption := FormatFloat('###,##0',TotValDec[9]/1000);

  qrlTotDec10.Caption := IntToStr(TotQtdDec[10]);
  qrlReaDec10.Caption := FormatFloat('###,##0',TotValDec[10]/1000);

  qrlTotDec11.Caption := IntToStr(TotQtdDec[11]);
  qrlReaDec11.Caption := FormatFloat('###,##0',TotValDec[11]/1000);

  qrlTotDec12.Caption := IntToStr(TotQtdDec[12]);
  qrlReaDec12.Caption := FormatFloat('###,##0',TotValDec[12]/1000);

  qrlTotDecT.Caption := IntToStr(TotDec);
  qrlReaDecT.Caption := FormatFloat('###,##0',TTValDec/1000);

  qrlTotOut1.Caption := IntToStr(TotQtdOut[1]);
  qrlReaOut1.Caption := FormatFloat('###,##0',TotValOut[1]/1000);

  qrlTotOut2.Caption := IntToStr(TotQtdOut[2]);
  qrlReaOut2.Caption := FormatFloat('###,##0',TotValOut[2]/1000);

  qrlTotOut3.Caption := IntToStr(TotQtdOut[3]);
  qrlReaOut3.Caption := FormatFloat('###,##0',TotValOut[3]/1000);

  qrlTotOut4.Caption := IntToStr(TotQtdOut[4]);
  qrlReaOut4.Caption := FormatFloat('###,##0',TotValOut[4]/1000);

  qrlTotOut5.Caption := IntToStr(TotQtdOut[5]);
  qrlReaOut5.Caption := FormatFloat('###,##0',TotValOut[5]/1000);

  qrlTotOut6.Caption := IntToStr(TotQtdOut[6]);
  qrlReaOut6.Caption := FormatFloat('###,##0',TotValOut[6]/1000);

  qrlTotOut7.Caption := IntToStr(TotQtdOut[7]);
  qrlReaOut7.Caption := FormatFloat('###,##0',TotValOut[7]/1000);

  qrlTotOut8.Caption := IntToStr(TotQtdOut[8]);
  qrlReaOut8.Caption := FormatFloat('###,##0',TotValOut[8]/1000);

  qrlTotOut9.Caption := IntToStr(TotQtdOut[9]);
  qrlReaOut9.Caption := FormatFloat('###,##0',TotValOut[9]/1000);

  qrlTotOut10.Caption := IntToStr(TotQtdOut[10]);
  qrlReaOut10.Caption := FormatFloat('###,##0',TotValOut[10]/1000);

  qrlTotOut11.Caption := IntToStr(TotQtdOut[11]);
  qrlReaOut11.Caption := FormatFloat('###,##0',TotValOut[11]/1000);

  qrlTotOut12.Caption := IntToStr(TotQtdOut[12]);
  qrlReaOut12.Caption := FormatFloat('###,##0',TotValOut[12]/1000);

  qrlTotOutT.Caption := IntToStr(TotOut);
  qrlReaOutT.Caption := FormatFloat('###,##0',TTValOut/1000);

  qrlTotRea1.Caption  := FormatFloat('###,##0',TotValRea[1]/1000);
  qrlTotRea2.Caption  := FormatFloat('###,##0',TotValRea[2]/1000);
  qrlTotRea3.Caption  := FormatFloat('###,##0',TotValRea[3]/1000);
  qrlTotRea4.Caption  := FormatFloat('###,##0',TotValRea[4]/1000);
  qrlTotRea5.Caption  := FormatFloat('###,##0',TotValRea[5]/1000);
  qrlTotRea6.Caption  := FormatFloat('###,##0',TotValRea[6]/1000);
  qrlTotRea7.Caption  := FormatFloat('###,##0',TotValRea[7]/1000);
  qrlTotRea8.Caption  := FormatFloat('###,##0',TotValRea[8]/1000);
  qrlTotRea9.Caption  := FormatFloat('###,##0',TotValRea[9]/1000);
  qrlTotRea10.Caption := FormatFloat('###,##0',TotValRea[10]/1000);
  qrlTotRea11.Caption := FormatFloat('###,##0',TotValRea[11]/1000);
  qrlTotRea12.Caption := FormatFloat('###,##0',TotValRea[12]/1000);
  qrlTotReaT.Caption  := FormatFloat('###,##0',TTValRea/1000);

  qrlPerMax1.Caption  := '';    qrlPerEst1.Caption  := '';
  qrlPerMax2.Caption  := '';    qrlPerEst2.Caption  := '';
  qrlPerMax3.Caption  := '';    qrlPerEst3.Caption  := '';
  qrlPerMax4.Caption  := '';    qrlPerEst4.Caption  := '';
  qrlPerMax5.Caption  := '';    qrlPerEst5.Caption  := '';
  qrlPerMax6.Caption  := '';    qrlPerEst6.Caption  := '';
  qrlPerMax7.Caption  := '';    qrlPerEst7.Caption  := '';
  qrlPerMax8.Caption  := '';    qrlPerEst8.Caption  := '';
  qrlPerMax9.Caption  := '';    qrlPerEst9.Caption  := '';
  qrlPerMax10.Caption := '';    qrlPerEst10.Caption := '';
  qrlPerMax11.Caption := '';    qrlPerEst11.Caption := '';
  qrlPerMax12.Caption := '';    qrlPerEst12.Caption := '';
  qrlPerMaxT.Caption  := '';    qrlPerEstT.Caption  := '';

  if TotSaiMax[1] <> 0  then
     qrlPerMax1.Caption  := FormatFloat('###0.00',TotValRea[1]*100/TotSaiMax[1]);
  if TotSaiPrv[1] <> 0  then
     qrlPerEst1.Caption  := FormatFloat('###0.00',TotValRea[1]*100/TotSaiPrv[1]);

  if TotSaiMax[2] <> 0  then
     qrlPerMax2.Caption  := FormatFloat('###0.00',TotValRea[2]*100/TotSaiMax[2]);
  if TotSaiPrv[2] <> 0  then
     qrlPerEst2.Caption  := FormatFloat('###0.00',TotValRea[2]*100/TotSaiPrv[2]);

  if TotSaiMax[3] <> 0  then
     qrlPerMax3.Caption  := FormatFloat('###0.00',TotValRea[3]*100/TotSaiMax[3]);
  if TotSaiPrv[3] <> 0  then
     qrlPerEst3.Caption  := FormatFloat('###0.00',TotValRea[3]*100/TotSaiPrv[3]);

  if TotSaiMax[4] <> 0  then
     qrlPerMax4.Caption  := FormatFloat('###0.00',TotValRea[4]*100/TotSaiMax[4]);
  if TotSaiPrv[4] <> 0  then
     qrlPerEst4.Caption  := FormatFloat('###0.00',TotValRea[4]*100/TotSaiPrv[4]);

  if TotSaiMax[5] <> 0  then
     qrlPerMax5.Caption  := FormatFloat('###0.00',TotValRea[5]*100/TotSaiMax[5]);
  if TotSaiPrv[5] <> 0  then
     qrlPerEst5.Caption  := FormatFloat('###0.00',TotValRea[5]*100/TotSaiPrv[5]);

  if TotSaiMax[6] <> 0  then
     qrlPerMax6.Caption  := FormatFloat('###0.00',TotValRea[6]*100/TotSaiMax[6]);
  if TotSaiPrv[6] <> 0  then
     qrlPerEst6.Caption  := FormatFloat('###0.00',TotValRea[6]*100/TotSaiPrv[6]);

  if TotSaiMax[7] <> 0  then
     qrlPerMax7.Caption  := FormatFloat('###0.00',TotValRea[7]*100/TotSaiMax[7]);
  if TotSaiPrv[7] <> 0  then
     qrlPerEst7.Caption  := FormatFloat('###0.00',TotValRea[7]*100/TotSaiPrv[7]);

  if TotSaiMax[8] <> 0  then
     qrlPerMax8.Caption  := FormatFloat('###0.00',TotValRea[8]*100/TotSaiMax[8]);
  if TotSaiPrv[8] <> 0  then
     qrlPerEst8.Caption  := FormatFloat('###0.00',TotValRea[8]*100/TotSaiPrv[8]);

  if TotSaiMax[9] <> 0  then
     qrlPerMax9.Caption  := FormatFloat('###0.00',TotValRea[9]*100/TotSaiMax[9]);
  if TotSaiPrv[9] <> 0  then
     qrlPerEst9.Caption  := FormatFloat('###0.00',TotValRea[9]*100/TotSaiPrv[9]);

  if TotSaiMax[10] <> 0  then
     qrlPerMax10.Caption  := FormatFloat('###0.00',TotValRea[10]*100/TotSaiMax[10]);
  if TotSaiPrv[10] <> 0  then
     qrlPerEst10.Caption  := FormatFloat('###0.00',TotValRea[10]*100/TotSaiPrv[10]);

  if TotSaiMax[11] <> 0  then
     qrlPerMax11.Caption  := FormatFloat('###0.00',TotValRea[11]*100/TotSaiMax[11]);
  if TotSaiPrv[11] <> 0  then
     qrlPerEst11.Caption  := FormatFloat('###0.00',TotValRea[11]*100/TotSaiPrv[11]);

  if TotSaiMax[12] <> 0  then
     qrlPerMax12.Caption  := FormatFloat('###0.00',TotValRea[12]*100/TotSaiMax[12]);
  if TotSaiPrv[12] <> 0  then
     qrlPerEst12.Caption  := FormatFloat('###0.00',TotValRea[12]*100/TotSaiPrv[12]);

  if TTSaiMax <> 0  then
     qrlPerMaxT.Caption  := FormatFloat('###0.00',TTValRea*100/TTSaiMax);
  if TTSaiPrv <> 0  then
     qrlPerEstT.Caption  := FormatFloat('###0.00',TTValRea*100/TTSaiPrv);

  PrintBand := (TotProc > 0);
end;

end.
