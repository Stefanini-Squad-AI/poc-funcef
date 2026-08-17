{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 146357
Nº KINTANA..: 1129001
Data........: 08/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Colocar um Distinct no select para os campos não aparecerem repetidos na query sqlMovAnaPer e
              aproveitar os espaços entre os labels para a informação não sair grudada uma na outra.
-------------------------------------------------------------------------------------------------- }
unit rCAFMovAnaPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, IvDictio,
  IvMulti, Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, ppDB, ppBands, ppClass, ppVar, ppCtrls,
  ppStrtch, ppMemo, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, DB, Wwdatsrc, DBTables, uCMfileUtils, TXRB;

type
  TRptCAFMovAnaPer = class(TFrmCmReport)
    dsMovAnaPer: TwwDataSource;
    ppMovAnaPer: TppBDEPipeline;
    rpMovAnaPer: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel118: TppLabel;
    ppDetailBand14: TppDetailBand;
    rpMovAnaPerDBCalc1: TppDBCalc;
    rpMovAnaPerDBText1: TppDBText;
    rpMovAnaPerDBText2: TppDBText;
    rpMovAnaPerDBText3: TppDBText;
    rpMovAnaPerDBText4: TppDBText;
    rpMovAnaPerDBText5: TppDBText;
    rpMovAnaPerDBMemo1: TppDBMemo;
    ppFooterBand14: TppFooterBand;
    ppLine32: TppLine;
    ppLabel97: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    rpMovAnaPerSummaryBand1: TppSummaryBand;
    rpMovAnaPerLabel10: TppLabel;
    rpMovAnaPerLine3: TppLine;
    rpMovAnaPerDBCalc3: TppDBCalc;
    rpMovAnaPerLine4: TppLine;
    rpMovAnaPerGroup1: TppGroup;
    rpMovAnaPerGroupHeaderBand1: TppGroupHeaderBand;
    rpMovAnaPerLabel1: TppLabel;
    rpMovAnaPerLabel2: TppLabel;
    rpMovAnaPerLabel3: TppLabel;
    rpMovAnaPerLabel4: TppLabel;
    rpMovAnaPerLabel5: TppLabel;
    rpMovAnaPerLabel6: TppLabel;
    rpMovAnaPerLabel7: TppLabel;
    ppLine31: TppLine;
    rpMovAnaPerLine1: TppLine;
    rpMovAnaPerLabel8: TppLabel;
    rpMovAnaPerDBText6: TppDBText;
    rpMovAnaPerGroupFooterBand1: TppGroupFooterBand;
    rpMovAnaPerLine2: TppLine;
    rpMovAnaPerLabel9: TppLabel;
    rpMovAnaPerDBCalc2: TppDBCalc;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsMovAnaPer: TCMClientDataSet;
    sqlMovAnaPer: TCMSqlParams;
    cdsSldCtb: TCMClientDataSet;
    sqlSldCtb: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    iMoedaOficial  : Integer;
    sMascaraGrupo  : String;
    bInvestImob    : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFMovAnaPer: TRptCAFMovAnaPer;

implementation

{$R *.dfm}

procedure TRptCAFMovAnaPer.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
   sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString) + ';0; ';
   //-------------------------------------------------------------------------------------
   dDataUltFec := strtodate(DataUltFechamento);
   DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(dDataUltFec);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFMovAnaPer.DataUltFechamento : String;
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
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
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

procedure TRptCAFMovAnaPer.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      with sqlMovAnaPer do
      begin
         if CmpRptCM.ParamValues[3].AsInteger = 0 then
         begin
            SQL.Strings[28] := ' AND (HMOV.IDTIPOMOVIMENTACAO = 01 OR HMOV.IDTIPOMOVIMENTACAO = 03) ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 1 then
         begin
            SQL.Strings[28] := ' AND HMOV.IDTIPOMOVIMENTACAO = 06 ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 0 then
         begin
            SQL.Strings[28] := ' AND (HMOV.IDTIPOMOVIMENTACAO = 05 OR HMOV.IDTIPOMOVIMENTACAO = 11 OR HMOV.IDTIPOMOVIMENTACAO = 12) ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[2].AsInteger <> 0 then
         begin
            SQL.Strings[34] := ' AND SCB.IDGRUPO = ' + inttostr(CmpRptCM.ParamValues[2].AsInteger);
         end else
         begin
            SQL.Strings[34] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[3].AsInteger = 0 then
         begin
            SQL.Strings[35] := ' ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 1 then
         begin
            SQL.Strings[35] := ' AND SB.SBTIPOMOV = 1 ';
         end else
         if CmpRptCM.ParamValues[3].AsInteger = 2 then
         begin
            SQL.Strings[35] := ' AND SB.SBTIPOMOV = 0 ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[4].AsInteger = 0 then
         begin
            SQL.Strings[53] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.PLACA ';
         end else
         if CmpRptCM.ParamValues[4].AsInteger = 1 then
         begin
            SQL.Strings[53] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.DESBEM ';
         end;
         //-------------------------------------------------------------------------------
         Prepare;
         ParamByName('IDPESSOA').AsFloat      := CrmRptCM.IdEmpresa;
         ParamByName('DATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
         ParamByName('DATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
         ParamByName('MOECODIGO').AsInteger   := iMoedaOficial;
         ParamByName('IDTAXADEP').AsInteger   := 1;                              // Brasil
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         ppLabel118.Caption           := 'Entradas';
         rpMovAnaPerDBCalc2.DataField := 'VALOFI';
         rpMovAnaPerDBCalc3.DataField := 'VALOFI';
         rpMovAnaPerDBText4.DataField := 'VALOFI';
         rpMovAnaPerLabel5.Caption    := 'Valor';
         rpMovAnaPerDBText5.DataField := 'NOMEFORNEC';
         rpMovAnaPerLabel6.Caption    := 'Fornecedor';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         ppLabel118.Caption           := 'Saídas';
         rpMovAnaPerDBCalc2.DataField := 'VALCTB';
         rpMovAnaPerDBCalc3.DataField := 'VALCTB';
         rpMovAnaPerDBText4.DataField := 'VALCTB';
         rpMovAnaPerLabel5.Caption    := 'Saldo Contábil';
         rpMovAnaPerDBText5.DataField := 'NOMEDESTIN';
         rpMovAnaPerLabel6.Caption    := 'Destinatário';
      end else
      begin
         ppLabel118.Caption           := 'Transferências';
         rpMovAnaPerDBCalc2.DataField := 'VALCTB';
         rpMovAnaPerDBCalc3.DataField := 'VALCTB';
         rpMovAnaPerDBText4.DataField := 'VALCTB';
         rpMovAnaPerLabel5.Caption    := 'Saldo Contábil';
         rpMovAnaPerDBText5.DataField := 'DESCLOCALANT';
         rpMovAnaPerLabel6.Caption    := 'Local Origem';
      end;
      //----------------------------------------------------------------------------------
      sqlMovAnaPer.Open;
      if cdsMovAnaPer.IsEmpty then
         Raise Exception.Create('Não existe Movimentação de Bens no periodo fornecido.');
      //----------------------------------------------------------------------------------
      // Calcula os saldos contábeis nas respectivas datas fornecidas e registra no
      // campo virtual VALCTB, caso seja solicitado
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger > 0 then
      begin
         while not cdsMovAnaPer.EOF do
         begin
            sqlSldCtb.Prepare;
            if CmpRptCM.ParamValues[3].AsInteger = 1 then                  // Baixa de Bem
               sqlSldCtb.ParamByName('DATASLD').AsDateTime := cdsMovAnaPer.FieldByName('DATAMOVIMENTACAO').AsDateTime - 1
            else
               sqlSldCtb.ParamByName('DATASLD').AsDateTime := cdsMovAnaPer.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            //----------------------------------------------------------------------------
            sqlSldCtb.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
            sqlSldCtb.ParamByName('IDBEM').AsFloat       := cdsMovAnaPer.FieldByName('IDBEM').AsFloat;
            sqlSldCtb.ParamByName('IDPESSOA').AsFloat    := cdsMovAnaPer.FieldByName('IDPESSOA').AsFloat;
            sqlSldCtb.Open;
            //----------------------------------------------------------------------------
            if not cdsSldCtb.IsEmpty then
            begin
               cdsMovAnaPer.Edit;
               cdsMovAnaPer.FieldByName('VALCTB').AsCurrency := cdsSldCtb.FieldByName('VALCTB').AsCurrency;
               cdsMovAnaPer.Post;
            end;
            cdsSldCtb.Close;
            //----------------------------------------------------------------------------
            cdsMovAnaPer.Next;
         end;
         cdsMovAnaPer.First;
      end;
   except
      on E : Exception do
      begin
         CMDebugToFile('MOVIMENTAÇÃO ANALÍTICA NO PERIODO! ' + #13 + #10 + E.Message);
      end;
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

end.
