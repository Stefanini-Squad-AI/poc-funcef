{-----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Histórico de alterações -------------------------------------------------------------
Rotina......:
Nº SIG......: 62683
Data........: 02/03/2018
Responsável.: Darivaldo Alencar
Descrição...: Criação deste fonte para anexos de email personalizados excel
-----------------------------------------------------------------------------------------------------------------------------------}

unit uCtrlSendMail;
interface
uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     IdSMTP, IdMessage, uCtrlMensagemCM, DBClient,
     Classes, Graphics, Controls,   Db, DBTables,uSistema,
     Wwquery,IniFiles;
Type
  TCtrlSendMail = class(TCmControlObject)
  private
  public
    cdsExport: TClientDataSet;
    sNmRelatorio: String ;
    procedure GravacaoPersonalizada( s : String );
    Function PersonalizaCabecalho(Indice: Integer): String;
end;

implementation

procedure TCtrlSendMail.GravacaoPersonalizada( s : String );
var
  i: integer;
  sCabecalho,
  sRodape,
  sLinha,
  sMemo: String;
  sRelatorio : TStringlist;
  ArquivoINI: TIniFile;

Function ExisteArquivoIni: Boolean;
begin
  result:= FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\DESTACAMENTO.INI');
end;

Function GetCabecalho: String;
var x,TotalLinhas: Integer;
begin
  if ExisteArquivoIni then
   begin
       TotalLinhas:= StrToInt(ArquivoINI.ReadString('CONFIGURACAO', 'TOTALLINHASCABECALHO',''));
       for x:= 0 to TotalLinhas do
         result:= result + ArquivoINI.ReadString('CONFIGURACAO', 'CABECALHO'+ IntToStr(x) , '') + #13#10;
   end
  else
    result:=  'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS' + #13#10 +
              'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e 13 Andares'+ #13#10 +
              'Brasília  DF CEP 70.712-900-000 - (061)3329-1700 - www.funcef.com.br'+ #13#10 +
              'Destacamentos'+ #13#10
end;

Function GetRodape: String;
var x, TotalLinhas: Integer;
begin
   if ExisteArquivoIni then
     begin
       TotalLinhas:= StrToInt(ArquivoINI.ReadString('CONFIGURACAO', 'TOTALLINHASRODAPE',''));
       result:= #13#10;
       for x:= 0 to TotalLinhas do
           result:=  result + ArquivoINI.ReadString('CONFIGURACAO', 'RODAPE' + IntToStr(x), '') + #13#10 ;
     end
   else
      result:= #13#10+'DA - Partida no dia anterior'+ #13#10 +
               'DP - Retorno no dia posterior'+ #13#10 +
               'Obs.: No campo "Destino" está sendo considerado o percurso de ida, porém quando  a ida'+ #13#10 +
               'e a volta são no mesmo dia, o trecho apresentado é do percurso todo';
end;

begin
   try
     sRelatorio := TStringlist.create;
     if ExisteArquivoIni then
        ArquivoINI := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\DESTACAMENTO.INI');

     //Cabeçalho do Relatorio
     sCabecalho:= GetCabecalho;
     sRelatorio.add(sCabecalho);

     //Cabeçalho das colunas
     sLinha:= EmptyStr;
     for i := 0 to cdsExport.fieldcount -1 do
        sLinha:=  sLinha + PersonalizaCabecalho(i) + ';';
     sRelatorio.add(sLinha);

     //Corpo do arquivo
     cdsExport.First;
     while not(cdsExport.Eof) do
       begin
          sLinha:= EmptyStr;
          for i:= 0 to cdsExport.fieldcount -1 do
            begin
              if (cdsExport.Fields[i].DataType <> ftMemo) then
                 sLinha:=  sLinha + cdsExport.fields[i].AsString + ';'
              else begin
                 sMemo:= stringreplace(cdsExport.Fields[i].AsString, #13#10, ' ', [rfReplaceAll, rfIgnoreCase]);
                 sMemo:= stringreplace(sMemo, ';', ' - ', [rfReplaceAll, rfIgnoreCase]);
                 sLinha := sLinha + sMemo + ';';
              end;
            end;
          sRelatorio.add(sLinha);
          cdsExport.next;
       end;

     //Rodapé
     sRodape := GetRodape;
     sRelatorio.add(sRodape);

     sRelatorio.SaveToFile(s);
   finally
     FreeAndNil(ArquivoINI);
     FreeAndNil(sRelatorio);
   end;
end;

Function TCtrlSendMail.PersonalizaCabecalho(Indice: Integer): String;
var
   i: Integer;
begin
    if (sNmRelatorio = 'DESTACAMENTOS') then
     begin
       if (upperCase(cdsExport.fields[Indice].FieldName) = 'NUMERO_INTERNO') then
          result:= 'Nº INTERNO'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'MATRICULA') then
          result:= 'MATR.'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'LOTACAO') then
          result:= 'LOTAÇÃO'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'DT_VENC_AP') then
          result:= 'DT VENC. AP'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'PART_DIA_ANT') then
          result:= 'DA'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'RET_DIA_POST') then
          result:= 'DP'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'OBJETIVO_PRINCIPAL') then
          result:= 'OBJ. PRINCIPAL'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'VALOR_TAXI') then
          result:= 'TÁXI'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'VALOR_DIARIA') then
          result:= 'DIÁRIA'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'VALOR_TRANPORTE') then
          result:= 'TRANSP.'
       else if (upperCase(cdsExport.fields[Indice].FieldName) = 'TOTAL_ADIANTEMENTO') then
          result:= 'TOTAL ADIANT.'
       else
         result:= upperCase(stringreplace(cdsExport.fields[Indice].FieldName, '_', ' ', [rfReplaceAll, rfIgnoreCase]));
     end
   else result:= upperCase(cdsExport.fields[Indice].FieldName)
end;

end.
 