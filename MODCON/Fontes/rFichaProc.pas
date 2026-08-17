unit RFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  IvDictio, IvMulti, IvEMulti, Wwquery;

type
  TrelFichaProc = class(TrelMestreDet)
    tblPessoal: TwwTable;
    tblFuncio: TwwTable;
    tblSituacao: TwwTable;
    ds: TwwDataSource;
    dsX: TwwDataSource;
    tblCargo: TwwTable;
    QRLabel25: TQRLabel;
    qrdbEnder: TQRDBText;
    qrdbBairro: TQRDBText;
    qrdbCEP: TQRDBText;
    qrdbCidade: TQRDBText;
    qrdbUF: TQRDBText;
    QRLabel28: TQRLabel;
    qrdbEstab: TQRDBText;
    QRLabel29: TQRLabel;
    qrdbFonte: TQRDBText;
    QRLabel30: TQRLabel;
    qrdbCargo: TQRDBText;
    QRLabel31: TQRLabel;
    qrdbSalario: TQRDBText;
    qrdbTipoSal: TQRDBText;
    QRDBText1: TQRDBText;
    qrbCabObj: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    tblTipObj: TwwTable;
    dsObj: TwwDataSource;
    tblEstab: TwwTable;
    tblLotacao: TwwTable;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    tblProfis: TwwTable;
    tblGrauInstr: TwwTable;
    qrbEtapa: TQRSubDetail;
    qrbCabExper: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel33: TQRLabel;
    dsEtp: TwwDataSource;
    tblHstEtp: TwwTable;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    tblEndPes: TwwTable;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBImage1: TQRDBImage;
    qrdbNome: TQRDBText;
    QRLabel22: TQRLabel;
    qrdbNasc: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    tblObjeto: TwwTable;
    qrbObserv: TQRChildBand;
    QRDBText5: TQRDBText;
    tblPesFis: TwwTable;
    tblImagem: TwwTable;
    dsFis: TwwDataSource;
    dsEnd: TwwDataSource;
    tblTelef: TwwTable;
    tblDocPes: TwwTable;
    dsDoc: TwwDataSource;
    tblTipDoc: TwwTable;
    QRLabel26: TQRLabel;
    qrdbTelRes: TQRDBText;
    QRDBText37: TQRDBText;
    qrCabDocs: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel32: TQRLabel;
    qrbDocs: TQRSubDetail;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    qrlValReal: TQRLabel;
    QRDBText7: TQRDBText;
    tblTipRec: TwwTable;
    tblTRT: TwwTable;
    QRLabel34: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel27: TQRLabel;
    qrlSitProc: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText19: TQRDBText;
    qryProcVinc1: TwwQuery;
    qryProcVinc2: TwwQuery;
    qrbCabVinc1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrbVinculados: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrbCabVinc2: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrbVinculado2: TQRSubDetail;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    qryLitis: TwwQuery;
    qrbCabLitis: TQRBand;
    QRLabel35: TQRLabel;
    qrbLitis: TQRSubDetail;
    QRDBText23: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    qryRateio: TwwQuery;
    qrlCustoMax: TQRLabel;
    qrlCustoAtual: TQRLabel;
    qrlValorReal: TQRLabel;
    qrbTotValores: TQRBand;
    qrbRateio: TQRChildBand;
    QRLabel38: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel39: TQRLabel;
    qrlRatIndMax: TQRLabel;
    qrlRatPercMax: TQRLabel;
    qrlRatIndPrv: TQRLabel;
    qrlRatPercPrv: TQRLabel;
    qrlRatIndRea: TQRLabel;
    qrlRatPercRea: TQRLabel;
    qrlTotalMax: TQRLabel;
    qrlTotalAtual: TQRLabel;
    qrlTotalReal: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape1: TQRShape;
    qrlTotalOrig: TQRLabel;
    qrlCustoOrig: TQRLabel;
    qryHonor: TwwQuery;
    qryHonorNUMPROCTRAB: TFloatField;
    qryHonorDATAPAGTOHONOR: TDateTimeField;
    qryHonorIDFORNSERV: TFloatField;
    qryHonorVALORHONOR: TFloatField;
    qryHonorNOME: TStringField;
    qrbCabHonor: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    qrbHonor: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrbTotHonor: TQRBand;
    QRLabel47: TQRLabel;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    qrlblEscrit: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText12: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure qrbCabObjBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCabVinc1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbVinculadosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCabVinc2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbVinculado2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCabLitisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbLitisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbRateioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotValoresBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relFichaProc: TrelFichaProc;
  ApuraRateio : Boolean;
  ValAtu, ValMax, ValReal, ValOrig : Double;
  ValorReclamado, ValorEsperado, ValorOriginal, ValorReal, PercRateio : Double;
  FormatFloat1, FormatFloat2 : String;
  DataDemissao, DataAdm : TDate;    

implementation

uses FSelFichaProc, UValorAtual, uFuncoesUteisRH;

{$R *.DFM}


procedure TrelFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
  FormatFloat1 := '###,###,##0.00';
  FormatFloat2 := '#,###,###,##0.00';

  ValMax  := 0;
  ValAtu  := 0;
  ValReal := 0;
  ValOrig := 0;

  tblPessoal.Open;
  tblPesfis.Open;
  tblProfis.Open;
  tblGrauInstr.Open;
  tblCargo.Open;
  //tblSindic.Open;
  tblEstab.Open;
  tblFuncio.Open;
  tblLotacao.Open;
  tblSituacao.Open;
  tblObjeto.Open;
  tblTipObj.Open;
  tblHstetp.Open;
  tblTipRec.Open;
  tblEndPes.Open;
  tblTelef.Open;
  tblDocPes.Open;
  tblTipDoc.Open;
  tblImagem.Open;
  tblTRT.Open;
  qryProcVinc1.ParamByName('NumProcTrab').AsString := trim(frmSelFichaProc.dbedNumero.Text);
  qryProcVinc1.Open;
  qryProcVinc2.ParamByName('NumProcTrab').AsString :=
     frmSelFichaProc.tblProcesso.FieldByName('IDPROCVINCULADO').AsString;
  qryProcVinc2.Open;
  qryLitis.ParamByName('NumProcTrab').AsString := trim(frmSelFichaProc.dbedNumero.Text);
  qryLitis.Open;

  if (frmSelFichaProc.rgHonor.ItemIndex = 0) then
  begin
    qryHonor.ParamByName('NumProcTrab').AsString := trim(frmSelFichaProc.dbedNumero.Text);
    qryHonor.Open;
  end;
  qrbCabHonor.Enabled := (frmSelFichaProc.rgHonor.ItemIndex = 0) and (not qryHonor.eof);
  qrbHonor.Enabled    := (frmSelFichaProc.rgHonor.ItemIndex = 0) and (not qryHonor.eof);
  qrbTotHonor.Enabled := (frmSelFichaProc.rgHonor.ItemIndex = 0) and (not qryHonor.eof);

  tblPessoal.Filter := 'Idpessoa = ' +
       frmSelFichaProc.tblPessoal.FieldByName('IDPESSOA').AsString;
  tblPessoal.Filtered := True;
  tblPessoal.First;
  qr.ReportTitle := qr.ReportTitle + ' ' +
     trim(frmSelFichaProc.tblProcesso.FieldByName('PROCJCJNUM').AsString);
  qrlblTitRel.Caption := qr.ReportTitle;
  qrlSitProc.Caption := 'Aberto';
  if frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').AsInteger = 1  then
     qrlSitProc.Caption := 'Encerrado';
  qryRateio.Close;
  qryRateio.ParamByName('IDFILIALPESSOA').AsInteger :=
                       tblFuncio.FieldByName('IDESTAB').AsInteger;
  qryRateio.Open;
  ApuraRateio := (not qryRateio.Eof) and (frmSelFichaProc.rgRateio.ItemIndex = 0);
  qrbObserv.Enabled := (frmSelFichaProc.rgObserv.ItemIndex = 0);
  qrbRateio.Enabled := ApuraRateio;

end;


procedure TrelFichaProc.qrbCabObjBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlValReal.Enabled :=
     frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;
end;

procedure TrelFichaProc.qrsubdtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlValorReal.Enabled :=
     frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;

  ValorReclamado := ValorAtual(tblObjeto.FieldByName('VALORRECL').AsFloat,
                       iff(tblFuncio.FieldByName('DATADESLIGAMENTO').AsString='',
                           frmSelFichaProc.tblProcesso.FieldByName('DATANOTIF').AsString,
                           tblFuncio.FieldByName('DATADESLIGAMENTO').AsString),
                       frmSelFichaProc.tblProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('IDREGRA').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('NUMPROCTRAB').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('INDTAXACONV').AsInteger);
  ValorReal      := ValorAtual(tblObjeto.FieldByName('VALORSENTENCA').AsFloat,
                       frmSelFichaProc.tblProcesso.FieldByName('DATAEFETENC').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('IDREGRA').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('NUMPROCTRAB').AsString,
                       frmSelFichaProc.tblProcesso.FieldByName('INDTAXACONV').AsInteger);



  ValorEsperado :=  ValorReclamado -
                   ((100 - tblObjeto.FieldByName('PERCPROB').AsFloat) *
                     ValorReclamado / 100);
  ValorOriginal :=  ValorReclamado -
                   ((100 - tblObjeto.FieldByName('PERCORIG').AsFloat) *
                     ValorReclamado / 100);
  ValMax  := ValMax  +  ValorReclamado;
  ValAtu  := ValAtu  +  ValorEsperado;
  ValOrig := ValOrig +  ValorOriginal;
  ValReal := ValReal +  ValorReal;

  qrlCustoMax.Caption   := FormatFloat(FormatFloat1,ValorReclamado);
  qrlCustoAtual.Caption := FormatFloat(FormatFloat1,ValorEsperado);
  qrlCustoOrig.Caption  := FormatFloat(FormatFloat1,ValorOriginal);
  qrlValorReal.Caption  := FormatFloat(FormatFloat1,ValorReal);
end;

procedure TrelFichaProc.qrbCabVinc1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryProcVinc1.IsEmpty;
end;

procedure TrelFichaProc.qrbVinculadosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryProcVinc1.IsEmpty;
end;

procedure TrelFichaProc.qrbCabVinc2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryProcVinc2.IsEmpty;
end;

procedure TrelFichaProc.qrbVinculado2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryProcVinc2.IsEmpty;
end;

procedure TrelFichaProc.qrbCabLitisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryLitis.IsEmpty;
end;

procedure TrelFichaProc.qrbLitisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryLitis.IsEmpty;
end;

procedure TrelFichaProc.qrbRateioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   qrlRatIndMax.Caption   := '0,00';
   qrlRatIndPrv.Caption   := '0,00';
   qrlRatIndRea.Caption   := '';
   qrlRatPercMax.Caption  := '0,00';
   qrlRatPercPrv.Caption  := '0,00';
   qrlRatPercRea.Caption  := '';
   if  (ApuraRateio) then
   begin
       qrlRatIndRea.Enabled :=
         frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;

       if  (tblSituacao.FieldByName('TIPOSIT').Value = 'D') and
           (tblFuncio.FieldByName('DATADESLIGAMENTO').Value) <> Null
       then
           DataDemissao := tblFuncio.FieldByName('DATADESLIGAMENTO').Value
       else
           DataDemissao := Date;

       if  (tblFuncio.FieldByName('DATAADMISSAO').Value) <> Null
       then
           DataAdm := tblFuncio.FieldByName('DATAADMISSAO').Value
       else
           DataAdm := Date - 365*20;

       if qryRateio.FieldByName('TIPORATEIO').AsInteger = 1  then begin
          PercRateio := RateioCusto(0,
                  DataAdm,
                  DataDemissao,
                  frmSelFichaProc.tblProcesso.FieldByName('DATANOTIF').Value,
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
          if  PercRateio > 0  then begin
              qrlRatIndMax.Caption   := FormatFloat(FormatFloat2,ValMax  * PercRateio / 100);
              qrlRatIndPrv.Caption   := FormatFloat(FormatFloat2,ValAtu  * PercRateio / 100);
              qrlRatIndRea.Caption   := FormatFloat(FormatFloat2,ValReal  * PercRateio / 100);
              if  ValMax <> 0 then
                  qrlRatPercMax.Caption  := FormatFloat(FormatFloat2,PercRateio);
              if  ValAtu <> 0 then
                  qrlRatPercPrv.Caption  := FormatFloat(FormatFloat2,PercRateio);
              if  ValReal <> 0 then
                  qrlRatPercRea.Caption  := FormatFloat(FormatFloat2,PercRateio);
          end;
       end
       else begin
          PercRateio := RateioCusto(ValMax,
                  DataAdm,
                  DataDemissao,
                  frmSelFichaProc.tblProcesso.FieldByName('DATANOTIF').Value,
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
                  qrlRatIndMax.Caption   := FormatFloat(FormatFloat2,PercRateio);
          if  ValMax <> 0 then
              qrlRatPercMax.Caption  := FormatFloat(FormatFloat2,PercRateio * 100 / Valmax);

          PercRateio := RateioCusto(ValAtu,
                  DataAdm,
                  DataDemissao,
                  frmSelFichaProc.tblProcesso.FieldByName('DATANOTIF').Value,
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
                  qrlRatIndPrv.Caption   := FormatFloat(FormatFloat2,PercRateio);
          if  ValAtu <> 0 then
              qrlRatPercPrv.Caption  := FormatFloat(FormatFloat2,PercRateio * 100 / ValAtu);

          PercRateio := RateioCusto(ValReal,
                  DataAdm,
                  DataDemissao,
                  frmSelFichaProc.tblProcesso.FieldByName('DATANOTIF').Value,
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
                  qrlRatIndRea.Caption   := FormatFloat(FormatFloat2,PercRateio);
          if  ValReal <> 0 then
              qrlRatPercRea.Caption  := FormatFloat(FormatFloat2,PercRateio * 100 / ValReal);

       end;

   end;

end;

procedure TrelFichaProc.qrbTotValoresBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := (ValMax + ValAtu + ValReal) > 0;
  qrlTotalMax.Caption   := FormatFloat(FormatFloat2,ValMax);
  qrlTotalAtual.Caption := FormatFloat(FormatFloat2,ValAtu);
  qrlTotalOrig.Caption  := FormatFloat(FormatFloat2,ValOrig);
  qrlTotalReal.Caption  := FormatFloat(FormatFloat2,ValReal);
  qrlTotalReal.Enabled :=
     frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;
  ValMax  := 0;
  ValAtu  := 0;
  ValReal := 0;
  ValOrig := 0;
end;

procedure TrelFichaProc.qrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  ValMax  := 0;
  ValAtu  := 0;
  ValReal := 0;
  ValOrig := 0;
end;

procedure TrelFichaProc.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlblEscrit.Caption := frmSelFichaProc.MontaSelectProc.ValoresChave[1];
end;

end.
