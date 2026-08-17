unit rOrdemDePago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppMemo, ppCtrls,
  ppBands, ppReport, ppSubRpt, ppClass, ppStrtch, ppRegion, ppVar,
  ppPrnabl, ppCache, ppProd, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, uExtensoCM, uCmSqlParams, DBClient,
  uCMClientDataSet;

type
  TRptOrdemDePago = class(TFrmCmReport)
    PpOrdemPago: TppBDEPipeline;
    PpOrdemPagoppField1: TppField;
    PpOrdemPagoppField2: TppField;
    PpOrdemPagoppField3: TppField;
    PpOrdemPagoppField4: TppField;
    PpOrdemPagoppField5: TppField;
    PpOrdemPagoppField6: TppField;
    PpOrdemPagoppField7: TppField;
    PpOrdemPagoppField8: TppField;
    PpOrdemPagoppField9: TppField;
    PpOrdemPagoppField10: TppField;
    PpOrdemPagoppField11: TppField;
    PpOrdemPagoppField12: TppField;
    PpOrdemPagoppField13: TppField;
    PpOrdemPagoppField14: TppField;
    PpOrdemPagoppField15: TppField;
    PpOrdemPagoppField16: TppField;
    DsOredemPago: TwwDataSource;
    DsQryContabLancLote: TwwDataSource;
    PpQryContabLancLote: TppBDEPipeline;
    DsQryContab3Lote: TwwDataSource;
    PpQryContab3Lote: TppBDEPipeline;
    PpQryContabBaixaLote: TppBDEPipeline;
    PpQryAltLote: TppBDEPipeline;
    PpQryAltLoteppField1: TppField;
    PpQryAltLoteppField2: TppField;
    PpQryAltLoteppField3: TppField;
    PpQryAltLoteppField4: TppField;
    PpQryAltLoteppField5: TppField;
    DsQryAltLote: TwwDataSource;
    PpQryRateiParcPago: TppBDEPipeline;
    DsQryRateiParcPago: TwwDataSource;
    DsQryContabBaixaLote: TwwDataSource;
    PpQryDocsLote: TppBDEPipeline;
    DsQryDocsLote: TwwDataSource;
    PpQryRateioLote: TppBDEPipeline;
    DsQryRateioLote: TwwDataSource;
    Extenso: TExtensoCM;
    CdsAltLote: TCMClientDataSet;
    SqlAltLote: TCMSqlParams;
    CdsOrdemPago: TCMClientDataSet;
    SqlOrdemPago: TCMSqlParams;
    CdsContabBaixaLote: TCMClientDataSet;
    SqlContabBaixaLote: TCMSqlParams;
    CdsContab3Lote: TCMClientDataSet;
    SqlContab3Lote: TCMSqlParams;
    CdsContabLancLote: TCMClientDataSet;
    SqlContabLancLote: TCMSqlParams;
    CdsRateiParcPago: TCMClientDataSet;
    SqlRateiParcPago: TCMSqlParams;
    CdsDocsLote: TCMClientDataSet;
    SqlDocsLote: TCMSqlParams;
    CdsRateioLote: TCMClientDataSet;
    SqlRateioLote: TCMSqlParams;
    RptOrdemPago: TppReport;
    ppDetailBand6: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLine19: TppLine;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    RptOrdemPagoSummaryBand1: TppSummaryBand;
    RptOrdemPagoRegion1: TppRegion;
    MemObsOp: TppMemo;
    RptOrdemPagoLabel5: TppLabel;
    RptOrdemPagoLine1: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText15: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBText16: TppDBText;
    ppLabel57: TppLabel;
    RptOrdemPagoDBText3: TppDBText;
    RptOrdemPagoLabel3: TppLabel;
    RptOrdemPagoDBText5: TppDBText;
    ImgLogo: TppImage;
    ppLabel25: TppLabel;
    ppLabel28: TppLabel;
    ppLine18: TppLine;
    RptOrdemPagoDBText6: TppDBText;
    ppLine28: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand7: TppDetailBand;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand8: TppDetailBand;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLine22: TppLine;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLine23: TppLine;
    ppDetailBand10: TppDetailBand;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppChildReport4SummaryBand1: TppSummaryBand;
    ppChildReport4Label1: TppLabel;
    ppChildReport4Label2: TppLabel;
    ppChildReport4Label3: TppLabel;
    LblValorLote: TppDBText;
    LblTotalLiq: TppLabel;
    ppChildReport4Line1: TppLine;
    lbltotalalt: TppLabel;
    ppRegion3: TppRegion;
    LblCalcValor: TppDBCalc;
    RptOrdemPagoDBMemo1: TppDBMemo;
    ppLabel58: TppLabel;
    RptOrdemPagoLabel1: TppLabel;
    RptOrdemPagoDBText1: TppDBText;
    RptOrdemPagoLabel2: TppLabel;
    RptOrdemPagoDBText2: TppDBText;
    RptOrdemPagoLabel4: TppLabel;
    RptOrdemPagoDBText4: TppDBText;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppDetailBand11: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    RptRateioLote: TppSubReport;
    RptOrdemPagoChildReport1: TppChildReport;
    RptOrdemPagoChildReport1DetailBand1: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    RptDocumentosLote: TppSubReport;
    RptOrdemPagoChildReport2: TppChildReport;
    RptOrdemPagoChildReport2HeaderBand1: TppHeaderBand;
    RptOrdemPagoChildReport2Label1: TppLabel;
    RptOrdemPagoChildReport2Label2: TppLabel;
    RptOrdemPagoChildReport2Label3: TppLabel;
    RptOrdemPagoChildReport2Label4: TppLabel;
    RptOrdemPagoChildReport2Label5: TppLabel;
    RptOrdemPagoChildReport2Label6: TppLabel;
    RptOrdemPagoChildReport2Label7: TppLabel;
    RptOrdemPagoChildReport2Line1: TppLine;
    RptOrdemPagoChildReport2DetailBand1: TppDetailBand;
    RptOrdemPagoChildReport2DBText1: TppDBText;
    RptOrdemPagoChildReport2DBText5: TppDBText;
    RptOrdemPagoChildReport2DBText7: TppDBText;
    RptOrdemPagoChildReport2DBText8: TppDBText;
    RptOrdemPagoChildReport2DBText9: TppDBText;
    RptOrdemPagoChildReport2DBText10: TppDBText;
    RptOrdemPagoChildReport2SummaryBand1: TppSummaryBand;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLine20: TppLine;
    CdsAltLotetot: TCMClientDataSet;
    SqlAltLotetot: TCMSqlParams;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    procedure CdsOrdemPagoCalcFields(DataSet: TDataSet);
    procedure CdsOrdemPagoAfterScroll(DataSet: TDataSet);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure lbltotalaltPrint(Sender: TObject);
    procedure LblTotalLiqPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptOrdemDePago: TRptOrdemDePago;

implementation

{$R *.DFM}

procedure TRptOrdemDePago.CdsOrdemPagoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CdsOrdemPago.FieldByName('VALORLOTE').AsFloat = 0.00 then
    CdsOrdemPago.FieldByName('EXTENSO').AsString := ''
  else
  begin
    Extenso.Valor := CdsOrdemPago.FieldByName('VALORLOTE').AsFloat;
    Extenso.SetaIdiomaPadrao;
    Extenso.SetaMoedaPadrao;
    Extenso.Escreve;
    CdsOrdemPago.FieldByName('EXTENSO').AsString := Extenso.Extenso;
  end;

end;

procedure TRptOrdemDePago.CdsOrdemPagoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CdsAltLote.Active := False;
  SqlAltLote.Prepare;
  SqlAltLote.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlAltLote.Open;

  CdsContabBaixaLote.Active := False;
  SqlContabBaixaLote.Prepare;
  SqlContabBaixaLote.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlContabBaixaLote.Open;

  CdsContab3Lote.Active := False;
  SqlContab3Lote.Prepare;
  SqlContab3Lote.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlContab3Lote.Open;

  CdsContabLancLote.Active := False;
  SqlContabLancLote.Prepare;
  SqlContabLancLote.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlContabLancLote.Open;

  CdsRateiParcPago.Active := False;
  SqlRateiParcPago.Prepare;
  SqlRateiParcPago.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlRateiParcPago.Open;

  CdsDocsLote.Active := False;
  SqlDocsLote.Prepare;
  SqlDocsLote.ParamByName('CODALTERADOR').AsInteger := CdsOrdemPago.FieldByName('CODALTERADOR').AsInteger;
  SqlDocsLote.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlDocsLote.Open;

  CdsRateioLote.Active := False;
  SqlRateioLote.Prepare;
  SqlRateioLote.ParamByName('NUMLOTE').AsInteger := CdsOrdemPago.FieldByName('NUMLOTE').AsInteger;
  SqlRateioLote.Open;

end;

procedure TRptOrdemDePago.CrmRptCMBeforePrint(Sender: TObject);
var
  LblRelats: TppLabel;
Begin
  Inherited;
  SqlTeste.SQL.Text := 'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
    + FloatToStr(CrmRptCM.IdModulo) + ') AND (IDPESSOA = '
    + FloatToStr(CrmRptCM.idEmpresa) + ')';
  SqlTeste.Open;
  CdsTeste.First;
  While Not CdsTeste.Eof Do
  Begin
    Try
      LblRelats := (FindComponent(CdsTeste.FieldByName('NOMECOMPO').AsString) As TppLabel);
      If LblRelats = Nil Then
        LblRelats := (FindComponent(Cdsteste.FieldByName('NOMECOMPO').AsString) As TppLabel);

      If LblRelats <> Nil Then
        LblRelats.Caption := CdsTeste.FieldByName('VALOR').AsString;
    Finally
      CdsTeste.Next;
    End;
  End;
  if not CmpRptCM.ParamValues[0].isnull then
    with SqlOrdemPago do
    begin
      Close;          {    /*+ RULE */ }
      SQL.TEXT := 'SELECT ' +
        '  LP.NUMLOTE, ' +
        '  LP.DATAEMISSAO, ' +
        '  LP.NUMCHQBORDERO, ' +
        '  LP.FAVORECIDO, ' +
        '  LP.OBSERVACAO, ' +
        '  LP.DATADIFERIDO, ' +
        '  SUM(VL.VALORLOTE) AS VALORLOTE, ' +
        '  SUM(VLRET.VALORRETENCAO) AS VALORRETENCAO, ' +
        '  SUM((' +
        '    DECODE(VL.VALORLOTE, NULL, 0, VL.VALORLOTE) + ' +
        '    DECODE(VLRET.VALORRETENCAO, NULL, 0, (VLRET.VALORRETENCAO)*-1))) AS VALOTTOTAL, ' +
        '  PBANCO.RAZAOSOCIAL, ' +
        '  PF.CODARQUIVOREMESSA, ' +
        '  PF.IDTEMPLCHEQUE, ' +
        '  LP.NUMSLIP, ' +
        '  DECODE(LP.FLAGCANCEL, ''C'', ''CANCELADA'', ' +
        '         DECODE(LP.FLAGCANCEL, ''R'', ''CANCELADA'', '''')) AS CANCELADO, ' +
        CmpRptCM.ParamValues[1].AsString + ' AS CODALTERADOR ' +
        'FROM LOTEPAGTO LP, PORTADORFORMA PF, PORTADORCONTA PC, PESSOA PBANCO, ' +
        '  (SELECT ' +
        '    D.NUMSLIP, ' +
        '    L.NUMLOTE, ' +
        '    SUM(L.VALOR) AS VALORLOTE ' +
        '   FROM ' +
        '      LOTEXDOCUM L, ' +
        '      DOCUMENTO D ' +
        '   WHERE ' +
        '      (L.NUMLOTE IN (' + CmpRptCM.ParamValues[0].AsString + ')) AND ' +
        '      (L.CODDOCUMENTO = D.CODDOCUMENTO) ' +
        '   GROUP BY NUMSLIP, NUMLOTE) VL, ' +
        '  (SELECT ' +
        '     L.NUMLOTE, ' +
        '     SUM(DECODE(LANC.DEBCRE,''C'',LANC.VALOR,-1*LANC.VALOR)) AS VALORRETENCAO ' +
        '   FROM LOTEXDOCUM L, LANCTODOCUM LANC ' +
        '   WHERE (L.CODDOCUMENTO = LANC.CODDOCUMENTO) AND ' +
        '         (LANC.CODALTERADOR = ' + CmpRptCM.ParamValues[1].AsString + ') AND ' +
        '         (L.NUMLOTE IN (' + CmpRptCM.ParamValues[0].AsString + ')) ' +
        '   GROUP BY L.NUMLOTE) VLRET ' +
        'WHERE (LP.NUMLOTE IN (' + CmpRptCM.ParamValues[0].AsString + ')) AND ' +
        '      (PF.CODPORTADOR = PC.CODPORTADOR) AND ' +
        '      (PC.IDBANCO = PBANCO.IDPESSOA) AND ' +
        '      (LP.NUMLOTE = VL.NUMLOTE) AND ' +
        '      (LP.NUMLOTE = VLRET.NUMLOTE(+)) AND ' +
        '      (LP.CODPORTFORMA = PF.CODPORTFORMA) ' +
        'GROUP BY LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO, ' +
        '         LP.OBSERVACAO, LP.DATADIFERIDO, PBANCO.RAZAOSOCIAL, PF.CODARQUIVOREMESSA, ' +
        '         PF.IDTEMPLCHEQUE, LP.NUMSLIP, LP.FLAGCANCEL ' +
        'ORDER BY LP.NUMCHQBORDERO';
      Open;
    end;
end;

procedure TRptOrdemDePago.lbltotalaltPrint(Sender: TObject);
begin
  inherited;
  CdsAltLotetot.Close;
  SqlAltLotetot.Prepare;
  SqlAltLotetot.parambyname('numlote').asfloat := CdsOrdemPago.FieldByName('numlote').Value;
  SqlAltLotetot.open;
  lbltotalalt.Caption := FloatToStrF((CdsAltLotetot.Fieldbyname('valor').asfloat), ffnumber, 17, 2);
end;

procedure TRptOrdemDePago.LblTotalLiqPrint(Sender: TObject);
begin
  inherited;
  LblTotalLiq.Caption := FloatToStrF((CdsOrdemPago.FieldByName('VALORLOTE').Value + LblCalcValor.Value), ffnumber, 17, 2);
end;

end.

