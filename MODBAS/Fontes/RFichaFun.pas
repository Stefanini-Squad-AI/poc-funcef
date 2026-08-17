unit RFichaFun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RMestreDet,
  quickrpt, Qrctrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable, Wwquery, IvDictio, IvMulti,
  IvEMulti, uCtrlCalcRub;

type
  TrelFichaFun = class(TrelMestreDet)
    QRLabel25: TQRLabel;
    qrdbEnder: TQRDBText;
    qrdbBairro: TQRDBText;
    qrdbCEP: TQRDBText;
    qrdbCidade: TQRDBText;
    qrdbUF: TQRDBText;
    QRLabel26: TQRLabel;
    qrdbTelRes: TQRDBText;
    qrdbTelRec: TQRDBText;
    QRLabel28: TQRLabel;
    qrdbEstab: TQRDBText;
    QRLabel29: TQRLabel;
    qrdbFonte: TQRDBText;
    QRLabel30: TQRLabel;
    qrdbCargo: TQRDBText;
    QRLabel31: TQRLabel;
    qrdbSalario: TQRDBText;
    qrdbTipoSal: TQRDBText;
    qrbCabUltEmp: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    qrbCursos: TQRSubDetail;
    qrbCabCurso: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qrlResult: TQRLabel;
    qrlAvTeor: TQRLabel;
    qrlAvPrat: TQRLabel;
    qrbExper: TQRSubDetail;
    qrbCabExper: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    qrbTestes: TQRSubDetail;
    qrbCabTeste: TQRBand;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    qrbOcorr: TQRSubDetail;
    qrbCabOcorr: TQRBand;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    qrbEvol: TQRSubDetail;
    qrbCabEvol: TQRBand;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    qrbBenef: TQRSubDetail;
    qrbCabBenef: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    qrlVALOR: TQRLabel;
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
    qryPessoal: TwwQuery;
    qryProfis: TwwQuery;
    qryGrauInstr: TwwQuery;
    qryCargo: TwwQuery;
    qryEstab: TwwQuery;
    qrySituacao: TwwQuery;
    qryUltEmpr: TwwQuery;
    qryMotivo: TwwQuery;
    qryHstTrn: TwwQuery;
    qryCurso: TwwQuery;
    qryHstExp: TwwQuery;
    qryHstAva: TwwQuery;
    qryHstAsm: TwwQuery;
    qryHstCes: TwwQuery;
    qryHstBen: TwwQuery;
    qryEndPes: TwwQuery;
    qryImagem: TwwQuery;
    dsEndPes: TwwDataSource;
    tblTelef: TwwTable;
    QRDBText37: TQRDBText;
    ds: TwwDataSource;
    tblDocPes: TwwTable;
    dsDocPes: TwwDataSource;
    tblTipDoc: TwwTable;
    qrCabDocs: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel32: TQRLabel;
    qrbDocs: TQRSubDetail;
    QRDBText38: TQRDBText;
    qrdbNumDoc: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel51: TQRLabel;
    qrlVinculo: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText1: TQRDBText;
    tblLotacao: TwwTable;
    QRDBText39: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    qrDescCurso: TQRChildBand;
    qrdbDescricao: TQRDBText;
    qrDescAval: TQRChildBand;
    QRDBText45: TQRDBText;
    qrDescOcor: TQRChildBand;
    QRDBText46: TQRDBText;
    qry: TwwQuery;
    qrlInscricao1: TQRLabel;
    qrlInscricao2: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qrbCursosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbBenefBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qryHstTrnAfterScroll(DataSet: TDataSet);
    procedure qryUltEmprAfterScroll(DataSet: TDataSet);
    procedure qrCabecalhoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbDocsBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbOcorrBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbTestesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCalcRub: TCtrlCalcRub;
  end;

var
  relFichaFun: TrelFichaFun;
  RegRegra, RegPessoa, Modelo: string;

implementation

uses uSistema, fSelRelFicha, fSelRelFicha2, dBaseDados;

{$R *.DFM}

procedure TrelFichaFun.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.Initialize(dtmBaseDados.dbBaseDados, true);

  // PEGA O MODELO
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT IDCONTRACHEQUE FROM '+Sistema.PrefixoServidor+'PARAMAPREV');
  qry.Open;

  Modelo := qry.FieldByName('IDCONTRACHEQUE').asString;
  if (Modelo = '') then
    Modelo := '99';

  qry.Close;

  qrlInscricao1.Enabled := (Modelo = '1');
  qrlInscricao2.Enabled := (Modelo = '1');

  if (frmSelRelFicha.rgSelecao.ItemIndex = 0) then
    qryPessoal.ParamByName('IdPessoa').Value :=
      frmSelRelFicha.qryFuncionario.FieldByName('IDPESSOA').Value
  else
  begin
    qr.Dataset            := frmSelRelFicha2.tblPessoal;
    qryPessoal.DataSource := frmSelRelFicha2.ds;
  end;

  qryPessoal.Open;
  qryProfis.Open;
  qryGrauInstr.Open;
  qryCargo.Open;
  //tblSindic.Open;
  qryEstab.Open;
  tblLotacao.Open;
  qrySituacao.Open;
  qryUltEmpr.Open;
  qryHstTrn.Open;
  qryHstExp.Open;
  qryHstAva.Open;
  qryHstAsm.Open;
  qryHstCes.Open;
  qryHstBen.Open;
  qryEndPes.Open;
  tblTelef.Open;
  tblDocPes.Open;
  tblTipDoc.Open;
  qryImagem.Open;
end;

procedure TrelFichaFun.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TrelFichaFun.qrbCursosBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrlResult.Caption := '    N/A';
  qrlAvTeor.Caption := 'N/A';
  qrlAvPrat.Caption := 'N/A';

  if (qryHstTrn.FieldByName('FLGAVALTEOR').Value = 1) then
    qrlAvTeor.Caption := qryHstTrn.FieldByName('AVALTEOR').asString;

  if (qryHstTrn.FieldByName('FLGAVALPRAT').Value = 1) then
    qrlAvPrat.Caption := qryHstTrn.FieldByName('AVALPRAT').asString;

  if ((qryCurso.FieldByName('TEMAVAL').Value = 1) and
      (qryHstTrn.FieldByName('FLGAVALTEOR').Value = 1) or
      (qryCurso.FieldByName('TEMAVPR').Value = 1) and
      (qryHstTrn.FieldByName('FLGAVALPRAT').Value = 1)) then
  begin
    if ((qryCurso.FieldByName('TEMAVAL').Value = 1) and
        (qryHstTrn.FieldByName('FLGAVALTEOR').Value = 1) and
        (qryCurso.FieldByName('AVALIACAO').Value > qryHstTrn.FieldByName('AVALTEOR').Value)) or
       ((qryCurso.FieldByName('TEMAVPR').Value = 1) and
        (qryHstTrn.FieldByName('FLGAVALPRAT').Value = 1) and
        (qryCurso.FieldByName('AVALPRAT').Value > qryHstTrn.FieldByName('AVALPRAT').Value)) then
      qrlResult.Caption := 'Reprovad'
    else
      qrlResult.Caption := 'Aprovad';

    if (qryPessoal.FieldByName('SEXO').Value = 'M') then
      qrlResult.Caption := qrlResult.Caption + 'o'
    else
      qrlResult.Caption := qrlResult.Caption + 'a';
  end;

  qrDescCurso.Enabled := (frmSelRelFicha.rgImprDescr.ItemIndex = 0) and
                         (qryCurso.FieldByName('OBSERVACAO').Value <> '');
end;

procedure TrelFichaFun.qrbBenefBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  ValCalc1: double;
begin
  inherited;
  if (qryPessoal.FieldByName('IDPESSOA').asString <> '') then
  begin
    if (qryHstBen.FieldByName('VALORRUBRICA').Value = Null) then
      ValCalc1 := 0
    else
      ValCalc1 := qryHstBen.FieldByName('VALORRUBRICA').Value;

    if (qryHstBen.FieldByName('IdRegraCalculo').Value <> Null) then
    begin
      RegRegra  := qryHstBen.FieldByName('IdRegraCalculo').asString;
      RegPessoa := qryPessoal.FieldByName('IDPESSOA').asString;
      CtrlCalcRub.CalcBeneficioRegra(RegRegra, RegPessoa, ValCalc1);
    end;

    if (ValCalc1 > 0) then
      qrlVALOR.Caption := FloatToStrF(ValCalc1,ffFixed,10,2)
    else
      qrlVALOR.Caption := '';
  end;
end;

procedure TrelFichaFun.qryHstTrnAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryCurso.Close;
  if (qryHstTrn.FieldByName('IDCURSO').Value <> Null) then
  begin
    qryCurso.ParamByName('IDCURSO').Value := qryHstTrn.FieldByName('IDCURSO').Value;
    qryCurso.Open;
  end;
end;

procedure TrelFichaFun.qryUltEmprAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryMotivo.Close;
  if (qryUltEmpr.FieldByName('IDMOTIVO').Value <> Null) then
  begin
    qryMotivo.ParamByName('IDMOTIVO').Value := qryUltEmpr.FieldByName('IDMOTIVO').Value;
    qryMotivo.Open;
  end;
end;

procedure TrelFichaFun.qrCabecalhoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (Modelo = '1') then
  begin
    qry.SQL.Clear;
    qry.SQL.Add(' SELECT INSCRICAONUMERO ' +
                ' FROM   ' + Sistema.PrefixoServidor + 'PARTPREVPLAN ' +
                ' WHERE  IDPESSJUR = ' + IntToStr(Sistema.IdEmpresa) +
                ' AND    IDPESSOA  = ' + qryPessoal.FieldByName('IDPESSOA').asString);
    qry.Open;
    qrlInscricao2.Caption := qry.FieldByName('INSCRICAONUMERO').asString;
  end;

  qrlVinculo.Caption := 'Indefinido';
  if (qryPessoal.FieldByName('TIPOCONTRATO').Value = 'E') then
    qrlVinculo.Caption := 'Efetivo'
  else
  if (qryPessoal.FieldByName('TIPOCONTRATO').Value = 'T') then
    qrlVinculo.Caption := 'Temporário'
  else
  if (qryPessoal.FieldByName('TIPOCONTRATO').Value = 'G') then
    qrlVinculo.Caption := 'Estagiário'
  else
  if (qryPessoal.FieldByName('TIPOCONTRATO').Value = '3') then
    qrlVinculo.Caption := 'Terceiro'
  else
  if (qryPessoal.FieldByName('TIPOCONTRATO').Value = 'A') then
    qrlVinculo.Caption := 'Autônomo';

  if (qryPessoal.FieldByName('DATAFIMCONTRATO').Value <> Null) then
    qrlVinculo.Caption := qrlVinculo.Caption + ' (Até ' +
      qryPessoal.FieldByName('DATAFIMCONTRATO').asString + ')';
end;

procedure TrelFichaFun.qrbDocsBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  // Nenhum dos 2 abaixo funcionou !!???
  //qrdbNumDoc.Mask := tblTipDoc.FieldByName('MASCARA').Value;
  //tblDocPes.FieldByName('NUMDOCUMENTO').EditMask :=
  //   tblTipDoc.FieldByName('MASCARA').Value;
end;

procedure TrelFichaFun.qrbOcorrBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrDescOcor.Enabled := (frmSelRelFicha.rgImprDescr.ItemIndex = 0) and
                        (qryHstAsm.FieldByName('OBSERVACAO').Value <> '');
end;

procedure TrelFichaFun.qrbTestesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrDescAval.Enabled := (frmSelRelFicha.rgImprDescr.ItemIndex = 0) and
                        (qryHstAva.FieldByName('COMENT').Value <> '');
end;

end.
