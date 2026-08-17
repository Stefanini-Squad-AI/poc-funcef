unit RSaldoHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc,
  ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, TXRB;

type
  TRptSaldoHist = class(TFrmCmReport)
    rpSaldoHist: TppReport;
    ppHeaderBand2: TppHeaderBand;
    lbDataSaldoHist: TppLabel;
    pplblEmpresa: TppLabel;
    rpSaldoHistLabel2: TppLabel;
    lbStatusSaldoHist: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpSaldoHistDBText3: TppDBText;
    rpSaldoHistDBText2: TppDBText;
    rpSaldoHistDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    pplblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    rpSaldoHistGroup1: TppGroup;
    rpSaldoHistGroupHeaderBand1: TppGroupHeaderBand;
    rpSaldoHistLabel1: TppLabel;
    rpSaldoHistLine1: TppLine;
    rpSaldoHistLabel3: TppLabel;
    rpSaldoHistLabel4: TppLabel;
    rpSaldoHistDBText1: TppDBText;
    rpSaldoHistLine2: TppLine;
    rpSaldoHistGroupFooterBand1: TppGroupFooterBand;
    dsSaldoHist: TwwDataSource;
    pplSaldoHist: TppBDEPipeline;
    spSaldoHist: TCMSqlParams;
    cdsSaldoHist: TCMClientDataSet;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  RptSaldoHist: TRptSaldoHist;



implementation
{$R *.DFM}



procedure TRptSaldoHist.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM PORTADORCONTA '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;

procedure TRptSaldoHist.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   spSaldoHist.SQL.Text:= ' SELECT '+
                          '   M.CODPORTADOR, '+
                          '   M.HISTPADFINAN, '+
                          '   C.DESCRICAO, '+
                          '   H.DESCRICAO AS HISTORICO, '+
                          '   SUM(DECODE(ENTRADASAIDA,''S'',VALORLANCFINAN*-1,VALORLANCFINAN)) AS VALOR '+
                          ' FROM '+
                          '   MOVIMFINANC M, '+
                          '   PORTADORCONTA C, '+
                          '   HISTORICOFINAN H '+
                          ' WHERE '+
                          '   (M.STATUSCONCILIA <> ''J'') '+
                          '   AND (M.DATALANCFINAN <= TO_DATE('''+
                          FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                          ''',''DD/MM/YYYY'')) ';

   if not(CmpRptCM.ParamValues[1].IsNull) then
      spSaldoHist.SQL.Add(' AND C.CODPORTADOR = '+FloatToStr(CmpRptCM.ParamValues[1].AsFloat));

   case CmpRptCM.ParamValues[2].AsInteger of
      1: spSaldoHist.SQL.Add(' AND M.STATUSCONCILIA IN (''I'',''X'')');
      2: spSaldoHist.SQL.Add(' AND M.STATUSCONCILIA <> ''C''');
   end;

   spSaldoHist.SQL.Add('   AND M.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+
                       '   AND C.CODPORTADOR = M.CODPORTADOR '+
                       '   AND H.HISTPADFINAN = M.HISTPADFINAN '+
                       ' GROUP BY '+
                       '   M.CODPORTADOR, '+
                       '   M.HISTPADFINAN, '+
                       '   C.DESCRICAO, '+
                       '   H.DESCRICAO '+
                       ' ORDER BY '+
                       '   C.DESCRICAO, '+
                       '   H.DESCRICAO ');
   spSaldoHist.Open;

   lbDataSaldoHist.Caption:='Saldo das Contas em '+
                            FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
   lbStatusSaldoHist.Caption:=CmpRptCM.ParamValues[2].RadioGroupSettings.Items[
                                             CmpRptCM.ParamValues[2].AsInteger];
end;



end.
