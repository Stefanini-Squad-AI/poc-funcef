unit rCAFMovAnaPer2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, FCmReport, uCmSqlParams, DB, DBClient, uCMClientDataSet,
  uCmRptManager, TXComp, CmParamReport, ppProd, ppClass, ppReport, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppCache, Wwdatsrc, ppComm, ppRelatv, uCMfileUtils, IvDictio, IvMulti;

type
  TRptCAFMovAnaPer2 = class(TFrmCmReport)
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    dsMovAnaPer2: TwwDataSource;
    ppMovAnaPer2: TppBDEPipeline;
    ppMovAnaPer2ppField1: TppField;
    ppMovAnaPer2ppField2: TppField;
    ppMovAnaPer2ppField3: TppField;
    ppMovAnaPer2ppField4: TppField;
    ppMovAnaPer2ppField5: TppField;
    ppMovAnaPer2ppField6: TppField;
    ppMovAnaPer2ppField7: TppField;
    ppMovAnaPer2ppField8: TppField;
    ppMovAnaPer2ppField9: TppField;
    ppMovAnaPer2ppField10: TppField;
    rpMovAnaPer2: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel43: TppLabel;
    LBLEMPRESA: TppLabel;
    ppLabel119: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBCalc1: TppDBCalc;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFooterBand8: TppFooterBand;
    ppLine16: TppLine;
    LBLSISTEMA: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel46: TppLabel;
    ppLine17: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLine18: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel54: TppLabel;
    ppDBText20: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine26: TppLine;
    ppLabel55: TppLabel;
    ppDBCalc3: TppDBCalc;
    cdsMovAnaPer2: TCMClientDataSet;
    sqlMovAnaPer2: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    iMoedaOficial  : Integer;
    bInvestImob    : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFMovAnaPer2: TRptCAFMovAnaPer2;

implementation

{$R *.dfm}

procedure TRptCAFMovAnaPer2.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
   //-------------------------------------------------------------------------------------
   dDataUltFec := strtodate(DataUltFechamento);
   DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(dDataUltFec);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
end;

function TRptCAFMovAnaPer2.DataUltFechamento : String;
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
      Result := cdsVerUltFec.FieldByName('DATAULT').AsString
   else
      Result := '-1';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

procedure TRptCAFMovAnaPer2.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      with sqlMovAnaPer2 do
      begin
         if CmpRptCM.ParamValues[2].AsInteger = 0 then
         begin
            SQL.Strings[19] := ' AND (HMOV.IDTIPOMOVIMENTACAO = 01 OR HMOV.IDTIPOMOVIMENTACAO = 03) ';
         end else
         if CmpRptCM.ParamValues[2].AsInteger = 1 then
         begin
            SQL.Strings[19] := ' AND HMOV.IDTIPOMOVIMENTACAO = 06 ';
         end else
         if CmpRptCM.ParamValues[2].AsInteger = 0 then
         begin
            SQL.Strings[19] := ' AND (HMOV.IDTIPOMOVIMENTACAO = 05 OR HMOV.IDTIPOMOVIMENTACAO = 11 OR HMOV.IDTIPOMOVIMENTACAO = 12) ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[5].AsInteger <> 0 then
         begin
            SQL.Strings[20] := ' AND BEM.IDSITUACAO = ' + inttostr(CmpRptCM.ParamValues[5].AsInteger);
         end else
         begin
            SQL.Strings[20] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[6].AsInteger <> 0 then
         begin
            SQL.Strings[21] := ' AND BEM.IDCLASSEBEM = ' + inttostr(CmpRptCM.ParamValues[6].AsInteger);
         end else
         begin
            SQL.Strings[21] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[7].AsInteger <> 0 then
         begin
            SQL.Strings[22] := ' AND SB.IDGRUPO = ' + inttostr(CmpRptCM.ParamValues[7].AsInteger);
         end else
         begin
            SQL.Strings[22] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[8].AsInteger <> 0 then
         begin
            SQL.Strings[23] := ' AND SB.IDLOCALIZACAO = ' + inttostr(CmpRptCM.ParamValues[8].AsInteger);
         end else
         begin
            SQL.Strings[23] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[9].AsInteger <> 0 then
         begin
            SQL.Strings[24] := ' AND SB.IDRESPONSAVEL = ' + inttostr(CmpRptCM.ParamValues[9].AsInteger);
         end else
         begin
            SQL.Strings[24] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[4].AsInteger = 0 then
         begin
            SQL.Strings[25] := ' AND BEM.CONTROLE = ''T'' ';
         end else
         if CmpRptCM.ParamValues[4].AsInteger = 1 then
         begin
            SQL.Strings[25] := ' AND BEM.CONTROLE = ''F'' ';
         end else
         begin
            SQL.Strings[25] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[3].AsInteger = 0 then
         begin
            SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.DESBEM ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 1 then
         begin
            SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.PLACA ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 2 then
         begin
            SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.PROCESSOAQUIS ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 3 then
         begin
            SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.IDNOTA ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 4 then
         begin
            SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, L.NOME ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 5 then
         begin
            SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.DESBEM ';
         end;
      end;
      //----------------------------------------------------------------------------------
      sqlMovAnaPer2.Prepare;
      sqlMovAnaPer2.ParamByName('DATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlMovAnaPer2.ParamByName('DATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlMovAnaPer2.ParamByName('IDPESSOA').AsFloat      := CrmRptCM.IdEmpresa;
      sqlMovAnaPer2.ParamByName('MOECODIGO').AsInteger   := iMoedaOficial;
      sqlMovAnaPer2.Open;
      if cdsMovAnaPer2.IsEmpty then
         Raise Exception.Create('Não existe Movimentação de Bens com os parâmetros fornecidos.');
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         ppLabel119.Caption  := 'Entradas';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         ppLabel119.Caption  := 'Saídas';
      end else
      begin
         ppLabel119.Caption  := 'Transferências';
      end;
   except
      on E : Exception do
      begin
         CMDebugToFile('MOVIMENTAÇÃO ANALÍTICA NO PERIODO II! ' + #13 + #10 + E.Message);
      end;
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

end.
