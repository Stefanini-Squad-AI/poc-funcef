unit dRelDetalhes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppBands, ppClass, ppReport, ppStrtch, ppSubRpt, ppCtrls, Db,
  ppPrnabl, ppProd, DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB,
  ppDBBDE, ppVar, ppRelatv, ppDBPipe, ppModule, daDataModule, ppMemo,
  ppRichTx;

type
  TdtmRelDetalhes = class(TdtmReports)
    QryVariavel: TwwQuery;
    QryVariavelIDCAMPO: TStringField;
    QryVariavelDESCRICAODOCAMPO: TStringField;
    QryVariavelNOMEDOCAMPO: TStringField;
    QryVariavelENTIDADE: TStringField;
    QryVariavelIDREGRA: TFloatField;
    Qry: TwwQuery;
    QryIDALGORITMODAREG: TFloatField;
    QryDESCRICAOALGORIT: TStringField;
    QryIDREGRA: TFloatField;
    QryNOMEREGRA: TStringField;
    QryDESCREGRA: TStringField;
    QryCampo: TwwQuery;
    QryCampoIDCAMPO: TStringField;
    QryCampoDESCRICAODOCAMPO: TStringField;
    QryCampoNOMEDOCAMPO: TStringField;
    QryCampoENTIDADE: TStringField;
    QryCampoIDREGRA: TFloatField;
    QryFormula: TwwQuery;
    QryFormulaIDFORMULA: TFloatField;
    QryFormulaDESCRICAOFORMULA: TStringField;
    QryFormulaEXPRESSAOREAL: TStringField;
    QryFormulaIDREGRA: TFloatField;
    QryFormulaDESCGRUPOFORMULA: TStringField;
    QryRegra: TwwQuery;
    QryRegraIDREGRA: TFloatField;
    QryRegraNOMEREGRA: TStringField;
    QryPai: TwwQuery;
    QryPaiIDREGRA: TFloatField;
    QryPaiNOMEREGRA: TStringField;
    QryCamposChave: TwwQuery;
    QryCamposChaveNOMEDOCAMPO: TStringField;
    QryCamposChaveENTIDADE: TStringField;
    QryCamposChaveDESCRICAODOCAMPO: TStringField;
    dsCamposChave: TwwDataSource;
    dsPai: TwwDataSource;
    dsFormula: TwwDataSource;
    dsCampo: TwwDataSource;
    dsRegra: TwwDataSource;
    ds: TwwDataSource;
    dsVariavel: TwwDataSource;
    bdePipVariavel: TppBDEPipeline;
    bdePipFormula: TppBDEPipeline;
    bdePipRegra: TppBDEPipeline;
    bdePipCampo: TppBDEPipeline;
    bdePipPrincipal: TppBDEPipeline;
    bdePipRegrasPai: TppBDEPipeline;
    bdePipCamposChave: TppBDEPipeline;
    pprDetalhe: TppReport;
    ppReport1HeaderBand4: TppHeaderBand;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1DBText1: TppDBText;
    ppReport1DBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppReport1Label1: TppLabel;
    ppReport1DBText7: TppDBText;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1DBText3: TppDBText;
    ppReport1DBText4: TppDBText;
    ppReport1FooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppReport1SummaryBand1: TppSummaryBand;
    ppSubCampo: TppSubReport;
    ppReport1ChildReport1: TppChildReport;
    ppReport1ChildReport1Label1: TppLabel;
    ppReport1ChildReport1Label3: TppLabel;
    ppReport1ChildReport1Label4: TppLabel;
    ppReport1ChildReport1Line2: TppLine;
    ppReport1ChildReport1DetailBand1: TppDetailBand;
    ppReport1ChildReport1DBText1: TppDBText;
    ppReport1ChildReport1DBText3: TppDBText;
    ppReport1ChildReport1Group1: TppGroup;
    ppReport1ChildReport1GroupHeaderBand1: TppGroupHeaderBand;
    ppReport1ChildReport1DBText4: TppDBText;
    ppReport1ChildReport1GroupFooterBand1: TppGroupFooterBand;
    ppSubFormula: TppSubReport;
    ppReport1ChildReport2: TppChildReport;
    ppReport1Label6: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label8: TppLabel;
    ppReport1ChildReport2Label4: TppLabel;
    ppReport1ChildReport2Line1: TppLine;
    ppReport1DetailBand2: TppDetailBand;
    ppReport1DBText6: TppDBText;
    ppReport1ChildReport2Group1: TppGroup;
    ppReport1ChildReport2GroupHeaderBand1: TppGroupHeaderBand;
    ppReport1ChildReport2DBText1: TppDBText;
    ppReport1ChildReport2GroupFooterBand1: TppGroupFooterBand;
    ppSubRegra: TppSubReport;
    ppReport1ChildReport3: TppChildReport;
    ppReport1Label13: TppLabel;
    ppReport1Label14: TppLabel;
    ppReport1Label15: TppLabel;
    ppReport1ChildReport3Line1: TppLine;
    ppReport1DetailBand3: TppDetailBand;
    ppReport1DBText9: TppDBText;
    ppReport1DBText10: TppDBText;
    ppSubVariavel: TppSubReport;
    ppReport1ChildReport4: TppChildReport;
    ppReport1ChildReport4DetailBand1: TppDetailBand;
    ppReport1ChildReport4DBText3: TppDBText;
    ppReport1ChildReport4DBText4: TppDBText;
    ppSubRegrasPai: TppSubReport;
    ppReport1ChildReport5: TppChildReport;
    ppReport1HeaderBand3: TppHeaderBand;
    ppReport1Label19: TppLabel;
    ppReport1Label20: TppLabel;
    ppReport1Label21: TppLabel;
    ppReport1ChildReport5Line1: TppLine;
    ppReport1DetailBand4: TppDetailBand;
    ppReport1DBText13: TppDBText;
    ppReport1DBText14: TppDBText;
    ppSubCampoChave: TppSubReport;
    ppReport1ChildReport6: TppChildReport;
    ppReport1HeaderBand5: TppHeaderBand;
    ppReport1Label4: TppLabel;
    ppReport1Label5: TppLabel;
    ppReport1Line1: TppLine;
    ppReport1ChildReport6Label1: TppLabel;
    ppReport1ChildReport6Label2: TppLabel;
    ppReport1DetailBand5: TppDetailBand;
    ppReport1DBText8: TppDBText;
    ppReport1ChildReport6DBText1: TppDBText;
    ppReport1ChildReport6Group1: TppGroup;
    ppReport1ChildReport6GroupHeaderBand1: TppGroupHeaderBand;
    ppReport1DBText11: TppDBText;
    ppReport1ChildReport6GroupFooterBand1: TppGroupFooterBand;
    ppReport1ChildReport1Label5: TppLabel;
    ppReport1ChildReport2Label1: TppLabel;
    pprDetalheLabel1: TppLabel;
    pprDetalheLabel2: TppLabel;
    pprDetalheLine1: TppLine;
    ppReport1ChildReport2DBText2: TppDBText;
    QryIDGRUPOREGRA: TFloatField;
    ppCalc1: TppSystemVariable;
    ppTitleBand1: TppTitleBand;
    ppReport1ChildReport4Label4: TppLabel;
    ppReport1ChildReport4Label5: TppLabel;
    ppReport1ChildReport4Line1: TppLine;
    ppReport1ChildReport4Label6: TppLabel;
    ppTitleBand2: TppTitleBand;
    ppTitleBand3: TppTitleBand;
    ppTitleBand4: TppTitleBand;
    ppDBMemo1: TppDBMemo;
    QryDESCRICAOREGRA: TMemoField;
    ppDBMemo2: TppDBMemo;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppTitleBand5: TppTitleBand;
    ppLine5: TppLine;
    QryPermissao: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelDetalhes: TdtmRelDetalhes;

implementation

uses fParamRelatDetalhe;

{$R *.DFM}

function TdtmRelDetalhes.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     frm := nil;
     if UpperCase(Form)= 'FRMRELDETALHES' then  //Relat. Detalhes
        frm := TfrmParamRelatDetalhe.Create(Application);

     if frm = nil then Result := False
     else begin
          with frm do begin
               Result := (Showmodal = mrOk);
               Free;
          end;
     end;
end;


end.
