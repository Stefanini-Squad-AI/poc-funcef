{-------------------------------------------------------------------------------
Alteração  : ConvertExcelFile
Nº SIG.....: WO4459
Data.......: 18/10/2023
Responsável: Edilaine
Descrição..: Processamento em Lote apresentando erro no arquivo
-------------------------------------------------------------------------------
Alteracao   : GetCRC32, Str2Float
Pendência   : 115304
Responsável : edilaine
Data MERGE  : 25/01/2023
Data        : 21/10/2021
Descrição   : Inclusão de tratamento para contabilização da Provisão de Perdas
--------------------------------------------------------------------------------
Alteração  : Str2Float, GetDiaUtil
Autor(a)   : Edilaine
Data       : 22/08/2022
SIG        : 128237
Descricao  : Data inicial da divida fixa em dia 20 ou proximo dia util
--------------------------------------------------------------------------------
Alteração  : ValidaEMail
Autor(a)   : Andre Imakawa
Data       : 15/03/2018
SIG        : 65086
Descricao  : Correção validação do e-mail
--------------------------------------------------------------------------------
Alteração  : ValidaEMail, ValidarCpf
Autor(a)   : Edilaine Ferraresi
Data       : 11/11/2017
SIG        : 33979
Descricao  : Reestruturação da tela do elegível
--------------------------------------------------------------------------------
Alteração  : IFF (integer)
Autor(a)   : Edilaine Ferraresi
Data       : 03/02/2017
SIG        : 36752
Descricao  : Equacionamento - inclusao do cadastro de Faixas e Percentuais
--------------------------------------------------------------------------------
Alteração  : QuebrarListaFiltro
Nº SIG.....: 33372
Data       : 22/11/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento - Recebimento Contrib via Folha
--------------------------------------------------------------------------------
Alteração  : Split
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
-------------------------------------------------------------------------------}
// Autor(a)    : Felipe A. Santos
// Data        : 07/11/2013
// Pendência   : SOL 200445 KTN 1943221
// Alteração   : alinhamento do texto a esquerda
//------------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 14/11/2010
// Pendência   : SOL 201126 Kintana 1947118
// Alteração   : Criação da função RetirarCaracteresDaString
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 05/11/2010
// Pendência   : SOL 147055 Kintana 1010747
// Alteração   : inconsistência na gravação do mês no arquivi txt
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 12/07/2010
// Pendência   : SOL 127062 Kintana 670853
// Alteração   : Criação da funcionalidade "Inscricao Participante em Lote"
//------------------------------------------------------------------------------

unit UFuncoesUteis;

interface

uses SysUtils, Classes, StdCtrls, WinTypes, Dialogs, Buttons, Forms, wwTable, Wwquery,checklst,
     Registry,   //edilaine - SIG33979
     Windows, ComObj ;

//edilaine WO4459 : inicio
const
   xlCSV                         = 6;     // CSV *.csv
   xlCSVMSDOS                    = 24;    // MSDOS CSV *.csv
   xlCSVUTF8                     = 62;    // UTF8 CSV *.csv
   xlCSVWindows                  = 23;    // Windows CSV *.csv
   xlCurrentPlatformText         = -4158; // Current Platform Text *.txt
   xlExcel7                      = 39;    // Excel 95 (version 7.0) *.xls
   xlExcel8                      = 56;    // Excel 97-2003 Workbook *.xls
   xlExcel9795                   = 43;    // Excel version 95 and 97 *.xls
   xlTextMSDOS                   = 21;    // MSDOS Text *.txt
   xlTextWindows                 = 20;    // Windows Text *.txt
   xlUnicodeText                 = 42;    // Unicode Text
   xlXMLSpreadsheet              = 46;    // XML Spreadsheet *.xml
//edilaine WO4459 : fim


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
function IFF(Condicao:boolean;Primeiro,Segundo:string):string;              overload;    //edilaine - SIG36752
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

function iff(condicao : boolean; iPrimeiro, iSegundo : integer) : integer;    overload;    //edilaine - SIG36752

//---------------------------------------------------------
function Replicate(aTexto:string;NumVezes:Integer):string;
function ValStr(aValor:Double;aCasas,Decimais:Integer;
                FormatarMilhar:boolean;SepDec:string):string; {passar '' em sepdec para usar o default do windows}
function ArredondaValor(aValor:Double;Decimais:Integer):Double;
function MudaSeparador(sNumero : string):string;
function SubTraiDias(sData: string; iDias: Integer): string;
function AdcionaDias(sData: string; iDias: Integer): string;


function CalculaDifMeses(qryaux : twwquery ; sDataIni, sDataFim : string) : Integer;


function CalculaDifMesesDec(qryaux : twwquery ; sDataIni, sDataFim : string) : Double;


function RetornaNomeMes(iMes : integer) : string;

function RetornaMesExtAno(Data : string) : string;
function SubMeses(Ano:string; MesResult:integer):string;
procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
          Lista: TStrings; Chave, Descricao:String);
function IdentificaTipoPessoa(qry : twwquery; alidTitular, alidRecebedor : longint) : char;
function AlinhaDireita(pCampo : Str100; pCasas: Byte) : Str100; // alterado por Felipe A. Santos
function AlinhaEsquerda(pCampo : Str100; pCasas: Byte) : Str100; // Felipe A. Santos

function AbreviaNome(Nome: String): String;
function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;


procedure LimpaParametros(const qry: TwwQuery);

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);   // edilaine - SOL 253577-18174 / PPM 1327585

function BuscaDataFuncef():TDateTime; //Renato Visoni SOL 127062

function F_Diasuteis():TDateTime; //SOL 147055 Kintana 1010747

// edilaine - SIG33372 inicio
function QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string; TamLinha: word): string;
function ContaCaracter(Texto:string; Ch:char): Integer;
procedure ExtraiString(var Str,StrAtual:string; Separador:string);
// edilaine - SIG33372 fim

//edilaine - SIG33979 - inicio
function ValidaEMail(const EMailIn : String) : Boolean;
function ValidarCpf(num: string): boolean;
function RetornaCaminhoDesktop : string;
//edilaine - SIG33979 - fim

// Felipe A. Santos SOL 201126 Kintana 1947118
function RetiraCaracteresDaString(str : string) : string;
// Felipe A. Santos  SOL 201126 Kintana 1947118 - fim

Function GetCRC32(const FileName: string): string;                      //edilaine SIG115304

function Str2Float (pStr : string) : double;                            //edilaine SIG128237
function GetDiaUtil(sData : String; nDias : integer = 0) : String;      //edilaine SIG128237

procedure ConvertExcelFile(const ExcelFile, OutFile: string; Format: Integer = xlCSV);    //edilaine WO4459


implementation

uses dBaseDados, UDataBase;

function AlinhaDireita(pCampo : Str100; pCasas: Byte) : Str100; // alterado por Felipe A. Santos
var i: Integer;
begin
  // verifica se tam. do campo é >= do que pCasas
  If Length(Trim(pCampo))>pCasas Then Result := pCampo;
  i := pCasas - Length(Trim(pCampo));
  Result := Replicate(' ',i)+pCampo;
end;

// Felipe A. Santos
function AlinhaEsquerda(pCampo : Str100; pCasas: Byte) : Str100;
var i: Integer;
begin
  If Length(Trim(pCampo))>pCasas Then Result := pCampo;
  i := pCasas - Length(Trim(pCampo));
  Result := pCampo + Replicate(' ',i);
end;
// Felipe A. Santos - fim

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

//edilaine - SIG36752 - inicio
function iff(condicao : boolean; iPrimeiro, iSegundo : integer) : integer;
begin
  if condicao then result := iPrimeiro
              else result := iSegundo;
end;
//edilaine - SIG36752 - fim

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



procedure LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

function BuscaDataFuncef: TDateTime;
var dData  : TDateTime ;
    bSai   : Boolean;
    icount : Integer;
    sSQL   : String;
    QryAux : TwwQuery;
begin

  QryAux              := TwwQuery.Create(nil);
  QryAux.DatabaseName := 'BaseDados';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add('SELECT ''01/''||TO_char(SYSDATE,''MM/YYYY'') AS DATA, TRUNC(SYSDATE) AS HOJE FROM DUAL');
  QryAux.Open;

  dData := QryAux.FieldByname('DATA').asDateTime;

  bSai   := False;
  icount := 0;

  while not bSai do begin
    if DayOfWeek(dData) in [1..6] then begin
      inc(iCount);
    end;
    dData := dData+1;
    if iCount = 5 then
      bSai := True;
  end;

  sSQL :='';
  if QryAux.FieldByname('HOJE').asDateTime < dData then begin
    sSQL := 'SELECT TO_DATE(''01/''||TO_CHAR(SYSDATE,''MM/YYYY''),''DD/MM/YYYY'') AS DATA FROM DUAL';
  end else begin
    sSQL := 'SELECT ADD_MONTHS(TO_DATE(''01/''||TO_CHAR(SYSDATE,''MM/YYYY''),''DD/MM/YYYY''),+1) AS DATA FROM DUAL';
  end;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.Open;

  Result := QryAux.FieldByname('DATA').asDateTime;

  freeAndNil(QryAux);

end;
 //SOL 147055 Kintana 1010747  criação da função F_Diasuteis que conta somente dias uteis para substituir a
//                             BuscaDataFuncef que conta dias corridos
function F_Diasuteis: TDateTime;
var
    dData,
    dhoje    : TDateTime ;
    bSai     : Boolean;
    icount   : Integer;
    sFeriado,
    sSQL     : String;
    QryAux,
    QryAux2  : TwwQuery;
begin

  QryAux               := TwwQuery.Create(nil);
  QryAux.DatabaseName  := 'BaseDados';
  QryAux2              := TwwQuery.Create(nil);
  QryAux2.DatabaseName := 'BaseDados';

  bSai   := False;
  icount := 0;
  sFeriado := '';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add('SELECT ''01/''||TO_char(SYSDATE,''MM/YYYY'') AS DATA, TRUNC(SYSDATE) AS HOJE FROM DUAL');
  QryAux.Open;

  dData := QryAux.FieldByname('DATA').asDateTime;
  dhoje := QryAux.FieldByname('HOJE').asDateTime;

  while not bSai do begin
    if DayOfWeek(dData) in [1..6] then begin
       // verifica se o dia passado é sabado ou domingo
       QryAux.Close;
       QryAux.SQL.Clear;
       QryAux.SQL.Add('SELECT FDS AS NOTDIAUTIL ');
       QryAux.SQL.Add('FROM( SELECT TRIM(TO_CHAR(TO_DATE('''+ datetostr(dData) + '''),''DAY'')) FDS FROM DUAL)');
       QryAux.SQL.Add('WHERE FDS LIKE ''%BADO%'' OR FDS LIKE ''%MINGO%''');
       QryAux.Open;
       // se retornou vazio é um dia da semana
       if QryAux.isEmpty then
       begin
          // verifica se é feriado nacional
          QryAux2.Close;
          QryAux2.SQL.Clear;
          QryAux2.SQL.Add('SELECT DATAFERIADO FROM   FERIADOS ');
          QryAux2.SQL.Add('WHERE  DATAFERIADO  = '''+datetostr(dData)+'''');
          QryAux2.SQL.Add('AND    FLGAMBITO    = ''F''');
          QryAux2.Open;
          if not(QryAux2.isEmpty) then
             sFeriado := QryAux2.FieldByname('DATAFERIADO').asstring       
          else
          begin
             // verifica se é feriado estadual
             QryAux2.Close;
             QryAux2.SQL.Clear;
             QryAux2.SQL.Add('SELECT DATAFERIADO FROM   FERIADOS ');
             QryAux2.SQL.Add('WHERE  DATAFERIADO  = '''+datetostr(dData)+'''');
             QryAux2.SQL.Add('AND    CODESTADO    = ''DF''');
             QryAux2.SQL.Add('AND    FLGAMBITO    = ''E''');
             QryAux2.Open;
             if not(QryAux2.isEmpty) then
                sFeriado := QryAux2.FieldByname('DATAFERIADO').asstring
             else
             begin
                // verifica se é feriado distrital
                QryAux2.Close;
                QryAux2.SQL.Clear;
                QryAux2.SQL.Add('SELECT DATAFERIADO FROM   FERIADOS ');
                QryAux2.SQL.Add('WHERE  DATAFERIADO  = '''+datetostr(dData)+'''');
                QryAux2.SQL.Add('AND    IDCIDADES = 5300108');
                QryAux2.SQL.Add('AND    CODESTADO    = ''DF''');
                QryAux2.SQL.Add('AND    FLGAMBITO    = ''M''');
                QryAux2.Open;
                if not(QryAux2.isEmpty) then
                   sFeriado := QryAux2.FieldByname('DATAFERIADO').asstring ;
             end;
          end;
       end
       else
          sFeriado := QryAux.FieldByname('NOTDIAUTIL').asstring;

       if sFeriado = '' then
          inc(iCount);
    end;
    dData := dData+1;
    sFeriado := '';
    if iCount = 5 then
      bSai := True;
  end;

  sSQL :='';
  if dhoje < dData then begin
    sSQL := 'SELECT TO_DATE(''01/''||TO_CHAR(SYSDATE,''MM/YYYY''),''DD/MM/YYYY'') AS DATA FROM DUAL';
  end else begin
    sSQL := 'SELECT ADD_MONTHS(TO_DATE(''01/''||TO_CHAR(SYSDATE,''MM/YYYY''),''DD/MM/YYYY''),+1) AS DATA FROM DUAL';
  end;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.Open;

  Result := QryAux.FieldByname('DATA').asDateTime;

  freeAndNil(QryAux);
  freeAndNil(QryAux2);

end;
// final SOL 147055 Kintana 1010747

// Felipe A. Santos SOL 201126 Kintana 1947118
function RetiraCaracteresDaString(str : string) : string;
var
  strRetorno : string;
  i : integer;
begin
  for i := 1 to Length(str) do
  begin
       if str[i] in ['0' .. '9'] then
          strRetorno := strRetorno + str[i];
  end;

  Result := strRetorno;
end;

// Felipe A. Santos SOL 201126 Kintana 1947118 - fim

// edilaine - SOL 253577-18174 / PPM 1327585 - inicio
procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
var
  ini, fim : integer;
begin
   ListOfStrings.Clear;

   while  Pos('|', Str) > 0 do
   begin
     ListOfStrings.Add( Trim(copy(Str, 1, Pos('|', Str)-1)) );
     Str := StringReplace(Str, ListOfStrings.Strings[ ListOfStrings.count-1 ]+'|' , '', []);
   end;
end;
// edilaine - SOL 253577-18174 / PPM 1327585 - fim


// edilaine - SIG33372 - inicio
function ContaCaracter(Texto:string; Ch:char): Integer;
var
  Posic, Posic1: integer;
begin
  Texto  := trim(Texto);
  Result := 0;
  Posic1 := 0;
  while (True) do
  begin
    Posic := Pos (Ch,copy(Texto,Posic1+1,length(Texto)-Posic1));
    if (Posic > 0) then
      Inc(Result)
    else
      break;
    Posic1 := Posic1 + Posic;
  end;
end;


procedure ExtraiString(var Str,StrAtual:string; Separador:string);
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);
  if (iPos > 0) then
  begin
    StrAtual := Copy(Str,1,iPos-1);
    Delete(Str,1,iPos+Length(Separador)-1);
  end
  else
  begin
    StrAtual := Str;
    Str := '';
  end;
end;


function QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string; TamLinha: word): string;
var
  iNumItem, iNumItensLista: integer;
  c, iNumLinhas: byte;
  sLinhaAtual, sIDAtual: string;
begin
  // Calcular o número de linhas necessárias
  iNumItensLista := ContaCaracter(ListaID,',');
  if (iNumItensLista > 0) then
    Inc(iNumItensLista);

  if (iNumItensLista <= TamLinha) then
  begin
    Result := Replicate(' ', NumEspacos) + ' ( ' + Filtro +
      IFF(iNumItensLista>1,' IN (',' = ') + ListaID + IFF(iNumItensLista>1,')','')+ ')';
    exit;
  end
  else
  begin
    if ((iNumItensLista mod TamLinha) = 0) then
      iNumLinhas := iNumItensLista div TamLinha
    else
      iNumLinhas := (iNumItensLista div TamLinha) + 1;
  end;

  // Gerar as linhas necessárias
  Result := '';
  for c:=1 to iNumLinhas do
  begin
    // Adicionar o número máximo de elementos à linha atual
    iNumItem := 0;
    sLinhaAtual := '';
    repeat
      ExtraiString(ListaID, sIDAtual, ',');
      Inc(iNumItem);
      if (sLinhaAtual = '') then
        sLinhaAtual := sIDAtual
      else
        sLinhaAtual := sLinhaAtual +','+ sIDAtual;
    until (ListaID = '') or (iNumItem = TamLinha);

    // Montar a linha atual
    Result := Result +
      Replicate(' ', NumEspacos+2) +
      ' ( ' + Filtro +
      IFF(iNumItensLista>1,' IN (',' = ') +
      sLinhaAtual + '))'+
      IFF(c < iNumLinhas, ' OR' + #13, '');
  end;

  if (Result <> '') and (Pos(#13,Result) > 0) then
    Result := Replicate(' ',NumEspacos) +'('+ #13 +Result+ #13 +Replicate(' ',NumEspacos)+ ')';
end;
// edilaine - SIG33372 - fim


//edilaine - SIG33979 - inicio
function ValidaEMail(const EMailIn : String) : Boolean;
const
  CaraEsp: array[1..42] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°','é','ó');
var
  i,cont,t, posPonto   : integer;
  EMail                : ShortString;
begin
  EMail  := PChar(EMailIn);
  Result := True;
  cont   := 0;
  t      := Length(EMail);
  posPonto := 999;

  if (EMail <> EmptyStr) then
  begin
    //O texto digitado deve possuir, no mínimo, dois caracteres antes do final
    if Length(EMail) >= 1 then
       if (Email[t] = '.') or (Email[t-1] = '.') then
        begin
          Result := False;
          exit;
        end;

    // existe @ .
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
         Result := False
      else // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
           Result := False
        else
        begin
          // Andre Imakawa - SIG 65086 - Inicio
          {
          for i := 1 to 40 do
            // se existe Caracter Especial
            if Pos(CaraEsp[i], EMail)<>0 then
             begin
               Result := False;
               exit;
             end;
          }
          // Andre Imakawa - SIG 65086 - Fim

          for i := 1 to length(EMail) do
          begin
            // se existe apenas 1 @
            if EMail[i] = '@' then
               cont := cont + 1;

            // . seguidos de .
            if (EMail[i] = '.') and (EMail[i+1] = '.') then
            begin
              Result := false;
              exit;
            end;

            if EMail[i] = '.' then
               posPonto := i;
          end;

          // . no f, 2ou+ @, . no i, - no i, _ no i
          if (cont >=2) or ( EMail[length(EMail)]= '.' ) or
             ( EMail[1]= '.' ) or ( EMail[1]= '_' ) or
             ( EMail[1]= '-' )  then
          begin
             Result := false;
             exit;
          end;

          // @ seguido de COM e vice-versa
          if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
          begin
            Result := False;
            exit;
          end;

          // Andre Imakawa - SIG 65086 - Inicio
          {
          // @ seguido de - e vice-versa
          if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
          begin
            Result := False;
            exit;
          end;

          // @ seguido de _ e vice-versa
          if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
          begin
            Result := False;
            exit;
          end;
          }
          // Andre Imakawa - SIG 65086 - Fim
        end;
    end
    else
      Result:= False;

    //O ultimo ponto deve vir depois do arroba
    if (Pos('@', EMail) > posPonto) then
       Result := False;
  end;
end;

function ValidarCpf(num: string): boolean;
var
  n:array [1..9] of integer;
  d:array [1..2] of integer;
  digitado, calculado: string;
  i: Integer;
begin
  num:= Trim(num);
  if ((num = '11111111111')or
      (num = '22222222222')or
      (num = '33333333333')or
      (num = '44444444444')or
      (num = '55555555555')or
      (num = '66666666666')or
      (num = '77777777777')or
      (num = '88888888888')or
      (num = '99999999999')or
      (num = '00000000000'))then
  begin
      result:= false;
      exit;
  end;

  if (length(num )<> 11) then
     begin
       result:= false;
       exit;
     end;

  for i:= 1 to 9 do
      n[i]:= StrToInt(num[i]);

  d[1]:= n[9]*2 + n[8]*3 + n[7]*4 + n[6]*5 + n[5]*6 + n[4]*7 + n[3]*8 +n[2]* 9+n[1]*10;
  d[1]:= 11-(d[1] mod 11);

  if (d[1]>=10) then
     d[1]:=0;

  d[2]:= d[1]*2+n[9]*3+n[8]*4+n[7]*5+n[6]*6+n[5]*7+n[4]*8+n[3]*9+n[2]*10+n[1]*11;
  d[2]:= 11-(d[2] mod 11);

  if d[2]>=10 then
     d[2]:=0;

  calculado:= inttostr(d[1])+inttostr(d[2]);
  digitado := num[10]+num[11];

  result := (calculado = digitado);
end;

function RetornaCaminhoDesktop : string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', False );
    Result := Reg.ReadString('Desktop');
  finally
    Reg.Free;
  end;
end;
//edilaine - SIG33979 - fim


//edilaine SIG115304 : inicio
Function GetCRC32(const FileName: string): string;
const
  CRCPOLY = $EDB88320;
type
  Long = record
    LoWord: Word;
    HiWord: Word;
  end;

var
  CRCTable: array[0..512] Of Longint; //tabela CRC para fazer o checksum
  Buffer: PChar;
  f: File of Byte;
  b: array[0..255] of Byte;
  CRC: Longint;
  e, i: Integer;

  //1. CRC table creation:
  procedure BuildCRCTable;
  var
    i, j: Word;
    r: Longint;
  begin
    FillChar(CRCTable, SizeOf(CRCTable), 0);
    for i := 0 to 255 do
    begin
      r := i shl 1;
      for j := 8 downto 0 do
        if (r and 1) <> 0 then
          r := (r Shr 1) xor CRCPOLY
        else
          r := r shr 1;
      CRCTable[i] := r;
     end;
  end;

  //2. CRC calculation for file:
  function RecountCRC(b: byte; CrcOld: Longint): Longint;
  begin
    RecountCRC := CRCTable[byte(CrcOld xor Longint(b))] xor ((CrcOld shr 8) and $00FFFFFF)
  end; //RecountCRC


  function HextW(w: Word): string;
  const
    h: array[0..15] Of char = '0123456789ABCDEF';
  begin
    HextW := '';
    HextW := h[Hi(w) shr 4] + h[Hi(w) and $F] + h[Lo(w) shr 4]+h[Lo(w) and $F];
  end; //HextW


  function HextL(l: Longint): string;
  begin
    with Long(l) do
      HextL := HextW(HiWord) + HextW(LoWord);
  end; //HextL


begin
  BuildCRCTable;
  CRC := $FFFFFFFF;
  AssignFile(F, FileName);
  FileMode := 0;
  Reset(F);
  GetMem(Buffer, SizeOf(B));

  repeat
    FillChar(b, SizeOf(b), 0);
    BlockRead(F, b, SizeOf(b), e);
    for i := 0 to (e-1) do
     CRC := RecountCRC(b[i], CRC);
  until (e < 255) or (IOresult <> 0);

  FreeMem(Buffer, SizeOf(B));
  CloseFile(F);
  CRC := Not CRC;
  Result := '$' + HextL(CRC);
end; //GetCRC32

//edilaine SIG128237 : inicio
function Str2Float(pStr : string) : double;
var
  sValor : string;
  cAuxSeparator : char;
begin
  //edilaine SIG115304 : inicio
  result := 0;
  if pStr = '' then
     exit;
  //edilaine SIG115304 : fim

  sValor := StringReplace(pStr, '.', '', []);

  cAuxSeparator := DecimalSeparator;
  DecimalSeparator := ',';
  Result := StrToFloat(sValor);
  DecimalSeparator := cAuxSeparator;
end; // StringToFloat


function GetDiaUtil(sData : String; nDias : integer = 0) : String;
var
  qryAux : TwwQuery;
begin
  qryAux := TwwQuery.create(nil);
  try
    qryAux.DatabaseName := 'BaseDados';
    qryAux.SQL.Text := 'SELECT CM.CALCULA_DIA_UTIL('+QuotedStr(sData)+', '+IntToStr(nDias)+') from dual';
    qryAux.Open;

    Result := qryAux.Fields[0].AsString;

  finally
    FreeAndNil(qryAux);
  end;
end;
//edilaine SIG128237 : fim


//edilaine WO4459 : inicio
{  Usage: ConvertExcelFile( 'D:\import.xlsx', 'D:\export.csv', xlCSVUTF8 );
   Requires Excel to be installed on system
   If file is locked after usage, call Sleep(10), then Application.ProcessMessages();
   Note: Add ComObj,ActiveX to your uses clause
}
procedure ConvertExcelFile(const ExcelFile, OutFile: string; Format: Integer = xlCSV);
var
  excelApp: OleVariant;
begin
  //CoInitialize(nil);
  try
    excelApp := CreateOleObject('Excel.Application');
    if VarIsEmpty( excelApp ) then
      exit;

    excelApp.DisplayAlerts := False;
    excelApp.Visible := False;
    excelApp.Workbooks.Open( ExcelFile,
                             false,   // ConfirmConversions
                             true );  // ReadOnly

    excelApp.ActiveWorkbook.SaveAs( OutFile, Format );

    excelApp.ActiveWorkbook.Saved := True; // Prevent prompt

  finally
    excelApp.Quit;
    excelApp := Unassigned;
    //CoUninitialize;
  end;
end;
//edilaine WO4459 : fim


end.