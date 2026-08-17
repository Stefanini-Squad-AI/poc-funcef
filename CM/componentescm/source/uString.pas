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
unit uString;

interface

uses sysutils;

function Espaco(sTexto : string; iTamanho : integer): string;
function Spc (QTD:Integer):String;
function AlDireita(S:string; T:Integer):String;
function AlEsquerda(S:string; T:Integer):String;
function RemoveChar(sChar:Char; sTexto: String): String;

(* Funções para compatibilização da conversão da CM IntBanco *)

{alinha os caracteres a direita com espaços a esquerda}
Function  AD(S:string; T:Integer):String;
{alinha os caracteres a esquerda com espaços a direita}
Function  AE(S:string; T:Integer):String;
{alinha a string a direita com zeros a esquerda}
Function  ZD(N:string; T:Integer):String;
{alinha a string a esquerda com zeros a direita}
Function  ZE(N:string; T:Integer):String;
{retorna a data no formato ddmmaa}
Function  RemoveBarras(Data: String): String;
{retorna a data no formato ddmmaaaa}
Function  RemoveBarras2(Data: String): String;
{retorna a data no formato aaaammdd}
Function  RemoveBarras3(Data: String): String;
{retorna a data a partir de um string num formato ddmmaa}
function  DevolveBarras(Data: String):TDateTime;
{retorna a data a partir de um string num formato ddmmaaaa}
function  DevolveBarras2(Data: String):TDateTime;
{formata o numero excluindo a vírgula transformando num inteiro multiplicando por 10 ** Decimais}
function  RemoveVirgulas(Valor: Real;Decimais: Integer):String;
{a partir de um Inteiro obten-se o respectivo decimal dividindo por 10 ** Decimais}
function  DevolveVirgulas(Valor: String;Decimais: Integer):Real;
{Retorna a string excluindo todos os caracteres ASCII extendidos}
function  MascaraAlfa(S:string): String;
{Retira todos os espaços em branco da string}
Function  RetiraEspacos(S:String): String;
{remove pontos ':' de uma hora passada como string}
Function  RemovePontos(spHora: String): String;
{formata o documento de acordo com o tipo: Caso CPF acrescenta zeros antes do DV}

implementation

function Espaco(sTexto : string; iTamanho : integer): string;
var iMaximo, i : integer;
    sNovoTexto, sTemp : string;
begin
     i := 1 ;
     iMaximo := iTamanho;
     sNovoTexto := '';
     while i <= iMaximo do
     begin
          if (i <= Length(sTexto)) then
             sTemp := sTexto[i]
          else
              sTemp := ' ';
          sNovoTexto := Concat(sNovoTexto,sTemp);
          Inc(i);
     end;
     Result := sNovoTexto;
end;

function AlDireita(S:string; T:Integer):String;
var temp:string;
    tam, cont:Integer;
Begin
     If S <> '' Then
     Begin
          temp := Trim(s);

          If length(Temp) > T Then
             temp := Copy(Temp,1,T);

          tam := length(temp);

          for cont:=1 to t - tam do
             temp:=' '+temp;

          result := temp;
     End
     Else
          result := Spc(T);
end;

function AlEsquerda(S:string; T:Integer):String;
var temp:string;
    cont, tam:Integer;
Begin
   If S <> '' Then
   Begin
     temp := Trim(s);

     If length(Temp) > T Then
          temp := Copy(Temp,1,T);

     tam := length(temp);

     for cont:=1 to t - tam do
     temp:=temp+' ';
     result := temp;
   End
     Else
          result := Spc(T);
end;

function RemoveChar(sChar:Char; sTexto: String): String;
Var
 sAux: String;
Begin
  sAux := sTexto;
  While Pos(sChar,sAux) <> 0 Do
        Delete(sAux,Pos(sChar,sAux),1);
  Result := sAux;
End;


function DevolveBarras(Data: String):TDateTime;
Begin
    {Em Cima de Uma Data no formato ddmmyy ou ddmmyyyy separa os caracteres e adciona as barras}
    If Length(Data)=6 Then
    Begin
       If (StrToInt(Copy(Data,5,2)) > 60) Then
          Result := StrToDate(Copy(Data,1,2) + '/' + Copy(Data,3,2) + '/19' + Copy(Data,5,2))
       Else
          Result := StrToDate(Copy(Data,1,2) + '/' + Copy(Data,3,2) + '/20' + Copy(Data,5,2));
    End
    Else
       Result := StrToDate(Copy(Data,1,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,4));
end;

function DevolveBarras2(Data: String):TDateTime;
Begin
   {Em Cima de Uma Data no formato AAAAMMDD separa os caracteres e adciona as barras}
   Result := StrToDate(Copy(Data,7,2) + '/' + Copy(Data,5,2) + '/' + Copy(Data,1,4));
end;


function DevolveVirgulas(Valor: String;Decimais: Integer):Real;
Var iExp10, X: Integer;
Begin
    iExp10 := 1;
    For X:=1 To Decimais Do
    Begin
       iExp10 := iExp10 * 10;
    End;

    {Em Cima de um valor numerico Decimal, adiciona os centavos separados por vírgula}
    Result := (StrToFloat(Valor)/iExp10);
end;

function RemoveVirgulas(Valor: Real;Decimais: Integer):String;
Var iPosiVirgula, X: Integer;
    sValor, sFormat: String;
Begin
   sFormat := '%17.' + IntToStr(Decimais) + 'f';
   sValor := Trim(Format(sFormat,[Valor]));

   If Valor = 0 Then
      Result := '0'
   Else
   Begin
     iPosiVirgula := Pos(DecimalSeparator,sValor);
     If iPosiVirgula = 0 Then
     Begin
        For X:=1 To Decimais Do sValor := sValor + '0';
        Result := sValor;
     End
     Else
     Begin
        
        Result := Copy(sValor,1,iPosiVirgula-1) + Copy(sValor,iPosiVirgula+1,Decimais);
     End;
   End;
end;


Function RemoveBarras(Data: String): String;
Var Dia, Mes, Ano: Word;
    SDia, SMes, SAno: String;
    aData: TDateTime;
Begin
    {Retorna a data no formato ddmmyy sem as barras, independente do formato de entrada}
    If Trim(Data) = '' Then
       Result := '000000'
    Else
    Begin
        aData := StrToDate(Data);
        DecodeDate(aData,Ano,Mes,Dia);
        SDia := IntToStr(Dia);
        SMes := IntToStr(Mes);
        SAno := IntToStr(Ano);
        If Length(SDia) = 1 Then SDia := '0' + SDia;
        If Length(SMes) = 1 Then SMes := '0' + SMes;
        If Length(SAno) > 2 Then SAno := Copy(Sano,Length(Sano)-1,2);
        Result := Sdia+Smes+Sano;
    End;
end;


Function AD(S:string; T:Integer):String;
var temp:string;
    tam, cont:Integer;
Begin
     If S <> '' Then
     Begin
          temp := MascaraAlfa(s);

          If length(Temp) > T Then
             temp := Copy(Temp,1,T);

          tam := length(temp);

          for cont:=1 to t - tam do
             temp:=' '+temp;

          result := temp;
     End
     Else
          result := Spc(T);
end;

Function AE(S:string; T:Integer):String;
var temp:string;
    cont, tam:Integer;
Begin
   If S <> '' Then
   Begin
     temp := MascaraAlfa(s);

     If length(Temp) > T Then
          temp := Copy(Temp,1,T);

     tam := length(temp);

     for cont:=1 to t - tam do
     temp:=temp+' ';
     result := temp;
   End
     Else
          result := Spc(T);
end;

Function ZD(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := MascaraAlfa(N);

     temp := RetiraEspacos(temp);

     If length(Temp) > T Then
        temp := Copy(Temp,1,T);

     Tam := length(temp);

     for cont:=1 to t - Tam do
         temp:='0'+temp;

     result := temp;
end;

Function ZE(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := MascaraAlfa(N);

     temp := RetiraEspacos(temp);

     If length(Temp) > T Then
        temp := Copy(Temp,1,T);

     Tam := length(temp);

     for cont:=1 to t - Tam do
     temp:=temp+'0';
     result := temp;
end;

Function Spc (QTD:Integer):String;
var cont: Integer;
    t:string;
begin
   t:='';
   for cont:=1 to qtd do
   t:=t+' ';
   result := t;
end;

function MascaraAlfa(S:string): String;
Var sAuxiliar: String;
    x, iTam: Integer;
    pAuxiliar: Array [0..255] of Char;
Begin

  sAuxiliar := S;
  iTam := Length(sAuxiliar);
  StrpCopy(pAuxiliar,sAuxiliar);

  For X:=0 to iTam Do
  Begin
    If pAuxiliar[x] <> ' ' Then
       If (Ord(pAuxiliar[x]) >= 192) And (Ord(pAuxiliar[x]) <= 198) Then
          pAuxiliar[x] := 'A'
       Else
          If (Ord(pAuxiliar[x]) >= 224) And (Ord(pAuxiliar[x]) <= 230) Then
              pAuxiliar[x] := 'A'
       Else
         If (Ord(pAuxiliar[x]) >= 200) And (Ord(pAuxiliar[x]) <= 203) Then
             pAuxiliar[x] := 'E'
         Else
         If (Ord(pAuxiliar[x]) >= 232) And (Ord(pAuxiliar[x]) <= 235) Then
             pAuxiliar[x] := 'E'
         Else
           If (Ord(pAuxiliar[x]) >= 204) And (Ord(pAuxiliar[x]) <= 207) Then
              pAuxiliar[x] := 'I'
           Else
              If (Ord(pAuxiliar[x]) >= 236) And (Ord(pAuxiliar[x]) <= 239) Then
                 pAuxiliar[x] := 'I'
           Else
             If (Ord(pAuxiliar[x]) >= 210) And (Ord(pAuxiliar[x]) <= 214) Then
                pAuxiliar[x] := 'O'
             Else
                If (Ord(pAuxiliar[x]) >= 242) And (Ord(pAuxiliar[x]) <= 246) Then
                 pAuxiliar[x] := 'O'
             Else
               If (Ord(pAuxiliar[x]) >= 217) And (Ord(pAuxiliar[x]) <= 220) Then
                  pAuxiliar[x] := 'U'
               Else
               If (Ord(pAuxiliar[x]) >= 249) And (Ord(pAuxiliar[x]) <= 252) Then
                   pAuxiliar[x] := 'U'
               Else
                 If (Ord(pAuxiliar[x]) = 209) or (Ord(pAuxiliar[x]) = 241) Then
                    pAuxiliar[x] := 'N'
                 Else
                   If (Ord(pAuxiliar[x]) = 199) Or (Ord(pAuxiliar[x]) = 231) Then
                      pAuxiliar[x] := 'C'
                   Else
                    If (((Ord(pAuxiliar[x]) < 48) Or (Ord(pAuxiliar[x]) > 57))  And
                       ((Ord(pAuxiliar[x]) < 40) Or (Ord(pAuxiliar[x]) > 41))   And
                       ((Ord(pAuxiliar[x]) < 65) Or (Ord(pAuxiliar[x]) > 90))   And
                       ((Ord(pAuxiliar[x]) < 97) Or (Ord(pAuxiliar[x]) > 122))) And
                       (Ord(pAuxiliar[x]) <> 44) And (Ord(pAuxiliar[x]) <> 58) Then
                       pAuxiliar[x] := ' ';
  End;

  sAuxiliar := Copy(pAuxiliar,1,itam);

  Result := UpperCase(sAuxiliar);
end;

Function RetiraEspacos(S:String): String;
Var sAuxiliar: String;
    iPosEspacos, iTam, x : Integer;
    sAtual: Char;
Begin
  //Retira Espaços em branco da string
  Result := S;

  sAuxiliar := Trim(S);

  iPosEspacos := Pos(' ',sAuxiliar);

  While  iPosEspacos <> 0 Do
  Begin
        iTam := Length(sAuxiliar);

        for x:= iposEspacos to iTam - 1 do
        Begin
          sAtual := sAuxiliar[x];
          sAuxiliar[x] := sAuxiliar[x+1];
          sAuxiliar[x+1] := sAtual;
        End;

        sAuxiliar := Trim(sAuxiliar);
        iPosEspacos := Pos(' ',sAuxiliar);
  End;

  Result := sAuxiliar;
End;

Function RemoveBarras2(Data: String): String;
Var Dia, Mes, Ano: Word;
    SDia, SMes, SAno: String;
    aData: TDateTime;
Begin
    {Retorna a data no formato ddmmyyyy sem as barras, independente do formato de entrada}
    If Trim(Data) = '' Then
       Result := '00000000'
    Else
    Begin
        aData := StrToDate(Data);
        DecodeDate(aData,Ano,Mes,Dia);
        SDia := IntToStr(Dia);
        SMes := IntToStr(Mes);
        SAno := IntToStr(Ano);
        If Length(SDia) = 1 Then SDia := '0' + SDia;
        If Length(SMes) = 1 Then SMes := '0' + SMes;
        Result := Sdia+Smes+Sano;
    End;
end;

Function RemoveBarras3(Data: String): String;
Var Dia, Mes, Ano: Word;
    SDia, SMes, SAno: String;
    aData: TDateTime;
Begin
    {Retorna a data no formato yyyymmdd sem as barras, independente do formato de entrada}
    If Trim(Data) = '' Then
       Result := '00000000'
    Else
    Begin
        aData := StrToDate(Data);
        DecodeDate(aData,Ano,Mes,Dia);
        SDia := IntToStr(Dia);
        SMes := IntToStr(Mes);
        SAno := IntToStr(Ano);
        If Length(SDia) = 1 Then SDia := '0' + SDia;
        If Length(SMes) = 1 Then SMes := '0' + SMes;
        Result := Sano+Smes+Sdia;
    End;
end;


Function RemovePontos(spHora: String): String;
Var Hora, Min, Seg, Mseg: Word;
    SHora, SMin, SSeg: String;
    aHora: TDateTime;
Begin
    If spHora = '' Then
       Result := '000000'
    Else
    Begin
        aHora := StrToTime(spHora);
        DecodeTime(aHora,Hora,Min,Seg,Mseg);
        sHora := IntToStr(Hora);
        sMin := IntToStr(Min);
        sSeg := IntToStr(Seg);

        If Length(sHora) = 1 Then sHora := '0' + sHora;
        If Length(sMin) = 1 Then sMin := '0' + sMin;
        If Length(sSeg) = 1 Then sSeg := '0' + sSeg;
        Result := sHora+sMin+sSeg;
    End;
End;



end.


