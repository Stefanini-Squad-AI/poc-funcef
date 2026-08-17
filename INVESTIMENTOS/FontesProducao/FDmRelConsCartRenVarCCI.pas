//******************************************************************************
// Data      : 04/05/2007
// Código    : AL_7
// Motivo    : Retirado o lote, não é utilizado e causa duplicidade.
//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_6
// Pendência : 25195
// SOL       : 53035
// Motivo    : Implementação que permiti tirar o relatório agrupado pelas
//             carteiras(qryConsCartRenVarCCI, pplConsCartRVCCIGroup e rptConsCartRVCCIGroup).
//******************************************************************************
// Data     : 03/01/2007
// Código   : AL_3
// Pendencia: 24116
// Desc     : Ajuste na ordenação do select para bater com as quebras de grupo
//              do relatório
//******************************************************************************
// Data     : 05/10/2006
// Código   : Al_2
// Desc     : Implementação para trazer todos os planos (qryConsCartRenVarCCI) e
//            grupamento do relatório por plano e carteira
//******************************************************************************
// Data     : 02/10/2006
// Código   : AL_1
// Pendencia: 22967
// Desc     : Segregação de Planos
//******************************************************************************
// Data     : 22/03/2005
// Descrição: Retirada do Emissor e alterado para deixar somente a
//            Quantidade Antiga, Nova e Total (Alteração no DFM).
//******************************************************************************
// Data     : 18/01/2005
// Descrição: Corrigido o Titulo da coluna "Quantidade Nova Atual" (Alteração no DFM).
//******************************************************************************

unit FDmRelConsCartRenVarCCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo;

type
  TDmRelConsCartRenVarCCI = class(TDmRelatoriosInv)
    pplConsCartRenVarCCI: TppBDEPipeline;
    dsConsCartRenVarCCI: TwwDataSource;
    qryConsCartRenVarCCI: TwwQuery;
    rptConsCartRenVarCCI: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    lblData: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryConsCartRenVarCCIDATAMOVCARTINV: TDateTimeField;
    qryConsCartRenVarCCIDESCCARTINVEST: TStringField;
    qryConsCartRenVarCCINOMEEMISSOR: TStringField;
    qryConsCartRenVarCCIDESCINVESTIMENTO: TStringField;
    qryConsCartRenVarCCICODISIN: TStringField;
    //AL_7
    qryConsCartRenVarCCIQTDE: TFloatField;
    qryConsCartRenVarCCIQTDECC: TFloatField;
    qryConsCartRenVarCCIQTDECCI: TFloatField;
    qryConsCartRenVarCCIQTDEANTERIOR: TFloatField;
    qryConsCartRenVarCCIQTDECCANTERIOR: TFloatField;
    qryConsCartRenVarCCIQTDECCIANTERIOR: TFloatField;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    qryConsCartRenVarCCIIDEMISSOR: TFloatField;
    ppLabel3: TppLabel;
    ppRepExeDireitoShape2: TppShape;
    ppDBText3: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDBText2: TppDBText;
    qryConsCartRenVarCCIPLANPRVCONTABPATRO: TStringField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    rptConsCartRVCCIGroup: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppDBImage2: TppDBImage;
    lblDataGroup: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBText5: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape3: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel17: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine8: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    pplConsCartRVCCIGroup: TppBDEPipeline;
    ppShape19: TppShape;
    ppMemoGroup: TppMemo;
    ppLabel66: TppLabel;
    procedure ppRepExeDireitoShape2Print(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelConsCartRenVarCCI: TDmRelConsCartRenVarCCI;

implementation

{$R *.DFM}

procedure TDmRelConsCartRenVarCCI.ppRepExeDireitoShape2Print(
  Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

end.
