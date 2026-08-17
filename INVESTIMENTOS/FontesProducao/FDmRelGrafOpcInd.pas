//******************************************************************************
// Data      : 29/12/2006
// Código    : AL_3
// Pendencia : 24066
// SOL       :
// Desc      : Acerto na impressão do relatório devido a alteração do objeto do componente
//******************************************************************************

unit FDmRelGrafOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Series, TeEngine, ExtCtrls, TeeProcs, Chart,
  ppChrtDP, ppChrt, ppStrtch, ppSubRpt;

type
  TDmRelGrafOpcInd = class(TDmRelatoriosInv)
    pplHistOpcInd: TppBDEPipeline;
    rptGraficoEvolucao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryHistOpcInd: TwwQuery;
    dsHistOpcInd: TwwDataSource;
    qryTravaAlta: TwwQuery;
    qryTravaBaixa: TwwQuery;
    qryCesta: TwwQuery;
    qryAjuste: TwwQuery;
    dsTravaBaixa: TwwDataSource;
    dsTravaAlta: TwwDataSource;
    dsCesta: TwwDataSource;
    dsAjuste: TwwDataSource;
    pplTravaBaixa: TppBDEPipeline;
    pplTravaAlta: TppBDEPipeline;
    pplCesta: TppBDEPipeline;
    pplAjuste: TppBDEPipeline;
    qryTravaBaixaINVESTIMENTO: TStringField;
    qryTravaBaixaDATA: TDateTimeField;
    qryTravaBaixaSALDO: TFloatField;
    qryTravaBaixaIDTIPOOPERACAO: TFloatField;
    qryTravaAltaINVESTIMENTO: TStringField;
    qryTravaAltaDATA: TDateTimeField;
    qryTravaAltaSALDO: TFloatField;
    qryTravaAltaIDTIPOOPERACAO: TFloatField;
    qryCestaINVESTIMENTO: TStringField;
    qryCestaDATA: TDateTimeField;
    qryCestaSALDO: TFloatField;
    qryCestaIDTIPOOPERACAO: TFloatField;
    qryAjusteINVESTIMENTO: TStringField;
    qryAjusteDATA: TDateTimeField;
    qryAjusteSALDO: TFloatField;
    qryAjusteIDTIPOOPERACAO: TFloatField;
    qryHistOpcIndINVESTIMENTO: TStringField;
    qryHistOpcIndDATA: TDateTimeField;
    qryHistOpcIndSALDO: TFloatField;
    qryHistOpcIndIDTIPOOPERACAO: TFloatField;
    ppGroup1: TppGroup;
    ppgCabData: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppsDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    srptGrafico: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppgGrafico: TppDPTeeChart;
    //AL_3

    procedure ppgCabDataBeforePrint(Sender: TObject);
    procedure rptGraficoEvolucaoStartPage(Sender: TObject);
    procedure ppsDetalhePrint(Sender: TObject);
    procedure rptGraficoEvolucaoBeforePrint(Sender: TObject);
    procedure rptGraficoEvolucaoAfterPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelGrafOpcInd: TDmRelGrafOpcInd;

implementation

uses dOperComum;

{$R *.DFM}

procedure TDmRelGrafOpcInd.ppgCabDataBeforePrint(Sender: TObject);
begin
   inherited;
   cCorZebra := clSilver;
end;

procedure TDmRelGrafOpcInd.rptGraficoEvolucaoStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := clSilver;
end;

procedure TDmRelGrafOpcInd.ppsDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = clSilver then
   begin
      TppShape(Sender).Brush.Color := cCorZebra;
      cCorZebra := $00E3E3E3;
   end
   else
   begin
      if cCorZebra = ClWhite then
         cCorZebra := $00E3E3E3
      else
         cCorZebra := ClWhite;

      TppShape(Sender).Brush.Color := cCorZebra;
   end;
end;

procedure TDmRelGrafOpcInd.rptGraficoEvolucaoBeforePrint(Sender: TObject);
begin
   inherited;
   dtmOperComum.qryEmpresa.Open;
end;

procedure TDmRelGrafOpcInd.rptGraficoEvolucaoAfterPrint(Sender: TObject);
begin
   dtmOperComum.qryEmpresa.Close;
   inherited;
end;

end.
