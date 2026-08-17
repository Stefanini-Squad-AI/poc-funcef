unit rCAFCadTipoMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager,
  TXComp, CmParamReport, uCtrlPadroes, uCMfileUtils, IvDictio, IvMulti;

type
  TRptCAFCadTipoMov = class(TFrmCmReport)
    dsCadTipMov: TwwDataSource;
    ppCadTipMov: TppBDEPipeline;
    rpCadTipMov: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel20: TppLabel;
    ppLine7: TppLine;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine8: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine9: TppLine;
    ppLabel25: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    sqlCadTipMov: TCMSqlParams;
    cdsCadTipMov: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadTipoMov: TRptCAFCadTipoMov;

implementation

{$R *.dfm}

procedure TRptCAFCadTipoMov.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   try
      cdsCadTipMov.Close;
      with sqlCadTipMov do
      begin
         if not CmpRptCM.ParamValues[0].IsNull then
         begin
            SQL.Strings[2] := 'WHERE IDTIPOMOVIMENTACAO = ' + CmpRptCM.ParamValues[0].AsString;
         end else
         begin
            SQL.Strings[2] := ' ';
         end;
      end;
      Screen.Cursor := crSQLWait;
      sqlCadTipMov.Open;
      Screen.Cursor := crDefault;
  except
     On E : Exception Do
     begin
        CMDebugToFile('CADASTRO DE TIPOS DE MOVIMENTAÇÕES : ' + E.Message);
     end;
  end;
end;

end.
