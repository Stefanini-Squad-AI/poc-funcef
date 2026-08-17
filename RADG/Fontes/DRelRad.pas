unit DRelRad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe;

type
  TDtmRelRAD = class(TdtmReports)
    bdeAcompProc: TppBDEPipeline;
    dsAcompProc: TwwDataSource;
    qryAcompProc: TwwQuery;
    RptAcompProc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    RptAcompProcLine1: TppLine;
    RptAcompProcLabel1: TppLabel;
    LbProc: TppLabel;
    RptAcompProcLabel3: TppLabel;
    RptAcompProcLabel4: TppLabel;
    RptAcompProcDBText1: TppDBText;
    RptAcompProcDBText2: TppDBText;
    RptAcompProcDBMemo1: TppDBMemo;
    RptAcompProcLabel2: TppLabel;
    RptAcompProcDBText3: TppDBText;
    RptAcompProcLine2: TppLine;
    RptAcompProcLabel5: TppLabel;
    RptAcompProcLabel6: TppLabel;
    RptAcompProcLabel7: TppLabel;
    RptAcompProcLabel8: TppLabel;
    RptAcompProcDBText4: TppDBText;
    RptAcompProcDBText5: TppDBText;
    RptAcompProcDBText6: TppDBText;
    RptAcompProcLabel9: TppLabel;
    RptAcompProcLabel10: TppLabel;
    RptAcompProcLabel12: TppLabel;
    RptAcompProcDBText7: TppDBText;
    RptAcompProcDBText8: TppDBText;
    RptAcompProcDBText9: TppDBText;
    RptAcompProcLabel11: TppLabel;
    RptAcompProcDBText10: TppDBText;
    RptAcompProcLabel13: TppLabel;
    RptAcompProcDBText11: TppDBText;
    RptAcompProcLabel14: TppLabel;
    RptAcompProcDBMemo2: TppDBMemo;
    RptAcompProcLine3: TppLine;
    RptAcompProcLabel15: TppLabel;
    bdeFluxoProc: TppBDEPipeline;
    dsFluxoProc: TwwDataSource;
    qryFluxoProc: TwwQuery;
    RptFluxoProc: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    LbProc2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppLabel16: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel18: TppLabel;
    ppDBText8: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppGroupFooterBand1: TppGroupFooterBand;
    RptFluxoProcLabel1: TppLabel;
    RptFluxoProcDBText1: TppDBText;
    RptFluxoProcDBText2: TppDBText;
    RptFluxoProcDBText3: TppDBText;
    RptFluxoProcLabel2: TppLabel;
    RptFluxoProcLabel3: TppLabel;
    RptFluxoProcLine1: TppLine;
    RptFluxoProcLabel4: TppLabel;
    RptFluxoProcLine2: TppLine;
    RptFluxoProcLine3: TppLine;
    RptFluxoProcLabel5: TppLabel;
    RptFluxoProcLabel6: TppLabel;
    RptFluxoProcDBText4: TppDBText;
    RptFluxoProcLabel7: TppLabel;
    RptFluxoProcDBText5: TppDBText;
    bdeInfoProc: TppBDEPipeline;
    dsInfoProc: TwwDataSource;
    qryInfoProc: TwwQuery;
    RptInfoProc: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    LbProc3: TppLabel;
    ppLine3: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText2: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLabel13: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    RptInfoProcLabel1: TppLabel;
    RptInfoProcDBText1: TppDBText;
    RptInfoProcLabel2: TppLabel;
    RptInfoProcLabel3: TppLabel;
    RptInfoProcDBText2: TppDBText;
    RptInfoProcDBText3: TppDBText;
    RptInfoProcLabel4: TppLabel;
    RptInfoProcDBText4: TppDBText;
    RptInfoProcDBText5: TppDBText;
    RptInfoProcLabel5: TppLabel;
    bdeGrpRespon: TppBDEPipeline;
    dsGrpRespon: TwwDataSource;
    qryGrpRespon: TwwQuery;
    RptGrpRespon: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine8: TppLine;
    ppLabel20: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLine9: TppLine;
    ppLabel21: TppLabel;
    RptGrpResponLabel1: TppLabel;
    LbGrpRespon: TppLabel;
    RptGrpResponLabel2: TppLabel;
    RptGrpResponLabel3: TppLabel;
    RptGrpResponDBText1: TppDBText;
    RptGrpResponDBText2: TppDBText;
    RptGrpResponLine1: TppLine;
    bdeGrpAut: TppBDEPipeline;
    dsGrpAut: TwwDataSource;
    qryGrpAut: TwwQuery;
    RptGrpAut: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel22: TppLabel;
    ppLine10: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    LbGrpAut: TppLabel;
    ppLabel27: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLine11: TppLine;
    ppLabel28: TppLabel;
    RptGrpAutLine1: TppLine;
    RptGrpAutDBText1: TppDBText;
    RptGrpAutLine2: TppLine;
    RptGrpAutDBText2: TppDBText;
    RptGrpAutLabel1: TppLabel;
    RptGrpAutDBText3: TppDBText;
    RptGrpAutLabel2: TppLabel;
    RptGrpAutDBText4: TppDBText;
    RptGrpAutLabel3: TppLabel;
    RptGrpAutDBText5: TppDBText;
    ppLabel26: TppLabel;
    RptGrpAutLabel4: TppLabel;
    RptGrpAutDBText6: TppDBText;
    RptGrpAutLabel5: TppLabel;
    RptGrpAutDBText7: TppDBText;
    RptGrpAutLabel6: TppLabel;
    RptGrpAutDBText8: TppDBText;
    bdeTipoEtapa: TppBDEPipeline;
    dsTipoEtapa: TwwDataSource;
    qryTipoEtapa: TwwQuery;
    RptTipoEtapa: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel25: TppLabel;
    ppLine12: TppLine;
    ppLabel29: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppLine13: TppLine;
    ppLabel34: TppLabel;
    RptTipoEtapaDBText1: TppDBText;
    RptTipoEtapaDBMemo1: TppDBMemo;
    RptTipoEtapaLabel1: TppLabel;
    RptTipoEtapaLabel2: TppLabel;
    RptTipoEtapaDBText2: TppDBText;
    RptTipoEtapaDBText3: TppDBText;
    RptAcompProcLabel16: TppLabel;
    RptAcompProcDBText12: TppDBText;
    qryProc: TwwQuery;
    qryProcIDTIPOPROCESSO: TFloatField;
    qryProcNOME: TStringField;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  DtmRelRAD: TDtmRelRAD;

implementation

{$R *.DFM}

Uses FParamAcompProc, FParamFluxoProc, FParamGrpRespon,
     FParamInfoProc,  FParamGrpAut,    FParamTipoEtapa;

function TDtmRelRAD.MostraParam(Form: string): boolean;
var frm : TForm;
begin                                   
     if (AnsiUpperCase(Form) = 'FRMPARAMACOMPPROC') then
        frm := TfrmParamAcompProc.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'FRMPARAMFLUXOPROC') then
        frm := TFrmParamFluxoProc.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'FRMPARAMGRPRESPON') then
        frm := TFrmParamGrpRespon.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'FRMPARAMINFOPROC') then
        frm := TFrmParamInfoProc.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'FRMPARAMTIPOETAPA') then
        frm := TFrmParamTipoEtapa.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'FRMPARAMGRPAUT') then
        frm := TFrmParamGrpAut.Create(Application)
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
