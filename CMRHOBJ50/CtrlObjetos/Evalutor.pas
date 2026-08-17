unit evalutor;

interface

uses Math,SysUtils,dialogs,Classes;

function Evaluate(Express:string; ShowError: Boolean = False):extended; overload;
function Evaluate(const A:array of extended;Express:string):extended; overload;
function CheckFormula(Express:string):boolean;
function EvaluateBoolean(sCondicao: String): Boolean;
procedure EvaluateCond(var sCondicao: String; Items: String; xString: TStringList);
function iif(pCondicao: Boolean; pRetornoTrue:Variant; pRetornoFalse:Variant):Variant;
function Rat(OQue,Onde: String): Integer;
function Padr(Caracter:String; Qtd:Integer; CharRight:Char = ' '):String;
function ResolveSimple(Expression: String; xString: TStringList): String;
function ResolveDataType(Data: String): String;
Function RoundEval( Valor: Extended; Decimais: Integer ): Extended;

implementation

function Parse(sExpressao: String; sChar: String = ' '; Branco: Boolean = False): TStringList;
var
  Lista: TStringList;
  i: Integer;
  sTemp: String;
begin
  sExpressao := Trim(sExpressao) + sChar;

  Lista := TStringlist.Create;
  sTemp := '';

  i := 1;
  while i <= Length(sExpressao) do begin
    if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
      Inc(i,Length(sChar)-1);

      if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
        Lista.Add(sTemp);
      end;
      sTemp := '';
    end else begin
      sTemp := sTemp + Copy(sExpressao, i, 1);
    end;

    Inc(i);
  end;
  Result := Lista;

end;

function Evaluate(Express:string; ShowError: Boolean = False):extended; overload;
var
  a: array of extended;
begin
  SetLength(a,0);
  try
    Result := Evaluate(a,StringReplace(Express,' ','',[rfReplaceAll]));
  except
    on e:Exception do begin
      if (ShowError) then begin
        raise;
      end;

      Result := 0;
    end;
  end;
end;

function CheckFormula(Express:string):boolean;
var i,c:integer;
begin
c:=0;
for i:=1 to Length(Express) do
 if Express[i]='(' then inc(c) else
  if Express[i]=')' then dec(c);
if c=0 then Result:=true else Result:=false;
end;

function Evaluate(const A:array of extended;Express:string):extended; overload;
var
  position,i,par:integer;
  w,ar :string;
  arg,s: String;
  args : TStringList;
  decimais, AuxExpres: string; //BRUNO AZEVEDO
  j, iPos, iTam: integer; //BRUNO AZEVEDO
  sFrac, sInt : string;     //edilaine WO8831

function CutBeforeDelemiter(Express:string;position:integer):string;
begin
result:=copy(Express,1,position-1);
end;

function CutAfterDelemiter(Express:string;position:integer):string;
begin
result:=copy(Express,position+1,length(Express)-position);
end;

function FindNextBracketDR(Express:string;position:integer):integer;
var count:integer;
begin
count:=0;
inc(position);
while (count>=0) and ((position<=length(Express)) or (position<>0)) do
 begin
 if Express[position]='(' then inc(count) else if Express[position]=')' then dec(count);
 inc(position);
 end;
//if count=0 then
 result:=position-1

//else Raise EMathError.Create('Несоответствие количества открытых и закрытых скобок.');
end;

function FindNextBracketDL(Express:string;position:integer):integer;
var count:integer;
begin
count:=0;
dec(position);
while (count>=0) and ((position<=length(Express)) or (position<>0)) do
 begin
 if Express[position]=')' then inc(count) else if Express[position]='(' then dec(count);
 dec(position);
 end;
//if count=0 then
result:=position+1
//else Raise EMathError.Create('Несоответствие количества открытых и закрытых скобок.');
end;

function CheckLimitBrackets(Express:string):boolean;
begin
result:=false;
if Express[1]='(' then
   if FindNextBracketDR(Express,1)=length(Express) then
      result:=true
   else
      result:=false;

end;

function DeleteLimitBrackets(Express:string):string;
begin
if CheckLimitBrackets(Express) then
   result:=copy(Express,2,length(Express)-2)
else
   result:=Express;
end;

function Find1stLevelDelemiter(Express:string):integer;
var position,
    len:integer;
begin
position:=1;
len:=length(Express);
if express[position] in ['-','+'] then inc(position) else if express[position]='(' then position:=FindNextBracketDR(Express,position);
while not(Express[position] in ['+','-']) and (position<=len) do begin
  inc(position);
  if Express[position] in ['-','+'] then begin
    if Express[position-1] in ['+','-','*','/'] then inc(position);
  end else if Express[position]='(' then position:=FindNextBracketDR(Express,position);
end;
if position<len then result:=position else result:=0;
end;

function Find2ndLevelDelemiter(Express:string):integer;
var position:integer;
begin
position:=length(Express);
if Express[position]=')' then position:=FindNextBracketDL(Express,position);
while not(Express[position] in ['*','/','^']) and (position>1) do
 begin
 dec(position);
 if Express[position]=')' then position:=FindNextBracketDL(Express,position);
 end;
if position>1 then result:=position else result:=0;
end;

function Findword(Express:string;var arguments:string):string;
var position,
    len:integer;
begin
position:=1;
result:='';
len:=length(Express);
while (Express[position] in ['0'..'9','A'..'Z','a'..'z']) and (position<=len) do
 begin
 result:=result+Express[position];
 inc(position);
 end;
if position<len then arguments:=CutAfterDelemiter(Express,position-1) else arguments:='';
end;

begin
  //BRUNO AZEVEDO - DOUGLAS E MARCIO SANCHES - TRATAMENTO DA EXPRESSГO -- E QUEBAR DE LINHA
  if (pos(#$D, Express) > 0) then begin
    AuxExpres := '';
    iPos := 0;
    iTam := 0;
    repeat
      if (iTam = 0) then begin
        iTam := (pos(#$D, Express)-1) - (iPos);
      end else begin
        iTam := (pos(#$D, Express)) - (iPos);
      end;
      AuxExpres := AuxExpres + Copy(Express,iPos,iTam);
      iPos := pos(#$D, Express);
      Express := StringReplace(Express, #$D, '', []);
    until (pos(#$D, Express) = 0);
    AuxExpres := AuxExpres + Copy(Express,iPos,Length(Express)-1);

    Express := AuxExpres;
  end;

  Express := StringReplace(Express, '--', '+', [rfReplaceAll]);
  //BRUNO AZEVEDO - FIM TRATAMENTO DA EXPRESSГO -- E QUEBAR DE LINHA
  
  result := 0;
  Express:=DeleteLimitBrackets(Express);
  position:=Find1stLevelDelemiter(Express);
  if position>0 then begin
    if Express[position]='+' then begin
      result:=evaluate(A,CutBeforeDelemiter(Express,position))+evaluate(A,CutAfterDelemiter(Express,position))
    end else if Express[position]='-' then begin
      result:=evaluate(A,CutBeforeDelemiter(Express,position))+evaluate(A,CutAfterDelemiter(Express,position-1));
    end;

  end else begin

    position:=Find2ndLevelDelemiter(Express);
    if position>0 then begin
      if Express[position]='*' then begin
        result:=evaluate(A,CutBeforeDelemiter(Express,position))*evaluate(A,CutAfterDelemiter(Express,position))
      end else if Express[position]='/' then begin
        result:=evaluate(A,CutBeforeDelemiter(Express,position))/evaluate(A,CutAfterDelemiter(Express,position))
      end else if Express[position]='^' then begin
        result:=power(evaluate(A,CutBeforeDelemiter(Express,position)),evaluate(A,CutAfterDelemiter(Express,position)));
      end;

    end else begin

      if CheckLimitBrackets(Express) then begin
        result:=Evaluate(A,DeleteLimitBrackets(Express))
      end else begin
        if Express[1]='-' then begin
          result:=-Evaluate(A,CutAfterDelemiter(Express,1))
        //BRUNO AZEVEDO - AJUSTES PARA O SINAL DE +
        end else if Express[1]='+' then begin
          result:=Evaluate(A,CutAfterDelemiter(Express,1))
        //BRUNO AZEVEDO - FIM AJUSTES PARA O SINAL DE +
        end else begin

          // CRIA LISTA DE ARGUMENTOS
          w := uppercase(findword(Express,ar));
          arg  := Copy(ar,2,Length(ar)-2);

          par  := 0;
          s    := '';
          args := TStringList.Create;
          for i := 1 to Length(arg) do begin
            if (i = Length(arg)) or (arg[i] = ';') and (par = 0) then begin

              if (i = Length(arg)) then begin
                s := s + arg[i];
              end;

              args.Add(s);
              s := '';
            end else begin
              s := s + arg[i];

              if (arg[i] = '(') then begin
                Inc(par);
              end else if (arg[i] = ')') then begin
                Dec(par);
              end;

            end;
          end;

          if w='SIN' then result:=sin(evaluate(A,ar)) else
          if w='COS' then result:=cos(evaluate(A,ar)) else
          if w='TAN' then result:=tan(evaluate(A,ar)) else
          if w='EXP' then result:=exp(evaluate(A,ar)) else
          if w='ABS' then result:=abs(evaluate(A,ar)) else
          if w='ARCTAN' then result:=arctan(evaluate(A,ar)) else
          if w='ARCSIN' then result:=arcsin(evaluate(A,ar)) else
          if w='LN' then result:=ln(evaluate(A,ar)) else
          if w='LOG' then result:=log10(evaluate(A,ar)) else
          if w='SQR' then result:=sqr(evaluate(A,ar)) else
          if w='SQRT' then result:=sqrt(evaluate(A,ar)) else
          if w='INT' then result:=int(evaluate(A,ar)) else
          if w='FRAC' then result:=frac(evaluate(A,ar)) else
          if w='PI' then result:=pi else
          if w='MAIOR' then result:=max(evaluate(A,args[0]),evaluate(A,args[1])) else
          if w='MENOR' then result:=min(evaluate(A,args[0]),evaluate(A,args[1])) else
          if UpperCase(w)='R' then result:=a[0] else
          if UpperCase(w)='X' then result:=a[1] else
          if UpperCase(w)='G' then result:=a[2] else
          if UpperCase(w)='B' then result:=a[3] else
          if UpperCase(w)='E' then result:=a[4] else
          if UpperCase(w)='EF' then result:=a[5] else
          if UpperCase(w)='KR' then result:=a[6] else
          if UpperCase(w)='KI' then result:=a[7] else
          if UpperCase(w)='SUM' then result:=a[8] else
          if Uppercase(w[1])='P' then result:=a[9+strtoint(copy(w,2,length(w)-1))] else
          //BRUNO AZEVEDO - TRATAMENTO CONDICIONAL, DE DATA E DE ROUND
          if w = 'IF' then begin
            if (args.Count = 2) then begin
              result:=iif(EvaluateBoolean(args[0]),evaluate(A,args[1]),0)
            end else begin
              result:=iif(EvaluateBoolean(args[0]),evaluate(A,args[1]),evaluate(A,args[2]))
            end;
          end else if w = 'DATE' then begin
            if ((Trim(args[0]) <> '') and (Trim(args[1]) <> '') and (Trim(args[2]) <> '')) then begin
              result := StrToDate(args[2]+'/'+args[1]+'/'+args[0]);
            end else begin
              result := 0;
            end;
          end else if w = 'ROUND' then begin
            decimais := Padr('0', StrToInt(args[1]), '0');
            result := StrToFloat(FormatFloat('0.'+decimais, evaluate(A,args[0])));
          //BRUNO AZEVEDO - FIM TRATAMENTO CONDICIONAL, DE DATA E DE ROUND

          //edilaine WO8831 : inicio
          end else if w = 'TRUNC' then begin

            result := evaluate(A,args[0]);

            sFrac  := FloatToStr(Frac(result));
            if sFrac > '0' then
            begin
              iTam := length(copy(sFrac, 3, length(sFrac)));
              if (iTam > StrToInt(args[1])) then
              begin
                sFrac  := FloatToStr(Trunc(result)) + ',' + copy(sFrac, 3, StrToInt(args[1]));
                result := StrToFloat(sFrac)
              end
              else
              begin
                decimais := Padr('0', StrToInt(args[1]), '0');
                result := StrToFloat(FormatFloat('0.'+decimais, result));
              end;
            end
            else
            begin
              decimais := Padr('0', StrToInt(args[1]), '0');
              result := StrToFloat(FormatFloat('0.'+decimais, result));
            end;
          end else begin
          //edilaine WO8831 : fim

            try
              result:=strtofloat(Express);
            except
              on E: EConvertError do begin
                raise;
//            ShowMessage(E.ClassName + #13 + E.Message);
                result:=0;
              end;
            end;
          end;

          args.Free;
        end;
      end;
    end;
  end;
end;

function EvaluateBoolean(sCondicao: String): Boolean;
var
  sTemp: String;
  ToDo: Boolean;
  xString: TStringList;
  sPart: String;
  sResult: String;
begin
  xString := TStringList.Create;

  // JUNTA AS STRINGS
  sTemp := sCondicao;
  ToDo  := Pos('"',sTemp) > 0;
  while (ToDo) do begin
    sTemp := Copy(sTemp,Pos('"',sTemp)+1,Length(sTemp));
    xString.Add('"'+Copy(sTemp,1,Pos('"',sTemp)-1)+'"');
    sTemp := Copy(sTemp,Pos('"',sTemp)+1,Length(sTemp));

    sCondicao := StringReplace(sCondicao,xString[xString.Count-1],'#'+IntToStr(xString.Count-1),[]);

    ToDo := Pos('"',sTemp) > 0;
  end;

  // A PRIORIDADE SAO OS PARENTESES
  while (Pos(')',sCondicao) > 0) do begin

    sPart := Copy(sCondicao,1,Pos(')',sCondicao));
    sPart := Copy(sPart,Rat('(',sPart),Length(sPart));

    sResult := StringReplace(sPart  ,')','',[]);
    sResult := StringReplace(sResult,'(','',[]);
    EvaluateCond(sResult,'>=|<=|<>|=|>|<|LK',xString);
    EvaluateCond(sResult,' NOT '            ,xString);
    EvaluateCond(sResult,' AND '            ,xString);
    EvaluateCond(sResult,' OR '             ,xString);

    sCondicao := StringReplace(sCondicao,sPart,sResult,[]);
  end;

  EvaluateCond(sCondicao,'>=|<=|<>|=|>|<|LK',xString);
  EvaluateCond(sCondicao,' NOT '            ,xString);
  EvaluateCond(sCondicao,' AND '            ,xString);
  EvaluateCond(sCondicao,' OR '             ,xString);

  Result := iif(Trim(sCondicao)='T',True,False);

  xString.Free;

end;

procedure EvaluateCond(var sCondicao: String; Items: String; xString: TStringList);
var
  i,x: Integer;
  xParse: TStringList;
  s1,s2: String;
  iArg: Integer;
  Expr: String;
  iIni,iFim: Integer;

  //BRUNO AZEVEDO
  a: array of extended;
begin
  xParse := Parse(Items,'|');

  sCondicao := ' ' + Trim(sCondicao) + ' ';

//  while (Length(sCondicao) <> 1) do begin

    for i := 1 to Length(sCondicao) do begin

      Expr := '';
      iArg := 0;
      for x := 0 to xParse.Count - 1 do begin

        if (Copy(UpperCase(sCondicao),i,Length(xParse[x])) = UpperCase(xParse[x])) then begin
          iArg := i + Length(xParse[x]) - 1;
          Expr := xParse[x];

          Break;
        end;

      end;

      if (Expr <> '') then begin

        // PROCURA O PRIMEIRO ARGUMENTO
        s1 := '';
        if (Trim(Expr) <> 'NOT') then begin
          x := i-1;
          while (sCondicao[x] = ' ') and (x > 1) do begin
            Dec(x);
          end;
          while (sCondicao[x] <> ' ') do begin
            s1 := sCondicao[x] + s1;
            Dec(x);
          end;
          iIni := x;

//          s1 := ResultadoExpressao(s1,xRAC);
          if (s1 = '') then begin
            s1 := '""';
          end;
        end else begin
          iIni := i;
        end;

        // PROCURA O SEGUNDO ARGUMENTO
        s2 := '';
        x := iArg+1;
        while (sCondicao[x] = ' ') do begin
          Inc(x);
        end;
        while (sCondicao[x] <> ' ') and (x < Length(sCondicao)) do begin
          s2 := s2 + sCondicao[x];
          Inc(x);
        end;
        if (s2 = '') then begin
          s2 := '""';
        end;

//        s2 := ResultadoExpressao(s2,xRAC);
        iFim := x;

        //BRUNO AZEVEDO - RESOLVER OS VALORES ANTES DE FAZER CONDIЗГO PARA CASO DE TER CALCULO
        if (pos('*',s1) > 0) or (pos('-',s1) > 0) or (pos('+',s1) > 0) or (pos('/',s1) > 0) then begin
          SetLength(a,0);
          s1 := FloatToStr(evaluate(a,s1));
        end;
        if (pos('*',s2) > 0) or (pos('-',s2) > 0) or (pos('+',s2) > 0) or (pos('/',s2) > 0) then begin
          SetLength(a,0);
          s2 := FloatToStr(evaluate(a,s2));
        end;
        //BRUNO AZEVEDO - FIM RESOLVER OS VALORES ANTES DE FAZER CONDIЗГO PARA CASO DE TER CALCULO

        sCondicao := StringReplace(sCondicao,Copy(sCondicao,iIni,iFim-iIni+1),' '+PadR(ResolveSimple(s1 + ' ' + Expr + ' ' + s2,xString),iFim-iIni,' '),[]);
      end;

    end;
    sCondicao := Trim(sCondicao);

//  end;

  xParse.Free;

end;

function iif(pCondicao: Boolean; pRetornoTrue:Variant; pRetornoFalse:Variant):Variant;
begin
  if (pCondicao) then begin
    result := pRetornoTrue;
  end else begin
    result := pRetornoFalse;
  end;
end;

function Rat(OQue,Onde: String):Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Length(Onde)-Length(Oque) downto 0 do begin
    if (Copy(Onde,i,Length(oQue)) = OQue) then begin
      result := i;
      Break;
    end;
  end;
end;

function Padr(Caracter:String; Qtd:Integer; CharRight:Char = ' '):String;
begin
  Caracter := Trim(Caracter);
  Result   := Copy(Caracter + (StringOfChar(CharRight, Qtd - Length(Caracter))), 1, Qtd);
end;

function ResolveSimple(Expression: String; xString: TStringList): String;
var
  i: Integer;
  xParse: TStringList;
  ResBool: Boolean;
begin
  xParse := Parse(Expression,' ');

  for i := 0 to xParse.Count - 1 do begin
    if (Copy(xParse[i],1,1) = '#') then begin
      xParse[i] := xString[StrToInt(Copy(xParse[i],2,Length(xParse[i])))]
    end;
  end;
  if (xParse.Count >= 1) then begin
    xParse[0] := StringReplace(xParse[0],#1,' ',[rfReplaceAll]);
  end;

  if (xParse.Count >= 3) then begin
    xParse[2] := StringReplace(xParse[2],#1,' ',[rfReplaceAll]);
  end;

  if (xParse[1] = '=') then begin
    try
      ResBool := StrToFloat(ResolveDataType(xParse[0])) = StrToFloat(ResolveDataType(xParse[2]));
    except
      ResBool := ResolveDataType(xParse[0]) = ResolveDataType(xParse[2]);
    end;

  end else if (xParse[1] = '>') then begin
    try
      ResBool := StrToFloat(ResolveDataType(xParse[0])) > StrToFloat(ResolveDataType(xParse[2]));
    except
      ResBool := ResolveDataType(xParse[0]) > ResolveDataType(xParse[2]);
    end;

  end else if (xParse[1] = '>=') then begin
    try
      ResBool := StrToFloat(ResolveDataType(xParse[0])) >= StrToFloat(ResolveDataType(xParse[2]));
    except
      ResBool := ResolveDataType(xParse[0]) >= ResolveDataType(xParse[2]);
    end;

  end else if (xParse[1] = '<') then begin
    try
      ResBool := StrToFloat(ResolveDataType(xParse[0])) < StrToFloat(ResolveDataType(xParse[2]));
    except
      ResBool := ResolveDataType(xParse[0]) < ResolveDataType(xParse[2]);
    end;

  end else if (xParse[1] = '<=') then begin
    try
      ResBool := StrToFloat(ResolveDataType(xParse[0])) <= StrToFloat(ResolveDataType(xParse[2]));
    except
      ResBool := ResolveDataType(xParse[0]) <= ResolveDataType(xParse[2]);
    end;

  end else if (xParse[1] = '<>') then begin
    try
      ResBool := StrToFloat(ResolveDataType(xParse[0])) <> StrToFloat(ResolveDataType(xParse[2]));
    except
      ResBool := ResolveDataType(xParse[0]) <> ResolveDataType(xParse[2]);
    end;

  end else if (xParse[1] = 'LK') then begin
    ResBool := Copy(ResolveDataType(xParse[0]),1,Length(ResolveDataType(xParse[2]))) = ResolveDataType(xParse[2]);

  end else if (xParse[1] = 'AND') then begin
    ResBool := iif(xParse[0]='T',True,False) and iif(xParse[2]='T',True,False);

  end else if (xParse[1] = 'OR') then begin
    ResBool := iif(xParse[0]='T',True,False) or  iif(xParse[2]='T',True,False);

  end else if (xParse[0] = 'NOT') then begin
    ResBool := iif(xParse[1]='T',False,True);

  end else begin
    ResBool := False;

  end;
  Result := iif(ResBool,'T','F');

  xParse.Free;

end;

function ResolveDataType(Data: String): String;
begin
  Result := Data;
  if (Copy(Result,1,1) = '"') then begin
    Result := Copy(Result,2,Length(Result));
    Result := Copy(Result,1,Length(Result)-1);
  end;

  try
//    Result := StrToFloat(Data);
  except
  end;
end;

Function RoundEval( Valor: Extended; Decimais: Integer ): Extended;
Begin
  Result := Round( Valor * Power( 10, Decimais ) ) / Power( 10, Decimais );
End;

end.
