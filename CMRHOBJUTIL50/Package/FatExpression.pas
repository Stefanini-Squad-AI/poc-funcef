
{
  TFatExpression by Gasper Kozak, gasper.kozak@email.si
  component is open-source and is free for any use
  version: 1.03, October 2001

  this is a component used for calculating text-presented expressions
  features
    operations: + - * / ^ !
    parenthesis: ( )
    variables: their values are requested through OnEvaluate event
    user-defined functions in format:
      function_name [ (argument_name [";" argument_name ... ]] "=" expression

  ! parental advisory : bugs included
  if you find any, fix it or let me know

  Update by Dmitry Yakubovich, 1.02 :), August 2001
    fix ReadNextToken, for RangeCheck
    addon variable in form [Variable Name]
      Where the Name of a Variable can include any characters, except for closing square brackets "]"
      OnVariable for calculating
}

unit FatExpression;

interface

uses Classes, Dialogs, Sysutils, Math;

type
  // empty token, numeric, (), +-*/^!, function or variable, ";" character, [] variable
  TTokenType = (ttNone, ttNumeric, ttParenthesis, ttOperation, ttString,
    ttParamDelimitor, ttVariable);
  TEvaluateOrder = (eoInternalFirst, eoEventFirst);
  TOnEvaluate = procedure(Sender: TObject; Eval: string; Args: array of double;
    ArgCount: integer; var Value: double; var Done: boolean) of object;
  TOnVariable = procedure(Sender: TObject; Variable: string; var Value: double;
    var Done: boolean) of object;

  // class used by TExpParser and TExpNode for breaking text into
  // tokens and building a syntax tree
  TExpToken = class
  private
    FText: string;
    FTokenType: TTokenType;
  public
    property Text: string read FText;
    property TokenType: TTokenType read FTokenType;
  end;

  // engine for breaking text into tokens
  TExpParser = class
  protected
    FExpression: string;
    FTokens: TList;
    FPos: integer;
  private
    procedure Clear;
    function  GetToken(Index: integer): TExpToken;
    procedure SetExpression(const Value: string);
  public
    constructor Create;
    destructor  Destroy; override;

    function ReadFirstToken: TExpToken;
    function ReadNextToken: TExpToken;
    function TokenCount: integer;

    property Tokens[Index: integer]: TExpToken read GetToken;
    property TokenList: TList read FTokens;
    property Expression: string read FExpression write SetExpression;
  end;

  // syntax-tree node. this engine uses a bit upgraded binary-tree
  TExpNode = class
  protected
    FOwner: TObject;
    FParent: TExpNode;
    FChildren: TList;
    FTokens: TList;
    FLevel: integer;
    FToken: TExpToken;
    FOnEvaluate: TOnEvaluate;
    FOnVariable: TOnVariable;
  private
    function  GetToken(Index: integer): TExpToken;
    function  GetChildren(Index: integer): TExpNode;
    function  FindLSOTI: integer;
    // LSOTI = least significant operation token index
    function  ParseFunction: boolean;
    procedure RemoveSorroundingParenthesis;
    procedure SplitToChildren(TokenIndex: integer);
    function  Evaluate: double;
    function  Variable: double;
    function  ParseVariable: boolean;

    property Children[Index: integer]: TExpNode read GetChildren;
  public
    constructor Create(AOwner: TObject; AParent: TExpNode; Tokens: TList);
    destructor  Destroy; override;

    procedure Build;
    function  TokenCount: integer;
    function  Calculate: double;

    property Tokens[Index: integer]: TExpToken read GetToken;
    property Parent: TExpNode read FParent;
    property Level: integer read FLevel;
    property OnEvaluate: TOnEvaluate read FOnEvaluate write FOnEvaluate;
    property OnVarible: TOnVariable read FOnVariable write FOnVariable;
  end;

  TFunction = class
  protected
    FAsString, FName, FHead, FFunction: string;
    FOwner: TObject;
    FArgCount: integer;
    FArgs: TStringList;
    FValues: array of double;
  private
    procedure SetAsString(const Value: string);
    procedure EvalArgs(Sender: TObject; Eval: string; Args: array of double;
      ArgCount: integer; var Value: double);
  public
    constructor Create(AOwner: TObject);
    destructor  Destroy; override;

    function Call(Values: array of double): double;

    property AsString: string read FAsString write SetAsString;
    property Name: string read FName;
    property ArgCount: integer read FArgCount;
    property Args: TStringList read FArgs;
  end;

  // main component, actually only a wrapper for TExpParser, TExpNode and
  // user input via OnEvaluate event
  TFatExpression = class(TComponent)
  protected
    FInfo, FText: string;
    FEvaluateOrder: TEvaluateOrder;
    FOnEvaluate: TOnEvaluate;
    FOnVariable: TOnVariable;
    FValue: double;
    FFunctions: TStringList;
  private
    procedure BalancearToken(TokenList: TList);
    procedure Compile;
    function  GetValue: double;
    procedure SetInfo(Value: string);
    procedure Evaluate(Eval: string; Args: array of double; var Value: double);
    function  FindFunction(FuncName: string): TFunction;
    procedure SetFunctions(Value: TStringList);
    procedure Variable(Eval: string; var Value: double);
  public
    FTokenList: string;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    property Value: double read GetValue;
  published
    property Text: string read FText write FText;
    property Info: string read FInfo write SetInfo;
    property Functions: TStringList read FFunctions write SetFunctions;
    property EvaluateOrder: TEvaluateOrder read FEvaluateOrder write FEvaluateOrder;
    property OnEvaluate: TOnEvaluate read FOnEvaluate write FOnEvaluate;
    property OnVariable: TOnVariable read FOnVariable write FOnVariable;
  end;

procedure Register;

implementation

const
  // supported operations
  STR_OPERATION = '+-*/^!';
  // function parameter delimitor
  STR_PARAMDELIMITOR = ';';
  // legal variable name characters
  STR_STRING: array[0..1] of string =
  ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_',
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_$#@0123456789');

procedure Register;
begin
  RegisterComponents('RH', [TFatExpression]);
end;

function OperParamateres(const Oper: string): integer;
begin
  if Pos(Oper, '+-*/^') > 0 then
    Result := 2
  else
  if (Oper = '!') then
    Result := 1
  else
    Result := 0;
end;

constructor TExpParser.Create;
begin
  inherited Create;
  FTokens := TList.Create;
end;

destructor TExpParser.Destroy;
begin
  Clear;
  FTokens.Free;
  inherited;
end;

procedure TExpParser.Clear;
begin
  while (FTokens.Count > 0) do
  begin
    TExpToken(FTokens[0]).Free;
    FTokens.Delete(0);
  end;
end;

procedure TExpParser.SetExpression(const Value: string);
begin
  FExpression := Trim(Value);
end;

function TExpParser.GetToken(Index: integer): TExpToken;
begin
  Result := TExpToken(FTokens[Index]);
end;

function TExpParser.ReadFirstToken: TExpToken;
begin
  Clear;
  FPos := 1;
  Result := ReadNextToken;
end;

function GetTokenType(S: string; First: boolean): TTokenType;
var
  Value: Double;
  P, Error: Integer;
begin
  if (S = '(') or (S = ')') then
    Result := ttParenthesis
  else
  if (S = STR_PARAMDELIMITOR) then
    Result := ttParamDelimitor
  else
  if (S = '[') or (S = ']') then
    Result := ttVariable
  else
  if (Pos(S, STR_OPERATION) > 0) then
    Result := ttOperation
  else
  begin
    Val(S, Value, Error);
    if Error = 0 then
      Result := ttNumeric
    else
    begin
      if (First) then
        P := Pos(S, STR_STRING[0])
      else
        P := Pos(S, STR_STRING[1]);

      if (P > 0) then
        Result := ttString
      else
        Result := ttNone;
    end;
  end;
end;

function TExpParser.ReadNextToken: TExpToken;
var
  Part, Ch: string;
  FirstType, NextType: TTokenType;
  Sci: boolean;
begin
  Result := nil;
  if (FPos > Length(FExpression)) then
    exit;

  Sci := false;
  Part := '';
  repeat
    Ch := FExpression[FPos];
    Inc(FPos);
  until (Ch <> ' ') or (FPos > Length(FExpression));

  if (FPos-1 > Length(FExpression)) then
    exit;

  FirstType := GetTokenType(Ch, true);
  if (FirstType = ttNone) then
    raise Exception.CreateFmt(
      'Erro na Análise da Expressão: caracter ilegal "%s" na posição %d.', [Ch, FPos - 1]);

  if (FirstType in [ttParenthesis, ttOperation]) then
  begin
    Result := TExpToken.Create;
    Result.FText := Ch;
    Result.FTokenType := FirstType;
    FTokens.Add(Result);
    exit;
  end;

  if (FirstType <> ttVariable) then
    Part := Ch;

  repeat
    if (FPos <= Length(FExpression)) then
      Ch := FExpression[FPos]
    else
      Ch := #0;

    NextType := GetTokenType(Ch, false);

    if (NextType = FirstType) and (FirstType <> ttVariable) or
       ((FirstType = ttVariable) and (NextType <> ttVariable)) or
       ((FirstType = ttString) and (NextType = ttNumeric)) or
       ((FirstType = ttNumeric) and (NextType = ttString) and (Ch = 'E') and not(Sci)) or
       ((FirstType = ttNumeric) and (NextType = ttOperation) and (Ch = '-') and (Sci)) then
    begin
      Part := Part + Ch;
      if (FirstType = ttNumeric) and (NextType = ttString) and (Ch = 'E') then
        Sci := true;
    end
    else
    begin
      if (FirstType = ttVariable) and (NextType = ttVariable) then
        Inc(FPos);

      Result := TExpToken.Create;
      Result.FText := Part;
      Result.FTokenType := FirstType;
      FTokens.Add(Result);
      exit;
    end;
    Inc(FPos);
  until (FPos > Length(FExpression));

  Result := TExpToken.Create;
  Result.FText := Part;
  Result.FTokenType := FirstType;
  FTokens.Add(Result);
end;

function TExpParser.TokenCount: integer;
begin
  Result := FTokens.Count;
end;

constructor TExpNode.Create(AOwner: TObject; AParent: TExpNode; Tokens: TList);
var
  I: integer;
begin
  inherited Create;

  FOwner := AOwner;
  FParent := AParent;
  if (FParent = nil) then
    FLevel := 0
  else
    FLevel := FParent.Level + 1;

  FTokens := TList.Create;
  I := 0;
  while (I < Tokens.Count) do
  begin
    FTokens.Add(Tokens[I]);
    Inc(I);
  end;

  FChildren := TList.Create;

  if (Tokens.Count = 1) then
    FToken := Tokens[0];
end;

destructor TExpNode.Destroy;
var
  Child: TExpNode;
begin
  if Assigned(FChildren) then
  begin
    while (FChildren.Count > 0) do
    begin
      Child := Children[FChildren.Count - 1];
      FreeAndNil(Child);
      FChildren.Delete(FChildren.Count - 1);
    end;

    FreeAndNil(FChildren);
  end;

  FTokens.Free;
  inherited;
end;

procedure TExpNode.RemoveSorroundingParenthesis;
var
  First, Last, Lvl, I: integer;
  Sorrounding: boolean;
begin
  First := 0;
  Last := TokenCount - 1;
  while (Last > First) do
  begin
    if (Tokens[First].TokenType = ttParenthesis) and
       (Tokens[Last].TokenType = ttParenthesis) and
       (Tokens[First].Text = '(') and (Tokens[Last].Text = ')') then
    begin
      Lvl := 0;
      I := 0;
      Sorrounding := true;
      repeat
        if (Tokens[I].TokenType = ttParenthesis) and (Tokens[I].Text = '(') then
          Inc(Lvl)
        else
        if (Tokens[I].TokenType = ttParenthesis) and (Tokens[I].Text = ')') then
          Dec(Lvl);

        if (Lvl = 0) and (I < TokenCount - 1) then
        begin
          Sorrounding := false;
          Break;
        end;

        Inc(I);
      until (I = TokenCount);

      if (Sorrounding) then
      begin
        FTokens.Delete(Last);
        FTokens.Delete(First);
      end
      else
        exit;
    end
    else
      exit;

    First := 0;
    Last := TokenCount - 1;
  end;
end;

procedure TExpNode.Build;
var
  LSOTI: integer;
begin
  if (TokenCount < 2) then
    exit;

  RemoveSorroundingParenthesis;

  if (TokenCount < 2) then
    exit;

  LSOTI := FindLSOTI;
  if (LSOTI < 0) then
  begin
    if (ParseFunction) or (ParseVariable) then
      exit;

    raise Exception.Create('Erro de compilação da expressão: falha na sintaxe.');
  end;
  SplitToChildren(LSOTI);
end;

function TExpNode.ParseFunction: boolean;
var
  Func: boolean;
  I, Delimitor, DelimitorLevel: integer;
  FChild: TExpNode;
  FList: TList;
begin
  Result := false;
  if (TokenCount < 4) then
    exit;

  Func := (Tokens[0].TokenType = ttString) and
          (Tokens[1].TokenType = ttParenthesis) and
          (Tokens[TokenCount - 1].TokenType = ttParenthesis);

  if not(Func) then
    exit;

  FToken := Tokens[0];
  FTokens.Delete(TokenCount - 1);
  FTokens.Delete(1);

  FList := TList.Create;
  try
    while (TokenCount > 1) do
    begin
      Delimitor := -1;
      DelimitorLevel := 0;
      for I:=1 to TokenCount-1 do
      begin
        if (Tokens[I].TokenType = ttParenthesis) and (Tokens[I].Text = '(') then
          Inc(DelimitorLevel)
        else
        if (Tokens[I].TokenType = ttParenthesis) and (Tokens[I].Text = ')') then
          Dec(DelimitorLevel)
        else
        if (Tokens[I].TokenType = ttParamDelimitor) and (DelimitorLevel = 0) then
        begin
          Delimitor := I - 1;
          FTokens.Delete(I);
          Break;
        end;

        if (DelimitorLevel < 0) then
          raise Exception.Create('Erro na análise da função.');
      end;

      if (Delimitor = -1) then
        Delimitor := TokenCount - 1;

      for I:=1 to Delimitor do
      begin
        FList.Add(Tokens[1]);
        FTokens.Delete(1);
      end;

      FChild := TExpNode.Create(FOwner, Self, FList);
      FList.Clear;
      FChild.Build;
      FChildren.Add(FChild);
    end;
  finally
    FList.Free;
  end;
  Result := true;
end;

procedure TExpNode.SplitToChildren(TokenIndex: integer);
var
  Left, Right: TList;
  I: integer;
  FChild: TExpNode;
begin
  Left := TList.Create;
  Right := TList.Create;

  try
    if (TokenIndex < TokenCount - 1) then
      for I:=TokenCount-1 downto TokenIndex+1 do
      begin
        Right.Insert(0, FTokens[I]);
        FTokens.Delete(I);
      end;

    if (Right.Count > 0) then
    begin
      FChild := TExpNode.Create(FOwner, Self, Right);
      FChildren.Insert(0, FChild);
      FChild.Build;
    end;

    if (TokenIndex > 0) then
      for I:= TokenIndex-1 downto 0 do
      begin
        Left.Insert(0, FTokens[I]);
        FTokens.Delete(I);
      end;

    FChild := TExpNode.Create(FOwner, Self, Left);
    FChildren.Insert(0, FChild);
    FChild.Build;
  finally
    FToken := Tokens[0];
    Left.Free;
    Right.Free;
  end;
end;

function TExpNode.GetChildren(Index: integer): TExpNode;
begin
  Result := TExpNode(FChildren[Index]);
end;

function TExpNode.ParseVariable: boolean;
begin
  Result := false;
  if (Tokens[0].TokenType = ttVariable) then
    Result := true;
end;

function TExpNode.FindLSOTI: integer;
var
  Lvl, I, LSOTI, NewOperPriority, OperPriority: integer;
begin
  Lvl := 0; // Lvl = parenthesis level
  I := 0;
  LSOTI := -1;
  OperPriority := 9;

  repeat
    if (Tokens[I].TokenType = ttParenthesis) then
    begin
      if (Tokens[I].Text = '(') then
        Inc(Lvl)
      else
      if (Tokens[I].Text = ')') then
        Dec(Lvl);

      if (Lvl < 0) then
        raise Exception.Create('Erro de compilação da expressão: parêntesis incorreto.');
    end;

    if (Tokens[I].TokenType = ttOperation) and (Lvl = 0) then
    begin
      NewOperPriority := Pos(Tokens[I].Text, STR_OPERATION);

      if (NewOperPriority <= OperPriority) then
      begin
        OperPriority := NewOperPriority;
        LSOTI := I;
      end;
    end;

    Inc(I);
  until I >= TokenCount;

  Result := LSOTI;
end;

function Exl(Value: integer): double;
begin
  if (Value <= 1) then
    Result := Value
  else
    Result := Value * Exl(Value - 1);
end;

function TExpNode.Evaluate: double;
var
  Args: array of double;
  Count, I: integer;
  Done: boolean;
begin
  Result := 0;
  if (FToken.TokenType = ttString) then
  begin
    Count := FChildren.Count;
    SetLength(Args, Count);
    for I:=0 to Count-1 do
      Args[I] := Children[I].Calculate;

    if Assigned(FOnEvaluate) then
      FOnEvaluate(Self, FToken.Text, Args, High(Args) + 1, Result, Done)
    else
    if (FOwner is TFatExpression) then
      TFatExpression(FOwner).Evaluate(FToken.Text, Args, Result)
    else
    if (FOwner is TFunction) then
      TFunction(FOwner).EvalArgs(Self, FToken.Text, Args, High(Args) + 1, Result);
  end;
end;

function TExpNode.Variable: double;
var
  Done: boolean;
begin
  Result := 0;
  if (FToken.TokenType = ttVariable) then
  begin
    if Assigned(FOnVariable) then
      FOnVariable(Self, FToken.Text, Result, Done);

    if (FOwner is TFatExpression) then
      TFatExpression(FOwner).Variable(FToken.Text, Result);
  end;
end;

function TExpNode.Calculate: double;
var
  Error: integer;
  DivX, DivY: double;
begin
  Result := 0;
  if (FToken = nil) or (TokenCount = 0) then
    exit;

  if (TokenCount = 1) then
  begin
    if (FToken.TokenType = ttNumeric) then
      Val(FToken.Text, Result, Error)
    else
    if (FToken.TokenType = ttString) then
      Result := Evaluate
    else
    if (FToken.TokenType = ttVariable) then
      Result := Variable
    else
    if (FToken.TokenType = ttOperation) then
    begin
      if (FChildren.Count <> OperParamateres(FToken.Text)) then
        raise Exception.Create('Erro de cálculo: falha na árvore de sintaxe.');

      if (FToken.Text = '+') then
        Result := Children[0].Calculate + Children[1].Calculate
      else
      if (FToken.Text = '-') then
        Result := Children[0].Calculate - Children[1].Calculate
      else
      if (FToken.Text = '*') then
        Result := Children[0].Calculate * Children[1].Calculate
      else
      if (FToken.Text = '/') then
      begin
        DivX := Children[0].Calculate;
        DivY := Children[1].Calculate;
        if (DivY <> 0) then
          Result := DivX / DivY
        else
          raise Exception.CreateFmt(
            'Erro de cálculo: "%f / %f" divisão por zero.', [DivX, DivY]);
      end
      else
      if (FToken.Text = '^') then
        Result := Power(Children[0].Calculate, Children[1].Calculate)
      else
      if (FToken.Text = '!') then
        Result := Exl(Round(Children[0].Calculate));
    end;
  end;
end;

function TExpNode.GetToken(Index: integer): TExpToken;
begin
  Result := TExpToken(FTokens[Index]);
end;

function TExpNode.TokenCount: integer;
begin
  Result := FTokens.Count;
end;

constructor TFunction.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FAsString := '';
  FName := '';
  FArgCount := 0;
  FArgs := TStringList.Create;
end;

destructor TFunction.Destroy;
begin
  FArgs.Free;
  inherited;
end;

function TFunction.Call(Values: array of double): double;
var
  Token: TExpToken;
  Tree: TExpNode;
  Parser: TExpParser;
  I: integer;
begin
  SetLength(FValues, High(Values) + 1);
  for I:=0 to High(Values) do
    FValues[I] := Values[I];

  Parser := TExpParser.Create;
  try
    Parser.Expression := FFunction;
    Token := Parser.ReadFirstToken;
    while (Token <> nil) do
      Token := Parser.ReadNextToken;

    Tree := TExpNode.Create(Self, nil, Parser.TokenList);
    try
      Tree.Build;
      Result := Tree.Calculate;
    finally
      Tree.Free;
    end;
  finally
    Parser.Free;
  end;
end;

procedure TFunction.EvalArgs(Sender: TObject; Eval: string; Args: array of
  double; ArgCount: integer; var Value: double);
var
  I: integer;
begin
  for I:=0 to FArgs.Count-1 do
    if (UpperCase(FArgs[I]) = UpperCase(Eval)) then
    begin
      Value := FValues[I];
      exit;
    end;

  if (FOwner is TFatExpression) then
    TFatExpression(FOwner).Evaluate(Eval, Args, Value);
end;

procedure TFunction.SetAsString(const Value: string);
var
  Head: string;
  HeadPos: integer;
  Parser: TExpParser;
  Token: TExpToken;
  ExpectParenthesis, ExpectDelimitor: boolean;
begin
  FArgs.Clear;
  FArgCount := 0;
  FAsString := Value;
  FHead := '';
  FFunction := '';
  FName := '';

  HeadPos := Pos('=', FAsString);
  if (HeadPos = 0) then
    exit;

  Head := Copy(FAsString, 1, HeadPos - 1);
  FFunction := FAsString;
  Delete(FFunction, 1, HeadPos);
  Parser := TExpParser.Create;
  try
    Parser.Expression := Head;
    Token := Parser.ReadFirstToken;
    if (Token = nil) or (Token.TokenType <> ttString) then
      raise Exception.CreateFmt('Função "%s" não é válida.', [FAsString]);

    FName := Token.Text;

    Token := Parser.ReadNextToken;
    if (Token = nil) then
      exit;

    if (Token.TokenType = ttParenthesis) then
    begin
      if (Token.Text = '(') then
        ExpectParenthesis := true
      else
        raise Exception.CreateFmt('Cabeçalho da função "%s" não é válido.', [Head]);
    end
    else
      ExpectParenthesis := false;

    ExpectDelimitor := false;
    while (Token <> nil) do
    begin
      Token := Parser.ReadNextToken;
      if (Token <> nil) then
      begin
        if (Token.TokenType = ttParenthesis) then
        begin
          if (ExpectParenthesis) and (Token.Text = ')') then
            exit
          else
            raise Exception.CreateFmt('Cabeçalho da função "%s" não é válido', [Head]);
        end;

        if (ExpectDelimitor) then
        begin
          if (Token.TokenType <> ttParamDelimitor) and (Token.TokenType <> ttParenthesis) then
            raise Exception.Create('Erro na análise da função: delimitador ";" experado entre argumentos.');

          ExpectDelimitor := false;
          Continue;
        end;

        if (Token.TokenType = ttString) then
        begin
          FArgs.Add(Token.Text);
          FArgCount := FArgs.Count;
          ExpectDelimitor := true;
        end;
      end;
    end;

    if (ExpectParenthesis) then
      raise Exception.CreateFmt('Cabeçalho da função "%s" não é válido.', [Head]);
  finally
    Parser.Free;
  end;
end;

constructor TFatExpression.Create;
begin
  inherited;
  FText := '';
  FInfo := 'TFatExpression v1.0 by gasper.kozak@email.si';
  FFunctions := TStringList.Create;
end;

destructor TFatExpression.Destroy;
begin
  FFunctions.Free;
  inherited;
end;

procedure TFatExpression.BalancearToken(TokenList: TList);
var
  c: integer;
  Token1, Token2, Token3, TokenSinal: TExpToken;
begin
  if (TokenList.Count < 3) then
    exit;

  for c:=0 to TokenList.Count-1 do
  begin
    if (c+2 = TokenList.Count) then
      break;

    Token1 := TokenList[c];
    Token2 := TokenList[c+1];
    Token3 := TokenList[c+2];
    if (Token1.FText = '(') and
       not(Token2.FTokenType in [ttNone,ttParenthesis,ttOperation,ttParamDelimitor]) and
       (Token3.FText = ')') then
    begin
      TokenSinal := TExpToken.Create;
      TokenSinal.FText := '+';
      TokenSinal.FTokenType := ttOperation;
      TokenList.Insert(c+1, TokenSinal);
    end;
  end;

  FTokenList := '';
  for c:=0 to TokenList.Count-1 do
    FTokenList := FTokenList + TExpToken(TokenList[c]).FText;
end;

procedure TFatExpression.Compile;
var
  Token: TExpToken;
  Tree: TExpNode;
  Parser: TExpParser;
begin
  Parser := TExpParser.Create;
  try
    Parser.Expression := FText;

    // Pegar cada Token da expressão
    Token := Parser.ReadFirstToken;
    while (Token <> nil) do
      Token := Parser.ReadNextToken;

    BalancearToken(Parser.TokenList);

    // Criar árvore de sintaxe, calcular a expressão e retornar o valor
    Tree := TExpNode.Create(Self, nil, Parser.TokenList);
    try
      Tree.Build;
      FValue := Tree.Calculate;
    finally
      Tree.Free;
    end;
  finally
    Parser.Free;
  end;
end;

function TFatExpression.FindFunction(FuncName: string): TFunction;
var
  F: TFunction;
  I: integer;
begin
  Result := nil;
  for I:=0 to FFunctions.Count-1 do
    if (Trim(FFunctions[I]) <> '') then
    begin
      F := TFunction.Create(Self);
      F.AsString := FFunctions[I];
      if (UpperCase(F.Name) = UpperCase(FuncName)) then
      begin
        Result := F;
        exit;
      end;
      F.Free;
    end;
end;

procedure TFatExpression.SetInfo(Value: string);
begin
  //
end;

procedure TFatExpression.Evaluate(Eval: string; Args: array of double; var Value: double);
var
  Func: TFunction;
  Done: boolean;
begin
  Done := false;
  if (EvaluateOrder = eoEventFirst) and Assigned(FOnEvaluate) then
  begin
    FOnEvaluate(Self, Eval, Args, High(Args) + 1, Value, Done);
    if (Done) then
      exit;
  end
  else
    Value := 0;

  Func := FindFunction(Eval);
  if (Func <> nil) then
  begin
    Value := Func.Call(Args);
    Func.Free;
    exit;
  end;

  if (EvaluateOrder = eoInternalFirst) and Assigned(FOnEvaluate) then
    FOnEvaluate(Self, Eval, Args, High(Args) + 1, Value, Done)
  else
    Value := 0;
end;

procedure TFatExpression.Variable(Eval: string; var Value: double);
var
  Done: boolean;
begin
  Done := false;
  if Assigned(FOnVariable) then
  begin
    FOnVariable(Self, Eval, Value, Done);
    if (Done) then
      exit;
  end
  else
    Value := 0;
end;

function TFatExpression.GetValue: double;
begin
  Compile;
  Result := FValue;
end;

procedure TFatExpression.SetFunctions(Value: TStringList);
begin
  FFunctions.Assign(Value);
end;

end.
