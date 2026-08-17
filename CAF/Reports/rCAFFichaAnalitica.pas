unit rCAFFichaAnalitica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, IvDictio, IvMulti,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes, uCtrlParamCAF;

type
  TRptCAFFichaAnalitica = class(TFrmCmReport)
    rpFichaAnalitica: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    ppLine17: TppLine;
    LBLEMPRESA: TppLabel;
    rpBalPatGrpLabel1: TppLabel;
    rpBalPatGrpLabel2: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel5: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel7: TppLabel;
    rpBalPatGrpLabel8: TppLabel;
    rpBalPatGrpLabel9: TppLabel;
    rpBalPatGrpLabel10: TppLabel;
    ppDetailBand9: TppDetailBand;
    rpResumoSaldosGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppFichaAnalitica: TppBDEPipeline;
    dsFichaAnalitica: TwwDataSource;
    cdsFichaAnalitica: TCMClientDataSet;
    sqlFichaAnalitica: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    rpBalPatGrpDBText10: TppDBText;
    ppLabel1: TppLabel;
    lblMoedaSec: TppLabel;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    ppLabel2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
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
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraGrupo : String;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFFichaAnalitica: TRptCAFFichaAnalitica;

implementation

{$R *.DFM}

procedure TRptCAFFichaAnalitica.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   try
      ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
      //----------------------------------------------------------------------------------
      iMoedaOficial := ParamCAF.MOEDAOFICIAL;
      bInvestImob := copy(ParamCAF.SISTEMAS, 4, 1) = '1';
      sMascaraGrupo := trim(ParamCAF.MASCCODGRUPO) +';0; ';
      //----------------------------------------------------------------------------------
      CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
      CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO ' +
                                                         ' FROM GRUPO G, ' +
                                                         '      PLANOGRUPO PG ' +
                                                         ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND G.TIPO = ''A'' ' +
                                                         '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                         ' ORDER BY G.CLASSE ';
      CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC ' +
                                                         ' FROM CAFMOEDAS CM, ' +
                                                         '      MOEDA M ' +
                                                         ' WHERE CM.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CM.MOECODIGO = M.MOECODIGO ' +
                                                         ' ORDER BY CM.IDTIPOMOEDA, CM.MOECODIGO ';
      CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS ' +
                                                         ' FROM CAFPAISES CP, ' +
                                                         '      PAIS P ' +
                                                         ' WHERE CP.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CP.IDPAIS = P.IDPAIS ' +
                                                         ' ORDER BY P.NOMEPAIS ';
   finally
      ParamCAF.Free;
   end;
end;

function TRptCAFFichaAnalitica.DataUltFechamento : String;
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

procedure TRptCAFFichaAnalitica.CrmRptCMBeforePrint(Sender: TObject);
var
   nTotDiasDep : Extended;
   iMoedaGerencial, iPaisOrigem : Integer;

begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Aplica os Filtros
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlFichaAnalitica.SQL.Strings[34] := ' AND SCB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         sqlFichaAnalitica.SQL.Strings[63] := ' AND SCB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
      end else
      begin
         sqlFichaAnalitica.SQL.Strings[34] := ' ';
         sqlFichaAnalitica.SQL.Strings[63] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlFichaAnalitica.SQL.Strings[82] := ' ';
      end else
      begin
         sqlFichaAnalitica.SQL.Strings[82] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlFichaAnalitica.SQL.Strings[83] := ' ';
      end else
      begin
         sqlFichaAnalitica.SQL.Strings[83] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <= 0 then
         iMoedaGerencial := iMoedaOficial
      else
         iMoedaGerencial := CmpRptCM.ParamValues[2].AsInteger;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger <= 0 then
         iPaisOrigem := 1
      else
         iPaisOrigem := CmpRptCM.ParamValues[3].AsInteger;
      //----------------------------------------------------------------------------------
      sqlFichaAnalitica.Prepare;
      sqlFichaAnalitica.ParamByName('IDPESSOA').AsFloat     := CrmRptCM.IdEmpresa;
      sqlFichaAnalitica.ParamByName('DATASLD').AsDateTime   := CmpRptCM.ParamValues[0].AsDateTime;
      sqlFichaAnalitica.ParamByName('MOECODIGO').AsInteger  := iMoedaOficial;
      sqlFichaAnalitica.ParamByName('MOECODIGO2').AsInteger := iMoedaGerencial;
      sqlFichaAnalitica.ParamByName('IDTAXADEP').AsInteger  := iPaisOrigem;
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[4].AsInteger of
         0: begin
               sqlFichaAnalitica.ParamByName('PDEPREC').AsInteger    := 0;
               sqlFichaAnalitica.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlFichaAnalitica.ParamByName('PDEPREC').AsInteger    := 1;
               sqlFichaAnalitica.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlFichaAnalitica.ParamByName('PDEPREC').AsInteger    := 0;
               sqlFichaAnalitica.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
      else  begin
               sqlFichaAnalitica.ParamByName('PDEPREC').AsInteger    := 0;
               sqlFichaAnalitica.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlFichaAnalitica.Open;
      if cdsFichaAnalitica.IsEmpty then
         Raise Exception.Create('Não existem dados com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      // Preenche o campo DATAFIMDEP com a data da depreciação final
      //----------------------------------------------------------------------------------
      cdsFichaAnalitica.First;
      while not cdsFichaAnalitica.EOF do
      begin
         if cdsFichaAnalitica.FieldByName('TAXADEP').AsFloat <> 0 then
         begin
            nTotDiasDep := (100 / cdsFichaAnalitica.FieldByName('TAXADEP').AsFloat) * 365.25;
         end else
         begin
            nTotDiasDep := 0;
         end;
         //-------------------------------------------------------------------------------
         cdsFichaAnalitica.Edit;
         cdsFichaAnalitica.FieldByName('DATAFIMDEP').AsDateTime := strtodate(FormatDateTime(ShortDateFormat,cdsFichaAnalitica.FieldByName('DATAINICIODEP').AsDateTime + nTotDiasDep));
         cdsFichaAnalitica.Post;
         //-------------------------------------------------------------------------------
         cdsFichaAnalitica.Next;
      end;
      cdsFichaAnalitica.First;
      //----------------------------------------------------------------------------------
      sqlAux.SQL.Text := ' SELECT MOEDESC FROM MOEDA ' +
                         ' WHERE MOECODIGO = ' + inttostr(iMoedaGerencial);
      sqlAux.Open;
      lblMoedaSec.Caption := ' Moeda : ' + cdsAux.FieldByName('MOEDESC').AsString;
      cdsAux.Close;
      //----------------------------------------------------------------------------------
      rpResumoSaldosGrpDBTEXT1.DisplayFormat := sMascaraGrupo;
      rpBalPatGrpLabel10.Text := DateToStr(CmpRptCM.ParamValues[0].AsDateTime);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception do
      begin
         CMDebugToFile('FICHA ANALÍTICA PATRIMONIAL : ' + E.Message );
      end;
   end;
end;

end.

