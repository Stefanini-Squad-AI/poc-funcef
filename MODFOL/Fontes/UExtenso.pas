unit uExtenso;

interface

uses dbTables, SysUtils, Dialogs, Forms;

type
  TExtenso = class
  private
    function ExtaiInteiro(Valor:Real):Real;
  public
    function PorExtenso( aValor :Real; sDbase :String ):String;
    function PorExtensoII( aValor :Real ):String;
    Function CompletaExtenso(sValor, sCaracter:string; iTamanho:Integer):String;
    Procedure ArrumaExtensoCheque(sExtenso:String;iLength: Integer;var sExtenso1,sExtenso2:String);
  end;

Var
  Extenso: TExtenso;

implementation

Function TExtenso.CompletaExtenso(sValor, sCaracter:string; iTamanho:Integer):String;
var
  temp :string;
  cont, Tam :Integer;
Begin
  temp := Trim(sValor);

  Tam := length(temp);

  for cont:=1 to iTamanho - Tam do
      temp:= temp + sCaracter;

  result := temp;
end;

function TExtenso.PorExtenso( aValor : Real; sdBase :String ):String;
var
   ExCentBi, ExCentMilhao, Exmilhao, ExBil, ExCentMil,
   ExMil, ExCentena, ExReais, ExCentavos, Centavos,
   Pextenso,Temp: String;
   Apontador : Integer;
   Valor : Real;
   qryEx : TQuery;
begin
   qryEx	:= TQuery.Create(Application);
   qryEx.DataBaseName	:=	sdBase;
   qryEx.SQL.Add(' SELECT DISTINCTROW PorExtenso.* ');
   qryEx.SQL.Add(' FROM PorExtenso ');
   qryEx.SQL.Add(' WHERE PorExtenso.Numero = :Numero');

   Valor := Abs(aValor);
   If Valor = 0 then
   begin
      Result := 'Sem Valor';
      Exit;
   end;
   If Valor < 0 then
   begin
      Result := 'Valor negativo no liquido a receber';
      Exit;
   End;

   Pextenso := FloatToStr(ExtaiINteiro(Valor));
   If Length(Pextenso) >= 13 then
   begin
      Beep;
      MessageDlg('O valor '+ Format('20.2D',[Valor]) +
                 ' é maior ou igual a Hum Trilhão. Este sistema não suporta valores deste tipo.',
                 mtInformation,[mbOk], 0);
      Result	:= 'Valor Muito Grande';
      Exit;
    End;

    Apontador := 0;
    If Length(Pextenso) = 1 then  {Se Nº de caracteres de Pextenso for igual a 1 entao coloca zero na frente}
       Pextenso := '0' + Pextenso;

    While Apontador <= Length(Pextenso) do
    begin
      case Apontador of
      0:
      begin    	{centavos}
      	Temp := FloatToStr(Valor - ExtaiINteiro(Valor));
        if Copy(Temp, 2,1) = DecimalSeparator  then   {',' '.'}
        begin
           CENTAVOS := Copy(Format('%.3n',[Valor - ExtaiINteiro(Valor)]), 3, 2);

           if CENTAVOS = '100' then
           begin
             CENTAVOS := '00';
             Pextenso := FloatToStr(ExtaiINteiro(Valor) + 1);
           End;

           If Length(CENTAVOS) = 1 then
              CENTAVOS	:= CENTAVOS + '0';

           qryEx.Params.ParamByName('Numero').AsString := CENTAVOS;
           qryEx.Open;
           ExCentavos := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('CENTAVOS').AsString;
           qryEx.Close;
        end;

        Apontador := 2;

        If Pextenso = '00' Then {Para nao colocar real zero}
           Apontador := 3;
      end;
      2:
      begin  		{Reais}
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso)-1,2 );
         qryEx.Open;
         If Temp = '0' then  		{Se não existir centavos então}
            ExReais := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('REAIS1').AsString
         else
            If ( Temp <> '0') and ( Copy(Pextenso,Length(Pextenso)-1,2 ) = '00') Then {Se existir centavos e reais for igual a 00}
               	ExReais := qryEx.FieldByName('extenso').AsString
            else
            	ExReais := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('REAIS2').AsString;
         qryEx.Close;
         Apontador := 3;
      end;
      3:
      begin  		{Centenas de Real}
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador + 1, 1);
         qryEx.Open;
         If ( Copy(Pextenso,Length(Pextenso)-1,2) = '00' ) and ( Temp = '0' ) then 	{Se Reais For igual a 00}
            ExCentena := qryEx.FieldByName('centenas1').AsString
         else
            If ( Copy(Pextenso,Length(Pextenso)-1,2) = '00') and ( Temp <>  '0' ) then
               	ExCentena := qryEx.FieldByName('centenas1').AsString + qryEx.FieldByName('Reais2').AsString
            else
            	ExCentena := qryEx.FieldByName('centenas2').AsString + ' ';
         qryEx.Close;
         Apontador := 4;
      end;
      4:
      begin  		{mil}
         If Length(Pextenso) = 4 then 		{Se pextenso = 4 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador, 2);
         qryEx.Open;
         If (Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1) = '0') and (Copy(Pextenso, Length(Pextenso)-1, 2) = '00') then  {se centenas de real e reais = 0 entao}
         begin
            ExMil   := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('miles').AsString;
            ExReais := 'Reais'
         end
         else
            ExMil := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('miles').AsString;
            qryEx.Close;
            Apontador := 6;
         end;
      6:
      begin  		{Centenas de Mil}
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador + 1, 1);
         qryEx.Open;
         If ExMil = '' then 	{Se mil For nullo}
            ExCentMil := qryEx.FieldByName('centenas1').AsString + ' ' + qryEx.FieldByName('miles').AsString
         else
            ExCentMil := qryEx.FieldByName('centenas2').AsString + ' ';
         qryEx.Close;
         Apontador := 7;
      end;
      7:
      begin			{Milhão}
         If Length(Pextenso) = 7 then 		{Se pextenso = 7 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador, 2);
         qryEx.Open;
         Exmilhao    := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('milhoes').AsString;
         qryEx.Close;
         Apontador   := 9;
      end;
      9:
      begin 		{centenas de Milhao}
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador + 1, 1);
         qryEx.Open;
         If Exmilhao = '' then 	{Se milhao For nullo}
            ExCentMilhao := qryEx.FieldByName('centenas1').AsString + ' ' + qryEx.FieldByName('milhoes').AsString
         else
            ExCentMilhao := qryEx.FieldByName('centenas2').AsString + ' ';
         qryEx.Close;
         Apontador := 10;
      end;
      10:
      begin   		{Bilhoes}
         If Length(Pextenso) = 10 	then 	{Se pextenso = 10 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador, 2);
         qryEx.Open;
         ExBil     := qryEx.FieldByName('extenso').AsString + qryEx.FieldByName('bilhao').AsString;
         qryEx.Close;
         Apontador := 12;
      end;
      12:
      begin 		{Centenas de bilhoes}
         qryEx.Params.ParamByName('Numero').AsString := Copy(Pextenso,Length(Pextenso) - Apontador + 1, 1);
         qryEx.Open;
         If ExBil = '' then 		{Se bilhao For nullo}
            ExCentBi := qryEx.FieldByName('centenas1').AsString + ' ' + qryEx.FieldByName('bilhao').AsString
         else
            ExCentBi := qryEx.FieldByName('centenas2').AsString + ' ';
         qryEx.Close;
         Apontador   := 20;
      end;
    end;
   end;
   Result := Trim(ExCentBi + ExBil + ExCentMilhao + Exmilhao + ExCentMil + ExMil + ExCentena + ExReais + ExCentavos);
end;

function TExtenso.PorExtensoII( aValor : Real ):String;
var
   N :array[0 .. 99] of String[20];
   N1:array[0 .. 9] 	of String[20];
   N2:array[0 .. 9] 	of String[20];

   Temp, Pextenso, CENTAVOS, ExCentavos , ExReais,
   ExCentena , ExMil, ExCentMil, ExBil, Exmilhao,
   ExCentMilhao, ExCentBi, ExTril, ExCentTri, Reais,
   Centreal, Mil, CentMil, Milhao, CentMilhao, Bilhoes,
   CentBilhao, Trilhoes, CentTrilhao : String;
   Valor : Real;
   Apontador : Integer;

begin
   N[0]  := ''; 					N[1]  := 'Hum'; 				N[2]  := 'Dois';
   N[10] := 'Dez'; 				N[11] := 'Onze'; 				N[12] := 'Doze';
   N[20] := 'Vinte'; 				N[21] := 'Vinte e Um'; 				N[22] := 'Vinte e Dois';
   N[30] := 'Trinta'; 				N[31] := 'Trinta e Um'; 			N[32] := 'Trinta e Dois';
   N[40] := 'Quarenta';				N[41] := 'Quarenta e Um'; 			N[42] := 'Quarenta e Dois';
   N[50] := 'Cinquenta';			        N[51] := 'Cinquenta e Um'; 		        N[52] := 'Cinquenta e Dois';
   N[60] := 'Sessenta';				N[61] := 'Sessenta e Um'; 			N[62] := 'Sessenta e Dois';
   N[70] := 'Setenta';				N[71] := 'Setenta e Um'; 			N[72] := 'Setenta e Dois';
   N[80] := 'Oitenta';				N[81] := 'Oitenta e Um'; 			N[82] := 'Oitenta e Dois';
   N[90] := 'Noventa';				N[91] := 'Noventa e Um'; 			N[92] := 'Noventa e Dois';
   N[3]  := 'Três'; 				N[4]  := 'Quatro'; 				N[5]  := 'Cinco'; 			N[6]  := 'Seis';
   N[13] := 'Treze'; 				N[14] := 'Quatorze'; 				N[15] := 'Quinze'; 			N[16] := 'Desesseis';
   N[23] := 'Vinte e Três';		        N[24] := 'Vinte e Quatro'; 		        N[25] := 'Vinte e Cinco'; 		N[26] := 'Vinte e Seis';
   N[33] := 'Trinta e Três';		        N[34] := 'Trinta e Quatro';		        N[35] := 'Trinta e Cinco'; 		N[36] := 'Trinta e Seis';
   N[43] := 'Quarenta e Três'; 	                N[44] := 'Quarenta e Quatro'; 	                N[45] := 'Quarenta e Cinco'; 		N[46] := 'Quarenta e Seis';
   N[53] := 'Cinquenta e Três'; 	                N[54] := 'Cinquenta e Quatro'; 	                N[55] := 'Cinquenta e Cinco'; 	        N[56] := 'Cinquenta e Seis';
   N[63] := 'Sessenta e Três'; 	                N[64] := 'Sessenta e Quatro'; 	                N[65] := 'Sessenta e Cinco'; 		N[66] := 'Sessenta e Seis';
   N[73] := 'Setenta e Três'; 	                N[74] := 'Setenta e Quatro'; 		        N[75] := 'Setenta e Cinco'; 		N[76] := 'Setenta e Seis';
   N[83] := 'Oitenta e Três'; 	                N[84] := 'Oitenta e Quatro'; 		        N[85] := 'Oitenta e Cinco'; 		N[86] := 'Oitenta e Seis';
   N[93] := 'Noventa e Três'; 	                N[94] := 'Noventa e Quatro'; 		        N[95] := 'Noventa e Cinco'; 		N[96] := 'Noventa e Seis';
   N[7]  := 'Sete'; 				N[8]  := 'Oito'; 				N[9]  := 'Nove';
   N[17] := 'Desessete'; 			        N[18] := 'Dezoito'; 				N[19] := 'Dezenove';
   N[27] := 'Vinte e Sete';		        N[28] := 'Vinte e Oito'; 			N[29] := 'Vinte e Nove';
   N[37] := 'Trinta e Sete';		        N[38] := 'Trinta e Oito'; 			N[39] := 'Trinta e Nove';
   N[47] := 'Quarenta e Sete'; 	                N[48] := 'Quarenta e Oito'; 		        N[49] := 'Quarenta e Nove';
   N[57] := 'Cinquenta e Sete'; 	                N[58] := 'Cinquenta e Oito'; 		        N[59] := 'Cinquenta e Nove';
   N[67] := 'Sessenta e Sete'; 	                N[68] := 'Sessenta e Oito'; 		        N[69] := 'Sessenta e Nove';
   N[77] := 'Setenta e Sete'; 	                N[78] := 'Setenta e Oito'; 		        N[79] := 'Setenta e Nove';
   N[87] := 'Oitenta e Sete'; 	                N[88] := 'Oitenta e Oito'; 		        N[89] := 'Oitenta e Nove';
   N[97] := 'Noventa e Sete'; 	                N[98] := 'Noventa e Oito'; 		        N[99] := 'Noventa e Nove';
   N1[0] := '';				        N2[0] := '';
   N1[1] := 'Cem ';			        N2[1] := 'Cento e '; 		                N1[2] := 'Duzentos '; 	 	        N2[2] := 'Duzentos e ';
   N1[3] := 'Trezentos ';	                        N2[3] := 'Trezentos e ';	                N1[4] := 'Quatrocentos ';	        N2[4] := 'Quatrocentos e ';
   N1[5] := 'Quinhentos ';                         N2[5] := 'Quinhentos e ';	                N1[6]	:= 'Seicentos ';	        N2[6] := 'Seicentos e ';
   N1[7] := 'Setecentos ';	                        N2[7] := 'Setecentos e ';	                N1[8] := 'Oitocentos ';		        N2[8] := 'Oitocentos e ';
   N1[9] := 'Novecentos ';                         N2[9] := 'Novecentos e ';


{ Ver a necessidade de formatar o valor }

   Valor := Abs(aValor);

   If Valor = 0 Then
   begin
      Result := 'Sem Valor';
      Exit;
   end;

   Pextenso  := FloatToStr(ExtaiInteiro(Valor));
   Apontador := 0;
   If Length(Pextenso) = 1 then  {Se Nº de caracteres de Pextenso for igual a 1 entao coloca zero na frente}
      Pextenso := '0' + Pextenso;

   While Apontador <= Length(Pextenso) do
   begin
      case Apontador of
      0:
      begin			{centavos}
         Temp := FloatToStr(Valor - ExtaiINteiro(Valor));
         if Copy(Temp, 2,1) = DecimalSeparator  then   {',' '.'}
         begin
           CENTAVOS := Copy(Format('%.3n',[Valor - ExtaiINteiro(Valor)]), 3, 2);

           If Length(CENTAVOS) = 1 then 	{Se centavos tiver 1 digito}
              CENTAVOS := CENTAVOS + '0';

           If CENTAVOS = '01' 	then  	{se centavos for 01}
              ExCentavos := Trim(N[StrToInt(CENTAVOS)]) + ' Centavo'
           else
              If (CENTAVOS = '00') OR (CENTAVOS = '0') Then
                  ExCentavos := ''
              Else
                  ExCentavos := Trim(N[StrToInt(CENTAVOS)]) + ' Centavos';
         end;
         Apontador := 2;
         if Pextenso = '00' 	then  	{Para nao colocar real zero}
            Apontador := 3;
      end;
      2:
      begin  		{Reais}
         Reais := Copy(Pextenso,Length(Pextenso)-1,2);
         If (Temp = '0') and (Reais <> '00') 	then  	{Se não existir centavos e reais maior que 00}
            ExReais := Trim(N[StrToInt(Reais)]) + ' Reais'
         else
            If (Temp <> '0') and (Copy(Pextenso,Length(Pextenso)-1,2) = '00') then 	{Se existir centavos e reais for igual a 00}
                ExReais := ''
            else
            	If Reais <> '00' then 		{se existir reais}
                   If (Reais = '01') And (Length(Pextenso) <= 2) then 	{se for 1 real entao}
                      ExReais := Trim(N[StrToInt(Reais)]) + ' Real e '
                   else       					{se for acima de 1 real}
                      ExReais := Trim(N[StrToInt(Reais)]) + ' Reais e ';
            if (Reais = '01') and (Length(Pextenso) = 2) and (ExCentavos = '') then 		{se real for 1 e centavos nulo}
            	ExReais := Trim(N[StrToInt(Reais)]) + ' Real';
         Apontador := 3;
      end;
      3:
      begin  		{Centenas de Real}
         Centreal := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);
         if (Copy(Pextenso,Length(Pextenso)-1,2) = '00') and (Temp = '0') then 		{Se Reais For igual a 00 e centavos 0}
            ExCentena := Trim(N1[StrToInt(Centreal)]) + ' Reais'
         else
            If (Copy(Pextenso,Length(Pextenso)-1,2) = '00') and (Temp <> '0') then 	{Se reais for 00 e centavos for <> 00}
             	ExCentena := Trim(N1[StrToInt(Centreal)]) + ' Reais e '
            Else
               	ExCentena := Trim(N2[StrToInt(Centreal)]) + ' ';
         Apontador := 4;
      end;
      4:
      begin  		{mil}
         If Length(Pextenso) = 4 then 		{Se pextenso = 4 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         Mil	:= Copy(Pextenso, Length(Pextenso) - Apontador, 2);
         ExMil	:= ' Mil ';
         if (Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1) = '0') and (Copy(Pextenso,Length(Pextenso)-1,2) = '00') then  	{Se centenas de real e reais = 0 entao}
            ExMil := Trim(N[StrToInt(Mil)]) + ' Mil '
         else
            ExMil := Trim(N[StrToInt(Mil)]) + ' Mil ';
         Apontador := 6;
      end;
      6:
      begin 		{Centenas de Mil}
         CentMil := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);
         If Mil = '00' then 				{Se mil For nullo}
            ExCentMil := Trim(N1[StrToInt(CentMil)]) + ' '
         else
            ExCentMil := Trim(N2[StrToInt(CentMil)]) + ' ';
         Apontador	:= 7;
      end;
      7:
      begin      	{Milhão}
         if (Mil = '00') And (Length(Pextenso) < 7) then
             ExMil := '';

         if Length(Pextenso) = 7 then 	{Se pextenso = 7 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;

         Milhao := Copy(Pextenso, Length(Pextenso) - Apontador, 2);
         If Milhao = '01' then
            Exmilhao := Trim(N[StrToInt(Milhao)]) + ' Milhão '
         else
            Exmilhao := Trim(N[StrToInt(Milhao)]) + ' Milhões ';
         Apontador := 9;
      end;
      9:
      begin  		{centenas de Milhao}
         CentMilhao := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);
         if (Milhao = '00') and (Length(Pextenso) > 9) then
              {Se milhao For 00 e o numero for 100.000.000.000 para nao colocar bilhao milhao reais}
         else
             If Milhao = '00' then  		{Se milhao For 00}
                ExCentMilhao := Trim(N1[StrToInt(CentMilhao)]) + ' Milhões '
             else
                ExCentMilhao := Trim(N2[StrToInt(CentMilhao)]) + ' ';
         Apontador := 10;
      end;
      10:
      begin   		{Bilhoes}
         If Length(Pextenso) = 10 then {Se pextenso = 10 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         Bilhoes := Copy(Pextenso, Length(Pextenso) - Apontador, 2);
         If Bilhoes = '01' Then 			{se for 1 bilhao}
            ExBil := Trim(N[StrToInt(Bilhoes)]) + ' Bilhão '
         else
            ExBil := Trim(N[StrToInt(Bilhoes)]) + ' Bilhões ';
         Apontador := 12;
      end;
      12:
      begin 		{Centenas de bilhoes}
         CentBilhao	:= Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);
         if Bilhoes = '00' then 			{Se bilhao For nullo}
            ExCentBi := Trim(N1[StrToInt(CentBilhao)]) + ' Bilhões '
         else
            ExCentBi := Trim(N2[StrToInt(CentBilhao)]) + ' ';
         Apontador := 13;
      end;
      13:
      begin   		{Trilhoes}
         if CentBilhao = '0' then
            ExCentBi := '';
         if Bilhoes = '00' then
            ExBil := '';
         if Length(Pextenso) = 13 then 	{Se pextenso = 10 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         Trilhoes := Copy(Pextenso, Length(Pextenso) - Apontador, 2);
         if Trilhoes = '01' then 			{se for 1 trilhao}
            ExTril := Trim(N[StrToInt(Trilhoes)]) + ' Trilhão '
         else 										{se for mais de 1 trilhao}
            ExTril := Trim(N[StrToInt(Trilhoes)]) + ' Trilhões ';
         Apontador := 15;
      end;
      15:
      begin 		{Centenas de Trilhoes}
         CentTrilhao := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);
         if Trilhoes = '00' then 			{Se trilhao For nullo}
            ExCentTri := Trim(N1[StrToInt(CentTrilhao)])
         else
            ExCentTri := Trim(N2[StrToInt(CentTrilhao)]) + ' ';
         Apontador := 20;
      end;
      end;
   end;
   Result := Trim(ExCentTri + ExTril + ExCentBi + ExBil + ExCentMilhao + Exmilhao + ExCentMil + ExMil + ExCentena + ExReais + ExCentavos);
end;

Procedure TExtenso.ArrumaExtensoCheque(sExtenso:String;iLength: Integer;var sExtenso1,sExtenso2:String);
var iFator,ia,i,iNumero:Integer;
    aExtenso:Array[1..2] of String;
Begin
   iFator:=0;
   aExtenso[1]:='';
   aExtenso[2]:='';
   for ia := 1 to 2 do
   Begin
      aExtenso[ia]:=copy(sExtenso,(iFator+1),iLength);
      if length(trim(copy(sExtenso,(iFator+1),200))) <= iLength then
         Break;
      iNumero:=55;
      for i := 1 to 55 do
      begin
        if copy(aExtenso[ia],iNumero,1) = ' ' then
        Begin
           aExtenso[ia]:=copy(sExtenso,(iFator+1),iNumero);
           Break;
        end;
        iNumero:=(iNumero-1);
      end;
      iFator:=iFator+iNumero;
   end;

   sExtenso1:=CompletaExtenso(aExtenso[1],'*',iLength);
   sExtenso2:=CompletaExtenso(aExtenso[2],'*',iLength);
end;

function TExtenso.ExtaiInteiro(Valor:Real):Real;
Var
  sAux: String;
  Tam:Integer;
Begin
  sAux := FloatToStr(Valor);
  Tam  := Pos(DecimalSeparator,sAux) - 1;

  If Tam <= 0 Then
     Tam := Length(sAux);

  sAux := Copy(sAux,1,Tam);
  Result := StrToFloat(sAux);
End;


end.
