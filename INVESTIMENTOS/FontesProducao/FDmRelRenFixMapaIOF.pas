//********************************************************************************************************
//Data	  :  11/10/2005
//Codigo  :  AL_1
//Função  :  Ajuste na query para pegar o PUITEM original
//********************************************************************************************************
unit FDmRelRenFixMapaIOF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelRenFixMapaIOF = class(TDmRelatoriosInv)
    pplMapaIOF: TppBDEPipeline;
    dsMapaIOF: TwwDataSource;
    qryMapaIOF: TwwQuery;
    rptMapaIOF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    lblInvestimento: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryMapaIOFPLANPRVCONTABPATRO: TStringField;
    qryMapaIOFINVESTIMENTO: TStringField;
    qryMapaIOFDATAHISTRENFIX: TDateTimeField;
    qryMapaIOFVLRITEM: TFloatField;
    qryMapaIOFVLRACUITEM: TFloatField;
    qryMapaIOFIDOPERRENFIXAPLIC: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    shpCabecalho: TppShape;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    shpDetalhe: TppShape;
    qryMapaIOFDESCCLASSETIT: TStringField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    shpCabClasse: TppShape;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    qryMapaIOFDATAVIGENCIA: TDateTimeField;
    procedure rptMapaIOFStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppDBText3Print(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelRenFixMapaIOF: TDmRelRenFixMapaIOF;

implementation

{$R *.DFM}

procedure TDmRelRenFixMapaIOF.rptMapaIOFStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelRenFixMapaIOF.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelRenFixMapaIOF.ppDBText3Print(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

end.
