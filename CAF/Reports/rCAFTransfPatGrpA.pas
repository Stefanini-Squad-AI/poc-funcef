unit rCAFTransfPatGrpA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB, 
  Wwdatsrc, uCmRptManager, TXComp, CmParamReport, DBClient, Mask,
  uCMClientDataSet, uCmSqlParams, uCMfileUtils, uCtrlPadroes, IvDictio,
  IvMulti;

type
  TRptCAFTransfPatGrpA = class(TFrmCmReport)
    cdsTransfPatGrpA: TCMClientDataSet;
    sqlTransfPatGrpA: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    dsTransfPatGrpA: TwwDataSource;
    ppTransfPatGrpA: TppBDEPipeline;
    rpTransfPatGrpA: TppReport;
    ppHeaderBand13: TppHeaderBand;
    LblEmpresa: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBText34: TppDBText;
    ppDBText39: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText47: TppDBText;
    ppDBText53: TppDBText;
    ppDBText55: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine42: TppLine;
    LBLSISTEMA: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel104: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel113: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLine46: TppLine;
    ppLabel117: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLine40: TppLine;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel111: TppLabel;
    ppLine41: TppLine;
    ppLabel103: TppLabel;
    ppDBText40: TppDBText;
    ppDBText43: TppDBText;
    ppLabel78: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel105: TppLabel;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppDBCalc5: TppDBCalc;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand13BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
  private
    { Private declarations }
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraGrupo,
    sGrupoAtual,
    sGrupoAnt     : String;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFTransfPatGrpA: TRptCAFTransfPatGrpA;

implementation

{$R *.dfm}

procedure TRptCAFTransfPatGrpA.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   dDataUltFec : TDateTime;
   iAnoFim, iMesFim, iDiaFim : Word;
begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   sqlParamCaf.Open;
   bInvestImob   := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
   sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString) +';0; ';
   //-------------------------------------------------------------------------------------
   dDataUltFec := strtodate(DataUltFechamento);
   DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
   CmpRptCM.ParamValues[2].TextDefault := DateToStr(dDataUltFec);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFTransfPatGrpA.DataUltFechamento : String;
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

procedure TRptCAFTransfPatGrpA.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger <> 0 then
      begin
         sqlTransfPatGrpA.SQL.Strings[45] := ' AND B.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[3].AsInteger);
      end else
      begin
         sqlTransfPatGrpA.SQL.Strings[45] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[0].AsInteger = 0 then
      begin
         sqlTransfPatGrpA.SQL.Strings[46] := ' AND G.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[0].AsInteger = 1 then
      begin
         sqlTransfPatGrpA.SQL.Strings[46] := ' AND G.FLGIMOVEL = 1 ';
      end else
      begin
         sqlTransfPatGrpA.SQL.Strings[46] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlTransfPatGrpA.Prepare;
      sqlTransfPatGrpA.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlTransfPatGrpA.ParamByName('DATAINI').AsDateTime  := CmpRptCM.ParamValues[1].AsDateTime;
      sqlTransfPatGrpA.ParamByName('DATAFIM').AsDateTime  := CmpRptCM.ParamValues[2].AsDateTime;
      sqlTransfPatGrpA.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlTransfPatGrpA.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlTransfPatGrpA.Open;
      //----------------------------------------------------------------------------------
      if cdsTransfPatGrpA.IsEmpty then
         Raise Exception.Create('Não existem transferências no Periodo/Grupo selecionados!');
      //----------------------------------------------------------------------------------
      ppLabel107.Text := DateToStr(CmpRptCM.ParamValues[1].AsDateTime);
      ppLabel108.Text := DateToStr(CmpRptCM.ParamValues[2].AsDateTime);
      ppDBText44.DisplayFormat := sMascaraGrupo;
      ppDBText40.DisplayFormat := sMascaraGrupo;
      ppDBText41.DisplayFormat := '#,0.00;(#,0.00)';
      ppDBCalc5.DisplayFormat  := '#,0.00;(#,0.00)';
      ppDBCalc6.DisplayFormat  := '#,0.00;(#,0.00)';
      ppDBCalc8.DisplayFormat  := '#,0.00;(#,0.00)';
      ppDBCalc11.DisplayFormat := '#,0.00;(#,0.00)';
      ppDBCalc9.DisplayFormat  := '#,0.00;(#,0.00)';
      ppDBCalc12.DisplayFormat := '#,0.00;(#,0.00)';
      ppDBCalc10.DisplayFormat := '#,0.00;(#,0.00)';
      ppDBCalc13.DisplayFormat := '#,0.00;(#,0.00)';
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception Do
      begin
         CMDebugToFile('TRANSFERENCIAS PATRIMONIAIS POR GRUPO - ANALÍTICO : ' + #13 + E.Message);
         Screen.Cursor := crDefault;
         Application.ProcessMessages;
      end;
   end;
end;

procedure TRptCAFTransfPatGrpA.ppDetailBand13BeforePrint(Sender: TObject);
begin
   inherited;
   sGrupoAtual := Trim(FormatMaskText(ppDBText40.DisplayFormat,cdsTransfPatGrpA.FieldByName('CODGRUPO').AsString));
   sGrupoAnt   := Trim(FormatMaskText(ppDBText40.DisplayFormat,cdsTransfPatGrpA.FieldByName('CODGRUPOANT').AsString));
end;

procedure TRptCAFTransfPatGrpA.ppGroupFooterBand4BeforePrint(Sender: TObject);
begin
   inherited;
   ppLabel114.Caption := sGrupoAnt;
   ppLabel115.Caption := sGrupoAtual;
   ppLabel117.Caption := sGrupoAtual;
end;

end.

