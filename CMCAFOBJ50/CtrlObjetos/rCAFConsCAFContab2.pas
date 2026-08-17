unit rCAFConsCAFContab2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uAtivoFixo,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, MontaSelect;

type
  TRptCAFConsCAFContab2 = class(TFrmCmReport)
    cdsConsCAFContab2: TCMClientDataSet;
    dsConsCAFContab2: TwwDataSource;
    ppConsCAFContab2: TppBDEPipeline;
    rpConsCAFContab2: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLine21: TppLine;
    ppLabel36: TppLabel;
    ppLabel20: TppLabel;
    lblLanc: TppLabel;
    ppLine10: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine23: TppLine;
    ppLabel37: TppLabel;
    ppCalc12: TppSystemVariable;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    qryAux: TwwQuery;
    sqlConsCAFContab22: TCMSqlParams;
    LbPer13: TppLabel;
    lblSubTitulo: TppLabel;
    sqlConsCAFContab21: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    function DataUltFechamento : TDate;

  public

  end;

var
  RptCAFConsCAFContab2: TRptCAFConsCAFContab2;

implementation

{$R *.DFM}

procedure TRptCAFConsCAFContab2.CmpRptCMBeforeExecute(var CanExecute: Boolean);
Var
   iAno, iMes, iDia : Word;
begin
   inherited;
   DecodeDate(DataUltFechamento, iAno, iMes, iDia);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := datetostr(EncodeDate(iAno, iMes, 01));
   CmpRptCM.ParamValues[1].TextDefault := datetostr(EncodeDate(iAno, iMes, iDia));
end;

procedure TRptCAFConsCAFContab2.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      cdsConsCAFContab2.Close;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlConsCAFContab21.Prepare;
         sqlConsCAFContab21.ParamByName('DATAINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
         sqlConsCAFContab21.ParamByName('DATAFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
         sqlConsCAFContab21.Open;
         //-------------------------------------------------------------------------------
         lblSubTitulo.Caption := 'Planilhas não mais associadas ao Ativo Fixo';
         lblLanc.Caption := 'No.Lançamentos'
      end else
      begin
         sqlConsCAFContab22.Prepare;
         sqlConsCAFContab22.ParamByName('DATAINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
         sqlConsCAFContab22.ParamByName('DATAFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
         sqlConsCAFContab22.Open;
         //-------------------------------------------------------------------------------
         lblSubTitulo.Caption := 'Lançamentos modificados pela Contabilidade';
         lblLanc.Caption := 'Lançamento'
      end;
      //----------------------------------------------------------------------------------
      LbPer13.Caption := 'De ' + datetostr(CmpRptCM.ParamValues[0].AsDateTime) + ' a ' + datetostr(CmpRptCM.ParamValues[1].AsDateTime);
      Screen.Cursor := crDefault;
   except
      on E : Exception do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('Erro no Relatório CONCILIAÇÃO ENTRE ATIVO FIXO E CONTABILIDADE II!' + #13 + #10 +
                       'Causa : ' + E.Message);
      end;
   end;
end;

function TRptCAFConsCAFContab2.DataUltFechamento : TDate;
begin
   sqlVerUltFec.Prepare;
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat       := CrmRptCM.IdEmpresa;
   sqlVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := 0;
   sqlVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := 0;
   sqlVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not cdsVerUltFec.IsEmpty then
      Result := cdsVerUltFec.FieldByName('DATAULT').AsDateTime
   else
      Result := -1;
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

end.
