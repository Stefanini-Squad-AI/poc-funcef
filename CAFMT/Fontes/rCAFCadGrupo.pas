unit rCAFCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport;

type
  TRptCAFCadGrupo = class(TFrmCmReport)
    qryCadGrupo: TwwQuery;
    qryCadGrupoCLASSE: TStringField;
    qryCadGrupoNOME: TStringField;
    qryCadGrupoTIPO: TStringField;
    qryCadGrupoDEPRECIACAO: TFloatField;
    qryCadGrupoFLGIMOVEL: TFloatField;
    qryCadGrupoIDGRUPO: TFloatField;
    qryCadGrupoCODCENTROCUSTO: TStringField;
    qryCadGrupoDESCCC: TStringField;
    dsCadGrupo: TwwDataSource;
    ppCadGrupo: TppBDEPipeline;
    rpCadGrupo: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel89: TppLabel;
    rpCadGrupoLabel1: TppLabel;
    rpCadGrupoLabel2: TppLabel;
    rpCadGrupoLabel3: TppLabel;
    rpCadGrupoLine1: TppLine;
    rpCadGrupoLabel4: TppLabel;
    rpCadGrupoLine2: TppLine;
    ppDetailBand13: TppDetailBand;
    rpCadGrupoDBText1: TppDBText;
    rpCadGrupoCODCENTROCUSTO: TppVariable;
    ppFooterBand13: TppFooterBand;
    ppLine21: TppLine;
    ppLabel90: TppLabel;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    rpCadGrupoGroup1: TppGroup;
    rpCadGrupoGroupHeaderBand1: TppGroupHeaderBand;
    rpCadGrupoDBText2: TppDBText;
    rpCadGrupoDBText3: TppDBText;
    rpCadGrupoLine3: TppLine;
    rpCadGrupoCODGRUPO: TppVariable;
    rpCadGrupoGroupFooterBand1: TppGroupFooterBand;
    rpCadGrupoLine4: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadGrupo: TRptCAFCadGrupo;

implementation

{$R *.DFM}

procedure TRptCAFCadGrupo.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   qryCadGrupo.Close;
   if (not CmpRptCM.ParamValues[0].IsNull) then
   begin
      qryCadGrupo.SQL.Strings[6] := ' (LTRIM(RTRIM(G.CLASSE)) = '+CmpRptCM.ParamValues[0].AsString + ') AND';
   end else
   begin
      qryCadGrupo.SQL.Strings[6] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (not CmpRptCM.ParamValues[1].IsNull) then
   begin
      qryCadGrupo.SQL.Strings[7] := ' (LTRIM(RTRIM(GXCC.CODCENTROCUSTO)) = '+CmpRptCM.ParamValues[1].AsString + ') AND';
   end else
   begin
      qryCadGrupo.SQL.Strings[7] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   qryCadGrupo.Open;
end;

procedure TRptCAFCadGrupo.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryCadGrupo.Active then
      qryCadGrupo.Close;
   qryCadGrupo.DataBaseName := sDataBaseName;
end;

end.
