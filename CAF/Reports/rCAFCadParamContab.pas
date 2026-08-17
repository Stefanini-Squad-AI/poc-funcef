unit rCAFCadParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppProd,
  ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE, ppBands, ppVar, ppCtrls,
  ppPrnabl, ppComm, ppRelatv, ppCache, DB, Wwdatsrc, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCMfileUtils, IvDictio,
  IvMulti, DBTables, Wwquery;

type
  TRptCAFCadParamContab = class(TFrmCmReport)
    dsParamContab: TwwDataSource;
    ppParamContab: TppBDEPipeline;
    rpParamContab: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel85: TppLabel;
    ppLabel87: TppLabel;
    rpCtaMovGrpPlanoConta: TppLabel;
    ppDetailBand12: TppDetailBand;
    rpCtaMovGrpDBText4: TppDBText;
    rpCtaMovGrpDBText5: TppDBText;
    rpCtaMovGrpDBText6: TppDBText;
    rpCtaMovGrpDBText7: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine23: TppLine;
    ppLabel88: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    rpCtaMovGrpGroup2: TppGroup;
    rpCtaMovGrpGroupHeaderBand2: TppGroupHeaderBand;
    rpCtaMovGrpLabel1: TppLabel;
    rpCtaMovGrpDBText2: TppDBText;
    rpCtaMovGrpDBText1: TppDBText;
    rpCtaMovGrpLine2: TppLine;
    rpCtaMovGrpLine1: TppLine;
    rpCtaMovGrpGroupFooterBand2: TppGroupFooterBand;
    rpCtaMovGrpGroup1: TppGroup;
    rpCtaMovGrpGroupHeaderBand1: TppGroupHeaderBand;
    rpCtaMovGrpLabel2: TppLabel;
    rpCtaMovGrpDBText3: TppDBText;
    rpCtaMovGrpLabel3: TppLabel;
    rpCtaMovGrpLabel5: TppLabel;
    rpCtaMovGrpLabel4: TppLabel;
    ppLabel4: TppLabel;
    rpCtaMovGrpGroupFooterBand1: TppGroupFooterBand;
    sqlParamContab: TCMSqlParams;
    cdsParamContab: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    qryParamContab: TwwQuery;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadParamContab: TRptCAFCadParamContab;

implementation

{$R *.dfm}

procedure TRptCAFCadParamContab.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TRptCAFCadParamContab.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux, iPlano   : Integer;
   sMascaraGrupo,
   sMascaraCCusto,
   sMascaraPlano  : String;

begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Captura as Mascaras
      //----------------------------------------------------------------------------------
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         iPlano := cdsParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
         //-------------------------------------------------------------------------------
         sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString);
         iAux := 1;
         while iAux <= length(sMascaraGrupo) do
         begin
            if sMascaraGrupo[iAux] = '9' then
               sMascaraGrupo[iAux] := '#';
            iAux := iAux + 1;
         end;
         sMascaraGrupo := sMascaraGrupo + ';0; ';
         //-------------------------------------------------------------------------------
         sMascaraCCusto := trim(cdsParamCAF.FieldByName('MASCARACC').AsString);
         iAux := 1;
         while iAux <= length(sMascaraCCusto) do
         begin
            if sMascaraCCusto[iAux] = '9' then
               sMascaraCCusto[iAux] := '0';
            iAux := iAux + 1;
         end;
         sMascaraCCusto := sMascaraCCusto + ';0; ';
      end;
      //----------------------------------------------------------------------------------
      cdsPlano.Close;
      sqlPlano.Prepare;
      sqlPlano.ParamByName('PPLANO').AsInteger := iPlano;
      sqlPlano.Open;
      sMascaraPlano := trim(cdsPlano.FieldByName('MASCARA').AsString);
      iAux := 1;
      while iAux <= length(sMascaraPlano) do
      begin
         if sMascaraPlano[iAux] = '9' then
            sMascaraPlano[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraPlano := sMascaraPlano + ';0; ';
      //----------------------------------------------------------------------------------
      rpCtaMovGrpDBText2.DisplayFormat := sMascaraGrupo;
      rpCtaMovGrpDBText4.DisplayFormat := sMascaraPlano;
      rpCtaMovGrpDBText7.DisplayFormat := sMascaraCCusto;
      rpCtaMovGrpPlanoConta.Caption := 'Plano de Conta ' + trim(inttostr(iPlano)) + ' - ' +
                                       cdsPlano.FieldByName('DESCPLANO').AsString;
      //----------------------------------------------------------------------------------
      // Processa os Filtros
      //----------------------------------------------------------------------------------
      cdsParamContab.Close;
      with sqlParamContab do
      begin
         if CmpRptCM.ParamByName('GRUPO').AsInteger <> 0 then
         begin
            SQL.Strings[11] := '   AND TMG.IDGRUPO = ' + inttostr(CmpRptCM.ParamByName('GRUPO').AsInteger);
         end else
         begin
            SQL.Strings[11] := ' ';
         end;
         if CmpRptCM.ParamByName('TIPOMOV').AsInteger <> 0 then
         begin
            SQL.Strings[12] := '   AND TMG.IDTIPOMOVIMENTACAO = ' + inttostr(CmpRptCM.ParamByName('TIPOMOV').AsInteger);
         end else
         begin
            SQL.Strings[12] := ' ';
         end;
         //-------------------------------------------------------------------------------
         Prepare;
         ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlParamContab.Open;
      Screen.Cursor := crDefault;
  except
     On E : Exception Do
     begin
        CMDebugToFile('CADASTRO DA PARAMETRIZAÇÃO CONTÁBIL : ' + E.Message);
     end;
  end;
end;

end.
