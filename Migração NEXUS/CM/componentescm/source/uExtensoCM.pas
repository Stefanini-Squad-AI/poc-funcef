{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uExtensoCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uSistema, uDataBase, uCtrlPadroes, DbClient;

type
  TIdioma = (iePortugues, ieEspanhol, ieIngles, ieFrances, ieItaliano);

  TLinhasExtenso = class(TPersistent)
  private
    fLinha1  :String;
    fLinha2  :String;
  Published
    Property Linha1  :String Read fLInha1 Write fLInha1;
    Property Linha2  :String Read fLInha2 Write fLInha2;
  End;

  TDescricaoMoeda = class(TPersistent)
  private
    fSingular :String;
    fPlural   :String;
  Published
    Property Singular :String Read fSingular Write fSingular;
    Property Plural   :String Read fPlural   Write fPlural;
  End;

  TExtensoCM = class(TComponent)
  private
    { Private declarations }
    _N                 :array[0 .. 99] of String[30];
    _N1                :array[0 .. 9]  Of String[30];
    _N2                :array[0 .. 9]  of String[30];
    _CENTAVO           :String;
    _CENTAVOS          :String;
    _MIL               :String;
    _MILHAO            :String;
    _MILHOES           :String;
    _BILHAO            :String;
    _BILHOES           :String;
    _TRILHAO           :String;
    _TRILHOES          :String;
    _CONECTOR          :String;
    _CONECENT          :String;
    _CONECTORDE        :String;

    fValor             :Double;
    fCaracterAdicional :String;
    fExtenso           :String;
    fDescricaoMoeda    :TDescricaoMoeda;
    fTamanhoLinha      :Integer;
    fLinhasExtenso     :TLinhasExtenso;
    fIdioma            :TIdioma;
    fCompletaExtenso   :Boolean;

    Procedure TrocaUnoPorUn(Var sExtenso:String);

    function   ExtraiInteiro(Valor:Double):Double;
    procedure  SetIdioma;
    Procedure  SetCaracterAdicional;
    Procedure  DivideExtenso;
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); Override;
    Destructor  Destroy; Override;
    Procedure   Escreve;
    Procedure   SetaMoedaPadrao(CodMoeda : Integer = -1);
    Procedure   SetaIdiomaPadrao;
    Property    Extenso           :String          read fExtenso            write fExtenso;
    Property    LinhasExtenso     :TLinhasExtenso  read fLinhasExtenso      write fLinhasExtenso;
  published
    { Published declarations }
    Property Valor             :Double          read fValor              write fValor;
    Property CaracterAdicional :String          read fCaracterAdicional  write fCaracterAdicional;
    Property DescricaoMoeda    :TDescricaoMoeda read fDescricaoMoeda     write fDescricaoMoeda;
    Property TamanhoLinha      :Integer         read fTamanhoLinha       write fTamanhoLinha;
    Property Idioma            :TIdioma         read fIdioma             write fIdioma;
    Property CompletaExtenso   :Boolean         read fCompletaExtenso    write fCompletaExtenso;
  end;


implementation


Constructor TExtensoCM.Create(AOwner: TComponent);
Begin
  Inherited Create(AOWner);
  fLinhasExtenso  := TLinhasExtenso.Create;
  fDescricaoMoeda := TDescricaoMoeda.Create;
End;

Destructor TExtensoCM.Destroy;
Begin
  fLinhasExtenso.Free;
  fDescricaoMoeda.Free;
  Inherited Destroy;
End;

function TExtensoCM.ExtraiInteiro(Valor:Double):Double;
Var
  sAux: String;
  Tam:Integer;
Begin
  sAux := Trim(FloatToStrF(Valor,ffnumber,17,2));
  Tam  := Pos(DecimalSeparator,sAux) - 1;

  If Tam <= 0 Then
     Tam := Length(sAux);

  sAux := Copy(sAux,1,Tam);

  While Pos('.',sAux) <> 0  Do
     Delete(sAux,Pos('.',sAux),1);

  While Pos(',',sAux) <> 0  Do
     Delete(sAux,Pos(',',sAux),1);

  Result := StrToFloat(sAux);
End;

Procedure TExtensoCM.Escreve;
Var
   Temp, Pextenso, CENTAVOS, ExCentavos , ExReais,
   ExCentena , ExMil, ExCentMil, ExBil, Exmilhao,
   ExCentMilhao, ExCentBi, ExTril, ExCentTri, Reais,
   Centreal, Mil, CentMil, Milhao, CentMilhao, Bilhoes,
   CentBilhao, Trilhoes, CentTrilhao : String;
   Valor : Double;
   Apontador : Integer;
begin
   SetIdioma;

   Valor := Abs(fValor);

   If Valor = 0 Then
   begin
      fExtenso := 'Sem Valor';
      Exit;
   end;

   Pextenso  := FloatToStr(ExtraiInteiro(Valor));
   Apontador := 0;
   If Length(Pextenso) = 1 then
      Pextenso := '0' + Pextenso;

   While Apontador <= Length(Pextenso) do
   begin
      case Apontador of
      0:
      begin			{centavos}
         Temp := Trim(FloatToStrF((Valor - ExtraiInteiro(Valor)),ffnumber,17,2));

         If (Temp = '0,00') Or (Temp = '0.00') Then Temp := '0';

         if Copy(Temp, 2,1) = DecimalSeparator  then
         begin
           CENTAVOS := Trim(FloatToStrF((StrToFloat(Temp) * 100),ffnumber,17,0));



           If CENTAVOS = '01' 	then  	{se centavos for 01}
              ExCentavos := Trim(_N[StrToInt(CENTAVOS)]) + _CENTAVO
           else
              If (CENTAVOS = '00') OR (CENTAVOS = '0') Then
                  ExCentavos := ''
              Else
                  ExCentavos := Trim(_N[StrToInt(CENTAVOS)]) + _CENTAVOS;

         TrocaUnoPorUn(ExCentavos);

         end;

         Apontador := 2;
         if Pextenso = '00' 	then  	{Para nao colocar real zero}
            Apontador := 3;
      end;

      2:
      begin  		{Reais}
         Reais := Copy(Pextenso,Length(Pextenso)-1,2);
         If (Temp = '0') and (Reais <> '00') 	then  	{Se não existir centavos e reais maior que 00}
            ExReais := Trim(_N[StrToInt(Reais)]) + ' ' + fDescricaoMoeda.fPlural
         else
            If (Temp <> '0') and (Copy(Pextenso,Length(Pextenso)-1,2) = '00') then 	{Se existir centavos e reais for igual a 00}
                ExReais := ''
            else
            	If Reais <> '00' then 		{se existir reais}
                   If (Reais = '01') And (Length(Pextenso) <= 2) then 	{se for 1 real entao}
                   Begin
                      If (ExCentavos <> '') Then
                         ExReais := Trim(_N[StrToInt(Reais)]) + ' ' + fDescricaoMoeda.fSingular + _CONECENT
                      Else
                         ExReais := Trim(_N[StrToInt(Reais)]) + ' ' + fDescricaoMoeda.fSingular;
                   End
                   else       					{se for acima de 1 real}
                   Begin
                      If (ExCentavos <> '') Then
                         ExReais := Trim(_N[StrToInt(Reais)]) + ' ' + fDescricaoMoeda.fPlural + _CONECENT
                      Else
                         ExReais := Trim(_N[StrToInt(Reais)]) + ' ' + fDescricaoMoeda.fPlural;
                   End;

            if (Reais = '01') and (Length(Pextenso) = 2) and (ExCentavos = '') then 		{se real for 1 e centavos nulo}
            	ExReais := Trim(_N[StrToInt(Reais)]) + ' ' + fDescricaoMoeda.fSingular;

         If StrToInt(Reais) = 1 Then TrocaUnoPorUn(ExReais);

         Apontador := 3;
      end;

      3:
      begin  		{Centenas de Real}
         Centreal := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);

         if (Copy(Pextenso,Length(Pextenso)-1,2) = '00') and (Temp = '0') then 		{Se Reais For igual a 00 e centavos 0}
            ExCentena := Trim(_N1[StrToInt(Centreal)]) + ' ' + fDescricaoMoeda.fPlural
         else
            If (Copy(Pextenso,Length(Pextenso)-1,2) = '00') and (Temp <> '0') then 	{Se reais for 00 e centavos for <> 00}
             	ExCentena := Trim(_N1[StrToInt(Centreal)]) + ' ' + fDescricaoMoeda.fPlural + _CONECENT
            Else
               	ExCentena := Trim(_N2[StrToInt(Centreal)]) + _CONECTOR +' ';

         Apontador := 4;
      end;

      4:
      begin  		{mil}
         If Length(Pextenso) = 4 then 		{Se pextenso = 4 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;

         Mil := Copy(Pextenso, Length(Pextenso) - Apontador, 2);

         if (Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1) = '0') and
            (Copy(Pextenso,Length(Pextenso)-1,2) = '00') Then
            ExMil := Trim(_N[StrToInt(Mil)]) + _MIL 
         else

            If Centreal = '0' Then
               ExMil := Trim(_N[StrToInt(Mil)]) + _MIL
            Else
               ExMil := Trim(_N[StrToInt(Mil)]) + _MIL + _CONECTOR;

         If StrToInt(Mil) = 1 Then TrocaUnoPorUn(ExMil);

         Apontador := 6;
      end;

      6:
      begin 		{Centenas de Mil}
         CentMil := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);

         If Mil = '00' then 				{Se mil For nullo}
            ExCentMil := Trim(_N1[StrToInt(CentMil)]) + ' '
         else
            ExCentMil := Trim(_N2[StrToInt(CentMil)]) + _CONECTOR  + ' ';

         If StrToInt(CentMil) = 1 Then TrocaUnoPorUn(ExCentMil);

         Apontador	:= 7;
      end;

      7:
      begin
         if (Mil = '00') And (CentMil = '0') Then {And (Length(Pextenso) < 7)} ExMil := '';

         if Length(Pextenso) = 7 then 	{Se pextenso = 7 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;

         Milhao := Copy(Pextenso, Length(Pextenso) - Apontador, 2);

         If Milhao = '01' then
            Exmilhao := Trim(_N[StrToInt(Milhao)]) + _MILHAO
         else
            Exmilhao := Trim(_N[StrToInt(Milhao)]) + _MILHOES;

         If StrToInt(Milhao) = 1 Then TrocaUnoPorUn(Exmilhao);

         Apontador := 9;
      end;

      9:
      begin  		{centenas de Milhao}
         CentMilhao := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);

         if (Milhao = '00') and (Length(Pextenso) > 9) then
             ExCentMilhao := Trim(_N1[StrToInt(CentMilhao)]) + ' '
         else
             If Milhao = '00' then  		{Se milhao For 00}
                ExCentMilhao := Trim(_N1[StrToInt(CentMilhao)]) + _MILHOES
             else
                ExCentMilhao := Trim(_N2[StrToInt(CentMilhao)]) + _CONECTOR  + ' ';

         If StrToInt(CentMilhao) = 1 Then TrocaUnoPorUn(ExCentMilhao);

         Apontador := 10;
      end;

      10:
      begin   		{Bilhoes}
         If Length(Pextenso) = 10 then Pextenso := '0' + Pextenso;
         
         Bilhoes := Copy(Pextenso, Length(Pextenso) - Apontador, 2);
         
         If Bilhoes = '01' Then 			{se for 1 bilhao}
            ExBil := Trim(_N[StrToInt(Bilhoes)]) + _BILHAO
         else
            ExBil := Trim(_N[StrToInt(Bilhoes)]) + _BILHOES;

         If StrToInt(Bilhoes) = 1 Then TrocaUnoPorUn(ExBil);

         Apontador := 12;
      end;

      12:
      begin 		{Centenas de bilhoes}
         CentBilhao := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);

         if Bilhoes = '00' then 			{Se bilhao For nullo}
            ExCentBi := Trim(_N1[StrToInt(CentBilhao)]) + _BILHOES
         else
            ExCentBi := Trim(_N2[StrToInt(CentBilhao)]) + _CONECTOR  + ' ';

         If StrToInt(CentBilhao) = 1 Then TrocaUnoPorUn(ExCentBi);

         Apontador := 13;
      end;

      13:
      begin   		{Trilhoes}
         if CentBilhao = '0' then ExCentBi := '';

         if Bilhoes = '00' then  ExBil := '';

         if Length(Pextenso) = 13 then 	{Se pextenso = 10 caracteres entao coloca 0 na frente}
            Pextenso := '0' + Pextenso;
         Trilhoes := Copy(Pextenso, Length(Pextenso) - Apontador, 2);
         if Trilhoes = '01' then 			{se for 1 trilhao}
            ExTril := Trim(_N[StrToInt(Trilhoes)]) + _TRILHAO
         else 										{se for mais de 1 trilhao}
            ExTril := Trim(_N[StrToInt(Trilhoes)]) + _TRILHOES;

         If StrToInt(Trilhoes) = 1 Then TrocaUnoPorUn(ExTril);

         Apontador := 15;
      end;

      15:
      begin 		{Centenas de Trilhoes}
         CentTrilhao := Copy(Pextenso, Length(Pextenso) - Apontador + 1, 1);
         
         if Trilhoes = '00' then 			{Se trilhao For nullo}
            ExCentTri := Trim(_N1[StrToInt(CentTrilhao)])
         else
            ExCentTri := Trim(_N2[StrToInt(CentTrilhao)]) + _CONECTOR  + ' ';

         If StrToInt(CentTrilhao) = 1 Then TrocaUnoPorUn(ExCentTri);

         Apontador := 20;
      end;

      end;
   end;


   fExtenso := Trim(ExCentTri + ExTril + ExCentBi + ExBil + ExCentMilhao + Exmilhao + ExCentMil + ExMil + ExCentena + ExReais + ExCentavos);

   DivideExtenso;
   If (fCompletaExtenso) Then SetCaracterAdicional;
end;

Procedure  TExtensoCM.SetCaracterAdicional;
  Function AddChar(sTexto, sCaracter: String; iTamanho:Integer):String;
  var
    temp :string;
    cont, Tam :Integer;
  Begin
    temp := Trim(sTexto);

    Tam := length(temp);

    for cont:=1 to iTamanho - Tam do
        temp:= temp + sCaracter;

    Result := temp;
  End;
Begin
  fExtenso               := AddChar(fExtenso,fCaracterAdicional,fTamanhoLinha);
  fLinhasExtenso.fLinha1 := AddChar(fLinhasExtenso.fLinha1,fCaracterAdicional,Round(fTamanhoLinha/2));
  fLinhasExtenso.fLinha2 := AddChar(fLinhasExtenso.fLinha2,fCaracterAdicional,Round(fTamanhoLinha/2));
End;

Procedure  TExtensoCM.SetaIdiomaPadrao;
Begin
   Case Sistema.IdiomaAtivo of
   1: fIdioma := iePortugues;
   2: fIdioma := ieEspanhol;
   3: fIdioma := ieIngles;
   4: fIdioma := ieFrances;
   5: fIdioma := ieItaliano;
   End;
End;

Procedure TExtensoCM.SetaMoedaPadrao(CodMoeda: Integer);
Begin
  If CodMoeda = -1 Then
  Begin
    With TClientDataSet.Create(Nil) Do
      Try
        Data := Padroes.GetDataPacket('SELECT M.MOEDESC FROM MOEDA M, PARAMGLOBAL P WHERE (P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND (P.MOEDACORRENTE = M.MOECODIGO) AND (UPPER(M.MOEDESC) <> ''REAL'')');

        If Not IsEmpty Then
        Begin
          fDescricaoMoeda.fPlural     := FieldByName('MOEDESC').AsString + 's';
          fDescricaoMoeda.fSingular   := FieldByName('MOEDESC').AsString;
        End
        Else
        Begin
          fDescricaoMoeda.fPlural     := 'Reais';
          fDescricaoMoeda.fSingular   := 'Real';
        End;
      finally
        free;
      end;
  End
  Else
  Begin

    With TClientDataSet.Create(Nil) Do
      Try
        Data := Padroes.GetDataPacket('SELECT MOEDESC FROM MOEDA WHERE MOECODIGO = ' + IntToStr(CodMoeda));

        If Not IsEmpty Then
        Begin
          fDescricaoMoeda.fPlural     := FieldByName('MOEDESC').AsString + 's';
          fDescricaoMoeda.fSingular   := FieldByName('MOEDESC').AsString;
        End
        Else
        Begin
          fDescricaoMoeda.fPlural     := 'Reais';
          fDescricaoMoeda.fSingular   := 'Real';
        End;
      finally
        free;
      end;
  

  End;
End;

Procedure  TExtensoCM.DivideExtenso;
var
  iFator,
  ia,
  i,
  iLength,
  iNumero:Integer;
  aExtenso:Array[1..2] of String;
Begin
  iFator:=0;
  aExtenso[1] := '';
  aExtenso[2] := '';
  iLength     := Round(fTamanhoLinha/2);
  for ia := 1 to 2 do
  Begin
     aExtenso[ia]:=copy(fExtenso,(iFator+1),iLength);
     if length(trim(copy(fExtenso,(iFator+1),200))) <= iLength then
        Break;
     iNumero:= iLength;
     for i := 1 to iLength do
     begin
       if copy(aExtenso[ia],iNumero,1) = ' ' then
       Begin
          aExtenso[ia]:=copy(fExtenso,(iFator+1),iNumero);
          Break;
       end;
       iNumero:=(iNumero-1);
     end;
     iFator:=iFator+iNumero;
  end;
  fLinhasExtenso.fLinha1 := aExtenso[1];
  fLinhasExtenso.fLinha2 := aExtenso[2];
end;

Procedure TExtensoCM.SetIdioma;
Begin
Case fIdioma of
   iePortugues:
   Begin
        _N[0]     := '  ';
        _N[1]     := ' Hum ';
        _N[2]     := ' Dois ';
        _N[3]     := ' Três ';
        _N[4]     := ' Quatro ';
        _N[5]     := ' Cinco ';
        _N[6]     := ' Seis ';
        _N[7]     := ' Sete ';
        _N[8]     := ' Oito ';
        _N[9]     := ' Nove ';
        _N[10]    := ' Dez ';
        _N[11]    := ' Onze ';
        _N[12]    := ' Doze ';
        _N[13]    := ' Treze ';
        _N[14]    := ' Quatorze ';
        _N[15]    := ' Quinze ';
        _N[16]    := ' Desesseis ';
        _N[17]    := ' Desessete ';
        _N[18]    := ' Dezoito ';
        _N[19]    := ' Dezenove ';
        _N[20]    := ' Vinte ';
        _N[21]    := ' Vinte e Um ';
        _N[22]    := ' Vinte e Dois ';
        _N[23]    := ' Vinte e Três ';
        _N[24]    := ' Vinte e Quatro ';
        _N[25]    := ' Vinte e Cinco ';
        _N[26]    := ' Vinte e Seis ';
        _N[27]    := ' Vinte e Sete ';
        _N[28]    := ' Vinte e Oito ';
        _N[29]    := ' Vinte e Nove ';
        _N[30]    := ' Trinta ';
        _N[31]    := ' Trinta e Um ';
        _N[32]    := ' Trinta e Dois ';
        _N[33]    := ' Trinta e Três ';
        _N[34]    := ' Trinta e Quatro ';
        _N[35]    := ' Trinta e Cinco ';
        _N[36]    := ' Trinta e Seis ';
        _N[37]    := ' Trinta e Sete ';
        _N[38]    := ' Trinta e Oito ';
        _N[39]    := ' Trinta e Nove ';
        _N[40]    := ' Quarenta ';
        _N[41]    := ' Quarenta e Um ';
        _N[42]    := ' Quarenta e Dois ';
        _N[43]    := ' Quarenta e Três ';
        _N[44]    := ' Quarenta e Quatro ';
        _N[45]    := ' Quarenta e Cinco ';
        _N[46]    := ' Quarenta e Seis ';
        _N[47]    := ' Quarenta e Sete ';
        _N[48]    := ' Quarenta e Oito ';
        _N[49]    := ' Quarenta e Nove ';
        _N[50]    := ' Cinquenta ';
        _N[51]    := ' Cinquenta e Um ';
        _N[52]    := ' Cinquenta e Dois ';
        _N[53]    := ' Cinquenta e Três ';
        _N[54]    := ' Cinquenta e Quatro ';
        _N[55]    := ' Cinquenta e Cinco ';
        _N[56]    := ' Cinquenta e Seis ';
        _N[57]    := ' Cinquenta e Sete ';
        _N[58]    := ' Cinquenta e Oito ';
        _N[59]    := ' Cinquenta e Nove ';
        _N[60]    := ' Sessenta ';
        _N[61]    := ' Sessenta e Um ';
        _N[62]    := ' Sessenta e Dois ';
        _N[63]    := ' Sessenta e Três ';
        _N[64]    := ' Sessenta e Quatro ';
        _N[65]    := ' Sessenta e Cinco ';
        _N[66]    := ' Sessenta e Seis ';
        _N[67]    := ' Sessenta e Sete ';
        _N[68]    := ' Sessenta e Oito ';
        _N[69]    := ' Sessenta e Nove ';
        _N[70]    := ' Setenta ';
        _N[71]    := ' Setenta e Um ';
        _N[72]    := ' Setenta e Dois ';
        _N[73]    := ' Setenta e Três ';
        _N[74]    := ' Setenta e Quatro ';
        _N[75]    := ' Setenta e Cinco ';
        _N[76]    := ' Setenta e Seis ';
        _N[77]    := ' Setenta e Sete ';
        _N[78]    := ' Setenta e Oito ';
        _N[79]    := ' Setenta e Nove ';
        _N[80]    := ' Oitenta ';
        _N[81]    := ' Oitenta e Um ';
        _N[82]    := ' Oitenta e Dois ';
        _N[83]    := ' Oitenta e Três ';
        _N[84]    := ' Oitenta e Quatro ';
        _N[85]    := ' Oitenta e Cinco ';
        _N[86]    := ' Oitenta e Seis ';
        _N[87]    := ' Oitenta e Sete ';
        _N[88]    := ' Oitenta e Oito ';
        _N[89]    := ' Oitenta e Nove ';
        _N[90]    := ' Noventa ';
        _N[91]    := ' Noventa e Um ';
        _N[92]    := ' Noventa e Dois ';
        _N[93]    := ' Noventa e Três ';
        _N[94]    := ' Noventa e Quatro ';
        _N[95]    := ' Noventa e Cinco ';
        _N[96]    := ' Noventa e Seis ';
        _N[97]    := ' Noventa e Sete ';
        _N[98]    := ' Noventa e Oito ';
        _N[99]    := ' Noventa e Nove ';
        _N2[0]    := '  ';
        _N2[1]    := ' Cento ';
        _N2[2]    := ' Duzentos ';
        _N2[3]    := ' Trezentos ';
        _N2[4]    := ' Quatrocentos ';
        _N2[5]    := ' Quinhentos ';
        _N2[6]    := ' Seiscentos ';
        _N2[7]    := ' Setecentos ';
        _N2[8]    := ' Oitocentos ';
        _N2[9]    := ' Novecentos ';
        _N1[0]    := '  ';
        _N1[1]    := ' Cem ';
        _N1[2]    := ' Duzentos ';
        _N1[3]    := ' Trezentos ';
        _N1[4]    := ' Quatrocentos ';
        _N1[5]    := ' Quinhentos ';
        _N1[6]    := ' Seiscentos ';
        _N1[7]    := ' Setecentos ';
        _N1[8]    := ' Oitocentos ';
        _N1[9]    := ' Novecentos ';
        _CENTAVO  := ' Centavo ';
        _CENTAVOS := ' Centavos ';
        _MIL	  := ' Mil ';
        _MILHAO	  := ' Milhão ';
        _MILHOES  := ' Milhões ';
        _BILHAO	  := ' Bilhão ';
        _BILHOES  := ' Bilhões ';
        _TRILHAO  := ' Trilhão ';
        _TRILHOES := ' Trilhoes ';
        _CONECTOR := ' e ';
        _CONECENT := ' e ';
        _CONECTORDE := ' de ';
   End;
   ieEspanhol:
   Begin
      _N[0]      := '  ';
      _N[1]      := ' Uno ';
      _N[2]      := ' Dos ';
      _N[3]      := ' Tres ';
      _N[4]      := ' Cuatro ';
      _N[5]      := ' Cinco ';
      _N[6]      := ' Seis ';
      _N[7]      := ' Siete ';
      _N[8]      := ' Ocho ';
      _N[9]      := ' Nueve ';
      _N[10]     := ' Diez ';
      _N[11]     := ' Once ';
      _N[12]     := ' Doce ';
      _N[13]     := ' Trece ';
      _N[14]     := ' Catorce ';
      _N[15]     := ' Quince ';
      _N[16]     := ' Dieciséis ';
      _N[17]     := ' Diecisiete ';
      _N[18]     := ' Dieciocho ';
      _N[19]     := ' Diecinueve ';
      _N[20]     := ' Veinte ';
      _N[21]     := ' Veintiuno ';
      _N[22]     := ' Veintidós ';
      _N[23]     := ' Veintitrés ';
      _N[24]     := ' Veinticuatro ';
      _N[25]     := ' Veinticinco ';
      _N[26]     := ' Veintiséis ';
      _N[27]     := ' Veintisiete ';
      _N[28]     := ' Veintiocho ';
      _N[29]     := ' Veintinueve ';
      _N[30]     := ' Treinta ';
      _N[31]     := ' Treinta y Uno ';
      _N[32]     := ' Treinta y Dos ';
      _N[33]     := ' Treinta y Tres ';
      _N[34]     := ' Treinta y Cuatro ';
      _N[35]     := ' Treinta y Cinco ';
      _N[36]     := ' Treinta y Seis ';
      _N[37]     := ' Treinta y Siete ';
      _N[38]     := ' Treinta y Ocho ';
      _N[39]     := ' Treinta y Nueve ';
      _N[40]     := ' Cuarenta ';
      _N[41]     := ' Cuarenta y Uno ';
      _N[42]     := ' Cuarenta y Dos ';
      _N[43]     := ' Cuarenta y Tres ';
      _N[44]     := ' Cuarenta y Cuatro ';
      _N[45]     := ' Cuarenta y Cinco ';
      _N[46]     := ' Cuarenta y Seis ';
      _N[47]     := ' Cuarenta y Siete ';
      _N[48]     := ' Cuarenta y Ocho ';
      _N[49]     := ' Cuarenta y Nueve ';
      _N[50]     := ' Cincuenta ';
      _N[51]     := ' Cincuenta y Uno ';
      _N[52]     := ' Cincuenta y Dos ';
      _N[53]     := ' Cincuenta y Tres ';
      _N[54]     := ' Cincuenta y Cuatro ';
      _N[55]     := ' Cincuenta y Cinco ';
      _N[56]     := ' Cincuenta y Seis ';
      _N[57]     := ' Cincuenta y Siete ';
      _N[58]     := ' Cincuenta y Ocho ';
      _N[59]     := ' Cincuenta y Nueve ';
      _N[60]     := ' Sesenta ';
      _N[61]     := ' Sesenta y Uno ';
      _N[62]     := ' Sesenta y Dos ';
      _N[63]     := ' Sesenta y Tres ';
      _N[64]     := ' Sesenta y Cuatro ';
      _N[65]     := ' Sesenta y Cinco ';
      _N[66]     := ' Sesenta y Seis ';
      _N[67]     := ' Sesenta y Siete ';
      _N[68]     := ' Sesenta y Ocho ';
      _N[69]     := ' Sesenta y Nueve ';
      _N[70]     := ' Setenta ';
      _N[71]     := ' Setenta y Uno ';
      _N[72]     := ' Setenta y Dos ';
      _N[73]     := ' Setenta y Tres ';
      _N[74]     := ' Setenta y Cuatro ';
      _N[75]     := ' Setenta y Cinco ';
      _N[76]     := ' Setenta y Seis ';
      _N[77]     := ' Setenta y Siete ';
      _N[78]     := ' Setenta y Ocho ';
      _N[79]     := ' Setenta y Nueve ';
      _N[80]     := ' Ochenta ';
      _N[81]     := ' Ochenta y Uno ';
      _N[82]     := ' Ochenta y Dos ';
      _N[83]     := ' Ochenta y Tres ';
      _N[84]     := ' Ochenta y Cuatro ';
      _N[85]     := ' Ochenta y Cinco ';
      _N[86]     := ' Ochenta y Seis ';
      _N[87]     := ' Ochenta y Siete ';
      _N[88]     := ' Ochenta y Ocho ';
      _N[89]     := ' Ochenta y Nueve ';
      _N[90]     := ' Noventa ';
      _N[91]     := ' Noventa y Uno ';
      _N[92]     := ' Noventa y Dos ';
      _N[93]     := ' Noventa y Tres ';
      _N[94]     := ' Noventa y Cuatro ';
      _N[95]     := ' Noventa y Cinco ';
      _N[96]     := ' Noventa y Seis ';
      _N[97]     := ' Noventa y Siete ';
      _N[98]     := ' Noventa y Ocho ';
      _N[99]     := ' Noventa y Nueve ';
      _N2[0]     := '  ';
      _N2[1]     := ' Ciento ';
      _N2[2]     := ' Doscientos ';
      _N2[3]     := ' Trescientos ';
      _N2[4]     := ' Cuatrocientos ';
      _N2[5]     := ' Quinientos ';
      _N2[6]     := ' Seiscientos ';
      _N2[7]     := ' Setecientos ';
      _N2[8]     := ' Ochocientos ';
      _N2[9]     := ' Novecientos ';
      _N1[0]     := '  ';
      _N1[1]     := ' Cien ';
      _N1[2]     := ' Doscientos ';
      _N1[3]     := ' Trescientos ';
      _N1[4]     := ' Cuatrocientos ';
      _N1[5]     := ' Quinientos ';
      _N1[6]     := ' Seiscientos ';
      _N1[7]     := ' Setecientos ';
      _N1[8]     := ' Ochocientos ';
      _N1[9]     := ' Novecientos ';
      _CENTAVO   := ' Centavo ';
      _CENTAVOS  := ' Centavos ';
      _MIL       := ' Mil ';
      _MILHAO    := ' Millón ';
      _MILHOES   := ' Millón ';
      _BILHAO    := ' Mil millones ';
      _BILHOES   := ' Mil millones ';
      _TRILHAO   := ' Billón ';
      _TRILHOES  := ' Billón ';
      _CONECTOR  := '';
      _CONECENT  := ' Con ';
      _CONECTORDE := '';      
   End;
   ieIngles:
   Begin
      _N[0]      := '  ';
      _N[1]      := ' One ';
      _N[2]      := ' Two ';
      _N[3]      := ' Three ';
      _N[4]      := ' Four ';
      _N[5]      := ' Five ';
      _N[6]      := ' Six ';
      _N[7]      := ' Seven ';
      _N[8]      := ' Eight ';
      _N[9]      := ' Nine ';
      _N[10]     := ' Ten ';
      _N[11]     := ' Eleven ';
      _N[12]     := ' Twelve ';
      _N[13]     := ' Thirteen ';
      _N[14]     := ' Fourteen ';
      _N[15]     := ' Fifteen ';
      _N[16]     := ' Sixteen ';
      _N[17]     := ' Seventeen ';
      _N[18]     := ' Eighteen ';
      _N[19]     := ' Nineteen ';
      _N[20]     := ' Twenty ';
      _N[21]     := ' Twenty one ';
      _N[22]     := ' Twenty two ';
      _N[23]     := ' Twenty three ';
      _N[24]     := ' Twenty four ';
      _N[25]     := ' Twenty five ';
      _N[26]     := ' Twenty six ';
      _N[27]     := ' Twenty seven ';
      _N[28]     := ' Twenty eight ';
      _N[29]     := ' Twenty nine ';
      _N[30]     := ' Thirty ';
      _N[31]     := ' Thirty One ';
      _N[32]     := ' Thirty Two ';
      _N[33]     := ' Thirty Three ';
      _N[34]     := ' Thirty Four ';
      _N[35]     := ' Thirty Five ';
      _N[36]     := ' Thirty Six ';
      _N[37]     := ' Thirty Seven ';
      _N[38]     := ' Thirty Eight ';
      _N[39]     := ' Thirty Nine ';
      _N[40]     := ' Forty ';
      _N[41]     := ' Forty One ';
      _N[42]     := ' Forty Two ';
      _N[43]     := ' Forty Three ';
      _N[44]     := ' Forty Four ';
      _N[45]     := ' Forty Five ';
      _N[46]     := ' Forty Six ';
      _N[47]     := ' Forty Seven ';
      _N[48]     := ' Forty Eight ';
      _N[49]     := ' Forty Nine ';
      _N[50]     := ' Fifty ';
      _N[51]     := ' Fifty One ';
      _N[52]     := ' Fifty Two ';
      _N[53]     := ' Fifty Three ';
      _N[54]     := ' Fifty Four ';
      _N[55]     := ' Fifty Five ';
      _N[56]     := ' Fifty Six ';
      _N[57]     := ' Fifty Seven ';
      _N[58]     := ' Fifty Eight ';
      _N[59]     := ' Fifty Nine ';
      _N[60]     := ' Sixty ';
      _N[61]     := ' Sixty One ';
      _N[62]     := ' Sixty Two ';
      _N[63]     := ' Sixty Three ';
      _N[64]     := ' Sixty Four ';
      _N[65]     := ' Sixty Five ';
      _N[66]     := ' Sixty Six ';
      _N[67]     := ' Sixty Seven ';
      _N[68]     := ' Sixty Eight ';
      _N[69]     := ' Sixty Nine ';
      _N[70]     := ' Seventy ';
      _N[71]     := ' Seventy One ';
      _N[72]     := ' Seventy Two ';
      _N[73]     := ' Seventy Three ';
      _N[74]     := ' Seventy Four ';
      _N[75]     := ' Seventy Five ';
      _N[76]     := ' Seventy Six ';
      _N[77]     := ' Seventy Seven ';
      _N[78]     := ' Seventy Eight ';
      _N[79]     := ' Seventy Nine ';
      _N[80]     := ' Eighty ';
      _N[81]     := ' Eighty One ';
      _N[82]     := ' Eighty Two ';
      _N[83]     := ' Eighty Three ';
      _N[84]     := ' Eighty Four ';
      _N[85]     := ' Eighty Five ';
      _N[86]     := ' Eighty Six ';
      _N[87]     := ' Eighty Seven ';
      _N[88]     := ' Eighty Eight ';
      _N[89]     := ' Eighty Nine ';
      _N[90]     := ' Ninety ';
      _N[91]     := ' Ninety One ';
      _N[92]     := ' Ninety Two ';
      _N[93]     := ' Ninety Three ';
      _N[94]     := ' Ninety Four ';
      _N[95]     := ' Ninety Five ';
      _N[96]     := ' Ninety Six ';
      _N[97]     := ' Ninety Seven ';
      _N[98]     := ' Ninety Eight ';
      _N[99]     := ' Ninety Nine ';
      _N2[0]     := '  ';
      _N2[1]     := ' Hundred ';
      _N2[2]     := ' Two hundred ';
      _N2[3]     := ' Three hundred ';
      _N2[4]     := ' Four hundred ';
      _N2[5]     := ' Five hundred ';
      _N2[6]     := ' Six hundred ';
      _N2[7]     := ' Seven hundred ';
      _N2[8]     := ' Eight hundred ';
      _N2[9]     := ' Nine hundred ';
      _N1[0]     := '  ';
      _N1[1]     := ' A hundred ';
      _N1[2]     := ' Two hundred ';
      _N1[3]     := ' Three hundred ';
      _N1[4]     := ' Four hundred ';
      _N1[5]     := ' Five hundred ';
      _N1[6]     := ' Six hundred ';
      _N1[7]     := ' Seven hundred ';
      _N1[8]     := ' Eight hundred ';
      _N1[9]     := ' Nine hundred ';
      _CENTAVO   := ' Cent ';
      _CENTAVOS  := ' Cents ';
      _MIL       := ' Thousand ';
      _MILHAO    := ' Million ';
      _MILHOES   := ' Million ';
      _BILHAO    := ' Billion ';
      _BILHOES   := ' Billion ';
      _TRILHAO   := ' Trillion ';
      _TRILHOES  := ' Trillion ';
      _CONECTOR  := '';
      _CONECENT  := ' and ';
      _CONECTORDE  := '';     

   End;
   ieFrances:
   Begin
      _N[0]    :=  ' ';
      _N[1]    :=  ' un ';
      _N[2]    :=  ' deux ';
      _N[3]    :=  ' trois ';
      _N[4]    :=  ' quatre ';
      _N[5]    :=  ' cinq ';
      _N[6]    :=  ' six ';
      _N[7]    :=  ' sept ';
      _N[8]    :=  ' huit ';
      _N[9]    :=  ' neuf ';
      _N[10]    := ' dix ';
      _N[11]    := ' onze ';
      _N[12]    := ' douze ';
      _N[13]    := ' treize ';
      _N[14]    := ' quatorze ';
      _N[15]    := ' quinze ';
      _N[16]    := ' seize ';
      _N[17]    := ' dix-sept ';
      _N[18]    := ' dix-huit ';
      _N[19]    := ' dix-neuf ';
      _N[20]    := ' vingt ';
      _N[21]    := ' vingt un ';
      _N[22]    := ' vingt deux ';
      _N[23]    := ' vingt trois ';
      _N[24]    := ' vingt quatre ';
      _N[25]    := ' vingt cinq ';
      _N[26]    := ' vingt six ';
      _N[27]    := ' vingt sept ';
      _N[28]    := ' vingt huit ';
      _N[29]    := ' vingt neuf ';
      _N[30]    := ' trente ';
      _N[31]    := ' trente Un ';
      _N[32]    := ' trente Deux ';
      _N[33]    := ' trente Trois ';
      _N[34]    := ' trente Quatre ';
      _N[35]    := ' trente Cinq ';
      _N[36]    := ' trente Six ';
      _N[37]    := ' trente Sept ';
      _N[38]    := ' trente Huit ';
      _N[39]    := ' trente Neuf ';
      _N[40]    := ' quarante ';
      _N[41]    := ' quarante Un ';
      _N[42]    := ' quarante Deux ';
      _N[43]    := ' quarante Trois ';
      _N[44]    := ' quarante Quatre ';
      _N[45]    := ' quarante Cinq ';
      _N[46]    := ' quarante Six ';
      _N[47]    := ' quarante Sept ';
      _N[48]    := ' quarante Huit ';
      _N[49]    := ' quarante Neuf ';
      _N[50]    := ' cinquante ';
      _N[51]    := ' cinquante Un ';
      _N[52]    := ' cinquante Deux ';
      _N[53]    := ' cinquante Trois ';
      _N[54]    := ' cinquante Quatre ';
      _N[55]    := ' cinquante Cinq ';
      _N[56]    := ' cinquante Six ';
      _N[57]    := ' cinquante Sept ';
      _N[58]    := ' cinquante Huit ';
      _N[59]    := ' cinquante Neuf ';
      _N[60]    := ' soixante ';
      _N[61]    := ' soixante Un ';
      _N[62]    := ' soixante Deux ';
      _N[63]    := ' soixante Trois ';
      _N[64]    := ' soixante Quatre ';
      _N[65]    := ' soixante Cinq ';
      _N[66]    := ' soixante Six ';
      _N[67]    := ' soixante Sept ';
      _N[68]    := ' soixante Huit ';
      _N[69]    := ' soixante Neuf ';
      _N[70]    := ' soixante-dix ';
      _N[71]    := ' soixante-dix-Un ';
      _N[72]    := ' soixante-dix-Deux ';
      _N[73]    := ' soixante-dix-Trois ';
      _N[74]    := ' soixante-dix-Quatre ';
      _N[75]    := ' soixante-dix-Cinq ';
      _N[76]    := ' soixante-dix-Six ';
      _N[77]    := ' soixante-dix-Sept ';
      _N[78]    := ' soixante-dix-Huit ';
      _N[79]    := ' soixante-dix-Neuf ';
      _N[80]    := ' quatre-vingts ';
      _N[81]    := ' quatre-vingts-Un ';
      _N[82]    := ' quatre-vingts-Deux ';
      _N[83]    := ' quatre-vingts-Trois ';
      _N[84]    := ' quatre-vingts-Quatre ';
      _N[85]    := ' quatre-vingts-Cinq ';
      _N[86]    := ' quatre-vingts-Six ';
      _N[87]    := ' quatre-vingts-Sept ';
      _N[88]    := ' quatre-vingts-Huit ';
      _N[89]    := ' quatre-vingts-Neuf ';
      _N[90]    := ' quatre-vingt-dix ';
      _N[91]    := ' quatre-vingt-dix-Un ';
      _N[92]    := ' quatre-vingt-dix-Deux ';
      _N[93]    := ' quatre-vingt-dix-Trois ';
      _N[94]    := ' quatre-vingt-dix-Quatre ';
      _N[95]    := ' quatre-vingt-dix-Cinq ';
      _N[96]    := ' quatre-vingt-dix-Six ';
      _N[97]    := ' quatre-vingt-dix-Sept ';
      _N[98]    := ' quatre-vingt-dix-Huit ';
      _N[99]    := ' quatre-vingt-dix-Neuf ';
      _N2[0]    := '  ';
      _N2[1]    := ' cent ';
      _N2[2]    := ' deux cents ';
      _N2[3]    := ' trois cents ';
      _N2[4]    := ' quatre cents ';
      _N2[5]    := ' cinq cents ';
      _N2[6]    := ' six cents ';
      _N2[7]    := ' sept cents ';
      _N2[8]    := ' huit cents ';
      _N2[9]    := ' neuf cents ';
      _N1[0]    := '  ';
      _N1[1]    := ' cent ';
      _N1[2]    := ' deux cents ';
      _N1[3]    := ' trois cents ';
      _N1[4]    := ' quatre cents ';
      _N1[5]    := ' cinq cents ';
      _N1[6]    := ' six cents ';
      _N1[7]    := ' sept cents ';
      _N1[8]    := ' huit cents ';
      _N1[9]    := ' neuf cents ';
      _CENTAVO  := ' Cent ';
      _CENTAVOS := ' Cent ';
      _MIL      := ' Mille ';
      _MILHAO   := ' Million ';
      _MILHOES  := ' Million ';
      _BILHAO   := ' Milliard ';
      _BILHOES  := ' Milliard ';
      _TRILHAO  := ' Billion ';
      _TRILHOES := ' Billion ';
      _CONECTOR := ' et ';
      _CONECENT := ' et ';
      _CONECTORDE  := '';      
   End;
   ieItaliano:
   Begin
      _N[0]     := '  ';
      _N[1]     := ' uno ';
      _N[2]     := ' due ';
      _N[3]     := ' tre ';
      _N[4]     := ' quattro ';
      _N[5]     := ' cinque ';
      _N[6]     := ' sei ';
      _N[7]     := ' sette ';
      _N[8]     := ' otto ';
      _N[9]     := ' nove ';
      _N[10]    := ' dieci ';
      _N[11]    := ' undici ';
      _N[12]    := ' dodici ';
      _N[13]    := ' tredici ';
      _N[14]    := ' quattordici ';
      _N[15]    := ' quindici ';
      _N[16]    := ' sedici ';
      _N[17]    := ' diciassette ';
      _N[18]    := ' diciotto ';
      _N[19]    := ' diciannove ';
      _N[20]    := ' venti ';
      _N[21]    := ' venti uno ';
      _N[22]    := ' venti due ';
      _N[23]    := ' venti tre ';
      _N[24]    := ' venti quattro ';
      _N[25]    := ' venti cinque ';
      _N[26]    := ' venti sei ';
      _N[27]    := ' venti sette ';
      _N[28]    := ' venti otto ';
      _N[29]    := ' venti nove ';
      _N[30]    := ' trenta ';
      _N[31]    := ' trenta Uno ';
      _N[32]    := ' trenta Due ';
      _N[33]    := ' trenta Tre ';
      _N[34]    := ' trenta Quattro ';
      _N[35]    := ' trenta Cinque ';
      _N[36]    := ' trenta Sei ';
      _N[37]    := ' trenta Sette ';
      _N[38]    := ' trenta Otto ';
      _N[39]    := ' trenta Nove ';
      _N[40]    := ' quaranta ';
      _N[41]    := ' quaranta Uno ';
      _N[42]    := ' quaranta Due ';
      _N[43]    := ' quaranta Tres ';
      _N[44]    := ' quaranta Quattro ';
      _N[45]    := ' quaranta Cinque ';
      _N[46]    := ' quaranta Sei ';
      _N[47]    := ' quaranta Sette ';
      _N[48]    := ' quaranta Otto ';
      _N[49]    := ' quaranta Nove ';
      _N[50]    := ' cinquanta ';
      _N[51]    := ' cinquanta Uno ';
      _N[52]    := ' cinquanta Due ';
      _N[53]    := ' cinquanta Tre ';
      _N[54]    := ' cinquanta Quattro ';
      _N[55]    := ' cinquanta Cinque ';
      _N[56]    := ' cinquanta Sei ';
      _N[57]    := ' cinquanta Sette ';
      _N[58]    := ' cinquanta Otto ';
      _N[59]    := ' cinquanta Nove ';
      _N[60]    := ' sessanta ';
      _N[61]    := ' sessanta Uno ';
      _N[62]    := ' sessanta Due ';
      _N[63]    := ' sessanta Tre ';
      _N[64]    := ' sessanta Quattro ';
      _N[65]    := ' sessanta Cinque ';
      _N[66]    := ' sessanta Sei ';
      _N[67]    := ' sessanta Sette ';
      _N[68]    := ' sessanta Otto ';
      _N[69]    := ' sessanta Nove ';
      _N[70]    := ' settanta ';
      _N[71]    := ' settanta Uno ';
      _N[72]    := ' settanta Due ';
      _N[73]    := ' settanta Tre ';
      _N[74]    := ' settanta Quattro ';
      _N[75]    := ' settanta Cinque ';
      _N[76]    := ' settanta Sei ';
      _N[77]    := ' settanta Sette ';
      _N[78]    := ' settanta Otto ';
      _N[79]    := ' settanta Nove ';
      _N[80]    := ' ottanta ';
      _N[81]    := ' ottanta Uno ';
      _N[82]    := ' ottanta Due ';
      _N[83]    := ' ottanta Tre ';
      _N[84]    := ' ottanta Quattro ';
      _N[85]    := ' ottanta Cinque ';
      _N[86]    := ' ottanta Sei ';
      _N[87]    := ' ottanta Sette ';
      _N[88]    := ' ottanta Otto ';
      _N[89]    := ' ottanta Nove ';
      _N[90]    := ' novanta ';
      _N[91]    := ' novanta Uno ';
      _N[92]    := ' novanta Due ';
      _N[93]    := ' novanta Tre ';
      _N[94]    := ' novanta Quattro ';
      _N[95]    := ' novanta Cinque ';
      _N[96]    := ' novanta Sei ';
      _N[97]    := ' novanta Sette ';
      _N[98]    := ' novanta Otto ';
      _N[99]    := ' novanta Nove ';
      _N2[0]    := '  ';
      _N2[1]    := ' cento ';
      _N2[2]    := ' duecento ';
      _N2[3]    := ' trecento ';
      _N2[4]    := ' quattrocento ';
      _N2[5]    := ' cinquecento ';
      _N2[6]    := ' seicento ';
      _N2[7]    := ' settecento ';
      _N2[8]    := ' ottocento ';
      _N2[9]    := ' novecento ';
      _N1[0]    := '  ';
      _N1[1]    := ' cento ';
      _N1[2]    := ' duecento ';
      _N1[3]    := ' trecento ';
      _N1[4]    := ' quattrocento ';
      _N1[5]    := ' cinquecento ';
      _N1[6]    := ' seicento ';
      _N1[7]    := ' settecento ';
      _N1[8]    := ' ottocento ';
      _N1[9]    := ' novecento ';
      _CENTAVO  := ' il Centesimo ';
      _CENTAVOS := ' i Centesimi ';
      _MIL      := ' Milli ';
      _MILHAO   := ' Milione ';
      _MILHOES  := ' Milione ';
      _BILHAO   := ' Miliardi ';
      _BILHOES  := ' Miliardi ';
      _TRILHAO  := ' Bilioni ';
      _TRILHOES := ' Bilioni ';
      _CONECTOR := ' e ';
      _CONECENT := ' e ';
      _CONECTORDE  := '';
   End;
   End;
End;

Procedure TExtensoCM.TrocaUnoPorUn(Var sExtenso:String);
Var
   iPosUno :Integer;
Begin
   If fIdioma = ieEspanhol Then
   Begin
      iPosUno := Pos('Uno ',sExtenso);
      If iPosUno <> 0 Then
      Begin
         Delete(sExtenso, iPosUno, 4);
         Insert('Un ', sExtenso, iPosUno);
      End;

   End;
End;


end.
