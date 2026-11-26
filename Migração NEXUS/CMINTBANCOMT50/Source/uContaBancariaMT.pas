{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Funções de formatação e persistência da dados de    }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                                                       }
{*******************************************************}

unit uContaBancariaMT;

interface

uses Classes, SysUtils;

//Formata a string adicionamdo zeros
function AddZero(sTexto: string; iNumDig: Integer; bAlinhaD: Boolean): string;

//Busca e retorna formatado o número da conta corrente do favorecido
function GetCC(iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string; Overload;
function GetCC(sNumConta: String; iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string; Overload;

//Busca e retorna formatado o número da agência do favorecido
function GetAG(iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string; Overload;
function GetAG(sNumAg: String; iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string; Overload;

//retorna o DV da conta corrente do favacido ou do parâmetro
function GetDvCC: string; Overload;
function GetDvCC(sNumCC: String): string; Overload;

//retorna o DV da agência do favacido ou do parâmetro
function GetDvAG: string; Overload;
function GetDvAG(sNumAg: String): string; Overload;

(* Funções para compatinilização com a CMIntBancoMT50 *)

Function  FormataCgcCpfConta(sNumDoc,sTipoDoc:String):String;
{Retorna o nosso número com o DV calculado para o padrão MODULO 11
 Esta função é utilizada na geração dos arquivos do BICBANCO, BBV(Cobrança Eletrônica),
 SANTANDER - Cobrança Registrada e do BANCO CIDADE}
function  CalculaModulo11(sNossoNumero: String; RestoZero : Boolean; Base : Integer): String;
{Retorna o nosso número com o DV calculado a paratir dos parâmetros}
Function  Modulo(Carteira,Divisor,base,Tam:Integer;NossoNumero: String): String;
function  CalculaDac10(sNum: string): Integer;
function CalcMod11Unibanco(sNossoNumero: String): String;
{Estas Funcoes foram criadas }
Function CalculaDacNovo(sNossoNumero: String; iModulo: Integer): String;
Function  ModuloNovo(Carteira,Divisor,base,Tam:Integer;NossoNumero: String): String;

implementation

Uses uString, uIntBancoManager;

function AddZero(sTexto: string; iNumDig: Integer; bAlinhaD: Boolean): string;
var
  temp  : string;
  X, Tam: Integer;
begin
  temp := sTexto;

  Tam := Length(temp);

  for X := 1 to iNumDig - Tam do
    if bAlinhaD then
      temp := '0' + temp
    else
      temp := temp + '0';

  Result := temp;
end;

function GetCC(iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string;  Overload;
var
  sConta: string;
begin
  sConta := MascaraAlfa(trim(IntBancoManager.CdsTexto.FieldByName('CONTACORRENTE').AsString));

  if not bUsaDv then
    sConta := Copy(sConta, 1, Length(sConta) - 1);

  if Length(sConta) >  iNumDig then
     sConta := Copy(sConta, Length(sConta) + 1 - iNumDig, iNumDig);

  if bAlinhaD then
    Result := ZD(sConta, iNumDig)
  else
    Result := ze(sConta, iNumDig);
end;

function GetAG(iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string; Overload;
var
  sAgencia: string;
  lii : integer;
begin
  //O Espaço no fim do número da agência tem de ser considerado
  //sAgencia := Trim(Biblioteca.QryTexto.FieldByName('NUMAGENCIA').AsString);

  sAgencia := MascaraAlfa(trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString));

  {P.Ramos-07.06.2001 - suportar agencias com qq tamanho < 5 caracteres
   num. agencias sao preenchidas com tantos '&' quantos necessarios
   para completar 5 caracteres
   substituiu o codigo posterior que suportava apenas 1 caracter &}

  for lii:=1 to length(sAgencia) do
    if sAgencia[lii] = '&' then
      sAgencia[lii]:=' ';
//  if Copy(sAgencia, Length(sAgencia), 1) = '&' then
//    sAgencia := Copy(sAgencia, 1, Length(sAgencia) - 1) + ' ';

  if (Length(sAgencia) > 4) and (not bUsaDv) then
     sAgencia := Copy(sAgencia,1,4);

  if Length(sAgencia) >  iNumDig then
     sAgencia := Copy(sAgencia, Length(sAgencia) + 1 - iNumDig, iNumDig);

  if bAlinhaD then
    Result := ZD(sAgencia, iNumDig)
  else
    Result := Ze(sAgencia, iNumDig);

end;

function GetDvCC: string; Overload;
var
  sConta: string;
begin
  sConta := MascaraAlfa(Trim(IntBancoManager.CdsTexto.FieldByName('CONTACORRENTE').AsString));
  Result := Copy(sConta, Length(sConta), 1);
end;

function GetDvAG: string; Overload;
var
  sAgencia: string;
begin
    sAgencia := MascaraAlfa(Trim(IntBancoManager.CdsTexto.FieldByName('NUMAGENCIA').AsString));

  If Length(sAgencia) >= 5 Then
     Result := Copy(sAgencia, Length(sAgencia), 1)
  Else
     Result := ' ';

  If Result = '&' Then Result := ' ';
end;

function GetCC(sNumConta: String; iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string;  Overload;
var
  sConta: string;
begin
  sConta := MascaraAlfa(Trim(sNumConta));

  if not bUsaDv then
    sConta := Copy(sConta, 1, Length(sConta) - 1);

  if Length(sConta) >  iNumDig then
     sConta := Copy(sConta, Length(sConta) + 1 - iNumDig, iNumDig);

  if bAlinhaD then
    Result := ZD(sConta, iNumDig)
  else
    Result := Ze(sConta, iNumDig);
end;

function GetAG(sNumAg: String; iNumDig: Integer; bUsaDv: Boolean; bAlinhaD: Boolean): string; Overload;
var
  sAgencia: string;
  lii : integer;
begin
  //O Espaço no fim do número da agência tem de ser considerado
  //sAgencia := Trim(Biblioteca.QryTexto.FieldByName('NUMAGENCIA').AsString);

  sAgencia := MascaraAlfa(trim(sNumAg));

  for lii:=1 to length(sAgencia) do
    if sAgencia[lii] = '&' then
      sAgencia[lii]:=' ';

  if (Length(sAgencia) > 4) and (not bUsaDv) then
     sAgencia := Copy(sAgencia,1,4);

  if Length(sAgencia) >  iNumDig then
     sAgencia := Copy(sAgencia, Length(sAgencia) + 1 - iNumDig, iNumDig);

  if bAlinhaD then
    Result := ZD(sAgencia, iNumDig)
  else
    Result := ZE(sAgencia, iNumDig);

end;

function GetDvCC(sNumCC: String): string; Overload;
var
  sConta: string;
begin
  sConta := MascaraAlfa(Trim(sNumCC));
  Result := Copy(sConta, Length(sConta), 1);
end;

function GetDvAG(sNumAg: String): string; Overload;
var
  sAgencia: string;
begin
    sAgencia := MascaraAlfa(Trim(sNumAg));

    If Length(sAgencia) >= 5 Then
       Result := Copy(sAgencia, Length(sAgencia), 1)
    Else
       Result := ' ';

    If Result = '&' Then Result := ' ';     
end;

function CalculaDac10(sNum: string): Integer;
var
  sNumero, sAuxResult                    : string;
  iPosicao, iBase, X, iDividendo, iDigito: Integer;
begin
  sNumero := Trim(sNum);
  iPosicao := Length(sNumero) + 1;
  iBase := 2;
  iDividendo := 0;

  for X := 1 to Length(sNumero) do
  begin
    sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - X]) * iBase));

    if Length(sAuxResult) > 1 then
      iDividendo := iDividendo + StrToInt(sAuxResult[1]) + StrToInt(sAuxResult[2])
    else
      iDividendo := iDividendo + StrToInt(sAuxResult[1]);
    Dec(iBase);
    if iBase = 0 then iBase := 2;
  end;

  if (iDividendo mod 10) = 0 then
    iDigito := 0
  else
    iDigito := 10 - (iDividendo mod 10);
  Result := iDigito
end;

Function FormataCgcCpfConta(sNumDoc,sTipoDoc:String):String;
Var
  sResultDoc, sDocumento, sDacDoc: String;
Begin

    sDocumento := Copy(Trim(sNumDoc),1,
                  Length(Trim(sNumDoc))-2);

    sDacDoc :=  Copy(Trim(sNumDoc),
                Length(Trim(sNumDoc))-1,2);

    If sTipoDoc = '01' Then
       sResultDoc := Zd(sDocumento,9) + '000' + sDacDoc
    Else
       sResultDoc := sNumDoc;

    Result := ZD(sResultDoc,14);
End;

function CalculaModulo11(sNossoNumero: String; RestoZero : Boolean; Base : Integer): String;
Var
   sNumero: String;
   Divisor, iResto,iBase, x, iDividendo, iDigito : Integer;
Begin
     sNumero    := sNossoNumero;
     iBase      := 2;
     iDividendo := 0;
     Divisor    := 11;
     For X := Length(sNumero) downto 1 do
     begin
       iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);

       Inc(iBase);
       if iBase > Base Then
          iBase := 2;
     end;
     iResto := (iDividendo Mod Divisor);
     iDigito := Divisor - (iDividendo Mod Divisor);

     if not RestoZero then
     Case iResto of
       0: iDigito := 1;
       1: iDigito := 0;
     End
     else
       Case iResto of  0,1: iDigito := 0; end;
     Result := sNossoNumero + IntToStr(iDigito);
end;

Function Modulo(Carteira, Divisor, base, Tam : Integer; NossoNumero: String): String;
Var
   sNumero: String;
   iBase, x, iDividendo, iDigito: Integer;
Begin
     sNumero := NossoNumero;

     iBase := base;
     iDividendo := 0;
     For X:=1 to Length(sNumero) do
     begin
         iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);
         if iBase = 2 Then
          iBase := base
         Else
          Dec(iBase);
     end;
     If (iDividendo Mod Divisor) <> 0 Then
         iDigito := Divisor - (iDividendo Mod Divisor)
     Else
         iDigito := 0;

     If iDigito = 10 Then
        Result := ZD(NossoNumero,Tam) + 'P'
     Else
        Result := ZD(NossoNumero,Tam) + IntToStr(iDigito);
end;

function CalcMod11Unibanco(sNossoNumero: String): String;
var
   sNumero: String;
   Divisor, iResto,iBase, x, iDividendo, iDigito : Integer;
begin
  sNumero    := sNossoNumero;
  iBase      := 2;
  iDividendo := 0;
  Divisor    := 11;
  For X := Length(sNumero) downto 1 do
  begin
    iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);
    Inc(iBase);
    if iBase > 9 Then
       iBase := 2;
  end;
  iDividendo := iDividendo * 10;
  iResto := (iDividendo Mod Divisor);
  iDigito := (iDividendo Mod Divisor);
  case iResto of
    0,10: iDigito := 0;
  end;
  Result := sNossoNumero + IntToStr(iDigito);
end;

Function CalculaDacNovo(sNossoNumero: String; iModulo: Integer): String;
Var
  sNumero: String;
  iBase, X, iDividendo, iDigito, iTamNum, iresto: Integer;
Begin
  sNossoNumero := Trim(sNossoNumero);

  Case iModulo Of
    320:
      Begin
        sNumero := sNossoNumero;
        iBase := 2;
        iDividendo := 0;
        iTamNum := Length(sNumero) + 1;
        For X := 1 To Length(sNumero) Do
        Begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
          If iBase = 9 Then
            iBase := 2
          Else
            Inc(iBase);
        End;
        iresto := (iDividendo Mod 11);
        Case iResto of
           0: Result := sNumero + '1';  {29/04/2003 Clementino}
           1: Result := sNumero + '0';  {29/04/2003 Clementino}
          10: Result := sNumero + '1';  {14/05/2003 Clementino}
          11: Result := sNumero + '0';  {14/05/2003 Clementino}
        Else
        begin
          iDigito := 11 - (iDividendo Mod 11);
          Result := sNumero + IntToStr(iDigito);
        end;
        End;
        Result := trim(Copy(Trim(Result), 4, Length(Trim(Result))-3));
      End;
  End;
End;

Function ModuloNovo(Carteira, Divisor, base, Tam : Integer; NossoNumero: String): String;
Var
   sNumero: String;
   iBase, x, iDividendo, iDigito: Integer;
Begin
     sNumero := Trim(IntToStr(Carteira))+NossoNumero;

     iBase := base;
     iDividendo := 0;
     For X:=1 to Length(sNumero) do
     begin
         iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);
         if iBase = 2 Then
          iBase := base
         Else
          Dec(iBase);
     end;
     If (iDividendo Mod Divisor) <> 0 Then
         iDigito := Divisor - (iDividendo Mod Divisor)
     Else
         iDigito := 0;

     If iDigito = 10 Then
        Result := ZD(NossoNumero,Tam) + 'P'
     Else
        Result := ZD(NossoNumero,Tam) + IntToStr(iDigito);
end;

end.

