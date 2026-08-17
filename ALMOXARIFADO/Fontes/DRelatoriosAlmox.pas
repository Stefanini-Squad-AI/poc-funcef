unit DRelatoriosAlmox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, DBTables, ppCtrls, ppBands, ppClass, ppDB, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, Db, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE;

type
  TdtmRelatoriosAlmox = class(TdtmReports)
    pplRequisicao: TppBDEPipeline;
    dsRequisicao: TwwDataSource;
    qryRequisicao: TwwQuery;
    rpRequisicao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    rpRequisicaoDBText1: TppDBText;
    rpRequisicaoDBText2: TppDBText;
    rpRequisicaoDBText3: TppDBText;
    rpRequisicaoDBText4: TppDBText;
    rpRequisicaoDBText5: TppDBText;
    rpRequisicaoDBText6: TppDBText;
    rpRequisicaoDBText7: TppDBText;
    rpRequisicaoDBText8: TppDBText;
    rpRequisicaoLabel1: TppLabel;
    rpRequisicaoLabel2: TppLabel;
    rpRequisicaoLabel3: TppLabel;
    rpRequisicaoLabel4: TppLabel;
    rpRequisicaoLabel5: TppLabel;
    rpRequisicaoLabel6: TppLabel;
    rpRequisicaoLabel8: TppLabel;
    rpRequisicaoLabel9: TppLabel;
    rpRequisicaoLine1: TppLine;
    rpRequisicaoLine2: TppLine;
    rpRequisicaoLabel7: TppLabel;
    rpRequisicaoDBText9: TppDBText;
    rpExtratoContaLabel10: TppLabel;
    lbData: TppLabel;
    rpRequisicaoLabel10: TppLabel;
    rpRequisicaoLabel11: TppLabel;
    rpRequisicaoLabel12: TppLabel;
    rpRequisicaoLine3: TppLine;
    rpRequisicaoLine4: TppLine;
    rpRequisicaoDBCalc1: TppDBCalc;
    rpRequisicaoDBCalc2: TppDBCalc;
    rpRequisicaoDBText10: TppDBText;
    rpRequisicaoDBText11: TppDBText;
    qryRecebimento: TwwQuery;
    dsRecebimento: TwwDataSource;
    pplRecebimento: TppBDEPipeline;
    rpRecebimento: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    lbDataRecebimento: TppLabel;
    rpRecebimentoLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppReport1DBText3: TppDBText;
    ppReport1DBText4: TppDBText;
    ppReport1DBText5: TppDBText;
    ppReport1DBText6: TppDBText;
    rpRecebimentoDBText1: TppDBText;
    rpRecebimentoDBText2: TppDBText;
    rpRecebimentoDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    rpRecebimentoLabel3: TppLabel;
    rpRecebimentoDBCalc1: TppDBCalc;
    rpRecebimentoLine2: TppLine;
    rpRecebimentoLine3: TppLine;
    rpRecebimentoDBCalc5: TppDBCalc;
    ppReport1Group1: TppGroup;
    ppReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpRecebimentoShape1: TppShape;
    ppReport1Label1: TppLabel;
    ppReport1DBText1: TppDBText;
    ppReport1GroupFooterBand1: TppGroupFooterBand;
    ppReport1Group2: TppGroup;
    ppReport1GroupHeaderBand2: TppGroupHeaderBand;
    ppReport1DBText2: TppDBText;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1Label4: TppLabel;
    ppReport1Label6: TppLabel;
    rpRecebimentoLabel5: TppLabel;
    rpRecebimentoLabel6: TppLabel;
    rpRecebimentoLabel8: TppLabel;
    rpRecebimentoLabel9: TppLabel;
    rpRecebimentoLabel7: TppLabel;
    rpRecebimentoDBText4: TppDBText;
    rpRecebimentoLabel2: TppLabel;
    ppReport1GroupFooterBand2: TppGroupFooterBand;
    rpRecebimentoLabel4: TppLabel;
    rpRecebimentoDBCalc2: TppDBCalc;
    rpRecebimentoDBCalc3: TppDBCalc;
    rpRecebimentoDBCalc4: TppDBCalc;
    rpDevolucao: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    lbDataDevolucao: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText11: TppDBText;
    ppLabel24: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel25: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    pplDevolucao: TppBDEPipeline;
    dsDevolucao: TwwDataSource;
    qryDevolucao: TwwQuery;
    qryValidade: TwwQuery;
    dsValidade: TwwDataSource;
    pplValidade: TppBDEPipeline;
    rpValidade: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel26: TppLabel;
    lblDataValidade: TppLabel;
    ppLabel27: TppLabel;
    lblOpcao: TppLabel;
    rpValidadeLabel1: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    rpValidadeDBText7: TppDBText;
    ppFooterBand4: TppFooterBand;
    rpValidadeLine3: TppLine;
    rpValidadeLabel5: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppLabel28: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    rpValidadeShape1: TppShape;
    ppLabel29: TppLabel;
    rpValidadeDBText9: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    rpValidadeLabel7: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    qryABC: TwwQuery;
    dsABC: TwwDataSource;
    pplABC: TppBDEPipeline;
    rpABC: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppReport1Shape1: TppShape;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label9: TppLabel;
    ppReport1DBText7: TppDBText;
    ppReport1Label5: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText15: TppDBText;
    ppReport1DBText9: TppDBText;
    ppReport1DBText10: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine6: TppLine;
    ppLabel37: TppLabel;
    rpRecebimentoDBCalc7: TppDBCalc;
    rpRecebimentoDBText6: TppDBText;
    rpRecebimentoLabel11: TppLabel;
    rpDevolucaoLabel1: TppLabel;
    rpDevolucaoDBText1: TppDBText;
    rpRecebimentoLabel10: TppLabel;
    rpRecebimentoDBText5: TppDBText;
    rpRecebimentoDBText7: TppDBText;
    updABC: TUpdateSQL;
    rpABCDBText1: TppDBText;
    rpABCDBCalc1: TppDBCalc;
    rpABCLine1: TppLine;
    rpABCDBCalc2: TppDBCalc;
    rpABCDBCalc3: TppDBCalc;
    rpABCLabel1: TppLabel;
    rpABCDBText2: TppDBText;
    rpABCLabel2: TppLabel;
    rpABCLine2: TppLine;
    rpABCLine3: TppLine;
    rpABCLabel3: TppLabel;
    rpABCDBText3: TppDBText;
    rpABCSummaryBand1: TppSummaryBand;
    rpABCDBCalc4: TppDBCalc;
    rpABCDBCalc5: TppDBCalc;
    rpABCDBCalc6: TppDBCalc;
    rpABCLabel4: TppLabel;
    rpABCLabel5: TppLabel;
    rpABCLabel6: TppLabel;
    rpABCLabel7: TppLabel;
    lbAlmox14: TppLabel;
    LbGrupo3: TppLabel;
    rpABCDBText4: TppDBText;
    rpRequisicaoLabel13: TppLabel;
    LbTipo: TppLabel;
    rpRequisicaoLabel14: TppLabel;
    rpRequisicaoDBText12: TppDBText;
    rpRecebimentoLabel12: TppLabel;
    rpRecebimentoDBText8: TppDBText;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    rpValidadeCalc1: TppSystemVariable;
    rpValidadeCalc2: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
  private
    { Private declarations }
  public
    aListaSaldo: Tstrings;
    function MostraParam(Form: string): boolean;override;
    { Public declarations }
  end;

var
  dtmRelatoriosAlmox : TdtmRelatoriosAlmox;

implementation

uses uDataBase,DBaseDados,
     fParamRequisicao, fParamRecebimento, uSistema,fParamDevolucao,
     fParamABC, fParamValidade;

{$R *.DFM}
function TdtmRelatoriosAlmox.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (UPPERCASE(Form) = 'FRMPARAMREQUISICAO') then begin
        frm := TfrmParamRequisicao.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMPARAMDEVOLUCAO') then begin
        frm := TfrmParamDevolucao.Create(Application);
     end
     else
     if (UPPERCASE(Form) = 'FRMPARAMRECEBIMENTO') then begin
        frm := TfrmParamRecebimento.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMPARAMABC') then begin
        frm := TfrmParamABC.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMPARAMVALIDADE') then begin
        frm := TfrmParamValidade.Create(Application);
        end
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
