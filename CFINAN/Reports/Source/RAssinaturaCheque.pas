unit RAssinaturaCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe, ppDBBDE,
  Db, Wwdatsrc, ppVar, ppBands, ppCtrls, Series, TeEngine, ExtCtrls,
  TeeProcs, Chart, DBChart, ppChrtDB, ppPrnabl, ppClass, ppChrt, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams, ppModule, TXRB;

type
  TRptAssinaturaCheque = class(TFrmCmReport)
    spAssinaturaCheque: TCMSqlParams;
    cdsAssinaturaCheque: TCMClientDataSet;
    dsAssinaturaCheque: TwwDataSource;
    pplAssinaturaCheque: TppBDEPipeline;
    rpAssinaturaCheque: TppReport;
    ppHeaderBand11: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppLine33: TppLine;
    pplblEmpresa: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppFooterBand12: TppFooterBand;
    ppLine34: TppLine;
    pplblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppDBTConta: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBTHistorico: TppDBText;
    ppDBTCheque: TppDBText;
    ppDBTValor: TppDBText;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;




var
  RptAssinaturaCheque: TRptAssinaturaCheque;



implementation
{$R *.DFM}



procedure TRptAssinaturaCheque.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM PORTADORCONTA '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;



procedure TRptAssinaturaCheque.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   with spAssinaturaCheque do
   begin
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('   M.HISTORICO, ');
      SQL.Add('   M.NUMCHQBORDERO, ');
      SQL.Add('   M.DATALANCFINAN, ');
      SQL.Add('   DECODE(M.ENTRADASAIDA,''E'',M.VALORLANCFINAN,M.VALORLANCFINAN*-1) AS VALOR, ');
      SQL.Add('   E.NOMEEMPRESA, ');
      SQL.Add('   E.IDPESSOA, ');
      SQL.Add('   (SA1.SALDOANT + SA2.SALDOANT) AS SALDOANT, ');
      SQL.Add('   S.SALDOATU, ');
      SQL.Add('   P.DESCRICAO AS CONTABANCARIA, ');
      SQL.Add('   M.CODPORTADOR, ');
      SQL.Add('   T.DESCRICAO AS DESCTIPORECDES, ');
      SQL.Add('   T.CODTIPRECDES, ');
      SQL.Add('   TO_CHAR(M.TRGDTINCLUSAO,''DD/MM/YYYY'') AS DATALANCTO, ');
      SQL.Add('   M.CODLANCFINANC, ');
      SQL.Add('   NC.TOTNAOCON, ');
      SQL.Add('   (S.SALDOATU + NC.TOTNAOCON) AS TOTCON ');
      SQL.Add('FROM ');
      SQL.Add('   MOVIMFINANC M, ');
      SQL.Add('   PORTADORCONTA P, ');
      SQL.Add('   RATEIOFINANC R, ');
      SQL.Add('   EMPRESAPROP E, ');
      SQL.Add('   TIPORECEBDESEMB T, ');
      SQL.Add('   (SELECT ');
      SQL.Add('       SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SALDOANT, ');
      SQL.Add('       CODPORTADOR ');
      SQL.Add('    FROM ');
      SQL.Add('       MOVIMFINANC ');
      SQL.Add('    WHERE ');
      SQL.Add('       (STATUSCONCILIA <> ''C'') AND ');
      SQL.Add('       (TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY'')) = '+
                      'TO_DATE('''+FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ''',''DD/MM/YYYY'')) ');
      SQL.Add('    GROUP BY CODPORTADOR) SA1, ');
      SQL.Add('   (SELECT ');
      SQL.Add('       SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SALDOANT, ');
      SQL.Add('       CODPORTADOR ');
      SQL.Add('    FROM ');
      SQL.Add('       MOVIMFINANC ');
      SQL.Add('    WHERE ');
      SQL.Add('       (TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY'')) < '+
                      'TO_DATE('''+FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ''',''DD/MM/YYYY'')) ');
      SQL.Add('    GROUP BY CODPORTADOR) SA2, ');
      SQL.Add('   (SELECT ');
      SQL.Add('       SUM(DECODE(ENTRADASAIDA,''S'',VALORLANCFINAN,-VALORLANCFINAN)) AS TOTNAOCON,  ');
      SQL.Add('       CODPORTADOR ');
      SQL.Add('    FROM ');
      SQL.Add('       MOVIMFINANC ');
      SQL.Add('    WHERE ');
      SQL.Add('       (STATUSCONCILIA IN (''C'',''N'')) AND ');
      SQL.Add('       (TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY'')) <= '+
                      'TO_DATE('''+FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ''',''DD/MM/YYYY'')) ');
      SQL.Add('    GROUP BY CODPORTADOR) NC, ');
      SQL.Add('   (SELECT ');
      SQL.Add('       SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SALDOATU, ');
      SQL.Add('       CODPORTADOR ');
      SQL.Add('    FROM ');
      SQL.Add('       MOVIMFINANC ');
      SQL.Add('    WHERE ');
      SQL.Add('       (TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY'')) <= '+
                      'TO_DATE('''+FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ''',''DD/MM/YYYY'')) ');
      SQL.Add('    GROUP BY CODPORTADOR) S ');
      SQL.Add('WHERE ');
      SQL.Add('   (P.CODPORTADOR = M.CODPORTADOR) AND ');
      SQL.Add('   (M.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ');
      SQL.Add('   (M.STATUSCONCILIA = ''C'') AND ');
      SQL.Add('   (R.CODLANCFINANC = M.CODLANCFINANC) AND ');
      SQL.Add('   (M.CODPORTADOR = S.CODPORTADOR(+)) AND ');
      SQL.Add('   (M.CODPORTADOR = SA1.CODPORTADOR(+)) AND ');
      SQL.Add('   (M.CODPORTADOR = SA2.CODPORTADOR(+)) AND ');
      SQL.Add('   (M.CODPORTADOR = NC.CODPORTADOR(+)) AND ');
      SQL.Add('   (E.IDPESSOA = M.IDPESSOA) AND ');
      SQL.Add('   (T.CODTIPRECDES = R.CODTIPRECDES) AND ');
      SQL.Add('   (T.RECPAG = R.RECPAG) AND ');
      SQL.Add('   (T.IDPESSOA = R.IDPESSOA) AND ');
      SQL.Add('   (TO_DATE(TO_CHAR(M.TRGDTINCLUSAO,''DD/MM/YYYY'')) = '+
                  'TO_DATE('''+FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                           ''',''DD/MM/YYYY'')) ');
      if not(CmpRptCM.ParamValues[1].IsNull) then
         SQL.Add('   AND (M.CODPORTADOR = '+FloatToSTr(CmpRptCM.ParamValues[1].AsFloat)+') ');
      SQL.Add('ORDER BY M.CODPORTADOR, M.DATALANCFINAN ');
      Open;
   end;

   pplblTitulo.Caption:=pplblTitulo.Caption+' - '+
                        FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
end;



end.
