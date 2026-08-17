unit dRelGraficoHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppCache, ppClass, ppDB, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppCtrls, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, ppChrtDP, ppChrt, ppVar, ppPrnabl, uCtrlRelHotel, TXRB;

type
  TdtmRelGraficoHotel = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppGraficoHotel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppDPTeeChart1: TppDPTeeChart;
    ppDBText1: TppDBText;
    lblCompetencia: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlRelHotel : TCtrlRelHotel;
  public
    { Public declarations }
  end;

var
  dtmRelGraficoHotel: TdtmRelGraficoHotel;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelGraficoHotel.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelHotel := TCtrlRelHotel.Create;
  CtrlRelHotel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelHotel.BuscaRelGrafico(CmpRptCM.ParamValues[0].AsInteger,  // Indicador
                                           CmpRptCM.ParamValues[1].AsInteger,  // Mes
                                           CmpRptCM.ParamValues[2].AsInteger,  // Ano
                                           CmpRptCM.ParamValues[3].AsInteger,  // Hotel 1
                                           CmpRptCM.ParamValues[4].AsInteger,  // Hotel 2
                                           CmpRptCM.ParamValues[5].AsInteger,  // Hotel 3
                                           CmpRptCM.ParamValues[6].AsInteger,  // Hotel 4
                                           CmpRptCM.ParamValues[7].AsInteger,  // Hotel 5
                                           CmpRptCM.ParamValues[8].AsInteger,  // Hotel 6
                                           CmpRptCM.ParamValues[9].AsInteger); // Hotel 7

  lblCompetencia.Caption := 'Competência: ' +
                            ComunsImobiliario.Competencia(CmpRptCM.ParamValues[1].AsInteger,
                                                          CmpRptCM.ParamValues[2].AsInteger);
end;

procedure TdtmRelGraficoHotel.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelHotel );
  inherited;
end;

end.
