//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_1
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Ajustes no layout
//******************************************************************************
unit FDmRelBoletaEmpAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TDMRelBoletaEmpAcoes = class(TdtmReports)
    ppBoletaEmpAcoes: TppBDEPipeline;
    rptBoletaEmpAcoes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    lblDataOperacao: TppLabel;
    lblOperacao: TppLabel;
    lblDataVencto: TppLabel;
    lblDPreco: TppLabel;
    lblPreco: TppLabel;
    lblInvestimento: TppLabel;
    lblCustodiante: TppLabel;
    ppDBText1: TppDBText;
    dbeDataVencto: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    lblQuantidade: TppLabel;
    lblTaxa: TppLabel;
    lblVlrMaxResgate: TppLabel;
    lblVlrJuros: TppLabel;
    lblVlrEmprestimo: TppLabel;
    lblVlrResgDia: TppLabel;
    lblVlrIR: TppLabel;
    lblFlgReversao: TppLabel;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    dbeVlrMaxResgate: TppDBText;
    dbeVlrIr: TppDBText;
    dbeVlrResgDia: TppDBText;
    dbeQuantidade: TppDBText;
    dbeVlrJuros: TppDBText;
    ppLine3: TppLine;
    lblDiaPreco: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText6: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelBoletaEmpAcoes: TDMRelBoletaEmpAcoes;

implementation

uses FCadOperEmpAcoes;

{$R *.DFM}

end.
