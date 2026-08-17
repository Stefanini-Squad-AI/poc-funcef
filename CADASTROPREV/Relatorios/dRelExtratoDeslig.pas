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
  ppDBPipe, ppDBBDE, ppModule, raCodMod, ppEndUsr, ppParameter;

type
  TdtmRelExtratoDeslig = class(TdtmReports)
    ppExtSimDeslig: TppBDEPipeline;
    dsExtSimDeslig: TwwDataSource;
    qryExtSimDeslig: TwwQuery;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    dsgExtSimDeslig: TppDesigner;
    qryAux: TwwQuery;
    rpExtSimDeslig: TppReport;
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
    ppLabel29: TppLabel;
    ppDBText35: TppDBText;
    ppLabel33: TppLabel;
    ppDBText36: TppDBText;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel11: TppLabel;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText11: TppDBText;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppShape4: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppShape5: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    ppDBText2: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText3: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDBText20: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
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
