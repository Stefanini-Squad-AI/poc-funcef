//******************************************************************************
//Rotina      : qryAnuncioProv
//SOL         : 160530
//Kintana     : 1348723
//Data        : 30/06/2011
//Responsável : Ricardo Cristiano
//Problema    : Não esta gerando posicao para mais de um custodiante
//Solução     : Implementação do IDCUSTODIANTE e tratamento da data da boleta, para
//               qualquer tipo de saldo
//*****************************************************************************
//Data        : 07/06/2010 
//SOL         : 124730
//Kintana     : 668611 
//Responsável : Ricardo Cristiano
//Problema    : Alterar a data de contabilização rendas/variações positivas 
//               provenientes de bonificações, dividen...
//Solução     : Implementação de ajuste ...
//************************************************************************************************
// Data      : 13/09/2007
// Código    : AL_2
// Pendência : 25912
// SOL       : 64901
// Motivo    : Implementação no anúncio com remuneração, do valor do anúncio + remuneração
//************************************************************************************************
// Data      : 09/08/2007
// Código    : AL_1
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//************************************************************************************************
// Data      : 20/07/2007
// Pendência : 25911
// SOL       :
// Motivo    : Ajuste no relatório de Anúncios em Aberto para multiplos recebimentos em AGE
//               marcada como totalmente recebida. (DFM)
//************************************************************************************************
// Data      : 31/10/2006
// Pendencia : 23661
// SOL       :
// Descrição : Segregação de Planos
//************************************************************************************************
// Data      : 07/08/2006
// Pendência : 23009
// SOL       :
// Motivo    : Vizualizar um anúncio em aberto mesmo marcado como totalmente recebido quando a
//               maior data de seus recebimentos for maior que a data de referência do relatório.
//************************************************************************************************

unit FDmRelAGE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  ppChrtDP, ppChrt, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppModule, daDataModule, FPreview,
  FDmRelGrafRentabCotas;

type
  TdmRelAGE = class(TDmRelatoriosInv)
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine3: TppLine;
    ppLTitulo: TppLabel;
    ppLabel7: TppLabel;
    ppDBImage2: TppDBImage;
    ppLData: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ds: TwwDataSource;
    ppl: TppBDEPipeline;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppDBText1: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    qryAnuncioProv: TwwQuery;
    qryAnuncioProvDESCTIPOOPERACAO: TStringField;
    qryAnuncioProvDATAPREV: TDateTimeField;
    qryAnuncioProvDESCINVESTIMENTO: TStringField;
    qryAnuncioProvQTD: TFloatField;
    qryAnuncioProvPU: TFloatField;
    qryAnuncioProvVALOR: TFloatField;
    qryAnuncioProvDATAEX: TDateTimeField;
    qryAnuncioProvDTBASE: TDateTimeField;
    qryAnuncioProvDATAAGE: TDateTimeField;
    qryAnuncioProvIDINVESTIMENTO: TFloatField;
    qryAnuncioProvIDOPERACAODIREITO: TFloatField;
    qryAnuncioProvIDTIPOOPERACAO: TFloatField;
    qryAnuncioProvPLANPRVCONTABPATRO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpGrpPlano: TppShape;
    ppDBText9: TppDBText;
    ppDBCalc2: TppDBCalc;
    QryAnuncioProvCon: TwwQuery;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    DsAnuncioProvCon: TwwDataSource;
    pplAnuncioProvCon: TppBDEPipeline;
    rptAnuncioProvCon: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine6: TppLine;
    lblTitCon: TppLabel;
    ppLabel4: TppLabel;
    ppDBImage1: TppDBImage;
    lblPerCon: TppLabel;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape4: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine7: TppLine;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc3: TppDBCalc;
    ppLine9: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape5: TppShape;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppShape6: TppShape;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppShape9: TppShape;
    ppLabel6: TppLabel;
    ppLine8: TppLine;
    ppShape10: TppShape;
    ppShape8: TppShape;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppShape12: TppShape;
    ppLine49: TppLine;
    ppLine1: TppLine;
    qryAnuncioProvDESCSEGMENTACAO: TStringField;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText10: TppDBText;
    ppShape7: TppShape;
    ppShape11: TppShape;
    ppDBCalc6: TppDBCalc;
    ppLabel25: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText20: TppDBText;
    ppShape13: TppShape;
    qryAnuncioProvIDSEGMENTACAO: TFloatField;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    ppShape14: TppShape;
    ppLabel27: TppLabel;
    ppDBCalc7: TppDBCalc;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
    ppLabel28: TppLabel;
    ppDBText21: TppDBText;
    ppLabel29: TppLabel;
    ppDBText22: TppDBText;
    QryAnuncioProvConPLANPRVCONTABPATRO: TStringField;
    QryAnuncioProvConDESCTIPOOPERACAO: TStringField;
    QryAnuncioProvConDATAEX: TDateTimeField;
    QryAnuncioProvConDATAPREV: TDateTimeField;
    QryAnuncioProvConDTBASE: TDateTimeField;
    QryAnuncioProvConDATAAGE: TDateTimeField;
    QryAnuncioProvConDESCINVESTIMENTO: TStringField;
    QryAnuncioProvConIDINVESTIMENTO: TFloatField;
    QryAnuncioProvConIDOPERACAODIREITO: TFloatField;
    QryAnuncioProvConIDTIPOOPERACAO: TFloatField;
    QryAnuncioProvConQTD: TFloatField;
    QryAnuncioProvConPU: TFloatField;
    QryAnuncioProvConVALOR: TFloatField;
    QryAnuncioProvConDESCSEGMENTACAO: TStringField;
    QryAnuncioProvConIDSEGMENTACAO: TFloatField;
    //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509    
    qryAnuncioProvDESCCARTINVEST: TStringField;
    ppLabel30: TppLabel;
    ppDBText23: TppDBText;
    QryAnuncioProvConDESCCARTINVEST: TStringField;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape15: TppShape;
    ppDBText24: TppDBText;
    ppShape16: TppShape;
    ppLabel31: TppLabel;
    ppDBCalc8: TppDBCalc;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim
    procedure ppReport2StartPage(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppShape2Print(Sender: TObject);

  private
    { Private declarations }
    cCorZebra : TColor;

  public
    { Public declarations }
  end;

var
  dmRelAGE: TdmRelAGE;

implementation

{$R *.DFM}

uses FConsAnuncioProvento;

procedure TdmRelAGE.ppReport2StartPage(Sender: TObject);
begin
   inherited;

   cCorZebra            := $00E3E3E3;
   ppShape2.Brush.Color := clWhite;
end;

procedure TdmRelAGE.ppDetailBand2BeforePrint(Sender: TObject);
begin
   inherited;

end;

//AL_1
procedure TdmRelAGE.ppShape2Print(Sender: TObject);
begin
  inherited;
  if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
  TppShape(Sender).Brush.Color := cCorZebra;
end;

end.
