// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryFichaFinancIndiv filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelFichaFinancIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TdtmRelFichaFinancIndiv = class(TdtmReports)
    qryFichaFinancIndiv: TwwQuery;
    dsFichaFinancIndiv: TwwDataSource;
    pplFichaFinancIndiv: TppBDEPipeline;
    rpFichaFinancIndiv: TppReport;
    plAgrupaRub: TppBDEPipeline;
    dsAgrupaRub: TwwDataSource;
    qryAgrupaRub: TwwQuery;
    qryFundacao: TwwQuery;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppLabel50: TppLabel;
    dbNome: TppDBText;
    rpFichaFinancLabel1: TppLabel;
    dbMatric: TppDBText;
    lbMatric: TppLabel;
    lbDataNasc: TppLabel;
    dbDataNasc: TppDBText;
    lbRateio: TppLabel;
    lbIsento: TppLabel;
    dbIsento: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    lbAnoMes: TppLabel;
    dbAnoMes: TppDBText;
    ppLine2: TppLine;
    rpFichaFinancLabel4: TppLabel;
    rpFichaFinancLabel5: TppLabel;
    Provento: TppLabel;
    Desconto: TppLabel;
    rpFichaFinancLine1: TppLine;
    lblInformativa: TppLabel;
    dbCodRubrica: TppDBText;
    dbDescrRubrica: TppDBText;
    dbRubProvento: TppDBText;
    dbRubDesconto: TppDBText;
    dbRubInformativa: TppDBText;
    ppLine1: TppLine;
    lbTotVersao: TppLabel;
    dbSumProvVersao: TppDBCalc;
    dbSumDescVersao: TppDBCalc;
    lbLiqVersao: TppLabel;
    lbRecebeLiqVersao: TppLabel;
    ppLine3: TppLine;
    lbTotMes: TppLabel;
    dbSumProvMes: TppDBCalc;
    dbSumDescMes: TppDBCalc;
    lbLiqMes: TppLabel;
    lbRecebeLiqMes: TppLabel;
    lbNumSeq: TppLabel;
    dbNumSeq: TppDBText;
    ppCalc26: TppSystemVariable;
    ppLine31: TppLine;
    ppCalc25: TppSystemVariable;
    ppLabel78: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    lbTituloResumo: TppLabel;
    ppLine4: TppLine;
    lbCodRubricaResumo: TppLabel;
    lbDescrRubricaResumo: TppLabel;
    lbRubProvento: TppLabel;
    lbRubDesconto: TppLabel;
    dbCodRubResumo: TppDBText;
    dbDescrRubricaResumo: TppDBText;
    dbRubProventoResumo: TppDBText;
    dbRubDescResumo: TppDBText;
    lbTotGeral: TppLabel;
    ppLine5: TppLine;
    lbLiqGeral: TppLabel;
    dbTotGeralProvento: TppDBCalc;
    dbTotGeralDesconto: TppDBCalc;
    lbRecebeLiqGeral: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    qryRateio: TwwQuery;
    ppFooterBand2: TppFooterBand;
    ppCalc16: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppLine16: TppLine;
    ppLabel52: TppLabel;
    ppDBImage2: TppDBImage;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel1: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    lbValorRateio: TppLabel;
    lbNomeOp1: TppLabel;
    lbNomeOp2: TppLabel;
    lbNomeOp3: TppLabel;
    lbValor1: TppLabel;
    lbValor2: TppLabel;
    lbValor3: TppLabel;
    ppLabel3: TppLabel;
    dbVersao: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel4: TppLabel;
    dbtnome: TppDBText;
    ppLabel5: TppLabel;
    dbSequencial: TppDBText;
    ppLabel6: TppLabel;
    dbDatanasc2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText17: TppDBText;
    function MostraParam(Form : String): Boolean; override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryFichaFinancIndivAfterClose(DataSet: TDataSet);
    procedure rpFichaFinancIndivBeforePrint(Sender: TObject);
    procedure qryFichaFinancIndivBeforeOpen(DataSet: TDataSet);
    procedure qryFichaFinancIndivAfterOpen(DataSet: TDataSet);
    procedure dbSumDescVersaoPrint(Sender: TObject);
    procedure dbSumDescMesPrint(Sender: TObject);
    procedure dbTotGeralDescontoPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelFichaFinancIndiv: TdtmRelFichaFinancIndiv;

implementation

uses FPRelFichaFinancIndiv, uAdmPrevFB, fAguarde;

{$R *.DFM}

{ TdtmRelFichaFinancIndiv }

function TdtmRelFichaFinancIndiv.MostraParam(Form: String): Boolean;
Var
  Frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELFICHAFINANCINDIV' Then
    Frm := TFrmPRelFichaFinancIndiv.Create(Application);

  If Frm = Nil Then
    Result := True
  Else
  Begin
    With Frm Do
    Begin
      Result := (ShowModal = mrOk);
      Free;
    End;
  End;
end;

procedure TdtmRelFichaFinancIndiv.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := iIdFundacao;
  qryFundacao.Open
end;

procedure TdtmRelFichaFinancIndiv.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelFichaFinancIndiv.qryFichaFinancIndivAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFichaFinancIndiv.rpFichaFinancIndivBeforePrint(
  Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelFichaFinancIndiv.qryFichaFinancIndivBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFichaFinancIndiv.qryFichaFinancIndivAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFichaFinancIndiv.dbSumDescVersaoPrint(Sender: TObject);
begin
  inherited;
  lbRecebeLiqVersao.Caption := FloatToStr(StrToFloat(dbSumProvVersao.Text) -
                                          StrToFloat(dbSumDescVersao.Text));
end;

procedure TdtmRelFichaFinancIndiv.dbSumDescMesPrint(Sender: TObject);
begin
  inherited;
  lbRecebeLiqMes.Caption := FloatToStr(StrToFloat(dbSumProvMes.Text) -
                                       StrToFloat(dbSumDescMes.Text));
end;

procedure TdtmRelFichaFinancIndiv.dbTotGeralDescontoPrint(Sender: TObject);
begin
  inherited;
  lbRecebeLiqGeral.Caption := FloatToStr(StrToFloat(dbTotGeralProvento.Text) -
                                         StrToFloat(dbTotGeralDesconto.Text));
end;

end.
