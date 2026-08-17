unit rCAFCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, IvDictio,
  IvMulti, DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCMfileUtils ;

type
  TRptCAFCadGrupo = class(TFrmCmReport)
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
    sqlCadGrupo: TCMSqlParams;
    cdsCadGrupo: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpCadGrupoCODGRUPOPrint(Sender: TObject);
    procedure rpCadGrupoCODCENTROCUSTOPrint(Sender: TObject);
    procedure ppDetailBand13BeforePrint(Sender: TObject);
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
var
   sMascara : String;
begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Captura as Mascaras
      //----------------------------------------------------------------------------------
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         sMascara := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString) + ';0; ';
         rpCadGrupoCODGRUPO.DisplayFormat := sMascara;
         //-------------------------------------------------------------------------------
         sMascara := trim(cdsParamCaf.FieldByName('MASCARACC').AsString) + ';0; ';
         rpCadGrupoCODCENTROCUSTO.DisplayFormat := sMascara;
      end;
      //----------------------------------------------------------------------------------
      cdsCadGrupo.Close;
      if not CmpRptCM.ParamValues[0].IsNull then
      begin
         sqlCadGrupo.SQL.Strings[7] := ' AND LTRIM(RTRIM(G.CLASSE)) = '+CmpRptCM.ParamValues[0].AsString;
      end else
      begin
         sqlCadGrupo.SQL.Strings[7] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[1].IsNull then
      begin
         sqlCadGrupo.SQL.Strings[8] := ' AND LTRIM(RTRIM(GXCC.CODCENTROCUSTO)) = '+CmpRptCM.ParamValues[1].AsString;
      end else
      begin
         sqlCadGrupo.SQL.Strings[8] := ' ';
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlCadGrupo.Prepare;
      sqlCadGrupo.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlCadGrupo.Open;
      Screen.Cursor := crDefault;
  except
     on E : Exception Do
     begin
        CMDebugToFile('CADASTRO DE GRUPOS : ' + E.Message);
     end;
  end;
end;

procedure TRptCAFCadGrupo.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO,NOME ' +
                                                      ' FROM CENTCUST '+
                                                      ' WHERE STATUSGRUPOCDC = ''A'' '+
                                                      '   AND ATIVO = ''S'' '+
                                                      '   AND IDEMPRESA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY CODCENTROCUSTO ';
end;

procedure TRptCAFCadGrupo.rpCadGrupoCODGRUPOPrint(Sender: TObject);
begin
   inherited;
   rpCadGrupoCODGRUPO.Text := cdsCadGrupo.FieldByName('CLASSE').AsString;
   if cdsCadGrupo.FieldByName('TIPO').AsString = 'S' then
   begin
      rpCadGrupoCODGRUPO.Font.Style := [fsBold];
      rpCadGrupoDBText2.Font.Style  := [fsBold];
      rpCadGrupoDBText3.Font.Style  := [fsBold];
   end else
   begin
      rpCadGrupoCODGRUPO.Font.Style := [];
      rpCadGrupoDBText2.Font.Style  := [];
      rpCadGrupoDBText3.Font.Style  := [];
   end;
end;

procedure TRptCAFCadGrupo.rpCadGrupoCODCENTROCUSTOPrint(Sender: TObject);
begin
   inherited;
   rpCadGrupoCODCENTROCUSTO.Text := cdsCadGrupo.FieldByName('CODCENTROCUSTO').AsString;
end;

procedure TRptCAFCadGrupo.ppDetailBand13BeforePrint(Sender: TObject);
begin
   inherited;
   ppDetailBand13.Visible  := not cdsCadGrupo.FieldByName('DESCCC').IsNull;
   rpCadGrupoLine4.Visible := not cdsCadGrupo.FieldByName('DESCCC').IsNull;
end;

end.
