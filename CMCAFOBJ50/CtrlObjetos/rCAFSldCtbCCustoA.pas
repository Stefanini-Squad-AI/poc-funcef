unit rCAFSldCtbCCustoA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uAtivoFixo,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet;

type
  TRptCAFSldCtbCCustoA = class(TFrmCmReport)
    rpSldCtbCCustoA: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    LBLEMPRESA: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel8: TppLabel;
    rpBalPatGrpLabel9: TppLabel;
    rpLabelDataMov: TppLabel;
    rpBalPatGrpLabel12: TppLabel;
    ppDetailBand9: TppDetailBand;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    rpBalPatGrpDBText9: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppSldCtbCCustoA: TppBDEPipeline;
    dsSldCtbCCustoA: TwwDataSource;
    cdsSldCtbCCustoA: TCMClientDataSet;
    sqlSldCtbCCustoA: TCMSqlParams;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    LBLSISTEMA: TppLabel;
    qryAux: TwwQuery;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    function DataUltFechamento : String;

  public
    iGrupoIni      : Integer;
    sMascaraGrupo,
    sMascaraCC     : String;
    bInvestImob    : Boolean;
  end;

var
  RptCAFSldCtbCCustoA: TRptCAFSldCtbCCustoA;

implementation

{$R *.DFM}

procedure TRptCAFSldCtbCCustoA.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux             : Integer;
   iDia, iMes, iAno : Word;

begin
   Application.ProcessMessages;
   try
      inherited;
      sqlParamCaf.Prepare;
      sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlParamCaf.Open;
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraGrupo := sMascaraGrupo + ';0; ';
      //----------------------------------------------------------------------------------
      sMascaraCC := cdsParamCaf.FieldByName('MASCARACC').AsString;
      iAux := 1;
      while iAux <= length(sMascaraCC) do
      begin
         if sMascaraCC[iAux] = '9' then
            sMascaraCC[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraCC := sMascaraCC + ';0; ';
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsString <> '' then
      begin
         sqlSldCtbCCustoA.SQL.Strings[41] := ' AND (LTRIM(RTRIM(L.CODCENTROCUSTO)) = '+#39+CmpRptCM.ParamValues[1].AsString+#39+') ';
      end else
      begin
         sqlSldCtbCCustoA.SQL.Strings[41] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlSldCtbCCustoA.SQL.Strings[42] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+') ';
      end else
      begin
         sqlSldCtbCCustoA.SQL.Strings[42] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlSldCtbCCustoA.SQL.Strings[43] := ' AND (G.FLGIMOVEL = 0) ';
         rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlSldCtbCCustoA.SQL.Strings[43] := ' AND (G.FLGIMOVEL = 1) ';
         rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlSldCtbCCustoA.SQL.Strings[43] := ' ';
         rpBalPatGrpLabel12.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlSldCtbCCustoA.SQL.Strings[44] := ' ';
      end else
      begin
         sqlSldCtbCCustoA.SQL.Strings[44] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlSldCtbCCustoA.SQL.Strings[45] := ' ';
      end else
      begin
         sqlSldCtbCCustoA.SQL.Strings[45] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsInteger = 1 then
         sqlSldCtbCCustoA.SQL.Strings[47] := ' AND (B.TAXADEP = 0)'
      else
         sqlSldCtbCCustoA.SQL.Strings[47] := ' ';
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      sqlSldCtbCCustoA.Prepare;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[6].AsInteger of
         0: begin
               sqlSldCtbCCustoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbCCustoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlSldCtbCCustoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbCCustoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlSldCtbCCustoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbCCustoA.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlSldCtbCCustoA.ParamByName('PDEPREC').AsInteger    := 1;
               sqlSldCtbCCustoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlSldCtbCCustoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbCCustoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlSldCtbCCustoA.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlSldCtbCCustoA.ParamByName('PDATASLD').AsDate   := CmpRptCM.ParamValues[0].AsDateTime;
      sqlSldCtbCCustoA.Open;
      //----------------------------------------------------------------------------------
      if cdsSldCtbCCustoA.IsEmpty then
         Raise Exception.Create('Não existem dados para processar com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      ppDBTEXT2.DisplayFormat := sMascaraCC;
      ppDBTEXT4.DisplayFormat := sMascaraGrupo;
      rpLabelDataMov.Text := CmpRptCM.ParamValues[0].AsString;
   except
      on E : Exception do
      begin
         CMDebugToFile('Erro no Relatório SALDO CONTÁBIL POR CENTRO DE CUSTO - ANALÍTICO!' + #13 + #10 +
                       'Causa : ' + E.Message);
      end;
   end;

end;

procedure TRptCAFSldCtbCCustoA.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE (PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) + ') ' +
                                                      '   AND (G.TIPO = ''A'') ' +
                                                      '   AND (PG.IDGRUPO = G.IDGRUPO) ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO, NOME '+
                                                      ' FROM CENTCUST '+
                                                      ' WHERE (STATUSGRUPOCDC = ''A'') '+
                                                      '   AND (IDEMPRESA = ' + floattostr(CrmRptCM.IdEmpresa) + ') ' +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
end;

Function TRptCAFSldCtbCCustoA.DataUltFechamento : String;
var
   iGrupoDeprec,
   iGrupoDepIni,
   iGrupoDepFim : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if CrmRptCM.IdModulo = 7 then
   begin
      if not bInvestImob then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   sqlVerUltFec.Prepare;
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat       := CrmRptCM.IdEmpresa;
   sqlVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   sqlVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   sqlVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not cdsVerUltFec.IsEmpty then
      Result := DateToStr(cdsVerUltFec.FieldByName('DATAULT').AsDateTime)
   else
      Result := '';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

end.
