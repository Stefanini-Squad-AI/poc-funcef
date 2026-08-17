unit dRelVeiculoSem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppModule, raCodMod, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrt, Provider,
  DBTables, Wwquery, uCtrlRelIndicadores, TXRB;

type
  TdtmRelVeiculoSem = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppVeiculoSem: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    vTotMes: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLabel2: TppLabel;
    ppOrcamentoLabel3: TppLabel;
    ppOrcamentoLabel6: TppLabel;
    ppOrcamentoLabel7: TppLabel;
    ppOrcamentoLabel8: TppLabel;
    ppOrcamentoLabel9: TppLabel;
    ppOrcamentoLabel10: TppLabel;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    vTDom: TppVariable;
    vTSeg: TppVariable;
    vTTer: TppVariable;
    vTQua: TppVariable;
    vTQui: TppVariable;
    vTSex: TppVariable;
    vTSab: TppVariable;
    vTGeral: TppVariable;
    ppGrafico: TppTeeChart;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores : TCtrlRelIndicadores;
  public
    { Public declarations }
  end;

var
  dtmRelVeiculoSem: TdtmRelVeiculoSem;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelVeiculoSem.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelVeiculoSem(3449,                 // idReport no SAD
                                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                                    CmpRptCM.ParamValues[1].AsDateTime,   // Data inicial
                                                    CmpRptCM.ParamValues[2].AsDateTime);  // Data Final
end;


procedure TdtmRelVeiculoSem.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;

// Daniel - 23390 - Início -----------------------------------------------------
   ppGrafico.Chart.Series[0].Clear;
   ppGrafico.Chart.Series[0].Add(vTDom.Value, '  DOM  '+FormatFloat('0.00%',(vTDom.Value/vTGeral.Value)*100));
   ppGrafico.Chart.Series[0].Add(vTSeg.Value, '  SEG  '+FormatFloat('0.00%',(vTSeg.Value/vTGeral.Value)*100));
   ppGrafico.Chart.Series[0].Add(vTTer.Value, '  TER  '+FormatFloat('0.00%',(vTTer.Value/vTGeral.Value)*100));
   ppGrafico.Chart.Series[0].Add(vTQua.Value, '  QUA  '+FormatFloat('0.00%',(vTQua.Value/vTGeral.Value)*100));
   ppGrafico.Chart.Series[0].Add(vTQui.Value, '  QUI  '+FormatFloat('0.00%',(vTQui.Value/vTGeral.Value)*100));
   ppGrafico.Chart.Series[0].Add(vTSex.Value, '  SEX  '+FormatFloat('0.00%',(vTSex.Value/vTGeral.Value)*100));
   ppGrafico.Chart.Series[0].Add(vTSab.Value, '  SAB  '+FormatFloat('0.00%',(vTSab.Value/vTGeral.Value)*100));
// Daniel - 23390 - Fim --------------------------------------------------------

end;

procedure TdtmRelVeiculoSem.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelIndicadores);
end;

end.
