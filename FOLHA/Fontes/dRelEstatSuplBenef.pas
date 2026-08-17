{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit dRelEstatSuplBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrtDP,
  ppChrt;

type
  TdtmRelEstatSuplBenef = class(TdtmReports)
    QryEstatSuplBenef: TwwQuery;
    QryEstatSuplBenefMESCOBRANCA: TStringField;
    QryEstatSuplBenefBENEFICIO: TStringField;
    QryEstatSuplBenefSUPLEMENTACAOES: TFloatField;
    QryEstatSuplBenefQTDE: TFloatField;
    DSEstatSuplBenef: TwwDataSource;
    PipeEstatSuplBenef: TppBDEPipeline;
    PipeEstatSuplBenefppField1: TppField;
    PipeEstatSuplBenefppField2: TppField;
    PipeEstatSuplBenefppField3: TppField;
    PipeEstatSuplBenefppField4: TppField;
    pprEstatSuplBenef: TppReport;
    ppHeaderBand33: TppHeaderBand;
    ppLabel181: TppLabel;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBImage14: TppDBImage;
    ppDetailBand34: TppDetailBand;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppFooterBand33: TppFooterBand;
    ppSystemVariable9: TppSystemVariable;
    ppLine84: TppLine;
    ppLabel164: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppLabel168: TppLabel;
    ppLabel177: TppLabel;
    ppDBText141: TppDBText;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLine88: TppLine;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDPTeeChart2: TppDPTeeChart;
    ppDPTeeChartControl2: TppDPTeeChartControl;
    Series2: TBarSeries;
    ppDPTeeChart3: TppDPTeeChart;
    ppDPTeeChartControl3: TppDPTeeChartControl;
    BarSeries1: TBarSeries;
    function MostraParam(Form: string): boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelEstatSuplBenef: TdtmRelEstatSuplBenef;

implementation

uses FParamRelEstatSuplBenef, dRelFolha;
{$R *.DFM}


function TdtmRelEstatSuplBenef.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMPARAMRELESTATSUPLBENEF'   then frm := TFRMParamRelEstatSuplBenef.Create(Application)
  else
    frm:=nil;

  if frm = nil then
    Result:= true
  else
  begin
    with frm do
    begin
      Result:= (ShowModal = mrOk);
      free;
    end;
  end;
end;

{==============================================================================|
| UNIT: DRELESTATSUPLBENEF                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE DO RELATORIO ESTATÍSTICO DE PARTICIPANTES POR BENEFÍCIO        |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE ??/??/2002 A ??/??/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO RELATÓRIO                                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

end.
