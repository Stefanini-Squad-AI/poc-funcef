//******************************************************************************
// Data     : 24/01/2008
// Código   : AL_7
// Pendencia: 26561
// SOL      :
// Desc     : Implementação da coluna "Cód.ISIN" do papel
//******************************************************************************
// Data     : 08/03/2007
// Código   : AL_6
// Pendencia: 23275
// SOL      : 46150
// Desc     : Implementação da coluna "Cód.BOVESPA" do papel
//******************************************************************************
// Data     : 03/01/2007
// Código   : AL_5
// Pendencia: 24102
// SOL      :
// Desc     : Ajuste na ordenação do select para bater com as quebras de grupo
//              do relatório
//******************************************************************************
unit FDmRelConsCartRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelConsCartRenVar = class(TDmRelatoriosInv)
    dtsConsCartRendVar: TwwDataSource;
    updConsCartRendVar: TUpdateSQL;
    ppBDEConsCartRendVar: TppBDEPipeline;
    RpConsCartRendVar: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppDBImage2: TppDBImage;
    ppLData: TppLabel;
    RpConsCartRendVarShape1: TppShape;
    ppLine42: TppLine;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel110: TppLabel;
    ppLine43: TppLine;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    RpConsCartRendVarLabel3: TppLabel;
    ppLabel277: TppLabel;
    ppLabel278: TppLabel;
    ppLabel32: TppLabel;
    ppLabel3: TppLabel;
    RpConsCartRendVarLabel2: TppLabel;
    ppLabel279: TppLabel;
    ppDetailBand16: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText44: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    RpConsCartRendVarDBText2: TppDBText;
    ppDBText136: TppDBText;
    ppDBText145: TppDBText;
    ppDBText25: TppDBText;
    ppDBText8: TppDBText;
    RpConsCartRendVarDBText1: TppDBText;
    ppDBText146: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine44: TppLine;
    ppLabel117: TppLabel;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine45: TppLine;
    ppDBCalc5: TppDBCalc;
    ppLabel118: TppLabel;
    RpConsCartRendVarDBCalc1: TppDBCalc;
    RpConsCartRendVarDBCalc2: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    qryConsCartRendVar: TwwQuery;
    qryConsCartRendVarDESCINVESTIMENTO: TStringField;
    qryConsCartRendVarQTDE: TFloatField;
    qryConsCartRendVarSALDO: TFloatField;
    qryConsCartRendVarSALDOANTERIOR: TFloatField;
    qryConsCartRendVarCUSTOATUAL: TFloatField;
    qryConsCartRendVarPUCUSTO: TFloatField;
    qryConsCartRendVarCOTACAO: TFloatField;
    qryConsCartRendVarDATACOTACAO: TDateTimeField;
    qryConsCartRendVarVARIACAOMES: TFloatField;
    qryConsCartRendVarVARIACAOCONTABIL: TFloatField;
    qryConsCartRendVarVALCOMPRA: TFloatField;
    qryConsCartRendVarVALVENDAS: TFloatField;
    q: TFloatField;
    qryConsCartRendVarQTDECC: TFloatField;
    qryConsCartRendVarQTDECCI: TFloatField;
    qryConsCartRendVarDATAMOVCARTINV: TDateTimeField;
    qryConsCartRendVarSALDOVARIACAO: TFloatField;
    qryConsCartRendVarVARIACAO: TFloatField;
    qryConsCartRendVarSTATUS: TStringField;
    qryConsCartRendVarCODISIN: TStringField;
    qryConsCartRendVarQTDTITULOS: TFloatField;
    qryConsCartRendVarQTDEDIVERGENTE: TFloatField;
    qryConsCartRendVarOBSERVACAO: TStringField;
    qryConsCartRendVarQTDECUSTODIANTE: TFloatField;
    qryConsCartRendVarSIGLAEMISSOR: TStringField;
    qryConsCartRendVarIDCARTEIRAINVEST: TFloatField;
    qryConsCartRendVarIDINVESTIMENTO: TFloatField;
    qryConsCartRendVarDESCCARTINVEST: TStringField;
    qryConsCartRendVarIDLOTE: TStringField;
    qryConsCartRendVarIDCONCILIACUSTODIA: TFloatField;
    qryConsCartRendVarTOTALSALDO: TFloatField;
    qryConsCartRendVarTOTALSALDOANT: TFloatField;
    qryConsCartRendVarQTDEANTERIOR: TFloatField;
    qryConsCartRendVarIDEMISSOR: TFloatField;
    qryConsCartRendVarTOTALCC: TFloatField;
    qryConsCartRendVarTOTALCCI: TFloatField;
    qryConsCartRendVarPLANPRVCONTABPATRO: TStringField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLabel2: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    shpRodCart: TppShape;
    shpRodPlano: TppShape;
    ppShape1: TppShape;
    //AL_6
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    qryConsCartRendVarSIGLAACAOBOLSA: TStringField;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    procedure RpConsCartRendVarStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelConsCartRenVar: TDmRelConsCartRenVar;

implementation

{$R *.DFM}

procedure TDmRelConsCartRenVar.RpConsCartRendVarStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
  shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelConsCartRenVar.shpDetalhePrint(Sender: TObject);
begin
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   (Sender as TppShape).Brush.Color := cCorZebra;

   inherited;

end;

end.
