// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRelQtdPartBenefMes filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelQtdMensalPartBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelQtdMensalPartBenef = class(TdtmReports)
    qryRelQtdPartBenefMes: TwwQuery;
    qryRelQtdPartBenefMesMESCOBRANCA: TStringField;
    qryRelQtdPartBenefMesPATRO: TStringField;
    qryRelQtdPartBenefMesPLANO: TStringField;
    qryRelQtdPartBenefMesBENEFICIO: TStringField;
    qryRelQtdPartBenefMesQTDE: TFloatField;
    ppEstPartBenef: TppReport;
    ppHeaderBand31: TppHeaderBand;
    ppDBImage12: TppDBImage;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppLabel121: TppLabel;
    ppDetailBand32: TppDetailBand;
    ppFooterBand31: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel122: TppLabel;
    ppLine83: TppLine;
    ppLabel117: TppLabel;
    ppDBText123: TppDBText;
    ppLabel119: TppLabel;
    ppLabel118: TppLabel;
    ppLine80: TppLine;
    ppLine82: TppLine;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppLine81: TppLine;
    ppDBCalc18: TppDBCalc;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    PPLEstPartBenef: TppBDEPipeline;
    DSRelQtdPartBenefMes: TwwDataSource;
    ppLabel1: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppLabel116: TppLabel;
    ppDBText122: TppDBText;
    function MostraParam(Form: string): boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelQtdMensalPartBenef: TdtmRelQtdMensalPartBenef;

implementation

{$R *.DFM}

uses FFILTROQTDMENSALPARTBENEF, dRelFolha;


function TdtmRelQtdMensalPartBenef.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMFILTROQTDMENSALPARTBENEF' then frm := TFRMFILTROQTDMENSALPARTBENEF.Create(Application)
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
