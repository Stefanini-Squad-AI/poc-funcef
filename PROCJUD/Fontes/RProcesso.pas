unit RProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Qrctrls, quickrpt,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, FSairAjuda, IvEMulti,
  QRExport;

type
  TrelProcesso = class(TfrmSairAjuda)
    qr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRSysData3: TQRSysData;
    qrdbNumJCJ: TQRDBText;
    qrlReqLitis: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    qrlVal1: TQRLabel;
    QRLabel7: TQRLabel;
    qrlSit: TQRLabel;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    qrlCustoTotal: TQRLabel;
    qrlTotProc: TQRLabel;
    qrlTotCus: TQRLabel;
    qrlVal3: TQRLabel;
    qrlCustoAtual: TQRLabel;
    qrlTotAtual: TQRLabel;
    qrlCustoMax: TQRLabel;
    ds2: TwwDataSource;
    qrlTitReal: TQRLabel;
    qrlValorReal: TQRLabel;
    qrlTotReal: TQRLabel;
    qrlTitEcon2: TQRLabel;
    qrlEconomia2: TQRLabel;
    qrlTotEcon2: TQRLabel;
    qrlTitEcon1: TQRLabel;
    qrlEconomia1: TQRLabel;
    qrlTotEcon1: TQRLabel;
    qrlSig4: TQRLabel;
    qrlSig5: TQRLabel;
    QRLabel10: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrlVal4: TQRLabel;
    qrlVal2: TQRLabel;
    QRLabel16: TQRLabel;
    qrdbUF: TQRDBText;
    qryEtapa: TwwQuery;
    qryEtapaNUMSEQ: TFloatField;
    qryEtapaETAPA: TStringField;
    qryEtapaDATAREALOCOR: TDateTimeField;
    qryEtapaASSUNTO: TStringField;
    qryEtapaVALORHONOR: TFloatField;
    qryEtapaNUMPROCTRAB: TFloatField;
    qryEtapaCODTIPORECURSO: TFloatField;
    qryEtapaVALORREC: TFloatField;
    qryEtapaOBSERVETAPA: TMemoField;
    qryEtapaIDIMAGEM: TFloatField;
    qrlAtiva: TQRLabel;
    qryUnidade: TwwQuery;
    qrsbLitis: TQRSubDetail;
    QRDBText9: TQRDBText;
    qrdbSitLitis: TQRDBText;
    qryLitis: TwwQuery;
    qrsdEtapa: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrchObserv: TQRChildBand;
    QRDBText8: TQRDBText;
    qryObjeto: TwwQuery;
    qrsdObjeto: TQRSubDetail;
    QRDBText12: TQRDBText;
    qrlCustoMaxObj: TQRLabel;
    qrlCustoAtualObj: TQRLabel;
    qrlValorRealObj: TQRLabel;
    qrlEconomia1Obj: TQRLabel;
    qrlEconomia2Obj: TQRLabel;
    qrlNumVara: TQRLabel;
    qrlVaraJust: TQRLabel;
    qrdbVaraJust: TQRDBText;
    qrdbNumJust: TQRDBText;
    qrCabLitis: TQRBand;
    QRLabel1: TQRLabel;
    qrlSitLitis: TQRLabel;
    qrCabEtapa: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    qrCabObjeto: TQRBand;
    QRLabel11: TQRLabel;
    QRTextFilter: TQRTextFilter;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsdEtapaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrAfterPreview(Sender: TObject);
    procedure qrsdObjetoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relProcesso: TrelProcesso;
  TotProc, TAM : Integer;
  TotCus, TotAtu, TotReal, TotProv, TotMax, ValAtu, ValMax, ValReal : Double;
  ValorReclamado, ValorReal, PercRateio : Double;
  ApuraRateio : Boolean;
  CharCod : Variant;
  CharMax : Variant;
  CharPrv : Variant;
  CharRea : Variant;
  CharNom : Variant;
  FormatFloat1, FormatFloat2 : String;

implementation

uses USistema, UValorAtual, FSelRelProc2, FSelRelProc, RResumoProc,
  uFuncoesUteisRH;

{$R *.DFM}
Const
  arrSit   : array[0..1] of String[3] = ('Abr','Enc');
  arrAtiva : array[0..1] of String[7] = ('Passiva','Ativa');

procedure TrelProcesso.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  TotProc := TotProc + 1;
  qrlValorReal.Caption  := '';
  qrlEconomia1.Caption  := '';
  qrlEconomia2.Caption  := '';
  qrlCustoMax.Caption   := '';
  qrlCustoAtual.Caption := '';
  qrlSit.Caption := arrSit[frmSelRelProc2.qryProcesso.FieldByName('FLGSITPROC').AsInteger];
  if  (PrintBand) and (frmSelRelProc.rgOpcao.ItemIndex = 0)  then  begin
      ValMax  := 0;
      ValAtu  := 0;
      ValReal := 0;
      qryObjeto.First;
      While Not qryObjeto.Eof Do Begin
            ValorReclamado := ValorAtual(qryObjeto.FieldByName('VALORRECL').AsFloat,
                               frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('IDREGRA').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);
            ValorReal      := ValorAtual(qryObjeto.FieldByName('VALORSENTENCA').AsFloat,
                               frmSelRelProc2.qryProcesso.FieldByName('DATAEFETENC').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('IDREGRA').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);

            ValAtu  := ValAtu +
                       ValorReclamado -
                       ((100 - qryObjeto.FieldByName('PERCPROB').AsFloat) *
                         ValorReclamado / 100);
            ValMax  := ValMax  +  ValorReclamado;
            ValReal := ValReal +  ValorReal;
            qryObjeto.Next;
      end;
      qryObjeto.First;

      TotCus := TotCus + ValMax;
      qrlCustoMax.Caption   := FormatFloat(FormatFloat1,ValMax);
      qrlCustoAtual.Caption := FormatFloat(FormatFloat1,ValAtu);
      TotAtu := TotAtu + ValAtu;
      if frmSelRelProc2.qryProcesso.FieldByName('FLGSITPROC').Value = 1 then begin
         qrlValorReal.Caption  := FormatFloat(FormatFloat1,ValReal);
         qrlEconomia1.Caption   := FormatFloat(FormatFloat1,ValMax - ValReal);
         qrlEconomia2.Caption   := FormatFloat(FormatFloat1,ValAtu - ValReal);
         TotProv := TotProv + ValAtu;
         TotMax  := TotMax  + ValMax;
         TotReal := TotReal + ValReal;
      end;
  end;


  if frmSelRelProc.rgResumo.ItemIndex = 0  then
  begin
     if not frmSelRelProc.qryResumo.Active then frmSelRelProc.qryResumo.Open;
     // DAR O LOCATE E INSERIR/ATUALIZAR A QRYRESUMO
     if not frmSelRelProc.qryResumo.Locate('IDESTADO',
                     frmSelRelProc2.qryProcesso.FieldByName('IDESTADO').AsInteger,[]) then
     begin
         frmSelRelProc.qryResumo.Insert;
         frmSelRelProc.qryResumo.FieldByName('IDESTADO').AsInteger :=
                       frmSelRelProc2.qryProcesso.FieldByName('IDESTADO').AsInteger;
         frmSelRelProc.qryResumo.FieldByName('NOME').AsString :=
                       qryUnidade.FieldByName('NOME').AsString;
     end
     else frmSelRelProc.qryResumo.Edit;
     frmSelRelProc.qryResumo.FieldByName('QTDPROC').AsInteger :=
                   frmSelRelProc.qryResumo.FieldByName('QTDPROC').AsInteger + 1;
     frmSelRelProc.qryResumo.FieldByName('VALRECLAMADO').AsFloat :=
                   frmSelRelProc.qryResumo.FieldByName('VALRECLAMADO').AsFloat + ValMax;
     frmSelRelProc.qryResumo.FieldByName('VALESTIMADO').AsFloat :=
                   frmSelRelProc.qryResumo.FieldByName('VALESTIMADO').AsFloat + ValAtu;
     frmSelRelProc.qryResumo.FieldByName('VALREAL').AsFloat :=
                   frmSelRelProc.qryResumo.FieldByName('VALREAL').AsFloat + ValReal;
     frmSelRelProc.qryResumo.FieldByName('ECONRECLAMADO').AsFloat :=
                   frmSelRelProc.qryResumo.FieldByName('ECONRECLAMADO').AsFloat +
                   StringToFloat(qrlEconomia1.Caption);
     frmSelRelProc.qryResumo.FieldByName('ECONESTIMADO').AsFloat :=
                   frmSelRelProc.qryResumo.FieldByName('ECONESTIMADO').AsFloat +
                   StringToFloat(qrlEconomia2.Caption);
  end;

end;

procedure TrelProcesso.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlTotProc.Caption  := IntToStr(TotProc);
  qrlTotCus.Caption   := FormatFloat(FormatFloat2,TotCus);
  qrlTotAtual.Caption := FormatFloat(FormatFloat2,TotAtu);
  qrlTotReal.Caption  := '';
  qrlTotEcon1.Caption := '';
  qrlTotEcon2.Caption := '';
  if  (TotProv <> 0) or (TotReal <> 0)  then begin
      qrlTotReal.Caption  := FormatFloat(FormatFloat2,TotReal);
      qrlTotEcon1.Caption  := FormatFloat(FormatFloat2,TotMax  - TotReal);
      qrlTotEcon2.Caption  := FormatFloat(FormatFloat2,TotProv - TotReal);
  end;

  PrintBand := TotProc > 0;
end;

procedure TrelProcesso.FormCreate(Sender: TObject);
var
  msg : String;
begin
  inherited;
  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';

  if (frmSelRelProc.rgLitis.ItemIndex  < 2) or
     (frmSelRelProc.rgEtapa.ItemIndex  = 0) or
     (frmSelRelProc.rgObjeto.ItemIndex = 0) then
     DetailBand1.Color := clSilver;

  qrlVaraJust.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex > 0);
  qrlNumVara.Enabled    := (frmSelRelProc.rgOpcao.ItemIndex > 0);
  qrdbVaraJust.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex > 0);
  qrdbNumJust.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex > 0);

  qrlVal1.Enabled       := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlVal2.Enabled       := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlVal3.Enabled       := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlVal4.Enabled       := (frmSelRelProc.rgOpcao.ItemIndex = 0);

  qrlCustoMax.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlCustoAtual.Enabled := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlValorReal.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlEconomia1.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlEconomia2.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);

  qrlCustoTotal.Enabled := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTotCus.Enabled     := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTotAtual.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTotReal.Enabled    := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTotEcon1.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTotEcon2.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex = 0);

  qrlCustoMaxObj.Enabled   := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlCustoAtualObj.Enabled := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlValorRealObj.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlEconomia1Obj.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlEconomia2Obj.Enabled  := (frmSelRelProc.rgOpcao.ItemIndex = 0);

  qrlSig4.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0) and (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlSig5.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0) and (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTitEcon1.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0) and (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTitEcon2.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0) and (frmSelRelProc.rgOpcao.ItemIndex = 0);
  qrlTitReal.Enabled  := (frmSelRelProc2.rgSitProc.ItemIndex > 0) and (frmSelRelProc.rgOpcao.ItemIndex = 0);

  if frmSelRelProc.rgResumo.ItemIndex = 0  then
  begin
     if not frmSelRelProc.qryResumo.Active  then frmSelRelProc.qryResumo.Open;
     if not frmSelRelProc.qryResumo.IsEmpty then frmSelRelProc.qryResumo.CancelUpdates;
     qryUnidade.Close;
     qryUnidade.Open;
  end;

  if (frmSelRelProc.rgLitis.ItemIndex < 2) then
  begin
     qrlReqLitis.Caption := qrlReqLitis.Caption + ' e Litisconsortes';
     qryLitis.Open;
     qrsbLitis.Enabled := True;
     if (frmSelRelProc.rgLitis.ItemIndex = 1) then
     begin
        qrdbSitLitis.Enabled := False;
        qrlSitLitis.Enabled  := False;
     end;
  end
  else
     qrsbLitis.Enabled := False;

  if (frmSelRelProc.rgCabRod.ItemIndex = 0) then
  begin
     FormatFloat1 := '###,###,##0';
     FormatFloat2 := '#,###,###,##0'
  end
  else
  begin
     FormatFloat1 := '########0';
     FormatFloat2 := '#########0'
  end;
  PageHeaderBand1.Enabled   := (frmSelRelProc.rgCabRod.ItemIndex = 0);
  ColumnHeaderBand1.Enabled := (frmSelRelProc.rgCabRod.ItemIndex = 0);
  QRBand1.Enabled           := (frmSelRelProc.rgCabRod.ItemIndex = 0);
  PageFooterBand1.Enabled   := (frmSelRelProc.rgCabRod.ItemIndex = 0);

  qrsdEtapa.Enabled  := (frmSelRelProc.rgEtapa.ItemIndex <> 1);
  qrchObserv.Enabled := (frmSelRelProc.rgEtapa.ItemIndex <> 1) and
                        (frmSelRelProc.rgObserv.ItemIndex = 0);
  if (frmSelRelProc.rgEtapa.ItemIndex <> 1) then  qryEtapa.Open;

  qrsdObjeto.Enabled  := (frmSelRelProc.rgObjeto.ItemIndex <> 1);
  if (frmSelRelProc.rgObjeto.ItemIndex <> 1) or (frmSelRelProc.rgOpcao.ItemIndex = 0)then
     qryObjeto.Open;

  msg := qr.ReportTitle;
  qr.Visible := False;
  if not InputQuery('Título do Relatório','Confirme ou Altere :',msg) then
    exit;
  qr.ReportTitle := msg;
  //ModalResult := mrNone;
  qr.Visible := False;
  if not Imprime
  then  qr.Preview
  else  qr.Print;
  bbtnSairClick(Self);
end;

procedure TrelProcesso.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if (frmSelRelProc.rgResumo.ItemIndex = 0) then
  begin
    if not(frmSelRelProc.qryResumo.Active) then
      frmSelRelProc.qryResumo.Open;

    if not(frmSelRelProc.qryResumo.IsEmpty) then
      frmSelRelProc.qryResumo.CancelUpdates;
  end;
  TotProc := 0;
  TotCus  := 0;
  TotAtu  := 0;
  TotReal := 0;
  TotProv := 0;
  TotMax  := 0;
end;

procedure TrelProcesso.qrsdEtapaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Ind: integer;
begin
  qrchObserv.Enabled := (frmSelRelProc.rgEtapa.ItemIndex <> 1) and
                        (frmSelRelProc.rgObserv.ItemIndex = 0);

  if (frmSelRelProc.rgEtapa.ItemIndex = 2) then
  begin
    PrintBand          := false;
    qrchObserv.Enabled := false;

    if (frmSelRelProc2.lstEtapa.Items.Count > 0) then
      for Ind:=0 to frmSelRelProc2.lstEtapa.Items.Count-1 do
        if (frmSelRelProc2.lstCodEtapa.Items[Ind] =
            qryEtapa.FieldByName('CODTIPORECURSO').AsString) then
        begin
          PrintBand          := true;
          qrchObserv.Enabled := true;
        end;
  end;
end;

procedure TrelProcesso.qrAfterPreview(Sender: TObject);
begin
  if (TotProc = 0) then exit; 
  inherited;
  if (frmSelRelProc.rgResumo.ItemIndex = 0) then
  begin
    with TrelResumoProc.Create(Application) do
      Free;

    Self.WindowState           := wsNormal;
    frmSelRelProc2.WindowState := wsNormal;
    frmSelRelProc.WindowState  := wsNormal;
  end;
end;

procedure TrelProcesso.qrsdObjetoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Ind: integer;
  ValTemp1,ValTemp2,ValTemp3 : Double;
begin
  qrlValorRealObj.Caption  := '';
  qrlEconomia1Obj.Caption  := '';
  qrlEconomia2Obj.Caption  := '';
  if (frmSelRelProc.rgObjeto.ItemIndex <> 1) and (frmSelRelProc.rgOpcao.ItemIndex = 0) then
  begin
      ValTemp1 := ValorAtual(qryObjeto.FieldByName('VALORRECL').AsFloat,
                               frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('IDREGRA').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);
      ValTemp2 := ValTemp1 * qryObjeto.FieldByName('PERCPROB').AsFloat / 100;
      qrlCustoMaxObj.Caption   := FormatFloat(FormatFloat1,ValTemp1);
      qrlCustoAtualObj.Caption := FormatFloat(FormatFloat1,ValTemp2);
      if frmSelRelProc2.qryProcesso.FieldByName('FLGSITPROC').Value = 1 then begin
         ValTemp3 := ValorAtual(qryObjeto.FieldByName('VALORSENTENCA').AsFloat,
                               frmSelRelProc2.qryProcesso.FieldByName('DATAEFETENC').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('IDREGRA').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                               frmSelRelProc2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);
         qrlValorRealObj.Caption   := FormatFloat(FormatFloat1,ValTemp3);
         qrlEconomia1Obj.Caption   := FormatFloat(FormatFloat1,ValTemp1 - ValTemp3);
         qrlEconomia2Obj.Caption   := FormatFloat(FormatFloat1,ValTemp2 - ValTemp3);
      end;
  end;

  if (frmSelRelProc.rgObjeto.ItemIndex = 2) then
  begin
    PrintBand          := false;
    if (frmSelRelProc2.lstObjeto.Items.Count > 0) then
      for Ind:=0 to frmSelRelProc2.lstObjeto.Items.Count-1 do
        if (frmSelRelProc2.lstCodObjeto.Items[Ind] =
            qryObjeto.FieldByName('CODTIPOOBJETO').AsString) then
          PrintBand          := true;
  end;
end;

procedure TrelProcesso.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  qrCabLitis.Enabled := (frmSelRelProc.rgLitis.ItemIndex < 2) and (not qryLitis.Eof);
  qrCabEtapa.Enabled := (frmSelRelProc.rgEtapa.ItemIndex = 0) and (not qryEtapa.Eof);
  qrCabObjeto.Enabled := (frmSelRelProc.rgObjeto.ItemIndex = 0) and (not qryObjeto.Eof);
end;

end.
