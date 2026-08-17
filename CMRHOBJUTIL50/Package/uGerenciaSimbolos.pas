unit uGerenciaSimbolos;

interface

uses
  Windows, Messages, SysUtils,  Classes;

type
  TSimbolo = record
    PosIni: integer;
    PosFin: integer;
    Nome: string;
  end;

  TGerenciaSimbolos = class
  private
    FSimbolo: TSimbolo;
    FExpressao: string;
    FTextoOriginal: string;
    FTexto: string;
    FExprIni: string;
    FExprFin: string;
    FPosCuringa: integer;
    FPosInicial: integer;

    procedure SetTexto(Valor: string);
    procedure SetSimbolo(const PosIni, PosFin: integer; const Nome: string);
    procedure SetSimboloAtual;
    procedure SetExprIni;
    procedure SetExprFin;

    function PosInRange(const ATexto, Procura: string; const Ini, Fin: integer): integer;
  public
    function Iniciar(const Expressao, ATexto: string): boolean;
    function GetSimboloAtual: TSimbolo;
    function GetProximoSimbolo: TSimbolo;
    function SubstituirSimbolos(const ValorSimbolo: string; const NomeSimbolo: string = ''): boolean;
    function StuffString(const AText: string; AStart, ALength: Cardinal;
                const ASubText: string): string;
    property Simbolo: TSimbolo read FSimbolo;
    property Expressao: string read FExpressao write FExpressao;
    property Texto: string read FTexto write SetTexto;
    property TextoOriginal: string read FTextoOriginal;
  end;

implementation

uses uCtrlFuncoesRH;

{ TGerenciaSimbolos }

// Copiar o texto informado pelo usuário da classe para as variáveis internas da mesma.
procedure TGerenciaSimbolos.SetTexto(Valor: string);
begin
  FTexto := Valor;
  FTextoOriginal := Valor;
end;

// Atribuir de uma vez só, todos os valores do símbolo atual.
procedure TGerenciaSimbolos.SetSimbolo(const PosIni, PosFin: integer; const Nome: string);
begin
  FSimbolo.PosIni := PosIni;
  FSimbolo.PosFin := PosFin;
  FSimbolo.Nome := Nome;
end;

// Retornar a posição de uma String "Procura" na String "ATexto" a partir
// do ponto "Ini" até "Fin".
function TGerenciaSimbolos.PosInRange(const ATexto, Procura: string;
  const Ini, Fin: integer): integer;
begin
  Result := Pos(Procura, Copy(ATexto, Ini, Fin-Ini+1));
  if (Result > 0) then
    Result := Result + Ini - 1;
end;

// Encontrar a String inicial da expressão a ser usada na procura do símbolo.
procedure TGerenciaSimbolos.SetExprIni;
begin
  FExprIni := Copy(FExpressao, 1, FPosCuringa-1);
end;

// Encontrar a String final da expressão a ser usada na procura do símbolo.
procedure TGerenciaSimbolos.SetExprFin;
begin
  FExprFin := Copy(FExpressao, FPosCuringa+1, Length(FExpressao)-FPosCuringa);
end;

// Método interno da classe.
// Retornar em FSimbolo o símbolo atual a partir do ponto de partida indicado pela
// variável FPosInicial.
procedure TGerenciaSimbolos.SetSimboloAtual;
var
  iPosIni, iPosIni2, iPosFin: integer;
begin
  SetSimbolo(0, 0, '');
  iPosIni := FPosInicial;
  iPosFin := Length(FTexto);
  SetExprIni;
  SetExprFin;
  repeat
    // Encontra a posição da primeira ocorrência da String Delimitadora Inicial.
    // Se esta não for encontrada, sair da função para que o retorno seja um símbolo vazio.
    // Se esta for encontrada, incrementa a esta posição o tamanho da String Delimitadora
    // Inicial para que o símbolo retornado contenha apenas o valor.
    iPosIni := PosInRange(FTexto, FExprIni, iPosIni, iPosFin);
    if (iPosIni = 0) then
      break
    else
      Inc(iPosIni, Length(FExprIni));

    // Encontra a posição da primeira ocorrência da String Delimitadora Final.
    // Se esta não for encontrada, sair da função para que o retorno seja um síbolo vazio.
    // Se esta for encontrada, incrementa a esta posição o tamanho da String Delimitadora
    // Final para que o símbolo retornado contenha este delimitador (para efeitos de busca
    // interna desta função). Ao retornar o símbolo, esta String será retirada.
    iPosFin := PosInRange(FTexto, FExprFin, iPosIni, iPosFin);
    if (iPosFin > 0) then
      Inc(iPosFin, Length(FExprFin)-1);

    // Encontra a posição da segunda ocorrência da String Delimitadora Inicial.
    // Caso esta exista e seja menor do que a posição da String Delimitadora Final,
    // indicar o início a partir deste ponto.
    // Isto foi feito a fim de solucionar o problema de sintaxe abaixo:
    // Delimitador Inicial = <
    // Delimitador Final   = >
    // Texto               = este <símbolo não deve ser reconhecido, mas <este> deve.
    //  1º Delimitador Inicial ---|            2º Delimitador Inicial ---|    |
    //                                                1º Delimitador Final ---|
    // somente o segundo símbolo é reconhecido.
    iPosIni2 := PosInRange(FTexto, FExprIni, iPosIni, iPosFin);
    if (iPosIni2 > 0) and (iPosIni2 < iPosFin) then
      iPosIni := iPosIni2
    else
    begin
      // Se não existe uma String Delimitadora Final, sair da função para que o
      // retorno seja um símbolo vazio.
      if (iPosFin = 0) then
        break;

      Dec(iPosFin, Length(FExprFin)); // Retirar a String Delimitadora Final.
      // Atribuir os valores do símbolo encontrado.
      SetSimbolo(iPosIni, iPosFin, Copy(FTexto, iPosIni, iPosFin-iPosIni+1));
    end;
  until (FSimbolo.Nome <> '');
end;

// Iniciar as variáveis internas para a procura de símbolos dentro de um texto "ATexto"
// usando a expressão indicada em "Expressao".
// Retorna FALSO se um dos parâmetros estiver em branco ou se a expressão não contiver
// o caracter curinga "*" (que atualmente é o único caracter curinga suportado).
function TGerenciaSimbolos.Iniciar(const Expressao, ATexto: string): boolean;
begin
  SetSimbolo(0, 0, '');
  FPosCuringa := Pos('*',Expressao);
  Result := (FPosCuringa > 0) and (Expressao <> '') and (ATexto <> '');
  if (Result) then
  begin
    FExpressao := Expressao;
    FTexto := ATexto;
    FTextoOriginal := ATexto;
    FPosInicial := 1;
  end;
end;

// Método destinado a ser usado pelo usuário da classe.
// Retornar o símbolo atual dentro do texto.
function TGerenciaSimbolos.GetSimboloAtual: TSimbolo;
begin
  SetSimboloAtual;
  Result := FSimbolo;
end;

// Retornar o próximo símbolo dentro do texto.
function TGerenciaSimbolos.GetProximoSimbolo: TSimbolo;
begin
  FPosInicial := FSimbolo.PosIni;
  Result := GetSimboloAtual;
end;

// Substituir todos os símbolos correspondentes a "NomeSimbolo" pela String "ValorSimbolo".
// Caso nenhum "NomeSimbolo" seja especificado, todos os encontrados serão trocados
// por "ValorSimbolo".
function TGerenciaSimbolos.SubstituirSimbolos(const ValorSimbolo, NomeSimbolo: string): boolean;
var
  bAchouSimbolo: boolean;
  iPosIni, iPosFin: integer;
begin
  bAchouSimbolo := false;
  FPosInicial := 1;
  SetSimboloAtual;
  while (FSimbolo.Nome <> '') do
  begin
    bAchouSimbolo := (NomeSimbolo = '') or (FSimbolo.Nome = NomeSimbolo);
    if (bAchouSimbolo) then
    begin
      // Incluir a String de início e fim da expressão às posições do
      // símbolo a ser substituído.
      // Estas varíáveis informam somente as posições do símbolo sem as Strings
      // delimitadoras.
      // Ex: no símbolo <MODFOL>, somente o conteúdo será mostrado. No caso, MODFOL.
      // As atribuições que se seguem servem para recuperar o símbolo com as
      // Strings delimitadoras. No caso, retornará <MODFOL>.
      iPosIni := FSimbolo.PosIni - Length(FExprIni);
      iPosFin := FSimbolo.PosFin + Length(FExprFin);
      // Substituição propriamente dita do símbolo atual
      FTexto := StuffString(FTexto, iPosIni, iPosFin-iPosIni+1, ValorSimbolo);
    end;
    FSimbolo := GetProximoSimbolo;
  end;
  Result := bAchouSimbolo;
end;
function TGerenciaSimbolos.StuffString(const AText: string; AStart, ALength: Cardinal;
       const ASubText: string): string;
     begin
       Result := Copy(AText, 1, AStart - 1) +ASubText+ Copy(AText, AStart + ALength, MaxInt);
end;
end.
