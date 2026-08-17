unit UFuncoesUteisIR;

interface

uses SysUtils, Classes, StdCtrls, WinTypes, Dialogs, Buttons, Forms,
     CheckLst, Graphics, db, dbtables;

const
  CR    = #13;
  LF    = #10;
  CR_LF = CR+LF;
  CL_AMARELO_CLARO = $00C0FFFF;
  MesCurto: array[1..12] of string[3] = (
    'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez');

type
  str1   = string[1];
  str2   = string[2];
  str3   = string[3];
  str4   = string[4];
  str5   = string[5];
  Str6   = string[6];
  Str7   = string[7];
  Str8   = string[8];
  Str10  = string[10];
  Str11  = string[11];
  Str14  = string[14];
  Str15  = string[15];
  Str17  = string[17];
  Str20  = string[20];
  Str25  = string[25];
  Str80  = string[80];
  Str200 = string[200];

  TDiaMes  = array[1..12] of integer;
  TDiaData = array[1..12] of word;

  TComparar = record
    Pos: LongInt;
    Achou: boolean;
  end;

  // Usados na rotina de criação de Tabelas Temporárias
  TCampoTabela = record
    Nome: string;
    Tipo: TFieldType;
    Tamanho: integer;
    Requerido: boolean;
  end;

  TIndiceTabela = record
    Nome, Campos: string;
    Opcoes: TIndexOptions;
  end;

var
  prmIdMotivoFolhaBenef: integer;

// ****************************************************************************************
// Funções para tratamento de datas
// ****************************************************************************************


// Retorna um intervalo entre duas datas informadas em meses
function IntervaloMeses (DataIni,DataFin: string): ShortInt;

// Retorna se um determinado dia é feriado ou não
function TestaFeriado (Data:TDateTime; Cidade,Pais:LongInt; Estado:string;
                       ConsideraBancario:boolean): boolean;

// Verifica se a Data é Válida, coloca 19??
function PreparaData (var Data: string): boolean;

// Retorna o total de dias no ano até o mês especificado
function TotDiasNoAno (Mes,Ano: integer): LongInt;

// Retorna o valor em dias do Ano a multiplicar entre as datas informadas. Quanto mais
// anos bissextos maior será o multiplicador. Ex: 01/01/2000 a 01/01/20001 = 365.99
function AnoBi (DataMenor,DataMaior: string): real;

// Retorna a diferença entre datas sem considerar o dia
function CalculaData (DataIni,DataFin:string; var NumDias,NumMeses,NumAnos:LongInt): boolean;

// Retorna a diferença entre datas considerando o dia
function CalculaDifData (DataIni,DataFin:string; var NumDias,NumMeses,NumAnos:integer): boolean;

// Coloca Barra na Data
function ColocaBarra (Data: string): string;

// Tira Barra da Data
function TiraBarra (Data: string): string;

// Incrementa a Data informada em um número específico de Dias, Meses e Anos
function IncData (Data:string; Dias,Meses,Anos:integer): string;

// Verifica se é Ano Bissexto
function AnoBissexto (Ano: integer): boolean;

// Traz último dia do mês
function TrazUltDiaMes (Mes,Ano: integer): integer;

// Traz último dia do mês no formato data
function TrazUltDiaData (Data: TDateTime): TDateTime;

// Retorna a data no formato AAAA/MM
function RetornaAnoMes (Data: TDateTime): string;

// Retorna a data no formato AAAAMM
function AnoMes (Data: TDateTime): string;

// Retorna a data no formato AAAAMMDD se Barra = False ou AAAA/MM/DD se Barra = True
function RetornaDataAMD(Data:TDateTime; Barra:boolean): string;

// Incrementa Datas AAAA/MM
function IncDataAM(Data:string; Meses:integer): string;

// Retorna o mes de uma data informada (POR EXTENSO)
function RetornaMes (Mes: string): string;

// Retorna o mes e o ano de uma data informada (POR EXTENSO)
function MesExtensoAno (MesAno: string): string;

// Retorna o Dia de uma determinada data
function ExtraiDia (Data: TDateTime): word;

// Retorna o Mês de uma determinada data
function ExtraiMes (Data: TDateTime): word;

// Retorna o Ano de uma determinada data
function ExtraiAno (Data: TDateTime): word;

// Retorna o próximo mês de uma data informada
function ProxMes (DataIni: TDateTime): TDateTime;

// Retornaa a diferença entre as datas no formato AAAA/MM em meses
function DifDataAnoMes (AnoMes1,AnoMes2: string): integer;


// ****************************************************************************************
// Funções para tratamento de strings
// ****************************************************************************************
// Pegar os últimos NUM caracteres de uma string ST
function UltimosCaracteres (St:string; Num:word): string;

// Retira os espaços em demasia de ST. EX: '  Jesus    Cristo' -> 'Jesus Cristo'.
function NormalizaString (St: string): string;

// Abrevia um nome se o seu tamanho for maior que o máximo possível especificado em wMax.
function AbreviaNome (Max:word; Nome:string): string;

// Copia Str2 em Str1 apartir da posição N
function OverStr (n:byte; str1,str2:string): string;

// Converte caracteres COM ACENTO para SEM ACENTO
function ConverteCar (St: string): string;

// Retorna o número Num com um zero na frente se este tiver apenas uma casa
function PoeZero (Num: byte): string;

// Coloca Zeros à direita de uma string
function ColocaZeros (Codigo:string; Tam:byte): string;

// Coloca Brancos a direita numa string
function PreparaStr (Codigo:string; Tam:byte): string;

// Retira os caracteres SCHAR da string STEXTO
function TiraCaracter (Texto:string; Ch:char): string;

function ContaCaracter (Texto:string; Ch:char): Integer;

// Troca os caracteres DE da string TEXTO para PARA
function TrocaCaracter (Texto:string; De,Para:char): string;

// Retorna ATEXTO repetido NUMVEZES
function Replicate (Texto:string; NumVezes:integer): string;

// Retorna a string ATEXTO alinhada a esquerda com NUMVEZES espaços em branco a sua direita
function LeftPad (Texto:string; NumVezes:integer): string;

// Retorna a string ATEXTO alinhada a direita com NUMVEZES espaços em branco a sua esquerda
function RightPad (Texto:string; NumVezes:integer): string;

// Alinha a string TEXTO na direção TIPO, preenchendo com WTAMANHO caracteres PREENCHEDOR
function Alinha (Texto:string; Tamanho:word; Tipo,Preenchedor:char): string;

// Retira MAXREP número de caracteres repetidos consecutivamente da string ST
function TiraCarRepetidos (St:string; MaxRep:byte): string;

// Calcula Juros Compostos
function JuroComposto (Valor:real; NumMeses:Integer; TaxaJuros:real): real;

function  NumWeekMonth(const TDT:TDateTime) : integer;
//
procedure ExtraiString (var Str,StrAtual:string; Separador:string);

// Marca na CheckListBox "CheckList" o(s) elemento(s) de Valor
// (string em que os elementos são separados pelo caracter informado em Separador)
// usando os códigos contidos em Lista
procedure VerificaOpcoes (
  var CheckList: TCheckListBox;
  Lista: TStringList;
  Valor: string;
  Separador: char
);

//
function CriaListaOpcoes (
  CheckList: TCheckListBox;
  Lista: TStringList;
  var Valor: string;
  Separador: char;
  EntrePliques: boolean
): word;

//

function Completadireita(TamanhoTexto : integer; texto, Caracter : String) : string;

function ValidaCaracteres (Dado:string; Tipo:char; Opcoes:string): string;

// Retorna o número de caracteres CH dentro de ST
function NumCaracteres (Ch:char; St:string): word;

// Valida os dados de acordo com o tipo de dado especificado
function fValidaDados (Tipo:char; Dado:string; Tamanho:word): string;

// Retorna a posição do POSICAO caracter CH na string ST
function PosicaoCar (Cr:char; St:string; Posicao:word): word;

//
function MontaLinhaSelSQL (SQL,Valor:string; TamanhoEspaco:word): string;

// ****************************************************************************************
// Funções Miscelânicas
// ****************************************************************************************
// Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle
function OraNumero (Numero: string): string;
function ClienteNumero (Numero: string): string;

// Verifica se o nº de bytes informado pode ser gravado do drive especificado
function VerifEspacDisco (Path:string; NumBytes:word): boolean;

// Transforma String em Inteiro retornando Zero se a string não for o um inteiro válido
function StrInt (S: string): LongInt;

// Transforma String em Real retornando Zero se a string não for o um Real válido
function StrFloat (S: string): double;

// Transfoma um Real em String
function Float2String (Valor: double): string;

// Transfoma uma String em Real independente do "DecimalSeparator"
function StringToFloat (Str: string): double;

// Transfoma uma String em Real
function String2Float (Str: string): double;

// Formata um campo Real validando-o
function ValStr (Valor:double; Casas,Decimais:integer;
                 FormatarMilhar:boolean; SepDec:string): string;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function IFF (Condicao:boolean; Primeiro,Segundo:string): string; overload;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function IFF (Condicao:boolean; Primeiro,Segundo:integer): integer; overload;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function IFF (Condicao:boolean; Primeiro,Segundo:double): double; overload;

// Retorna uma string contendo o espaço de tempo decorrido em HORAS, MINUTOS, SEGUNDOS, MILISEGUNDOS
function TempoDecorrido (MiliSeg: integer): string;

// Retorna uma string contendo o espaço de tempo decorrido no formato HH:MM:SS
function TempoDecorridoHMS (MiliSeg:integer; ImprimeMili:boolean): string;

// Retorna um código dado em formato string e alinhado com zeros a direita
function IntCod (Valor:LongInt; NumCasas:byte): string;

// Retorna o maior ID de uma determinada tabela
function MaiorID (Campo,Tabela: string): LongInt;

// Procura pela string CODIGO em um TStrings, exibindo a menssagem MSGERR se não encontrado
function BuscaListaSequencial (Lista:TStrings; Tam:byte; Codigo,MsgErr:string): string;

// Verifica se a rubrica indicada já foi gravada no banco
function VerificaIDRubricaIndiv (IdPessoa,IdRubrica:integer; AnoMesInicio:string): boolean;

// Retorna o último ID de uma rubrica individual
function ProxRubricaIndiv(IdPessoa,IdRubrica: integer): integer;

//
function ProcuraStList (Lst:TStrings; St:string): integer;

{ Verifica se houve uma seleção inválida para a consulta especificada.
 - A query TEM que ter campos TField associados;
 - iTagChave indica o valor da Tag para o(s) campos chave (vistos nos TFileds)
 - iTagVazio indica o valor da Tag para o(s) campos que não podem estar vazios
   (vistos nos TFileds)
 - sTabelaMensagem indica uma mensagem a ser exibida quando for encontrada
   um registro que não atende às especificações
 - bPermiteChaveVazia é um complemento para o argumento iTagVazio}
function VerificaLinhaGrid (Qry:TQuery; TagChave,TagVazio:integer;
         TabelaMensagem:string; PermiteChaveVazia:boolean): boolean;

// Compara uma string com um vetor de strings; retornando (-1) se não encontrar a string ou
// a posição dela no vetor se a encontrar
function StringEm (Comparador:string; Arr:array of string): integer;

// Compara um número com um vetor de números; retornando (-1) se não encontrar o número ou
// a posição dele no vetor se a encontrar
function Comparar(Comparador:integer; Arr:array of integer): TComparar;

// Verifica se uma string COMPARADO está na stinrg ST respeitando o separador SEPARADOR
// Retorna "0" se não achou ou não foi informado algum parâmetro, "1" se achou
function VerificaCodigoEm (St,Comparado:string; Separador:char): integer;

// Retorna a descrição de um campo de uma Tabela conforme "TCampoTabela"
function NovoCampoTabela (Nome:string; Tipo:TFieldType; Tamanho:integer; Requerido:boolean): TCampoTabela;

// Retorna a descrição de um indice de uma Tabela conforme "TIndiceTabela"
function NovoIndiceTabela (Nome,Campos:string; Opcoes:TIndexOptions): TIndiceTabela;

// Cria uma tabela temporária no formato DBase
function CriaTabelaTemp (Database,Nome:string; Campos:array of TCampoTabela;
  Indices:array of TIndiceTabela): boolean;

// Apaga uma tabela no formato DBase
function ApagaTabelaTemp (Database,Nome: string): boolean;

// ****************************************************************************************
// Funções para tratamento de Gráficos
// ****************************************************************************************
// Desenha uma linha em um Canvas especificado e nas coordenadas de tela x1,y1,x2,y2
procedure DrawLine(Canvas:TCanvas; x1,y1,x2,y2:integer);

// Repinta o Item "Index" de uma ListBox "lst"
procedure InvalidateItemListBox(lst:TCustomListBox; Index:integer);

//inicia um arquivo TXT
procedure IniciaTXT(Var Arquivo : textFile; Caminho : string);

// preenche um valor com zeros a esquerda
function strZero(TamanhoTexto : Integer; Texto : String) : String;

//preenche uma string com espaços a direita
function strEspaco(TamanhoTexto : Integer; Texto : string) : string;

//preenche uma string com zeros a direita
function Zerodireita(TamanhoTexto : integer; texto : String) : string;

//formata valor tirando as virgulas
function FormataVAlor(NumeroCasas : integer; valor : string) : string;

implementation

uses dBaseDados, uMensErro;

// ****************************************************************************************
// Implementação das funções para tratamento de datas
// ****************************************************************************************
// ----------------------------------------------------------------------------------------
// Entrada:
// dDataIni : Data inicial (no formato DD/MM/YYYY)
// dDataFin : Data Final   (no formato DD/MM/YYYY)
// Saída:
// * O intervalo entre as datas em meses
// ----------------------------------------------------------------------------------------
function IntervaloMeses (DataIni,DataFin: string): ShortInt;
var
  wAux,wDiaIni,wMesIni,wAnoIni,wDiaFin,wMesFin,wAnoFin: word;
begin
  wAux := 0;
  try
    DecodeDate(StrToDate(DataIni), wAnoIni, wMesIni, wDiaIni);
    DecodeDate(StrToDate(DataFin), wAnoFin, wMesFin, wDiaFin);

    if (StrToDate(DataIni) <= StrToDate(DataFin)) then
      wAux := wMesFin - wMesIni;

    if (wDiaIni > wDiaFin) then
      Dec(wAux);
  finally
    Result := wAux;
  end;
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// dData              : Data a ser comparada (no formato DD/MM/YYYY)
// iCidade            : ID da Cidade
// iPais              : ID do Pais
// sEstado            : Sigla do Estado
// bConsideraBancario : Indica se a função conta este dia como feriado se nesta data houver
// um feriado bancário.
// Saída:
// * Se a data informada é um feriado ou não
// ----------------------------------------------------------------------------------------
function TestaFeriado (Data:TDateTime; Cidade,Pais:LongInt; Estado:string;
                       ConsideraBancario:boolean): boolean;
var
  qryFeriado: TQuery;
  sTipos    : string;
begin
  qryFeriado := TQuery.Create(Application);
  qryFeriado.DatabaseName := 'BASEDADOS';

  // define os tipos
  if (ConsideraBancario) then
    sTipos := '''E''' +','+ '''O''' +','+ '''C''' +','+ '''B'''
  else
    sTipos := '''E''' +','+ '''O''' +','+ '''C''';

  try
    qryFeriado.Close;
    with (qryFeriado.SQL) do
    begin
      Clear;
      Add (
        'SELECT '+
        '   COUNT(IDFERIADO) AS NO_FERIADOS '+
        'FROM  '+
        '   FERIADOS '+
        'WHERE '+
        '   (DATAFERIADO = '+QuotedStr(DateTimeToStr(Data))+') '+
        '   AND '+
        '   ('+
        '   (IDPAIS    = ' +IntToStr(Pais)+  ') OR '+
        '   ((IDPAIS   = ' +IntToStr(Pais)+  ') AND (CODESTADO = ''' +Estado+ ''')) OR '+
        '   (IDCIDADES = ' +IntToStr(Cidade)+') '+
        '   ) '+
        '   AND '+
        '   (FLGTIPO IN (' +sTipos+ '))');
    end;
    qryFeriado.Open;
    Result := (qryFeriado.FieldByName('NO_FERIADOS').asInteger > 0);
  finally
    qryFeriado.Close;
    qryFeriado.Free;
  end;
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// Data : Data (no formato DD/MM/YYYY)
// Saída:
// * A data modificada
// * Se a preparação foi bem sucedida ou não
// ----------------------------------------------------------------------------------------
function PreparaData (var Data: string): boolean;
Label
  ERRO;
var
  Dia,Mes,Ano: string[4];
  D,M,A      : integer;
  Posic      : byte;
begin
  Posic := Pos('/',Data);
  if (Posic > 0) then
    Data := TiraBarra(Data);

  if (Trim(Data) = '') then
  begin
    PreparaData := false;
    exit;
  end;

  Dia := Trim(Copy(Data,1,2));     {1234567890}
  Mes := Trim(Copy(Data,3,2));     {ddmmaaaa}
  Ano := Trim(Copy(Data,5,4));
  A   := StrInt(Ano);

  if (A < 100) then
    Ano := '19'+colocazeros(Ano,2);

  A := StrInt(Ano);

  if (A < 1900) or (A > 2999) then
    goto ERRO;

  D := StrInt(Dia);
  M := StrInt(Mes);
  if (D<1) or (D>31) or (M<1) or (M>12) then
    goto ERRO;

  case (M) of
    2:
    begin
      if (D = 29) and ((A mod 4) <> 0) then
        goto ERRO;
      if (D > 29) then
        goto ERRO;
    end;
    4,6,9,11 :
    if (D > 30) then
      goto ERRO;
  end;
  Dia := ColocaZeros(IntToStr(D),2);
  Mes := ColocaZeros(IntToStr(M),2);
  Ano := IntToStr(A);

  if (Posic > 0) then
    Data := Dia+'/'+Mes+'/'+Ano
  else
    Data := Dia + Mes + Ano;

  PreparaData := true;
  exit; // se estiver certo sai aqui, nao vai para a proxima sentenca}
  ERRO: // se houve erro todo processamento e desviado para aqui}
  messagedlg('Data inválida',mterror,[mbok],0);
  PreparaData := false;
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// Mes, Ano : Mês e ano da data a se calculada
// Saída:
// * O número de dias do ano até a data informada
// ----------------------------------------------------------------------------------------
function TotDiasNoAno (Mes,Ano: integer): LongInt;
const
  DiasNoAno: array[1..12] of integer =
    (0,                                  {jan}
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
  // Testa ano bisexto
  if ((Ano mod 4) = 0) then
    TotDiasNoAno := DiasNoAno[Mes]+1
  else
    TotDiasNoAno := DiasNoAno[Mes];
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// dtMenor : Data menor a calcular
// dtMaior : Data maior a calcular
// Saída:
// * O multiplicador mais adequado
// ----------------------------------------------------------------------------------------
function AnoBi (DataMenor,DataMaior: string): real;
var
  dtAux: TDateTime;
  Dias,Quant: LongInt;
begin
  if StrToDate(DataMenor) > StrToDate(DataMaior) then
  begin
    dtAux := StrToDate(DataMenor);
    DataMenor := DataMaior;
    DataMaior := DateToStr(dtAux);
  end;
  Quant:=0; Dias:=0;
  dtAux := StrToDate(DataMenor);

  while (StrToDate(DataMaior) <> dtAux) do
  begin
    if (Copy(DateToStr(dtAux),1,2) = '29') and (Copy(DateToStr(dtAux),4,2) = '02') then
      Inc(Quant);
    Inc(Dias);
    dtAux := dtAux+1;
  end;
  Result := 365*(1+(Quant/Dias));
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// DataIni : Data Inicial
// DataFin : Data Final
// Saída:
// * Se o processo foi bem sucedido
// NumDias  : O intervalo em dias
// NumMeses : O intervalo em meses
// NumAnos  : O intervalo em anos
// ----------------------------------------------------------------------------------------
function CalculaData (DataIni,DataFin:string; var NumDias,NumMeses,NumAnos:LongInt): boolean;
var
  M1,A1,M2,A2: integer;
begin
  try
    StrToDate(DataIni);
    StrToDate(DataFin);

    M1 := StrInt(Copy(DataIni,4,2));
    A1 := StrInt(Copy(DataIni,7,4));
    M2 := StrInt(Copy(DataFin,4,2));
    A2 := StrInt(Copy(DataFin,7,4));

    NumDias  := Trunc(StrToDate(DataFin) - StrToDate(DataIni));
    NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
    NumAnos  := Trunc(NumDias/365.25);
    Result   := true;
  except
    Result := false;
  end;
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// DataIni : Data Inicial
// DataFin : Data Final
// Saída:
// * Se o processo foi bem sucedido
// NumDias  : O intervalo em dias
// NumMeses : O intervalo em meses
// NumAnos  : O intervalo em anos
// ----------------------------------------------------------------------------------------
function CalculaDifData(DataIni,DataFin:string; var NumDias,NumMeses,NumAnos:integer): boolean;
var
  D1,M1,A1,D2,M2,A2: integer;
  TD1,TD2: LongInt;
begin
  try
    D1 := StrToInt(Copy(DataIni,1,2));
    M1 := StrToInt(Copy(DataIni,4,2));
    A1 := StrToInt(Copy(DataIni,7,4));
    D2 := StrToInt(Copy(DataFin,1,2));
    M2 := StrToInt(Copy(DataFin,4,2));
    A2 := StrToInt(Copy(DataFin,7,4));

    TD1 := (D1+TotDiasNoAno(M1,A1)+Round(AnoBi(DataIni,DataFin)*A1));
    TD2 := (D2+TotDiasNoAno(M2,A2)+Round(AnoBi(DataIni,DataFin)*A2));
    NumDias := TD2-TD1;

    NumMeses := (M2+12*A2)-(M1+12*A1);
    if (D1 > D2) then
      Dec(NumMeses);

    NumAnos := NumDias div Round(AnoBi(DataIni,DataFin));
    Result  := true;
  except
    Result := false;
  end;
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// Data : Data a ser convertida
// Saída:
// * A Data com barras
// ----------------------------------------------------------------------------------------
function ColocaBarra (Data: string): string;
begin
  Result := Data;
  if (Pos('/',Data) = 0) then
    Result := Copy(Data,1,2)+'/'+ Copy(Data,3,2)+'/'+ Copy(Data,5,4);
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// Data : Data a ser convertida
// Saída:
// * A Data sem barras
// ----------------------------------------------------------------------------------------
function TiraBarra (Data: string): string;
begin
  Result := TiraCaracter(Data,'/');
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// Data  : Data a ser incrementada
// Dias  : Número de dias a incrementar
// Meses : Número de meses a incrementar
// Anos  : Número de anos a incrementar
// Saída:
// * A Data incrementada
// ----------------------------------------------------------------------------------------
function IncData(Data:string; Dias,Meses,Anos:integer): string;
var
  Posic: byte;
  iDia,iMes,iAno,c: integer;
begin
  try
    StrToDate(Data);

    Posic := Pos('/',Data);

    if (Posic > 0) then
      Data := TiraBarra(Data);

    iDia := StrInt(Copy(Data,1,2));
    iMes := StrInt(Copy(Data,3,2));
    iAno := StrInt(Copy(Data,5,4));

    // Modifico os Anos
    iAno := iAno + Anos;

    // Modifico os Meses
    if (Meses > 0) then // Soma Mês
    begin
      for c:=0 to Meses-1 do
      begin
        iMes := iMes + 1;
        if (iMes = 13) then
        begin
          iMes := 1;
          iAno := iAno + 1;
        end;
      end;
    end
    else
    if (Meses < 0) then // Subtrai Mês
    begin
      for c:=0 DownTo Meses+1 do
      begin
        iMes := iMes - 1;
        if (iMes = 0) then
        begin
          iMes := 12;
          iAno := iAno - 1;
        end;
      end;
    end;

    // Testa Validade do Último Dia do Mês
    if (iDia > TrazUltDiaMes(iMes,iAno)) then
      iDia := TrazUltDiaMes(iMes,iAno);
    
    // Modifico os Dias
    if (Dias > 0) then // Soma Dias
    begin
      for c:=0 to Dias-1 do
        if (iDia = TrazUltDiaMes(iMes,iAno)) then
        begin
          iDia := 1;
          iMes := iMes + 1;
          if (iMes = 13) then
          begin
            iMes := 1;
            iAno := iAno + 1;
          end;
        end
        else
          iDia := iDia + 1;
    end
    else
    if (Dias < 0) then // Subtrai Dias
    begin
      for c:=0 DownTo Dias+1 do
        if (iDia = 1) then // Primeiro Dia do Mês
        begin
          iMes := iMes - 1;
          if (iMes = 0) then
          begin
            iMes := 12;
            iAno := iAno - 1;
          end;
          iDia := TrazUltDiaMes(iMes,iAno);
        end
        else
          iDia := iDia - 1;
    end;

    // Monta Data
    Data := PoeZero(iDia) + PoeZero(iMes) + IntToStr(iAno);

    // Coloca Barras
    if (Posic > 0) then
      Data := ColocaBarra(Data);

    Result := Data;
  except
    Result := '';
  end;
end;

// ----------------------------------------------------------------------------------------
// Entrada:
// Anos : O ano a comparar
// Saída:
// * Se o ano é bissexto ou não
// ----------------------------------------------------------------------------------------
function AnoBissexto(Ano: integer): boolean;
begin
  Result := ((Ano mod 4) = 0);
end;

function TrazUltDiaMes(Mes,Ano: integer): integer;
var
  mDiaMes: TDiaMes;
begin
  mDiaMes[01] := 31;
  mDiaMes[02] := StrInt(IFF(AnoBissexto(Ano),'29','28'));
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
  TrazUltDiaMes := mDiaMes[Mes];
end;

function TrazUltDiaData(Data: TDateTime): TDateTime;
var
  mDiaMes: TDiaData;
  Day, Month, Year: word;
begin
  DecodeDate (Data, Year, Month, Day);
  mDiaMes[01] := 31;
  mDiaMes[02] := StrInt(IFF(AnoBissexto(Year),'29','28'));
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

function RetornaAnoMes(Data: TDateTime): string;
var
  wAno,wMes,wDia: word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  Result := IntToStr(wAno) + '/'+ PoeZero(wMes);
end;

function AnoMes(Data: TDateTime): string;
var
  wAno,wMes,wDia: word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  Result := IntToStr(wAno) + PoeZero(wMes);
end;

function RetornaDataAMD(Data:TDateTime; Barra:boolean): string;
var
  wAno,wMes,wDia: word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  if (Barra) then
    Result := IntToStr(wAno) +'/'+ PoeZero(wMes) +'/'+ PoeZero(wDia)
  else
    Result := IntToStr(wAno) + PoeZero(wMes) + PoeZero(wDia);
end;

function IncDataAM(Data:string; Meses:integer): string;
var
  xMes,xAno,i: integer;
  Posic: byte;
begin
  Result := Data;
  if (Meses = 0) then
    exit;
  I := 5;
  Posic := pos('/',Data);
  if (Posic > 0) then
    I := 6;
  xMes := StrInt(Copy(Data,I,2));
  xAno := StrInt(Copy(Data,1,4));

  // Começa a processar a data
  if (Meses > 0) then // Soma meses
  begin
    for I:=0 to Meses-1 do
    begin
      xMes := xMes + 1;
      if (xMes = 13) then
      begin
        xMes := 1;
        xAno := xAno + 1;
      end;
    end;
  end
  else // Subtrai meses
  begin
    for I:=0 DownTo Meses+1 do
    begin
      xMes := xMes - 1;
      if (xMes = 0) then
      begin
        xMes := 12;
        xAno := xAno - 1;
      end;
    end;
  end;
  Data := IntToStr(xAno);
  if (Posic > 0) then
    Data := Data + '/';
  Data   := Data + PoeZero(xMes);
  Result := Data;
end;

function RetornaMes(Mes: string): string;
begin
  Mes := AnsiUpperCase(Mes);
  if (Mes = 'JANEIRO') then
    Result := '01'
  else
  if (Mes = 'FEVEREIRO') then
    Result := '02'
  else
  if (Mes = 'MARÇO') then
    Result := '03'
  else
  if (Mes = 'ABRIL') then
    Result := '04'
  else
  if (Mes = 'MAIO') then
    Result := '05'
  else
  if (Mes = 'JUNHO') then
    Result := '06'
  else
  if (Mes = 'JULHO') then
    Result := '07'
  else
  if (Mes = 'AGOSTO') then
    Result := '08'
  else
  if (Mes = 'SETEMBRO') then
    Result := '09'
  else
  if (Mes = 'OUTUBRO') then
    Result := '10'
  else
  if (Mes = 'NOVEMBRO') then
    Result := '11'
  else
  if (Mes = 'DEZEMBRO') then
    Result := '12';
end;

function MesExtensoAno(MesAno: string): string;
var
  sAno,sMes: string;
begin
  // Testa se é vazio
  if (MesAno <> '') then
  begin
    sAno := Copy(MesAno,1,4);
    sMes := Copy(MesAno,6,2);
    // Avalia Meses
    if (sMes = '01') then
      sMes := 'Janeiro de '
    else
    if (sMes = '02') then
      sMes := 'Fevereiro de '
    else
    if (sMes = '03') then
      sMes := 'Março de '
    else
    if (sMes = '04') then
      sMes := 'Abril de '
    else
    if (sMes = '05') then
      sMes := 'Maio de '
    else
    if (sMes = '06') then
      sMes := 'Junho de '
    else
    if (sMes = '07') then
      sMes := 'Julho de '
    else
    if (sMes = '08') then
      sMes := 'Agosto de '
    else
    if (sMes = '09') then
      sMes := 'Setembro de '
    else
    if (sMes = '10') then
      sMes := 'Outubro de '
    else
    if (sMes = '11') then
      sMes := 'Novembro de '
    else
    if (sMes = '12') then
      sMes := 'Dezembro de ';
  end;
  Result := sMes+sAno;
end;

//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function ExtraiDia(Data: TDateTime): word;
var
  wAno,wMes,wDia: word;
begin
  DecodeDate (Data, wAno, wMes, wDia);
  Result := wDia;
end;

//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function ExtraiMes(Data: TDateTime): word;
var
  wAno,wMes,wDia: word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  Result := wMes;
end;

//--------------------------------------------------------------------------------------------------
//    ExtraiDia: Função que retorna o Dia de uma determinada data
//--------------------------------------------------------------------------------------------------
//       dData    :  data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function ExtraiAno(Data: TDateTime): word;
var
  wAno,wMes,wDia: word;
begin
  DecodeDate(Data,wAno,wMes,wDia);
  Result := wAno;
end;

//--------------------------------------------------------------------------------------------------
//    SomaMeses:  Função que retorna a data resultante do incremento de um determindado nº de meses
//                a partir de uma data inicial
//--------------------------------------------------------------------------------------------------
//       dDataIni    :  data em questão
//       iMeses      :  total de meses que se deseja somar
//--------------------------------------------------------------------------------------------------
function ProxMes(DataIni: TDateTime): TDateTime;
var
  iDiaIni, iMesIni, iAnoIni, iMesFim, iAnoFim: word;
begin
  iDiaIni := ExtraiDia(DataIni);
  iMesIni := ExtraiMes(DataIni);
  iAnoIni := ExtraiAno(DataIni);

  // calcula quantos Anos inteiros há no período em meses e já calcula o ano resultante
  iAnoFim := iAnoIni + (iMesIni div 12);

  // Calculo o mes atual
  if ((iMesIni+1) > 12) then
    iMesFim := 1
  else
    iMesFim := iMesIni+1;

  // Verifico o ultimo dia do mes
  if (iDiaIni > TrazUltDiaMes(iMesFim,iAnoFim)) then
    iDiaIni := TrazUltDiaMes(iMesFim, iAnoFim);

  Result := EncodeDate(iAnoFim, iMesFim, iDiaIni);
end;

function DifDataAnoMes (AnoMes1,AnoMes2: string): integer;
var
  dtAux1, dtAux2: integer;
begin
  dtAux1 := (StrToInt(Copy(AnoMes1,1,4))*12) + StrToInt(Copy(AnoMes1,6,2));
  dtAux2 := (StrToInt(Copy(AnoMes2,1,4))*12) + StrToInt(Copy(AnoMes2,6,2));
  Result := (dtAux1 - dtAux2);
end;

// ****************************************************************************************
// Implementação das funções para tratamento de strings
// ****************************************************************************************
function UltimosCaracteres (St:string; Num:word): string;
begin
  Result := Copy (st,Length(St)-Num+1,Num);
end;

function NormalizaString (st: string): string;
var
  sAux: string;
  c   : word;
  cCarAnt: char;
begin
  st   := Trim(st);
  sAux := '';
  if (Length(st) > 0) then
  begin
    cCarAnt := st[1];
    for c:=1 to Length(st) do
    begin
      if not((cCarAnt = ' ') and (st[c] = ' ')) then
        sAux := sAux+st[c];
      cCarAnt := st[c];
    end;
  end;
  Result := sAux;
end;

function AbreviaNome (Max:word; Nome:string): string;
const
  Juncoes = 'E DA DE DO DAS DOS';
var
  c1,c2: word;
begin
  Nome := UpperCase (NormalizaString(Nome));
  c1   := 2;
  while (Max < length(Nome)) do
  begin
    if (Nome[c1-1] = ' ')and (Nome[c1] in ['A'..'Z']) then
    begin
      c2 := c1;
      while (Nome[c2] <> ' ') and (c2 <= length(Nome)) do
        Inc(c2);
      if (Pos (Copy(Nome, c1, c2-c1),Juncoes) = 0) and ((c2 <= length(Nome)) or
         (Max < length(Nome))) then
      begin
        Insert ('.',Nome,c1+1);
        Delete (Nome,c1+2,c2-c1-1);
      end;
    end;
    Inc (c1);
  end;
  Result := Nome;
end;

function OverStr (n:byte; str1,str2:string): string;
begin
  delete (str1,n,Length(str2));
  insert (str2,str1,n);
  Result := str1;
end;

// Converte os caracteres do formato com acento (DOS) para sem acento.
function ConverteCar(St: string): string;
var
  Aux: string;
  Car: char;
  c  : integer;
begin
  Aux := '';
  if (St <> '') then
    for c := 1 to Length(St) do
    begin
      case St[c] of
        // Caracteres Maiúsculos
        'Ã','À','Á','Â' : Car := 'A';
        'È','É','Ê'     : Car := 'E';
        'Ì','Í','Î'     : Car := 'I';
        'Õ','Ò','Ó','Ô' : Car := 'O';
        'Ù','Ú','Û'     : Car := 'U';
        'Ç'             : Car := 'C';
        'ª'             : Car := 'a';
        // Caracteres Minúsculos
        'ç'            : Car := 'c';
        'ã','à','á','â': Car := 'a';
        'è','é','ê'    : Car := 'e';
        'ì','í','î'    : Car := 'i';
        'õ','ò','ó','ô': Car := 'o';
        'ù','ú','û'    : Car := 'o';
        'º'            : Car := '.';
        else
          Car := St[c];
      end;
      Aux := Aux + Car;
    end;
  Result := Aux;
end;

function PoeZero (Num: byte): string;
var
  sAux: string;
begin
  if (Num < 10) then
    sAux := '0'+IntToStr(Num)
  else
    sAux := IntToStr(Num);
  Result := sAux;
end;

function ColocaZeros (Codigo:string; Tam:byte): string;
var
  TamTemp: byte;
  Valor  : LongInt;
  Erro   : integer;
begin
  ColocaZeros := Codigo;
  Codigo      := Trim(Codigo);
  if (Codigo = '') then
    exit;
  Val(Codigo,Valor,Erro);
  if (Erro <> 0) then
  begin
    ColocaZeros := PreparaStr(Codigo,Tam);
    exit;
  end;
  Codigo  := IntToStr(Valor);  {tira os zeros que existiam antes}
  TamTemp := Length(Codigo);
  while (TamTemp < Tam) do
  begin
    Codigo  := '0'+Codigo;
    TamTemp := Length(Codigo);
  end;
  ColocaZeros := Codigo;
end;

function PreparaStr (Codigo:string; Tam:byte): string;
var
  c: byte;
begin
  if (Length(Codigo) <> Tam) then
  begin
    Codigo := Trim(Codigo);
    if (Length(Codigo) > Tam) then
      Codigo:=copy(Codigo,1,Tam)
    else
      for c:=Length(Codigo) to (Tam-1) do
        Codigo := Codigo+' ';
  end;
  PreparaStr := Codigo;
end;

function TiraCaracter(Texto:string; Ch:char): string;
var
  Posic: byte;
begin
  Posic := Pos (Ch,Texto);
  if (Posic > 0) then
  begin
    Delete (Texto,Posic,1);
    Posic := Pos (Ch,Texto);
    if (Posic > 0) then
      Delete (Texto,Posic,1);
  end;
  Result := Texto;
end;

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

function TrocaCaracter(Texto:string; De,Para:char): string;
var
  Posic: byte;
begin
  repeat
    Posic := Pos(De,Texto);
    if (Posic > 0) then
      Texto[Posic] := Para;
  until (Posic = 0);
  TrocaCaracter := Texto;
end;

function Replicate(Texto:string; NumVezes:Integer): string;
var
  c   : word;
  Temp: string;
begin
  Temp := '';
  for c:=1 to NumVezes do
    Temp := Temp + Texto;
  Result := Temp;
end;

function LeftPad(Texto:string; NumVezes:integer): string;
begin
  Result := Copy(Texto,1,NumVezes);
  if (Length(Result) < NumVezes) then
    Result := Result + Replicate(' ', NumVezes - Length(Result));
end;

function RightPad(Texto:string; NumVezes:integer): string;
begin
  Result := Copy(Texto,1,NumVezes);
  if (Length(Result) < NumVezes) then
    Result := Replicate(' ', NumVezes - Length(Result)) + Result;
end;

function Alinha(Texto:string; Tamanho:word; Tipo,Preenchedor:char): string;
var
  sEspaco: string;
begin
  Result := Texto;
  Tipo   := UpCase(Tipo);
  // Testar Parametros
  if (Tamanho = 0) or (Length(Texto) > Tamanho) or not(Tipo in ['D','E','C']) then
    exit;
  // Criar Espaco do Tamanho
  sEspaco := Replicate (Preenchedor,Tamanho-Length(Texto));
  // Caso Tipo = Centralizado Divide Tamanho
  case (Tipo) of
    'C' : // Centralizado
    begin
      sEspaco := Replicate(Preenchedor,Trunc((Tamanho-Length(Texto))/2));
      Result  := sEspaco + Texto + sEspaco;
    end;
    'D' : Result := sEspaco + Texto; // Direita    cm   cmsol
    
    'E' : Result := Texto + sEspaco; // Esquerda
  end;
end;

function TiraCarRepetidos (St:string; MaxRep:byte): string;
var
  sAux: string;
  bNumRep, c: byte;
  cCar: char;
begin
  c    := 2;
  sAux := St[1];
  cCar := St[1];
  bNumRep := 1;
  repeat
    while (UpCase(cCar) = UpCase(St[c])) do
    begin
      if (bNumRep < MaxRep) then
      begin
        sAux := sAux+st[c];
        Inc(bNumRep);
      end;
      Inc (c);
    end;

    if (c <= length(st)) then
    begin
      sAux    := sAux+st[c];
      cCar    := st[c];
    end;
    bNumRep := 1;
    Inc(c);
  until (c >= length(st)+1);
  Result := sAux;
end;

procedure ExtraiString (var Str,StrAtual:string; Separador:string);
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);
  if (iPos > 0) then
  begin
    StrAtual := Copy (Str,1,iPos-1);
    Delete (Str,1,iPos+Length(Separador)-1);
  end
  else
  begin
    StrAtual := Str;
    Str      := '';
  end;
end;

function JuroComposto(Valor:real; NumMeses: Integer; TaxaJuros:real): Real;
var
  i : Integer;
begin
   Result := 0;
   if (NumMeses <=0) or (Valor = 0) or (TaxaJuros = 0) then  exit;
   for i := 1 to NumMeses do
      Result := Result + (Result + Valor) * TaxaJuros / 100;
end;

procedure VerificaOpcoes (
  var CheckList: TCheckListBox;
  Lista: TStringList;
  Valor: string;
  Separador: char
);
var
  iPos: integer;
  AuxValor, ValorAtual: string;
begin
  if (Valor <> '') then
  begin
    for iPos:=0 to Lista.Count-1 do
      CheckList.Checked[iPos] := false;

    AuxValor   := Valor;
    ValorAtual := Valor;
    repeat
      ExtraiString(AuxValor, ValorAtual, Separador);
      iPos := Lista.IndexOf(ValorAtual);
      if (iPos > -1) then
        CheckList.Checked[iPos] := true;
    until (AuxValor = '');
  end
  else
    for iPos:=0 to Lista.Count-1 do
      CheckList.Checked[iPos] := false;
end;

function CriaListaOpcoes (
  CheckList: TCheckListBox;
  Lista: TStringList;
  var Valor: string;
  Separador: char;
  EntrePliques: boolean
): word;
var
  wAux: word;
  I, K: integer;
  AuxValor: string;
begin
  AuxValor:=''; K:=1; wAux:=0;
  for I:=0 to CheckList.Items.Count-1 do
    if (CheckList.Checked[I]) then
    begin
      if (K = 1) then
      begin
        if (EntrePliques) then
          AuxValor := QuotedStr(Lista[I])
        else
          AuxValor := Lista[I];
        Inc(K);
      end
      else
      begin
        if (EntrePliques) then
          AuxValor := AuxValor +Separador+ QuotedStr(Lista[I])
        else
          AuxValor := AuxValor +Separador+ Lista[I];
      end;
      Inc(wAux);
    end;

  Valor  := AuxValor;
  Result := wAux;
end;

function ValidaCaracteres (Dado:string; Tipo:char; Opcoes:string): string;
var
  c: word;
  sTemp: string;
  TempOpcoes: set of char;
begin
  // Faz Validação básica para a utilização da Função
  if not(Tipo in ['A','N']) and (Opcoes = '') then
  begin
    MsgDlg ('Erro na Função ValidaCaracteres. Não foi indicado o tipo do dados ou o mesmo'+
            ' não é válido','Aviso', mtInformation,[mbOK,mbHelp],0);
    exit;
  end;

  sTemp := '';

  // ******************************
  // Faz tratamento das informações
  // ******************************
  if (Opcoes <> '') then
  begin
    try
      for c:=1 to length(Dado) do
        TempOpcoes := TempOpcoes + [Opcoes[c]];

      for c:=1 to length(Dado) do
        if (sTemp[c] in TempOpcoes) then
          sTemp := sTemp + Dado[c];
    except
      sTemp := Replicate(' ', length(Dado));
    end;
  end
  else
  begin
    case (Tipo) of
      'A' : // Campos alfanuméricos
      begin
        try
          for c:=1 to length(Dado) do
            if (Dado[c] in [' ','A'..'Z']) then
              sTemp := sTemp + Dado[c];
        except
          sTemp := Replicate(' ', length(Dado));
        end;
      end;

      'N' : // Campos Numéricos
      begin
        try
          for c:=1 to length(Dado) do
            if (Dado[c] in ['0'..'9',',','.','-','+']) then
              sTemp := sTemp + Dado[c];
        except
          sTemp := Replicate('0', length(Dado));
        end;
      end;
    end;
  end;
  
  Result := sTemp;
end;

function NumCaracteres(Ch:char; St:string): word;
var
  c, wAux: word;
begin
  wAux := 0;
  for c:=1 to length(St) do
    if (St[c] = Ch) then
      Inc(wAux);

  Result := wAux;
end;

// *************************************************************************************
// Parâmetros: sTipo    - A (alfanumérico), N (numérico)
//             sDado    - Dado a ser validado
//             wTamanho - Tamanho de retorno da string validada
// *************************************************************************************
function fValidaDados (Tipo:char; Dado:string; Tamanho:word): string;
var
  sTemp: string;
  c, wMax: word;
begin
  // Faz Validação básica para a utilização da Função
  if not(Tipo in ['A','N','*']) or (Tamanho = 0) then
  begin
    Result := '';
    exit;
  end;

  // Inicializa Variáveis
  sTemp := '';
  Tipo  := UpCase(Tipo);
  Dado  := Trim(Dado);

  // ******************************
  // Faz tratamento das informações
  // ******************************
  wMax := Tamanho;
  case (Tipo) of
    '*' : // Campos alfanuméricos
    begin
      try
        Dado := UpperCase(NormalizaString(ConverteCar(Dado)));

        for c:=1 to length(Dado) do
          sTemp := sTemp + Dado[c];

        sTemp := Alinha (Copy(sTemp,1,wMax), Tamanho, 'E', ' ');
      except
        sTemp := Replicate(' ', Tamanho);
      end;
    end;

    'A' : // Campos alfabéticos
    begin
      try
        Dado := UpperCase (NormalizaString(ConverteCar(Dado)));

        for c:=1 to length(Dado) do
          if (Dado[c] in [' ','A'..'Z']) then
            sTemp := sTemp + Dado[c];

        sTemp := Alinha (Copy(sTemp,1,wMax), Tamanho, 'E', ' ');
      except
        sTemp := Replicate(' ', Tamanho);
      end;
    end;

    'N' : // Campos Numéricos
    begin
      try
        // Atribuo o maior tamanho verificável possível
        if (Tamanho > Length(Dado)) then
          wMax := Length(Dado);

        for c:=1 to length(Dado) do
          if (Dado[c] in ['0'..'9']) then
            sTemp := sTemp + Dado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), Tamanho, 'D', '0');
      except
        sTemp := Replicate('0', Tamanho);
      end;
    end;
  end;

  Result := sTemp;
end;

function PosicaoCar(Cr:char; St:string; Posicao:word): word;
var
  c,wNum: word;
begin
  Result:=0; wNum:=1;
  for c:=1 to Length(St) do
    if (St[c] = Cr) then
    begin
      if (wNum = Posicao) then
      begin
        Result := c;
        break;
      end;
      Inc(wNum);
    end;
end;

function MontaLinhaSelSQL (SQL,Valor:string; TamanhoEspaco:word): string;
begin
  if (Pos(',',Valor) > 0) then
    Result := SQL + Replicate(' ',TamanhoEspaco) + 'IN (' + Valor+ ')) AND'
  else
    Result := SQL + Replicate(' ',TamanhoEspaco) + ' = ' + Valor+ ') AND';
end;

// ****************************************************************************************
// Implementação das funções Miscelânicas
// ****************************************************************************************

function OraNumero (Numero: string): string;
var
  i   : integer;
  sOra: string;
begin
  sOra := '';

  for i:=1 to length(Trim(Numero)) do
  begin
     if (Numero[i] = ',') then
       sOra := sOra + '.'
     else
       sOra := sOra + Numero[i]
   end;
   Result := sOra;
end;

function ClienteNumero(Numero: string): string;
var
  i       : integer;
  sCliente: string;
begin
  sCliente := '';

  for i:=1 to length(Trim(Numero)) do
  begin
    if (Numero[i] = '.') then
      sCliente := sCliente + DecimalSeparator
    else
      sCliente := sCliente + Numero[i]
  end;
  Result := sCliente;
end;

function VerifEspacDisco (Path:string; NumBytes:word): boolean;
begin
  Result := (DiskFree (Ord(ExtractFileDrive(Path)[1])-64) > NumBytes);
end;

function StrInt(S: string): LongInt;
begin
  try
    Result := StrToInt(S);
  except
    Result := 0;
  end;
end;

function StrFloat (S: string): double;
begin
  try
    Result := StrToFloat(S);
  except
    Result := 0;
  end;
end;

function Float2String (Valor: double): string;
var
  cAuxSeparator: char;
begin
  cAuxSeparator    := DecimalSeparator;
  DecimalSeparator := '.';
  Result           := FormatFloat('#0.00',Valor);
  DecimalSeparator := cAuxSeparator;
end;

function StringToFloat (Str: string): double;
var
  cAuxSeparator: char;
begin
  if (Trim(Str) <> '') then
  begin
    Str              := TrocaCaracter(TiraCaracter(Str, '.'), ',', '.');
    cAuxSeparator    := DecimalSeparator;
    DecimalSeparator := '.';
    Result           := StrToFloat(Str);
    DecimalSeparator := cAuxSeparator;
  end
  else
    Result := 0;
end;

function String2Float (Str: string): double;
var
  cAuxSeparator: char;
begin
  if (Trim(Str) <> '') then
  begin
    cAuxSeparator    := DecimalSeparator;
    DecimalSeparator := '.';
    Result           := StrToFloat(Str);
    DecimalSeparator := cAuxSeparator;
  end
  else
    Result := 0;
end;

function ValStr (Valor:double; Casas,Decimais:integer;
                 FormatarMilhar:boolean; SepDec:string): string;
// Passar '' em sepdec para usar o default do windows
var
  sValor, sMascara: string;
  iCasas, iPosic: integer;
  cAux: char;
begin
  iCasas := Casas;
  // O parametro passado Casas contem o tamanho total do campo inclusive o ponto e as
  // decimais, se existirem aqui na rotina o parametro casas se refere a parte inteira somente
  if (Decimais > 0) then
    iCasas := iCasas - Decimais - 1;

  sMascara := '0';

  for iPosic:=2 to iCasas do
  begin
    if (FormatarMilhar) and ((iPosic mod 3) = 0) then
      sMascara := ',#' + sMascara
    else
      sMascara := '#' + sMascara;
  end;

  if (Decimais > 0) then
    sMascara := sMascara +'.'+ Replicate('0',Decimais);

  cAux := DecimalSeparator;

  if (SepDec <> '') then
    DecimalSeparator := SepDec[1];

  sValor           := FormatFloat(sMascara, Valor);
  DecimalSeparator := cAux;
  sValor           := Copy(sValor, 1, Casas);

  if (sValor[Length(sValor)] = DecimalSeparator) then
    SetLength(sValor, Length(sValor)-1);

  Result := sValor;
end;

function IFF(Condicao:boolean; Primeiro,Segundo:string): string;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function IFF(Condicao:boolean; Primeiro,Segundo:integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function IFF(Condicao:boolean; Primeiro,Segundo:double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TempoDecorrido(MiliSeg: integer): string;
var
  sAux : string;
begin
  sAux := '';
  if ((MiliSeg div 3600000) > 0) then
  begin
    sAux    := IntToStr(MiliSeg div 3600000) + ' Hora(s),';
    MiliSeg := MiliSeg mod 3600000;
  end;
  if ((MiliSeg div 60000) > 0) then
  begin
    sAux    := sAux + IntToStr(MiliSeg div 60000) + ' Minuto(s),';
    MiliSeg := MiliSeg mod 60000;
  end;
  if ((MiliSeg div 1000) > 0) then
  begin
    sAux    := sAux + IntToStr(MiliSeg div 1000) + ' Segundos(s),';
    MiliSeg := MiliSeg mod 1000;
  end;
  
  sAux   := sAux + IntToStr(MiliSeg) + ' Milisegundo(s)';
  Result := sAux;
end;

function TempoDecorridoHMS(MiliSeg:integer; ImprimeMili:boolean): string;
var
  sAux: string;
begin
  sAux := '';
  if ((MiliSeg div 3600000) > 0) then
  begin
    sAux    := PoeZero(MiliSeg div 3600000) + ':';
    MiliSeg := (MiliSeg mod 3600000);
  end
  else
    sAux := '00:';

  if ((MiliSeg div 60000) > 0) then
  begin
    sAux    := sAux + PoeZero(MiliSeg div 60000) + ':';
    MiliSeg := (MiliSeg mod 60000);
  end
  else
    sAux := sAux + '00:';

  if ((MiliSeg div 1000) > 0) then
  begin
    sAux    := sAux + PoeZero(MiliSeg div 1000);
    MiliSeg := (MiliSeg mod 1000);
  end
  else
    sAux := sAux + '00';

  if (ImprimeMili) then
    Result := sAux + PoeZero(MiliSeg)
  else
    Result := sAux;
end;

function IntCod (Valor:LongInt; NumCasas:byte): string;
var
  S: string;
begin
  if (Valor = 0) then
    IntCod := ''
  else
  begin
    Str(Valor:NumCasas, S);
    IntCod := ColocaZeros(S, NumCasas);
  end;
end;

function MaiorID (Campo,Tabela: string): LongInt;
var
  iId: integer;
  Qry: TQuery;
begin
  Qry := TQuery.Create(Application);
  Qry.DatabaseName := 'BaseDados';
  with (Qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(' +Campo+ ') FROM '+ Tabela);
    Open;
    iId := Fields[0].asInteger;
    Close;
  end;
  Qry.Close;
  Qry.Free;
  
  Result := iId + 1;
end;

function BuscaListaSequencial (Lista:TStrings; Tam:byte; Codigo,MsgErr:string): string;
var
  I    : integer;
  Achou: boolean;
begin
  BuscaListaSequencial := Codigo;
  if (Codigo = '') then
    Exit;
  if (Lista.Indexof(Codigo) > -1) then  //ja achou, nao precisa procurar por codigo
    exit;
  I     := 0;
  Achou := false;
  while not(Achou) and (I < Lista.Count) do
  begin
    Achou := (Copy(Lista[I],1,Tam) = Codigo);
    if (Achou) then
      Codigo := Lista[I]
    else
      inc(I);
  end;

  if not(Achou) then
  begin
    Codigo := '';
    if (MsgErr <> '') then
      ShowMessage(MsgErr);
  end;
  BuscaListaSequencial := Codigo;
end;

function VerificaIDRubricaIndiv(IdPessoa,IdRubrica:integer; AnoMesInicio:string): boolean;
var
  Qry: TQuery;
begin
  Qry := TQuery.Create(Application);
  Qry.DatabaseName := 'BaseDados';
  with (Qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SEQRUBRICAINDIV FROM RUBRICAINDIV ' +
            'WHERE (IDPESSOA     = '+IntToStr(idpessoa) + ') AND '+
            '      (IDRUBRICA    = '+IntToStr(idrubrica)+ ') AND '+
            '      (ANOMESINICIO = '''+ AnoMesInicio    + ''')');
    Open;
    Result := (IsEmpty); // Retorna se há ou não algum registro selecionado
    Qry.Close;
    Qry.Free;
  end;
end;

function ProxRubricaIndiv(IdPessoa,IdRubrica: integer): integer;
var
  Qry: TQuery;
begin
  Qry := TQuery.Create(Application);
  Qry.DatabaseName := 'BaseDados';
  with (Qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT NVL(MAX(SEQRUBRICAINDIV),0) AS PROXSEQ FROM RUBRICAINDIV '+
            'WHERE (IDPESSOA  = '+IntToStr(idPessoa) + ') AND '+
            '      (IDRUBRICA = '+IntToStr(idRubrica)+ ')');
    Open;
    Result := FieldByName('PROXSEQ').asInteger; // Retorna Prox. Seq.
    Qry.Close;
    Qry.Free;
  end;
end;

function ProcuraStList (Lst: TStrings; St:string): integer;
var
  c, iPos: integer;
begin
  iPos := -1;
  for c:=0 to Lst.Count-1 do
    if (Pos(St,Lst.Strings[c]) > 0) then
    begin
      iPos := c;
      break;
    end;
  Result := iPos;
end;

function VerificaLinhaGrid(Qry:TQuery; TagChave,TagVazio:integer;
         TabelaMensagem:string; PermiteChaveVazia:boolean): boolean;
var
  X: integer;
  sChave: string;
  ListaChave: TStrings;
begin
  ListaChave := TStringList.Create;

  if (Qry.IsEmpty) then
  begin
    Result := true;
    exit;
  end;

  try
    Qry.DisableControls;
    Qry.First;
    while not(Qry.EOF) do
    begin
      sChave := '';
      for X:=0 to Qry.FieldCount-1 do
        if (Qry.Fields[X].Tag = TagChave) or (Qry.Fields[X].Tag = TagVazio) then
        begin
          sChave := sChave + Trim(Qry.Fields[X].asString);
          if (not PermiteChaveVazia) and (Qry.Fields[X].Tag <> TagVazio) then
            if (Qry.Fields[X].IsNull) then
            begin
              Application.MessageBox(PChar('O Campo ' +Qry.Fields[X].DisPlayLabel+
                ' do Cadastro de ' +TabelaMensagem+ ' não foi informado'),'Atenção',
                Mb_IconInformation);
              Result := false;
              Exit;
            end;
        end;
      if (ListaChave.IndexOf(sChave) <> -1) then
      begin
        Application.MessageBox(PChar('O Cadastro de ' +TabelaMensagem+
          ' contém um registro repetido'),'Atenção',Mb_IconInformation);
        Result := False;
        exit;
      end
      else
      if (sChave = '') then
      begin
        Application.MessageBox(Pchar('O Cadastro de ' +TabelaMensagem+
          ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
        Result := False;
        exit;
      end
      else
        ListaChave.Add(sChave);
      Qry.Next;
    end;
    Qry.First;
    Result := true;
  finally
    Qry.EnableControls;
    ListaChave.Free;
  end;
end;

function StringEm (Comparador:string; Arr:array of string): integer;
var
  c: integer;
begin
  Result := -1;
  for c:=0 to High(Arr) do
    if (Comparador = Arr[c]) then
    begin
      Result := c;
      break;
    end;
end;

function Comparar(Comparador:integer; Arr:array of integer): TComparar;
var
  c: integer;
begin
  Result.Pos := -1;
  for c:=0 to High(Arr) do
    if (Comparador = Arr[c]) then
    begin
      Result.Pos := c;
      break;
    end;
  Result.Achou := (Result.Pos > -1);
end;

function VerificaCodigoEm(St,Comparado:string; Separador:char): integer;
var
  AuxSt, AtualSt: string;
begin
  Result := 0;
  if (Trim(St) <> '') and (Trim(Comparado) <> '') and (Trim(Separador) <> '') then
  begin
    AuxSt   := St;
    AtualSt := St;
    repeat
      ExtraiString(AuxSt, AtualSt, Separador);

      if (AtualSt = Comparado) then
      begin
        Result := 1;
        break;
      end;
    until (AuxSt = '');
  end;
end;

function NovoCampoTabela(Nome:string; Tipo:TFieldType; Tamanho:integer; Requerido:boolean): TCampoTabela;
begin
  Result.Nome      := Nome;
  Result.Tipo      := Tipo;
  Result.Tamanho   := Tamanho;
  Result.Requerido := Requerido;
end;

function NovoIndiceTabela(Nome,Campos: string; Opcoes: TIndexOptions): TIndiceTabela;
begin
  Result.Nome   := Nome;
  Result.Campos := Campos;
  Result.Opcoes := Opcoes;
end;

function CriaTabelaTemp(Database, Nome:string; Campos:array of TCampoTabela;
  Indices:array of TIndiceTabela): boolean;
var
  c: integer;
  Table:TTable;
begin
  Result := true;
  Table  := TTable.Create(Application);

  Table.Active       := false;
  Table.DatabaseName := Database;
  Table.TableName    := Nome;
  Table.TableType    := ttDBase;
  Table.Exclusive    := false;

  try
    if not(Table.Exists) then
    begin
      Table.FieldDefs.Clear;
      for c:=0 to High(Campos) do
        Table.FieldDefs.Add(Campos[c].Nome, Campos[c].Tipo, Campos[c].Tamanho, Campos[c].Requerido);

      Table.CreateTable;

      for c:=0 to High(Indices) do
        Table.AddIndex(Indices[c].Nome, Indices[c].Campos, Indices[c].Opcoes);
    end
    else
      Table.EmptyTable;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := false;
    end;
  end;

  // Libera memória alocada para o objeto e indica NIL para o ponteiro TABLE
  FreeAndNil(Table);
end;

function ApagaTabelaTemp(Database,Nome: string): boolean;
var
  Table:TTable;
begin
  Result := true;
  Table  := TTable.Create(Application);

  Table.Active       := false;
  Table.DatabaseName := Database;
  Table.TableName    := Nome;
  Table.TableType    := ttDBase;
  Table.Exclusive    := false;

  try
    if (Table.Exists) then
      Table.DeleteTable;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := false;
    end;
  end;

  Table.Active := false;
  // Libera memória alocada para o objeto e indica NIL para o ponteiro TABLE
  FreeAndNil(Table);
end;

// ****************************************************************************************
// Funções para tratamento de Gráficos
// ****************************************************************************************

procedure DrawLine(Canvas:TCanvas; x1,y1,x2,y2:integer);
begin
  Canvas.MoveTo(x1,y1);
  Canvas.LineTo(x2,y2);
end;

procedure InvalidateItemListBox(lst:TCustomListBox; Index:integer);
var
  Rect: TRect;
begin
  Rect := lst.ItemRect(Index);
  InvalidateRect(lst.Handle, @Rect, false);
end;

procedure IniciaTXT(Var Arquivo : textFile; Caminho : string);
Begin
  Assignfile(Arquivo, Caminho);
  Rewrite(Arquivo);
end;

function strZero(TamanhoTexto : Integer; Texto : String) : String;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := zeros + texto;
end;

function strEspaco(TamanhoTexto : Integer; Texto : string) : string;
var
  numEspacos : integer;
  f          : integer;
  Espacos    : string;
begin
  Espacos := '';
  numEspacos := tamanhoTexto - length(texto);

  for f := 1 to numEspacos do
    Espacos := Espacos + ' ';

  result := texto + Espacos;
end;

function Zerodireita(TamanhoTexto : integer; texto : String) : string;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := texto + zeros;
end;

function FormataVAlor(NumeroCasas : integer; valor : string) : string;
Var
 i, b, flag : integer;
 Resultado, left, rigth : string;
begin
  left      := '';
  rigth     := '';
  resultado := '';
  flag := 0;
  for i := 1 to length(valor) do
    Begin
      if valor[i] = ',' then
        Begin
          for b := i + 1 to length(valor) do
           rigth := rigth + Valor[b];
          flag  := 1;
        end
      else if flag = 0 then
        left  := Left + valor[i];
    end;

    result := strZero((NumeroCasas - 2), left) + Zerodireita(2, copy(rigth, 1, 2))
end;

function Completadireita(TamanhoTexto: integer; texto,
                                  Caracter: String): string;
var
  numzeros : integer;
  f        : integer;
  Caracteres : string;
begin
  Caracteres := '';
  numzeros   := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    Caracteres := Caracteres + Caracter;

  result := texto + Caracteres;
end;

function NumWeekMonth(const TDT: TDateTime): integer;
//retorna o numero de semanas do mês
var
Y,M,D:Word;
dtTmp:TDateTime;
begin
  DecodeDate(TDT,Y,M,D);
  dtTmp := EnCodeDate(Y,M,1);
  Result := (Trunc(TDT-dtTmp) + (DayOfWeek(dtTmp)-1)) DIV 7;
  Result := Result + 1;
end;

end.
