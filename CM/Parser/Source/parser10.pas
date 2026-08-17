unit Parser10;

{ TParser - component for parsing and evaluating mathematical expressions
  Renate Schaaf (schaaf@math.usu.edu), 1993
  Alin Flaider (aflaidar@datalog.ro), 1996

  Version 9-10: Stefan Hoffmeister
    1996-1997

  See HISTORY.TXT for changes, additions, fixes...
}


{$IFDEF Win32}
  {$H+,S-} { long strings, no stack-checking}
{$ENDIF}

{.$DEFINE DEBUG} { by default make it lean and efficient }
{$IFNDEF DEBUG}
  {$D-} {$L-} {$Q-} {$R-} {$S-}
{$ENDIF}


{$I+} { I/O checking ON }

interface

uses
  SysUtils,
  Classes;

type
  { a couple of unfortunately necessary global declarations }
  ParserFloat = double;  { please do NOT use "real", only single, double, extended}
  PParserFloat = ^ParserFloat;

  TToken=( variab, constant, brack,
           minus, sum, diff, prod, divis, modulo, IntDiv,
           integerpower, realpower,
           square, third, fourth,
           FuncOneVar, FuncTwoVar);

  POperation = ^TOperation;
  TMathProcedure = procedure(AnOperation: POperation);
  TOperation = record
                 { MUST use pointers (!), because argument and destination are linked... }
                 Arg1, Arg2 : PParserFloat;
                 Dest : PParserFloat;

                 NextOperation : POperation;

                 Operation: TMathProcedure;
                 Token : TToken;
               end;

  { functions that are added to the engine MUST have this declaration }
  { make sure that the procedure is declared far !!! }
  TFuncPrototype = procedure( AnOp: Poperation); { far; }


  EMathParserError = class(Exception); { create a new exception class and... }

  { ... some descendants }
  ESyntaxError = class(EMathParserError);
  EExpressionHasBlanks = class(EMathParserError);
  EExpressionTooComplex = class(EMathParserError);
  ETooManyNestings = class(EMathParserError);
  EMissMatchingBracket = class(EMathParserError);
  EBadName = class(EMathParserError);
  EParserInternalError = class(EMathParserError); { hopefully we will never see this one }


  { we COULD use Forms and the TExceptionEvent therein,
    but that would give us all the VCL overhead.
    Consequentially we just redeclare an appropriate event }
  TParserExceptionEvent = procedure (Sender: TObject; E: Exception) of object;



  TCustomParser = class(TComponent)
  private
    FA,FB,FC,FD,FE,FX,FY,FT: ParserFloat;
  private
    FExpression : string;
    FPascalNumberformat: boolean;
    FParserError : boolean;
    FNumberOperators: integer;

    FVariables: TStringList;

    FStartOperationList: POperation;

    FOnParserError : TParserExceptionEvent;

    function CalcValue: ParserFloat;
    procedure SetExpression(const AnExpression: string);
    procedure SetVar(const VarName: string; Value: ParserFloat);
  protected
    { lists of available functions, see .Create for example use }
    FunctionOne : TStringList;     { functions with ONE argument, e.g. exp() }
    FunctionTwo : TStringList;     { functions with TWO arguments, e.g. max(,) }

    { predefined variables - could be left out }
    property A: ParserFloat read FA write FA;
    property B: ParserFloat read FB write FB;
    property C: ParserFloat read FC write FC;
    property D: ParserFloat read FD write FD;
    property E: ParserFloat read FE write FE;
    property T: ParserFloat read FT write FT;
    property X: ParserFloat read FX write FX;
    property Y: ParserFloat read FY write FY;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ParseExpression(const AnExpression: string): boolean;
    procedure FreeExpression;

    { The PFloat returned points to the place in memory where the variable
      actually sits; to speed up assignment you can use
      PFloat is declared P9BUILD.PAS }
    function SetVariable(VarName: string; Value: ParserFloat): PParserFloat;
    function GetVariable(const VarName: string): ParserFloat;

    procedure AddFunctionOneParam(const AFunctionName: string; Func: TFuncPrototype);
    procedure AddFunctionTwoParam(const AFunctionName: string; Func: TFuncPrototype);

    procedure ClearVariables;
    procedure ClearVariable(const AVarName: string);
    procedure ClearFunctions;
    procedure ClearFunction(const AFunctionName: string);

    property ParserError: boolean read FParserError;
    property LinkedOperationList: POperation read FStartOperationList;

    property Variable[const VarName: string]: ParserFloat read GetVariable write SetVar;
  published
    property Value: ParserFloat read CalcValue stored false;

    { setting Expression automatically parses it - warning: exceptions may be raised }
    property Expression: string read FExpression write SetExpression;
    property PascalNumberformat: boolean read FPascalNumberformat write FPascalNumberformat default true;
    property OnParserError: TParserExceptionEvent read FOnParserError write FOnParserError;
  end;




  TParser = class(TCustomParser)
  public
    { overrides to add the properties below as variables
      and adds all the functions }
    constructor Create(AOwner: TComponent); override;

    { returns the string with the blanks inside removed }
    class function RemoveBlanks(const s: string): string;
  published
    { predefined variables - could be left out }
    property A;
    property B;
    property C;
    property D;
    property E;
    property T;
    property X;
    property Y;
 end;

procedure Register;

implementation

{$DEFINE UseMath}
{ Note: if you do not have the MATH unit simply remove the conditional define
        the component will continue to work, just a bit slower }

uses
{$IFDEF UseMath}
  Math,
{$ENDIF}
  P10Build;

procedure Register;
Begin
  RegisterComponents('CM Additional', [TParser]);
End;


{$IFDEF VER80}
  {$R *.D16}
{$ENDIF}


{$IFDEF VER90}
  {$R *.D32}
{$ENDIF}

{
****************************************************************
* These are the calculating procedures; add here               *
****************************************************************


Naming convention for functions:

  Name of built-in function, prepended with an underscore.
  Example:

    ln --> _ln

Passed arguments / results:

  If the function takes any arguments - i.e. if it has been added to
  either the FunctionOne or the FunctionTwo list:

  - First  argument --> arg1^
  - Second argument --> arg2^

  The result of the operation must ALWAYS be put into

     dest^


 Note: These are POINTERS to floats.
}

{****************************************************************************
*****************************************************************************

                      Início das Rotinas Personalizadas

*****************************************************************************
*****************************************************************************}


procedure _round(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= round(arg1^ * Power(10,arg2^))/power(10,arg2^);
end;

procedure _difdias(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= arg1^ - arg2^;
end;

procedure _difmeses(AnOp: POperation); far;
var
  anos,meses: Double;
  ano1,ano2,mes1,mes2,dia1,dia2:   Word;
begin
  with AnOp^ do
  begin
    decodedate(arg1^,ano1,mes1,dia1);
    decodedate(arg2^,ano2,mes2,dia2);
    anos:= ano2 - ano1;
    meses:= mes2 - mes1;
    if meses < 0 then meses:= meses + 12;
    meses:= meses + anos * 12;
    if dia1 > dia2 then meses:= meses - 1;
    dest^:= meses;
  end;
end;

procedure _difanos(AnOp: POperation); far;
var
  anos: Double;
  ano1,ano2,mes1,mes2,dia1,dia2:   Word;
begin
  with AnOp^ do
  begin
    decodedate(arg1^,ano1,mes1,dia1);
    decodedate(arg2^,ano2,mes2,dia2);
    anos:= ano2 - ano1;
    if dia1 > dia2 then mes2:= mes2 - 1;
    if mes1 > mes2 then anos:= anos - 1;
    dest^:= anos;
  end;
end;

procedure _edia(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= arg1^ + arg2^;
end;

procedure _emes(AnOp: POperation); far;
var
  dia, mes, ano : Word;
  mesx          : Double;
begin
  with AnOp^ do
  begin
    decodedate(arg1^,ano,mes,dia);
    mesx := mes + arg2^;
    if mesx <> 12 then
      mesx := StrToInt(FloatToStr(mesx)) mod 12;
    dest^ := StrToDate(IntToStr(dia)+'/'+FloatToStr(mesx)+'/'+IntToStr(ano));
  end;
end;

procedure _eano(AnOp: POperation); far;
var
  dia, mes, ano : Word;
begin
  with AnOp^ do
  begin
    decodedate(arg1^,ano,mes,dia);
    dest^ := StrToDate(IntToStr(dia)+'/'+IntToStr(mes)+'/'+FloatToStr(ano+arg2^));
  end;
end;

{****************************************************************************
*****************************************************************************

                      Fim das Rotinas Personalizadas

*****************************************************************************
*****************************************************************************}


{ these are mandatory procedures - never remove them }
procedure _nothing(AnOp: POperation); far;
begin
end;

procedure _Add(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= arg1^ + arg2^;
end;

procedure _Subtract(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := arg1^ - arg2^;
end;

procedure _Multiply(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := arg1^ * arg2^;
end;

procedure _RealDivide(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := arg1^ / arg2^;
end;

procedure _Modulo(AnOp: POperation); far;
var
  T1, T2 : longint;
begin
  with AnOp^ do
  begin
    if (Abs(arg1^) > MaxLongint) or (Abs(arg2^) > MaxLongint) then
      raise EIntOverFlow.Create('Parser internal integer overflow'); { force an integer overflow }

    T1 := trunc(arg1^);
    T2 := trunc(arg2^);

    dest^ := T1 mod T2;
  end;
end;

procedure _IntDiv(AnOp: POperation); far;
var
  T1, T2 : longint;
begin
  with AnOp^ do
  begin
    if (Abs(arg1^) > MaxLongint) or (Abs(arg2^) > MaxLongint) then
      raise EIntOverFlow.Create('Parser internal integer overflow'); { force an integer overflow }

    T1 := trunc(arg1^);
    T2 := trunc(arg2^);

    dest^ := T1 div T2;
  end;
end;

procedure _Negate(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := -arg1^;
end;

procedure _IntPower(AnOp: POperation); far;
{$IFNDEF UseMath}
var
  n,i:longint;
{$ENDIF}
begin

{$IFNDEF UseMath}
  with AnOp^ do
  begin
    n:=trunc(abs(arg2^))-1;

    case n of
      -1: dest^:=1;
       0: dest^:=arg1^;
    else
      dest^:=arg1^;
      for i:=1 to n do
        dest^:=dest^*arg1^;
    end;

    if arg2^<0 then
      dest^:=1/dest^;

  end;
{$ELSE}
  with AnOp^ do
  begin
    dest^ := IntPower(arg1^, trunc(arg2^));
  end;
{$ENDIF}
end;

procedure _square(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= sqr(arg1^);
end;

procedure _third(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= arg1^ * arg1^ * arg1^;
end;

procedure _forth(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := sqr(sqr(arg1^));
end;

procedure _realpower(AnOp: POperation); far;
begin
  with AnOp^ do
  begin
{$IFNDEF UseMath}
    if arg1^ = 0 then
      dest^ := 0
    else
      dest^:= exp(arg2^*ln(arg1^));
{$ELSE}
    dest^ := Power(arg1^, arg2^);
{$ENDIF}
  end;
end;


{ here functions start which are optional - see the case statement }
procedure _cos(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := cos(arg1^);
end;

procedure _sin(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := sin(arg1^);
end;

procedure _exp(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := exp(arg1^);
end;

procedure _ln(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := ln(arg1^);
end;

procedure _sqrt(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := sqrt(arg1^);
end;

procedure _arctan(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := arctan(arg1^);
end;

procedure _abs(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := abs(arg1^);
end;

procedure _min(AnOp: POperation); far;
begin
  with AnOp^ do
    if arg1^ < arg2^ then
      dest^ := arg1^
    else
      dest^ := arg2^;
end;

procedure _max(AnOp: POperation); far;
begin
  with AnOp^ do
    if arg1^ < arg2^ then
      dest^ := arg2^
    else
      dest^ := arg1^;
end;

procedure _heaviside(AnOp: POperation); far;
begin
  with AnOp^ do
    if arg1^ < 0 then
      dest^ := 0
    else
      dest^ := 1;
end;

procedure _sign(AnOp: POperation); far;
begin
  with AnOp^ do
    if arg1^ < 0 then
      dest^ := -1
    else
      if arg1^ > 0 then
        dest^ := 1.0
      else
        dest^ := 0.0;
end;

procedure _zero(AnOp: POperation); far;
begin
  with AnOp^ do
    if arg1^ = 0.0 then
      dest^ := 0.0
    else
      dest^ := 1.0;
end;

procedure _trunc(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := trunc(arg1^*power(10,arg2^))/power(10,arg2^);
end;

procedure _rnd(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := Random * round(arg1^);
end;

procedure _phase(AnOp: POperation); far;
var
  a:ParserFloat;
begin
  with AnOp^ do
  begin
    a := arg1^ / (2/pi);
    dest^ := (2*pi) * (a-round(a));
  end;
end;

procedure _arg(AnOp: POperation); far;
begin
  with AnOp^ do
    if arg1^ < 0 then
      dest^ := arctan(arg2^/arg1^)+Pi
    else
      if arg1^>0 then
        dest^ := arctan(arg2^/arg1^)
      else
        if arg2^ > 0 then
          dest^ := 0.5 * Pi
        else
          dest^:= -0.5 * Pi;
end;

procedure _cosh(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := (exp(arg1^)+exp(-arg1^))*0.5;
end;

procedure _sinh(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^:= (exp(arg1^)-exp(-arg1^))*0.5;
end;

procedure _radius(AnOp: POperation); far;
begin
  with AnOp^ do
    dest^ := sqrt(sqr(arg1^)+sqr(arg2^));
end;


procedure _tangens(AnOp: POperation); far;
begin
  with AnOp^ do
  {$IFNDEF UseMath}
    dest^ := sin(arg1^) / cos(arg1^);
  {$ELSE}
    dest^ := tan(arg1^);
  {$ENDIF}
end;


{TParser}

function TCustomParser.ParseExpression(const AnExpression: string):boolean;
var
  OperationLoop: POperation;
begin
  FreeExpression;

  if AnExpression <> '' then
  begin
    Result := false;

    FExpression := AnExpression;
    try
      ParseFunction( AnExpression,

                     FVariables,

                     FunctionOne,
                     FunctionTwo,

                     FPascalNumberformat,

                     FStartOperationList,
                     FNumberOperators,
                     Result);

      FParserError := Result;

    except
      on E:Exception do
      begin
        FParserError := true;

        if Assigned(FOnParserError) then
        begin
          FOnParserError(Self, E);
          exit;
        end
        else
          raise;
      end;
    end;

    Result := not Result;

    OperationLoop := FStartOperationList;
    while OperationLoop <> nil do
    begin
      with OperationLoop^ do
      begin
        case Token of

          variab,
          constant,
          brack:         Operation :=_nothing;

          minus:         Operation :=_negate;

          sum:           Operation :=_add;
          diff:          Operation :=_subtract;
          prod:          Operation :=_multiply;
          divis:         Operation :=_RealDivide;
          modulo:        Operation :=_Modulo;
          intdiv:        Operation :=_IntDiv;

          integerpower:  Operation :=_intpower;
          realpower:     Operation :=_RealPower;

          square:        Operation :=_square;
          third:         Operation :=_third;
          fourth:        Operation :=_forth;

          FuncOneVar, FuncTwoVar:    { job has been done in build already !};
        end; {case}

        OperationLoop := NextOperation;
      end; {with OperationLoop^}

    end; {while OperationLoop<>nil}
  end;
end;

constructor TCustomParser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FPascalNumberformat := true;

  FVariables := TStringList.Create;
  with FVariables do
  begin
    Sorted := true;
    Duplicates := dupIgnore;
  end;

  FunctionOne := TStringList.Create;
  with FunctionOne do
  begin
    Sorted := true;
    Duplicates := dupError;
  end;

  FunctionTwo := TStringList.Create;
  with FunctionTwo do
  begin
    Sorted := true;
    Duplicates := dupError;
  end;

end;

destructor TCustomParser.Destroy;
begin
  FreeExpression;

  ClearVariables;
  FVariables.Free;

  FunctionOne.Free;
  FunctionTwo.Free;

  inherited Destroy;
end;




procedure TCustomParser.SetVar(const VarName: string; Value: ParserFloat);
begin
  SetVariable(VarName, Value);
end;

function TCustomParser.SetVariable(VarName: string; Value: ParserFloat): PParserFloat;
const
  { perhaps one could use "%" for MOD and remove DIV
    ( o1 div o2 <=> trunc(trunc(o1)/trunc(o2)) ) }
  MathOperators : array [0..6] of string[3] = ( '+', '*', '-', '/', '^', 'MOD', 'DIV' );
var
  i: integer;
  v: PParserFloat;
begin
  { is the variable name a valid identifier? }
  if not IsValidIdent(VarName) then
    raise EBadName.Create(VarName);

  { always convert to uppercase }
  VarName := UpperCase(VarName);

  { check whether the variable contains any of the operators (DIV and MOD)
    this would confuse the parser... }
  for i := low(MathOperators) to high(MathOperators) do
  begin
    if pos(MathOperators[i], Varname) <> 0 then
      raise EBadName.Create(VarName);
  end;

  with FVariables do
    if Find(VarName, i) then
    begin
      Result := PParserFloat(Objects[i]);
      Result^ := Value
    end
    else
    begin
      if Length(Varname) = 1 then
        case VarName[1] of
          'A': v := @FA;
          'B': v := @FB;
          'C': v := @FC;
          'D': v := @FD;
          'E': v := @FE;
          'T': v := @FT;
          'X': v := @FX;
          'Y': v := @FY;
        else { case }
          new(v);
        end { case }
      else
        new(v);

      v^ := Value;

      AddObject(VarName, TObject(v));
      Result := v;
    end
end;

function TCustomParser.GetVariable(const VarName: string): ParserFloat;
var
  i: integer;
begin
  with FVariables do
    if Find(VarName, i) then
      Result := PParserFloat(objects[i])^
    else
      Result := 0.0;
end;

procedure TCustomParser.AddFunctionOneParam(const AFunctionName: string; Func: TFuncPrototype);
begin
  if IsValidIdent(AFunctionName) then
    FunctionOne.AddObject(AFunctionName, TObject(@Func))
  else
    raise EBadName.Create(AFunctionName);
end;

procedure TCustomParser.AddFunctionTwoParam(const AFunctionName: string; Func: TFuncPrototype);
begin
  if IsValidIdent(AFunctionName) then
    FunctionTwo.AddObject(AFunctionName, TObject(@Func))
  else
    raise EBadName.Create(AFunctionName);
end;

procedure TCustomParser.ClearVariables;
var
  i : integer;
begin
  with FVariables do
  begin
    for i := 0 to pred(count) do
      if (Length(Strings[i]) <> 1) or
         (not (Strings[i][1] in ['A','B','C','D','E','T','X','Y'])) then
        if PParserFloat(Objects[i]) <> nil then
          dispose( PParserFloat(Objects[i]) ); { dispose only user-defined variables }

    Clear;
  end;

  SetExpression(''); { invalidate expression }
end;

procedure TCustomParser.ClearVariable(const AVarName: string);
var
  index: integer;
begin
  with FVariables do
  begin
    index := IndexOf(AVarName);
    if index <> -1 then
    begin
      if (Length(AVarName) <> 1) and
         (not (AVarName[1] in ['A','B','C','D','E','T','X','Y'])) then
        dispose( PParserFloat(Objects[index]) ); { dispose only user-defined variables }

      Delete(index);
    end;
  end;

  SetExpression(''); { invalidate expression }
end;

procedure TCustomParser.ClearFunctions;
begin
  FunctionOne.Clear;
  FunctionTwo.Clear;

  SetExpression(''); { invalidate expression }
end;

procedure TCustomParser.ClearFunction(const AFunctionName: string);
var
  index: integer;
begin
  with FunctionOne do
  begin
    index := IndexOf(AFunctionName);
    if index <> -1 then
    begin
      Delete(index);
      SetExpression(''); { invalidate expression }
      exit;
    end;
  end;

  with FunctionTwo do
  begin
    index := IndexOf(AFunctionName);
    if index <> -1 then
    begin
      Delete(index);
      SetExpression(''); { invalidate expression }
    end;
  end;
end;


procedure TCustomParser.FreeExpression;
var
  LastOP,
  NextOP : POperation;
begin
  LastOP := FStartOperationList;

  while LastOP <> nil do
  begin
    NextOP := LastOP^.NextOperation;

    while NextOP <> nil do
      with NextOP^ do
      begin
        if Arg1 = lastop^.Arg1 then Arg1:=nil;
        if Arg2 = lastop^.Arg1 then Arg2:=nil;
        if Dest = lastop^.Arg1 then Dest:=nil;
        if Arg1 = lastop^.Arg2 then Arg1:=nil;
        if Arg2 = lastop^.Arg2 then Arg2:=nil;
        if Dest = lastop^.Arg2 then Dest:=nil;
        if Arg1 = lastop^.Dest then Arg1:=nil;
        if Arg2 = lastop^.Dest then Arg2:=nil;
        if Dest = lastop^.Dest then Dest:=nil;

        NextOP :=NextOperation;
      end;

    with LastOP^ do
    begin
      if FVariables.IndexOfObject( TObject(Arg1)) <> -1 then Arg1:=nil;
      if FVariables.IndexOfObject( TObject(Arg2)) <> -1 then Arg2:=nil;
      if FVariables.IndexOfObject( TObject(Dest)) <> -1 then Dest:=nil;

      if (Dest<>nil) and (Dest<>Arg2) and (Dest<>Arg1) then
         dispose(Dest);

      if (Arg2<>nil) and (Arg2<>Arg1) then
         dispose(Arg2);

      if (Arg1<>nil) then
         dispose(Arg1);
    end;

    NextOP:=LastOP^.NextOperation;
    dispose(LastOP);
    LastOP:=NextOP;
  end;

  FStartOperationList := nil;
end;

procedure TCustomParser.SetExpression(const AnExpression: string);
begin
  FreeExpression;

  if AnExpression <> '' then
    ParseExpression(AnExpression); { this implies FExpression := AnExpression }
end;


function TCustomParser.CalcValue: ParserFloat;
var
  LastOP: POperation;
begin
  if FStartOperationList <> nil then
  begin
    LastOP := FStartOperationList;

    while LastOP^.NextOperation <> nil do
    begin
      with LastOP^ do
      begin
        Operation(LastOP);
        LastOP := NextOperation;
      end;
    end;
    LastOP^.Operation(LastOP);

    Result := LastOP^.Dest^;
  end
  else
    Result := 0;
end;


{ TParser }

constructor TParser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  with FVariables do
  begin
    AddObject( 'A', TObject(@FA));
    AddObject( 'B', TObject(@FB));
    AddObject( 'C', TObject(@FC));
    AddObject( 'D', TObject(@FD));
    AddObject( 'E', TObject(@FE));
    AddObject( 'X', TObject(@FX));
    AddObject( 'Y', TObject(@FY));
    AddObject( 'T', TObject(@FT));
  end;

  with FunctionOne do
  begin
    AddObject('TAN', TObject(@_tangens));
    AddObject('COS', TObject(@_cos));
    AddObject('SIN', TObject(@_sin));
    AddObject('SINH', TObject(@_sinh));
    AddObject('COSH', TObject(@_cosh));
    AddObject('ARCTAN', TObject(@_arctan));

    AddObject('EXP', TObject(@_exp));
    AddObject('LN', TObject(@_ln));

    AddObject('SQR', TObject(@_square));
    AddObject('SQRT', TObject(@_sqrt));
    AddObject('ABS', TObject(@_abs));
    AddObject('HEAV', TObject(@_heaviside));
    AddObject('SIGN', TObject(@_sign));
    AddObject('ZERO', TObject(@_zero));
    AddObject('PH', TObject(@_phase));
    AddObject('RND', TObject(@_rnd));

  end;

  with FunctionTwo do
  begin
    AddObject('TRUNC', TObject(@_trunc));
    AddObject('MAX', TObject(@_max));
    AddObject('MIN', TObject(@_min));
    AddObject('ROUND', TObject(@_round));
    AddObject('DIFDIAS', TObject(@_difdias));
    AddObject('DIFMESES', TObject(@_difmeses));
    AddObject('DIFANOS', TObject(@_difanos));
    AddObject('EDIA', TObject(@_edia));
    AddObject('EMES', TObject(@_emes));
    AddObject('EANO', TObject(@_eano));
  end;
end;


class function TParser.RemoveBlanks(const s: string): string;
{deletes all blanks in s}
var
  i : integer;
begin
  Result := s;

  i := pos(' ', Result);
  while i > 0 do
  begin
    delete(Result, i, 1);
    i := pos(' ' ,Result);
  end;
end;

end.
