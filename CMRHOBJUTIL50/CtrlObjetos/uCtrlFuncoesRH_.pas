unit uCtrlFuncoesRH;

interface

uses SysUtils, Classes, Controls, StdCtrls, WinTypes, Dialogs, Buttons, Forms, CheckLst,
  Graphics, Db, Wwdatsrc, fImagemDoc, CorreioCM, uCMTypes, IvDictio,jclfileutils,fsm_fxlib, 
  uCMClientDataSet, uCmControlObject, BrowseFolder;

const
  CR = #13;
  LF = #10;
  CR_LF = CR+LF;
  CL_AMARELO_CLARO = $00C0FFFF;

  DIR_PADRAO_ARQ_CONFIG = 'C:\';
  NOME_ARQ_CONFIG = 'CONFIG_FOLHAPAGTO.INI';

  PIXEL_MILIM = 0.265; // Usada na Conversão de Milímetros para Pixel

  // Usada para marcar o início de cada seção de um arquivo do Vale Transporte
  MARCA_DIVISAO_ARQUIVO = '###ARQUIVO###';

  // Tipos de retorno de Funções
  RETORNO_NORMAL = 0;
  RETORNO_AVISO = 1;
  RETORNO_ERRO = 2;

  NUM_OPERADORES = 6;
  Operador: array[1..6] of string = ('<>', '>=', '<=', '=', '>', '<');

  // Código dos módulos
  MODASM = 75;
  MODATN = 144;
  MODAUTO = 417;
  MODAVA = 70;
  MODBAS = 69;
  MODBEN = 71;
  MODCES = 74;
  MODCON = 76;
  MODFOL = 21;
  MODRES = 73;
  MODTRN = 72;
  PROCJUD = 111;
  PROCPREV = 110;
  MODACESSO = 82;

  // Código dos Clientes
  SERPROS = 1;
  REFER = 2;
  FUNCEF = 3;
  FCRT = 4;
  CTRQ = 5;
  CM_SOLUCOES = 6;
  MAKSOUD = 7;
  VILA_GALE_BA = 8;
  CLIENTE_PADRAO = 99;

  // Código de Nacionalidades
  BRASIL = 'BRA';
  PORTUGAL = 'POR';

  CODCENTRORESPON_PADRAO = '9999999999';
  UNIDNEGOC_PADRAO = -1;
  ATIVPROJETO_PADRAO = -1;

  // Utilizadas nos métodos que necessitam dizer qual operação será feita aos Dados
  INSERIR = 0;
  ALTERAR = 1;
  EXCLUIR = 2;

type
  TOnProc = procedure of object;

  TTipoProcura = (tpEmpregado, tpCandidato);

  TDiaMes  = array[1..12] of integer;
  TDiaData = array[1..12] of word;

  TComparar = record
    Pos: LongInt;
    Achou: boolean;
  end;

  TCtrlFuncoesRH = class(TCmControlObject)
  private
    FSepDecWin: char;
    FSepDecORACLE: char;
    FDirTemp: string;
    FDirTempLog: string;
    FArqConfig: string;
  public
    constructor Create; override;

    procedure GetTempDir;
    procedure SetArqConfig;
    function  GetNomeArqConfig: string;
    function  GetDirArqConfig: string;

    function IntervaloMesesComerciais(DataIni, DataFin: string): integer;
    function TotDiasNoAno(Mes, Ano: integer): integer;
    function AnoBi(DataMenor, DataMaior: string): double;
    function CalculaData(DataIni, DataFin: string; var NumDias, NumMeses, NumAnos: LongInt): boolean;
    function CalculaDifData(DataIni, DataFin: string; var NumDias, NumMeses, NumAnos: integer): boolean;
    function ColocaBarra(Data: string): string;
    function TiraBarra(Data: string): string;
    function IncData(const Data: TDate; const Dias, Meses, Anos: integer): TDate; 
    function AnoBissexto(Ano: integer): boolean;
    function TrazUltDiaMes(Mes, Ano: integer): integer;
    function TrazUltDiaData(Data: TDateTime): TDateTime;
    function RetornaAnoMes(Data: TDateTime): string;
    function AnoMes(Data: TDateTime): string;
    function RetornaDataAMD(Data: TDateTime; Barra: boolean): string;
    function IncDataAM(Data: string; Meses: integer): string;
    function RetornaMes(Mes: string): string;
    function MesExtensoAno(AnoBarraMes: string): string;
    function ExtraiDia(Data: TDate): word;
    function ExtraiMes(Data: TDate): word;
    function ExtraiAno(Data: TDate): word;
    function ProxMes(DataIni: TDateTime): TDateTime;
    function DifDataAnoMes(AnoMes1, AnoMes2: string): integer;
    function UltimosCaracteres(St: string; Num: word): string;
    function NormalizaString(St: string): string;
    function AbreviaNome(Max: word; Nome: string): string;
    function ConverteCar(St: string): string;
    function PoeZero(Num: byte): string;
    function TiraCaracter(Texto: string; Ch: char): string;
    function GetNumeros(const Str: string): string;
    function ContaCaracter(Texto: string; Ch: char): Integer;
    function TrocaCaracter(const Texto, De, Para: string): string;
    function Replicate(Texto: string; NumVezes: integer): string;
    function LeftPad(Texto: string; NumVezes: integer): string;
    function RightPad(Texto: string; NumVezes: integer): string;
    function Alinha(Texto: string; Tamanho: word; Direcao, Preenchedor: char): string;
    function TiraCarRepetidos(St: string; MaxRep: byte): string;
    function JuroComposto(Valor: double; NumMeses: Integer; TaxaJuros: double): double;
    procedure ExtraiString(var Str, StrAtual: string; Separador: string);
    function  GetPosString(Str, Comparado, Separador: string): integer;
    procedure VerificaOpcoes(CheckList: TCheckListBox; const Lista: TStringList;
      Valor, Separador: string);
    function CriaListaOpcoes(const CheckList: TCheckListBox; const Lista: TStringList;
      var Valor: string; Separador: string; EntrePliques: boolean;
      UsaNames: boolean = false): word;
    function ValidaCaracteres(Dado: string; Tipo: char; Opcoes: string): string;
    function ExisteCodigo(Lista: TStringList; ValorBusca: string): integer;
    function NumCaracteres(Ch: char; St: string): word;
    function fValidaDados(Tipo: char; Dado: string; Tamanho: word): string;
    function PosicaoCar(Ch: char; St: string; Posicao: word): word;
    function MontaLinhaSelSQL(SQL, Valor: string; TamanhoEspaco: word; UsaAND: boolean = true): string;
    function MontaSelSQL(SQL, Valores: string; QuantEspacosAntes, QuantEspacosDepois: word;
      UsaAND: boolean = true): string;
    function QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string;
      TamLinha: word): string;
    function QuotedListaString(const Lista: string; const Separador: char;
      const RetirarEspaco: boolean = false): string;
    function OraNumero(Numero: string): string;
    function ClienteNumero(Numero: string): string;
    function StrInt(St: string): LongInt;
    function StrFloat(St: string): double;
    function StrDate(St: string): TDate;
    function Float2String(Valor: double): string;
    function StringToFloat(Str: string): double;
    function String2Float(Str: string): double;
    function ValStr(Valor: double; Casas, Decimais: integer;
      FormatarMilhar: boolean; SepDec: string): string;
    function FloatWinToFloatDelphi(Str: string): double;
    function Truncar(Valor: double; Casas: integer): double;
    function Arredondar(Valor: double; Casas: integer): double;
    function RestoDivisao(Dividendo, Divisor: double): double;
    function IFF(Condicao: boolean; Primeiro, Segundo: string): string; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo: integer): integer; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo: double): double; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo: variant): variant; overload;
    function HoraPorExtenso(Hora: TTime): string;
    function PosInRange(const Texto, Procura: string; const Ini, Fin: integer): integer;
    function ProcuraStList(Lst: TStrings; St: string): integer;
    function StringEm(Comparador: string; Arr: array of string): integer;
    function Comparar(Comparador: integer; Arr: array of integer): TComparar;
    function VerificaCodigoEm(St, Comparado: string; Separador: char = ','): integer;
    procedure InserirCodigoEm(var St: string; const Codigo: string);
    function GerarListaTipoContratoSel(Efetivos, Especiais, Temporarios, Terceiros,
      PropDirSemVinc, Autonomos, Estagiarios: boolean; UsaPliques: boolean = false): string;
    function GerarListaSitFuncSel(Ativos, Afastados, Demitidos: boolean;
      UsaPliques: boolean = false): string;
    function GerarListaSexoSel(Masculino, Feminino: boolean;
      UsaPliques: boolean = false): string;
    function GerarListaTipoPagSel(Mensalistas, Diaristas, Horistas: boolean;
      UsaPliques: boolean = false): string;
    function GerarListaEstadoCivilSel(Solteiro, Casado, Separado, SeparadoJud, Desquitado,
      Viuvo, Outro: boolean; UsaPliques: boolean = false): string;

    procedure AssociarImagem(DataSet: TwwDataSource; CampoImagem: TBlobField;
      CampoChavePai: TFloatField; Titulo: string; HabilitarBtAssociar,
      HabilitarBtLimpar: boolean);
    function EnviarMensagemCM(IdRemetente, IdDestinatario: integer;
      NomeRemetente, Assunto: string; TipoDestinatario: TTipoDestinatario;
      Mensagem: string): boolean;
    function  AssociarDadosCds(Origem, Destino: TCMClientDataSet): boolean;
    procedure RegistrarCFX(LiberarCFX: boolean = false);
    function  MemoryUsed: integer;

    procedure DrawLine(Canvas: TCanvas; x1,y1,x2,y2: integer);
    procedure InvalidateItemListBox(lst: TCustomListBox; Index: integer);
    procedure FreeObject(var Obj; NilObject: boolean = false);
    function  ListVariaveisEmBranco: OleVariant;
    procedure GetSeparadorDecimalWindows;
    function  LerChaveRegistro(const NomeSistema, NomeChave: string): string;
    procedure GetSeparadorDecimalORACLE;
    function  SaveToFile(const NomeArquivo, Dados: string): boolean;
    function  GetFileDate(const NomeArquivo: string): TDate;
    function  ProcurarPasta(var Pasta: string; Rotulo, Titulo: string): boolean;
    procedure HabilitarFilhos(Pai: TWinControl; const Opcao: boolean);
    function  VersaoPadrao(const NomeDPL, VersaoDPL: TStringList): string;
 

    property  SepDecWin: char read FSepDecWin;
    property  SepDecORACLE: char read FSepDecORACLE write FSepDecORACLE;
    property  DirTemp: string read FDirTemp;
    property  DirTempLog: string read FDirTempLog;
    property  ArqConfig: string read FArqConfig;
  end;

function CMTranslateMsg(const sMsg: string; sParams: array of string): string;

var
  FU: TCtrlFuncoesRH;
  MSG_ERRO: string;
  MesLongo, MesCurto: array[1..12] of string;
  WM_INI_LOG_MONITOR: DWORD; // Mensagem de inicialização do LOG
  WM_ADD_LOG_MONITOR: DWORD; // Mensagem de adição de uma linha ao LOG

implementation
//StrUtils,
uses PsAPI, Math,Registry, uCMFileUtils, uCmCustomCdbObject;
  //DateUtils;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_HORA = ':1 Hora';
  MSG_HORAS = ':1 Horas';
  MSG_MINUTO = ':1 Minuto';
  MSG_MINUTOS = ':1 Minutos';
  MSG_SEGUNDO = ':1 Segundo';
  MSG_SEGUNDOS = ':1 Segundos';
  MSG_MILISEGUNDO = ':1 Milisegundo';
  MSG_MILISEGUNDOS = ':1 Milisegundos';
  MSG_PER_FOLHA = ':1 de :2';

function CMTranslateMsg(const sMsg: string; sParams: array of string): string;
var
  X: integer;
  iTam: integer;
  sFraseTraduzida: string;
begin
  sFraseTraduzida := sMsg;
  iTam := High(sParams);

  for X:=0 to iTam do
    sFraseTraduzida := StringReplace(sFraseTraduzida, ':' + IntToStr(X+1), sParams[x], []);

  Result := sFraseTraduzida;
end;

constructor TCtrlFuncoesRH.Create;
begin
  inherited;

  MSG_ERRO := CR_LF+CR_LF+ ('Descrição:') +CR_LF;

  MesLongo[01] := ('Janeiro');
  MesLongo[02] := ('Fevereiro');
  MesLongo[03] := ('Março');
  MesLongo[04] := ('Abril');
  MesLongo[05] := ('Maio');
  MesLongo[06] := ('Junho');
  MesLongo[07] := ('Julho');
  MesLongo[08] := ('Agosto');
  MesLongo[09] := ('Setembro');
  MesLongo[10] := ('Outubro');
  MesLongo[11] := ('Novembro');
  MesLongo[12] := ('Dezembro');

  MesCurto[01] := ('Jan');
  MesCurto[02] := ('Fev');
  MesCurto[03] := ('Mar');
  MesCurto[04] := ('Abr');
  MesCurto[05] := ('Mai');
  MesCurto[06] := ('Jun');
  MesCurto[07] := ('Jul');
  MesCurto[08] := ('Ago');
  MesCurto[09] := ('Set');
  MesCurto[10] := ('Out');
  MesCurto[11] := ('Nov');
  MesCurto[12] := ('Dez');
end;

procedure TCtrlFuncoesRH.GetTempDir;
begin
  FDirTemp := CMGetTempPath;
  FDirTempLog := FDirTemp + 'LogRH';
  if not(DirectoryExists(FDirTempLog)) then
    CreateDir(FDirTempLog);
end;

procedure TCtrlFuncoesRH.SetArqConfig;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  FArqConfig := '';
  try
    _CdsAux.Data := GetDataPacket('SELECT DIRCONFIG FROM PARAMRH');
    FArqConfig := _CdsAux.FieldByName('DIRCONFIG').asString;
  finally
    _CdsAux.Free;
  end;

  if (FArqConfig = '') then
    FArqConfig := DIR_PADRAO_ARQ_CONFIG;

  FArqConfig := FArqConfig +
    IFF(FArqConfig[Length(FArqConfig)] <> '\', '\', '')+ NOME_ARQ_CONFIG;
end;
{begin
  FArqConfig := DIR_PADRAO_ARQ_CONFIG +'\'+ NOME_ARQ_CONFIG;
end;}

function TCtrlFuncoesRH.GetNomeArqConfig: string;
begin
  Result := ExtractFileName(FArqConfig);
end;

function TCtrlFuncoesRH.GetDirArqConfig: string;
begin
  Result := ExtractFilePath(FArqConfig);
end;

// ****************************************************************************************
// Implementação das funções para tratamento de datas
// ****************************************************************************************

// ----------------------------------------------------------------------------------------
// Descrição:
// * Retorna um intervalo entre duas datas informadas em meses considerando mês comercial
// * Exemplo: de 31/01/2010 a 28/02/2010 vai retornar 1 mês (na rotina acima retorna 0)
// Entrada:
// * DataIni -> Data inicial (no formato DD/MM/YYYY)
// * DataFin -> Data Final   (no formato DD/MM/YYYY)
// Saída:
// * O intervalo entre as datas em meses
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.IntervaloMesesComerciais(DataIni, DataFin: string): integer;
var
  wAux, wDiaIni, wMesIni, wAnoIni, wDiaFin, wMesFin, wAnoFin: word;
begin
  wAux := 0;
  try
    DecodeDate(StrToDate(DataIni), wAnoIni, wMesIni, wDiaIni);
    DecodeDate(StrToDate(DataFin), wAnoFin, wMesFin, wDiaFin);

    if (StrToDate(DataIni) <= StrToDate(DataFin)) then
      wAux := (wAnoFin*12+wMesFin) - (wAnoIni*12+wMesIni);

    if (wDiaIni > wDiaFin) then
    begin
      Dec(wAux);
      if (wMesIni <> wMesFin) and (wDiaFin = TrazUltDiaMes(wMesFin, wAnoFin)) then
        Inc(wAux);
    end;
  finally
    Result := wAux;
  end;
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Retorna o total de dias no ano até o mês especificado
// Entrada:
// * Mes -> Mês da data a se calculada
// * Ano -> Ano da data a se calculada
// Saída:
// * O número de dias do ano até a data informada
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.TotDiasNoAno(Mes, Ano: integer): integer;
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
// Descrição:
// * Retorna o valor em dias do Ano a multiplicar entre as datas informadas. Quanto mais
//   anos bissextos maior será o multiplicador. Ex: 01/01/2000 a 01/01/20001 = 365.99
// Entrada:
// * DataMenor -> Data menor a calcular
// * DataMaior -> Data maior a calcular
// Saída:
// * O multiplicador mais adequado
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.AnoBi(DataMenor, DataMaior: string): double;
var
  dtAux: TDateTime;
  Dias, Quant: LongInt;
begin
  if StrToDate(DataMenor) > StrToDate(DataMaior) then
  begin
    dtAux := StrToDate(DataMenor);
    DataMenor := DataMaior;
    DataMaior := DateToStr(dtAux);
  end;
  Quant := 0;
  Dias := 0;
  dtAux := StrToDate(DataMenor);

  while (StrToDate(DataMaior) <> dtAux) do
  begin
    if (ExtraiDia(dtAux) = 29) and (ExtraiMes(dtAux) = 2) then
      Inc(Quant);
    Inc(Dias);
    dtAux := dtAux+1;
  end;
  Result := 365*(1+(Quant/Dias));
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Retorna a diferença entre datas sem considerar o dia
// Entrada:
// * DataIni -> Data Inicial
// * DataFin -> Data Final
// Saída:
// * Se o processo foi bem sucedido
// * NumDias -> O intervalo em dias
// * NumMeses -> O intervalo em meses
// * NumAnos -> O intervalo em anos
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.CalculaData(DataIni, DataFin: string; var NumDias, NumMeses,
  NumAnos: LongInt): boolean;
var
  M1, A1, M2, A2: integer;
begin
  try
    M1 := ExtraiMes(StrToDate(DataIni));
    A1 := ExtraiAno(StrToDate(DataIni));
    M2 := ExtraiMes(StrToDate(DataFin));
    A2 := ExtraiAno(StrToDate(DataFin));

    NumDias := Trunc(StrToDate(DataFin) - StrToDate(DataIni));
    NumMeses := (M2 + 12 * (A2 - 1)) - (M1 + 12 * (A1 - 1));
    NumAnos := Trunc(NumDias / 365.25);
    Result := true;
  except
    NumDias := 0;
    NumMeses := 0;
    NumAnos := 0;
    Result := false;
  end;
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Retorna a diferença entre datas considerando o dia
// Entrada:
// * DataIni -> Data Inicial
// * DataFin -> Data Final
// Saída:
// * Se o processo foi bem sucedido
// * NumDias -> O intervalo em dias
// * NumMeses -> O intervalo em meses
// * NumAnos -> O intervalo em anos
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.CalculaDifData(DataIni, DataFin: string; var NumDias, NumMeses,
  NumAnos: integer): boolean;
var
  D1, M1, A1, D2, M2, A2: integer;
  TD1, TD2: LongInt;
begin
  try
    D1 := ExtraiDia(StrToDate(DataIni));
    M1 := ExtraiMes(StrToDate(DataIni));
    A1 := ExtraiAno(StrToDate(DataIni));
    D2 := ExtraiDia(StrToDate(DataFin));
    M2 := ExtraiMes(StrToDate(DataFin));
    A2 := ExtraiAno(StrToDate(DataFin));

    TD1 := (D1 + TotDiasNoAno(M1,A1) + Round(AnoBi(DataIni,DataFin) * A1));
    TD2 := (D2 + TotDiasNoAno(M2,A2) + Round(AnoBi(DataIni,DataFin) * A2));
    NumDias := TD2 - TD1;

    NumMeses := (M2 + 12 * A2) - (M1 + 12 * A1);
    if (D1 > D2) then
      Dec(NumMeses);

    NumAnos := (NumDias div Round(AnoBi(DataIni,DataFin)));
    Result := true;
  except
    Result := false;
  end;
end;

// ----------------------------------------------------------------------------------------
// Descrição
// * Coloca Barra na Data
// Entrada:
// * Data -> Data a ser convertida
// Saída:
// * A Data com barras
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.ColocaBarra(Data: string): string;
begin
  if (Pos('/',Data) = 0) then
    Result := Copy(Data,1,2)+'/'+ Copy(Data,3,2)+'/'+ Copy(Data,5,4)
  else
    Result := Data;  
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Tira Barra da Data
// Entrada:
// * Data -> Data a ser convertida
// Saída:
// * A Data sem barras
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.TiraBarra(Data: string): string;
begin
  Result := TiraCaracter(Data,'/');
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Incrementa a Data informada em um número específico de Dias, Meses e Anos
// Entrada:
// * Data -> Data a ser incrementada
// * Dias -> Número de dias a incrementar
// * Meses -> Número de meses a incrementar
// * Anos -> Número de anos a incrementar
// Saída:
// * A Data incrementada
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.IncData(const Data: TDate; const Dias, Meses, Anos: integer): TDate;
begin
  if (Data = 0) then
  begin
    Result := 0;
    exit;
  end;

  try
    Result := Data;

    if (Dias <> 0) then
      Result := IncDay(Result, Dias);

    if (Meses <> 0) then
      Result := IncMonth(Result, Meses);

    if (Anos <> 0) then
      Result := IncYear(Result, Anos);
  except
    Result := 0;
  end;
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Verifica se é Ano Bissexto
// Entrada:
// * Anos -> O ano a comparar
// Saída:
// * Se o ano é bissexto ou não
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.AnoBissexto(Ano: integer): boolean;
begin
  Result := ((Ano mod 4) = 0);
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Traz último dia do mês
// Entrada:
// * Mes -> Mês da data a se comparada
// * Ano -> Ano da data a se comparada
// Saída:
// * último dia do mês especificado
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.TrazUltDiaMes(Mes, Ano: integer): integer;
var
  mDiaMes: TDiaMes;
begin
  if not(Mes in [1..12]) and (Ano <= 0) then
  begin
    Result := 0;
    exit;
  end;

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
  Result := mDiaMes[Mes];
end;

// ----------------------------------------------------------------------------------------
// Descrição:
// * Traz último dia do mês no formato data
// Entrada:
// * Data -> Data a se comparada
// Saída:
// * último dia do mês especificado
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesRH.TrazUltDiaData(Data: TDateTime): TDateTime;
var
  mDiaMes: TDiaData;
  Day, Month, Year: word;
begin
  if (Data <= 0) then
  begin
    Result := 0;
    exit;
  end;

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
  Result := EncodeDate(Year, Month, mDiaMes[Month]);
end;

// Retorna a data no formato AAAA/MM
function TCtrlFuncoesRH.RetornaAnoMes(Data: TDateTime): string;
var
  wAno, wMes, wDia: word;
begin
  if (Data <= 0) then
  begin
    Result := '';
    exit;
  end;

  DecodeDate(Data, wAno, wMes, wDia);
  Result := IntToStr(wAno) + '/'+ PoeZero(wMes);
end;

// Retorna a data no formato AAAAMM
function TCtrlFuncoesRH.AnoMes(Data: TDateTime): string;
var
  wAno, wMes, wDia: word;
begin
  if (Data <= 0) then
  begin
    Result := '';
    exit;
  end;

  DecodeDate(Data, wAno, wMes, wDia);
  Result := IntToStr(wAno) + PoeZero(wMes);
end;

// Retorna a data no formato AAAAMMDD se Barra = False ou AAAA/MM/DD se Barra = True
function TCtrlFuncoesRH.RetornaDataAMD(Data: TDateTime; Barra: boolean): string;
var
  wAno, wMes, wDia: word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  if (Barra) then
    Result := IntToStr(wAno) +'/'+ PoeZero(wMes) +'/'+ PoeZero(wDia)
  else
    Result := IntToStr(wAno) + PoeZero(wMes) + PoeZero(wDia);
end;

// Incrementa Datas AAAA/MM
function TCtrlFuncoesRH.IncDataAM(Data: string; Meses: integer): string;
var
  xMes, xAno, i: integer;
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

  Data := Data + PoeZero(xMes);
  Result := Data;
end;

// Retorna o mes de uma data informada (POR EXTENSO)
function TCtrlFuncoesRH.RetornaMes(Mes: string): string;
begin
  Mes := AnsiUpperCase(Mes);
  if (Mes = ('JANEIRO')) then
    Result := '01'
  else
  if (Mes = ('FEVEREIRO')) then
    Result := '02'
  else
  if (Mes = ('MARÇO')) then
    Result := '03'
  else
  if (Mes = ('ABRIL')) then
    Result := '04'
  else
  if (Mes = ('MAIO')) then
    Result := '05'
  else
  if (Mes = ('JUNHO')) then
    Result := '06'
  else
  if (Mes = ('JULHO')) then
    Result := '07'
  else
  if (Mes = ('AGOSTO')) then
    Result := '08'
  else
  if (Mes = ('SETEMBRO')) then
    Result := '09'
  else
  if (Mes = ('OUTUBRO')) then
    Result := '10'
  else
  if (Mes = ('NOVEMBRO')) then
    Result := '11'
  else
  if (Mes = ('DEZEMBRO')) then
    Result := '12';
end;

// Retorna o mes e o ano de uma data informada (POR EXTENSO)
function TCtrlFuncoesRH.MesExtensoAno(AnoBarraMes: string): string;
begin
  if (AnoBarraMes <> '') then
    Result := CMTranslateMsg(MSG_PER_FOLHA,
      [MesLongo[StrToIntDef(Copy(AnoBarraMes,6,2),1)], Copy(AnoBarraMes,1,4)])
  else
    Result := '';
end;

//--------------------------------------------------------------------------------------------------
// Descrição:
// * Retorna o Dia de uma determinada data
// Entrada:
// * Data -> Data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TCtrlFuncoesRH.ExtraiDia(Data: TDate): word;
var
  wAno, wMes, wDia: word;
begin
  if (Data <= 0) then
  begin
    Result := 0;
    exit;
  end;

  DecodeDate(Data, wAno, wMes, wDia);
  Result := wDia;
end;

//--------------------------------------------------------------------------------------------------
// Descrição:
// * Retorna o Mês de uma determinada data
// Entrada:
// * Data -> Data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TCtrlFuncoesRH.ExtraiMes(Data: TDate): word;
var
  wAno, wMes, wDia: word;
begin
  if (Data <= 0) then
  begin
    Result := 0;
    exit;
  end;

  DecodeDate(Data, wAno, wMes, wDia);
  Result := wMes;
end;

//--------------------------------------------------------------------------------------------------
// Descrição:
// * Retorna o Ano de uma determinada data
// Entrada:
// * Data -> Data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TCtrlFuncoesRH.ExtraiAno(Data: TDate): word;
var
  wAno, wMes, wDia: word;
begin
  if (Data <= 0) then
  begin
    Result := 0;
    exit;
  end;

  DecodeDate(Data, wAno, wMes, wDia);
  Result := wAno;
end;

//--------------------------------------------------------------------------------------------------
// Descrição:
// * Retorna o próximo mês de uma data informada
// Entrada:
// * DataIni -> Data em questão
//--------------------------------------------------------------------------------------------------
function TCtrlFuncoesRH.ProxMes(DataIni: TDateTime): TDateTime;
begin
  Result := IncMonth(DataIni, 1);
end;

// Retorna a diferença entre as datas no formato AAAA/MM em meses
function TCtrlFuncoesRH.DifDataAnoMes(AnoMes1, AnoMes2: string): integer;
var
  dtAux1, dtAux2: integer;
begin
  dtAux1 := (StrToInt(Copy(AnoMes1,1,4))*12) + StrToInt(Copy(AnoMes1,6,2));
  dtAux2 := (StrToInt(Copy(AnoMes2,1,4))*12) + StrToInt(Copy(AnoMes2,6,2));
  Result := (dtAux1 - dtAux2);
end;

// Pegar os últimos NUM caracteres de uma string ST
function TCtrlFuncoesRH.UltimosCaracteres(St: string; Num: word): string;
begin
  Result := Copy(St, Length(St) - Num + 1, Num);
end;

// Retira os espaços em demasia de ST. EX: '  Jesus    Cristo' -> 'Jesus Cristo'.
function TCtrlFuncoesRH.NormalizaString(St: string): string;
var
  sAux: string;
  c: word;
  cCarAnt: char;
begin
  St := Trim(St);
  sAux := '';
  if (Length(St) > 0) then
  begin
    cCarAnt := St[1];
    for c:=1 to Length(St) do
    begin
      if not((cCarAnt = ' ') and (st[c] = ' ')) then
        sAux := sAux + St[c];
      cCarAnt := St[c];
    end;
  end;
  Result := sAux;
end;

// Abrevia um nome se o seu tamanho for maior que o máximo possível especificado em wMax.
function TCtrlFuncoesRH.AbreviaNome(Max: word; Nome: string): string;
const
  Juncoes = 'E DA DE DO DAS DOS';
var
  c1, c2: word;
begin
  Nome := UpperCase(NormalizaString(Nome));
  c1 := 2;
  while (Max < length(Nome)) do
  begin
    if (Nome[c1-1] = ' ')and (Nome[c1] in ['A'..'Z']) then
    begin
      c2 := c1;
      while (Nome[c2] <> ' ') and (c2 <= length(Nome)) do
        Inc(c2);

      if (Pos (Copy(Nome, c1, c2-c1), Juncoes) = 0) and ((c2 <= length(Nome)) or
         (Max < length(Nome))) then
      begin
        Insert('.', Nome, c1+1);
        Delete(Nome, c1+2, c2-c1-1);
      end;
    end;
    Inc(c1);
  end;
  Result := Nome;
end;

// Converte caracteres COM ACENTO para SEM ACENTO
function TCtrlFuncoesRH.ConverteCar(St: string): string;
var
  Aux: string;
  Car: char;
  c: integer;
begin
  Aux := '';
  if (St <> '') then
  begin
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
  end;
  Result := Aux;
end;

// Retorna o número Num com um zero na frente se este tiver apenas uma casa
function TCtrlFuncoesRH.PoeZero(Num: byte): string;
var
  sAux: string;
begin
  if (Num < 10) then
    sAux := '0'+IntToStr(Num)
  else
    sAux := IntToStr(Num);
  Result := sAux;
end;

// Retira os caracteres CH da string TEXTO
function TCtrlFuncoesRH.TiraCaracter(Texto: string; Ch: char): string;
var
  Posic: byte;
begin
  Posic := Pos(Ch, Texto);
  if (Posic > 0) then
  begin
    Delete (Texto, Posic, 1);
    Posic := Pos(Ch, Texto);
    if (Posic > 0) then
      Delete(Texto, Posic, 1);
  end;
  Result := Texto;
end;

function TCtrlFuncoesRH.GetNumeros(const Str: string): string;
var
  c: integer;
begin
  Result := '';
  for c:=0 to Length(Str)-1 do
    if (Str[c+1] in ['0'..'9']) then
      Result := Result + Str[c+1];
end;

// Retorna a quantidade de caracteres CH na string TEXTO
function TCtrlFuncoesRH.ContaCaracter(Texto: string; Ch: char): integer;
var
  c: integer;
begin
  Result := 0;
  for c:=1 to Length(Texto) do
    if (Texto[c] = Ch) then
      Inc(Result);
end;

// Troca a String DE da string TEXTO para PARA
function TCtrlFuncoesRH.TrocaCaracter(const Texto, De, Para: string): string;
var
  iPos: integer;
{-->}function StuffString(const AText: string; AStart, ALength: Cardinal;
       const ASubText: string): string;
     begin
       Result := Copy(AText, 1, AStart - 1) +ASubText+ Copy(AText, AStart + ALength, MaxInt);
{-->}end;


begin
  Result := Texto;
  repeat
    iPos := Pos(De, Result);
    if (iPos > 0) then
      Result := StuffString(Result, iPos, Length(De), Para);
  until (iPos = 0);
end;

// Retorna ATEXTO repetido NUMVEZES
function TCtrlFuncoesRH.Replicate(Texto: string; NumVezes: integer): string;
var
  c: word;
  Temp: string;
begin
  Temp := '';
  for c:=1 to NumVezes do
    Temp := Temp + Texto;
  Result := Temp;
end;

// Retorna a string ATEXTO alinhada a esquerda com NUMVEZES espaços em branco a sua direita
function TCtrlFuncoesRH.LeftPad(Texto: string; NumVezes: integer): string;
begin
  Result := Copy(Texto, 1, NumVezes);
  if (Length(Result) < NumVezes) then
    Result := Result + Replicate(' ', NumVezes - Length(Result));
end;

// Retorna a string ATEXTO alinhada a direita com NUMVEZES espaços em branco a sua esquerda
function TCtrlFuncoesRH.RightPad(Texto: string; NumVezes: integer): string;
begin
  Result := Copy(Texto, 1, NumVezes);
  if (Length(Result) < NumVezes) then
    Result := Replicate(' ', NumVezes - Length(Result)) + Result;
end;

// Alinha a string TEXTO na direção DIRECAO, preenchendo com WTAMANHO caracteres PREENCHEDOR
function TCtrlFuncoesRH.Alinha(Texto: string; Tamanho: word; Direcao, Preenchedor: char): string;
var
  sEspaco: string;
begin
  Result := '';
  Direcao := UpCase(Direcao);

  // Testar Parametros
  if (Tamanho = 0) or not(Direcao in ['D','E','C']) then
    exit;

  // Cortar o Texto se este for maior que o Tamanho informado
  Texto := Copy(Texto, 1, Tamanho);

  // Criar Espaco do Tamanho
  sEspaco := Replicate(Preenchedor, Tamanho - Length(Texto));

  // Caso Tipo = Centralizado Divide Tamanho
  case (Direcao) of
    'C' : // Centralizado
    begin
      sEspaco := Replicate(Preenchedor,Trunc((Tamanho-Length(Texto))/2));
      Result  := sEspaco + Texto + sEspaco;
      if (Length(Result) < Tamanho) then
        Result := Result + Preenchedor;
    end;
    'D' : Result := sEspaco + Texto; // Direita
    'E' : Result := Texto + sEspaco; // Esquerda
  end;
end;

// Retira MAXREP número de caracteres repetidos consecutivamente da string ST
function TCtrlFuncoesRH.TiraCarRepetidos(St: string; MaxRep: byte): string;
var
  sAux: string;
  bNumRep, c: byte;
  cCar: char;
begin
  if (Length(St) <= 1) then
  begin
    Result := St;
    exit;
  end;

  c := 2;
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
      Inc(c);
      if (c >= Length(st)+1) then
      begin
        Result := sAux;
        exit;
      end;
    end;

    if (c <= Length(st)) then
    begin
      sAux := sAux+st[c];
      cCar := st[c];
    end;
    bNumRep := 1;
    Inc(c);
  until (c >= Length(st)+1);
  Result := sAux;
end;

procedure TCtrlFuncoesRH.ExtraiString(var Str, StrAtual: string; Separador: string);
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);
  if (iPos > 0) then
  begin
    StrAtual := Copy(Str, 1, iPos-1);
    Delete(Str, 1, iPos + Length(Separador)-1);
  end
  else
  begin
    StrAtual := Str;
    Str := '';
  end;
end;

function TCtrlFuncoesRH.GetPosString(Str, Comparado, Separador: string): integer;
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);

  if (Str = Comparado) or ((iPos > 0) and (Copy(Str,1,iPos-1) = Comparado)) then
    iPos := 1
  else
    iPos := Pos(',' + Comparado, Str);

  Result := iPos;
end;

// Calcula Juros Compostos
function TCtrlFuncoesRH.JuroComposto(Valor: double; NumMeses: integer; TaxaJuros: double): double;
var
  c: integer;
begin
  Result := 0;
  if (NumMeses <= 0) or (Valor = 0) or (TaxaJuros = 0) then
    exit;
    
  for c:=1 to NumMeses do
    Result := Result + (Result + Valor) * TaxaJuros / 100;
end;

// Marca na CheckListBox "CheckList" o(s) elemento(s) de Valor
// (string em que os elementos são separados pelo caracter informado em Separador)
// usando os códigos contidos em Lista
procedure TCtrlFuncoesRH.VerificaOpcoes(CheckList: TCheckListBox; const Lista: TStringList;
  Valor, Separador: string);
var
  iPos: integer;
  ValorAtual: string;
begin
  for iPos:=0 to CheckList.Items.Count-1 do
    CheckList.Checked[iPos] := false;

  while (Trim(Valor) <> '') do
  begin
    ExtraiString(Valor, ValorAtual, Separador);
    iPos := Lista.IndexOf(ValorAtual);
    if (iPos > -1) then
      CheckList.Checked[iPos] := true;
  end;
end;

function TCtrlFuncoesRH.CriaListaOpcoes(const CheckList: TCheckListBox;
  const Lista: TStringList; var Valor: string; Separador: string; EntrePliques: boolean;
  UsaNames: boolean): word;
var
  wAux: word;
  I, K: integer;
  AuxValor: string;
begin
  AuxValor := '';
  K := 1;
  wAux := 0;
  for I:=0 to CheckList.Items.Count-1 do
    if (CheckList.Checked[I]) then
    begin
      if (K = 1) then
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := Lista[I];
        end;
        Inc(K);
      end
      else
      begin
        if (EntrePliques) then
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ QuotedStr(Copy(Lista[I], 1, Pos('=',Lista[I])-1))
          else
            AuxValor := AuxValor +Separador+ QuotedStr(Lista[I]);
        end
        else
        begin
          if (UsaNames) then
            AuxValor := AuxValor +Separador+ Copy(Lista[I], 1, Pos('=',Lista[I])-1)
          else
            AuxValor := AuxValor +Separador+ Lista[I];
        end;
      end;
      Inc(wAux);
    end;

  Valor := AuxValor;
  Result := wAux;
end;

// Retorna uma string contendo somente os caracteres válidos de "Dado" de acordo com o "Tipo"
// especificado e opções especificadas em "Opcoes"
function TCtrlFuncoesRH.ValidaCaracteres(Dado: string; Tipo: char; Opcoes: string): string;
var
  c: word;
  sTemp: string;
  TempOpcoes: set of char;
begin
  // Faz Validação básica para a utilização da Função
  if not(Tipo in ['A','N']) and (Opcoes = '') then
  begin
    MessageInfo := ('Erro na Função ValidaCaracteres.') +CR_LF+
      ('O tipo do dado não foi indicado ou o mesmo não é válido.');
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
          if (Dado <> '') then
          begin
            if (Dado[1] in ['-','+']) then
              sTemp := Dado[1];

            for c:=1 to length(Dado) do
              if (Dado[c] in ['0'..'9',ThousandSeparator,DecimalSeparator]) then
                sTemp := sTemp + Dado[c];
          end;      
        except
          sTemp := Replicate('0', length(Dado));
        end;
      end;
    end;
  end;
  
  Result := sTemp;
end;

function TCtrlFuncoesRH.ExisteCodigo(Lista: TStringList; ValorBusca: string): integer;
var
  c: integer;
  sCodigo: string;
begin
  Result := -1;
  for c:=0 to Lista.Count-1 do
  begin
    sCodigo := Copy(Lista[c], 1, Pos('=',Lista[c])-1);
    if (ValorBusca = sCodigo) then
    begin
      Result := StrInt(Copy(Lista[c], Pos('=',Lista[c])+1,
        Length(Lista[c]) - Pos('=',Lista[c])));
      break;
    end;
  end;
end;

// Retorna o número de caracteres "Ch" dentro de "St"
function TCtrlFuncoesRH.NumCaracteres(Ch: char; St: string): word;
var
  c, wAux: word;
begin
  wAux := 0;
  for c:=1 to length(St) do
    if (St[c] = Ch) then
      Inc(wAux);

  Result := wAux;
end;

// Valida os dados de acordo com o tipo de dado especificado
// *************************************************************************************
// Parâmetros: sTipo    - A (alfanumérico), N (numérico)
//             sDado    - Dado a ser validado
//             wTamanho - Tamanho de retorno da string validada
// *************************************************************************************
function TCtrlFuncoesRH.fValidaDados(Tipo: char; Dado: string; Tamanho: word): string;
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
  Tipo := UpCase(Tipo);
  Dado := Trim(Dado);

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

        sTemp := Alinha(Copy(sTemp,1,wMax), Tamanho, 'E', ' ');
      except
        sTemp := Replicate(' ', Tamanho);
      end;
    end;

    'A' : // Campos alfabéticos
    begin
      try
        Dado := UpperCase(NormalizaString(ConverteCar(Dado)));

        for c:=1 to length(Dado) do
          if (Dado[c] in [' ','A'..'Z']) then
            sTemp := sTemp + Dado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), Tamanho, 'E', ' ');
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

// Retorna a posição do POSICAO caracter CH na string ST
function TCtrlFuncoesRH.PosicaoCar(Ch: char; St: string; Posicao: word): word;
var
  c, wNum: word;
begin
  Result := 0;
  wNum := 1;
  for c:=1 to Length(St) do
    if (St[c] = Ch) then
    begin
      if (wNum = Posicao) then
      begin
        Result := c;
        break;
      end;
      Inc(wNum);
    end;
end;

function TCtrlFuncoesRH.MontaLinhaSelSQL(SQL, Valor: string; TamanhoEspaco: word;
  UsaAND: boolean): string;
begin
  if (Pos(',',Valor) > 0) then
    Result := SQL + Replicate(' ',TamanhoEspaco) + 'IN (' + Valor+ '))'
  else
    Result := SQL + Replicate(' ',TamanhoEspaco) + ' = ' + Valor+ ')';

  if (UsaAND) then
    Result := Result + ' AND';
end;

function TCtrlFuncoesRH.MontaSelSQL(SQL, Valores: string; QuantEspacosAntes,
  QuantEspacosDepois: word; UsaAND: boolean): string;
begin
  if (Trim(Valores) = '') then
    Result := ''
  else
  begin
    Result := Replicate(' ',QuantEspacosAntes) +'('+ SQL + Replicate(' ',QuantEspacosDepois);

    if (Pos(',',Valores) > 0) then
      Result := Result + 'IN (' +Valores+ '))'
    else
      Result := Result + ' = ' +Valores+ ')';

    if (UsaAND) then
      Result := Result + ' AND';
  end;    
end;

function TCtrlFuncoesRH.QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string;
  TamLinha: word): string;
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
    Result := Replicate(' ', NumEspacos) + Filtro +
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
      Filtro +
      IFF(iNumItensLista>1,' IN (',' = ') +
      sLinhaAtual + '))'+
      IFF(c < iNumLinhas, ' OR' + CR, '');
  end;

  if (Result <> '') and (Pos(CR,Result) > 0) then
    Result := Replicate(' ',NumEspacos) +'('+ CR +Result+ CR +Replicate(' ',NumEspacos)+ ')';
end;

// Insere pliques entre os elementos de uma lista
function TCtrlFuncoesRH.QuotedListaString(const Lista: string; const Separador: char;
  const RetirarEspaco: boolean): string;
var
  sItem, sAux: string;
  iPosSeparador: integer;
begin
  sAux := Lista;
  sItem := '';
  Result := '';
  while (sAux <> '') do
  begin
    iPosSeparador := Pos(Separador, sAux);
    if (iPosSeparador = 1) then
    begin
      Delete(sAux, 1, 1);
      continue;
    end
    else
    if (iPosSeparador > 1) then
      sItem := Copy(sAux, 1, iPosSeparador-1)
    else
      sItem := sAux;

    if (RetirarEspaco) then
      sItem := Trim(sItem);

    if (Result = '') then
      Result := QuotedStr(sItem)
    else
      Result := Result +Separador+ QuotedStr(sItem);

    Delete(sAux, 1, Length(sItem));
  end;
end;

// Retorna um número de acordo com o servidor ORACLE
function TCtrlFuncoesRH.OraNumero(Numero: string): string;
var
  c: integer;
begin
  Result := '';
  for c:=1 to Length(Trim(Numero)) do
  begin
    if (Numero[c] = ',') then
      Result := Result + '.'
    else
      Result := Result + Numero[c]
  end;
end;

// Retorna um número de acordo com a máquina cliente
function TCtrlFuncoesRH.ClienteNumero(Numero: string): string;
var
  c: integer;
  sCliente: string;
begin
  sCliente := '';

  for c:=1 to length(Trim(Numero)) do
  begin
    if (Numero[c] = '.') then
      sCliente := sCliente + DecimalSeparator
    else
      sCliente := sCliente + Numero[c]
  end;
  Result := sCliente;
end;

// Transforma String em Inteiro retornando Zero se a string não for o um inteiro válido
function TCtrlFuncoesRH.StrInt(St: string): LongInt;
begin
  try
    Result := StrToInt(St);
  except
    Result := 0;
  end;
end;

// Transforma String em Real retornando Zero se a string não for o um Real válido
function TCtrlFuncoesRH.StrFloat(St: string): double;
begin
  try
    Result := StrToFloat(St);
  except
    Result := 0;
  end;
end;

function TCtrlFuncoesRH.StrDate(St: string): TDate;
begin
  try
    Result := StrToDate(St);
  except
    Result := 0;
  end;
end;

// Transfoma um Real em String
function TCtrlFuncoesRH.Float2String(Valor: double): string;
var
  cAuxSeparator: char;
begin
  cAuxSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  Result := FormatFloat('#0.00', Valor);
  DecimalSeparator := cAuxSeparator;
end;

// Transfoma uma String em Real independente do "DecimalSeparator"
function TCtrlFuncoesRH.StringToFloat(Str: string): double;
var
  cAuxSeparator: char;
begin
  if (Trim(Str) <> '') then
  begin
    Str := TrocaCaracter(TiraCaracter(Str, '.'), ',', '.');
    cAuxSeparator := DecimalSeparator;
    DecimalSeparator := '.';
    Result := StrToFloat(Str);
    DecimalSeparator := cAuxSeparator;
  end
  else
    Result := 0;
end;

// Transfoma uma String em Real
function TCtrlFuncoesRH.String2Float(Str: string): double;
var
  cAuxSeparator: char;
begin
  if (Trim(Str) <> '') then
  begin
    cAuxSeparator := DecimalSeparator;
    DecimalSeparator := '.';
    Result := StrToFloat(Str);
    DecimalSeparator := cAuxSeparator;
  end
  else
    Result := 0;
end;

// Formata um campo Real validando-o
// Passar '' em sepdec para usar o default do windows
function TCtrlFuncoesRH.ValStr(Valor: double; Casas, Decimais: integer;
  FormatarMilhar: boolean; SepDec: string): string;
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

  sValor := FormatFloat(sMascara, Valor);
  DecimalSeparator := cAux;
  sValor := Copy(sValor, 1, Casas);

  if (sValor[Length(sValor)] = DecimalSeparator) then
    SetLength(sValor, Length(sValor)-1);

  Result := sValor;
end;

function TCtrlFuncoesRH.FloatWinToFloatDelphi(Str: string): double;
var
  cAuxSeparator: char;
begin
  if (Trim(Str) <> '') then
  begin
    cAuxSeparator := DecimalSeparator;
    DecimalSeparator := FSepDecWin;
    Result := StrToFloat(Str);
    DecimalSeparator := cAuxSeparator;
  end
  else
    Result := 0;
end;

function TCtrlFuncoesRH.Truncar(Valor: double; Casas: integer): double;
var
  dFator: double;
begin
  dFator := IntPower(10, Casas);
  Result := Trunc(Valor * dFator) / dFator;
end;

function TCtrlFuncoesRH.Arredondar(Valor: double; Casas: integer): double;
var
  dFator: double;
begin
  dFator := IntPower(10, Casas);
  Result := Round(Valor * dFator) / dFator;
end;

function TCtrlFuncoesRH.RestoDivisao(Dividendo, Divisor: double): double;
begin
  Result := Dividendo - (Trunc(Dividendo / Divisor) * Divisor);
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function TCtrlFuncoesRH.IFF(Condicao: boolean; Primeiro, Segundo: string): string;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function TCtrlFuncoesRH.IFF(Condicao: boolean; Primeiro, Segundo: integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function TCtrlFuncoesRH.IFF(Condicao: boolean; Primeiro, Segundo: double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TCtrlFuncoesRH.IFF(Condicao: boolean; Primeiro, Segundo: variant): variant;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TCtrlFuncoesRH.HoraPorExtenso(Hora: TTime): string;
var
  wHora, wMin, wSeg, wMSeg: word;
begin
  Result := '';
  DecodeTime(Hora, wHora, wMin, wSeg, wMSeg);

  if (wHora > 1) then
    Result := CMTranslateMsg(MSG_HORAS, [IntToStr(wHora)])
  else
  if (wHora = 1) then
    Result := CMTranslateMsg(MSG_HORA, [IntToStr(wHora)]);

  if (wMin > 1) then
    Result := Result +IFF(Result='','',', ')+ CMTranslateMsg(MSG_MINUTOS, [IntToStr(wMin)])
  else
  if (wMin = 1) then
    Result := Result +IFF(Result='','',', ')+ CMTranslateMsg(MSG_MINUTO, [IntToStr(wMin)]);

  if (wSeg > 1) then
    Result := Result +IFF(Result='','',', ')+ CMTranslateMsg(MSG_SEGUNDOS, [IntToStr(wSeg)])
  else
  if (wSeg = 1) then
    Result := Result +IFF(Result='','',', ')+ CMTranslateMsg(MSG_SEGUNDO, [IntToStr(wSeg)]);

  if (wMSeg > 1) then
    Result := Result +IFF(Result='','',', ')+ CMTranslateMsg(MSG_MILISEGUNDOS, [IntToStr(wMSeg)])
  else
  if (wMSeg = 1) then
    Result := Result +IFF(Result='','',', ')+ CMTranslateMsg(MSG_MILISEGUNDO, [IntToStr(wMSeg)]);
end;

// Retornar a posição de uma String "Procura" na String "Texto" a partir
// do ponto "Ini" até "Fin"
function TCtrlFuncoesRH.PosInRange(const Texto, Procura: string; const Ini, Fin: integer): integer;
begin
  Result := Pos(Procura, Copy(Texto, Ini, Fin-Ini+1));
  if (Result > 0) then
    Result := Result + Ini - 1;
end;

function TCtrlFuncoesRH.ProcuraStList(Lst: TStrings; St: string): integer;
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

// Compara uma string com um vetor de strings; retornando (-1) se não encontrar a string ou
// a posição dela no vetor se a encontrar
function TCtrlFuncoesRH.StringEm(Comparador: string; Arr: array of string): integer;
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

// Compara um número com um vetor de números; retornando (-1) se não encontrar o número ou
// a posição dele no vetor se a encontrar
function TCtrlFuncoesRH.Comparar(Comparador: integer; Arr: array of integer): TComparar;
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

// Verifica se uma string COMPARADO está na string ST respeitando o separador SEPARADOR
// Retorna "0" se não achou ou não foi informado algum parâmetro, "1" se achou
function TCtrlFuncoesRH.VerificaCodigoEm(St, Comparado: string; Separador: char): integer;
var
  AuxSt, AtualSt: string;
begin
  Result := -1;
  if (Trim(St) <> '') and (Trim(Comparado) <> '') and (Trim(Separador) <> '') then
  begin
    Result  := 0;
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

procedure TCtrlFuncoesRH.InserirCodigoEm(var St: string; const Codigo: string);
begin
  if (St = '') and (Codigo <> '') then
    St := Codigo
  else
  if (St <> '') and (Codigo <> '') then  
    St := St +','+ Codigo;  
end;

// Retorna uma string com a lista de Tipos de Contrato selecionados
function TCtrlFuncoesRH.GerarListaTipoContratoSel(Efetivos, Especiais, Temporarios,
  Terceiros, PropDirSemVinc, Autonomos, Estagiarios, UsaPliques: boolean): string;
begin
  Result := '';
  if (Efetivos) then
    Result := 'E';

  if (Especiais) then
    if (length(Result) > 0) then
      Result := Result +',S'
    else
      Result := 'S';

  if (Temporarios) then
    if (length(Result) > 0) then
      Result := Result +',T'
    else
      Result := 'T';

  if (Terceiros) then
    if (length(Result) > 0) then
      Result := Result +',3'
    else
      Result := '3';

  if (PropDirSemVinc) then
    if (length(Result) > 0) then
      Result := Result +',P'
    else
      Result := 'P';

  if (Autonomos) then
    if (length(Result) > 0) then
      Result := Result +',A'
    else
      Result := 'A';

  if (Estagiarios) then
    if (length(Result) > 0) then
      Result := Result +',G'
    else
      Result := 'G';

  if (UsaPliques) then
    Result := QuotedListaString(Result, ',');
end;

// Retorna uma string com a lista de Tipos de Situação Funcional selecionados
function TCtrlFuncoesRH.GerarListaSitFuncSel(Ativos, Afastados, Demitidos,
  UsaPliques: boolean): string;
begin
  Result := '';
  if (Ativos) then
    Result := 'A';

  if (Afastados) then
    if (length(Result) > 0) then
      Result := Result +',F'
    else
      Result := 'F';

  if (Demitidos) then
    if (length(Result) > 0) then
      Result := Result +',D'
    else
      Result := 'D';

  if (UsaPliques) then
    Result := QuotedListaString(Result, ',');
end;

// Retorna uma string com a lista de Tipos de Sexo selecionados
function TCtrlFuncoesRH.GerarListaSexoSel(Masculino, Feminino, UsaPliques: boolean): string;
begin
  Result := '';
  if (Masculino) then
    Result := 'M';

  if (Feminino) then
    if (length(Result) > 0) then
      Result := Result +',F'
    else
      Result := 'F';

  if (UsaPliques) then
    Result := QuotedListaString(Result, ',');
end;

function TCtrlFuncoesRH.GerarListaTipoPagSel(Mensalistas, Diaristas, Horistas: boolean;
  UsaPliques: boolean = false): string;
begin
  Result := '';
  if (Mensalistas) then
    Result := 'M';

  if (Diaristas) then
    if (length(Result) > 0) then
      Result := Result +',D'
    else
      Result := 'D';

  if (Horistas) then
    if (length(Result) > 0) then
      Result := Result +',H'
    else
      Result := 'H';

  if (UsaPliques) then
    Result := QuotedListaString(Result, ',');
end;

function TCtrlFuncoesRH.GerarListaEstadoCivilSel(Solteiro, Casado, Separado, SeparadoJud,
  Desquitado, Viuvo, Outro: boolean; UsaPliques: boolean = false): string;
begin
  Result := '';
  if (Solteiro) then
    Result := 'S';

  if (Casado) then
    if (Length(Result) > 0) then
      Result := Result +',C'
    else
      Result := 'C';

  if (Separado) then
    if (Length(Result) > 0) then
      Result := Result +',D'
    else
      Result := 'D';

  if (SeparadoJud) then
    if (Length(Result) > 0) then
      Result := Result +',J'
    else
      Result := 'J';

  if (Desquitado) then
    if (Length(Result) > 0) then
      Result := Result +',E'
    else
      Result := 'E';

  if (Viuvo) then
    if (Length(Result) > 0) then
      Result := Result +',V'
    else
      Result := 'V';

  if (Outro) then
    if (Length(Result) > 0) then
      Result := Result +',O'
    else
      Result := 'O';

  if (UsaPliques) then
    Result := QuotedListaString(Result, ',');
end;

// Exibe o Form de Associação/Visualização de Imagens manipulando a imagem indicada pelo
// campo especificado em CampoImagem de acordo com o campo chave da tabela Pai estecificado
// em CampoChavePai tendo como objeto de manipulação os dados armazenados em DataSet.
// O parâmetro Titulo irá mudar o título da Tela, HabilitarBtAssociar e HabilitarBtLimpar
// irão habilitar ou desabilitar os respectivos botões da Tela.
procedure TCtrlFuncoesRH.AssociarImagem(DataSet: TwwDataSource; CampoImagem: TBlobField;
  CampoChavePai: TFloatField; Titulo: string; HabilitarBtAssociar, HabilitarBtLimpar: boolean);
begin
  try
    with TfrmImagemDoc.Create(Application) do
    begin
      dsImagem := DataSet;
      Imagem := CampoImagem;
      CampoPai := CampoChavePai;

      Caption := Titulo;

      //*MnuDoArquivo_Padrao.Enabled := HabilitarBtAssociar;
      //*MnuDigitalizar_Padrao.Enabled := HabilitarBtAssociar;
      //*MnuLimparImagem_Padrao.Enabled := HabilitarBtLimpar;

      ShowModal;
      Free;
    end;
  except
  end;
end;

// Envia uma mensagem Padrão CM
function TCtrlFuncoesRH.EnviarMensagemCM(IdRemetente, IdDestinatario: integer;
  NomeRemetente, Assunto: string; TipoDestinatario: TTipoDestinatario; Mensagem: string): boolean;
var
  MsgCM: TMensagem;
begin
  MsgCM := TMensagem.Create(nil);
  try
    MsgCM.Nova;
    MsgCM.IdRemetente := IdRemetente;
    MsgCM.IdDestinatario := IdDestinatario;
    MsgCM.Assunto := Assunto;
    MsgCM.NomeRemetente := NomeRemetente;
    MsgCM.TipoDestinatario := TipoDestinatario;
    MsgCM.Mensagem := Mensagem;
    //*MsgCM.MostraMensagem := false;
    MsgCM.Envia;
    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  MsgCM.Free;
end;

// Insere os dados de Origem em Destino
function TCtrlFuncoesRH.AssociarDadosCds(Origem, Destino: TCMClientDataSet): boolean;
var
  c: integer;
begin
  try
    Destino.EmptyDataSet;
    Origem.First;
    while not(Origem.EOF) do
    begin
      Destino.Insert;
      for c:=0 to Origem.FieldCount-1 do
        Destino.Fields[c].Value := Origem.Fields[c].Value;
      Destino.Post;
      Origem.Next;
    end;
    Result := true;
  except
    Result := false;
  end;
end;

// Registrar a OCX do componente ChatFX
procedure TCtrlFuncoesRH.RegistrarCFX(LiberarCFX: boolean);
var
  hOCX: integer;
  pReg: procedure;
begin
  hOCX := LoadLibrary('CFX32.OCX');
  if (hOCX <> 0) then
  begin
    pReg := GetProcAddress(hOCX, 'DllRegisterServer');
    pReg; //Chama a função de registro
    if (LiberarCFX) then
      FreeLibrary(hOCX);
  end;
end;

// Retorna a quantidade de memória usada atualmente pelo programa
function TCtrlFuncoesRH.MemoryUsed: Integer;
var
  pmc: PROCESS_MEMORY_COUNTERS;
begin
  pmc.cb := sizeof(pmc);
  Result := 0;
  if GetProcessMemoryInfo(GetCurrentProcess, @pmc, sizeof(pmc)) then
    Result := pmc.WorkingSetSize;
end;

// Desenha uma linha em um Canvas especificado e nas coordenadas de tela x1,y1,x2,y2
procedure TCtrlFuncoesRH.DrawLine(Canvas: TCanvas; x1,y1,x2,y2: integer);
begin
  Canvas.MoveTo(x1,y1);
  Canvas.LineTo(x2,y2);
end;

// Repinta o Item "Index" de uma ListBox "lst"
procedure TCtrlFuncoesRH.InvalidateItemListBox(lst: TCustomListBox; Index: integer);
var
  Rect: TRect;
begin
  Rect := lst.ItemRect(Index);
  InvalidateRect(lst.Handle, @Rect, false);
end;

procedure TCtrlFuncoesRH.FreeObject(var Obj; NilObject: boolean);
var
  Temp: TObject;
begin
  Temp := TObject(Obj);
  if Assigned(Temp) then
  begin
    if (NilObject) then
      Pointer(Obj) := nil;

    Temp.Free;
  end;
end;

function TCtrlFuncoesRH.ListVariaveisEmBranco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS VAL01, 0 AS VAL02, 0 AS VAL03, 0 AS VAL04, 0 AS VAL05, 0 AS VAL06,' +CR_LF+
    '  0 AS VAL07, 0 AS VAL08, 0 AS VAL09, 0 AS VAL10, 0 AS VAL11, 0 AS VAL12' +CR_LF+
    'FROM' +CR_LF+
    '  PARAMRH' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
end;

procedure TCtrlFuncoesRH.GetSeparadorDecimalWindows;
var
  _Reg: TRegistry;
begin
  // Obter o separador decimal que está indicado no Registro Windows
  _Reg := TRegistry.Create;
  _Reg.RootKey := HKEY_CURRENT_USER;
  _Reg.OpenKey('Control Panel\International', true);
  if (_Reg.ValueExists('sDecimal')) then
  begin
    FSepDecWin := _Reg.ReadString('sDecimal')[1];
    _Reg.CloseKey;
  end
  else
    FSepDecWin := ','; // Caso não achar a entrada, o padrão será vírgula

  _Reg.Free;
end;

function TCtrlFuncoesRH.LerChaveRegistro(const NomeSistema, NomeChave: string): string;
var
  _Reg: TRegistry;
begin
  _Reg := TRegistry.Create;
  _Reg.RootKey := HKEY_CURRENT_USER;
  _Reg.OpenKey('\Software\CM\' + NomeSistema, true);
  if (_Reg.ValueExists(NomeChave)) then
  begin
    Result := _Reg.ReadString(NomeChave);
    _Reg.CloseKey;
  end
  else
    Result := '';

  _Reg.Free;
end;

procedure TCtrlFuncoesRH.GetSeparadorDecimalORACLE;
begin
  _Cds.Data := GetDataPacket(
    'SELECT VALUE' +CR_LF+
    'FROM   V$NLS_PARAMETERS' +CR_LF+
    'WHERE  (PARAMETER = ''NLS_NUMERIC_CHARACTERS'')');

  if (_Cds.FieldByName('VALUE').asString = '') then
    FSepDecORACLE := '.'
  else
    FSepDecORACLE := _Cds.FieldByName('VALUE').asString[1];
end;

function TCtrlFuncoesRH.SaveToFile(const NomeArquivo, Dados: string): boolean;
var
  Arq: TStringList;
begin
  Arq := TStringList.Create;
  try
    try
      Arq.Text := Dados;
      Arq.SaveToFile(NomeArquivo);
      Result := true;
    except
      Result := false;
    end;
  finally
    Arq.Free;
  end;
end;

function TCtrlFuncoesRH.GetFileDate(const NomeArquivo: string): TDate;
begin
  Result := FileDateToDateTime(FileAge(NomeArquivo));
end;

function TCtrlFuncoesRH.ProcurarPasta(var Pasta: string; Rotulo, Titulo: string): boolean;
begin
  with TsBrowseFolderDialog.Create(nil) do
  try
    Folder := foCustom;
    Directory := Pasta;
    Options := [bfStatusText];
    Caption := Rotulo;
    Title := Titulo;
    ShowPath := true;
    Result := Execute;
    if (Result) then
      Pasta := Directory;
  finally
    Free;
  end;
end;

procedure TCtrlFuncoesRH.HabilitarFilhos(Pai: TWinControl; const Opcao: boolean);
var
  c: integer;
begin
  if (Pai.ControlCount > 0) then
    for c:=0 to Pai.ControlCount-1 do
    begin
      Pai.Controls[c].Enabled := Opcao;
      if (Pai.Controls[c].InheritsFrom(TWinControl)) then
        if (TWinControl(Pai.Controls[c]).ControlCount > 0) then
          HabilitarFilhos(TWinControl(Pai.Controls[c]), Opcao);
    end;
end;

function TCtrlFuncoesRH.VersaoPadrao(const NomeDPL, VersaoDPL: TStringList): string;
var
  iPos: integer;
begin
  iPos := NomeDPL.IndexOf(('Componentes CM'));
  if (iPos = -1) then
    Result := ''
  else  
    Result := VersaoDPL[iPos];
end;

initialization
  WM_INI_LOG_MONITOR := RegisterWindowMessage('WM_INI_LOG_MONITOR');
  WM_ADD_LOG_MONITOR := RegisterWindowMessage('WM_ADD_LOG_MONITOR');
end.



