unit UFuncoesUteisFB;
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
interface

uses SysUtils, Classes, StdCtrls, WinTypes, Dialogs, Buttons, Forms, wwTable, Wwquery, uSistema
     ,uCMMath;//Bruno Azevedo SOL 132237 KINTANA 760615

type
   str1  = string[01];
   str2  = string[02];
   str5  = string[05];
   str6  = string[06];
   str7  = string[07];
   str8  = string[08];
   str10 = string[10];
   str11 = string[11];
   str12 = string[12];
   str14 = string[14];
   str15 = string[15];
   str16 = string[16];
   str20 = string[20];
   str25 = string[25];
   str26 = string[26];
   str35 = string[35];
   str40 = string[40];
   str45 = string[45];
   str50 = string[50];
   str80 = string[80];

type
  TDiaMes=array[1..12]  of Integer;
  TDiaData=array[1..12] of Word;

function  ColocaZeros(Codigo:str80;Tam:byte):str80; // Coloca Zeros à direita de uma String
function  PreparaData(var Data:str10):boolean; // Verifica de Data é Válida, coloca 19??
function  TotDiasNoAno(Mes,Ano:Integer):LongInt; // Totalizador de Dias no Ano
function  CalculaData(Data1,Data2:str10;var NumDias,NumMeses,NumAnos:LongInt):boolean;
          // Diferença entre Datas sem considerar o Dia
function  CalculaData1(Data1,Data2:str10;var NumDias,NumMeses,NumAnos:Integer):boolean;
          // Diferença entre Datas considerando o Dia
function  ColocaBarra(Data:str10):str10; // Coloca Barra na Data
function  TiraBarra(Data:str10):str10;   // Tira Barra da Data
function  PreparaStr(Codigo:str80;Tam:byte):str80; // Coloca Brancos a Direita numa String
function  IncData(Data:str10;Dias,Meses,Anos:Integer):str10; // Incrementa Datas
function  AnoBissexto(aAno:Integer):Boolean; // Verifica se é Ano Bissexto
function  TrazUltDiaMes(aMes,aAno:Integer):Integer; // Traz último dia do mês
function  TrazUltDiaData(aData:TDateTime):TDateTime; // Traz último dia do mês no formato data
function  IFF(Condicao:boolean;Primeiro,Segundo:string):string;
function  IntCod(Valor:LongInt;NumCasas:byte):Str20;
function  DataBrit(Data:str10):str10;
function  DataAnsi(Data:str10):str10;
function  FormataValor(Valor:str20;NumCasas,Decimais:byte):str20;
function  FormataValor1(Valor:str20;NumCasas,Decimais:byte):str20; // Com separador de milhares
function  LeftPad(Texto:string;Tam:byte):string;  {mageia o texto pela direita}
function  TiraCaracter(aTexto:str20;aChar:Char):str20;
function  TrocaCaracter(Texto:string;De,Para:char):string;
function  BuscaListaSequencial(Lista:TStringS;Tam:byte;Codigo:str80;MsgErr:str80):str80;
function  DiaFeriado(aData:TDateTime;aMunicipio:Integer;aQry:TwwQuery):Boolean;
function  RetornaMes(pMes : string) : string;
function  RetornaNomeMes(iMes : integer) : string;
function  RetornaAnoMes(Data : TDateTime) : string;
function  ValNumero(Numero:str20):boolean; {aceita '0..9'}
procedure RestauraIcone(qry : TwwQuery);
function  EditarMascara(sMascara:string) : string;
function  DiferencaMeses(DtIni, DtFim : string; qryAux:TwwQuery):Integer;
function  MudaSeparador(sNumero : string):string;
function  Float2String (pValor : double) : string;
function  String2Float (pStr : string) : double;
function  TempoDecorrido(iMiliSeg : integer) : string;

{----------------------------------------------------------------}
function Replicate(aTexto:string;NumVezes:Integer):string;
function ValStr(aValor:Double;aCasas,Decimais:Integer;
                FormatarMilhar:boolean;SepDec:string):string; {passar '' em sepdec para usar o default do windows}
function ArredondaValor(aValor:Double; Decimais:Integer):Double;
procedure GravaSql(sSql:string);
function AjustaDataUltDiaMes(aData:string):string;  //  formato dd/mm/yyyy

function pStr(Valor:String):string;
function To_Date(Data:string):string;   //Formato dd/mm/yyyy


{----------------------------------------------------------------}

function CalculaDifMeses(qryaux : twwquery ; sDataIni, sDataFim : string) : Integer;

function CalculaDifMesesDec(qryaux : twwquery ; sDataIni, sDataFim : string) : Double;


//funções de auxílio a conversão
function  OraNumero1(sNumero : string):string;
function  TruncaRound(f:String;n:integer):string;

function  TruncaMoeda(pNumero: double) : double;
function  ArredondaMoeda(pNumero: double) : double;


implementation

uses dBaseDados, math;

function ColocaZeros(Codigo:str80;Tam:byte):str80;
var
  TamTemp:byte;
  Valor:LongInt;
  Erro:Integer;
begin
  ColocaZeros:=Codigo;
  Codigo:=Trim(Codigo);
  if Codigo='' then
    exit;
  val(Codigo,Valor,Erro);
  if Erro<>0 then begin
    ColocaZeros := PreparaStr(Codigo,Tam);
    exit;
  end;
  Codigo:=IntToStr(Valor);  {tira os zeros que existiam antes}
  TamTemp:=length(Codigo);
  while TamTemp<Tam do begin
    Codigo:='0'+Codigo;
    TamTemp:=length(Codigo);
  end;
  ColocaZeros:=Codigo;
end;

function IntCod(Valor:LongInt;NumCasas:byte):Str20;
var
  S:str20;
  Erro:Integer;
begin
  if Valor=0 then begin
    IntCod:='';
    exit;
  end;
  str(Valor:NumCasas,S);
  IntCod:=ColocaZeros(S,NumCasas);
end;

function DataAnsi(Data:str10):str10;
var
  Posic:byte;
begin
  Posic:=Pos('/',Data);
  if Posic>0 then
    Data:=TiraCaracter(Data,'/'); {1234567890}
  Data:=copy(Data,5,4)+           {ddmmaaaa  }
        copy(Data,3,2)+
        copy(Data,1,2);
  DataAnsi:=Data;
end;

function DataBrit(Data:str10):str10;
var
  Posic:byte;
begin
  Posic:=Pos('/',Data);
  if Posic>0 then
     Data:=TiraCaracter(Data,'/');   {1234567890}
  Data:=copy(Data,7,2)+              {aaaammdd  }
        copy(Data,5,2)+
        copy(Data,1,4);
  DataBrit:=Data;
end;

function PreparaData(var Data:str10):boolean;
Label
  ERRO;
var
  Dia,Mes,Ano:string[4];
  D,M,A:Integer;
  Posic:byte;
begin
  Posic:=Pos('/',Data);
  if Posic>0 then
    Data:=TiraBarra(Data);
  if trim(Data)='' then begin
    PreparaData:=true;
    exit;
  end;
  PreparaData:=false;
  Dia:=trim(copy(Data,1,2));     {1234567890}
  Mes:=trim(copy(Data,3,2));     {ddmmaaaa}
  Ano:=trim(copy(Data,5,4));
  A:=strtoint(Ano);
  if A<100 then
    Ano:='19'+colocazeros(Ano,2);
  A:=strtoint(Ano);
  if (A<1900) or (A>2999) then
    goto ERRO;
  D:=strtoint(Dia);
  M:=strtoint(Mes);
  if (D<1) or (D>31) or (M<1) or (M>12) then
    goto ERRO;
  case M of
    2:begin
        if (D=29) and ((A mod 4)<>0) then
          goto ERRO;
        if (D>29) then
          goto ERRO;
      end;
    4,6,9,11:if D>30 then
               goto ERRO;
  end;
  Dia:=colocazeros(inttostr(D),2);
  Mes:=colocazeros(inttostr(M),2);
  Ano:=inttostr(A);
  if Posic>0
    then Data:=Dia+'/'+Mes+'/'+Ano
    else Data:=Dia+Mes+Ano;
  PreparaData:=true;
  exit;              {se estiver certo sai aqui, nao vai para a proxima sentenca}
ERRO:                {se houve erro todo processamento e desviado para aqui}
  messagedlg('Data inválida',mterror,[mbok],0);
  PreparaData:=false;
end;

function TotDiasNoAno(Mes,Ano:Integer):LongInt;
const
  DiasNoAno:array[1..12] of Integer =
    ( 0,                                  {jan}
      31,                                 {fev}
      31+28,                              {mar}
      31+28+31,                           {abr}
      31+28+31+30,                        {mai}
      31+28+31+30+31,                     {Jun}
      31+28+31+30+31+30,                  {jul}
      31+28+31+30+31+30+31,               {ago}
      31+28+31+30+31+30+31+31,            {set}
      31+28+31+30+31+30+31+31+30,         {out}
      31+28+31+30+31+30+31+31+30+31,      {nov}
      31+28+31+30+31+30+31+31+30+31+30);  {dez}
begin
  if (Ano mod 4) = 0    {ano bisexto}
    then TotDiasNoAno:=DiasNoAno[Mes]+1
    else TotDiasNoAno:=DiasNoAno[Mes];
end;

function CalculaData(Data1,Data2:str10;var NumDias,NumMeses,NumAnos:LongInt):boolean;
var
  D1,M1,A1,                {1234567890}
  D2,M2,A2:Integer;        {dd/mm/aaaa}
  TD1,TD2 :LongInt;
begin
  CalculaData := False;
  if not PreparaData(Data1) or not PreparaData(Data2) then
     exit;
  D1 := strtoint(copy(Data1,1,2));
  M1 := strtoint(copy(Data1,3,2));
  A1 := strtoint(copy(Data1,5,4));
  D2 := strtoint(copy(Data2,1,2));
  M2 := strtoint(copy(Data2,3,2));
  A2 := strtoint(copy(Data2,5,4));
  try
    TD1 := (D1+TotDiasNoAno(M1,A1)+Trunc(365.25*(A1-1)));
    TD2 := (D2+TotDiasNoAno(M2,A2)+Trunc(365.25*(A2-1)));
    NumDias  := TD2-TD1;
  except
    NumDias  := 1;
  end;
  NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
  NumAnos  := Trunc(NumDias/365.25);
  CalculaData := True;
end;

function CalculaData1(Data1,Data2:str10;var NumDias,NumMeses,NumAnos:Integer):boolean;
var
  D1,M1,A1,                {1234567890}
  D2,M2,A2:Integer;        {dd/mm/aaaa}
  TD1,TD2 :LongInt;
begin
  CalculaData1 := False;
  if not PreparaData(Data1) or not PreparaData(Data2) then
     exit;
  D1 := strtoint(copy(Data1,1,2));
  M1 := strtoint(copy(Data1,3,2));
  A1 := strtoint(copy(Data1,5,4));
  D2 := strtoint(copy(Data2,1,2));
  M2 := strtoint(copy(Data2,3,2));
  A2 := strtoint(copy(Data2,5,4));
  TD1 := (D1+TotDiasNoAno(M1,A1)+Trunc(365.25*(A1-1)));
  TD2 := (D2+TotDiasNoAno(M2,A2)+Trunc(365.25*(A2-1)));
  NumDias  := TD2-TD1;
  NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
  if D1 < D2 then
    NumMeses := NumMeses - 1;
  NumAnos  := Trunc(NumMeses/12);
  CalculaData1 := True;
end;

function ColocaBarra(Data:str10):str10;
var
  Posic:byte;
begin
  ColocaBarra:=Data;
  Posic:=Pos('/',Data);
  if Posic>0 then
    exit;
  ColocaBarra:=copy(Data,1,2)+'/'+  {1234567890}
               copy(Data,3,2)+'/'+  {ddmmaaaa  }
               copy(Data,5,4);
end;

function TiraBarra(Data:str10):str10;
var
  Posic:byte;
begin
  Posic:=Pos('/',Data);
  if Posic>0 then begin
    delete(Data,Posic,1);
    Posic:=Pos('/',Data);
    if Posic>0 then
      delete(Data,Posic,1);
  end;
  TiraBarra:=Data;
end;

function PreparaStr(Codigo:str80;Tam:byte):str80;
var
  I:byte;
begin
  if Length(Codigo)<>Tam then begin
    Codigo:=trim(Codigo);
    if Length(Codigo)>Tam
      then Codigo:=copy(Codigo,1,Tam)
      else for I:=Length(Codigo) to (Tam-1) do
             Codigo:=Codigo+' ';
  end;
  PreparaStr:=Codigo;
end;

function IncData(Data:str10;Dias,Meses,Anos:Integer):str10;
var
  xDia,xMes,xAno:Integer;
  Posic:byte;
  I : Integer;
  UltDia : Boolean;
begin
   Posic:=pos('/',Data);
   if Posic>0 then
      Data:=TiraBarra(Data);
   xDia := strtoint(Copy(Data,1,2));
   xMes := strtoint(Copy(Data,3,2));
   xAno := strtoint(Copy(Data,5,4));
   // Verifica se é o último dia do mês
   if xDia = TrazUltDiaMes(xMes,xAno) then
      UltDia := True
   else
      UltDia := False;
   // Começa a Somar
   // Soma Ano
   xAno := xAno + Anos;
   // Soma Mês
   if Meses >= 0 then
      for I := 0 to Meses-1 do begin
         xMes := xMes + 1;
         if xMes = 13 then begin
            xMes := 1;
            xAno := xAno + 1;
         end;
      end
   // Diminui Mês
   else begin
      Meses := -Meses;
      for I := 0 to Meses-1 do begin
         xMes := xMes - 1;
         if xMes = 0 then begin
            xMes := 12;
            xAno := xAno - 1;
         end;
      end;
   end;
   if xDia > TrazUltDiaMes(xMes,xAno) then
      xDia := TrazUltDiaMes(xMes,xAno);
   if UltDia then
      xDia := TrazUltDiaMes(xMes,xAno);
   // Soma Dias
   if Dias >= 0 then
      for I := 0 to Dias-1 do begin
         if xDia = TrazUltDiaMes(xMes,xAno) then begin
            xDia := 1;
            xMes := xMes + 1;
            if xMes = 13 then begin
               xMes := 1;
               xAno := xAno + 1;
            end;
         end
         else
            xDia := xDia + 1;
      end
   // Diminui Dias
   else begin
      Dias := -Dias;
      for I := 0 to Dias-1 do begin
         if xDia = 1 then begin
            xMes := xMes - 1;
            if xMes = 0 then begin
               xMes := 12;
               xAno := xAno - 1;
            end;
            xDia := TrazUltDiaMes(xMes,xAno);
         end
         else
            xDia := xDia - 1;
      end;
   end;
   if xDia < 10 then
      Data := '0'+InttoStr(xDia)
   else
      Data := InttoStr(xDia);
   if xMes < 10 then
      Data := Data + '0' + InttoStr(xMes)
   else
      Data := Data + InttoStr(xMes);
   Data := Data + InttoStr(xAno);
   if Posic>0 then
      Data:=ColocaBarra(Data);
   IncData:=Data;
end;

function AnoBissexto(aAno:Integer):Boolean;
begin
  if  (aAno mod 4 = 0) then
    AnoBissexto  := True
  else
    AnoBissexto  := False;
end;

function TrazUltDiaMes(aMes,aAno:Integer):Integer;
var
  mDiaMes  : TDiaMes;
begin
  mDiaMes[01] := 31;
  mDiaMes[02] := strtoint(iff(AnoBissexto(aAno),'29','28'));
  mDiaMes[03] := 31;
  mDiaMes[04] := 30;
  mDiaMes[05] := 31;
  mDiaMes[06] := 30;
  mDiaMes[07] := 31;
  mDiaMes[08] := 31;
  mDiaMes[09] := 30;
  mDiaMes[10] := 31;
  mDiaMes[11] := 30;
  mDiaMes[12] := 31;
  TrazUltDiaMes := mDiaMes[aMes];
end;

function TrazUltDiaData(aData:TDateTime):TDateTime;
var
  mDiaMes  : TDiaData;
  aDay, aMonth, aYear : Word;
begin
  DecodeDate(aData,aYear,aMonth,aDay);
  mDiaMes[01] := 31;
  mDiaMes[02] := strtoint(iff(AnoBissexto(aYear),'29','28'));
  mDiaMes[03] := 31;
  mDiaMes[04] := 30;
  mDiaMes[05] := 31;
  mDiaMes[06] := 30;
  mDiaMes[07] := 31;
  mDiaMes[08] := 31;
  mDiaMes[09] := 30;
  mDiaMes[10] := 31;
  mDiaMes[11] := 30;
  mDiaMes[12] := 31;
  TrazUltDiaData := EncodeDate(aYear, aMonth, mDiaMes[aMonth]);
end;


function AjustaDataUltDiaMes(aData:string):string;  //  formato dd/mm/yyyy
var
  aDia,aMes,aAno:Integer;
  UltDia:Integer;
begin
  aDia:=strtoint(Copy(aData,1,2));
  aMes:=strtoint(Copy(aData,4,2));
  aAno:=strtoint(Copy(aData,7,4));
  UltDia:=TrazUltDiaMes(aMes,aAno);
  if aDia>UltDia then
    aDia:=UltDia;
  aData:=IntCod(aDia,2)+'/'+IntCod(aMes,2)+'/'+IntCod(aAno,4);
  Result:=aData;
end;

function TiraCaracter(aTexto:str20; aChar:Char):str20;
var
  Posic:byte;
begin
  Posic:=Pos(aChar,aTexto);
  if Posic>0 then begin
    delete(aTexto,Posic,1);
    Posic:=Pos(aChar,aTexto);
    if Posic>0 then
      delete(aTexto,Posic,1);
  end;
  TiraCaracter:=aTexto;
end;

function TrocaCaracter(Texto:string;De,Para:char):string;
var
  Posic : byte;
begin
  repeat
    Posic := pos(De,Texto);
    if Posic > 0 then
      Texto[Posic]:=Para;
  until (Posic = 0);
  TrocaCaracter:=Texto;
end;

function BuscaListaSequencial(Lista:TStringS;Tam:byte;Codigo:str80;MsgErr:str80):str80;
var
  I    : Integer;
  Achou: boolean;
begin
  BuscaListaSequencial:=Codigo;
  if Codigo='' then
     Exit;
  if Lista.Indexof(Codigo)>-1 then  {ja achou, nao precisa procurar por codigo}
     Exit;

  //Codigo:=colocazeros(copy(Codigo,1,Tam),Tam);
  I:=0;
  Achou:=false;
  while not Achou and (I<Lista.Count) do begin
    Achou:=(copy(Lista[I],1,Tam)=Codigo);
    if Achou
      then Codigo:=Lista[I]
      else inc(I);
  end;

  if not Achou then
  begin
    Codigo := '';
    if MsgErr <> '' then
       showmessage(MsgErr);
  end;
  BuscaListaSequencial := Codigo;
end;

function IFF(Condicao:boolean;Primeiro,Segundo:string):string;
begin
  if Condicao
    then IFF:=Primeiro
    else IFF:=Segundo;
end;

function DiaFeriado(aData:TDateTime;aMunicipio:Integer;aQry:TwwQuery):Boolean;
begin
  DiaFeriado := False;
end;

function RetornaMes( pMes : string ) : string;
begin
     if pmes = 'Janeiro'    then Result := '01';
     if pmes = 'Fevereiro'  then Result := '02';
     if pmes = 'Março'      then Result := '03';
     if pmes = 'Abril'      then Result := '04';
     if pmes = 'Maio'       then Result := '05';
     if pmes = 'Junho'      then Result := '06';
     if pmes = 'Julho'      then Result := '07';
     if pmes = 'Agosto'     then Result := '08';
     if pmes = 'Setembro'   then Result := '09';
     if pmes = 'Outubro'    then Result := '10';
     if pmes = 'Novembro'   then Result := '11';
     if pmes = 'Dezembro'   then Result := '12';
end; // RetornaMes

function RetornaNomeMes(iMes : integer) : string;
begin
     Case iMes of
         1 : Result := 'Janeiro';
         2 : Result := 'Fevereiro';
         3 : Result := 'Março';
         4 : Result := 'Abril';
         5 : Result := 'Maio';
         6 : Result := 'Junho';
         7 : Result := 'Julho';
         8 : Result := 'Agosto';
         9 : Result := 'Setembro';
        10 : Result := 'Outubro';
        11 : Result := 'Novembro';
        12 : Result := 'Dezembro';
     else Result := ''
     end;
end; // RetornaNomeMes

function RetornaAnoMes(Data : TDateTime) : string;
var wAno, wMes, wDia : word;
    sAux : string;
begin
   sAux := '';
   DecodeDate(Data, wAno, wMes, wDia);
   sAux := IntToStr(wAno) + '/';
   if wMes < 10
   then sAux := sAux + '0' + IntToStr(wMes)
   else sAux := sAux + IntToStr(wMes);
   Result := sAux;
end; // RetornaAnoMes

function MudaSeparador(sNumero : string):string;
var i : integer;
    sOra : string;
begin
   sOra  := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if (sNumero[i] = '.') or (sNumero[i] = ',') then
        sOra   := sOra + DecimalSeparator
     else sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;

function FormataValor(Valor:str20;NumCasas,Decimais:byte):str20;
var
  Op1:Double;
begin
  FormataValor :='';
  if Valor = '' then
     Exit;
  Valor := MudaSeparador(Trim(Valor));  // ALTARADO
  Op1   := StrToFloat(Valor);
  if Decimais > 0
  then FormataValor:=trim(Format('%'+InttoStr(NumCasas)+'.'+InttoStr(Decimais)+'f',[Op1]))
  else FormataValor:=trim(Format('%'+InttoStr(NumCasas)+'f',[Op1]));
end;

function FormataValor1(Valor:str20;NumCasas,Decimais:byte):str20;
var
  Op1:Double;
begin
  FormataValor1 :='';
  if Valor = '' then
     Exit;
  Valor := MudaSeparador(Trim(Valor));  // ALTARADO
  Op1   := StrToFloat(Valor);
  if Decimais > 0
  then FormataValor1 := trim(Format('%'+InttoStr(NumCasas)+'.'+InttoStr(Decimais)+'n',[Op1]))
  else FormataValor1 := trim(Format('%'+InttoStr(NumCasas)+'n',[Op1]));
end;

function LeftPad(Texto:string;Tam:byte):string;  {mageia o texto pela direita}
begin                                            {  ideal para formatacao de numeros}
  Texto:=trim(Texto);
  while Tam>Length(Texto) do
    Texto:=' '+Texto;
  LeftPad:=Texto;
end;

function ValNumero(Numero:str20):boolean;
var
  Tam,Posic:byte;
  HouveErro:boolean;
begin
  if Numero='' then Result := False;
  Posic:=1;
  HouveErro:=false;
  repeat
    if not (Numero[Posic] in ['0'..'9']) then
    begin
      HouveErro:=True;
      delete(Numero,Posic,1);
    end
    else inc(Posic);
  Tam:=Length(Numero);
  until HouveErro or (Posic>Tam) or (Tam=0);
  ValNumero:= not HouveErro;
end;

procedure RestauraIcone(qry : TwwQuery);
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT * FROM DUAL');
  qry.Open;
  qry.Close;
end; // RestauraIcone(qry : TwwQuery);

function EditarMascara(sMascara:string) : string;
{ Transforma uma mascara com 9's e #'s em uma mascara compativel com o Tfield Editmask}
var I : integer;
    sTemp : string;
begin
     Result := '';
     for I := 1 to Length(sMascara) do
     begin
          sTemp := Copy(sMascara,I,1);
          if (sTemp = '9') or (sTemp ='#') then
             Result := Result + sTemp
          else
              Result := Result+'\'+sTemp;
     end;
     if Result <> '' then
        Result := Result+';0; ';
end;

function DiferencaMeses(DtIni, DtFim : string; qryAux:TwwQuery):Integer;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT MONTHS_BETWEEN(TO_DATE('''+DtIni+''',''dd/mm/yyyy''), '+
                 'TO_DATE('''+DtFim+''',''dd/mm/yyyy'')) AS MESES FROM DUAL');
  try
    qryAux.Open;
    Result := qryAux.FieldByName('MESES').AsInteger;
  except
    Result := 0;
  end;
  qryAux.Close;
end;

function Float2String (pValor : double) : string;
var
  cAuxSeparator : char;
begin
  cAuxSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  Result := FormatFloat('#0.00',pValor);
  DecimalSeparator := cAuxSeparator;
end; // Float2String

function String2Float (pStr : string) : double;
var
  cAuxSeparator : char;
begin
  cAuxSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  Result := StrToFloat(pStr);
  DecimalSeparator := cAuxSeparator;
end; // String2Float

function TempoDecorrido(iMiliSeg : integer) : string;
var
  sAux : string;
begin
  sAux := '';
  if (iMiliSeg div 3600000) > 0
  then begin
         sAux := IntToStr(iMiliSeg div 3600000) + ' Hora(s),';
         iMiliSeg := iMiliSeg mod 3600000;
       end;
  if (iMiliSeg div 60000) > 0
  then begin
         sAux := sAux + IntToStr(iMiliSeg div 60000) + ' Minuto(s),';
         iMiliSeg := iMiliSeg mod 60000;
       end;
  if (iMiliSeg div 1000) > 0
  then begin
         sAux := sAux + IntToStr(iMiliSeg div 1000) + ' Segundo(s),';
         iMiliSeg := iMiliSeg mod 1000;
       end;

  Result := sAux;
end; // TempoDecorrido

function  TruncaMoeda(pNumero: double) : double;
 var p: double;
     s: string;
begin
  p:=pNumero*100;
  s:=floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p:=trunc(p);
  result:=p/100;
end;

function  ArredondaMoeda(pNumero: double) : double;
 var p: double;
     s: string;
begin
  p:=pNumero*100;
  s:=floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p:=round( p );
  result :=p/100;
  Result := RoundCM(Result,2); //Bruno Azevedo SOL 132237 KINTANA 760615
end;

function  Trunca(pNumero : double; pCasas : byte) : double;
 var p: double;
     s: string;
     pc: extended;
begin
  pc:=pCasas;
  pc := Power(10, pc);
  p := pNumero * p;
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := trunc(p);
  p := p / pc;
  result:=p;

end;

function Arredonda(pNumero : double;pCasas : byte) : double;
 var p: double;
     s: string;
begin
  p := pNumero * Power( 10, pCasas);
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := round( p );
  p := p / Power( 10, pCasas );
  result:=p;

end;

function TruncaRound(f:String;n:integer):string;
var
 i,j:integer;
 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
       rInteiro := strtofloat(result);
       rInteiro := strtofloat(f)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));

       if j <> 0 then  rInteiro := ArredondaValor(rinteiro,0);
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

function truncar(f:Double;n:integer):string;
var
 i:integer;
 Inteiro , Decimal : String;
begin
    Result:= floattostr(f);

    i:=pos(decimalseparator,result);
    if i <> 0 then
    begin
       Inteiro := copy(Result,1,i);
       Decimal := Copy(Result,i+1,n);
       Result := Inteiro+Decimal;
    end;
end;

function OraNumero1(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
  sOra := '';
  bPrimPonto := False;
  sNumero := Trim(sNumero);
  for i := length(sNumero) downto 1 do begin
     if sNumero[i] = ',' then begin
        if not bPrimPonto then begin
           sOra := sOra + DecimalSeparator;
           bPrimPonto := True;
        end
        else
           sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.' then
           sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto then begin
              sOra := sOra + DecimalSeparator;
              bPrimPonto := True;
           end
           else
              sOra := sOra;
        end;
     end;
  end;
  sResult := '';
  for i := length(sOra) downto 1 do begin
     sResult := sResult + sOra[i];
  end;
  Result := sResult;
end;



{---------------------------------------------------------------------}

function Replicate(aTexto:string;NumVezes:Integer):string;
var
  I:Integer;
  Temp:string;
begin
  Temp:='';
  for I:=1 to NumVezes do
    Temp:=Temp+aTexto;
  Result:=Temp;
end;


function ValStr(aValor:Double;aCasas,Decimais:Integer;
                FormatarMilhar:boolean;SepDec:string):string; {passar '' em sepdec para usar o default do windows}
var
  sValor,sMascara,SepMilhar:String;
  Posic,PosDecimal:Integer;
  Casas:Integer;
  cAux:char;
begin
  Casas:=aCasas;
  if Decimais>0 then           {O parametro passado Casas contem o tamanho total do campo inclusive o ponto e as decimais, se existirem}
    Casas:=Casas-Decimais-1;   {  Aqui na rotina o parametro casas se refere a parte inteira sómente}
  sMascara:='0';
  for Posic:=2 to Casas do
  begin
    if FormatarMilhar and ((Posic mod 3)=0) then
      sMascara:=',#'+sMascara
    else
      sMascara:='#'+sMascara;
  end;
  if Decimais>0 then
    sMascara:=sMascara+'.'+Replicate('0',Decimais);
  cAux:=DecimalSeparator;
  if SepDec<>'' then
    DecimalSeparator:=SepDec[1];
  sValor:=FormatFloat(sMascara,aValor);
  DecimalSeparator:=cAux;
  sValor:=Copy(sValor,1,aCasas);
  if sValor[Length(sValor)]=DecimalSeparator then
    SetLength(sValor,Length(sValor)-1);
  Result:=sValor;
end;


function ArredondaValor(aValor:Double;Decimais:Integer):Double;
begin
  Result:=StrToFloat(ValStr(aValor,17,Decimais,false,DecimalSeparator));
end;

procedure GravaSql(sSql:string);
var
  sSql1,sSql2:string;
  xSql:string;
  Posic:Integer;
  ListaTemp:TStringS;
  PosWhere:Integer;
  Arq:TextFile;
  HouveErro:boolean;
begin
  try

    //Jéssica Lana SOL 109421 KINTANA 496332
    //Assign(Arq,'c:\sql\sql.txt');
    Assign(Arq, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sql.txt');


    ReWrite(Arq);
    HouveErro:=false;
  except
    HouveErro:=true;
  end;
  if HouveErro then
  begin
    try

      //Jéssica Lana SOL 109421 KINTANA 496332
      //MkDir('c:\sql\');
      MkDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sql');
      //Assign(Arq,'c:\sql\sql.txt');
      Assign(Arq, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sql\sql.txt');

      ReWrite(Arq);
    except
      exit;
    end;
  end;
  ListaTemp:=TStringList.Create;
  ListaTemp.Clear;
  sSql:=UpperCase(sSql);
  PosWhere:=Pos('WHERE',sSql);
  sSql1:=trim(copy(sSql,1,PosWhere-1))+'   ';
  delete(sSql,1,PosWhere-1);
  sSql2:=Trim(sSql);
  Posic:=0;
  while trim(sSql1)<>'' do
  begin
    Posic:=pos('   ',sSql1);
    xSql:=trim(copy(sSql1,1,Posic));
    ListaTemp.Add(xSql);
    delete (sSql1,1,Posic);
    sSql1:=trim(sSql1)+'   ';
  end;
  sSql:=sSql2;
  while (Posic<>0) and (sSql2<>'') do
  begin
    Posic:=pos('AND',sSql);
    if Posic<>0 then
    begin
      xSql:=trim(copy(sSql2,1,Posic-1));
      ListaTemp.Add(xSql);
      delete (sSql2,1,Posic-1);
      sSql2:=trim(sSql2);
    end;
    sSql:=sSql2;
    sSql[1]:='*';
  end;
  ListaTemp.Add(sSql2);
  writeln(Arq,'select to_char(sysdate,'#39+'hh24:mi:ss'#39+') from dual;');
  for Posic:=0 to ListaTemp.Count-1 do
    writeln(Arq,ListaTemp[Posic]);
  writeln(Arq,';');
  writeln(Arq,'select to_char(sysdate,'#39+'hh24:mi:ss'#39+') from dual;');
  ListaTemp.Free;
  CloseFile(Arq);
end;


function To_Date(Data:string):string;   //Formato dd/mm/yyyy
begin
  Result:='TO_DATE('#39+Data+#39','#39+'dd/mm/yyyy'#39')';
end;


function pStr(Valor:String):string;   //Formato dd/mm/yyyy
begin
  Result:=#39+Valor+#39;
end;



{---------------------------------------------------------------------}

function CalculaDifMeses(qryaux : twwquery ; sDataIni, sDataFim : string) : Integer;
begin
   result := -1;
   qryAux.close;
   qryAux.sql.clear;
   qryAux.sql.add(' SELECT '+
                  ' TRUNC(MONTHS_BETWEEN(TO_DATE('''+sDataFim+''',''dd/mm/yyyy''),to_date('''+sDataIni+''',''dd/mm/yyyy'')),0) DIF '+
                  ' FROM DUAL');
   try
      qryAux.open;
   except
      Exit;
   end;
   result := qryaux.fieldbyname('DIF').AsInteger;
end;

function CalculaDifMesesDec(qryaux : twwquery ; sDataIni, sDataFim : string) : Double;
begin
   result := -1;
   qryAux.close;
   qryAux.sql.clear;
   qryAux.sql.add(' SELECT '+
                  ' MONTHS_BETWEEN(TO_DATE('''+sDataFim+''',''dd/mm/yyyy''),to_date('''+sDataIni+''',''dd/mm/yyyy'')) DIF '+
                  ' FROM DUAL');
   try
      qryAux.open;
   except
      Exit;
   end;
   result := qryaux.fieldbyname('DIF').AsFloat;
end;

end.
