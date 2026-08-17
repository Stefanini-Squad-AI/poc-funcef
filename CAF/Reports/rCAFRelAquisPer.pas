unit rCAFRelAquisPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, IvDictio, IvMulti,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uCMfileUtils,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlPadroes, uCtrlParamCAF;

type
  TRptCAFRelAquisPer = class(TFrmCmReport)
    cdsRelAquisPer: TCMClientDataSet;
    sqlRelAquisPer: TCMSqlParams;
    dsRelAquisPer: TwwDataSource;
    ppRelAquisPer: TppBDEPipeline;
    rpRelAquisPer: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel60: TppLabel;
    ppLine13: TppLine;
    ppLabel61: TppLabel;
    rpBalPatBemLabel2: TppLabel;
    lblDataIni: TppLabel;
    ppDetailBand7: TppDetailBand;
    rpBemResumLabel2: TppLabel;
    rpBemResumLabel3: TppLabel;
    rpBemResumLabel4: TppLabel;
    rpBemResumLabel5: TppLabel;
    rpBemResumLabel6: TppLabel;
    rpBemResumLabel7: TppLabel;
    lblVlrMoeda2: TppLabel;
    lblVlrMoeda3: TppLabel;
    rpBemResumDBText2: TppDBText;
    rpBemResumDBText4: TppDBText;
    rpBemResumDBText5: TppDBText;
    rpBemResumDBText6: TppDBText;
    rpBemResumDBText7: TppDBText;
    rpBemResumDBText8: TppDBText;
    rpBemResumDBText9: TppDBText;
    rpBemResumDBText3: TppDBText;
    rpBemResumLine1: TppLine;
    rpBemResumLabel27: TppLabel;
    rpBemResumLabel28: TppLabel;
    rpBalPatBemLabel4: TppLabel;
    rpBalPatBemDBText2: TppDBText;
    rpBalPatBemLabel5: TppLabel;
    rpBalPatBemDBText3: TppDBText;
    rpBalPatBemDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppLabel112: TppLabel;
    ppDBText7: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppLabel62: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    rpBemResumSummaryBand1: TppSummaryBand;
    rpBemResumLabel20: TppLabel;
    rpBemResumLine4: TppLine;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    rpBemResumLabel13: TppLabel;
    rpBemResumLine3: TppLine;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    lblDataFim: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    lblTotVlrMoeda2: TppLabel;
    lblTotVlrMoeda3: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel9: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLabel10: TppLabel;
    lblTotrVlrMoeda2: TppLabel;
    lblTotrVlrMoeda3: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    iMoedaOficial, iPlano : Integer;
    bInvestImob   : Boolean;
    function DataUltFechamento : TDateTime;
  public
    { Public declarations }
  end;

var
  RptCAFRelAquisPer: TRptCAFRelAquisPer;

implementation

{$R *.DFM}

procedure TRptCAFRelAquisPer.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAno, iMes, iDia : Word;

begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   try
      ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
      //----------------------------------------------------------------------------------
      iMoedaOficial := ParamCAF.MOEDAOFICIAL;
      iPlano := ParamCAF.PLANOVIGENTE;
      bInvestImob := copy(ParamCAF.SISTEMAS, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      DecodeDate(DataUltFechamento, iAno, iMes, iDia);
      CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAno, iMes, 01));
      CmpRptCM.ParamValues[1].TextDefault := DateToStr(EncodeDate(iAno, iMes, iDia));
      //----------------------------------------------------------------------------------
      CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC ' +
                                                         ' FROM CAFMOEDAS CM, ' +
                                                         '      MOEDA M ' +
                                                         ' WHERE CM.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CM.MOECODIGO = M.MOECODIGO ' +
                                                         ' ORDER BY CM.IDTIPOMOEDA, CM.MOECODIGO ' ;
      CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC ' +
                                                         ' FROM CAFMOEDAS CM, ' +
                                                         '      MOEDA M ' +
                                                         ' WHERE CM.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CM.MOECODIGO = M.MOECODIGO ' +
                                                         ' ORDER BY CM.IDTIPOMOEDA, CM.MOECODIGO ' ;
      CmpRptCM.ParamValues[4].LookupSettings.SQL.Text := ' SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS ' +
                                                         ' FROM CAFPAISES CP, ' +
                                                         '      PAIS P ' +
                                                         ' WHERE CP.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CP.IDPAIS = P.IDPAIS ' +
                                                         ' ORDER BY P.NOMEPAIS ';
      CmpRptCM.ParamValues[5].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                         ' FROM GRUPO G, ' +
                                                         '      PLANOGRUPO PG ' +
                                                         ' WHERE G.TIPO = ''A'' ' +
                                                         '   AND PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                         ' ORDER BY G.CLASSE ';
   finally
      ParamCAF.Free;
   end;
end;

procedure TRptCAFRelAquisPer.CrmRptCMBeforePrint(Sender: TObject);
var
   nTotDiasDep : Extended;
   iMoedaGerencial1,
   iMoedaGerencial2,
   iPaisOrigem : Integer;   
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Aplica os Filtros
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <= 0 then
         iMoedaGerencial1 := iMoedaOficial
      else
         iMoedaGerencial1 := CmpRptCM.ParamValues[2].AsInteger;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger <= 0 then
         iMoedaGerencial2 := iMoedaOficial
      else
         iMoedaGerencial2 := CmpRptCM.ParamValues[3].AsInteger;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <= 0 then
         iPaisOrigem := 1
      else
         iPaisOrigem := CmpRptCM.ParamValues[4].AsInteger;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger <> 0 then
      begin
         sqlRelAquisPer.SQL.Strings[21] := ' AND SB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[5].AsInteger);
         sqlRelAquisPer.SQL.Strings[29] := ' AND SB3.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[5].AsInteger);
         sqlRelAquisPer.SQL.Strings[35] := ' AND SCB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[5].AsInteger);
      end else
      begin
         sqlRelAquisPer.SQL.Strings[21] := ' ';
         sqlRelAquisPer.SQL.Strings[29] := ' ';
         sqlRelAquisPer.SQL.Strings[35] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[7].AsBoolean then
      begin
         sqlRelAquisPer.SQL.Strings[61] := ' ';
      end else
      begin
         sqlRelAquisPer.SQL.Strings[61] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlRelAquisPer.Prepare;
      sqlRelAquisPer.ParamByName('IDPESSOA').AsFloat     := CrmRptCM.IdEmpresa;
      sqlRelAquisPer.ParamByName('DATAINI').AsDateTime   := CmpRptCM.ParamValues[0].AsDateTime;
      sqlRelAquisPer.ParamByName('DATAFIM').AsDateTime   := CmpRptCM.ParamValues[1].AsDateTime;
      sqlRelAquisPer.ParamByName('MOECODIGO').AsInteger  := iMoedaOficial;
      sqlRelAquisPer.ParamByName('MOECODIGO2').AsInteger := iMoedaGerencial1;
      sqlRelAquisPer.ParamByName('MOECODIGO3').AsInteger := iMoedaGerencial2;
      sqlRelAquisPer.ParamByName('IDTAXADEP').AsInteger  := iPaisOrigem;
      sqlRelAquisPer.ParamByName('PLANO').AsInteger      := iPlano;
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[6].AsInteger of
         0: begin
               sqlRelAquisPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlRelAquisPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlRelAquisPer.ParamByName('PDEPREC').AsInteger    := 1;
               sqlRelAquisPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlRelAquisPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlRelAquisPer.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
      else  begin
               sqlRelAquisPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlRelAquisPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlRelAquisPer.Open;
      if cdsRelAquisPer.IsEmpty then
         Raise Exception.Create('Não existem dados com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      // Preenche o campo DATAFIMDEP com a data da depreciação final
      //----------------------------------------------------------------------------------
      cdsRelAquisPer.First;
      while not cdsRelAquisPer.EOF do
      begin
         nTotDiasDep := (100 / cdsRelAquisPer.FieldByName('TAXADEP').AsFloat) * 365.25;
         cdsRelAquisPer.Edit;
         cdsRelAquisPer.FieldByName('DATAFIMDEP').AsDateTime := strtodate(FormatDateTime(ShortDateFormat, cdsRelAquisPer.FieldByName('DATAINICIODEP').AsDateTime + nTotDiasDep));
         cdsRelAquisPer.Post;
         //-------------------------------------------------------------------------------
         cdsRelAquisPer.Next;
      end;
      cdsRelAquisPer.First;
      //----------------------------------------------------------------------------------
      lblDataIni.Text := DatetoStr(CmpRptCM.ParamValues[0].AsDateTime);
      lblDataFim.Text := DatetoStr(CmpRptCM.ParamValues[1].AsDateTime);
      //----------------------------------------------------------------------------------
      sqlAux.SQL.Text := ' SELECT MOEDESC FROM MOEDA ' +
                         ' WHERE MOECODIGO = ' + inttostr(iMoedaGerencial1);
      sqlAux.Open;
      lblVlrMoeda2.Text := 'Valor em ' + cdsAux.FieldByName('MOEDESC').AsString;
      lblTotVlrMoeda2.Text := 'Valor em ' + cdsAux.FieldByName('MOEDESC').AsString;
      lblTotrVlrMoeda2.Text := 'Valor em ' + cdsAux.FieldByName('MOEDESC').AsString;
      cdsAux.Close;
      //----------------------------------------------------------------------------------
      sqlAux.SQL.Text := ' SELECT MOEDESC FROM MOEDA ' +
                         ' WHERE MOECODIGO = ' + inttostr(iMoedaGerencial2);
      sqlAux.Open;
      lblVlrMoeda3.Text := 'Valor em ' + cdsAux.FieldByName('MOEDESC').AsString;
      lblTotVlrMoeda3.Text := 'Valor em ' + cdsAux.FieldByName('MOEDESC').AsString;
      lblTotrVlrMoeda3.Text := 'Valor em ' + cdsAux.FieldByName('MOEDESC').AsString;
      cdsAux.Close;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception Do
      begin
         CMDebugToFile('RELAÇÃO DE AQUISIÇÕES NO PERIODO : ' + E.Message );
      end;
   end;
end;

function TRptCAFRelAquisPer.DataUltFechamento : TDateTime;
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
      Result := cdsVerUltFec.FieldByName('DATAULT').AsDateTime
   else
      Result := 0;
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

end.
