unit rCAFCadClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, ppProd, ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE, uCMfileUtils,
  Wwdatsrc, ppBands, ppVar, ppCtrls, ppPrnabl, ppComm, ppRelatv, ppCache,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlPadroes, IvDictio, IvMulti;

type
  TRptCAFCadClasse = class(TFrmCmReport)
    rpCadClasse: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel32: TppLabel;
    ppLine30: TppLine;
    LblEmpresa: TppLabel;
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
    LBLSISTEMA: TppLabel;
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
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    sqlCadClasse: TCMSqlParams;
    cdsCadClasse: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpCadClasseCODGRUPOPrint(Sender: TObject);
    procedure rpCadClasseCODCLASSEPrint(Sender: TObject);
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
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := crmRptCM.IdEmpresa;
   sqlParamCaf.Open;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString);
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '0';
      iAux := iAux + 1;
   end;
   //-------------------------------------------------------------------------------------
   sMascaraClasse := trim(cdsParamCaf.FieldByName('MASCARACLASSE').AsString);
   iAux := 1;
   while iAux <= length(sMascaraClasse) do
   begin
      if sMascaraClasse[iAux] = '9' then
         sMascaraClasse[iAux] := '0';
      iAux := iAux + 1;
   end;
   //-------------------------------------------------------------------------------------
   // Processa os parâmetros e prepara a querie
   //-------------------------------------------------------------------------------------
   with sqlCadClasse do
   begin
      Close;
      if (CmpRptCM.ParamValues[0].IsNull) and (CmpRptCM.ParamValues[1].IsNull) then
      begin
         SQL.Strings[11] := ' ';
      end else
      if (not CmpRptCM.ParamValues[0].IsNull) and (CmpRptCM.ParamValues[1].IsNull) then
      begin
         SQL.Strings[11] := ' LTRIM(RTRIM(CB.CLASSE)) = ' + CmpRptCM.ParamValues[0].AsString + ' AND ';
      end else
      if (CmpRptCM.ParamValues[0].IsNull) and (not CmpRptCM.ParamValues[1].IsNull) then
      begin
         SQL.Strings[11] := ' LTRIM(RTRIM(CB.CLASSE)) = ' + CmpRptCM.ParamValues[1].AsString + ' AND ';
      end else
      begin
         SQL.Strings[11] := ' LTRIM(RTRIM(CB.CLASSE)) >= ' + CmpRptCM.ParamValues[0].AsString + ' AND ' +
                            ' LTRIM(RTRIM(CB.CLASSE)) <= ' + CmpRptCM.ParamValues[1].AsString + ' AND ' ;
      end;
      //----------------------------------------------------------------------------------
      rpCadClasseCODCLASSE.DisplayFormat := sMascaraClasse + ';0; ';
      rpCadClasseCODGRUPO.DisplayFormat  := sMascaraGrupo  + ';0; ';
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      Open;
      Screen.Cursor := crDefault;
   end;
end;
//========================================================================================
procedure TRptCAFCadClasse.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].AsString := '';
   CmpRptCM.ParamValues[1].AsString := '';
end;

procedure TRptCAFCadClasse.rpCadClasseCODGRUPOPrint(Sender: TObject);
begin
   inherited;
   if not cdsCadClasse.FieldByName('CODGRUPO').IsNull then
      rpCadClasseCODGRUPO.Text := trim(cdsCadClasse.FieldByName('CODGRUPO').AsString);
end;

procedure TRptCAFCadClasse.rpCadClasseCODCLASSEPrint(Sender: TObject);
begin
   inherited;
   rpCadClasseCODCLASSE.Text := trim(cdsCadClasse.FieldByName('CLASSE').AsString);
   if cdsCadClasse.FieldByName('TIPO').AsString = 'S' then
   begin
      rpCadClasseCODCLASSE.Font.Style := [fsBold];
      ppDBText20.Font.Style := [fsBold];
      ppDBText21.Font.Style := [fsBold];
   end else
   begin
      rpCadClasseCODCLASSE.Font.Style := [];
      ppDBText20.Font.Style := [];
      ppDBText21.Font.Style := [];
   end;
end;

end.
