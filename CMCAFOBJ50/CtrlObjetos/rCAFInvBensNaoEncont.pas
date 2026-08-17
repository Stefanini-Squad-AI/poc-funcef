unit rCAFInvBensNaoEncont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uAtivoFixo,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, MontaSelect;

type
  TRptCAFInvBensNaoEncont = class(TFrmCmReport)
    sqlInvBensNaoEncont: TCMSqlParams;
    cdsInvBensNaoEncont: TCMClientDataSet;
    dsInvBensNaoEncont: TwwDataSource;
    ppInvBensNaoEncont: TppBDEPipeline;
    rpInvBensNaoEncont: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLine21: TppLine;
    ppLabel36: TppLabel;
    ppLabel11: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine10: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine23: TppLine;
    ppLabel37: TppLabel;
    ppCalc12: TppSystemVariable;
    MSInventBens: TMontaSelect;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    qryAux: TwwQuery;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    function DataUltFechamento : TDate;

  public

  end;

var
  RptCAFInvBensNaoEncont: TRptCAFInvBensNaoEncont;

implementation

{$R *.DFM}

procedure TRptCAFInvBensNaoEncont.CrmRptCMBeforePrint(Sender: TObject);
var
   dDataSldBem : TDateTime;
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if trim(MSInventBens.ValoresChave[2]) = '' then
         dDataSldBem := DataUltFechamento
      else
         dDataSldBem := StrToDate(MSInventBens.ValoresChave[2]);
      //----------------------------------------------------------------------------------
      sqlInvBensNaoEncont.Prepare;
      sqlInvBensNaoEncont.ParamByName('IDINVENTARIOBENS').AsInteger := StrToInt(MSInventBens.ValoresChave[0]);
      sqlInvBensNaoEncont.ParamByName('IDPESSOA').AsInteger := StrToInt(MSInventBens.ValoresChave[1]);
      sqlInvBensNaoEncont.ParamByName('DATASLDBEM').AsDateTime := dDataSldBem;
      sqlInvBensNaoEncont.Open;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('Erro no Relatório RELAÇÃO DE BENS NÃO ENCONTRADOS!' + #13 + #10 +
                       'Causa : ' + E.Message);
      end;
   end;
end;

procedure TRptCAFInvBensNaoEncont.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSInventBens.Filtro.Add('INVENTARIOBENS.IDEMPRESA = ' + FloatToStr(CrmRptCM.IdEmpresa));
end;

function TRptCAFInvBensNaoEncont.DataUltFechamento : TDate;
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
