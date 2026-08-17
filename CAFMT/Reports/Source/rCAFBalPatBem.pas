unit rCAFBalPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport;

type
  TRptCAFBalPatBem = class(TFrmCmReport)
    qryBalPatBem: TwwQuery;
    qryBalPatBemIDBEM: TFloatField;
    qryBalPatBemPLACA: TFloatField;
    qryBalPatBemNOME: TStringField;
    qryBalPatBemDESBEM: TStringField;
    qryBalPatBemDTAINCLUSAO: TDateTimeField;
    qryBalPatBemTAXADEP: TFloatField;
    qryBalPatBemDATAULTDEP: TDateTimeField;
    qryBalPatBemVALHISTORICO: TFloatField;
    qryBalPatBemFLGDEPREC: TFloatField;
    qryBalPatBemDESCCONJUNTO: TStringField;
    qryBalPatBemVALORG0: TFloatField;
    qryBalPatBemCMBEM0: TFloatField;
    qryBalPatBemDEPLANC0: TFloatField;
    qryBalPatBemDEPLANCATU0: TFloatField;
    qryBalPatBemCMDEP0: TFloatField;
    qryBalPatBemVALCTB0: TFloatField;
    qryBalPatBemNOMEFORN: TStringField;
    qryBalPatBemIDNOTA: TStringField;
    qryBalPatBemCOMPLNOTA: TStringField;
    dsBalPatBem: TwwDataSource;
    ppBalPatBem: TppBDEPipeline;
    qryParamCaf: TwwQuery;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    rpBalPatBem: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel60: TppLabel;
    ppLine13: TppLine;
    LblEmpresa: TppLabel;
    rpBalPatBemLabel2: TppLabel;
    rpBalPatBemLabel3: TppLabel;
    ppDetailBand7: TppDetailBand;
    rpBemResumLabel2: TppLabel;
    rpBemResumLabel3: TppLabel;
    rpBemResumLabel4: TppLabel;
    rpBemResumLabel5: TppLabel;
    rpBemResumLabel6: TppLabel;
    rpBemResumLabel7: TppLabel;
    rpBemResumLabel8: TppLabel;
    rpBemResumLabel9: TppLabel;
    rpBemResumLabel10: TppLabel;
    rpBemResumLabel11: TppLabel;
    rpBemResumLabel12: TppLabel;
    rpBemResumDBText2: TppDBText;
    rpBemResumDBText4: TppDBText;
    rpBemResumDBText5: TppDBText;
    rpBemResumDBText6: TppDBText;
    rpBemResumDBText7: TppDBText;
    rpBemResumDBText8: TppDBText;
    rpBemResumDBText9: TppDBText;
    rpBemResumDBText10: TppDBText;
    rpBemResumDBText11: TppDBText;
    rpBemResumDBText12: TppDBText;
    rpBemResumDBText3: TppDBText;
    rpBemResumLine1: TppLine;
    rpBemResumLabel27: TppLabel;
    rpBemResumDBText14: TppDBText;
    rpBemResumLabel28: TppLabel;
    rpBalPatBemLabel1: TppLabel;
    rpBalPatBemDBText1: TppDBText;
    rpBalPatBemLabel4: TppLabel;
    rpBalPatBemDBText2: TppDBText;
    rpBalPatBemLabel5: TppLabel;
    rpBalPatBemDBText3: TppDBText;
    rpBalPatBemDBText4: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    LblSistema: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    rpBemResumSummaryBand1: TppSummaryBand;
    rpBemResumLabel20: TppLabel;
    rpBemResumLabel21: TppLabel;
    rpBemResumLabel22: TppLabel;
    rpBemResumLabel23: TppLabel;
    rpBemResumDBCalc7: TppDBCalc;
    rpBemResumDBCalc8: TppDBCalc;
    rpBemResumDBCalc9: TppDBCalc;
    rpBemResumLabel24: TppLabel;
    rpBemResumLabel25: TppLabel;
    rpBemResumLabel26: TppLabel;
    rpBemResumDBCalc10: TppDBCalc;
    rpBemResumDBCalc11: TppDBCalc;
    rpBemResumDBCalc12: TppDBCalc;
    rpBemResumLine4: TppLine;
    rpBemResumGroup1: TppGroup;
    rpBemResumGroupHeaderBand1: TppGroupHeaderBand;
    rpBemResumLabel1: TppLabel;
    rpBemResumDBText1: TppDBText;
    rpBemResumLine2: TppLine;
    rpBemResumGroupFooterBand1: TppGroupFooterBand;
    rpBemResumLabel13: TppLabel;
    rpBemResumDBText13: TppDBText;
    rpBemResumDBCalc1: TppDBCalc;
    rpBemResumDBCalc2: TppDBCalc;
    rpBemResumDBCalc3: TppDBCalc;
    rpBemResumDBCalc4: TppDBCalc;
    rpBemResumDBCalc5: TppDBCalc;
    rpBemResumDBCalc6: TppDBCalc;
    rpBemResumLabel14: TppLabel;
    rpBemResumLabel15: TppLabel;
    rpBemResumLabel16: TppLabel;
    rpBemResumLabel17: TppLabel;
    rpBemResumLabel18: TppLabel;
    rpBemResumLabel19: TppLabel;
    rpBemResumLine3: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFBalPatBem: TRptCAFBalPatBem;

implementation

{$R *.DFM}

procedure TRptCAFBalPatBem.CrmRptCMBeforePrint(Sender: TObject);
var
   sMascaraGrupo : String;
   iAux          : Integer;
begin
   inherited;
   qryBalPatBem.Close;
   //-------------------------------------------------------------------------------------
   // Inicializa os parâmetros
   //-------------------------------------------------------------------------------------
   qryParamCaf.ParamByName('PIDPESSOA').AsFloat := crmRptCM.IdEmpresa;
   qryParamCaf.Open;
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   qryParamCAF.Close;
   //-------------------------------------------------------------------------------------
   // Processa os parâmetros e prepara a querie
   //-------------------------------------------------------------------------------------
   qryBalPatBem.ParamByName('PDATAMOV').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
   //-------------------------------------------------------------------------------------
   if (Not CmpRptCM.ParamValues[1].IsNull) then
   begin
      qryBalPatBem.SQL.Strings[280] := 'AND (B.IDGRUPO = '+CmpRptCM.ParamValues[1].AsString+')';
   end else
   begin
      qryBalPatBem.SQL.Strings[280] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   case CmpRptCM.ParamValues[2].AsInteger of
      0: begin
            qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
            qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
         end;
      1: begin
            qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 1;
            qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
         end;
      2: begin
            qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
            qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 0;
         end;
   else  begin
            qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
            qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
         end;
   end;
   //-------------------------------------------------------------------------------------
   if (CmpRptCM.ParamValues[3].AsBoolean) then
   begin
      qryBalPatBem.SQL.Strings[282] := ' ';
   end else
   begin
      qryBalPatBem.SQL.Strings[282] := ' AND (B.CONTROLE = ''T'') ';
   end;
   //----------------------------------------------------------------------------------
   if (CmpRptCM.ParamValues[4].AsBoolean) then
   begin
      qryBalPatBem.SQL.Strings[283] := ' AND ((B.BAIXATOTAL <> ''S'') OR (B.BAIXATOTAL IS NULL)) ';
   end else
   begin
      qryBalPatBem.SQL.Strings[283] := ' ';
   end;
   //----------------------------------------------------------------------------------
   qryBalPatBem.Open;
   Screen.Cursor := crDefault;
   rpBalPatBemLabel3.Text := CmpRptCM.ParamValues[0].AsString;
end;

procedure TRptCAFBalPatBem.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryBalPatBem.Active then
      qryBalPatBem.Close;
   qryBalPatBem.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryParamCAF.Active then
      qryParamCAF.Close;
   qryParamCAF.DataBaseName := sDataBaseName;
end;

end.
