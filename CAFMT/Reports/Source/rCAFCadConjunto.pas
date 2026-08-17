unit rCAFCadConjunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery;

type
  TRptCAFCadConjunto = class(TFrmCmReport)
    qryCadConj: TwwQuery;
    dsCadConj: TwwDataSource;
    ppCadConj: TppBDEPipeline;
    rpCadConj: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    rpCadConjLine2: TppLine;
    ppDetailBand5: TppDetailBand;
    rpCadConjDBText3: TppDBText;
    rpCadConjDBText4: TppDBText;
    rpCadConjDBText5: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine12: TppLine;
    ppLabel31: TppLabel;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    rpCadConjGroup1: TppGroup;
    rpCadConjGroupHeaderBand1: TppGroupHeaderBand;
    rpCadConjLabel1: TppLabel;
    rpCadConjLabel2: TppLabel;
    rpCadConjLabel3: TppLabel;
    ppDBText17: TppDBText;
    rpCadConjDBText1: TppDBText;
    rpCadConjDBText2: TppDBText;
    rpCadConjLine1: TppLine;
    rpCadConjLabel4: TppLabel;
    rpCadConjLabel6: TppLabel;
    rpCadConjDBText6: TppDBText;
    rpCadConjGroupFooterBand1: TppGroupFooterBand;
    ppLine11: TppLine;
    qryCadConjIDCONJUNTO: TFloatField;
    qryCadConjDESCCONJUNTO: TStringField;
    qryCadConjNOMELOCAL: TStringField;
    qryCadConjNOMERESP: TStringField;
    qryCadConjCODCENTROCUSTO: TStringField;
    qryCadConjDESCCENTROCUSTO: TStringField;
    qryCadConjPARTICIPACAO: TFloatField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadConjunto: TRptCAFCadConjunto;

implementation

{$R *.DFM}

procedure TRptCAFCadConjunto.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   qryCadConj.Close;
   if (not CmpRptCM.ParamValues[0].IsNull) then
   begin
      qryCadConj.SQL.Strings[8] := ' AND (C.IDLOCALIZACAO = '+CmpRptCM.ParamValues[0].AsString+')';
   end else
   begin
      qryCadConj.SQL.Strings[8] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (not CmpRptCM.ParamValues[1].IsNull) then
   begin
      qryCadConj.SQL.Strings[9] := ' AND (C.IDRESPONSAVEL = '+CmpRptCM.ParamValues[1].AsString+')';
   end else
   begin
      qryCadConj.SQL.Strings[9] := ' ';
   end;
   qryCadConj.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   //-------------------------------------------------------------------------------------
   qryCadConj.Open;
end;

procedure TRptCAFCadConjunto.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryCadConj.Active then
      qryCadConj.Close;
   qryCadConj.DataBaseName := sDataBaseName;
end;

end.
