unit rCAFRazaoPatAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, 
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, IvDictio, IvMulti,
  uCtrlPadroes, uCtrlParamCAF;

type
  TRptCAFRazaoPatAux = class(TFrmCmReport)
    sqlRazaoPatAux: TCMSqlParams;
    cdsMovPatAux: TCMClientDataSet;
    rpRazaoPatAux: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel74: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    pplbldata1: TppLabel;
    lblDataIni: TppLabel;
    rpMovPatGrpLine1: TppLine;
    lblDataFim: TppLabel;
    rpMovPatGrpLabel1: TppLabel;
    ppDetailBand10: TppDetailBand;
    rbdbeClasse: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppRazaoPatAux: TppBDEPipeline;
    dsRazaoPatAux: TwwDataSource;
    sqlMovPatAux: TCMSqlParams;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    cdsRazaoPatAux: TCMClientDataSet;
    ppLine1: TppLine;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    lblVlrMoeda2: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText32: TppDBText;
    ppLabel12: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsTransfPer: TCMClientDataSet;
    sqlTransfPer: TCMSqlParams;
    cdsMovPer: TCMClientDataSet;
    sqlMovPer: TCMSqlParams;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand10BeforePrint(Sender: TObject);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    iMoedaOficial  : Integer;
    sMascaraGrupo  : String;
    bInvestImob    : Boolean;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFRazaoPatAux: TRptCAFRazaoPatAux;

implementation

{$R *.DFM}

procedure TRptCAFRazaoPatAux.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   dDataUltFec : TDateTime;
   iDiaFim, iMesFim, iAnoFim, iAux : Word;

begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   try
      ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
      //----------------------------------------------------------------------------------
      iMoedaOficial := ParamCAF.MOEDAOFICIAL;
      bInvestImob := copy(ParamCAF.SISTEMAS, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      sMascaraGrupo := ParamCAF.MASCCODGRUPO;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraGrupo := sMascaraGrupo + ';0; ';
      //----------------------------------------------------------------------------------
      dDataUltFec := strtodate(DataUltFechamento);
      DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
      CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
      CmpRptCM.ParamValues[1].TextDefault := DateToStr(dDataUltFec);
      //----------------------------------------------------------------------------------
      CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC ' +
                                                         ' FROM CAFMOEDAS CM, ' +
                                                         '      MOEDA M ' +
                                                         ' WHERE CM.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CM.MOECODIGO = M.MOECODIGO ' +
                                                         ' ORDER BY CM.IDTIPOMOEDA, CM.MOECODIGO ' ;
      CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS ' +
                                                         ' FROM CAFPAISES CP, ' +
                                                         '      PAIS P ' +
                                                         ' WHERE CP.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND CP.IDPAIS = P.IDPAIS ' +
                                                         ' ORDER BY P.NOMEPAIS ';
      CmpRptCM.ParamValues[4].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
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

procedure TRptCAFRazaoPatAux.CrmRptCMBeforePrint(Sender: TObject);
var
   iDiaIni, iMesIni, iAnoIni,
   iDiaFim, iMesFim, iAnoFim  : Word;
   iMoedaGerencial, iPaisOrigem : Integer;
   
begin
   inherited;
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
   try
      //----------------------------------------------------------------------------------
      // Prepara os datasets que irão receber o resultado do processamento
      //----------------------------------------------------------------------------------
      sqlMovPatAux.Prepare;
      sqlMovPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlMovPatAux.Open;
      sqlMovPatAux.Prepare;
      sqlRazaoPatAux.Open;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAnoIni, iMesIni, iDiaIni);
      DecodeDate(CmpRptCM.ParamValues[1].AsDateTime, iAnoFim, iMesFim, iDiaFim);
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
      // Processa os saldos anteriores
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' AND SCB1.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate    := EncodeDate(iAnoIni,iMesIni,iDiaIni) - 1;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat := iMoedaOficial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat := iPaisOrigem;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('VALCUSTOANT').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsMovPatAux.FieldByName('VALCUSTOCMANT').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORGCM0').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatAux.Post;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Processa os saldos anteriores na Segunda Moeda
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' AND SCB1.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate    := EncodeDate(iAnoIni,iMesIni,iDiaIni) - 1;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat := iMoedaGerencial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat := iPaisOrigem;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('VALCUSTOCMANT2').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORGCM0').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECANT2').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatAux.Post;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Registra as movimentações realizadas no periodo especificado
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlMovPer.SQL.Strings[17] := ' AND SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlMovPer.SQL.Strings[17] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlMovPer.SQL.Strings[18] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlMovPer.SQL.Strings[18] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlMovPer.SQL.Strings[18] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlMovPer.SQL.Strings[19] := ' ';
      end else
      begin
         sqlMovPer.SQL.Strings[19] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlMovPer.Prepare;
      sqlMovPer.ParamByName('IDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
      sqlMovPer.ParamByName('DATAINI').AsDate     := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlMovPer.ParamByName('DATAFIM').AsDate     := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlMovPer.ParamByName('MOECODIGO').AsFloat  := iMoedaOficial;
      sqlMovPer.ParamByName('MOECODIGO2').AsFloat := iMoedaGerencial;
      sqlMovPer.ParamByName('IDTAXADEP').AsFloat  := iPaisOrigem;
      sqlMovPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsMovPer.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsMovPer.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsMovPer.EOF) and (cdsMovPer.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               if (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 01) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 03) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 08) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 53) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 54) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 09) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 07) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 10) then
               begin
                  cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOAQUIS2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOAQUIS2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
               end;
               if (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 15) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 22) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 34) then
               begin
                  cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
               end;
               //-------------------------------------------------------------------------
               if (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 23) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 13) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 16) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 06) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 20) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 70) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 37) then
               begin
                  cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOBX2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOBX2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOCMBX').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMBX').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOCMBX2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMBX2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
               end;
               if (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 25) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 28) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 38) then
               begin
                  cdsMovPatAux.FieldByName('VALCUSTOCMBX').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMBX').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALCUSTOCMBX2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMBX2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
               end;
               if (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 24) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 27) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 71) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 39) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 26) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 40) then
               begin
                  cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALDEPRECBX2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECBX2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
               end;
               //-------------------------------------------------------------------------
               if (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 69) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 33) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 17) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19) or
                  (cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36) then
               begin
                  cdsMovPatAux.FieldByName('VALDEPRECPER').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECPER').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
                  cdsMovPatAux.FieldByName('VALDEPRECPER2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECPER2').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI2').AsCurrency);
               end;
               //-------------------------------------------------------------------------
               cdsMovPatAux.Post;
               cdsMovPer.Next;
            end;
         end else
         begin
            cdsMovPer.Next;
         end;
      end;
      cdsMovPer.Close;
      //----------------------------------------------------------------------------------
      // Registra as transferências
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlTransfPer.SQL.Strings[28] := ' AND SC.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlTransfPer.SQL.Strings[28] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlTransfPer.SQL.Strings[29] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlTransfPer.SQL.Strings[29] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlTransfPer.SQL.Strings[29] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlTransfPer.SQL.Strings[30] := ' ';
      end else
      begin
         sqlTransfPer.SQL.Strings[30] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlTransfPer.Prepare;
      sqlTransfPer.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlTransfPer.ParamByName('DATAINI').AsDate := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlTransfPer.ParamByName('DATAFIM').AsDate := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlTransfPer.ParamByName('MOECODIGO').AsFloat := iMoedaOficial;
      sqlTransfPer.ParamByName('IDTAXADEP').AsFloat := iPaisOrigem;
      sqlTransfPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsTransfPer.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO', cdsTransfPer.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            cdsMovPatAux.Edit;
            cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency + cdsTransfPer.FieldByName('VALORG').AsCurrency);
            cdsMovPatAux.FieldByName('VALCUSTOCMENT').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMENT').AsCurrency + cdsTransfPer.FieldByName('VALORGCM').AsCurrency);
            cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         if cdsMovPatAux.Locate('IDGRUPO', cdsTransfPer.FieldByName('IDGRUPANT').AsInteger,[]) then
         begin
            cdsMovPatAux.Edit;
            cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency + cdsTransfPer.FieldByName('VALORG').AsCurrency);
            cdsMovPatAux.FieldByName('VALCUSTOCMSAI').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMSAI').AsCurrency + cdsTransfPer.FieldByName('VALORGCM').AsCurrency);
            cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsTransfPer.Next;
      end;
      cdsTransfPer.Close;
      //----------------------------------------------------------------------------------
      // Registra as transferências na Segunda Moeda
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlTransfPer.SQL.Strings[28] := ' AND SC.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlTransfPer.SQL.Strings[28] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlTransfPer.SQL.Strings[29] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlTransfPer.SQL.Strings[29] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlTransfPer.SQL.Strings[29] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlTransfPer.SQL.Strings[30] := ' ';
      end else
      begin
         sqlTransfPer.SQL.Strings[30] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlTransfPer.Prepare;
      sqlTransfPer.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlTransfPer.ParamByName('DATAINI').AsDate := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlTransfPer.ParamByName('DATAFIM').AsDate := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlTransfPer.ParamByName('MOECODIGO').AsFloat := iMoedaGerencial;
      sqlTransfPer.ParamByName('IDTAXADEP').AsFloat := iPaisOrigem;
      sqlTransfPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsTransfPer.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO', cdsTransfPer.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            cdsMovPatAux.Edit;
            cdsMovPatAux.FieldByName('VALCUSTOCMENT2').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMENT2').AsCurrency + cdsTransfPer.FieldByName('VALORGCM').AsCurrency);
            cdsMovPatAux.FieldByName('VALDEPRECENT2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECENT2').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         if cdsMovPatAux.Locate('IDGRUPO', cdsTransfPer.FieldByName('IDGRUPANT').AsInteger,[]) then
         begin
            cdsMovPatAux.Edit;
            cdsMovPatAux.FieldByName('VALCUSTOCMSAI2').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('VALCUSTOCMSAI2').AsCurrency + cdsTransfPer.FieldByName('VALORGCM').AsCurrency);
            cdsMovPatAux.FieldByName('VALDEPRECSAI2').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('VALDEPRECSAI2').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsTransfPer.Next;
      end;
      cdsTransfPer.Close;
      //----------------------------------------------------------------------------------
      // Processa os saldos atuais
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' AND SCB1.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate    := EncodeDate(iAnoFim,iMesFim,iDiaFim);
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat := iMoedaOficial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat := iPaisOrigem;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('VALCUSTOATUAL').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsMovPatAux.FieldByName('VALCUSTOCMATUAL').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORGCM0').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatAux.Post;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Processa os saldos atuais na Segunda Moeda
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' AND SCB1.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[4].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[24] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[25] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate    := EncodeDate(iAnoFim,iMesFim,iDiaFim) - 1;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat := iMoedaGerencial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat := iPaisOrigem;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('VALCUSTOCMATUAL2').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORGCM0').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECATUAL2').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatAux.Post;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsMovPatAux.First;
      while not cdsMovPatAux.EOF do
      begin
         if (cdsMovPatAux.FieldByName('VALCUSTOCMANT').AsCurrency <> 0) or
            (cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency <> 0) or
            (cdsMovPatAux.FieldByName('VALCUSTOCMATUAL').AsCurrency <> 0) or
            (cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency <> 0) then
         begin
            cdsRazaoPatAux.Append;
            cdsRazaoPatAux.FieldByName('IDGRUPO').AsInteger           := cdsMovPatAux.FieldByName('IDGRUPO').AsInteger;
            cdsRazaoPatAux.FieldByName('CLASSE').AsString             := cdsMovPatAux.FieldByName('CLASSE').AsString;
            cdsRazaoPatAux.FieldByName('DESCGRUPO').AsString          := cdsMovPatAux.FieldByName('DESCGRUPO').AsString;
            cdsRazaoPatAux.FieldByName('VALCUSTOANT').AsCurrency      := cdsMovPatAux.FieldByName('VALCUSTOANT').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMANT').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOCMANT').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECANT').AsCurrency     := cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMANT2').AsCurrency   := cdsMovPatAux.FieldByName('VALCUSTOCMANT2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECANT2').AsCurrency    := cdsMovPatAux.FieldByName('VALDEPRECANT2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMAQUIS').AsCurrency  := cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECAQUIS').AsCurrency   := cdsMovPatAux.FieldByName('VALDEPRECAQUIS').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMAQUIS2').AsCurrency := cdsMovPatAux.FieldByName('VALCUSTOCMAQUIS2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECAQUIS2').AsCurrency  := cdsMovPatAux.FieldByName('VALDEPRECAQUIS2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOBX').AsCurrency       := cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMBX').AsCurrency     := cdsMovPatAux.FieldByName('VALCUSTOCMBX').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECBX').AsCurrency      := cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMBX2').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOCMBX2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECBX2').AsCurrency     := cdsMovPatAux.FieldByName('VALDEPRECBX2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOENT').AsCurrency      := cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMENT').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOCMENT').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECENT').AsCurrency     := cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMENT2').AsCurrency   := cdsMovPatAux.FieldByName('VALCUSTOCMENT2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECENT2').AsCurrency    := cdsMovPatAux.FieldByName('VALDEPRECENT2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOSAI').AsCurrency      := cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMSAI').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOCMSAI').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECSAI').AsCurrency     := cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMSAI2').AsCurrency   := cdsMovPatAux.FieldByName('VALCUSTOCMSAI2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECSAI2').AsCurrency    := cdsMovPatAux.FieldByName('VALDEPRECSAI2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECPER').AsCurrency     := cdsMovPatAux.FieldByName('VALDEPRECPER').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECPER2').AsCurrency    := cdsMovPatAux.FieldByName('VALDEPRECPER2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOATUAL').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOATUAL').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMATUAL').AsCurrency  := cdsMovPatAux.FieldByName('VALCUSTOCMATUAL').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECATUAL').AsCurrency   := cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALCUSTOCMATUAL2').AsCurrency := cdsMovPatAux.FieldByName('VALCUSTOCMATUAL2').AsCurrency;
            cdsRazaoPatAux.FieldByName('VALDEPRECATUAL2').AsCurrency  := cdsMovPatAux.FieldByName('VALDEPRECATUAL2').AsCurrency;
            cdsRazaoPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Next;
      end;
      cdsMovPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsRazaoPatAux.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      rbdbeClasse.DisplayFormat := sMascaraGrupo;
      lblDataIni.Text := DatetoStr(CmpRptCM.ParamValues[0].AsDateTime);
      lblDataFim.Text := DatetoStr(CmpRptCM.ParamValues[1].AsDateTime);
      //----------------------------------------------------------------------------------
      sqlAux.SQL.Text := ' SELECT MOEDESC FROM MOEDA ' +
                         ' WHERE MOECODIGO = ' + inttostr(iMoedaGerencial);
      sqlAux.Open;
      lblVlrMoeda2.Text := 'Moeda : ' + cdsAux.FieldByName('MOEDESC').AsString;
      cdsAux.Close;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception do
      begin
         CMDebugToFile('RAZÃO AUXILIAR PATRIMONIAL!' + #13 + #10 + E.Message);
      end;
   end;
end;

procedure TRptCAFRazaoPatAux.ppDetailBand10BeforePrint(Sender: TObject);
begin
   inherited;
   if ppDetailBand10.Count <= 14 then
      ppLine1.Visible := True
   else
      ppLine1.Visible := False;
end;

procedure TRptCAFRazaoPatAux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Application.ProcessMessages;
end;

function TRptCAFRazaoPatAux.DataUltFechamento : String;
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

function TRptCAFRazaoPatAux.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.3f',[fNum]));
end;

end.
