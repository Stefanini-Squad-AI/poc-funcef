unit RConcContFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlParamIntegra, TXRB ;

type
  TRptConcContFin = class(TFrmCmReport)
    rpConcContFin: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel52: TppLabel;
    ppLine33: TppLine;
    pplblEmpresa: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText8: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine34: TppLine;
    pplblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppConcContFin: TppBDEPipeline;
    dsConcContFin: TwwDataSource;
    cdsConcContFin: TCMClientDataSet;
    spConcContFin: TCMSqlParams;
    pplblConta: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    pplblPeriodo: TppLabel;


    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }

    sConta: String;


  public  { Public declarations }


  end;



var
  RptConcContFin: TRptConcContFin;



implementation
{$R *.DFM}



procedure TRptConcContFin.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[2].ProcuraCCSettings.Plano:=ParamIntegra.Plano;
   CmpRptCM.ParamValues[2].ProcuraCCSettings.Mascara:=ParamIntegra.MascaraPlano;
end;



procedure TRptConcContFin.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   with spConcContFin do
   begin
      pplblConta.Caption:='Conta: '+CmpRptCM.ParamValues[2].AsString;
      pplblPeriodo.Caption:='Período: '+
                            FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+' à '+
                            FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);
      Prepare;
      ParamByName('DATAINI').AsString:=FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
      ParamByName('DATAFIM').AsString:=FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);
      ParamByName('PLACONTA').AsString:=CmpRptCM.ParamValues[2].AsString;
      Open;
   end;
end;



end.
