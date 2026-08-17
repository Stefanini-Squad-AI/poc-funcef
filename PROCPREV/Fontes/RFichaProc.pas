unit RFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RMestreDet, quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  IvDictio, IvMulti, IvEMulti, Wwquery, URegra, QRExport;

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
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
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
    QRLabel23: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    tblObjeto: TwwTable;
    tblObjetoVALORRECL: TFloatField;
    tblObjetoPERCPROB: TFloatField;
    tblObjetoValorEsperado: TFloatField;
    tblObjetoNUMPROCTRAB: TFloatField;
    tblObjetoCODTIPOOBJETO: TFloatField;
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
    qrdbValReal: TQRDBText;
    tblObjetoVALORSENTENCA: TFloatField;
    QRDBText7: TQRDBText;
    tblTipRec: TwwTable;
    tblObjetoValorAtual: TFloatField;
    QRDBText12: TQRDBText;
    chbObserv: TQRChildBand;
    tblObjetoOBSERVACAO: TStringField;
    qrdbDescricao: TQRDBText;
    qryProcVinc1: TwwQuery;
    qrbCabVinc1: TQRBand;
    qrbVinculados: TQRSubDetail;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    qryProcVinc2: TwwQuery;
    qrbVinculado2: TQRSubDetail;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    qrbCabVinc2: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel22: TQRLabel;
    qrdbNome: TQRDBText;
    qrdbNasc: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    qrlSitProc: TQRLabel;
    QRLabel34: TQRLabel;
    qrlMateria: TQRLabel;
    qryLitis: TwwQuery;
    qrbCabLitis: TQRBand;
    QRLabel35: TQRLabel;
    qrbLitis: TQRSubDetail;
    QRDBText23: TQRDBText;
    qryIn: TwwQuery;
    Regra: TRegra;
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
    qrlblVara: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure tblObjetoCalcFields(DataSet: TDataSet);
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
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relFichaProc: TrelFichaProc;

implementation

uses FSelFichaProc, UValorAtual;

{$R *.DFM}


procedure TrelFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
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

  qrbObserv.Enabled := (frmSelFichaProc.rgObserv.ItemIndex = 0);

  tblPessoal.Filter := 'Idpessoa = ' +
       frmSelFichaProc.tblPessoal.FieldByName('IDPESSOA').AsString;
  tblPessoal.Filtered := True;
  tblPessoal.First;
  qr.ReportTitle := qr.ReportTitle + ' ' +
     trim(frmSelFichaProc.tblProcesso.FieldByName('PROCJCJNUM').AsString);
  if frmSelFichaProc.tblProcesso.FieldByName('IDENTPASTA').AsString <> ''  then
     qr.ReportTitle := qr.ReportTitle + ' Pasta: ' +
        trim(frmSelFichaProc.tblProcesso.FieldByName('IDENTPASTA').AsString);
  qrlblTitRel.Caption := qr.ReportTitle;
  qrlSitProc.Caption := 'Aberto';
  if frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').AsInteger = 1  then
     qrlSitProc.Caption := 'Encerrado';
  qrlMateria.Caption := 'Previdenciária Apenas';
  if frmSelFichaProc.tblProcesso.FieldByName('INDMATERIA').AsInteger = 3  then
     qrlMateria.Caption := 'Previdenciária e Trabalhista';

  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;
end;


procedure TrelFichaProc.tblObjetoCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORESPERADO.Value := (tblObjetoVALORRECL.Value *
                                   tblObjetoPERCPROB.Value) / 100;

  if  frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 0  then
      tblObjetoVALORATUAL.Value    := ValorAtual(tblObjetoVALORRECL.Value *
                                                 tblObjetoPERCPROB.Value / 100,
                                      tblFuncio.FieldByName('DATADEMISSAO').AsString,
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
  qrdbValReal.Enabled :=
     frmSelFichaProc.tblProcesso.FieldByName('FLGSITPROC').Value = 1;

  chbObserv.Enabled := (tblObjeto.FieldByName('OBSERVACAO').Value <> '');
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

procedure TrelFichaProc.qrbVinculado2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryProcVinc2.IsEmpty;
end;

procedure TrelFichaProc.qrbCabLitisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryLitis.IsEmpty;
end;

procedure TrelFichaProc.qrbLitisBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryLitis.IsEmpty;
end;

procedure TrelFichaProc.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlblEscrit.Caption := frmSelFichaProc.MontaSelectProc.ValoresChave[1];
  qrlblVara.Caption   := frmSelFichaProc.MontaSelectProc.ValoresChave[2];
end;

end.
