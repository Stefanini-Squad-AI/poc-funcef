unit rCAFCadBemImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  rCAFCadBem, MontaSelect, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager,
  TXComp, CmParamReport, TXRB;

type
  TRptCAFCadBemImob = class(TRptCAFCadBem)
    ppBemppField28: TppField;
    ppBemppField29: TppField;
    ppBemppField30: TppField;
    ppBemppField31: TppField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppLine1: TppLine;
    ppLine6: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    sMascaraGrupo,
    sMascaraPlaca,
    sMascaraEmpresa : String;
    iMoedaOficial   : Integer;
    bInvestImob     : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFCadBemImob: TRptCAFCadBemImob;

implementation

{$R *.DFM}



procedure TRptCAFCadBemImob.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux : Integer;
begin
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
         if CmpRptCM.ParamByName('TIPOIMOVEL').AsString <> '' then
         begin
            SQL.Strings[69] := '   AND T.CODTIPIMOVEL = ' + QuotedStr(CmpRptCM.ParamByName('TIPOIMOVEL').AsString);
         end else
         begin
            SQL.Strings[69] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('IMOVELMESTRE').AsInteger <> 0 then
         begin
            SQL.Strings[70] := '   AND I.IDIMOVELMESTRE = ' + CmpRptCM.ParamByName('IMOVELMESTRE').AsString;
         end else
         begin
            SQL.Strings[70] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('IMOVEL').AsInteger <> 0 then
         begin
            SQL.Strings[71] := '   AND I.IDIMOVEL = ' + CmpRptCM.ParamByName('IMOVEL').AsString;
         end else
         begin
            SQL.Strings[71] := ' ';
         end;
         //-------------------------------------------------------------------------------

         //-------------------------------------------------------------------------------
         Prepare;
         ParamByName('DATASLD').AsDate := CmpRptCM.ParamByName('DATAMOVIM').AsDateTime;
         ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         ParamByName('MOECODIGO').AsInteger := iMoedaOficial;  // Real
         ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
      end;
      //----------------------------------------------------------------------------------
      rpBemCalc1.DisplayFormat := sMascaraPlaca;
      rpBemCabec.Caption := 'Cadastro de Bens em ' + CmpRptCM.ParamByName('DATAMOVIM').AsString;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlBem.Open;
      Screen.Cursor := crDefault;
  except

     On E : Exception Do
     begin
     end;
  end;
end;


procedure TRptCAFCadBemImob.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   CmpRptCM.ParamByName('GRUPO').LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamByName('LOCALIZACAO').LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND INATIVO = 0 ' +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamByName('CONJUNTO').LookupSettings.SQL.Text := ' SELECT DESCCONJUNTO, IDCONJUNTO '+
                                                      ' FROM CONJUNTO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND INATIVO = 0 ' +
                                                      ' ORDER BY DESCCONJUNTO ';

   CmpRptCM.ParamByName('DATAMOVIM').TextDefault := DataUltFechamento;
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));

end;


function TRptCAFCadBemImob.DataUltFechamento: String;
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






