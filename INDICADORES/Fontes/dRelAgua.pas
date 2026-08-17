unit dRelAgua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppCache, ppModule, raCodMod, ppCtrls, ppStrtch,
  ppSubRpt, ppVar, ppPrnabl, uCtrlRelIndicadores, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, ppChrt;

type
  TdtmRelAgua = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    CMspStr: TCMSqlParams;
    cdsStr: TClientDataSet;
    dsStr: TDataSource;
    pplStr: TppBDEPipeline;
    ppAgua: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppOrcamentoLabel1: TppLabel;
    ppOrcamentoLabel2: TppLabel;
    ppOrcamentoLabel3: TppLabel;
    ppOrcamentoLabel4: TppLabel;
    ppOrcamentoLabel5: TppLabel;
    ppOrcamentoLabel6: TppLabel;
    ppOrcamentoLabel7: TppLabel;
    ppOrcamentoLabel8: TppLabel;
    ppOrcamentoLabel9: TppLabel;
    ppOrcamentoLabel10: TppLabel;
    ppOrcamentoLabel11: TppLabel;
    ppOrcamentoLabel12: TppLabel;
    ppOrcamentoLabel13: TppLabel;
    ppLabel3: TppLabel;
    ppDBText30: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine1: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText29: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppTeeChart1: TppTeeChart;
    ppTeeChartControl1: TppTeeChartControl;
    BarSeries1: TBarSeries;
    BarSeries3: TBarSeries;
    BarSeries4: TBarSeries;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    dbtUnid: TppDBText;
    dbcJan: TppDBCalc;
    dbcFev: TppDBCalc;
    dbcMar: TppDBCalc;
    dbcAbr: TppDBCalc;
    dbcMai: TppDBCalc;
    dbcJun: TppDBCalc;
    dbcJul: TppDBCalc;
    dbcAgo: TppDBCalc;
    dbcSet: TppDBCalc;
    dbcOut: TppDBCalc;
    dbcNov: TppDBCalc;
    dbcDez: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppDetailBand1AfterPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
    iGrafico              : Integer;
  public
    { Public declarations }
  end;

var
  dtmRelAgua: TdtmRelAgua;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelAgua.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelConsumoNum(
                                    3481,                                 // idReport SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger);   // Ano Referencia
  cdsStr.Data := CtrlRelIndicadores.BuscaRelConsumoStr(
                                    3481,                                 // idReport SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger);   // Ano Referencia
  iGrafico := 0;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[2].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[3].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[4].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelAgua.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelIndicadores);
end;

procedure TdtmRelAgua.ppDetailBand1AfterPrint(Sender: TObject);
begin
  inherited;
  if iGrafico < 3 then begin
    ppTeeChartControl1.Series[iGrafico].Title := cds.FieldByName('DSC_INDICADOR').AsString + '   ';
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRJAN').AsInteger,'Jan');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRFEV').AsInteger,'Fev');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRMAR').AsInteger,'Mar');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRABR').AsInteger,'Abr');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRMAI').AsInteger,'Mai');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRJUN').AsInteger,'Jun');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRJUL').AsInteger,'Jul');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRAGO').AsInteger,'Ago');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRSET').AsInteger,'Set');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLROUT').AsInteger,'Out');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRNOV').AsInteger,'Nov');
    ppTeeChartControl1.Series[iGrafico].Add(cds.FieldByName('VLRDEZ').AsInteger,'Dez');
    iGrafico := iGrafico + 1;
  end;
end;

procedure TdtmRelAgua.ppsCorPrint(Sender: TObject);
begin
  inherited;
  if bCorLinha then begin
     if CorAtual = clWhite then begin
        CorAtual := CorLinha;
     end else begin
        CorAtual := clWhite;
     end;
  end else begin
     CorAtual := clWhite;
  end;
  (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TdtmRelAgua.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
