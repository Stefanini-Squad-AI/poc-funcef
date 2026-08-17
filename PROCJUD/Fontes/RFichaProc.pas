unit RFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  IvDictio, IvMulti, IvEMulti, Wwquery;

type
  TrelFichaProc = class(TrelMestreDet)
    tblPessoal: TwwTable;
    ds: TwwDataSource;
    QRLabel25: TQRLabel;
    qrdbEnder: TQRDBText;
    qrdbBairro: TQRDBText;
    qrdbCEP: TQRDBText;
    qrdbCidade: TQRDBText;
    qrdbUF: TQRDBText;
    qrbCabObj: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    tblTipObj: TwwTable;
    dsObj: TwwDataSource;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
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
    qrdbRazao: TQRDBText;
    QRLabel3: TQRLabel;
    tblObjeto: TwwTable;
    tblObjetoVALORRECL: TFloatField;
    tblObjetoPERCPROB: TFloatField;
    tblObjetoValorEsperado: TFloatField;
    tblObjetoNUMPROCTRAB: TFloatField;
    tblObjetoCODTIPOOBJETO: TFloatField;
    qrbObserv: TQRChildBand;
    QRDBText5: TQRDBText;
    tblImagem: TwwTable;
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
    qrdbValReal: TQRDBText;
    tblObjetoVALORSENTENCA: TFloatField;
    QRDBText7: TQRDBText;
    tblTipRec: TwwTable;
    tblObjetoValorAtual: TFloatField;
    QRDBText12: TQRDBText;
    chbObserv: TQRChildBand;
    qrdbDescricao: TQRDBText;
    tblObjetoOBSERVACAO: TStringField;
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
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel27: TQRLabel;
    qrlSitProc: TQRLabel;
    QRLabel11: TQRLabel;
    qrdbNasc: TQRDBText;
    QRLabel34: TQRLabel;
    qrlMateria: TQRLabel;
    tblVara: TwwTable;
    QRDBText3: TQRDBText;
    qryLitis: TwwQuery;
    qrbCabLitis: TQRBand;
    QRLabel35: TQRLabel;
    qrbLitis: TQRSubDetail;
    QRDBText23: TQRDBText;
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
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    qrbTotHonor: TQRBand;
    QRLabel47: TQRLabel;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel41: TQRLabel;
    qrlblEscrit: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure tblObjetoCalcFields(DataSet: TDataSet);
    procedure qrbCabObjBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbCabVinc1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbVinculadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbCabVinc2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbVinculado2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbCabLitisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbLitisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  end;

var
  relFichaProc: TrelFichaProc;

implementation

uses uValorAtual, fSelFichaProc;

{$R *.DFM}

procedure TrelFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
  tblPessoal.Open;
  tblObjeto.Open;
  tblTipObj.Open;
  tblHstetp.Open;
  tblTipRec.Open;
  tblEndPes.Open;
  tblTelef.Open;
  tblDocPes.Open;
  tblTipDoc.Open;
  tblVara.Open;
  tblImagem.Open;

  qryProcVinc1.ParamByName('NumProcTrab').asString := trim(frmSelFichaProc.dbedNumero.Text);
  qryProcVinc1.Open;

  qryProcVinc2.ParamByName('NumProcTrab').asString :=
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

  qrbObserv.Enabled := (frmSelFichaProc.rgObserv.ItemIndex = 0);

  tblPessoal.Filter   := 'Idpessoa = ' + frmSelFichaProc.tblPessoal.FieldByName('IDPESSOA').AsString;
  tblPessoal.Filtered := True;
  tblPessoal.First;

  qr.ReportTitle := qr.ReportTitle + ' ' +
    Trim(frmSelFichaProc.tblProcesso.FieldByName('PROCJCJNUM').AsString);

  if frmSelFichaProc.tblProcesso.FieldByName('IDENTPASTA').AsString <> ''  then
    qr.ReportTitle := qr.ReportTitle + ' Pasta: ' +
      trim(frmSelFichaProc.tblProcesso.FieldByName('IDENTPASTA').AsString);

  qrlblTitRel.Caption := qr.ReportTitle;
  qrlSitProc.Caption  := 'Aberto';

  if frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').AsInteger = 1  then
    qrlSitProc.Caption := 'Encerrado';

  qrlMateria.Caption := 'Civil';
  if frmSelFichaProc.tblProcesso.FieldByName('INDMATERIA').AsInteger = 5  then
    qrlMateria.Caption := 'Comercial'
  else
  if frmSelFichaProc.tblProcesso.FieldByName('INDMATERIA').AsInteger = 6  then
    qrlMateria.Caption := 'Tributária'
  else
  if frmSelFichaProc.tblProcesso.FieldByName('INDMATERIA').AsInteger = 7  then
    qrlMateria.Caption := 'Penal';
end;


procedure TrelFichaProc.tblObjetoCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORESPERADO.Value := (tblObjetoVALORRECL.Value *
                                   tblObjetoPERCPROB.Value) / 100;

  if  frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 0  then
      tblObjetoVALORATUAL.Value    := ValorAtual(tblObjetoVALORRECL.Value *
                                                 tblObjetoPERCPROB.Value / 100,
                                    frmSelFichaProc.tblProcesso.FieldByName('DATANOTIF').AsString,
                                    frmSelFichaProc.tblProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                                    frmSelFichaProc.tblProcesso.FieldByName('IDREGRA').AsString,
                                    frmSelFichaProc.tblProcesso.FieldByName('NUMPROCTRAB').AsString,
                                    frmSelFichaProc.tblProcesso.FieldByName('INDTAXACONV').AsInteger)
  else  tblObjetoVALORATUAL.Value  := ValorAtual(tblObjetoVALORSENTENCA.Value,
                                      frmSelFichaProc.tblProcesso.FieldByName('DATAEFETENC').AsString,
                                      frmSelFichaProc.tblProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                                      frmSelFichaProc.tblProcesso.FieldByName('IDREGRA').AsString,
                                      frmSelFichaProc.tblProcesso.FieldByName('NUMPROCTRAB').AsString,
                                      frmSelFichaProc.tblProcesso.FieldByName('INDTAXACONV').AsInteger);
end;


procedure TrelFichaProc.qrbCabObjBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlValReal.Enabled := frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;
end;

procedure TrelFichaProc.qrsubdtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrdbValReal.Enabled := frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;
  chbObserv.Enabled   := (tblObjeto.FieldByName('OBSERVACAO').Value <> '');
end;

procedure TrelFichaProc.qrbCabVinc1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not qryProcVinc1.IsEmpty;
end;

procedure TrelFichaProc.qrbVinculadosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not qryProcVinc1.IsEmpty;
end;

procedure TrelFichaProc.qrbCabVinc2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not qryProcVinc2.IsEmpty;
end;

procedure TrelFichaProc.qrbVinculado2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not qryProcVinc2.IsEmpty;
end;

procedure TrelFichaProc.qrbCabLitisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not qryLitis.IsEmpty;
end;

procedure TrelFichaProc.qrbLitisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not qryLitis.IsEmpty;
end;

procedure TrelFichaProc.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlblEscrit.Caption := frmSelFichaProc.MontaSelectProc.ValoresChave[1];
end;

end.
