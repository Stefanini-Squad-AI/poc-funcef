{-----------------------------------------------------------------------------------------------------------------------------------
Data      : 13/02/2016
Autor     : Darivaldo Alencar
SIG       : 29271
Descrição : Criação desta Ctrl
-----------------------------------------------------------------------------------------------------------------------------------}
unit uCtrlFuncoesCapCar;

interface

uses SysUtils, Classes, Controls, StdCtrls, WinTypes, Dialogs, Buttons, Forms, CheckLst,
  Graphics, Db, Wwdatsrc, fImagemDoc, CorreioCM, uCMTypes, IvDictio, BrowseFolder,fsm_fxlib, 
  uCMClientDataSet, uCmControlObject, ucmfileutils, jclfileutils;

const
  CR = #13;
  LF = #10;
  CR_LF = CR+LF;
  CL_AMARELO_CLARO = $00C0FFFF;
  


  MSG_ERRO = CR_LF+ 'Erro:' +CR_LF;

  MesLongo: array[1..12] of string[9] = (
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto',
    'Setembro', 'Outubro', 'Novembro', 'Dezembro');

  MesCurto: array[1..12] of string[3] = (
    'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez');

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
  SISTJURCONS = 719;

  // Código dos Clientes
  SERPROS = 1;
  REFER = 2;
  FUNCEF = 3;
  FCRT = 4;
  CTRQ = 5;
  CLIENTE_PADRAO = 99;

  CODCENTRORESPON_PADRAO = '9999999999';

  // Utilizadas nos métodos que necessitam dizer qual operação será feita aos Dados
  INSERIR = 0;
  ALTERAR = 1;
  EXCLUIR = 2;

  DefaultTrueBoolStr = 'True';   // DO NOT LOCALIZE
  DefaultFalseBoolStr = 'False'; // DO NOT LOCALIZE

type
  TOnProc = procedure of object;

  
  TOperacaoDataSet = (toInserir, toAlterar, toExcluir);
  TTipoProcura = (tpEmpregado, tpCandidato);

  TDiaMes  = array[1..12] of integer;
  TDiaData = array[1..12] of word;

  TComparar = record
    Pos: LongInt;
    Achou: boolean;
  end;

 THora = record
    HoraInicial, HoraAtual: integer;
    Hora, Minuto, Segundo, MicroSegundo: word;
    end;

  TCtrlFuncoesCapCar = class(TCmControlObject)

  private
    FSepDecWin: char;
    FSepDecORACLE: char;
    FDirTemp: string;
    FDirTempLog: string;
    FArqConfig: string;

   public
    constructor Create; override;

    function  GetNomeArqConfig: string;
    function  GetDirArqConfig: string;

    function IntervaloMeses(DataIni, DataFin: string): Integer;
    function IntervaloMesesComerciais(DataIni, DataFin: string): Integer;
    function TotDiasNoAno(Mes, Ano: integer): LongInt;
    function AnoBi(DataMenor, DataMaior: string): real;
    function CalculaData(DataIni, DataFin: string; var NumDias, NumMeses, NumAnos: LongInt): boolean;
    function CalculaDifData(DataIni, DataFin: string; var NumDias, NumMeses, NumAnos: integer): boolean;
    function ColocaBarra(Data: string): string;
    function TiraBarra(Data: string): string;
    function IncData(Data: string; Dias, Meses, Anos: integer): string;
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
    function ContaCaracter(Texto: string; Ch: char): Integer;
    function TrocaCaracter(const Texto, De, Para: string): string;
    function Replicate(Texto: string; NumVezes: integer): string;
    function LeftPad(Texto: string; NumVezes: integer): string;
    function RightPad(Texto: string; NumVezes: integer): string;
    function Alinha(Texto: string; Tamanho: word; Tipo, Preenchedor: char): string;
    function TiraCarRepetidos(St: string; MaxRep: byte): string;
    function JuroComposto(Valor: real; NumMeses: Integer; TaxaJuros: real): real;
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
    function IFF(Condicao: boolean; Primeiro, Segundo: integer): integer; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo: string): string; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo: double): double; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo: byte): byte; overload;
    function IFF(Condicao: boolean; Primeiro, Segundo:smallint): smallint; overload;
    function TimeToMiliseg(Hora: TTime): Int64;
    function TempoDecorrido(MiliSeg: integer): string;
    function HoraPorExtenso(Hora: TTime): string;
    function TempoDecorridoHMS(MiliSeg: integer; ImprimeMili: boolean): string;
    function ProcuraStList(Lst: TStrings; St: string): integer;
    function StringEm(Comparador: string; Arr: array of string): integer;
    function Comparar(Comparador: integer; Arr: array of integer): TComparar;
    function VerificaCodigoEm(St, Comparado: string; Separador: char): integer;
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
    procedure HabilitarFilhos(Pai: TWinControl; const Opcao: boolean);

    procedure DrawLine(Canvas: TCanvas; x1,y1,x2,y2: integer);
    procedure InvalidateItemListBox(lst: TCustomListBox; Index: integer);
    procedure FreeObject(var Obj; NilObject: boolean = false);
    procedure GetSeparadorDecimalWindows;
    procedure GetSeparadorDecimalORACLE;

    function  SaveToFile(NomeArquivo, Dados: string): boolean;
    function  GetFileDate(const NomeArquivo: string): TDate;
    function  ProcurarPasta(var Pasta: string; Rotulo, Titulo: string): boolean;
    function  CMTranslateMsg(const sMsg: String; sParams: Array of String): String;
    function  CMTranslate(s: String): String;
    function IncData2(const Data: TDate; const Dias, Meses, Anos: integer): TDate;
    function  LerChaveRegistro(const NomeSistema, NomeChave: string): string;
    function BoolToStr(B: Boolean; UseBoolStrs: Boolean = False): string;
    function StrToBool(const S: string): Boolean;
    function TryStrToBool(const S: string; out Value: Boolean): Boolean;
    function TryStrToFloat(const S: string; out Value: Extended): Boolean; overload;  

    function  VersaoPadrao(const NomeDPL, VersaoDPL: TStringList): string;
    function MontaSelSQL(SQL, Valores: string; QuantEspacosAntes, QuantEspacosDepois: word;
      UsaAND: boolean = true): string;

    property  SepDecWin: char read FSepDecWin;
    property  SepDecORACLE: char read FSepDecORACLE write FSepDecORACLE;
    property  DirTemp: string read FDirTemp;
    property  DirTempLog: string read FDirTempLog;
    property  ArqConfig: string read FArqConfig;
  end;

var
  FU: TCtrlFuncoesCapCar;
  //: string;
  //MesLongo, MesCurto: array[1..12] of string;
  WM_INI_LOG_MONITOR: DWORD; // Mensagem de inicialização do LOG
  WM_ADD_LOG_MONITOR: DWORD; // Mensagem de adição de uma linha ao LOG
  

  TrueBoolStrs: array of String;
  FalseBoolStrs: array of String;


implementation

uses Math, Registry;

// ****************************************************************************************
// Implementação das funções para tratamento de datas
// ****************************************************************************************
// ----------------------------------------------------------------------------------------
// Descrição:
// * Retorna um intervalo entre duas datas informadas em meses
// Entrada:
// * DataIni -> Data inicial (no formato DD/MM/YYYY)
// * DataFin -> Data Final   (no formato DD/MM/YYYY)
// Saída:
// * O intervalo entre as datas em meses
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesCapCar.IntervaloMeses(DataIni, DataFin: string): Integer;
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
      Dec(wAux);
  finally
    Result := wAux;
  end;
end;

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
function TCtrlFuncoesCapCar.IntervaloMesesComerciais(DataIni, DataFin: string): Integer;
var
  wDiaIni, wMesIni, wAnoIni, wDiaFin, wMesFin, wAnoFin: word;
  wAux: integer;
begin
  wAux := 0;
  try
    DecodeDate(StrToDate(DataIni), wAnoIni, wMesIni, wDiaIni);
    DecodeDate(StrToDate(DataFin), wAnoFin, wMesFin, wDiaFin);

    wAux := (wAnoFin*12+wMesFin) - (wAnoIni*12+wMesIni);

    if (StrToDate(DataIni) <= StrToDate(DataFin)) then
      if (wDiaIni > wDiaFin) then
      begin
        Dec(wAux);
        if (wMesIni <> wMesFin) and (wDiaFin = TrazUltDiaMes(wMesFin, wAnoFin)) then
          Inc(wAux);
      end;

    if (StrToDate(DataIni) > StrToDate(DataFin)) then
      if (wDiaIni < wDiaFin) then
      begin
        Inc(wAux);
        if (wMesIni <> wMesFin) and (wDiaFin = TrazUltDiaMes(wMesFin, wAnoFin)) then
          Dec(wAux);
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
function TCtrlFuncoesCapCar.TotDiasNoAno(Mes, Ano: integer): LongInt;
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
function TCtrlFuncoesCapCar.AnoBi(DataMenor, DataMaior: string): real;
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
function TCtrlFuncoesCapCar.CalculaData(DataIni, DataFin: string; var NumDias, NumMeses,
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
function TCtrlFuncoesCapCar.CalculaDifData(DataIni, DataFin: string; var NumDias, NumMeses,
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
function TCtrlFuncoesCapCar.ColocaBarra(Data: string): string;
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
function TCtrlFuncoesCapCar.TiraBarra(Data: string): string;
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
function TCtrlFuncoesCapCar.IncData(Data: string; Dias, Meses, Anos: integer): string;
var
  Posic: byte;
  iDia, iMes, iAno, c: integer;
begin
  try
    iDia := ExtraiDia(StrToDate(Data));
    iMes := ExtraiMes(StrToDate(Data));
    iAno := ExtraiAno(StrToDate(Data));

    Posic := Pos('/',Data);
    if (Posic > 0) then
      Data := TiraBarra(Data);

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
// Descrição:
// * Verifica se é Ano Bissexto
// Entrada:
// * Anos -> O ano a comparar
// Saída:
// * Se o ano é bissexto ou não
// ----------------------------------------------------------------------------------------
function TCtrlFuncoesCapCar.AnoBissexto(Ano: integer): boolean;
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
function TCtrlFuncoesCapCar.TrazUltDiaMes(Mes, Ano: integer): integer;
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
function TCtrlFuncoesCapCar.TrazUltDiaData(Data: TDateTime): TDateTime;
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
function TCtrlFuncoesCapCar.RetornaAnoMes(Data: TDateTime): string;
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
function TCtrlFuncoesCapCar.AnoMes(Data: TDateTime): string;
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
function TCtrlFuncoesCapCar.RetornaDataAMD(Data: TDateTime; Barra: boolean): string;
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
function TCtrlFuncoesCapCar.IncDataAM(Data: string; Meses: integer): string;
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
function TCtrlFuncoesCapCar.RetornaMes(Mes: string): string;
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

// Retorna o mes e o ano de uma data informada (POR EXTENSO)
function TCtrlFuncoesCapCar.MesExtensoAno(AnoBarraMes: string): string;
begin
  if (AnoBarraMes <> '') then
    Result := MesLongo[StrToIntDef(Copy(AnoBarraMes,6,2),1)] +Translate(' de ')+
      Copy(AnoBarraMes,1,4)
  else
    Result := '';
end;

//--------------------------------------------------------------------------------------------------
// Descrição:
// * Retorna o Dia de uma determinada data
// Entrada:
// * Data -> Data cujo dia se deseja saber
//--------------------------------------------------------------------------------------------------
function TCtrlFuncoesCapCar.ExtraiDia(Data: TDate): word;
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
function TCtrlFuncoesCapCar.ExtraiMes(Data: TDate): word;
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
function TCtrlFuncoesCapCar.ExtraiAno(Data: TDate): word;
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
function TCtrlFuncoesCapCar.ProxMes(DataIni: TDateTime): TDateTime;
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

// Retorna a diferença entre as datas no formato AAAA/MM em meses
function TCtrlFuncoesCapCar.DifDataAnoMes(AnoMes1, AnoMes2: string): integer;
var
  dtAux1, dtAux2: integer;
begin
  dtAux1 := (StrToInt(Copy(AnoMes1,1,4))*12) + StrToInt(Copy(AnoMes1,6,2));
  dtAux2 := (StrToInt(Copy(AnoMes2,1,4))*12) + StrToInt(Copy(AnoMes2,6,2));
  Result := (dtAux1 - dtAux2);
end;

// Pegar os últimos NUM caracteres de uma string ST
function TCtrlFuncoesCapCar.UltimosCaracteres(St: string; Num: word): string;
begin
  Result := Copy(St, Length(St) - Num + 1, Num);
end;

// Retira os espaços em demasia de ST. EX: '  Jesus    Cristo' -> 'Jesus Cristo'.
function TCtrlFuncoesCapCar.NormalizaString(St: string): string;
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
function TCtrlFuncoesCapCar.AbreviaNome(Max: word; Nome: string): string;
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
function TCtrlFuncoesCapCar.ConverteCar(St: string): string;
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
function TCtrlFuncoesCapCar.PoeZero(Num: byte): string;
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
function TCtrlFuncoesCapCar.TiraCaracter(Texto: string; Ch: char): string;
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

// Retorna a quantidade de caracteres CH na string TEXTO
function TCtrlFuncoesCapCar.ContaCaracter(Texto: string; Ch: char): integer;
var
  c: integer;
begin
  Result := 0;
  for c:=1 to Length(Texto) do
    if (Texto[c] = Ch) then
      Inc(Result);
end;

// Troca a String DE da string TEXTO para PARA
function TCtrlFuncoesCapCar.TrocaCaracter(const Texto, De, Para: string): string;
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
function TCtrlFuncoesCapCar.Replicate(Texto: string; NumVezes: integer): string;
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
function TCtrlFuncoesCapCar.LeftPad(Texto: string; NumVezes: integer): string;
begin
  Result := Copy(Texto, 1, NumVezes);
  if (Length(Result) < NumVezes) then
    Result := Result + Replicate(' ', NumVezes - Length(Result));
end;

// Retorna a string ATEXTO alinhada a direita com NUMVEZES espaços em branco a sua esquerda
function TCtrlFuncoesCapCar.RightPad(Texto: string; NumVezes: integer): string;
begin
  Result := Copy(Texto, 1, NumVezes);
  if (Length(Result) < NumVezes) then
    Result := Replicate(' ', NumVezes - Length(Result)) + Result;
end;

// Alinha a string TEXTO na direção TIPO, preenchendo com WTAMANHO caracteres PREENCHEDOR
function TCtrlFuncoesCapCar.Alinha(Texto: string; Tamanho: word; Tipo, Preenchedor: char): string;
var
  sEspaco: string;
begin
  Result := '';
  Tipo := UpCase(Tipo);

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
    'D' : Result := sEspaco + Texto; // Direita
    'E' : Result := Texto + sEspaco; // Esquerda
  end;
end;

// Retira MAXREP número de caracteres repetidos consecutivamente da string ST
function TCtrlFuncoesCapCar.TiraCarRepetidos(St: string; MaxRep: byte): string;
var
  sAux: string;
  bNumRep, c: byte;
  cCar: char;
begin
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
    end;

    if (c <= length(st)) then
    begin
      sAux := sAux+st[c];
      cCar := st[c];
    end;
    bNumRep := 1;
    Inc(c);
  until (c >= length(st)+1);
  Result := sAux;
end;

procedure TCtrlFuncoesCapCar.ExtraiString(var Str, StrAtual: string; Separador: string);
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

function TCtrlFuncoesCapCar.GetPosString(Str, Comparado, Separador: string): integer;
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
function TCtrlFuncoesCapCar.JuroComposto(Valor: real; NumMeses: integer; TaxaJuros: real): real;
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
procedure TCtrlFuncoesCapCar.VerificaOpcoes(CheckList: TCheckListBox; const Lista: TStringList;
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

function TCtrlFuncoesCapCar.CriaListaOpcoes(const CheckList: TCheckListBox;
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
function TCtrlFuncoesCapCar.ValidaCaracteres(Dado: string; Tipo: char; Opcoes: string): string;
var
  c: word;
  sTemp: string;
  TempOpcoes: set of char;
begin
  // Faz Validação básica para a utilização da Função
  if not(Tipo in ['A','N']) and (Opcoes = '') then
  begin
    MessageInfo := 'Erro na Função ValidaCaracteres.' +CR_LF+
      'Não foi indicado o tipo do dados ou o mesmo não é válido.';
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

function TCtrlFuncoesCapCar.ExisteCodigo(Lista: TStringList; ValorBusca: string): integer;
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
function TCtrlFuncoesCapCar.NumCaracteres(Ch: char; St: string): word;
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
function TCtrlFuncoesCapCar.fValidaDados(Tipo: char; Dado: string; Tamanho: word): string;
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
function TCtrlFuncoesCapCar.PosicaoCar(Ch: char; St: string; Posicao: word): word;
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

function TCtrlFuncoesCapCar.MontaLinhaSelSQL(SQL, Valor: string; TamanhoEspaco: word; UsaAND: boolean): string;
begin
  if (Pos(',',Valor) > 0) then
    Result := SQL + Replicate(' ',TamanhoEspaco) + 'IN (' + Valor+ '))'
  else
    Result := SQL + Replicate(' ',TamanhoEspaco) + ' = ' + Valor+ ')';

  if (UsaAND) then
    Result := Result + ' AND';
end;

function TCtrlFuncoesCapCar.QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string;
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
function TCtrlFuncoesCapCar.QuotedListaString(const Lista: string; const Separador: char;
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
function TCtrlFuncoesCapCar.OraNumero(Numero: string): string;
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
function TCtrlFuncoesCapCar.ClienteNumero(Numero: string): string;
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
function TCtrlFuncoesCapCar.StrInt(St: string): LongInt;
begin
  try
    Result := StrToInt(St);
  except
    Result := 0;
  end;
end;

// Transforma String em Real retornando Zero se a string não for o um Real válido
function TCtrlFuncoesCapCar.StrFloat(St: string): double;
begin
  try
    Result := StrToFloat(St);
  except
    Result := 0;
  end;
end;

function TCtrlFuncoesCapCar.StrDate(St: string): TDate;
begin
  try
    Result := StrToDate(St);
  except
    Result := 0;
  end;
end;

// Transfoma um Real em String
function TCtrlFuncoesCapCar.Float2String(Valor: double): string;
var
  cAuxSeparator: char;
begin
  cAuxSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  Result := FormatFloat('#0.00', Valor);
  DecimalSeparator := cAuxSeparator;
end;

// Transfoma uma String em Real independente do "DecimalSeparator"
function TCtrlFuncoesCapCar.StringToFloat(Str: string): double;
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
function TCtrlFuncoesCapCar.String2Float(Str: string): double;
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
function TCtrlFuncoesCapCar.ValStr(Valor: double; Casas, Decimais: integer;
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

function TCtrlFuncoesCapCar.FloatWinToFloatDelphi(Str: string): double;
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

function TCtrlFuncoesCapCar.Truncar(Valor: double; Casas: integer): double;
var
  dFator: double;
begin
  dFator := IntPower(10, Casas);
  Result := Trunc(Valor * dFator) / dFator;
end;

function TCtrlFuncoesCapCar.Arredondar(Valor: double; Casas: integer): double;
var
  dFator: double;
begin
  dFator := IntPower(10, Casas);
  Result := Round(Valor * dFator) / dFator;
end;

function TCtrlFuncoesCapCar.RestoDivisao(Dividendo, Divisor: double): double;
begin
  Result := Dividendo - (Trunc(Dividendo / Divisor) * Divisor);
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function TCtrlFuncoesCapCar.IFF(Condicao: boolean; Primeiro, Segundo: string): string;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function TCtrlFuncoesCapCar.IFF(Condicao: boolean; Primeiro, Segundo: integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

// Realiza uma instrução de condição simples (COMPO UM "IF" EM UMA LINHA)
function TCtrlFuncoesCapCar.IFF(Condicao: boolean; Primeiro, Segundo: double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;



function TCtrlFuncoesCapCar.IFF(Condicao: boolean; Primeiro, Segundo: byte): byte;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;
function TCtrlFuncoesCapCar.IFF(Condicao: boolean; Primeiro, Segundo: smallint): smallint;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TCtrlFuncoesCapCar.TimeToMiliseg(Hora: TTime): Int64;
var
  wHora, wMin, wSeg, wMSeg: word;
begin
  DecodeTime(Hora, wHora, wMin, wSeg, wMSeg);
  Result := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
end;

// Retorna uma string contendo o espaço de tempo decorrido em HORAS, MINUTOS, SEGUNDOS, MILISEGUNDOS
function TCtrlFuncoesCapCar.TempoDecorrido(MiliSeg: integer): string;
begin
  Result := '';
  if ((MiliSeg div 3600000) > 0) then
  begin
    Result := IntToStr(MiliSeg div 3600000) + ' Hora(s),';
    MiliSeg := MiliSeg mod 3600000;
  end;

  if ((MiliSeg div 60000) > 0) then
  begin
    Result := Result + IntToStr(MiliSeg div 60000) + ' Minuto(s),';
    MiliSeg := MiliSeg mod 60000;
  end;

  if ((MiliSeg div 1000) > 0) then
  begin
    Result := Result + IntToStr(MiliSeg div 1000) + ' Segundos(s),';
    MiliSeg := MiliSeg mod 1000;
  end;

  Result := Result + IntToStr(MiliSeg) + ' Milisegundo(s)';
end;

function TCtrlFuncoesCapCar.HoraPorExtenso(Hora: TTime): string;
var
  sHora: string;
  iHora, iMin, iSeg: byte;
begin
  Result := '';
  sHora := FormatDateTime('hh:nn:ss', Hora);

  iHora := StrToInt(Copy(sHora, 1, 2));
  if (iHora = 1) then
    Result := IntToStr(iHora) + Translate(' Hora')
  else
  if (iHora > 1) then
    Result := IntToStr(iHora) + Translate(' Horas');

  iMin := StrToInt(Copy(sHora, 4, 2));
  if (iMin = 1) then
    Result := IntToStr(iMin) + Translate(' Minuto')
  else
  if (iMin > 1) then
    Result := IntToStr(iMin) + Translate(' Minutos');

  iSeg := StrToInt(Copy(sHora, 7, 2));
  if (iSeg = 1) then
    Result := IntToStr(iSeg) + Translate(' Segundo')
  else
  if (iSeg > 1) then
    Result := IntToStr(iSeg) + Translate(' Segundos');
end;

// Retorna uma string contendo o espaço de tempo decorrido no formato HH:MM:SS
function TCtrlFuncoesCapCar.TempoDecorridoHMS(MiliSeg: integer; ImprimeMili: boolean): string;
begin
  Result := '';
  if ((MiliSeg div 3600000) > 0) then // Horas
  begin
    Result := PoeZero(MiliSeg div 3600000) + ':';
    MiliSeg := (MiliSeg mod 3600000);
  end
  else
    Result := '00:';

  if ((MiliSeg div 60000) > 0) then // Minutos
  begin
    Result := Result + PoeZero(MiliSeg div 60000) + ':';
    MiliSeg := (MiliSeg mod 60000);
  end
  else
    Result := Result + '00:';

  if ((MiliSeg div 1000) > 0) then // Segundos
  begin
    Result := Result + PoeZero(MiliSeg div 1000);
    MiliSeg := (MiliSeg mod 1000);
  end
  else
    Result := Result + '00';

  if (ImprimeMili) then // Milisegundos
    Result := Result +':'+ IntToStr(MiliSeg);
end;

function TCtrlFuncoesCapCar.ProcuraStList(Lst: TStrings; St: string): integer;
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
function TCtrlFuncoesCapCar.StringEm(Comparador: string; Arr: array of string): integer;
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
function TCtrlFuncoesCapCar.Comparar(Comparador: integer; Arr: array of integer): TComparar;
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
function TCtrlFuncoesCapCar.VerificaCodigoEm(St, Comparado: string; Separador: char): integer;
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

procedure TCtrlFuncoesCapCar.InserirCodigoEm(var St: string; const Codigo: string);
begin
  if (St = '') and (Codigo <> '') then
    St := Codigo
  else
  if (St <> '') and (Codigo <> '') then
    St := St +','+ Codigo;
end;

// Retorna uma string com a lista de Tipos de Contrato selecionados
function TCtrlFuncoesCapCar.GerarListaTipoContratoSel(Efetivos, Especiais, Temporarios,
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
function TCtrlFuncoesCapCar.GerarListaSitFuncSel(Ativos, Afastados, Demitidos,
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
function TCtrlFuncoesCapCar.GerarListaSexoSel(Masculino, Feminino, UsaPliques: boolean): string;
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

function TCtrlFuncoesCapCar.GerarListaTipoPagSel(Mensalistas, Diaristas, Horistas: boolean;
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

function TCtrlFuncoesCapCar.GerarListaEstadoCivilSel(Solteiro, Casado, Separado, SeparadoJud,
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
procedure TCtrlFuncoesCapCar.AssociarImagem(DataSet: TwwDataSource; CampoImagem: TBlobField;
  CampoChavePai: TFloatField; Titulo: string; HabilitarBtAssociar, HabilitarBtLimpar: boolean);
begin
  try
    with TfrmImagemDoc.Create(Application) do
    begin
      dsImagem := DataSet;
      Imagem := CampoImagem;
      CampoPai := CampoChavePai;

      Caption := Titulo;
      bbtnAssociar.Enabled := HabilitarBtAssociar;
      bbtnLimpar.Enabled := HabilitarBtLimpar;
      ShowModal;
      Free;
    end;
  except
  end;
end;

// Envia uma mensagem Padrão CM
function TCtrlFuncoesCapCar.EnviarMensagemCM(IdRemetente, IdDestinatario: integer;
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
    MsgCM.Envia;
    Result := true;
  except
    Result := false;
  end;
  MsgCM.Free;
end;

// Insere os dados de Origem em Destino
function TCtrlFuncoesCapCar.AssociarDadosCds(Origem, Destino: TCMClientDataSet): boolean;
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
procedure TCtrlFuncoesCapCar.RegistrarCFX(LiberarCFX: boolean);
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

// Desenha uma linha em um Canvas especificado e nas coordenadas de tela x1,y1,x2,y2
procedure TCtrlFuncoesCapCar.DrawLine(Canvas: TCanvas; x1,y1,x2,y2: integer);
begin
  Canvas.MoveTo(x1,y1);
  Canvas.LineTo(x2,y2);
end;

// Repinta o Item "Index" de uma ListBox "lst"
procedure TCtrlFuncoesCapCar.InvalidateItemListBox(lst: TCustomListBox; Index: integer);
var
  Rect: TRect;
begin
  Rect := lst.ItemRect(Index);
  InvalidateRect(lst.Handle, @Rect, false);
end;

procedure TCtrlFuncoesCapCar.FreeObject(var Obj; NilObject: boolean);
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

procedure TCtrlFuncoesCapCar.GetSeparadorDecimalWindows;
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

procedure TCtrlFuncoesCapCar.GetSeparadorDecimalORACLE;
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

function TCtrlFuncoesCapCar.SaveToFile(NomeArquivo, Dados: string): boolean;
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

function TCtrlFuncoesCapCar.GetFileDate(const NomeArquivo: string): TDate;
begin
  Result := FileDateToDateTime(FileAge(NomeArquivo));
end;

function TCtrlFuncoesCapCar.ProcurarPasta(var Pasta: string; Rotulo, Titulo: string): boolean;
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

function TCtrlFuncoesCapCar.CMTranslateMsg(const sMsg: String; sParams: Array of String): String;
Var
  X: Integer;
  iTam: Integer;
  sFraseTraduzida: String;
begin
  sFraseTraduzida := sMsg;
  iTam := High(sParams);

  For X:=0 to iTam do
    sFraseTraduzida := StringReplace(sFraseTraduzida, ':' + IntToStr(X+1), sParams[x], []);

  result := sFraseTraduzida;
end;

function TCtrlFuncoesCapCar.CMTranslate(s: String): String;
begin
  Result := s;
end;


function TCtrlFuncoesCapCar.IncData2(const Data: TDate; const Dias, Meses, Anos: integer): TDate;
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

function TCtrlFuncoesCapCar.LerChaveRegistro(const NomeSistema, NomeChave: string): string;
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



function TCtrlFuncoesCapCar.VersaoPadrao(const NomeDPL, VersaoDPL: TStringList): string;
var
  iPos: integer;
begin
  iPos := NomeDPL.IndexOf(('Componentes CM'));
  if (iPos = -1) then
    Result := ''
  else  
    Result := VersaoDPL[iPos];
end;
procedure TCtrlFuncoesCapCar.HabilitarFilhos(Pai: TWinControl; const Opcao: boolean);
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


function TCtrlFuncoesCapCar.MontaSelSQL(SQL, Valores: string; QuantEspacosAntes,
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

procedure VerifyBoolStrArray;
begin
  if Length(TrueBoolStrs) = 0 then
  begin
    SetLength(TrueBoolStrs, 1);
    TrueBoolStrs[0] := DefaultTrueBoolStr;
  end;
  if Length(FalseBoolStrs) = 0 then
  begin
    SetLength(FalseBoolStrs, 1);
    FalseBoolStrs[0] := DefaultFalseBoolStr;
  end;
end;

function TCtrlFuncoesCapCar.BoolToStr(B: Boolean; UseBoolStrs: Boolean = False): string;
const
  cSimpleBoolStrs: array [boolean] of String = ('0', '-1');
begin
  if UseBoolStrs then
  begin
    VerifyBoolStrArray;
    if B then
      Result := TrueBoolStrs[0]
    else
      Result := FalseBoolStrs[0];
  end
  else
    Result := cSimpleBoolStrs[B];
end;

type
  PStrData = ^TStrData;
  TStrData = record
    Ident: Integer;
    Str: string;
  end;

  function TCtrlFuncoesCapCar.StrToBool(const S: string): Boolean;
begin
  if not TryStrToBool(S, Result) then
   //* ConvertErrorFmt(@SInvalidBoolean, [S]);
end;

function TCtrlFuncoesCapCar.TryStrToBool(const S: string; out Value: Boolean): Boolean;
  function CompareWith(const aArray: array of string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(aArray) to High(aArray) do
      if AnsiSameText(S, aArray[I]) then
      begin
        Result := True;
        Break;
      end;
  end;
var
  LResult: Extended;
begin
  Result := TryStrToFloat(S, LResult);
  if Result then
    Value := LResult <> 0
  else
  begin
    VerifyBoolStrArray;
    Result := CompareWith(TrueBoolStrs);
    if Result then
      Value := True
    else
    begin
      Result := CompareWith(FalseBoolStrs);
      if Result then
        Value := False;
    end;
  end;
end;
function TCtrlFuncoesCapCar.TryStrToFloat(const S: string; out Value: Extended): Boolean;
begin
  Result := TextToFloat(PChar(S), Value, fvExtended);
end;


function TCtrlFuncoesCapCar.GetNomeArqConfig: string;
begin
  Result := ExtractFileName(FArqConfig);
end;

function TCtrlFuncoesCapCar.GetDirArqConfig: string;
begin
  Result := ExtractFilePath(FArqConfig);
end;

constructor TCtrlFuncoesCapCar.Create;
begin
  inherited;

end;

end.

