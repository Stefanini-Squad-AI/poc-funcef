unit dRelNDsVencidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar, ppModule,
  raCodMod, Provider, DBTables, Wwquery, TXRB;

type
  TdtmRelNDsVencidas = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppNDsVencidas: TppReport;
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
    vTotDet: TppVariable;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppOrcamentoLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    dbcTotAlug: TppDBCalc;
    dbcTotEnc: TppDBCalc;
    dbcTotFund: TppDBCalc;
    dbcTotLuv: TppDBCalc;
    vTotShop: TppVariable;
    qry: TwwQuery;
    dsp: TDataSetProvider;
    procedure ppNDsVencidasBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelNDsVencidas: TdtmRelNDsVencidas;

implementation

{$R *.DFM}

procedure TdtmRelNDsVencidas.ppNDsVencidasBeforePrint(Sender: TObject);
begin
  inherited;
  cds.Close;
  cds.Open;
end;

end.
