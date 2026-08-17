unit rProcesso2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables, Wwtable, Wwdatsrc, Wwquery,
  QRExport;

type
  TrelProcesso2 = class(TForm)
    qryUnidade: TwwQuery;
    ds2: TwwDataSource;
    qryTotRateio: TwwQuery;
    qryRateio: TwwQuery;
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
    qr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblIdent: TQRLabel;
    PageHeaderBand1: TQRBand;
    qrlblNomeCli: TQRLabel;
    QRSysData3: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    qrlTitReal: TQRLabel;
    qrlTitEcon2: TQRLabel;
    qrlTitEcon1: TQRLabel;
    qrlSig4: TQRLabel;
    qrlSig5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    qrLabelMaxOrig: TQRLabel;
    DetailBand1: TQRBand;
    qrdbNumJCJ: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrlCustoAtual: TQRLabel;
    qrlCustoEnc: TQRLabel;
    qrlValorReal: TQRLabel;
    qrlEconomia2: TQRLabel;
    qrlRiscoTot: TQRLabel;
    QRDBText1: TQRDBText;
    qrlTipoEncer: TQRLabel;
    qrlCustoOrig: TQRLabel;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlTotProc: TQRLabel;
    qrlTotEnc: TQRLabel;
    qrlTotAtual: TQRLabel;
    qrlTotReal: TQRLabel;
    qrlTotEcon2: TQRLabel;
    qrlTotRisTot: TQRLabel;
    qrlRatPrv1: TQRLabel;
    qrlRatRea1: TQRLabel;
    qrlRatPrv2: TQRLabel;
    qrlRatRea2: TQRLabel;
    qrlRatPrv3: TQRLabel;
    qrlRatRea3: TQRLabel;
    qrlRatPrv4: TQRLabel;
    qrlRatRea4: TQRLabel;
    qrlRatNome1: TQRLabel;
    qrlRatNome2: TQRLabel;
    qrlRatNome3: TQRLabel;
    qrlRatNome4: TQRLabel;
    QRLabel2: TQRLabel;
    qrlTotOrig: TQRLabel;
    qrRateioIndiv: TQRChildBand;
    qrlRatIndPrv: TQRLabel;
    qrlRatIndRea: TQRLabel;
    QRLabel11: TQRLabel;
    qrlNomeEmpr: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrbCargo: TQRChildBand;
    QRDBText4: TQRDBText;
    qryObjeto: TwwQuery;
    qryLitis: TwwQuery;
    qrCabLitis: TQRBand;
    QRLabel21: TQRLabel;
    qrlSitLitis: TQRLabel;
    qrsbLitis: TQRSubDetail;
    QRDBText9: TQRDBText;
    qrdbSitLitis: TQRDBText;
    qrCabEtapa: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrsdEtapa: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrchObserv: TQRChildBand;
    QRDBText8: TQRDBText;
    qrCabObjeto: TQRBand;
    QRLabel19: TQRLabel;
    qrsdObjeto: TQRSubDetail;
    QRDBText12: TQRDBText;
    qrlCustoMaxObj: TQRLabel;
    qrlCustoAtualObj: TQRLabel;
    qrlValorRealObj: TQRLabel;
    qrlEconomia1Obj: TQRLabel;
    qrlEconomia2Obj: TQRLabel;
    QRTextFilter: TQRTextFilter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrsdEtapaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrAfterPreview(Sender: TObject);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdObjetoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relProcesso2: TrelProcesso2;
  TotProc, TAM: integer;
  TotCus, TotAtu, TotReal, TotProv, TotEnc, ValAtu, ValEnc, ValReal, ValMax,
  ValorReclamado, ValorReal, PercRateio: double;
  ApuraRateio: boolean;
  CharCod, CharMax, CharPrv, CharRea, CharNom : variant;
  FormatFloat1, FormatFloat2: string;

implementation

uses uSistema, uValorAtual, fSelRelProc2, fSelRelProc, rResumoProc, uFuncoesUteis;

{$R *.DFM}

const
  arrSit : array[0..1] of String[9] = ('Abr','Enc');

procedure TrelProcesso2.FormCreate(Sender: TObject);
var
  msg: string;
begin
  inherited;
  qrLabelMaxOrig.Caption := 'Máximo';
  if (frmSelRelProc.rgRisco.ItemIndex = 1) then
    qrLabelMaxOrig.Caption := 'Original';

  if frmSelRelProc.rgResumo.ItemIndex = 0  then
  begin
    if not(frmSelRelProc.qryResumo.Active) then
      frmSelRelProc.qryResumo.Open;

    if not(frmSelRelProc.qryResumo.IsEmpty) then
      frmSelRelProc.qryResumo.CancelUpdates;
  end;

  qrlblNomeCli.Caption := Sistema.NomeEmpresa;
  qrlblIdent.Caption   := Sistema.NomeModulo + ' v 1.0 ';
  qryObjeto.Open;
  qrlSig4.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0);
  qrlSig5.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0);
//  qrlTitEcon1.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0);
  qrlTitEcon2.Enabled := (frmSelRelProc2.rgSitProc.ItemIndex > 0);
  qrlTitReal.Enabled  := (frmSelRelProc2.rgSitProc.ItemIndex > 0);
  qryTotRateio.Close;
  qryTotRateio.Open;
  ApuraRateio := (not qryTotRateio.Eof) and (frmSelRelProc.rgRateio.ItemIndex = 0);
  qryUnidade.Close;
  qryUnidade.Open;
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
  qrbCargo.Enabled := (frmSelRelProc.rgCargo.ItemIndex = 0);
  qrsdEtapa.Enabled  := (frmSelRelProc.rgEtapa.ItemIndex <> 1);
  qrchObserv.Enabled := (frmSelRelProc.rgEtapa.ItemIndex <> 1) and
                        (frmSelRelProc.rgObserv.ItemIndex = 0);
  if (frmSelRelProc.rgEtapa.ItemIndex <> 1) then  qryEtapa.Open;

  if (frmSelRelProc.rgLitis.ItemIndex < 2) then
  begin
     qryLitis.Open;
     qrsbLitis.Enabled  := True;
     qrCabLitis.Enabled := True;
     if (frmSelRelProc.rgLitis.ItemIndex = 1) then
     begin
        qrdbSitLitis.Enabled := False;
        qrlSitLitis.Enabled  := False;
     end;
  end
  else
  begin
     qrsbLitis.Enabled  := False;
     qrCabLitis.Enabled := False;
  end;

  msg := qr.ReportTitle;
  qr.Visible := False;
  if not InputQuery('Título do Relatório','Confirme ou Altere :',msg) then
    exit;
  qr.ReportTitle := msg;
  //ModalResult := mrNone;
  qr.Visible := False;
  if not(Imprime2) then
    qr.Preview
  else
    qr.Print;

  Close;
end;

procedure TrelProcesso2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TrelProcesso2.qrBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  Ind: integer;
begin
  inherited;
  if frmSelRelProc.rgResumo.ItemIndex = 0  then
  begin
     if not frmSelRelProc.qryResumo.Active  then frmSelRelProc.qryResumo.Open;
     if not frmSelRelProc.qryResumo.IsEmpty then frmSelRelProc.qryResumo.CancelUpdates;
  end;

  TotProc := 0;
  TotEnc  := 0;
  TotAtu  := 0;
  TotCus  := 0;
  TotReal := 0;
  TotProv := 0;
//  TotMax  := 0;
  if  ApuraRateio  then begin
      Ind := 1;
      TAM := qryTotRateio.RecordCount;
      CharCod := VarArrayCreate([1, TAM], varInteger);
      CharNom := VarArrayCreate([1, TAM], varVariant);
//      CharMax := VarArrayCreate([1, TAM], varDouble);
      CharPrv := VarArrayCreate([1, TAM], varDouble);
      CharRea := VarArrayCreate([1, TAM], varDouble);
      qryTotRateio.First;
      while not qryTotRateio.Eof  do begin
         CharCod[Ind] := qryTotRateio.FieldByName('IDPESSOA').AsInteger;
         CharNom[Ind] := qryTotRateio.FieldByName('NOME').AsString;
//         CharMax[Ind] := 0;
         CharPrv[Ind] := 0;
         CharRea[Ind] := 0;
         qryTotRateio.Next;
         inc(Ind);
      end;
      qryTotRateio.First;
      qryRateio.Close;
      qryRateio.Open;
  end;
end;

procedure TrelProcesso2.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Ind : Integer;
  DataDemissao, DataAdm : TDate;
  ImprimeRateio : Boolean;
begin
  inherited;
  ImprimeRateio := False;
  if  PrintBand  then  begin
      ValEnc  := 0;
      ValAtu  := 0;
      ValReal := 0;
      ValMax  := 0;

      qryObjeto.First;
      While Not qryObjeto.Eof Do Begin
            ValorReclamado := ValorAtual(qryObjeto.FieldByName('VALORRECL').AsFloat,
                               iff(frmSelRelProc2.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString='',
                                   frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').AsString,
                                   frmSelRelProc2.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString),
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

      ValEnc := ValAtu * PercEnc / 100;
      qrlValorReal.Caption  := '';
      qrlEconomia2.Caption  := '';
      qrlTipoEncer.Caption  := 'Não Identificado';
      if frmSelRelProc2.qryProcesso.FieldByName('TIPOENCER').AsString = 'A' then
         qrlTipoEncer.Caption := 'Arquivamento'
      else if frmSelRelProc2.qryProcesso.FieldByName('TIPOENCER').AsString = 'C' then
         qrlTipoEncer.Caption := 'Acordo'
      else if frmSelRelProc2.qryProcesso.FieldByName('TIPOENCER').AsString = 'D' then
         qrlTipoEncer.Caption := 'Desistência'
      else if frmSelRelProc2.qryProcesso.FieldByName('TIPOENCER').AsString = 'S' then
         qrlTipoEncer.Caption := 'Sentença';
      TotProc := TotProc + 1;
      TotEnc  := TotEnc + ValEnc;
      qrlCustoEnc.Caption   := FormatFloat(FormatFloat1,ValEnc);
      qrlCustoAtual.Caption := FormatFloat(FormatFloat1,ValAtu);
      qrlCustoOrig.Caption  := FormatFloat(FormatFloat1,ValMax);
      qrlRiscoTot.Caption   := FormatFloat(FormatFloat1,ValAtu + ValEnc);
      TotAtu := TotAtu + ValAtu;
      TotCus := TotCus + ValMax;
      if frmSelRelProc2.qryProcesso.FieldByName('FLGSITPROC').Value = 1 then begin
         qrlValorReal.Caption  := FormatFloat(FormatFloat1,ValReal);
         qrlEconomia2.Caption   := FormatFloat(FormatFloat1,ValAtu + ValEnc - ValReal);
         TotProv := TotProv + ValAtu;
         TotReal := TotReal + ValReal;
      end;
      if  (ApuraRateio) and (qryRateio.Locate('IDFILIALPESSOA',
                             frmSelRelProc2.qryProcesso.FieldByName('IDESTAB').Value, []))  then begin

          if  (frmSelRelProc2.qryProcesso.FieldByName('TIPOSIT').Value = 'D') and
              (frmSelRelProc2.qryProcesso.FieldByName('DATADESLIGAMENTO').Value) <> Null
          then
              DataDemissao := frmSelRelProc2.qryProcesso.FieldByName('DATADESLIGAMENTO').Value
          else
              DataDemissao := Date;

          if  (frmSelRelProc2.qryProcesso.FieldByName('DATAADMISSAO').Value) <> Null
          then
              DataAdm := frmSelRelProc2.qryProcesso.FieldByName('DATAADMISSAO').Value
          else
              DataAdm := Date - 365*20;

          if qryRateio.FieldByName('TIPORATEIO').AsInteger = 1  then begin
             PercRateio := RateioCusto(0,
                     DataAdm,
                     DataDemissao,
                     frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').Value,
                     qryRateio.FieldByName('IDFILIALPESSOA').AsInteger,
                     qryRateio.FieldByName('IDPESSOA').AsInteger,
                     qryRateio.FieldByName('DATABASE').Value,
                     qryRateio.FieldByName('TIPORATEIO').AsInteger,
                     qryRateio.FieldByName('PERIODO').AsInteger,
                     qryRateio.FieldByName('PERCENT1').AsFloat,
                     qryRateio.FieldByName('VALORBASE1').AsFloat,
                     qryRateio.FieldByName('PERCENT2').AsFloat,
                     qryRateio.FieldByName('VALORBASE2').AsFloat,
                     qryRateio.FieldByName('PERCENT3').AsFloat,
                     qryRateio.FieldByName('VALORBASE3').AsFloat,
                     qryRateio.FieldByName('PERCENT4').AsFloat,
                     qryRateio.FieldByName('VALORBASE4').AsFloat,
                     qryRateio.FieldByName('PERCENT5').AsFloat,
                     qryRateio.FieldByName('VALORBASE5').AsFloat);
             if  PercRateio > 0  then
                 for Ind := 1 to TAM do
                     if CharCod[Ind] = qryRateio.FieldByName('IDPESSOA').AsInteger then begin
//                        CharMax[Ind] := CharMax[Ind] + ValMax  * PercRateio / 100;
                        CharPrv[Ind] := CharPrv[Ind] + ValAtu  * PercRateio / 100;
                        CharRea[Ind] := CharRea[Ind] + ValReal * PercRateio / 100;

                        qrlNomeEmpr.Caption := CharNom[Ind];
                        //qrlRatIndMax.Caption   := FormatFloat(FormatFloat2,ValMax  * PercRateio / 100);
                        qrlRatIndPrv.Caption   := FormatFloat(FormatFloat2,ValAtu  * PercRateio / 100);
                        qrlRatIndRea.Caption   := FormatFloat(FormatFloat2,ValReal  * PercRateio / 100);
                        ImprimeRateio := True;
                     end;
          end
          else begin
{             PercRateio := RateioCusto(ValMax,
                     DataAdm,
                     DataDemissao,
                     frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').Value,
                     qryRateio.FieldByName('IDFILIALPESSOA').AsInteger,
                     qryRateio.FieldByName('IDPESSOA').AsInteger,
                     qryRateio.FieldByName('DATABASE').Value,
                     qryRateio.FieldByName('TIPORATEIO').AsInteger,
                     qryRateio.FieldByName('PERIODO').AsInteger,
                     qryRateio.FieldByName('PERCENT1').AsFloat,
                     qryRateio.FieldByName('VALORBASE1').AsFloat,
                     qryRateio.FieldByName('PERCENT2').AsFloat,
                     qryRateio.FieldByName('VALORBASE2').AsFloat,
                     qryRateio.FieldByName('PERCENT3').AsFloat,
                     qryRateio.FieldByName('VALORBASE3').AsFloat,
                     qryRateio.FieldByName('PERCENT4').AsFloat,
                     qryRateio.FieldByName('VALORBASE4').AsFloat,
                     qryRateio.FieldByName('PERCENT5').AsFloat,
                     qryRateio.FieldByName('VALORBASE5').AsFloat);
             if  PercRateio > 0  then
                 for Ind := 1 to TAM do
                     if CharCod[Ind] = qryRateio.FieldByName('IDPESSOA').AsInteger then begin
                        CharMax[Ind] := CharMax[Ind] + PercRateio;

                        qrlNomeEmpr.Caption := CharNom[Ind];
                        qrlRatIndMax.Caption   := FormatFloat(FormatFloat2,PercRateio);
                        ImprimeRateio := True;
                     end;
}


             PercRateio := RateioCusto(ValAtu,
                     DataAdm,
                     DataDemissao,
                     frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').Value,
                     qryRateio.FieldByName('IDFILIALPESSOA').AsInteger,
                     qryRateio.FieldByName('IDPESSOA').AsInteger,
                     qryRateio.FieldByName('DATABASE').Value,
                     qryRateio.FieldByName('TIPORATEIO').AsInteger,
                     qryRateio.FieldByName('PERIODO').AsInteger,
                     qryRateio.FieldByName('PERCENT1').AsFloat,
                     qryRateio.FieldByName('VALORBASE1').AsFloat,
                     qryRateio.FieldByName('PERCENT2').AsFloat,
                     qryRateio.FieldByName('VALORBASE2').AsFloat,
                     qryRateio.FieldByName('PERCENT3').AsFloat,
                     qryRateio.FieldByName('VALORBASE3').AsFloat,
                     qryRateio.FieldByName('PERCENT4').AsFloat,
                     qryRateio.FieldByName('VALORBASE4').AsFloat,
                     qryRateio.FieldByName('PERCENT5').AsFloat,
                     qryRateio.FieldByName('VALORBASE5').AsFloat);
             if  PercRateio > 0  then
                 for Ind := 1 to TAM do
                     if CharCod[Ind] = qryRateio.FieldByName('IDPESSOA').AsInteger then begin
                        CharPrv[Ind] := CharPrv[Ind] + PercRateio;
                        qrlNomeEmpr.Caption := CharNom[Ind];
                        qrlRatIndPrv.Caption   := FormatFloat(FormatFloat2,PercRateio);
                        ImprimeRateio := True;
                     end;

             PercRateio := RateioCusto(ValReal,
                     DataAdm,
                     DataDemissao,
                     frmSelRelProc2.qryProcesso.FieldByName('DATANOTIF').Value,
                     qryRateio.FieldByName('IDFILIALPESSOA').AsInteger,
                     qryRateio.FieldByName('IDPESSOA').AsInteger,
                     qryRateio.FieldByName('DATABASE').Value,
                     qryRateio.FieldByName('TIPORATEIO').AsInteger,
                     qryRateio.FieldByName('PERIODO').AsInteger,
                     qryRateio.FieldByName('PERCENT1').AsFloat,
                     qryRateio.FieldByName('VALORBASE1').AsFloat,
                     qryRateio.FieldByName('PERCENT2').AsFloat,
                     qryRateio.FieldByName('VALORBASE2').AsFloat,
                     qryRateio.FieldByName('PERCENT3').AsFloat,
                     qryRateio.FieldByName('VALORBASE3').AsFloat,
                     qryRateio.FieldByName('PERCENT4').AsFloat,
                     qryRateio.FieldByName('VALORBASE4').AsFloat,
                     qryRateio.FieldByName('PERCENT5').AsFloat,
                     qryRateio.FieldByName('VALORBASE5').AsFloat);
             if  PercRateio > 0  then
                 for Ind := 1 to TAM do
                     if CharCod[Ind] = qryRateio.FieldByName('IDPESSOA').AsInteger then begin
                        CharRea[Ind] := CharRea[Ind] + PercRateio;

                        qrlNomeEmpr.Caption := CharNom[Ind];
                        qrlRatIndRea.Caption   := FormatFloat(FormatFloat2,PercRateio);
                        ImprimeRateio := True;
                     end;

          end;

      end;

  end;
  qrRateioIndiv.Enabled := ImprimeRateio;
  if frmSelRelProc.rgResumo.ItemIndex = 0  then
  begin
     if not frmSelRelProc.qryResumo.Active then frmSelRelProc.qryResumo.Open;
     // DAR O LOCATE E INSERIR/ATUALIZAR A QRYRESUMO
     if not frmSelRelProc.qryResumo.Locate('IDPESSOA',
                     frmSelRelProc2.qryProcesso.FieldByName('IDESTAB').AsInteger,[]) then
     begin
         frmSelRelProc.qryResumo.Insert;
         frmSelRelProc.qryResumo.FieldByName('IDPESSOA').AsInteger :=
                       frmSelRelProc2.qryProcesso.FieldByName('IDESTAB').AsInteger;
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
                   (ValMax - ValReal);
     frmSelRelProc.qryResumo.FieldByName('ECONESTIMADO').AsFloat :=
                   frmSelRelProc.qryResumo.FieldByName('ECONESTIMADO').AsFloat +
                   StringToFloat(qrlEconomia2.Caption);
  end;
end;

procedure TrelProcesso2.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotProc.Caption   := IntToStr(TotProc);
  qrlTotEnc.Caption    := FormatFloat(FormatFloat2,TotEnc);
  qrlTotAtual.Caption  := FormatFloat(FormatFloat2,TotAtu);
  qrlTotOrig.Caption   := FormatFloat(FormatFloat2,TotCus);
  qrlTotRisTot.Caption := FormatFloat(FormatFloat2,TotAtu + TotEnc);
  qrlTotReal.Caption  := '';
  qrlTotEcon2.Caption := '';
  if  (TotProv <> 0) or (TotReal <> 0)  then begin
      qrlTotReal.Caption    := FormatFloat(FormatFloat2,TotReal);
      qrlTotEcon2.Caption   := FormatFloat(FormatFloat2,TotProv + TotEnc - TotReal);
  end;

//  qrlRatMax1.Caption  := '';
  qrlRatPrv1.Caption  := '';
  qrlRatRea1.Caption  := '';
  qrlRatNome1.Caption  := '';

//  qrlRatMax2.Caption  := '';
  qrlRatPrv2.Caption  := '';
  qrlRatRea2.Caption  := '';
  qrlRatNome2.Caption  := '';

//  qrlRatMax3.Caption  := '';
  qrlRatPrv3.Caption  := '';
  qrlRatRea3.Caption  := '';
  qrlRatNome3.Caption  := '';

//  qrlRatMax4.Caption  := '';
  qrlRatPrv4.Caption  := '';
  qrlRatRea4.Caption  := '';
  qrlRatNome4.Caption  := '';

  if  ApuraRateio  then begin
      if TAM > 0  then begin
      qrlRatNome1.Caption  := CharNom[1];
//      qrlRatMax1.Caption  := FormatFloat(FormatFloat2,CharMax[1]);
      qrlRatPrv1.Caption  := FormatFloat(FormatFloat2,CharPrv[1]);
      qrlRatRea1.Caption  := FormatFloat(FormatFloat2,CharRea[1]);
      end;

      if TAM > 1  then begin
      qrlRatNome2.Caption  := CharNom[2];
//      qrlRatMax2.Caption  := FormatFloat(FormatFloat2,CharMax[2]);
      qrlRatPrv2.Caption  := FormatFloat(FormatFloat2,CharPrv[2]);
      qrlRatRea2.Caption  := FormatFloat(FormatFloat2,CharRea[2]);
      end;

      if TAM > 2  then begin
      qrlRatNome3.Caption  := CharNom[3];
//      qrlRatMax3.Caption  := FormatFloat(FormatFloat2,CharMax[3]);
      qrlRatPrv3.Caption  := FormatFloat(FormatFloat2,CharPrv[3]);
      qrlRatRea3.Caption  := FormatFloat(FormatFloat2,CharRea[3]);
      end;

      if TAM > 3  then begin
      qrlRatNome4.Caption  := CharNom[4];
//      qrlRatMax4.Caption  := FormatFloat(FormatFloat2,CharMax[4]);
      qrlRatPrv4.Caption  := FormatFloat(FormatFloat2,CharPrv[4]);
      qrlRatRea4.Caption  := FormatFloat(FormatFloat2,CharRea[4]);
      end;

  end;
  PrintBand := TotProc > 0;
end;

procedure TrelProcesso2.qrsdEtapaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Ind: integer;
begin
  inherited;
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

procedure TrelProcesso2.qrAfterPreview(Sender: TObject);
var
  relResumoProc: TrelResumoProc;
begin
  inherited;
  if (frmSelRelProc.rgResumo.ItemIndex = 0) then
  begin
    relResumoProc := TrelResumoProc.Create(Application);
    relResumoProc.Free;

    Self.WindowState           := wsNormal;
    frmSelRelProc2.WindowState := wsNormal;
    frmSelRelProc.WindowState  := wsNormal;
  end;
end;

procedure TrelProcesso2.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrCabLitis.Enabled := (frmSelRelProc.rgLitis.ItemIndex < 2) and (not qryLitis.Eof);
  qrCabEtapa.Enabled := (frmSelRelProc.rgEtapa.ItemIndex = 0) and (not qryEtapa.Eof);
  qrCabObjeto.Enabled := (frmSelRelProc.rgObjeto.ItemIndex = 0) and (not qryObjeto.Eof);
end;

procedure TrelProcesso2.qrsdObjetoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Ind: integer;
  ValTemp1,ValTemp2,ValTemp3 : Double;
begin
  qrlValorRealObj.Caption  := '';
  qrlEconomia1Obj.Caption  := '';
  qrlEconomia2Obj.Caption  := '';
  if (frmSelRelProc.rgObjeto.ItemIndex <> 1) then
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

end.
