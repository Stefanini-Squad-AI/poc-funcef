unit uGeralFinanc;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
  uCMTypes;

type
   TGeralFinanc = Class(TCmControlObject)

   private


   public

      constructor Create; override;
      destructor Destroy; override;

      function ConvNumOracle(rValor: Double): String;
      function TestaCotacaoMoeda(rCodMoeda: Double; dDataLanc: TDateTime; bExato: Boolean;
               var rValorCota: Double):Boolean;

      function TestaPortadorAtivo(rIDPessoa, rCodPortador: Double; var rMoeCodigo: Double): Boolean;
      function BuscaDadosConta(sConta: String; rPlano: Double; bAceitaCtaSin: Boolean;
                               var sDescConta, sSubConta: String; var bObrigaCCusto: Boolean): Boolean;
      procedure ArrumaHistorico(sHistorico:String;var sHist1,sHist2,sHist3,sHist4,sHist5:String);

      function Replicate(sPadrao: String; iNumVezes: Integer): String;
      function SubstSimbMonet(sTexto: String): String;


   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TGeralFinanc }




constructor TGeralFinanc.Create;
begin
   inherited;
end;



destructor TGeralFinanc.Destroy;
begin
   inherited;
end;



procedure TGeralFinanc.DoChangeDataBase;
begin
   inherited;
end;



function TGeralFinanc.ConvNumOracle(rValor: Double): String;
var
   cNotacao : Char;
begin
   cNotacao:=DecimalSeparator;
   DecimalSeparator:='.';
   Result:=FloatToStr(rValor);
   DecimalSeparator:=cNotacao;
end;



function TGeralFinanc.TestaCotacaoMoeda(rCodMoeda: Double;
  dDataLanc: TDateTime; bExato: Boolean; var rValorCota: Double):Boolean;
var
   sSql: String;
   cdsCotacaoMoeda: TCMClientDataSet;
begin
   try
      cdsCotacaoMoeda:=TCMClientDataSet.Create(nil);
      try
         sSql:='SELECT C.COTDATA,'+
               '   M.MOECODIGO, '+
               '   C.COTVALOR, '+
               '   M.MOEDESC, '+
               '   M.MOESIGLA '+
               'FROM '+
               '   COTACAOMOEDA C, '+
               '   MOEDA M '+
               'WHERE '+
               '   (M.MOECODIGO = C.MOECODIGO(+)) AND '+
               '   (M.MOECODIGO = '+FloatToStr(rCodMoeda)+') AND ';

         if bExato then
            sSql:=sSql+
                  '   (TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataLanc)+''',''dd/mm/yyyy'') >= '+
                  '    C.COTDATA) AND '+
                  '   (TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataLanc)+''',''dd/mm/yyyy'') <= '+
                  '    DECODE(C.COTDATAFIM,NULL,C.COTDATA,C.COTDATAFIM)) '
         else
            sSql:=sSql+
                  '   (C.COTDATA <= TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',dDataLanc)+''',''dd/mm/yyyy'')) '+
                  'ORDER BY C.COTDATA DESC ';

         cdsCotacaoMoeda.Data:=GetDataPacket(sSql);
         cdsCotacaoMoeda.First;

         Result:=True;
         if cdsCotacaoMoeda.IsEmpty then
          begin
             Result:=False;
             rValorCota:=0;
             MessageInfo:='Moeda não Cadastrada';
          end;

         if Result then
          begin
             if cdsCotacaoMoeda.FieldByName('COTVALOR').IsNull then
              begin
                 Result:=False;
                 rValorCota:=0;
                 if bExato then
                    MessageInfo:='Não existe cotação cadastrada para a Moeda '+
                                 cdsCotacaoMoeda.FieldByName('MOEDESC').AsString+
                                 ' no dia '+FormatDateTime('dd/mm/yyyy',dDataLanc)+
                                 '. Verifique.'
                 else
                    MessageInfo:='Não existe cotação cadastrada para a Moeda '+
                                 cdsCotacaoMoeda.FieldByName('MOEDESC').AsString+
                                ' anterior ao dia '+FormatDateTime('dd/mm/yyyy',dDataLanc)+
                                '. Verifique.';
              end
             else
              rValorCota:=cdsCotacaoMoeda.FieldByName('COTVALOR').AsFloat;
          end;

      finally
         cdsCotacaoMoeda.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
         cdsCotacaoMoeda.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;



function TGeralFinanc.TestaPortadorAtivo(rIDPessoa, rCodPortador: Double;
  var rMoeCodigo: Double): Boolean;
var
   cdsAux : TCMClientDataSet;
begin
   Result:=True;
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.TestaPortadorAtivo(rIDPessoa, rCodPortador, rMoeCodigo);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       cdsAux:=TCMClientDataSet.Create(nil);
       try
          cdsAux.Data:=GetDataPacket('SELECT '+
                                     '   CODPORTADOR, '+
                                     '   MOECODIGO, '+
                                     '   DESCRICAO, '+
                                     '   NOCONTACORR, '+
                                     '   FLGSTATUS '+
                                     'FROM PORTADORCONTA '+
                                     'WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                                     '      (CODPORTADOR = '+FloatToStr(rCodPortador)+') ');

          //Verifica se Portador Conta Está Inativo
          if cdsAux.FieldByName('FLGSTATUS').AsString = 'I' then
           begin
              Result:=False;
              MessageInfo:='Portador Inativo';
              rMoeCodigo:=0;
           end
          else
            rMoeCodigo:=cdsAux.FieldByName('MOECODIGO').AsFloat;

       finally
          cdsAux.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
          cdsAux.Free;
       end;
    end;
end;



function TGeralFinanc.BuscaDadosConta(sConta: String; rPlano: Double;
  bAceitaCtaSin: Boolean; var sDescConta, sSubConta: String;
  var bObrigaCCusto: Boolean): Boolean;
var
   cdsAux : TCMClientDataSet;
begin
   Result:=True;
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.BuscaDadosConta(sConta, rPlano, bAceitaCtaSin,
                                                    sDescConta, sSubConta, bObrigaCCusto);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       cdsAux:=TCMClientDataSet.Create(nil);
       try
          cdsAux.Data:=GetDataPacket('SELECT PLATIPO,PLANOME,PLACCUST,PLASUBCONTA '+
                                     'FROM PLANOCONTA '+
                                     'WHERE (PLANO = '+FloatToStr(rPlano)+') AND '+
                                     '      (PLAINATIVA = ''A'') AND '+
                                     '      (PLACONTA = '''+sConta+''') ');
          sDescConta:='';
          sSubConta:='';
          bObrigaCCusto:=False;

          if cdsAux.IsEmpty then
           begin
              Result:=False;
              MessageInfo:='Conta Contábil '+sConta+' Não Cadastrada. Verifique.';
              Exit;
           end;

          if (cdsAux.FieldByName('PLATIPO').AsString<>'A') and not(bAceitaCtaSin) then
           begin
              Result:=False;
              MessageInfo:='Conta Contábil '+sConta+' tem que ser Analítica.';
              Exit;
           end;

          sDescConta:=cdsAux.FieldByName('PLANOME').AsString;;
          sSubConta:=cdsAux.FieldByName('PLASUBCONTA').AsString;
          bObrigaCCusto:=(cdsAux.FieldByName('PLACCUST').AsString='S');
       finally
          cdsAux.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
          cdsAux.Free;
       end;
    end;
end;



procedure TGeralFinanc.ArrumaHistorico(sHistorico: String; var sHist1,
  sHist2, sHist3, sHist4, sHist5: String);
var
   iIndice  : Integer;
   iNumCar  : Integer;
   sHistAux : array[1..5] of string;
begin
   sHistAux[1]:='';
   sHistAux[2]:='';
   sHistAux[3]:='';
   sHistAux[4]:='';
   sHistAux[5]:='';
   sHistorico:=Trim(sHistorico);
   for iIndice:=1 to 5 do
   begin
      iNumCar:=40;
      if (Length(sHistorico)<=40) then
       begin
          sHistAux[iIndice]:=sHistorico;
          Break;
       end
      else
       begin
          while (Copy(sHistorico,iNumCar,1)<>' ') and (iNumCar>1) do Dec(iNumCar);
          sHistAux[iIndice]:=Copy(sHistorico,1,iNumCar);
          sHistorico:=Copy(sHistorico,iNumCar+1,(Length(sHistorico)-iNumCar));
       end;
   end;
   sHist1:=sHistAux[1];
   sHist2:=sHistAux[2];
   sHist3:=sHistAux[3];
   sHist4:=sHistAux[4];
   sHist5:=sHistAux[5];
end;



function TGeralFinanc.Replicate(sPadrao: String; iNumVezes: Integer): String;
var
   iRepete : Integer;
begin
   Result:='';
   if (Trim(sPadrao)='') and (iNumVezes<=0) then Exit;
   for iRepete:=1 to iNumVezes do Result:=Result+sPadrao;
end;



function TGeralFinanc.SubstSimbMonet(sTexto: String): String;
var
   bNegativo : Boolean;
begin
   bNegativo:=False;
   Result:=Trim(sTexto);
   if Result='' then
      Result:='0'
   else
    begin
       while (Pos('(',Result)<>0) do
       begin
          bNegativo:=True;
          Result:=Copy(Result,1,Pos('(',Result)-1)+
                  Copy(Result,Pos('(',Result)+1,Length(Result)-Pos('(',Result));
       end;

       while (Pos('.',Result)<>0) do
          Result:=Copy(Result,1,Pos('.',Result)-1)+
                  Copy(Result,Pos('.',Result)+1,Length(Result)-Pos('.',Result));

       while (Pos(')',Result)<>0) do
          Result:=Copy(Result,1,Pos(')',Result)-1)+
                  Copy(Result,Pos(')',Result)+1,Length(Result)-Pos(')',Result));
    end;
    if bNegativo then Result:='-'+Result;
end;



end.
