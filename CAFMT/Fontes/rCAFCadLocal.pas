unit rCAFCadLocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery;

type
  TRptCAFCadLocal = class(TFrmCmReport)
    qryCadLocal: TwwQuery;
    qryCadLocalDESCLOCAL: TStringField;
    qryCadLocalCODCENTROCUSTO: TStringField;
    qryCadLocalENDERECO: TStringField;
    qryCadLocalDESCCCUSTO: TStringField;
    qryCadLocalNOMERESP: TStringField;
    qryCadLocalDESCTIPOAREA: TStringField;
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
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
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
   with qryCadLocal do
   begin
      Close;
      if (not CmpRptCM.ParamValues[0].IsNull) then
      begin
         SQL.Strings[11] := ' AND (LTRIM(RTRIM(CC.CODCENTROCUSTO)) = '+CmpRptCM.ParamValues[0].AsString + ') AND';
      end else
      begin
         SQL.Strings[11] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if (not CmpRptCM.ParamValues[1].IsNull) then
      begin
         SQL.Strings[12] := ' AND (TA.IDTIPOAREA = '+CmpRptCM.ParamValues[1].AsString + ') AND';
      end else
      begin
         SQL.Strings[12] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if (not CmpRptCM.ParamValues[2].IsNull) then
      begin
         SQL.Strings[13] := ' AND (L.ENDERECO ' + CmpRptCM.ParamValues[2].Comparador + ' ''' + CmpRptCM.ParamValues[2].AsString + ''')';
      end else
      begin
         SQL.Strings[13] := ' ';
      end;
      //----------------------------------------------------------------------------------
      Open;
   end;
end;

procedure TRptCAFCadLocal.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryCadLocal.Active then
      qryCadLocal.Close;
   qryCadLocal.DataBaseName := sDataBaseName;
end;

end.
