unit rCAFCadLocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCMfileUtils, IvDictio,
  IvMulti;

type
  TRptCAFCadLocal = class(TFrmCmReport)
    dsCadLocal: TwwDataSource;
    ppCadLocal: TppBDEPipeline;
    rpCadLocal: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel91: TppLabel;
    ppLine24: TppLine;
    ppLabel92: TppLabel;
    rpCadLocalLabel1: TppLabel;
    rpCadLocalLabel2: TppLabel;
    rpCadLocalLabel3: TppLabel;
    rpCadLocalLabel5: TppLabel;
    ppLine25: TppLine;
    rpCadLocalLabel6: TppLabel;
    ppDetailBand14: TppDetailBand;
    rpCadLocalDBText1: TppDBText;
    rpCadLocalDBText2: TppDBText;
    rpCadLocalDBText3: TppDBText;
    rpCadLocalDBText4: TppDBText;
    rpCadLocalDBText5: TppDBText;
    rpCadLocalDBText6: TppDBText;
    rpCadLocalLine1: TppLine;
    ppFooterBand14: TppFooterBand;
    ppLine26: TppLine;
    ppLabel96: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    sqlCadLocal: TCMSqlParams;
    cdsCadLocal: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadLocal: TRptCAFCadLocal;

implementation

{$R *.DFM}

procedure TRptCAFCadLocal.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      cdsCadLocal.Close;
      with sqlCadLocal do
      begin
         if not CmpRptCM.ParamValues[0].IsNull then
         begin
            SQL.Strings[11] := ' AND LTRIM(RTRIM(CC.CODCENTROCUSTO)) = ' + CmpRptCM.ParamValues[0].AsString ;
            SQL.Strings[12] := ' AND CC.IDEMPRESA = L.IDPESSOA ';
         end else
         begin
            SQL.Strings[11] := ' ';
            SQL.Strings[12] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if not CmpRptCM.ParamValues[1].IsNull then
         begin
            SQL.Strings[13] := ' AND TA.IDTIPOAREA = ' + CmpRptCM.ParamValues[1].AsString;
         end else
         begin
            SQL.Strings[13] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if not CmpRptCM.ParamValues[2].IsNull then
         begin
            SQL.Strings[14] := ' AND L.ENDERECO ' + CmpRptCM.ParamValues[2].Comparador + #39 + CmpRptCM.ParamValues[2].AsString + #39;
         end else
         begin
            SQL.Strings[14] := ' ';
         end;
         //-------------------------------------------------------------------------------
      end;
      Screen.Cursor := crSQLWait;
      sqlCadLocal.Prepare;
      sqlCadLocal.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlCadLocal.Open;
      Screen.Cursor := crDefault;
  except
     On E : Exception Do
     begin
        CMDebugToFile('CADASTRO DE LOCALIZAÇÕES : ' + E.Message);
     end;
  end;
end;

procedure TRptCAFCadLocal.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO,NOME ' +
                                                      ' FROM CENTCUST '+
                                                      ' WHERE STATUSGRUPOCDC = ''A'' '+
                                                      '   AND ATIVO = ''S'' '+
                                                      '   AND IDEMPRESA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY CODCENTROCUSTO ';
end;

end.
