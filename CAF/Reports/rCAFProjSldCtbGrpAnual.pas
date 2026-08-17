unit rCAFProjSldCtbGrpAnual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, IvDictio, IvMulti, uCmRptManager, TXComp, 
  CmParamReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, uCMFileUtils,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DB,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlPadroes, uCtrlParamCAF, uCtrlFechamentoProRata;

type
  TrptCAFProjSldCtbGrpAnual = class(TFrmCmReport)
    sqlProjSldCtbGrpAnual: TCMSqlParams;
    cdsProjSldCtbGrpAnual: TCMClientDataSet;
    dsProjSldCtbGrpAnual: TwwDataSource;
    ppProjSldCtbGrpAnual: TppBDEPipeline;
    rpProjSldCtbGrpAnual: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    lblTipoGrupo: TppLabel;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppDBText50: TppDBText;
    ppDBText2: TppDBText;
    ppDBText12: TppDBText;
    ppDBText19: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    ppDBText4: TppDBText;
    rbdbeClasse: TppDBText;
    ppDBText6: TppDBText;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    cdsProjSaldo: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    ProRata  : TCtrlFechamentoProRata;
    //------------------------------------------------------------------------------------ 
    sTipoGrupo, sClasseGrupo : String;
    bInvestImob   : Boolean;
    sMascaraGrupo : String;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  rptCAFProjSldCtbGrpAnual: TrptCAFProjSldCtbGrpAnual;

implementation

{$R *.dfm}

function TrptCAFProjSldCtbGrpAnual.ConvNum(fNum: Extended): Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TrptCAFProjSldCtbGrpAnual.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAux : Integer;

begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   try
      ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
      //----------------------------------------------------------------------------------
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
      CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
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
      CmpRptCM.ParamValues[4].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO ' +
                                                         ' FROM GRUPO G, ' +
                                                         '      PLANOGRUPO PG ' +
                                                         ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND G.TIPO = ''A'' ' +
                                                         '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                         ' ORDER BY G.CLASSE ';
   finally
      ParamCAF.Free;
   end;
end;

procedure TrptCAFProjSldCtbGrpAnual.CrmRptCMBeforePrint(Sender: TObject);
var
   iTam              : Integer;
   nValOrg, nCmBem,
   nDepLanc, nCmDep,
   nValCtb           : Currency;
   iAno, iAnos, iAnoIni,
   iAnoIni9, iAnoFim9,
   iMesIni, iDiaIni  : Word;
   sClasse9, sGrupo  : String;
   fGrupo            : Extended;
   dDataSld9         : TDateTime;
begin
   inherited;
   ProRata := TCtrlFechamentoProRata.Create(Nil);
   ProRata.InitializeAs(Padroes);
   try
      try
         Screen.Cursor := crSQLWait;
         //-------------------------------------------------------------------------------
         // Leitura do Ano Inicial
         //-------------------------------------------------------------------------------
         DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAnoIni, iMesIni, iDiaIni);
         //-------------------------------------------------------------------------------
         // Ajuste dos Parâmetros
         //-------------------------------------------------------------------------------
         iAnos := CmpRptCM.ParamValues[1].AsInteger;
         if EncodeDate(iAnoIni, 12, 31) = CmpRptCM.ParamValues[0].AsDateTime then
            iAnoIni9 := iAnoIni + 1
         else
            iAnoIni9 := iAnoIni;
         iAnoFim9 := iAnoIni9 + (iAnos - 1);
         dDataSld9 := EncodeDate(iAnoFim9, 12, 31);
         //-------------------------------------------------------------------------------
         // Processa o Filtro de Grupo
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[4].AsInteger <> 0 then
         begin
            if sTipoGrupo = 'S' then
            begin
               sGrupo := sClasseGrupo;
               fGrupo := 0;
            end else
            begin
               sGrupo := '';
               fGrupo := CmpRptCM.ParamValues[4].AsFloat;
            end;
         end else
         begin
            sGrupo := '';
            fGrupo := 0;
         end;
         //-------------------------------------------------------------------------------
         // Acumula os dados para os Grupos Analiticos
         //-------------------------------------------------------------------------------
         if not ProRata.ExecutarProjecaoGrupo(CrmRptCM.IdModulo, CrmRptCM.IdEmpresa,
                                              CmpRptCM.ParamValues[2].AsInteger,
                                              CmpRptCM.ParamValues[3].AsInteger,
                                              dDataSld9,
                                              iAnoIni9, iAnos,
                                              fGrupo, sGrupo, CmpRptCM.ParamValues[5].AsInteger) then
            Raise Exception.Create(ProRata.MessageInfo);
         //-------------------------------------------------------------------------------
         // Carrega os dados calculados
         //-------------------------------------------------------------------------------
         cdsProjSaldo.Data := ProRata.cdsProjSaldo.Data;
         cdsProjSaldo.IndexFieldNames := 'CLASSE;ANO';
         cdsProjSaldo.First;
         //-------------------------------------------------------------------------------
         // Calcula os Grupos Sintéticos
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Close;
         if CmpRptCM.ParamValues[5].AsInteger = 0 then
         begin
            sqlGrpSinteticos.SQL.Strings[7] := ' AND G.FLGIMOVEL = 0 ';
            lblTipoGrupo.Caption := ' Imobilizado ';
         end else
         if CmpRptCM.ParamValues[5].AsInteger = 1 then
         begin
            sqlGrpSinteticos.SQL.Strings[7] := ' AND G.FLGIMOVEL = 1 ';
            lblTipoGrupo.Caption := ' Investimentos Imobiliários ';
         end else
         begin
            sqlGrpSinteticos.SQL.Strings[7] := ' ';
            lblTipoGrupo.Caption := ' ';
         end;
         sqlGrpSinteticos.Prepare;
         sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         sqlGrpSinteticos.ParamByName('ANOINI').AsInteger := iAnoIni9;
         sqlGrpSinteticos.ParamByName('ANOS').AsInteger   := iAnos;
         sqlGrpSinteticos.Open;
         //-------------------------------------------------------------------------------
         while not cdsGrpSinteticos.EOF do
         begin
            iTam := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
            nValOrg  := 0;
            nCmBem   := 0;
            nDepLanc := 0;
            nCmDep   := 0;
            nValCtb  := 0;
            //----------------------------------------------------------------------------
            iAno := cdsGrpSinteticos.FieldByName('ANO').AsInteger;
            cdsProjSaldo.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
            while not cdsProjSaldo.EOF and
                  (copy(trim(cdsProjSaldo.FieldByName('CLASSE').AsString),1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
            begin
               if cdsProjSaldo.FieldByName('ANO').AsInteger = iAno then
               begin
                  nValOrg  := ConvNum(nValOrg  + cdsProjSaldo.FieldByName('VALCUSTO').AsCurrency);
                  nCmBem   := ConvNum(nCmBem   + cdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency);
                  nDepLanc := ConvNum(nDepLanc + cdsProjSaldo.FieldByName('VALDEPREC').AsCurrency);
                  nCmDep   := ConvNum(nCmDep   + cdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency);
                  nValCtb  := ConvNum(nValCtb  + cdsProjSaldo.FieldByName('VALSALDO').AsCurrency);
               end;
               //-------------------------------------------------------------------------
               cdsProjSaldo.Next;
            end;
            //----------------------------------------------------------------------------
            if cdsProjSaldo.Locate('CLASSE;ANO',VarArrayOf([cdsGrpSinteticos.FieldByName('CLASSE').AsString, iAno]),[]) then
            begin
               cdsProjSaldo.Edit;
               cdsProjSaldo.FieldByName('VALCUSTO').AsCurrency    := nValOrg;
               cdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency  := nCmBem;
               cdsProjSaldo.FieldByName('VALDEPREC').AsCurrency   := nDepLanc;
               cdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency := nCmDep;
               cdsProjSaldo.FieldByName('VALSALDO').AsCurrency    := nValCtb;
               cdsProjSaldo.Post;
            end else
               Raise Exception.Create('Erro no processamento dos grupos sintéticos');
            //----------------------------------------------------------------------------
            cdsGrpSinteticos.Next;
         end;
         cdsGrpSinteticos.Close;
         //-------------------------------------------------------------------------------
         // Preenche o DataSet do Relatório
         //-------------------------------------------------------------------------------
         sqlProjSldCtbGrpAnual.Open;
         //-------------------------------------------------------------------------------
         cdsProjSaldo.First;
         sClasse9 := '';
         while not cdsProjSaldo.EOF do
         begin
            if (cdsProjSaldo.FieldByName('VALCUSTO').AsCurrency <> 0) or
               (cdsProjSaldo.FieldByName('VALDEPREC').AsCurrency <> 0) then
            begin
               cdsProjSldCtbGrpAnual.Append;
               if cdsProjSaldo.FieldByName('CLASSE').AsString <> sClasse9 then
               begin
                  cdsProjSldCtbGrpAnual.FieldByName('CLASSE').AsString    := cdsProjSaldo.FieldByName('CLASSE').AsString;
                  cdsProjSldCtbGrpAnual.FieldByName('DESCGRUPO').AsString := cdsProjSaldo.FieldByName('DESCGRUPO').AsString;
                  cdsProjSldCtbGrpAnual.FieldByName('S_A').AsString       := cdsProjSaldo.FieldByName('S_A').AsString;
                  sClasse9 := cdsProjSaldo.FieldByName('CLASSE').AsString;
               end;
               cdsProjSldCtbGrpAnual.FieldByName('CLASSE9').AsString       := cdsProjSaldo.FieldByName('CLASSE').AsString;
               cdsProjSldCtbGrpAnual.FieldByName('IDGRUPO').AsInteger      := cdsProjSaldo.FieldByName('IDGRUPO').AsInteger;
               cdsProjSldCtbGrpAnual.FieldByName('ANO').AsInteger          := cdsProjSaldo.FieldByName('ANO').AsInteger;
               cdsProjSldCtbGrpAnual.FieldByName('VALCUSTO').AsCurrency    := cdsProjSaldo.FieldByName('VALCUSTO').AsCurrency;
               cdsProjSldCtbGrpAnual.FieldByName('VALCMCUSTO').AsCurrency  := cdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency;
               cdsProjSldCtbGrpAnual.FieldByName('VALDEPREC').AsCurrency   := cdsProjSaldo.FieldByName('VALDEPREC').AsCurrency;
               cdsProjSldCtbGrpAnual.FieldByName('VALCMDEPREC').AsCurrency := cdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency;
               cdsProjSldCtbGrpAnual.FieldByName('VALSALDO').AsCurrency    := cdsProjSaldo.FieldByName('VALSALDO').AsCurrency;
               cdsProjSldCtbGrpAnual.Post;
            end;
            //----------------------------------------------------------------------------
            cdsProjSaldo.Next;
         end;
         cdsProjSaldo.Close;
         //-------------------------------------------------------------------------------
         if cdsProjSldCtbGrpAnual.IsEmpty then
            Raise Exception.Create('Não existem dados com os Parâmetros Fornecidos!');
         //-------------------------------------------------------------------------------
         rbdbeClasse.DisplayFormat := sMascaraGrupo;
      except
         on E : Exception Do
         begin
            CMDebugToFile('PROJEÇÃO DE SALDO CONTÁBIL POR GRUPO - ANUAL : ' + E.Message);
         end;
      end;
   finally
      ProRata.Free;
   end;
end;

procedure TrptCAFProjSldCtbGrpAnual.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
   inherited;
   if Index = 4 then
   begin
      sTipoGrupo := Sender.CdsDisplay.FieldByName('TIPO').AsString;
      sClasseGrupo := trim(Sender.CdsDisplay.FieldByName('CLASSE').AsString);
   end;
   // Sender.CtrlLookup.Text;
end;

function TrptCAFProjSldCtbGrpAnual.DataUltFechamento : String;
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
