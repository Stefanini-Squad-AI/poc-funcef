{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 253082/17369
N. PPM..........: 844934
Data............: 29/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação do relatório ANS.
--------------------------------------------------------------------------------}

unit DRelatoriosContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe, ppSubRpt, Grids, DBGrids, ppModule,
  raCodMod, jpeg;

type
  TdtmRelatoriosContrato = class(TdtmReports)
    qryAlteraContrato: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    DateTimeField5: TDateTimeField;
    FloatField5: TFloatField;
    StringField6: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateTimeField6: TDateTimeField;
    StringField7: TStringField;
    FloatField9: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField10: TFloatField;
    StringField11: TStringField;
    DateTimeField7: TDateTimeField;
    dsAlteraContrato: TwwDataSource;
    pplAlteraContrato: TppBDEPipeline;
    rpAlteraContrato: TppReport;
    pplAlteraAditamento: TppBDEPipeline;
    dsAlteraAditamento: TwwDataSource;
    qryAlteraAditamento: TwwQuery;
    pplLogAditamento: TppBDEPipeline;
    dsLogAditamento: TwwDataSource;
    qryLogAditamento: TwwQuery;
    qryAlteraContratoIDCONTRATO: TFloatField;
    ppHeaderBand4: TppHeaderBand;
    ppLabel2: TppLabel;
    pplNomeEmpresa: TppLabel;
    ppLine11: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLabel11: TppLabel;
    ppLine12: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel12: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText3: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText4: TppDBText;
    ppLabel15: TppLabel;
    ppDBText5: TppDBText;
    ppLabel16: TppLabel;
    ppDBText6: TppDBText;
    ppLabel17: TppLabel;
    ppDBText7: TppDBText;
    ppLabel18: TppLabel;
    ppDBText8: TppDBText;
    ppLabel19: TppLabel;
    ppDBText9: TppDBText;
    ppLabel20: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel37: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel30: TppLabel;
    ppLine13: TppLine;
    ppDetailBand5: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppSummaryBand3: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDBText22: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel21: TppLabel;
    ppDBText12: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel27: TppLabel;
    ppDBText18: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLine2: TppLine;
    qryAlteraAditamentoIDCONTRATO: TFloatField;
    qryAlteraAditamentoIDADITAMENTO: TFloatField;
    qryAlteraAditamentoNOMECONTRATO: TStringField;
    qryAlteraAditamentoDATAASSADITAMENTO: TDateTimeField;
    qryAlteraAditamentoCODADITAMENTO: TStringField;
    qryAlteraAditamentoDESCADITAMENTO: TMemoField;

    // Felipe A. Santos SOL253082/17369 PPM844934 { fim qryANSIDCONTRATO}
    qryANS: TwwQuery;
    dsANS: TwwDataSource;
    pplANS: TppBDEPipeline;
    rpANS: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pplblTitulo: TppLabel;
    pplblNomeEmpresa: TppLabel;
    pplblLocal01: TppLabel;
    pplblLocal02: TppLabel;
    qryANSVLRMENSAL: TFloatField;
    qryANSVLRANS: TFloatField;
    qryANSNUMCI: TStringField;
    qryANSREFERENCIA: TStringField;
    qryANSNOMECONTRATO: TStringField;
    mfldANSOBS: TMemoField;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppimgLogo: TppImage;
    pplblContrato: TppLabel;
    ppLine02: TppLine;
    ppLine01: TppLine;
    pplblVlrMensal: TppLabel;
    pplblVlrANS: TppLabel;
    pplblNumCI: TppLabel;
    pplbl: TppLabel;
    pplblObs: TppLabel;
    ppDbTxtContrato: TppDBText;
    pplblPeriodo: TppLabel;
    ppdbtxtVlrMensal: TppDBText;
    ppdbtxtVlrANS: TppDBText;
    ppdbtxtNumCI: TppDBText;
    ppdbtxtRef: TppDBText;
    ppdbmmoObs: TppDBMemo;
    pplblVlrPeriodo: TppLabel;
    ppShapeTotContrato: TppShape;
    pplblTotContrato: TppLabel;
    ppLineTotContrato: TppLine;
    pplblTotVlrMensalContr: TppLabel;
    pplblTotVlrAnsContr: TppLabel;
    ppdbCalcVlrMensal: TppDBCalc;
    ppLine6: TppLine;
    ppDbCalcVlrANS: TppDBCalc;
    pplblModulo: TppLabel;
    pplblAreaUsu: TppLabel;
    ppsvarEmissao: TppSystemVariable;
    pplblEmissao: TppLabel;
    ppsvPag: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShapeTotGeral: TppShape;
    pplblTotalGeral: TppLabel;
    ppLineTotGeral: TppLine;
    pplblTotVlrMensallbl: TppLabel;
    ppDbTotVlrMensal: TppDBCalc;
    pplblVlrANSlbl: TppLabel;
    ppDbTotVlrANS: TppDBCalc;
    pplblQtdContratoslbl: TppLabel;
    pplblQtdContratos: TppLabel;
    pplineRodape: TppLine;
    qryANSIDCONTRATO: TFloatField;
    ppLabel1: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel3: TppLabel;
    ppDBCalc3: TppDBCalc;
    qryANSTOTPAGO: TFloatField;
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand7BeforePrint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean;override;
  end;

var
  dtmRelatoriosContrato: TdtmRelatoriosContrato;

implementation

uses FRelatAlteraContrato,
     FParamANS{// Felipe A. Santos SOL253082/17369 PPM844934};

{$R *.DFM}

function TdtmRelatoriosContrato.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (AnsiUpperCase(Form) = 'FRMRELATALTERACONTRATO') then
        frm := TfrmRelatAlteraContrato.Create(Application)

     // Felipe A. Santos SOL253082/17369 PPM844934  - início
     else if (AnsiUpperCase(Form)= 'FRMPARAMANS') then
        frm := TfrmParamANS.Create(Application)
     // Felipe A. Santos SOL253082/17369 PPM844934  - fim
     else
        frm := nil;

     if frm = nil then
       Result := false
     else begin
       with frm do begin
         Result := (ShowModal = mrOk);
         free;
       end;
     end;
end;

procedure TdtmRelatoriosContrato.ppGroupFooterBand3BeforePrint(Sender: TObject);
begin
  inherited;
  ppSubReport1.Visible := not qryAlteraAditamento.IsEmpty;
end;

procedure TdtmRelatoriosContrato.ppGroupFooterBand7BeforePrint(Sender: TObject);
begin
  inherited;
  ppSubReport2.Visible := not qryLogAditamento.IsEmpty;
end;

end.


