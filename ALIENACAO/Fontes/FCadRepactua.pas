unit FCadRepactua;

// ------------------------------------------------------------------------------------------------
//
//	   Cadastro de Repactuação de Contratos de Alienação
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  01/10/2001
//	Data de Término   :
//
// -------------------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, wwdblook, CMDBLookupCombo, mProposta, Mask,
  wwdbedit, Wwdbspin, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdotdot,
  Wwdbcomb;


type
  TfrmCadRepactua = class(TfrmCadastroCS)
    gbContrato: TGroupBox;
    molProposta1: TmolProposta;
    Label3: TLabel;
    edtComprador: TEdit;
    Label4: TLabel;
    dblcbCondPag: TCMDBLookupCombo;
    gbInicio: TGroupBox;
    qryMoeda: TwwQuery;
    qryMoedaMOESIGLA: TStringField;
    qryMoedaFLGPERCVALOR: TStringField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOECODIGO: TFloatField;
    qryCondPag: TwwQuery;
    qryCondPagDATAINI: TDateTimeField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagIDINDCORRPROJ: TFloatField;
    qryCondPagFLGREAJMENSAL: TStringField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagDSCCOND: TStringField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryIDCONDPAGIMOVEL: TFloatField;
    qryINDCORRECAO: TFloatField;
    qryIDINDCORRPROJ: TFloatField;
    qryVLRFINANC: TFloatField;
    qryFLGREAJMENSAL: TStringField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDATAINI: TDateTimeField;
    qryDATAFIM: TDateTimeField;
    qryPRAZO: TStringField;
    qryPERIODO: TFloatField;
    qryTAXAJUROS: TFloatField;
    qryPERIODOTAXA: TStringField;
    qryNUMPARCELAS: TFloatField;
    qryTIPOCONDPAG: TStringField;
    qryIDCONDINICIAL: TFloatField;
    Label5: TLabel;
    cboMes: TComboBox;
    Label6: TLabel;
    DBspnAno: TwwDBSpinEdit;
    gbTermino: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboMesFim: TComboBox;
    DBspnAnoFim: TwwDBSpinEdit;
    sbBusca: TSpeedButton;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    pcRepactua: TPageControl;
    tsCondicao: TTabSheet;
    tsParcelas: TTabSheet;
    pCond: TPanel;
    dbcbJurosMensal: TDBCheckBox;
    dblcbIndCorr: TCMDBLookupCombo;
    Label11: TLabel;
    edSaldoDev: TDBRealEdit;
    Label10: TLabel;
    Label13: TLabel;
    cmDtVencto: TCMDateTimePicker;
    Label12: TLabel;
    dblcbIndProj: TCMDBLookupCombo;
    dbedtParc: TDBRealEdit;
    Label14: TLabel;
    DBRealEdit7: TDBRealEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBRealEdit8: TDBRealEdit;
    dbrgPerJuros: TDBRadioGroup;
    dbrgPerParc: TDBRadioGroup;
    pParc: TPanel;
    dbgParc: TwwDBGrid;
    qryParc: TwwQuery;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcNUMPARCELA: TStringField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcDATAPAGAMENTO: TDateTimeField;
    qryParcVLRPAGO: TFloatField;
    qryParcVLRDEVIDO: TFloatField;
    qryParcCAL_TIPO: TStringField;
    dsParc: TwwDataSource;
    Panel1: TPanel;
    Label7: TLabel;
    edTotDevido: TDBRealEdit;
    updParc: TUpdateSQL;
    Label8: TLabel;
    edTotAtraso: TDBRealEdit;
    Label9: TLabel;
    edTotSaldoDev: TDBRealEdit;
    cbAlteraSaldo: TCheckBox;
    qryParcVLRJUROS: TFloatField;
    qryParcVLRRESIDUOATUALI: TFloatField;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure pcRepactuaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbAlteraSaldoClick(Sender: TObject);
    procedure pcRepactuaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure cboMesChange(Sender: TObject);
    procedure dblcbCondPagChange(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(n : Double);
    procedure AbreCondPag(iCond: Double);
    procedure AbreParcelasEmAtraso(const iCond: Double);
    procedure FechaParcelasEmAtraso;
    function  TemRepacSuperior(iCond: Double) : Boolean;
    function  TemParcIntegrada(iCond: Double; dDataBase: TDateTime; var iQtde: Double) : Boolean;
    function  AtualizaDataFim (iCond: Double) : Boolean;
    function  RecalculaParcela(iCond: Double) : Boolean;
    function  EliminaParcelas (iCond: Double): Boolean;
    function  QtdeMinimaParcelas(iCond: Double): Double;
  public
    { Public declarations }
  end;

var
  frmCadRepactua: TfrmCadRepactua;

implementation

{$R *.DFM}
uses uModulo, uDataBase, uMensErro, DFinanciamento, UDiasInUteis, uFuncAlienacao;

procedure TfrmCadRepactua.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,Sender);
   if molProposta1.iProposta > 0 then begin
      edtComprador.Text := molProposta1.sComprador;
      AbreCondPag(molProposta1.iProposta);
   end else begin
      edtComprador.Clear;
      AbreCondPag(-1);
   end;
end;

procedure TfrmCadRepactua.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
      molProposta1.edtNumProp.Text := MontaSelect.ValoresChave[1];
      molProposta1.edtNomProp.Text := MontaSelect.ValoresChave[2];
      edtComprador.Text            := MontaSelect.ValoresChave[3];
      molProposta1.iProposta       := StrToInt(MontaSelect.ValoresChave[4]);

      cboMes.ItemIndex    := StrToInt(Copy(qryDATAINI.AsString,4,2)) - 1;
      DBspnano.Value      := StrToInt(Copy(qryDATAINI.AsString,7,4));
      cboMesFim.ItemIndex := StrToInt(Copy(qryDATAFIM.AsString,4,2)) - 1;
      DBspnanoFim.Value   := StrToInt(Copy(qryDATAFIM.AsString,7,4));

      pcRepactua.ActivePageIndex := 0;

      FechaParcelasEmAtraso;
   end;
end;

procedure TfrmCadRepactua.Sel(n: Double);
begin
   LimpaParametros(qry);
   qry.Params[0].AsFloat := n;
   qry.Open;
   
   qryMoeda.Open;
   AbreCondPag(qryIDCONTRATOIMOVEL.AsFloat);
end;

procedure TfrmCadRepactua.AbreCondPag(iCond: Double);
begin
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := iCond;
   qryCondPag.Open;
end;


procedure TfrmCadRepactua.CmeCadastroInsert(Sender: TObject);
begin
   Sel(-1);
   molProposta1.edtNumProp.Clear;
   molProposta1.edtNomProp.Clear;
   edtComprador.Clear;
   
   FechaParcelasEmAtraso;
   pcRepactua.ActivePageIndex := 0;

   inherited;
   qryIDCONDPAGIMOVEL.AsFloat  := LeUltRegistro(nil,'CONDPAGIMOVEL');
   qryTIPOCONDPAG.AsString     := 'R';
   qryFLGREAJMENSAL.AsString   := 'N';
   qryPRAZO.AsString           := 'M';
   qryPERIODOTAXA.AsString     := 'M';
   sbBusca.Enabled             := True;
   cboMes.ItemIndex            := -1;
   cboMesFim.ItemIndex         := -1;
   DBSpnAno.Value              := StrToFloat(Copy(DateToStr(Date),7,4));
   DBspnAnoFim.Value           := 0;
end;

procedure TfrmCadRepactua.CmeCadastroConfirma(Sender: TObject);
var iCond     : Double;
    bAtualiza : Boolean;
    dDtFim    : TDateTime;
begin
   bAtualiza       := False;
   iCond           := qryIDCONDINICIAL.AsFloat;
   sbBusca.Enabled := False;
   if qry.State in [dsInsert, dsEdit] then begin
      qryIDCONTRATOIMOVEL.AsFloat  := molProposta1.iProposta;
      if qryNUMPARCELAS.AsInteger < 1 then qryNUMPARCELAS.AsInteger := 1;
      if qryPERIODO.AsInteger     < 1 then qryPERIODO.AsInteger     := 1;
      bAtualiza := True;
      FuncAlienacao.CalcFimCondPag(qryIDCONDPAGIMOVEL.AsFloat,
                                   qryIDCONDINICIAL.AsFloat,
                                   qryNUMPARCELAS.AsInteger,
                                   qryPERIODO.AsInteger,
                                   qryPRAZO.AsString,
                                   qryDATAINI.AsDateTime,
                                   qryDATAVENCIMENTO.AsDateTime,
                                   dDtFim, False);

      cboMesFim.ItemIndex := StrToInt(Copy(DateToStr(dDtFim),4,2)) - 1;
      DBspnanoFim.Value   := StrToInt(Copy(DateToStr(dDtFim),7,4));
   end;
   inherited;
   if bAtualiza = True then begin
      AtualizaDataFim(iCond);
      EliminaParcelas(iCond);
      RecalculaParcela(iCond);
   end;
end;

procedure TfrmCadRepactua.molProposta1btnLimpaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnLimpaPropClick(Sender);
   if molProposta1.iProposta > 0 then begin
      edtComprador.Text := molProposta1.sComprador;
      AbreCondPag(molProposta1.iProposta);
   end else begin
      edtComprador.Clear;
      AbreCondPag(-1);
   end;
end;

procedure TfrmCadRepactua.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var iQtde : Double;
begin
   inherited;
   Accept := True;
   qryDATAINI.AsDateTime := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   if molProposta1.iProposta < 1 then begin
      MsgDlg('Contrato não foi preenchido','Erro',mtError,[mbOK],0);
      Accept := False;
      Exit;
   end;
   if dblcbCondPag.LookupValue = '' then begin
      MsgDlg('Condição de Pagamento Original não foi selecionada','Erro',mtError,[mbOK],0);
      dblcbCondPag.SetFocus;
      Accept := False;
      Exit;
   end;
   if cmDtVencto.Text = '' then begin
      MsgDlg('Data do próximo vencimento não foi preenchida','Erro',mtError,[mbOK],0);
      cmDtVencto.SetFocus;
      Accept := False;
      Exit;
   end;
   if cmDtVencto.Date < qryDATAINI.AsDateTime then begin
      MsgDlg('Data do próximo vencimento não pode ser inferior ao início da Repactuação','Erro',mtError,[mbOK],0);
      cmDtVencto.SetFocus;
      Accept := False;
      Exit;
   end;
   if edSaldoDev.Value > 0 then begin
      if MsgDlg('Um novo Saldo Devedor está sendo definido para condição. Cofirma ?',
                'Confirma',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
         edSaldoDev.SetFocus;
         Accept := False;
         Exit;
      end;
   end;
   if TemRepacSuperior(qryIDCONDINICIAL.AsFloat) then begin
      MsgDlg('Já existe outra Repactuação com início superior ao informado','Erro',mtError,[mbOK],0);
      cboMes.SetFocus;
      Accept := False;
      Exit;
   end;

   iQtde := QtdeMinimaParcelas(qryIDCONDINICIAL.AsFloat);
   if qryNUMPARCELAS.AsInteger < iQtde then begin
      MsgDlg('Nr. Mínimo de parcelas na Repactuação = ' + FormatFloat('##0',iQtde) +
             ', pois as mesmas já foram integradas.','Erro',mtError,[mbOK],0);
      dbedtParc.SetFocus;
      Accept := False;
      Exit;
   end;

   if TemParcIntegrada(qryIDCONDINICIAL.AsFloat, qryDATAINI.AsDateTime, iQtde) then begin
      if iQtde = 1 then begin
         MsgDlg('Existe ' + FormatFloat('##0',iQtde) +
                ' parcela integrada após esta data. Não é possível efetuar a Repactuação neste período.',
                'Erro',mtError,[mbOK],0);
      end else begin
         MsgDlg('Existem ' + FormatFloat('##0',iQtde) +
                ' parcelas integradas após esta data. Não é possível efetuar a Repactuação neste período.',
                'Erro',mtError,[mbOK],0);
      end;
      cboMes.SetFocus;
      Accept := False;
      Exit;
   end;
end;

function TfrmCadRepactua.TemRepacSuperior(iCond: Double): Boolean;
begin
   Result := False;
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('  SELECT  IDCONDPAGIMOVEL, DATAINI ');
      SQL.Add('    FROM  CONDPAGIMOVEL ');
      SQL.Add('   WHERE  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL)');
      SQL.Add('      OR  (IDCONDINICIAL = :pIDCONDPAGIMOVEL)');
      SQL.Add('ORDER BY  DATAINI ');
      Params[0].AsFloat := iCond;
      Open;
   end;

   if not dtmFinanciamento.qryAux.IsEmpty then begin
      dtmFinanciamento.qryAux.Last;
      if (dtmFinanciamento.qryAux.FieldByName('DATAINI').AsDateTime >= qryDATAINI.AsDateTime) and
         (dtmFinanciamento.qryAux.FieldByName('IDCONDPAGIMOVEL').AsFloat <> qryIDCONDPAGIMOVEL.AsFloat) then begin
         Result := True;
      end;
   end;
end;

function TfrmCadRepactua.TemParcIntegrada(iCond: Double; dDataBase: TDateTime;
                                          var iQtde: Double): Boolean;
var dia, mes, ano: Word;
begin
   Result := False;
   iQtde  := 0;
   DecodeDate(dDataBase, ano, mes, dia);
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('  SELECT  COUNT(*) AS QTDE ');
      SQL.Add('    FROM  PARCFINANCIMOV ');
      SQL.Add('   WHERE  FLGLANCINTEGRA > 0 ');
      SQL.Add('     AND  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL) ');
      SQL.Add('     AND  (TO_CHAR(DATAVENCIMENTO,' + QuotedStr('YYYYMM') + ') >= :pDATA) ');
      Params[0].AsFloat  := iCond;
      Params[1].AsString := FormatFloat('0000',ano) + FormatFloat('00',mes);
      Open;

      if FieldByName('QTDE').AsInteger > 0 then begin
         Result := True;
         iQtde  := FieldByName('QTDE').AsInteger;
      end;
   end;
end;


procedure TfrmCadRepactua.CmeCadastroDelete(Sender: TObject);
var iCond   : Double;
begin
   iCond := qryIDCONDINICIAL.AsFloat;
   inherited;
   AtualizaDataFim(iCond);
   EliminaParcelas(iCond);
   RecalculaParcela(iCond);
   molProposta1.edtNumProp.Clear;
   molProposta1.edtNomProp.Clear;
   edtComprador.Clear;
   cboMes.ItemIndex    := -1;
   cboMesFim.ItemIndex := -1;
   DBspnAno.Value      := 0;
   DBspnAnoFim.Value   := 0;
end;

procedure TfrmCadRepactua.CmeCadastroCancel(Sender: TObject);
begin
   if qry.State = dsInsert then begin
      molProposta1.edtNumProp.Clear;
      molProposta1.edtNomProp.Clear;
      edtComprador.Clear;
      cboMes.ItemIndex    := -1;
      cboMesFim.ItemIndex := -1;
      DBSpnAno.Value      := StrToFloat(Copy(DateToStr(Date),7,4));
      DBspnAnoFim.Value   := 0;
   end;
   inherited;
   FechaParcelasEmAtraso;
   pcRepactua.ActivePageIndex := 0;
   sbBusca.Enabled := False;
end;

procedure TfrmCadRepactua.sbBuscaClick(Sender: TObject);
var ano,mes,dia : word;
    TpCondPag   : TCondPag;
begin
   inherited;
   if (cbomes.ItemIndex = -1) or (DBspnAno.Value < 1000) then begin
      MsgDlg('Selecione um período válido','Erro',mtError,[mbOK],0);
      cboMes.SetFocus;
      Exit;
   end;
   if qry.State = dsInsert then begin
      qryDATAINI.AsDateTime := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
      DecodeDate(qryDATAINI.AsDateTime, ano, mes, dia);
      if FuncAlienacao.BuscaCondPag(qryCondPagIDCONDPAGIMOVEL.AsInteger, mes, ano, False, TpCondPag) then begin
         qryDATAVENCIMENTO.AsDateTime := TpCondPag.dDataVencimento;
         qryNUMPARCELAS.AsInteger     := TpCondPag.iNumParcelas;
         qryPERIODO.AsInteger         := TpCondPag.iPeriodo;
         qryPRAZO.AsString            := TpCondPag.sPrazo;
         qryINDCORRECAO.AsInteger     := TpCondPag.iIDIndCorr;
         qryIDINDCORRPROJ.AsInteger   := TpCondPag.iIDIndProj;
         qryTAXAJUROS.AsFloat         := TpCondPag.fTaxaJuros;
         qryPERIODOTAXA.AsString      := TpCondPag.sPeriodoTaxa;
         qryFLGREAJMENSAL.AsString    := TpCondPag.sFlgReajMensal;
      end else begin
         MsgDlg('Nenhuma parcela encontrada na data especificada','Aviso',mtWarning,[mbOK],0);
      end;
   end;
end;

function TfrmCadRepactua.AtualizaDataFim(iCond: Double): Boolean;
var dDtFim : TDateTime;
begin
   with dtmFinanciamento do begin
      qryAux.SQL.Clear;
      qryAux.SQL.Add('  SELECT  IDCONDPAGIMOVEL, IDCONDINICIAL, NUMPARCELAS, PERIODO, ');
      qryAux.SQL.Add('          PRAZO, DATAINI, DATAVENCIMENTO ');
      qryAux.SQL.Add('    FROM  CONDPAGIMOVEL ');
      qryAux.SQL.Add('   WHERE  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL)');
      qryAux.SQL.Add('      OR  (IDCONDINICIAL = :pIDCONDPAGIMOVEL)');
      qryAux.SQL.Add('ORDER BY  DATAINI ');
      qryAux.Params[0].AsFloat := iCond;
      qryAux.Open;

      if not qryAux.IsEmpty then begin
         qryAux.Last;
         iCond := qryAux.FieldByName('IDCONDPAGIMOVEL').AsFloat;
         FuncAlienacao.CalcFimCondPag(qryAux.FieldByName('IDCONDPAGIMOVEL').AsFloat,
                                      qryAux.FieldByName('IDCONDINICIAL').AsFloat,
                                      qryAux.FieldByName('NUMPARCELAS').AsInteger,
                                      qryAux.FieldByName('PERIODO').AsInteger,
                                      qryAux.FieldByName('PRAZO').AsString,
                                      qryAux.FieldByName('DATAINI').AsDateTime,
                                      qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,
                                      dDtFim, True);
         qryUpdCondPag.ParamByName('pIDCONDPAGIMOVEL').AsFloat := iCond;
         qryUpdCondPag.ParamByName('pDATAFIM').AsString        := DateToStr(dDtFim);
         qryUpdCondPag.ExecSQL;
      end;
   end;
end;


procedure TfrmCadRepactua.sbtnAlterarClick(Sender: TObject);
var iQtde: Double;
begin
   if TemParcIntegrada(qryIDCONDINICIAL.AsFloat, qryDATAINI.AsDateTime, iQtde) then begin
      if iQtde = 1 then begin
         MsgDlg('Existe ' + FormatFloat('##0',iQtde) +
                ' parcela integrada após esta Repactuação. O Registro não pode mais ser alterado.','Erro',mtError,[mbOK],0);
      end else begin
         MsgDlg('Existem ' + FormatFloat('##0',iQtde) +
                ' parcelas integradas após esta Repactuação. O Registro não pode mais ser alterado.','Erro',mtError,[mbOK],0);
      end;
      sbtnAlterar.Down := False;
   end else begin
      inherited;
   end;
end;

procedure TfrmCadRepactua.sbtnApagarClick(Sender: TObject);
var iQtde: Double;
begin
   if TemParcIntegrada(qryIDCONDINICIAL.AsFloat, qryDATAINI.AsDateTime, iQtde) then begin
      if iQtde = 1 then begin
         MsgDlg('Existe ' + FormatFloat('##0',iQtde) +
                ' parcela integrada após esta Repactuação. O Registro não pode ser excluído.','Erro',mtError,[mbOK],0);
      end else begin
         MsgDlg('Existem ' + FormatFloat('##0',iQtde) +
                ' parcelas integradas após esta Repactuação. O Registro não pode ser excluído.','Erro',mtError,[mbOK],0);
      end;
      sbtnApagar.Down := False;
   end else begin
      inherited;
   end;
end;

function TfrmCadRepactua.RecalculaParcela(iCond : Double) : Boolean;
var dDataIni,dDataBase : TDateTime;
begin
   Result    := True;
   dDataIni  := qryCondPagDATAVENCIMENTO.AsDateTime;
   dDataBase := FuncAlienacao.BuscaUltMesGerado(iCond);
   with dtmFinanciamento do begin
      LimpaParametros(qryParc);
      qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat    := iCond;
      qryParc.Open;
      try
         StartTransacao;
         FuncAlienacao.GeraParcela(iCond, dDataIni, dDataBase, DtmFinanciamento.qryParc);
         qryParc.ApplyUpdates;
         qryParc.CommitUpdates;
         CommitTransacao;
      except
         RollBackTransacao;
         raise;
      end;
   end;
end;


function TfrmCadRepactua.QtdeMinimaParcelas(iCond: Double): Double;
begin
   Result := 1;
   with dtmFinanciamento.qryAux do begin
      Sql.Clear;
      Sql.Add('SELECT MAX(NUMPARCELA) AS PARCELA ');
      Sql.Add('  FROM PARCFINANCIMOV ');
      Sql.Add(' WHERE FLGLANCINTEGRA > 0 ');
      Sql.Add('   AND IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL' );
      Params[0].AsFloat := iCond;
      Open;
      if FieldByName('PARCELA').AsFloat > 0 then begin
         Result := FieldByName('PARCELA').AsFloat;
      end;
   end;
end;


function TfrmCadRepactua.EliminaParcelas(iCond: Double): Boolean;
var TpCondPag : TCondPag;
    mes,ano: Integer;
begin
   Result := True;
   mes    := 0;
   ano    := 0;
   FuncAlienacao.BuscaCondPag(iCond, mes, ano, True, TpCondPag);
   with dtmFinanciamento.qryAux do begin
      Sql.Clear;
      Sql.Add('DELETE FROM PARCFINANCIMOV ');
      Sql.Add('WHERE FLGTIPOLANC IN(2,3,4) ');
      Sql.Add('  AND IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL' );
      Sql.Add('  AND NUMPARCELA > :pPARC' );
      Params[0].AsFloat   := iCond;
      Params[1].AsInteger := TpCondPag.iNumParcelas;
      ExecSQL;
   end;
end;

procedure TfrmCadRepactua.qryParcCalcFields(DataSet: TDataSet);
begin
   inherited;
   // Carrega o Tipo de Parcela
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger, -1);
end;

procedure TfrmCadRepactua.pcRepactuaChange(Sender: TObject);
begin
   inherited;
   if pcRepactua.ActivePage = tsParcelas then
      AbreParcelasEmAtraso(qryCondPagIDCONDPAGIMOVEL.AsInteger);
end;


procedure TfrmCadRepactua.AbreParcelasEmAtraso(const iCond: Double);
var rTotAtraso,rTotJuros,rSaldoDev,rTotResiduo : Extended;
    dDataIni : TDateTime;
    sSql     : String;
begin
   rTotAtraso  := 0;
   rTotJuros   := 0;
   rTotResiduo := 0;
   rSaldoDev   := 0;
   if qryParc.Active = False then begin

      // Corrige parcelas em atraso até a data atual
      if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta, -1, -1,
                                           iCond, -1) then begin
         MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
         Exit;
      end;

      // Abre tabela com as parcelas em atraso
      dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
      LimpaParametros(qryParc);
      qryParc.ParamByName('pIDCONDPAGIMOVEL').AsFloat := iCond;
      qryParc.ParamByName('pDTFIM').AsString := DateToStr(dDataIni);
      qryParc.Open;

      // Totaliza Valores em Atraso
      qryParc.DisableControls;
      qryParc.First;
      while not qryParc.Eof do begin
         rTotAtraso  := rTotAtraso  + qryParcVLRDEVIDO.AsFloat;
         rTotResiduo := rTotResiduo + qryParcVLRRESIDUOATUALI.AsFloat;
         rTotJuros   := rTotJuros   + qryParcVLRJUROS.AsFloat;
         qryParc.Next;
      end;
      qryParc.First;

      // Busca Saldo Devedor na Data da Repactuação
      dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
      sSql := 'SELECT FLGTIPOLANC, DATAVENCIMENTO, VLRSALDODEVEDOR ' +
              '  FROM PARCFINANCIMOV ' +
              ' WHERE IDCONDPAGIMOVEL = ' + IntToStr(qryCondPagIDCONDPAGIMOVEL.AsInteger) +
              '   AND ( (DATAVENCIMENTO < TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ',' + QuotedStr('DD/MM/YYYY') + ') ) OR FLGTIPOLANC = 1 ) ' +
              '   AND FLGTIPOLANC IN (1,2,3,4) ' +
              'ORDER BY FLGTIPOLANC, DATAVENCIMENTO ';
      if FazQuery(dtmFinanciamento.qryAux,sSql) then begin
         if not dtmFinanciamento.qryAux.IsEmpty then begin
            dtmFinanciamento.qryAux.Last;
            rSaldoDev := dtmFinanciamento.qryAux.FieldByName('VLRSALDODEVEDOR').AsFloat;
         end;
      end else begin
         MsgDlg('Não foi possível buscar o Saldo Devedor','Erro',mtError,[mbOK],0);
      end;

      edTotAtraso.Value   := rTotAtraso;
      edTotSaldoDev.Value := rSaldoDev;
      edTotDevido.Value   := rTotAtraso + rSaldoDev + rTotResiduo;
      qryParc.EnableControls;
   end;
end;


procedure TfrmCadRepactua.FechaParcelasEmAtraso;
begin
   qryParc.Close;
   edTotAtraso.Value   := 0;
   edTotDevido.Value   := 0;
   edTotSaldoDev.Value := 0;
end;

procedure TfrmCadRepactua.FormShow(Sender: TObject);
begin
   inherited;
   pcRepactua.ActivePageIndex := 0;
   FechaParcelasEmAtraso;
end;

procedure TfrmCadRepactua.cbAlteraSaldoClick(Sender: TObject);
begin
   inherited;
   if cbAlteraSaldo.Checked then begin
      if (qryParc.Active = False) and (molProposta1.iProposta > 0) and (dblcbCondPag.LookupValue <> '') and
         (cboMes.Text <> '') and (DBspnAno.Value > 0) then AbreParcelasEmAtraso(qryCondPagIDCONDPAGIMOVEL.AsInteger);
      edSaldoDev.Value := edTotDevido.Value;
   end else begin
      edSaldoDev.Value := 0;
   end;
end;

procedure TfrmCadRepactua.pcRepactuaChanging(Sender: TObject; var AllowChange: Boolean);
var iQtde    : Double;
    dDataIni : TDateTime;
begin
   inherited;
   AllowChange := True;
   if (molProposta1.iProposta <= 0) or (dblcbCondPag.LookupValue = '') or
      (cboMes.Text = '') or (DBspnAno.Value = 0) then begin
      MsgDlg('Selecione primeiro um Contrato, Condição de Pagamento e Início da Repactuação','Aviso',mtWarning,[mbOK],0);
      AllowChange := False;
      Exit;
   end;

   dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   if TemParcIntegrada(StrToFloat(dblcbCondPag.LookupValue), dDataIni, iQtde) then begin
      if iQtde = 1 then begin
         MsgDlg('Existe ' + FormatFloat('##0',iQtde) +
                ' parcela integrada após esta data. Não é possível efetuar a Repactuação neste período.',
                'Aviso',mtWarning,[mbOK],0);
      end else begin
         MsgDlg('Existem ' + FormatFloat('##0',iQtde) +
                ' parcelas integradas após esta data. Não é possível efetuar a Repactuação neste período.',
                'Aviso',mtWarning,[mbOK],0);
      end;
      cboMes.SetFocus;
      AllowChange := False;
   end;
end;


procedure TfrmCadRepactua.cboMesChange(Sender: TObject);
begin
   inherited;
   FechaParcelasEmAtraso;
end;

procedure TfrmCadRepactua.dblcbCondPagChange(Sender: TObject);
begin
   inherited;
   FechaParcelasEmAtraso;
end;


end.
