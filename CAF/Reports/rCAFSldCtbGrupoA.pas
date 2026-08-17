unit rCAFSldCtbGrupoA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, IvDictio, IvMulti;

type
  TRptCAFSldCtbGrupoA = class(TFrmCmReport)
    rpSldCtbGrupoA: TppReport;
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
    ppSldCtbGrupoA: TppBDEPipeline;
    dsSldCtbGrupoA: TwwDataSource;
    cdsSldCtbGrupoA: TCMClientDataSet;
    sqlSldCtbGrupoA: TCMSqlParams;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    LBLSISTEMA: TppLabel;
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
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
    iMoedaOficial  : Integer;
    sMascaraGrupo,
    sMascaraCC     : String;
    bInvestImob    : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFSldCtbGrupoA: TRptCAFSldCtbGrupoA;

implementation

{$R *.DFM}

procedure TRptCAFSldCtbGrupoA.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAux : Integer;

begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   sqlParamCaf.Open;
   bInvestImob   := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   sMascaraCC := cdsParamCaf.FieldByName('MASCARACC').AsString;
   iAux := 1;
   while iAux <= length(sMascaraCC) do
   begin
      if sMascaraCC[iAux] = '9' then
         sMascaraCC[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraCC := sMascaraCC + ';0; ';
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO, NOME '+
                                                      ' FROM CENTCUST '+
                                                      ' WHERE STATUSGRUPOCDC = ''A'' '+
                                                      '   AND IDEMPRESA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
end;

Function TRptCAFSldCtbGrupoA.DataUltFechamento : String;
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

procedure TRptCAFSldCtbGrupoA.CrmRptCMBeforePrint(Sender: TObject);
var
   iDia, iMes, iAno : Word;

begin
   Application.ProcessMessages;
   try
      inherited;
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlSldCtbGrupoA.SQL.Strings[61] := ' AND SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
      end else
      begin
         sqlSldCtbGrupoA.SQL.Strings[61] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsString <> '' then
      begin
         sqlSldCtbGrupoA.SQL.Strings[62] := ' AND LTRIM(RTRIM(L.CODCENTROCUSTO)) = ' + #39 + CmpRptCM.ParamValues[2].AsString + #39 ;
      end else
      begin
         sqlSldCtbGrupoA.SQL.Strings[62] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlSldCtbGrupoA.SQL.Strings[63] := ' AND G.FLGIMOVEL = 0 ';
         rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlSldCtbGrupoA.SQL.Strings[63] := ' AND G.FLGIMOVEL = 1 ';
         rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlSldCtbGrupoA.SQL.Strings[63] := ' ';
         rpBalPatGrpLabel12.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlSldCtbGrupoA.SQL.Strings[64] := ' ';
      end else
      begin
         sqlSldCtbGrupoA.SQL.Strings[64] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlSldCtbGrupoA.SQL.Strings[65] := ' ';
      end else
      begin
         sqlSldCtbGrupoA.SQL.Strings[65] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsInteger = 1 then
      begin
         sqlSldCtbGrupoA.SQL.Strings[66] := ' AND B.TAXADEP = 0 ';
      end else
      begin
         sqlSldCtbGrupoA.SQL.Strings[66] := ' ';
      end;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      sqlSldCtbGrupoA.Prepare;
      case CmpRptCM.ParamValues[6].AsInteger of
         0: begin
               sqlSldCtbGrupoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbGrupoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlSldCtbGrupoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbGrupoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlSldCtbGrupoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbGrupoA.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlSldCtbGrupoA.ParamByName('PDEPREC').AsInteger    := 1;
               sqlSldCtbGrupoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlSldCtbGrupoA.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSldCtbGrupoA.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      Self.Cursor := crSQLWait;
      sqlSldCtbGrupoA.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlSldCtbGrupoA.ParamByName('DATASLD').AsDate   := CmpRptCM.ParamValues[0].AsDateTime;
      sqlSldCtbGrupoA.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlSldCtbGrupoA.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlSldCtbGrupoA.Open;
      Self.Cursor := crDefault;
      //----------------------------------------------------------------------------------
      if cdsSldCtbGrupoA.IsEmpty then
         Raise Exception.Create('Não existem dados para processar com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      ppDBTEXT2.DisplayFormat := sMascaraCC;
      ppDBTEXT4.DisplayFormat := sMascaraGrupo;
      rpLabelDataMov.Text := CmpRptCM.ParamValues[0].AsString;
   except
      on E : Exception do
      begin
         Self.Cursor := crDefault;
         CMDebugToFile('SALDO CONTÁBIL POR GRUPO - ANALÍTICO!' + #13 + #10 + E.Message);
      end;
   end;
end;


end.
