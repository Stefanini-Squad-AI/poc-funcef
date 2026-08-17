unit DRelatoriosContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe;

type
  TdtmRelatoriosContrato = class(TdtmReports)
    pplAditamentos: TppBDEPipeline;
    dsAditamentos: TwwDataSource;
    qryAditamentos: TwwQuery;
    rpAditamentos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    rpNomeEmpresaAdit: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    rpAditamentosLabel1: TppLabel;
    rpAditamentosDBText1: TppDBText;
    rpAditamentosDBText2: TppDBText;
    rpAditamentosLabel2: TppLabel;
    rpAditamentosDBMemo1: TppDBMemo;
    rpAditamentosLabel3: TppLabel;
    rpAditamentosLine1: TppLine;
    rpAditamentosLine2: TppLine;
    pplContratoXCentroCusto: TppBDEPipeline;
    dsContratoXCentroCusto: TwwDataSource;
    qryContratoXCentroCusto: TwwQuery;
    rpContratoXCentroCusto: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    qryContratos: TwwQuery;
    dsContratos: TwwDataSource;
    pplContratos: TppBDEPipeline;
    rpContratos: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    rpNomeEmpresa: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel9: TppLabel;
    rpContratosDBText1: TppDBText;
    rpContratosShape1: TppShape;
    rpContratosLabel1: TppLabel;
    rpContratosLabel2: TppLabel;
    rpContratosLabel3: TppLabel;
    rpContratosLabel4: TppLabel;
    rpContratosLabel5: TppLabel;
    rpContratosLabel6: TppLabel;
    rpContratosLabel7: TppLabel;
    rpContratosLabel8: TppLabel;
    rpContratosDBText2: TppDBText;
    rpContratosDBText3: TppDBText;
    rpContratosDBText4: TppDBText;
    rpContratosDBText5: TppDBText;
    rpContratosDBText6: TppDBText;
    rpContratosDBText7: TppDBText;
    rpContratosDBText8: TppDBText;
    rpContratosDBText9: TppDBText;
    rpContratosLabel9: TppLabel;
    rpContratosDBText10: TppDBText;
    rpContratosLabel10: TppLabel;
    rpContratosDBText11: TppDBText;
    rpContratosLabel11: TppLabel;
    rpContratosDBText12: TppDBText;
    rpContratosLabel12: TppLabel;
    rpContratosDBText13: TppDBText;
    rpContratosLabel13: TppLabel;
    rpContratosDBText14: TppDBText;
    rpContratosLabel14: TppLabel;
    rpContratosDBText15: TppDBText;
    rpContratosLabel15: TppLabel;
    rpContratosDBText16: TppDBText;
    rpAditamentosLabel4: TppLabel;
    rpAditamentosDBText3: TppDBText;
    rpContratosLine1: TppLine;
    rpContratosLine2: TppLine;
    qryEmpresa: TwwQuery;
    dsEmpresa: TwwDataSource;
    pplEmpresa: TppBDEPipeline;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNUMDOCUMENTO: TStringField;
    qryEmpresaIDINSCEST: TFloatField;
    qryEmpresaINSCEST: TStringField;
    qryEmpresaNUMLIVROENTRADA: TFloatField;
    rpContratosLine3: TppLine;
    rpContratosLabel16: TppLabel;
    rpContratosDBText17: TppDBText;
    rpContratosLabel17: TppLabel;
    rpContratosDBText18: TppDBText;
    qryContratosNOMECONTRATO: TStringField;
    qryContratosIDFORCLI: TFloatField;
    qryContratosNOMEFORCLI: TStringField;
    qryContratosIDRESPONSAVEL: TFloatField;
    qryContratosNOMERESP: TStringField;
    qryContratosDATAASSINATURA: TDateTimeField;
    qryContratosDATABASECONTRATO: TDateTimeField;
    qryContratosDATAPREVENCERRA: TDateTimeField;
    qryContratosDATAEFETENCERRA: TDateTimeField;
    qryContratosIDITEM: TFloatField;
    qryContratosNOME_ITEM: TStringField;
    qryContratosIDOBJETO: TFloatField;
    qryContratosNOMEOBJETO: TStringField;
    qryContratosDATABASEITEM: TDateTimeField;
    qryContratosMOECODIGO: TFloatField;
    qryContratosMOEDESC: TStringField;
    qryContratosQTDEITEM: TFloatField;
    qryContratosVALORUNITARIOOBJETO: TFloatField;
    qryContratosVALORTOTALOBJETO: TFloatField;
    qryContratosDATAINICIOCOBR: TDateTimeField;
    qryContratosOBSERVACAO: TStringField;
    qryContratosVALORBASECONTRATO: TFloatField;
    qryContratosTIPOC: TStringField;
    qryContratosFREQ: TStringField;
    qryContratosTPCOB: TStringField;
    qryContratosPERCRATEIOCONTR: TFloatField;
    qryContratosNOMECC: TStringField;
    qryPgto: TwwQuery;
    dsPgto: TwwDataSource;
    pplPgto: TppBDEPipeline;
    rpPgto: TppReport;
    ppHeaderPgto: TppHeaderBand;
    ppTitPagtoRec: TppLabel;
    ppLine7: TppLine;
    rpNomeEmpresaPgto: TppLabel;
    ppDetailPgto: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel10: TppLabel;
    ppLine9: TppLine;
    qryPgtoCODCONTRATOEMPR: TStringField;
    qryPgtoNOMECONTRATO: TStringField;
    qryPgtoRAZAOSOCIAL: TStringField;
    qryPgtoDOC: TStringField;
    qryPgtoDATAPROGRAMADA: TDateTimeField;
    qryPgtoDATALANCTO: TDateTimeField;
    qryPgtoNUMCHQBORDERO: TStringField;
    qryPgtoOBS: TMemoField;
    qryPgtoVALOR: TFloatField;
    rpPgtoLb1: TppLabel;
    rpPgtoLb2: TppLabel;
    rpPgtoLb3: TppLabel;
    rpPgtoLb4: TppLabel;
    rpPgtoDBT1: TppDBText;
    rpPgtoDBT2: TppDBText;
    rpPgtoDBT3: TppDBText;
    rpPgtoDBT4: TppDBText;
    rpPgtoLb5: TppLabel;
    rpPgtoLb6: TppLabel;
    rpPgtoLb7: TppLabel;
    rpPgtoLb8: TppLabel;
    rpPgtoLb9: TppLabel;
    rpPgtoDBT5: TppDBText;
    rpPgtoDBT6: TppDBText;
    rpPgtoDBT7: TppDBText;
    rpPgtoDBT8: TppDBText;
    rpPgtoSummaryBand1: TppSummaryBand;
    rpPgtoDBCalc1: TppDBCalc;
    rpPgtoLabel1: TppLabel;
    rpPgtoLine1: TppLine;
    rpPgtoLine2: TppLine;
    dbmObs: TppDBMemo;
    rpPgtoLine3: TppLine;
    rpPgtoLine4: TppLine;
    rpContratosLine4: TppLine;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    qryContratosDATAADITAMENTO: TDateTimeField;

  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean;override;
  end;

var
  dtmRelatoriosContrato: TdtmRelatoriosContrato;

implementation

uses FRelatAditamentos, FRelatContratos, FRelatPgto;

{$R *.DFM}

function TdtmRelatoriosContrato.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (AnsiUpperCase(Form) = 'FRMRELATADITAMENTOS') then
        frm := TfrmRelatAditamentos.Create(Application)
     else
      if (AnsiUpperCase(Form) = 'FRMRELATCONTRATOS') then
         frm := TfrmRelatContratos.Create(Application)
      else
       if (AnsiUpperCase(Form) = 'FRMRELATPGTO') then
          frm := TfrmRelatPgto.Create(Application)
       else
          frm := nil;
          
     if frm = nil then
      Result := false
     else
      begin
         with frm do
         begin
            Result := (ShowModal = mrOk);
            free;
         end;
      end;
end;


end.


