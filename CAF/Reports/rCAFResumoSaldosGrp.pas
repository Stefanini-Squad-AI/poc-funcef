unit rCAFResumoSaldosGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, IvDictio, IvMulti,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes, uCtrlParamCAF;

type
  TRptCAFResumoSaldosGrp = class(TFrmCmReport)
    rpResumoSaldosGrp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    ppLine17: TppLine;
    LBLEMPRESA: TppLabel;
    rpBalPatGrpLabel1: TppLabel;
    rpBalPatGrpLabel2: TppLabel;
    rpBalPatGrpLabel3: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel5: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel7: TppLabel;
    rpBalPatGrpLabel8: TppLabel;
    rpBalPatGrpLabel9: TppLabel;
    rpBalPatGrpLabel10: TppLabel;
    rpBalPatGrpLabel11: TppLabel;
    ppDetailBand9: TppDetailBand;
    rpResumoSaldosGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    rpBalPatGrpDBText3: TppDBText;
    rpBalPatGrpDBText9: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppResumoSaldosGrp: TppBDEPipeline;
    dsResumoSaldosGrp: TwwDataSource;
    cdsResumoSaldosGrp: TCMClientDataSet;
    sqlResumoSaldosGrp: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    cdsDepPerTransf: TCMClientDataSet;
    sqlDepPerTransf: TCMSqlParams;
    sqlBalPatAux: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    rpBalPatGrpDBText10: TppDBText;
    ppLabel1: TppLabel;
    lblMoedaSec: TppLabel;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpResumoSaldosGrpDBText1Print(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraGrupo : String;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFResumoSaldosGrp: TRptCAFResumoSaldosGrp;

implementation

{$R *.DFM}

procedure TRptCAFResumoSaldosGrp.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
   finally
      ParamCAF.Free;
   end;
end;

procedure TRptCAFResumoSaldosGrp.CmpRptCMParamControlEnter(Sender: TPainelControles; Index: Integer);
begin
  inherited;
  {if (Index = 2) or (Index = 3) then
  begin
      //----------------------------------------------------------------------------------
      // Posiciona a Moeda Oficial
      //----------------------------------------------------------------------------------
      cdsAux.Close;
      sqlAux.SQL.Text := ' SELECT C.MOECODIGO, M.MOEDESC ' +
                         ' FROM CAFMOEDAS C, ' +
                         '      MOEDA M ' +
                         ' WHERE C.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                         '   AND C.IDTIPOMOEDA = 1 ' +
                         '   AND C.MOECODIGO = M.MOECODIGO ';
      sqlAux.Open;
      //----------------------------------------------------------------------------------
      if not cdsAux.IsEmpty then
      begin
         if CmpRptCM.ParamValues[2].TextDefault = '' then
         begin
            CmpRptCM.ParamValues[2].AsInteger   := cdsAux.FieldByName('MOECODIGO').AsInteger;
            CmpRptCM.ParamValues[2].TextDefault := cdsAux.FieldByName('MOEDESC').AsString;
         end;
         if CmpRptCM.ParamValues[3].TextDefault = '' then
         begin
            CmpRptCM.ParamValues[3].AsInteger   := cdsAux.FieldByName('MOECODIGO').AsInteger;
            CmpRptCM.ParamValues[3].TextDefault := cdsAux.FieldByName('MOEDESC').AsString;
         end;
      end;
  end;
  //--------------------------------------------------------------------------------------
  if Index = 4 then
  begin
      //----------------------------------------------------------------------------------
      // Posiciona o País de Origem
      //----------------------------------------------------------------------------------
      cdsAux.Close;
      sqlAux.SQL.Text := ' SELECT C.IDCAFPAISES, P.NOMEPAIS ' +
                         ' FROM CAFPAISES C, ' +
                         '      PAIS P ' +
                         ' WHERE C.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                         '   AND C.IDCAFPAISES = 1 ' +
                         '   AND C.IDPAIS = P.IDPAIS ';
      sqlAux.Open;
      if not cdsAux.IsEmpty then
      begin
         CmpRptCM.ParamValues[4].AsInteger := cdsAux.FieldByName('IDCAFPAISES').AsInteger;
         CmpRptCM.ParamValues[4].TextDefault := cdsAux.FieldByName('NOMEPAIS').AsString;
      end;
   end;}
end;

function TRptCAFResumoSaldosGrp.DataUltFechamento : String;
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

procedure TRptCAFResumoSaldosGrp.CrmRptCMBeforePrint(Sender: TObject);
var
   nValOrg, nValOrgCM, nDepLancCM,
   nValCtb, nValOrgCM2, nDepLancCM2,
   nDepr : Extended;
   iDia, iMes, iAno : Word;
   iTam, iQuant,
   iMoedaGerencial1,
   iMoedaGerencial2,
   iPaisOrigem : Integer;


begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      // Inicializa os datasets intermediário e final
      //----------------------------------------------------------------------------------
      cdsBalPatAux.Close;
      sqlBalPatAux.Prepare;
      sqlBalPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlBalPatAux.Open;
      cdsResumoSaldosGrp.Close;
      sqlResumoSaldosGrp.Open;
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
      // Prepara a query que calcula os Grupos Analiticos para a Primeira Moeda
      //----------------------------------------------------------------------------------
      cdsGrpAnaliticos.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[19] := ' AND SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[19] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' AND G1.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' AND G1.FLGIMOVEL = 1 ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' AND B1.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[7].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' AND B1.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      // Abre a query para a Primeira Moeda
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaGerencial1;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsInteger := iPaisOrigem;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsBalPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('VALORG').AsFloat := cdsGrpAnaliticos.FieldByName('VALORG0').AsFloat;
               cdsBalPatAux.FieldByName('VALORGCM').AsFloat := cdsGrpAnaliticos.FieldByName('VALORGCM0').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANCCM').AsFloat := cdsGrpAnaliticos.FieldByName('DEPLANCCM0').AsFloat;
               cdsBalPatAux.FieldByName('VALCTB').AsFloat := cdsGrpAnaliticos.FieldByName('VALCTB0').AsFloat;
               cdsBalPatAux.FieldByName('QUANT').AsInteger := cdsGrpAnaliticos.FieldByName('QUANT').AsInteger;
               //-------------------------------------------------------------------------
               if cdsBalPatAux.FieldByName('VALORGCM').AsFloat <> 0 then
               begin
                  cdsBalPatAux.FieldByName('DEPR').AsFloat := ConvNum((cdsBalPatAux.FieldByName('DEPLANCCM').AsFloat /
                                                                       cdsBalPatAux.FieldByName('VALORGCM').AsFloat) * 100);
               end else
               begin
                  cdsBalPatAux.FieldByName('DEPR').AsFloat := 0;
               end;
               cdsBalPatAux.Post;
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
      // Prepara a query que calcula os Grupos Analiticos para a Segunda Moeda
      //----------------------------------------------------------------------------------
      cdsGrpAnaliticos.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[19] := ' AND SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[19] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' AND G1.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' AND G1.FLGIMOVEL = 1 ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' AND B1.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[7].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' AND B1.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      // Abre a query para a Segunda Moeda
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaGerencial2;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsInteger := iPaisOrigem;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsBalPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('VALORGCM2').AsFloat := cdsGrpAnaliticos.FieldByName('VALORGCM0').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANCCM2').AsFloat := cdsGrpAnaliticos.FieldByName('DEPLANCCM0').AsFloat;
               cdsBalPatAux.Post;
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
      // Calcula os Grupos Sintéticos
      //----------------------------------------------------------------------------------
      cdsGrpSinteticos.Close;
      if CmpRptCM.ParamValues[5].AsInteger = 0 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND G.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[5].AsInteger = 1 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND G.FLGIMOVEL = 1 ';
      end else
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' ';
      end;
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpSinteticos.EOF do
      begin
         iTam := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         nValOrg := 0;
         nValOrgCM := 0;
         nDepLancCM := 0;
         nValCtb := 0;
         nValOrgCM2 := 0;
         nDepLancCM2 := 0;
         iQuant := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while not cdsBalPatAux.EOF and
               (copy(trim(cdsBalPatAux.FieldByName('CLASSE').AsString),1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            nValOrg     := ConvNum(nValOrg + cdsBalPatAux.FieldByName('VALORG').AsFloat);
            nValOrgCM   := ConvNum(nValOrgCM + cdsBalPatAux.FieldByName('VALORGCM').AsFloat);
            nDepLancCM  := ConvNum(nDepLancCM + cdsBalPatAux.FieldByName('DEPLANCCM').AsFloat);
            nValCtb     := ConvNum(nValCtb + cdsBalPatAux.FieldByName('VALCTB').AsFloat);
            nValOrgCM2  := ConvNum(nValOrgCM2 + cdsBalPatAux.FieldByName('VALORGCM').AsFloat);
            nDepLancCM2 := ConvNum(nDepLancCM2 + cdsBalPatAux.FieldByName('DEPLANCCM').AsFloat);
            iQuant      := iQuant + cdsBalPatAux.FieldByName('QUANT').AsInteger;
            cdsBalPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         if cdsBalPatAux.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[]) then
         begin
            if nValOrgCM <> 0 then
            begin
               nDepr := ConvNum((nDepLancCM / nValOrgCM) * 100);
            end else
            begin
               nDepr := 0;
            end;
            //----------------------------------------------------------------------------
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('VALORG').AsFloat     := nValOrg;
            cdsBalPatAux.FieldByName('VALORGCM').AsFloat   := nValOrgCM;
            cdsBalPatAux.FieldByName('DEPLANCCM').AsFloat  := nDepLancCM;
            cdsBalPatAux.FieldByName('VALCTB').AsFloat     := nValCtb;
            cdsBalPatAux.FieldByName('VALORGCM2').AsFloat  := nValOrgCM2;
            cdsBalPatAux.FieldByName('DEPLANCCM2').AsFloat := nDepLancCM2;
            cdsBalPatAux.FieldByName('DEPR').AsFloat       := nDepr;
            cdsBalPatAux.FieldByName('QUANT').AsInteger    := iQuant;
            cdsBalPatAux.Post;
         end else
            Raise Exception.Create('Erro no processamento dos grupos sintéticos');
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      // Preenche o DataSet do Relatório
      //----------------------------------------------------------------------------------
      cdsBalPatAux.First;
      while not cdsBalPatAux.EOF do
      begin
         if CmpRptCM.ParamValues[8].AsBoolean or (cdsBalPatAux.FieldByName('QUANT').AsInteger <> 0) then
         begin
            if (not CmpRptCM.ParamValues[9].AsBoolean) or
               ((CmpRptCM.ParamValues[9].AsBoolean) and (cdsBalPatAux.FieldByName('S_A').AsString = 'S')) then
            begin
               cdsResumoSaldosGrp.Append;
               cdsResumoSaldosGrp.FieldByName('IDGRUPO').AsInteger  := cdsBalPatAux.FieldByName('IDGRUPO').AsInteger;
               cdsResumoSaldosGrp.FieldByName('CLASSE').AsString    := cdsBalPatAux.FieldByName('CLASSE').AsString;
               cdsResumoSaldosGrp.FieldByName('DESCGRUPO').AsString := cdsBalPatAux.FieldByName('DESCGRUPO').AsString;
               cdsResumoSaldosGrp.FieldByName('S_A').AsString       := cdsBalPatAux.FieldByName('S_A').AsString;
               cdsResumoSaldosGrp.FieldByName('VALORG').AsFloat     := cdsBalPatAux.FieldByName('VALORG').AsFloat;
               cdsResumoSaldosGrp.FieldByName('VALORGCM').AsFloat   := cdsBalPatAux.FieldByName('VALORGCM').AsFloat;
               cdsResumoSaldosGrp.FieldByName('DEPLANCCM').AsFloat  := cdsBalPatAux.FieldByName('DEPLANCCM').AsFloat;
               cdsResumoSaldosGrp.FieldByName('VALCTB').AsFloat     := cdsBalPatAux.FieldByName('VALCTB').AsFloat;
               cdsResumoSaldosGrp.FieldByName('VALORGCM2').AsFloat  := cdsBalPatAux.FieldByName('VALORGCM2').AsFloat;
               cdsResumoSaldosGrp.FieldByName('DEPLANCCM2').AsFloat := cdsBalPatAux.FieldByName('DEPLANCCM2').AsFloat;
               cdsResumoSaldosGrp.FieldByName('DEPR').AsFloat       := cdsBalPatAux.FieldByName('DEPR').AsFloat;
               cdsResumoSaldosGrp.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Next;
      end;
      cdsBalPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsResumoSaldosGrp.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      sqlAux.SQL.Text := ' SELECT MOEDESC FROM MOEDA ' +
                         ' WHERE MOECODIGO = ' + inttostr(iMoedaGerencial1);
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
         CMDebugToFile('RESUMO DE SALDOS : ' + E.Message );
      end;
   end;
end;

procedure TRptCAFResumoSaldosGrp.rpResumoSaldosGrpDBText1Print(Sender: TObject);
begin
   inherited;
   if cdsResumoSaldosGrp.FieldByName('S_A').AsString = 'S' then
   begin
      rpResumoSaldosGrpDBText1.Font.Style := [fsBold];
      rpBalPatGrpDBText2.Font.Style := [fsBold];
      rpBalPatGrpDBText3.Font.Style := [fsBold];
      rpBalPatGrpDBText4.Font.Style := [fsBold];
      rpBalPatGrpDBText5.Font.Style := [fsBold];
      rpBalPatGrpDBText6.Font.Style := [fsBold];
      rpBalPatGrpDBText7.Font.Style := [fsBold];
      rpBalPatGrpDBText8.Font.Style := [fsBold];
      rpBalPatGrpDBText9.Font.Style := [fsBold];
      rpBalPatGrpDBText10.Font.Style := [fsBold];
   end else
   begin
      rpResumoSaldosGrpDBText1.Font.Style := [];
      rpBalPatGrpDBText2.Font.Style := [];
      rpBalPatGrpDBText3.Font.Style := [];
      rpBalPatGrpDBText4.Font.Style := [];
      rpBalPatGrpDBText5.Font.Style := [];
      rpBalPatGrpDBText6.Font.Style := [];
      rpBalPatGrpDBText7.Font.Style := [];
      rpBalPatGrpDBText8.Font.Style := [];
      rpBalPatGrpDBText9.Font.Style := [];
      rpBalPatGrpDBText10.Font.Style := [];
   end;
end;

function TRptCAFResumoSaldosGrp.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.2f',[fNum]));
end;

end.
