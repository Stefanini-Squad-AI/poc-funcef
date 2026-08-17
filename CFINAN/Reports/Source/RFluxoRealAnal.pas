unit RFluxoRealAnal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams, TXRB;

type
  TRptFluxoRealAnal = class(TFrmCmReport)
    rpFluxoRealAnal: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblEmpresa: TppLabel;
    rpFluxoReaAnaLine1: TppLine;
    rpFluxoReaAnaLine3: TppLine;
    rpFluxoReaAnaLabel3: TppLabel;
    rpFluxoReaAnaLabel4: TppLabel;
    rpFluxoReaAnaLabel5: TppLabel;
    rpFluxoReaAnaLabel6: TppLabel;
    rpFluxoReaAnaLabel7: TppLabel;
    ppDetailBand7: TppDetailBand;
    rpFluxoReaAnaDBText5: TppDBText;
    rpFluxoReaAnaDBText6: TppDBText;
    rpFluxoReaAnaDBText7: TppDBText;
    rpFluxoReaAnaDBText8: TppDBText;
    rpFluxoReaAnaDBText9: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine8: TppLine;
    pplblSistema: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    rpFluxoReaAnaSummaryBand1: TppSummaryBand;
    rpFluxoReaAnaLabel10: TppLabel;
    rpFluxoReaAnaDBCalc3: TppDBCalc;
    rpFluxoReaAnaGroup1: TppGroup;
    rpFluxoReaAnaGroupHeaderBand1: TppGroupHeaderBand;
    rpFluxoReaAnaLabel1: TppLabel;
    rpFluxoReaAnaDBText1: TppDBText;
    rpFluxoReaAnaDBText2: TppDBText;
    rpFluxoReaAnaGroupFooterBand1: TppGroupFooterBand;
    rpFluxoReaAnaDBCalc2: TppDBCalc;
    rpFluxoReaAnaLabel9: TppLabel;
    rpFluxoReaAnaLine7: TppLine;
    rpFluxoReaAnaLine6: TppLine;
    rpFluxoReaAnaGroup2: TppGroup;
    rpFluxoReaAnaGroupHeaderBand2: TppGroupHeaderBand;
    rpFluxoReaAnaLine4: TppLine;
    rpFluxoReaAnaLabel2: TppLabel;
    rpFluxoReaAnaDBText3: TppDBText;
    rpFluxoReaAnaDBText4: TppDBText;
    rpFluxoReaAnaLine2: TppLine;
    rpFluxoReaAnaGroupFooterBand2: TppGroupFooterBand;
    rpFluxoReaAnaLabel8: TppLabel;
    rpFluxoReaAnaDBCalc1: TppDBCalc;
    rpFluxoReaAnaLine5: TppLine;
    pplFluxoRealAnal: TppBDEPipeline;
    dsFluxoRealAnal: TwwDataSource;
    spFluxoRealAnal: TCMSqlParams;
    cdsFluxoRealAnal: TCMClientDataSet;

    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  RptFluxoRealAnal: TRptFluxoRealAnal;



implementation
{$R *.DFM}



procedure TRptFluxoRealAnal.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   spFluxoRealAnal.Prepare;
   spFluxoRealAnal.ParamByName('DataInicial').AsString:=
                   FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
   spFluxoRealAnal.ParamByName('DataFinal').AsString:=
                   FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);
   spFluxoRealAnal.ParamByName('IDPessoa').AsFloat:=CrmRptCM.IdEmpresa;
   spFluxoRealAnal.Open;
end;



end.
