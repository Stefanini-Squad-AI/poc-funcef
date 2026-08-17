unit dRelEnergia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppModule,
  raCodMod, ppStrtch, ppSubRpt, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, ppChrt, uCtrlRelIndicadores, TXRB, ppParameter;

type
  TdtmRelEnergia = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppEnergia: TppReport;
    CMspStr: TCMSqlParams;
    cdsStr: TClientDataSet;
    dsStr: TDataSource;
    pplStr: TppBDEPipeline;
    ppParameterList1: TppParameterList;
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
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine3: TppLine;
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
    raCodeModule1: TraCodeModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppGroupFooterBand2AfterPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelEnergia: TdtmRelEnergia;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelEnergia.CrmRptCMBeforePrint(Sender: TObject);
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
                                    3454,                                 // idReport SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger);   // Ano Referencia

  cdsStr.Data := CtrlRelIndicadores.BuscaRelConsumoStr(
                                    3454,                                 // idReport SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger);   // Ano Referencia   }

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[2].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[3].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[4].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelEnergia.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelEnergia.ppGroupFooterBand2AfterPrint(Sender: TObject);
begin
  inherited;

  if dbtUnid.Text = 'KWh' then begin

// 23390 - Início --------------------------------------------------------------
    ppTeeChart1.Chart.Series[0].Clear;
    ppTeeChart1.Chart.Series[0].Add(dbcJan.Value,'Jan');
    ppTeeChart1.Chart.Series[0].Add(dbcFev.Value,'Fev');
    ppTeeChart1.Chart.Series[0].Add(dbcMar.Value,'Mar');
    ppTeeChart1.Chart.Series[0].Add(dbcAbr.Value,'Abr');
    ppTeeChart1.Chart.Series[0].Add(dbcMai.Value,'Mai');
    ppTeeChart1.Chart.Series[0].Add(dbcJun.Value,'Jun');
    ppTeeChart1.Chart.Series[0].Add(dbcJul.Value,'Jul');
    ppTeeChart1.Chart.Series[0].Add(dbcAgo.Value,'Ago');
    ppTeeChart1.Chart.Series[0].Add(dbcSet.Value,'Set');
    ppTeeChart1.Chart.Series[0].Add(dbcOut.Value,'Out');
    ppTeeChart1.Chart.Series[0].Add(dbcNov.Value,'Nov');
    ppTeeChart1.Chart.Series[0].Add(dbcDez.Value,'Dez');
// 23390 - Fim -----------------------------------------------------------------

  end;

end;

procedure TdtmRelEnergia.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelEnergia.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
