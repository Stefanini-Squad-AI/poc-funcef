//*******************************************************************************************************
//N. Sol..........: 179261
//N. Kintana......: 1654087
//Data............: 03/05/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a querys para considerar o novo tipo 8 - Contrato pre-datado
//*******************************************************************************************************
//N. Sol..........: 167884_6942
//N. Kintana......: 1477472
//Data............: 03/11/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Incluso um DISTINCT na cláusula do SQL da qryHistorico
//***************************************************************************************************
//N. Sol..........: 163239
//N. Kintana......: 1392476
//Data............: 16/08/2011    
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a qryHistorico para considerar os novos tipos 6, 7
//***************************************************************************************************
// Data      : 26/06/2008
// Código    : AL_5
// Pendencia : 26447
// Desc      : Acerto no coluna de VlrJuros para trazer o somatório de juros do dia
//             quando existe baixas de resgate
//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_4
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Reformulação do relatório incluindo a coluna juros até o dia
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 01/10/2007
// Código    : AL_3
// Pendencia : 26447
// SOL       : 70152
// Desc      : Inclusão do campo Valor dos Juros no relatório de Saldos de
//               Empréstimo de Ações.
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_2
// Pendencia : 22982
// Desc      : Implementacao Plano e Patro
//******************************************************************************
//Data      : 16/06/2005
//Código    : AL_1
//Descrição : qryHistorico - Alteração para não buscar operações vencidas
//******************************************************************************
//Data      : 29/06/2004
//Origem    : FUNCEF
//Query     : qryExemplo, qryHistorico
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************

unit FDMRelEmpAcoesSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr;


type
  TDmRelEmpAcoesSaldo = class(TdtmReports)
    rptRenEmpAcoesSaldo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplHistorico: TppBDEPipeline;
    qryHistorico: TwwQuery;
    shpCabecalho: TppShape;
    ppDBText1: TppDBText;
    ppLabel8: TppLabel;
    dbQuantidade: TppDBText;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppLabel11: TppLabel;
    shpRenFixSaldoDetPai: TppShape;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    dsHistorico: TwwDataSource;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLCarteiraEx: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel7: TppLabel;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppDBImage1: TppDBImage;
    pplPeriodo: TppLabel;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppLabel1: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText9: TppDBText;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppDBText4: TppDBText;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppDBText11: TppDBText;
    ppLabel10: TppLabel;
    ppLabel17: TppLabel;
    ppDBText12: TppDBText;
    ppLabel18: TppLabel;
    ppLine1: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel19: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    //Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
    ppLine3: TppLine;
    ppDBCalc5: TppDBCalc;
    qryHistoricoDESCTIPOOPERACAO: TStringField;
    qryHistoricoNUMCONTRATOCUSTODIA: TStringField;
    qryHistoricoDATAVENCOPER: TDateTimeField;
    qryHistoricoIDTIPOOPERACAO: TFloatField;
    qryHistoricoQTDEMPACOES: TFloatField;
    qryHistoricoPUOPERACAO: TFloatField;
    qryHistoricoVLROPERACAO: TFloatField;
    qryHistoricoTAXAOPERACAO: TFloatField;
    qryHistoricoVLRJUROSIMPORTA: TFloatField;
    qryHistoricoPLANPRVCONTABPATRO: TStringField;
    qryHistoricoDESCCARTINVEST: TStringField;
    qryHistoricoSIGLAACAOBOLSA: TStringField;
    qryHistoricoIDCARTEIRAINVEST: TFloatField;
    qryHistoricoSGLCORRETVALORES: TStringField;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    qryHistoricoDATAOPERACAO: TDateTimeField;
    qryHistoricoTIPOLANCAMENTO: TStringField;
    qryHistoricoDATAHISTEMPACOES: TDateTimeField;
    procedure rptRenEmpAcoesSaldoStartPage(Sender: TObject);
    procedure shpRenFixSaldoDetPaiPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelEmpAcoesSaldo: TDmRelEmpAcoesSaldo;

implementation

uses dOperComum;

{$R *.DFM}

procedure TDmRelEmpAcoesSaldo.rptRenEmpAcoesSaldoStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpRenFixSaldoDetPai.Brush.Color := clWhite;
end; 

procedure TDmRelEmpAcoesSaldo.shpRenFixSaldoDetPaiPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

//Paulo Nobre - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253 
end.



