// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRelaQtdPartFolha filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelaQtdPartFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt,
  Db, ppDB, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, dRelFolha;

type
  TdtmRelaQtdPartFolha = class(TdtmReports)
    ppRRelaQtdPartFolha: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel95: TppLabel;
    ppLine61: TppLine;
    ppDetailBand22: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine64: TppLine;
    ppLabel100: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppBDERelaQtdPartFolha: TppBDEPipeline;
    DSRelaQtdPartFolha: TwwDataSource;
    qryVerFolha: TwwQuery;
    DSVerFolha: TwwDataSource;
    ppVerFolha: TppBDEPipeline;
    ppDBImage10: TppDBImage;
    ppDBText48: TppDBText;
    ppDBText52: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    qryRelaQtdPartFolha: TwwQuery;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    function MostraParam(Form: string): boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelaQtdPartFolha: TdtmRelaQtdPartFolha;

implementation
uses FFILTRORELAQTDPARTFOLHA;

{$R *.DFM}

function TdtmRelaQtdPartFolha.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMFILTRORELAQTDPARTFOLHA'   then frm := TFrmFiltroRelaQtdPartFolha.Create(Application)
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
| UNIT: DRELAQTDPARTFOLHA                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE DO RELATORIO ESTATÍSTICO DE PARTICIPANTES POR VERSÃO           |
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
