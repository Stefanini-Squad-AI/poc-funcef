unit rCAFCadBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti,
  MontaSelect, TXRB;

type
  TRptCAFCadBem = class(TFrmCmReport)
    dsBem: TwwDataSource;
    ppBem: TppBDEPipeline;
    rpBem: TppReport;
    ppHeaderBand1: TppHeaderBand;
    rpBemCabec: TppLabel;
    LblEmpresa: TppLabel;
    rpBemLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    rpBemLabel1: TppLabel;
    rpBemLabel2: TppLabel;
    rpBemDBText2: TppDBText;
    rpBemLabel3: TppLabel;
    rpBemDBText3: TppDBText;
    rpBemLabel4: TppLabel;
    rpBemDBText4: TppDBText;
    rpBemLabel5: TppLabel;
    rpBemDBText5: TppDBText;
    rpBemLabel6: TppLabel;
    rpBemDBText6: TppDBText;
    rpBemLabel7: TppLabel;
    rpBemLabel8: TppLabel;
    rpBemDBText7: TppDBText;
    rpBemLabel9: TppLabel;
    rpBemDBText8: TppDBText;
    rpBemLabel10: TppLabel;
    rpBemDBText9: TppDBText;
    rpBemDBText10: TppDBText;
    rpBemDBText11: TppDBText;
    rpBemLabel11: TppLabel;
    rpBemLabel12: TppLabel;
    rpBemDBText12: TppDBText;
    rpBemLabel13: TppLabel;
    rpBemDBText13: TppDBText;
    rpBemLabel14: TppLabel;
    rpBemLabel15: TppLabel;
    rpBemLabel16: TppLabel;
    rpBemLabel17: TppLabel;
    rpBemLabel18: TppLabel;
    rpBemDBText14: TppDBText;
    rpBemDBText15: TppDBText;
    rpBemDBText16: TppDBText;
    rpBemDBText17: TppDBText;
    rpBemDBText18: TppDBText;
    rpBemLabel19: TppLabel;
    rpBemDBText19: TppDBText;
    rpBemLabel20: TppLabel;
    rpBemLabel21: TppLabel;
    rpBemDBText20: TppDBText;
    rpBemLabel22: TppLabel;
    rpBemLabel23: TppLabel;
    rpBemLine2: TppLine;
    rpBemLine1: TppLine;
    rpBemCalc1: TppVariable;
    rpBemDataBaixa: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    cdsBem: TCMClientDataSet;
    sqlBem: TCMSqlParams;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    MSBem: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpBemCalc1Print(Sender: TObject);
    procedure rpBemLabel23Print(Sender: TObject);
  private
    sMascaraGrupo,
    sMascaraPlaca,
    sMascaraEmpresa : String;
    iMoedaOficial   : Integer;
    bInvestImob     : Boolean;
    function DataUltFechamento : String;
  public

  end;

var
  RptCAFCadBem: TRptCAFCadBem;

implementation

{$R *.DFM}

procedure TRptCAFCadBem.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Captura as Mascaras
      //----------------------------------------------------------------------------------
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
         //-------------------------------------------------------------------------------
         bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
         //-------------------------------------------------------------------------------
         sMascaraEmpresa := '';
         for iAux := 1 to length(trim(Floattostr(CrmRptCM.IdEmpresa))) do
         begin
            sMascaraEmpresa := sMascaraEmpresa + '#';
         end;
         //-------------------------------------------------------------------------------
         sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString);
         iAux := 1;
         while iAux <= length(sMascaraGrupo) do
         begin
            if sMascaraGrupo[iAux] = '9' then
               sMascaraGrupo[iAux] := '#';
            iAux := iAux + 1;
         end;
         //-------------------------------------------------------------------------------
         if cdsParamCaf.FieldByName('SEQBEMEMP').AsFloat = 0 then
         begin
            sMascaraPlaca := sMascaraEmpresa + '.#########;0; ';
         end else
         begin
            sMascaraPlaca := sMascaraGrupo   + '.#######;0; '
         end;
      end;
      //----------------------------------------------------------------------------------
      // Processa os Filtros
      //----------------------------------------------------------------------------------
      with sqlBem do
      begin
         if CmpRptCM.ParamByName('CONTROLE').AsString = 'Total' then
         begin
            SQL.Strings[59] := '   AND B.CONTROLE = ' + #39 + 'T' + #39;
         end else
         if CmpRptCM.ParamByName('CONTROLE').AsString = 'Físico' then
         begin
            SQL.Strings[59] := '   AND B.CONTROLE = ' + #39 + 'F' + #39;
         end else
         begin
            SQL.Strings[59] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('GRUPO').AsInteger <> 0 then
         begin
            SQL.Strings[60] := '   AND B.IDGRUPO = ' + inttostr(CmpRptCM.ParamByName('GRUPO').AsInteger);
         end else
         begin
            SQL.Strings[60] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('CLASSE').AsInteger <> 0 then
         begin
            SQL.Strings[61] := '   AND B.IDCLASSEBEM = ' + inttostr(CmpRptCM.ParamByName('CLASSE').AsInteger);
         end else
         begin
            SQL.Strings[61] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('LOCALIZACAO').AsInteger <> 0 then
         begin
            SQL.Strings[62] := '   AND C.IDLOCALIZACAO = ' + inttostr(CmpRptCM.ParamByName('LOCALIZACAO').AsInteger);
         end else
         begin
            SQL.Strings[62] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('RESPONSAVEL').AsInteger <> 0 then
         begin
            SQL.Strings[63] := '   AND C.IDRESPONSAVEL = ' + inttostr(CmpRptCM.ParamByName('RESPONSAVEL').AsInteger);
         end else
         begin
            SQL.Strings[63] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('CONJUNTO').AsInteger <> 0 then
         begin
            SQL.Strings[64] := '   AND B.IDCONJUNTO = ' + inttostr(CmpRptCM.ParamByName('CONJUNTO').AsInteger);
         end else
         begin
            SQL.Strings[64] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('DATAINI').AsString <> '' then
         begin
            SQL.Strings[65] := '   AND B.DTAINCLUSAO >= TO_DATE(' + #39 + CmpRptCM.ParamByName('DATAINI').AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')';
         end else
         begin
            SQL.Strings[65] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('DATAFIM').AsString <> '' then
         begin
            SQL.Strings[66] := '   AND B.DTAINCLUSAO <= TO_DATE(' + #39 + CmpRptCM.ParamByName('DATAFIM').AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')';
         end else
         begin
            SQL.Strings[66] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('BAIXADOS').AsInteger = 0 then
         begin
            SQL.Strings[67] := '   AND B.BAIXATOTAL <> '+#39+'S'+#39;
         end else
         if CmpRptCM.ParamByName('BAIXADOS').AsInteger = 1 then
         begin
            SQL.Strings[67] := '   AND B.BAIXATOTAL = '+#39+'S'+#39;
         end else
         if CmpRptCM.ParamByName('BAIXADOS').AsInteger = 2 then
         begin
            SQL.Strings[67] := ' ';
         end else
         begin
            SQL.Strings[67] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('PLACA').AsFloat > 0 then
         begin
            SQL.Strings[43] := '   AND IDBEM = ' + MSBem.ValoresChave[1];
            SQL.Strings[49] := '   AND SCB1.IDBEM = ' + MSBem.ValoresChave[1];
            SQL.Strings[68] := '   AND B.IDBEM = ' + MSBem.ValoresChave[1];
         end else
         begin
            SQL.Strings[43] := ' ';
            SQL.Strings[49] := ' ';
            SQL.Strings[68] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 0 then
         begin
            SQL.Strings[85] := ' ORDER BY B.DESBEM ';
         end else
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 1 then
         begin
            SQL.Strings[85] := ' ORDER BY B.PLACA ';
         end else
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 2 then
         begin
            SQL.Strings[85] := ' ORDER BY G.NOME ';
         end else
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 3 then
         begin
            SQL.Strings[85] := ' ORDER BY PR.NOME ';
         end else
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 4 then
         begin
            SQL.Strings[85] := ' ORDER BY L.NOME ';
         end else
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 5 then
         begin
            SQL.Strings[85] := ' ORDER BY B.IDCONJUNTO ';
         end else
         begin
            SQL.Strings[85] := ' ORDER BY G.NOME ';
         end;
         //-------------------------------------------------------------------------------
         Prepare;
         ParamByName('DATASLD').AsDate := CmpRptCM.ParamByName('DATAMOVIM').AsDateTime;
         ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         ParamByName('MOECODIGO').AsInteger := iMoedaOficial;  // Real
         ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
      end;
      //----------------------------------------------------------------------------------
      rpBemCalc1.DisplayFormat := sMascaraPlaca;
      rpBemCabec.Caption := 'Cadastro de Bens em ' + CmpRptCM.ParamValues[9].AsString;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlBem.Open;
      Screen.Cursor := crDefault;
  except
     On E : Exception Do
     begin
        CMDebugToFile('CADASTRO DE BENS : ' + E.Message);
     end;
  end;
end;

procedure TRptCAFCadBem.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND INATIVO = 0 ' +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text := ' SELECT DESCCONJUNTO, IDCONJUNTO '+
                                                      ' FROM CONJUNTO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND INATIVO = 0 ' +
                                                      ' ORDER BY DESCCONJUNTO ';
   CmpRptCM.ParamValues[9].TextDefault := DataUltFechamento;
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
end;

function TRptCAFCadBem.DataUltFechamento : String;
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

procedure TRptCAFCadBem.rpBemCalc1Print(Sender: TObject);
begin
   inherited;
   rpBemCalc1.Text := cdsBem.FieldByName('PLACA').AsString;
end;

procedure TRptCAFCadBem.rpBemLabel23Print(Sender: TObject);
begin
   inherited;
   if cdsBem.FieldByName('CONTROLE').AsString = 'T' then
   begin
      rpBemLabel23.Caption := 'Total';
   end else
   begin
      rpBemLabel23.Caption := 'Físico';
   end;
end;

end.
