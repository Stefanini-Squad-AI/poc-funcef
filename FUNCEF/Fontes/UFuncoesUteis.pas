unit UFuncoesUteis;

interface

uses SysUtils, Classes, StdCtrls, WinTypes, Dialogs, Buttons, Forms, wwTable, Wwquery,checklst;

type
   Str10 = string[10];
   Str20 = string[20];
   Str80 = string[80];
   Str100 = String[100]; 

type
  TDiaMes=array[1..12]  of Integer;
  TDiaData=array[1..12] of Word;

function ColocaZeros(Codigo:str80;Tam:byte):str80; // Coloca Zeros à esquerda de uma String
function PreparaData(var Data:str10):boolean; // Verifica de Data é Válida, coloca 19??
function TotDiasNoAno(Mes,Ano:Integer):LongInt; // Totalizador de Dias no Ano
function CalculaData(Data1,Data2:str10;var NumDias,NumMeses,NumAnos:LongInt):boolean;
         // Diferença entre Datas sem considerar o Dia
function CalculaData1(Data1,Data2:str10;var NumDias,NumMeses,NumAnos:Integer):boolean;
         // Diferença entre Datas considerando o Dia
function ColocaBarra(Data:str10):str10; // Coloca Barra na Data
function TiraBarra(Data:str10):str10;   // Tira Barra da Data
function PreparaStr(Codigo:str100;Tam:longint):str100; // Coloca Brancos a Direita numa String
function StrInt(S:str20):LongInt;       // Transforma String em Inteiro
function IncData(Data:str10;Dias,Meses,Anos:Integer):str10; // Incrementa Datas
function AnoBissexto(aAno:Integer):Boolean; // Verifica se é Ano Bissexto
function TrazUltDiaMes(aMes,aAno:Integer):Integer; // Traz último dia do mês
function TrazUltDiaData(aData:TDateTime):TDateTime; // Traz último dia do mês no formato data
function IFF(Condicao:boolean;Primeiro,Segundo:string):string;
function IntCod(Valor:LongInt;NumCasas:byte):Str20;
function DataBrit(Data:str10):str10;
function DataAnsi(Data:str10):str10;
function TiraCaracter(aTexto:str20;aChar:Char):str20;
function TrocaCaracter(Texto:string;De,Para:char):string;
function BuscaListaSequencial(Lista:TStringS;Tam:byte;Codigo:str80;MsgErr:str80):str80;
function DiaFeriado(aData:TDateTime;aMunicipio:Integer;aQry:TwwQuery):Boolean;
function RetornaAnoMes(Data : TDateTime) : string;
function Float2String (pValor : double) : string;
function String2Float (pStr : string) : double;
function TempoDecorrido(iMiliSeg : integer) : string;
function Arredonda(pNumero : double; pCasas : byte) : double;

//---------------------------------------------------------
function Replicate(aTexto:string;NumVezes:Integer):string;
function ValStr(aValor:Double;aCasas,Decimais:Integer;
                FormatarMilhar:boolean;SepDec:string):string; {passar '' em sepdec para usar o default do windows}
function ArredondaValor(aValor:Double;Decimais:Integer):Double;
function MudaSeparador(sNumero : string):string;
function SubTraiDias(sData: string; iDias: Integer): string;
function AdcionaDias(sData: string; iDias: Integer): string;  // rosana - serpros - 20/05/1999
function CalculaDifMeses(qryaux : twwquery ; sDataIni, sDataFim : string) : Integer;
function CalculaDifMesesDec(qryaux : twwquery ; sDataIni, sDataFim : string) : Double;
function RetornaNomeMes(iMes : integer) : string;
function RetornaMesExtAno(Data : string) : string;
function SubMeses(Ano:string; MesResult:integer):string;
procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
          Lista: TStrings; Chave, Descricao:String);
function IdentificaTipoPessoa(qry : twwquery; alidTitular, alidRecebedor : longint) : char;
Function AlinhaDireita(pCampo : Str20; pCasas: Byte) : Str20;
function AbreviaNome(Nome: String): String;
function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;

implementation

uses dBaseDados, UDataBase;

Function AlinhaDireita(pCampo : Str20; pCasas: Byte) : Str20;
Var i: Integer;
Begin
  // verifica se tam. do campo é >= do que pCasas
  If Length(Trim(pCampo))>pCasas Then Result := pCampo;
  i := pCasas - Length(Trim(pCampo));
  Result := Replicate(' ',i)+pCampo;
End;

function IdentificaTipoPessoa(qry : twwquery; alidTitular, alidRecebedor : longint) : char;
{ - Identifica o tipo de uma pessoa classificando como:
  'P' - PARTICIPANTE
  'B' - BENEFICIARIO
  'T' - TUTOR RESPONSAVEL
  'C' - CONSIGNATARIO
  'N' - NAO IDENTIFICADO}
begin
  result:='N';
  try
    if FazQuery(qry, 'SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+
         inttostr(alidrecebedor)) then
    begin
      result:='P';
      exit;
    end;

    if FazQuery(qry, 'SELECT IDPESSOA, IDTITULAR FROM BENEFBFCIARIO '+
         'WHERE IDPESSOA = '+inttostr(alidrecebedor)) then
    begin
      if qry.fieldbyname('IDPESSOA').asinteger = qry.fieldbyname('IDTITULAR').asinteger then
        result:='P'
      else
        result:='B';
      exit;
    end;

    if FazQuery(qry, 'SELECT DISTINCT IDRESPONSAVEL, IDPESSOA, IDTITULAR '+
         'FROM BFCIARIOTITPLAN WHERE IDRESPONSAVEL = '+inttostr(alidrecebedor)) then
    begin
      if qry.fieldbyname('IDRESPONSAVEL').asinteger = qry.fieldbyname('IDTITULAR').asinteger then
        result:='P'
      else
        if qry.fieldbyname('IDRESPONSAVEL').asInteger = qry.fieldbyname('IDPESSOA').asinteger then
          result:='B'
        else
          result:='T';
      exit;
    end;

    if FazQuery(qry, ' SELECT DISTINCT IDTITULAR, IDFAVORECIDO FROM RUBRICAINDIV '+
         'WHERE FLGPENSAOALIM = ''1'' AND IDTITULAR = '+inttostr(alidtitular)+
         'AND IDFAVORECIDO = '+inttostr(alidrecebedor)) then
      result:='C';
  except
    result:='N';
  end;
end;

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
  Dia:=trim(copy(Data,1,2));     {1234567890}
  Mes:=trim(copy(Data,3,2));     {ddmmaaaa}
  Ano:=trim(copy(Data,5,4));
  A:=StrInt(Ano);
  if A<100 then
    Ano:='19'+colocazeros(Ano,2);
  A:=StrInt(Ano);
  if (A<1900) or (A>2999) then
    goto ERRO;
  D:=StrInt(Dia);
  M:=StrInt(Mes);
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
  D1 := StrInt(copy(Data1,1,2));
  M1 := StrInt(copy(Data1,3,2));
  A1 := StrInt(copy(Data1,5,4));
  D2 := StrInt(copy(Data2,1,2));
  M2 := StrInt(copy(Data2,3,2));
  A2 := StrInt(copy(Data2,5,4));
  TD1 := (D1+TotDiasNoAno(M1,A1)+Trunc(365.25*(A1-1)));
  TD2 := (D2+TotDiasNoAno(M2,A2)+Trunc(365.25*(A2-1)));
  NumDias  := TD2-TD1;
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
  D1 := StrInt(copy(Data1,1,2));
  M1 := StrInt(copy(Data1,3,2));
  A1 := StrInt(copy(Data1,5,4));
  D2 := StrInt(copy(Data2,1,2));
  M2 := StrInt(copy(Data2,3,2));
  A2 := StrInt(copy(Data2,5,4));
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

function PreparaStr(Codigo:str100;Tam:longint):str100;
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

function StrInt(S:str20):LongInt;
var
  V:LongInt;
  Erro:Integer;
begin
  S:=trim(S);
  Val(S,V,Erro);
  if Erro<>0 then
    V:=0;
  StrInt:=V;
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

  xDia := StrInt(Copy(Data,1,2));
  xMes := StrInt(Copy(Data,3,2));
  xAno := StrInt(Copy(Data,5,4));
  // Verifica se é o último dia do mês
  if xDia = TrazUltDiaMes(xMes,xAno) then
    UltDia := True
  else
    UltDia := False;
  // Começa a Somar
  // Soma Ano
  xAno := xAno + Anos;
  // Soma Mês
  for I := 0 to Meses-1 do
    begin
      if xMes = 13 then
        begin
          xMes := 1;
          xAno := xAno + 1;
        end;
      xMes := xMes + 1;
    end;

  if UltDia then
     xDia := TrazUltDiaMes(xMes,xAno);

  // Soma Dias
  begin
     for I := 0 to Dias-1 do
     begin
       if xDia = TrazUltDiaMes(xMes,xAno) then
         begin
           xDia := 1;
           xMes := xMes + 1;
           if xMes = 13 then
             begin
               xMes := 1;
               xAno := xAno + 1;
             end;
         end;
       xDia := xDia + 1;
     end;
  end;

  if Posic>0 then
     Data:=ColocaBarra(Data);
  IncData:=Data;
end;

// rosana - serpros - 20/05/1999
function AdcionaDias(sData: string; iDias: Integer): string;
var I                : Byte;
    xDia, xMes, xAno : Integer;
    sDia, sMes       : string;
begin
  if pos('/', sData) > 0 then
     sData :=TiraBarra(sData);

  xDia  := StrInt(Copy(sData,1,2));
  xMes  := StrInt(Copy(sData,3,2));
  xAno  := StrInt(Copy(sData,5,4));

  for I := 0 to iDias-1 do
  begin
    xDia    := xDia + 1;
    if xDia > TrazUltDiaMes(xMes,xAno) then
    begin
       xDia := 1;
       xMes := xMes + 1;

       if xMes > 12 then
       begin
          xMes := 1;
          xAno := xAno + 1;
       end;
    end;
  end;

  sDia  := IntToStr(xDia);
  sMes  := IntToStr(xMes);

  if xDia < 10 then
     sDia := '0'+sDia;
  if xMes < 10 then
     sMes := '0'+sMes;
  Result  := sDia+'/'+sMes+'/'+IntToStr(xAno);
end;

function SubTraiDias(sData: string; iDias: Integer): string;
var I                : Byte;
    xDia, xMes, xAno : Integer;
    sDia, sMes       : string;
begin
  if pos('/', sData) > 0 then
     sData :=TiraBarra(sData);

  xDia  := StrInt(Copy(sData,1,2));
  xMes  := StrInt(Copy(sData,3,2));
  xAno  := StrInt(Copy(sData,5,4));

  for I := 0 to iDias-1 do
  begin
    xDia     := xDia - 1;
    if xDia   = 0 then
    begin
       xMes   := xMes - 1;
       if xMes = 0 then
       begin
         xMes := 12;
         xAno := xAno - 1;
       end;
       xDia := TrazUltDiaMes(xMes,xAno);
    end;
  end;

  sDia  := IntToStr(xDia);
  sMes  := IntToStr(xMes);

  if xDia < 10 then
     sDia := '0'+sDia;
  if xMes < 10 then
     sMes := '0'+sMes;
  Result  := sDia+'/'+sMes+'/'+IntToStr(xAno);
end;

function AnoBissexto(aAno:Integer):Boolean;
begin
  if (aAno mod 4  = 0) then
     AnoBissexto := True
  else
     AnoBissexto := False;
end;


function TrazUltDiaMes(aMes,aAno:Integer):Integer;
var
  mDiaMes  : TDiaMes;
begin
  mDiaMes[01] := 31;
  mDiaMes[02] := StrInt(iff(AnoBissexto(aAno),'29','28'));
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
  mDiaMes          : TDiaData;
  Day, Month, Year : Word;
begin
  DecodeDate(aData,Year,Month,Day);
  mDiaMes[01] := 31;
  mDiaMes[02] := StrInt(iff(AnoBissexto(Year),'29','28'));
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

  TrazUltDiaData := EncodeDate(Year, Month, mDiaMes[Month]);
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
 {OBS: SE MUNICIPIO = -1, E FERIADO NACIONAL}
  with aQry do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT DESCRICAO       ');
    Sql.Add('FROM   FERIADO         ');
    Sql.Add('WHERE  DTFERIADO = :v0 ');
    Sql.Add('AND    MUNICIPIO = :v1 ');
    Params[0].AsDateTime := aData;
    Params[1].AsInteger  := aMunicipio;
    Open;
    DiaFeriado := not aQry.Eof;
    Close;
  end;
end;

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

function Float2String (pValor : double) : string;
var
  cAuxSeparator : char;
begin
  cAuxSeparator    := DecimalSeparator;
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
         sAux := sAux + IntToStr(iMiliSeg div 1000) + ' Segundos(s),';
         iMiliSeg := iMiliSeg mod 1000;
       end;
  sAux := sAux + IntToStr(iMiliSeg) + ' Milisegundo(s)';
  Result := sAux;
end; // TempoDecorrido

function Arredonda(pNumero : double;pCasas : byte) : double;
var
  fator : double;
begin
  fator := exp(pCasas * ln(10));
  Result := Round(pNumero * fator)/fator;
end; // Arredonda

//---------------------------------------------------------
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
  sValor,sMascara
  :String;
  Posic
  :Integer;
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

function MudaSeparador(sNumero : string):string;
var i    : integer;
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
function RetornaMesExtAno(Data : string) : string;
var
  sMesAno: string;
begin
  sMesAno := Copy(Data,6,2);
  if sMesAno = '01' then Result := 'janeiro/'  + Copy(Data,1,4);
  if sMesAno = '02' then Result := 'fevereiro/'+ Copy(Data,1,4);
  if sMesAno = '03' then Result := 'março/'    + Copy(Data,1,4);
  if sMesAno = '04' then Result := 'abril/'    + Copy(Data,1,4);
  if sMesAno = '05' then Result := 'maio/'     + Copy(Data,1,4);
  if sMesAno = '06' then Result := 'junho/'    + Copy(Data,1,4);
  if sMesAno = '07' then Result := 'julho/'    + Copy(Data,1,4);
  if sMesAno = '08' then Result := 'agosto/'   + Copy(Data,1,4);
  if sMesAno = '09' then Result := 'setembro/' + Copy(Data,1,4);
  if sMesAno = '10' then Result := 'outubro/'  + Copy(Data,1,4);
  if sMesAno = '11' then Result := 'novembro/' + Copy(Data,1,4);
  if sMesAno = '12' then Result := 'dezembro/' + Copy(Data,1,4);
end; // RetornaMesExtAno

function SubMeses(Ano:string;MesResult:integer):string;
var
   MesStr:string;
begin
   Case MesResult of
    0 :MesStr:='12';
   -1 :MesStr:='11';
   -2 :MesStr:='10';
   -3 :MesStr:='09';
   -4 :MesStr:='08';
   -5 :MesStr:='07';
   -6 :MesStr:='06';
   -7 :MesStr:='05';
   -8 :MesStr:='04';
   -9 :MesStr:='03';
   -10:MesStr:='02';
   -11:MesStr:='01';
   else
     MesStr:=Colocazeros(InttoStr(MesResult),2);
   end;
   if Colocazeros(InttoStr(MesResult),2) <> MesStr then
      Ano:=IntToStr(StrToInt(Ano)-1);

   Result:=RetornaMesExtAno(Ano+'/'+MesStr);
end;

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                                Lista: TStrings; Chave, Descricao:String);
Begin
  if not Assigned(Lista) then
   Lista := TStringList.Create;
  Lista.Clear;
  While Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  End;
End;

function AbreviaNome(Nome: String): String;
var
    Nomes: array[1..20] of string;
    i, TotalNomes: Integer;
begin
    Nome := Trim(Nome);
    Result := Nome;
    {Insere um espaço para garantir que todas as letras sejam testadas}
    Nome := Nome + #32;
    {Pega a posição do primeiro espaço}
    i := Pos(#32, Nome);
    if i > 0 then
    begin
       TotalNomes := 0;
       {Separa todos os nomes}
       while i > 0 do
       begin
          Inc(TotalNomes);
          Nomes[TotalNomes] := Copy(Nome, 1, i - 1);
          Delete(Nome, 1, i);
          i := Pos(#32, Nome); 
       end; 
       if TotalNomes > 2 then
       begin 
       {Abreviar a partir do segundo nome, exceto o último.}
          for i := 2 to TotalNomes - 1 do
          begin
          {Contém mais de 3 letras? (ignorar de, da, das, do, dos, etc.)} 
             if Length(Nomes[i]) > 3 then 
            {Pega apenas a primeira letra do nome e coloca um ponto após.} 
            Nomes[i] := Nomes[i][1] + '.'; 
         end;
         Result := ''; 
         for i := 1 to TotalNomes do
            Result := Result + Trim(Nomes[i]) + #32;
            Result := Trim(Result); 
         end;
          end;
end;

function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;



end.