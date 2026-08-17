//******************************************************************************
// Data     : 17/11/2005
// Motivo   : Ajuste no layout do relatório, conforme o padrão do Sistema
//****************************************************************************** 

unit FDmRelIRPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelIRPeriodo = class(TDmRelatoriosInv)
    qryIRPeriodo: TwwQuery;
    dsIRPeriodo: TwwDataSource;
    ppIRPeriodo: TppBDEPipeline;
    pprIRPeriodo: TppReport;
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
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText13: TppDBText;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel22: TppLabel;
    ppLabel6: TppLabel;
    ppLabel23: TppLabel;
    qryIRPeriodoVLRRENDIMENTO: TFloatField;
    qryIRPeriodoVLRIRLITIGIO: TFloatField;
    qryIRPeriodoIDORIGEMIRLITIGIO: TFloatField;
    qryIRPeriodoIDPLANOPREV: TFloatField;
    qryIRPeriodoIDPATROCINADORA: TFloatField;
    qryIRPeriodoDESCRICAO: TStringField;
    qryIRPeriodoDATAFATOGERADOR: TDateTimeField;
    qryIRPeriodoPATRO: TStringField;
    qryIRPeriodoPLANOPREV: TStringField;
    qryIRPeriodoDESORIGEMLITIGIO: TStringField;
    qryIRPeriodoTOTALRENDIMENTO: TFloatField;
    qryIRPeriodoTOTALIRLITIGIO: TFloatField;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    lblPeriodo: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    shpResumo: TppShape;
    lblTotalRendto: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    lblTotalIR: TppLabel;
    ppDBText5: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    qryIRPeriodoSBTOTRENDIMENTO: TFloatField;
    qryIRPeriodoSBTOTIRLITIGIO: TFloatField;
    ppLine7: TppLine;
    ppLabel9: TppLabel;
    ppDBImage2: TppDBImage;
    procedure pprIRPeriodoStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelIRPeriodo: TDmRelIRPeriodo;

implementation

{$R *.DFM}

procedure TDmRelIRPeriodo.pprIRPeriodoStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelIRPeriodo.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

end.
