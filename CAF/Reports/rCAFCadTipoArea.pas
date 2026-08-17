unit rCAFCadTipoArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager,
  TXComp, CmParamReport, uCtrlPadroes, uCMfileUtils, IvDictio, IvMulti;

type
  TRptCAFCadTipoArea = class(TFrmCmReport)
    sqlCadTipArea: TCMSqlParams;
    cdsCadTipArea: TCMClientDataSet;
    dsCadTipArea: TwwDataSource;
    ppCadTipArea: TppBDEPipeline;
    rpCadTipArea: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel97: TppLabel;
    ppLine27: TppLine;
    ppLabel98: TppLabel;
    ppLabel100: TppLabel;
    ppLine28: TppLine;
    ppDetailBand15: TppDetailBand;
    ppDBText58: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine29: TppLine;
    ppLabel102: TppLabel;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadTipoArea: TRptCAFCadTipoArea;

implementation

{$R *.dfm}

procedure TRptCAFCadTipoArea.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   try
      cdsCadTipArea.Close;
      with sqlCadTipArea do
      begin
         if not CmpRptCM.ParamValues[0].IsNull then
         begin
            SQL.Strings[2] := 'WHERE IDTIPOAREA = ' + CmpRptCM.ParamValues[0].AsString;
         end else
         begin
            SQL.Strings[2] := ' ';
         end;
      end;
      Screen.Cursor := crSQLWait;
      sqlCadTipArea.Open;
      Screen.Cursor := crDefault;
  except
     On E : Exception Do
     begin
        CMDebugToFile('CADASTRO DE TIPOS DE ÁREA : ' + E.Message);
     end;
  end;
end;

end.
