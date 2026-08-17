// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Gleyber
// Data        : 05/04/2006
// Pendência   : 19946
// Alteração   : Implementação de vários campos no relatório.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 10/03/2006
// Pendência   : 19946
// Alteração   : Alterações para implementar o cálculo sobre as reservas associadas
//------------------------------------------------------------------------------
unit dRelExtratoDeslig;

interface

uses                                                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppDB, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, ppEndUsr;

type
  TdtmRelExtratoDeslig = class(TdtmReports)
    ppExtSimDeslig: TppBDEPipeline;
    dsExtSimDeslig: TwwDataSource;
    qryExtSimDeslig: TwwQuery;
    rpExtSimDeslig: TppReport;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel24: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText45: TppDBText;
    ppLabel63: TppLabel;
    ppDBText54: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel27: TppLabel;
    ppDBText32: TppDBText;
    ppLabel28: TppLabel;
    ppDBText33: TppDBText;
    ppLabel29: TppLabel;
    ppDBText35: TppDBText;
    ppLabel33: TppLabel;
    ppDBText36: TppDBText;
    ppLabel34: TppLabel;
    ppDBText37: TppDBText;
    ppLine24: TppLine;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    dsgExtSimDeslig: TppDesigner;
    qryAux: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelExtratoDeslig: TdtmRelExtratoDeslig;

implementation

{$R *.DFM}

end.
