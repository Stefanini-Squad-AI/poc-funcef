//******************************************************************************
// Data      : 16/02/2007
// Codigo    : AL_01
// Pendência : 24475
// Motivo    : Consulta de Boleta de Operação dos Fundos.
//******************************************************************************

unit RConsBoletaOperFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppDBPipe, ppDBBDE, Db, DBClient, uCMClientDataSet,
  uCmSqlParams, ppBands, ppCtrls, ppClass, ppVar, ppStrtch, ppMemo,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, TXRB, CmParamReport;

type
  TRelConsBoletaOperFundo = class(TFrmCmReport)
    rptBoletaFundo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    rptRenFixSaldoTitulo: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    pplblDataOperacao: TppLabel;
    ppdbDataOperacao: TppDBText;
    pplblDataLiquidacao: TppLabel;
    ppLine3: TppLine;
    pplblBoleta: TppLabel;
    ppdbBoleta: TppDBText;
    ppdbDtaLiq: TppDBText;
    ppbBandaDetalhe: TppDetailBand;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    pplblQuantidade: TppLabel;
    pplblValor: TppLabel;
    ppdbQuantidade: TppDBText;
    ppDBText12: TppDBText;
    pplblPrazo: TppLabel;
    ppLabel4: TppLabel;
    ppDBText14: TppDBText;
    pplblPuOperacao: TppLabel;
    ppdbPuOperacao: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLine4: TppLine;
    ppDBPrazo: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel18: TppLabel;
    pplblTitulo: TppLabel;
    ppdbDescOperacao: TppDBText;
    ppdbDesInvestimento: TppDBText;
    ppdbDescEmissor: TppDBText;
    ppdbDescCustodiante: TppDBText;
    pplblEmissor: TppLabel;
    pplblCustodiante: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    sqlBoletaFundo: TCMSqlParams;
    cdsBoletaFundo: TCMClientDataSet;
    dsBoletaFundo: TDataSource;
    pplBoletaFundo: TppBDEPipeline;
    LblSistema: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelConsBoletaOperFundo: TRelConsBoletaOperFundo;

implementation

{$R *.DFM}

end.
