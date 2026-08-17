unit RFluxoRealAnalCAPCAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams, TXRB, uCtrlExtratoContas, uCtrlPadroes, uSistema;

type
  TRptFluxoRealAnalCAPCAR = class(TFrmCmReport)
    rpFluxoRealAnal: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblEmpresa: TppLabel;
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
    rpFluxoReaAnaDBText2: TppDBText;
    rpFluxoReaAnaGroupFooterBand1: TppGroupFooterBand;
    rpFluxoReaAnaDBCalc2: TppDBCalc;
    rpFluxoReaAnaLabel9: TppLabel;
    rpFluxoReaAnaGroup2: TppGroup;
    rpFluxoReaAnaGroupHeaderBand2: TppGroupHeaderBand;
    rpFluxoReaAnaLine4: TppLine;
    rpFluxoReaAnaLabel2: TppLabel;
    rpFluxoReaAnaDBText4: TppDBText;
    rpFluxoReaAnaGroupFooterBand2: TppGroupFooterBand;
    rpFluxoReaAnaDBCalc1: TppDBCalc;
    rpFluxoReaAnaLine5: TppLine;
    pplFluxoRealAnal: TppBDEPipeline;
    dsFluxoRealAnal: TwwDataSource;
    cdsFluxoRealAnal: TCMClientDataSet;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppShape2: TppShape;
    ppShape3: TppShape;
    CdsLogo: TCMClientDataSet;
    ppDBImage1: TppDBImage;
    pplLogo: TppDBPipeline;
    dsLogo: TDataSource;
    lbAdicionais: TppLabel;

    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }

    CtrlExtratoContas : TCtrlExtratoContas;


  public  { Public declarations }


  end;



var
  RptFluxoRealAnalCAPCAR: TRptFluxoRealAnalCAPCAR;



implementation
{$R *.DFM}



procedure TRptFluxoRealAnalCAPCAR.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   if CmpRptCM.ParamValues[0].AsDateTime <> 0 then
      lbAdicionais.Caption  := 'Data inicial: ' + CmpRptCM.ParamValues[0].AsString + '      ';

   if CmpRptCM.ParamValues[1].AsDateTime <> 0 then
      lbAdicionais.Caption  := lbAdicionais.Caption  + 'Data final: ' + CmpRptCM.ParamValues[1].AsString;
      
   CdsLogo.Data          := CtrlExtratoContas.ListaLogo(Sistema.IdEmpresa);
   cdsFluxoRealAnal.Data := CtrlExtratoContas.ListaFluxoRealAnalCAPCAR(CmpRptCM.ParamValues[0].AsDateTime,
                                                                       CmpRptCM.ParamValues[1].AsDateTime,
                                                                       Sistema.IdEmpresa);
end;




procedure TRptFluxoRealAnalCAPCAR.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlExtratoContas := TCtrlExtratoContas.Create;
  CtrlExtratoContas.InitializeAs(Padroes);
end;




procedure TRptFluxoRealAnalCAPCAR.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlExtratoContas);
  inherited;
end;



end.
