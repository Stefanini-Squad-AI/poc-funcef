unit RDemPosFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDB, ppDBPipe,
  ppDBBDE, Wwdatsrc, DBTables, Wwquery, TXRB;

type
  TRptDemPosFinanc = class(TFrmCmReport)
    spDemPosFinanc: TCMSqlParams;
    cdsDemPosFinanc: TCMClientDataSet;
    rpDemPosFinananc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    pplEmpresa: TppLabel;
    ppDetailBand1: TppDetailBand;
    DBText3: TppDBText;
    dbtValorOM: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    pplSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    dbtNomeBanco: TppDBText;
    pplDataFinal: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppgCabecalhoDescricao: TppGroupHeaderBand;
    DBText6: TppDBText;
    Line4: TppLine;
    ppLabel4: TppLabel;
    DBText1: TppDBText;
    ppLine3: TppLine;
    Line3: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    Line5: TppLine;
    ppLabel6: TppLabel;
    DBText2: TppDBText;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    DBDescStatus: TppDBText;
    ppLabel7: TppLabel;
    DBText8: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel5: TppLabel;
    dbcSubTotalAna: TppDBCalc;
    pplDemPosFinanc: TppBDEPipeline;
    dsDemPosFinanc: TwwDataSource;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    dbcSubTotalAnaOM: TppDBCalc;
    ppDBText4: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine6: TppLine;
    ppDBText5: TppDBText;
    ppLine7: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;

    procedure pplDataFinalPrint(Sender: TObject);
    procedure rpDemPosFinanancBeforePrint(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure dbtNomeBancoPrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }

    dDataFinal    : TDateTime;
    bFim          : Boolean;


  end;



var
  RptDemPosFinanc: TRptDemPosFinanc;



implementation
{$R *.DFM}



procedure TRptDemPosFinanc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM '+
                                                    '   PORTADORCONTA '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;



procedure TRptDemPosFinanc.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;

   spDemPosFinanc.Prepare;
   spDemPosFinanc.ParamByName('IDPessoa').AsFloat:=CrmRptCM.IdEmpresa;
   spDemPosFinanc.ParamByName('DataFinal').AsDateTime:=CmpRptCM.ParamValues[1].AsDateTime;
   dDataFinal:=CmpRptCM.ParamValues[1].AsDateTime;

   spDemPosFinanc.ParamByName('CodPortador').AsFloat:=0;
   spDemPosFinanc.ParamByName('TodosBancos').AsString:='';
   if not(CmpRptCM.ParamValues[0].IsNull) then
      spDemPosFinanc.ParamByName('CodPortador').AsFloat:=CmpRptCM.ParamValues[0].AsFloat
   else
      spDemPosFinanc.ParamByName('TodosBancos').AsString:='Todos';
   spDemPosFinanc.Open;
end;



procedure TRptDemPosFinanc.rpDemPosFinanancBeforePrint(Sender: TObject);
begin
   inherited;
   bFim:=False;
end;



procedure TRptDemPosFinanc.pplDataFinalPrint(Sender: TObject);
begin
   pplDataFinal.Caption:='Data Final: '+FormatDateTime('dd/mm/yyyy',dDataFinal);
end;



procedure TRptDemPosFinanc.ppSummaryBand1BeforePrint(Sender: TObject);
begin
   inherited;
   bFim:=True;
end;



procedure TRptDemPosFinanc.dbtNomeBancoPrint(Sender: TObject);
begin
   inherited;
   dbtNomeBanco.Caption:=cdsDemPosFinanc.FieldByName('NOME').AsString;
end;



end.
