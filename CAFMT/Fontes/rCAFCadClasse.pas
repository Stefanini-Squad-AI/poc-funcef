unit rCAFCadClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, ppProd, ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE,
  Wwdatsrc, ppBands, ppVar, ppCtrls, ppPrnabl, ppComm, ppRelatv, ppCache,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport;

type
  TRptCAFCadClasse = class(TFrmCmReport)
    rpCadClasse: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel32: TppLabel;
    ppLine30: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLine31: TppLine;
    rpCadClasseLabel1: TppLabel;
    ppDetailBand6: TppDetailBand;
    rpCadClasseDBText1: TppDBText;
    rpCadClasseCODGRUPO: TppVariable;
    ppFooterBand6: TppFooterBand;
    ppLine32: TppLine;
    ppLabel37: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    rpCadClasseGroup1: TppGroup;
    rpCadClasseGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    rpCadClasseLine1: TppLine;
    rpCadClasseCODCLASSE: TppVariable;
    rpCadClasseGroupFooterBand1: TppGroupFooterBand;
    rpCadClasseLine2: TppLine;
    ppCadClasse: TppBDEPipeline;
    dsCadClasse: TwwDataSource;
    qryCadClasse: TwwQuery;
    qryParamCaf: TwwQuery;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafNUMDIASANO: TFloatField;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafALUGUELINTERNO: TFloatField;
    qryParamCafGERARREQMAT: TFloatField;
    qryParamCafDATAULTDEP: TDateTimeField;
    qryParamCafDATARECALCDEP: TDateTimeField;
    qryParamCafDTAULTALUG: TDateTimeField;
    qryParamCafSEQBEMEMP: TFloatField;
    qryParamCafEDITACODBEM: TFloatField;
    qryParamCafEDITACODGRUPO: TFloatField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafDATAINICIAL: TDateTimeField;
    qryParamCafULTTXTCONTAB: TDateTimeField;
    qryParamCafFLGCALCCM: TFloatField;
    qryParamCafFLGTIPOCALC: TStringField;
    qryParamCafMASCARACLASSE: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamCafINTEGRACAP: TStringField;
    qryParamCafINTEGRACAR: TStringField;
    qryParamCafPLANOVIGENTE: TFloatField;
    qryParamCafFLGREAVAL: TStringField;
    qryParamCafTIPOPERCTB: TStringField;
    qryParamCafFLGREMOVEPLANCTB: TStringField;
    qryParamCafATIVPROJETO: TFloatField;
    qryParamCafPROXIMAPLACA: TFloatField;
    qryParamCafFLGCLSDESBEM: TFloatField;
    qryParamCafDIGMASCPLACA: TFloatField;
    qryParamCafPATROPADRAO: TFloatField;
    qryParamCafPLANPREVPADRAO: TFloatField;
    qryCadClasseCLASSE: TStringField;
    qryCadClasseNOME: TStringField;
    qryCadClasseTIPO: TStringField;
    qryCadClasseCODGRUPO: TStringField;
    qryCadClasseDESCGRUPO: TStringField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadClasse: TRptCAFCadClasse;

implementation

{$R *.DFM}

procedure TRptCAFCadClasse.CrmRptCMBeforePrint(Sender: TObject);
var
   sMascaraClasse, sMascaraGrupo : String;
   iAux : Integer;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Inicializa os parâmetros
   //-------------------------------------------------------------------------------------
   with qryParamCaf do
   begin
      ParamByName('PIDPESSOA').AsFloat := crmRptCM.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      sMascaraGrupo  := FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      //----------------------------------------------------------------------------------
      sMascaraClasse := FieldByName('MASCARACLASSE').AsString;
      iAux := 1;
      while iAux <= length(sMascaraClasse) do
      begin
         if sMascaraClasse[iAux] = '9' then
            sMascaraClasse[iAux] := '#';
         iAux := iAux + 1;
      end;
      //----------------------------------------------------------------------------------
      Close;
   end;
   //-------------------------------------------------------------------------------------
   // Processa os parâmetros e prepara a querie
   //-------------------------------------------------------------------------------------
   with qryCadClasse do
   begin
      Close;
      if (CmpRptCM.ParamValues[0].IsNull) and (CmpRptCM.ParamValues[1].IsNull) then
         SQL.Strings[11] := ' '
      else
      if (not CmpRptCM.ParamValues[0].IsNull) and (CmpRptCM.ParamValues[1].IsNull) then
         SQL.Strings[11] := ' AND (LTRIM(RTRIM(CB.CLASSE)) = ' + CmpRptCM.ParamValues[0].AsString + ')'
      else
      if (CmpRptCM.ParamValues[0].IsNull) and (not CmpRptCM.ParamValues[1].IsNull) then
         SQL.Strings[11] := ' AND (LTRIM(RTRIM(CB.CLASSE)) = ' + CmpRptCM.ParamValues[1].AsString + ')'
      else
         SQL.Strings[11] := ' AND (LTRIM(RTRIM(CB.CLASSE)) >= ' + CmpRptCM.ParamValues[0].AsString + ') ' +
                            ' AND (LTRIM(RTRIM(CB.CLASSE)) <= ' + CmpRptCM.ParamValues[1].AsString + ')';
      //----------------------------------------------------------------------------------
      rpCadClasseCODCLASSE.DisplayFormat := sMascaraClasse;
      rpCadClasseCODGRUPO.DisplayFormat  := sMascaraGrupo;
      Open;
   end;
end;
//========================================================================================
procedure TRptCAFCadClasse.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryCadClasse.Active then
      qryCadClasse.Close;
   qryCadClasse.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryParamCAF.Active then
      qryParamCAF.Close;
   qryParamCAF.DataBaseName := sDataBaseName;
end;

procedure TRptCAFCadClasse.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].AsString := '';
   CmpRptCM.ParamValues[1].AsString := '';
end;

end.
