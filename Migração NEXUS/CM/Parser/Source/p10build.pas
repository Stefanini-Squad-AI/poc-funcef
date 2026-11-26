unit P10Build;

{.$DEFINE DEBUG}

{$IFNDEF DEBUG}
  {$D-} {$L-} {$Q-} {$R-} {$S-}
{$ENDIF}

{$IFDEF Win32}
  {$H+,S-}
{$ENDIF}

{$I+} { I/O checking is always on... we want to know when we have a problem with memory! }

interface

uses
  Parser10,
  SysUtils, Classes;


procedure ParseFunction( FunctionString: string; { the unparsed string }
                         Variables: TStringlist; { list of variables }

                         { lists of available functions }
                         FunctionOne,               { functions with ONE argument, e.g. exp() }
                         FunctionTwo: TStringList;  { functions with TWO arguments, e.g. max(,) }

                         UsePascalNumbers: boolean; { true: -> Val; false: StrToFloat }

                         { return pointer to tree, number of performed operations and error state }
                         var FirstOP : POperation;
                         var NumberOperations : integer;
                         var Error : boolean);
                         { error actually is superfluous as we are now using exceptions }



implementation






const
  TokenOperators = [minus, sum, diff, prod, divis, modulo, IntDiv, integerpower, realpower];

type
  TermString = {$IFDEF Win32} string {$ELSE} PString {$ENDIF};


procedure ParseFunction( FunctionString:string;
                         Variables: TStringList;

                         FunctionOne,
                         FunctionTwo: TStringList;

                         UsePascalNumbers: boolean;

                         var FirstOP: POperation;
                         var NumberOperations: integer;
                         var Error: boolean);


          function CheckNumberBrackets(const s:string):boolean; forward;
          {checks whether # of '(' equ. # of ')'}

          function CheckNumber(const s:string; var FloatNumber: ParserFloat):boolean; forward;
          {checks whether s is a number}

          function CheckVariable(const s:string; var VariableID:integer): boolean; forward;
          {checks whether s is a variable string}

          function CheckBracket(const s:string; var s1:string) :boolean; forward;
          {checks whether s =(...(s1)...) and s1 is a valid term}



          function CheckNegate(const s:string; var s1:string) :boolean; forward;
          {checks whether s denotes the negative value of a valid operation}



          function CheckAdd(const s:string; var s1, s2:string) :boolean; forward;
          {checks whether '+' is the primary operation in s}

          function CheckSubtract(const s:string; var s1,s2:string): boolean; forward;
          {checks whether '-' is the primary operation in s}

          function CheckMultiply(const s:string; var s1,s2:string): boolean; forward;
          {checks whether '*' is the primary operation in s}

          function CheckIntegerDiv(const s:string; var s1,s2:string): boolean; forward;
          {checks whether 'DIV' is the primary TOperation in s}

          function CheckModulo(const s:string; var s1,s2:string): boolean; forward;
          {checks whether 'MOD' is the primary TOperation in s}

          function CheckRealDivision(const s:string; var s1,s2:string): boolean;  forward;
          {checks whether '/' is the primary operation in s}



          function CheckFuncTwoVar(const s:string; var s1,s2:string):boolean; forward;
          {checks whether s=f(s1,s2); s1,s2 being valid terms}

          function CheckFuncOneVar(const s:string; var s1:string; var fsort:TToken):boolean; forward;
          {checks whether s denotes the evaluation of a function fsort(s1)}



          function CheckIntPower(const s:string; var s1,s2:string): boolean; forward;
          {checks whether s=s1^s2, s2 integer}

          function CheckRealPower(const s:string; var s1,s2:string): boolean; forward;
          {checks whether s=s1^s2, s2 real}


          function CheckNumberBrackets(const s:string):boolean;
          {checks whether # of '(' equ. # of ')'}
          var
            counter,
            bracket : integer;
          begin
            bracket := 0;

            for counter := 1 to length(s) do
              if s[counter] ='(' then
                inc(bracket)
              else
                if s[counter] =')' then
                  dec(bracket);

            Result := bracket = 0;
          end;


          function CheckNumber(const s:string; var FloatNumber:ParserFloat):boolean;
          {checks whether s is a number}
          var
            code: integer;
          {$IFDEF Debug} { prevent debugger from showing conversion errors }
            SaveClass : TClass;
          {$ENDIF}
          begin
            if s = 'PI' then
            begin
              FloatNumber := Pi;
              Result := true;
            end
            else
            begin
              if UsePascalNumbers then
              begin
                val(s, FloatNumber, code);
                Result := code = 0;
              end
              else
              begin
                {$IFDEF Debug}
                SaveClass := ExceptionClass;
                ExceptionClass := Nil;
                try
                {$ENDIF}
                  try
                    FloatNumber := StrToFloat(s);
                    Result := true
                  except
                    Result := false;
                  end;
                {$IFDEF Debug}
                finally
                  ExceptionClass := SaveClass;
                end;
                {$ENDIF}
              end;
            end;
          end;


          function CheckVariable(const s:string; var VariableID:integer): boolean;
          {checks whether s is a variable string}
          begin
            VariableID := Variables.IndexOf(s);
            Result := VariableID <> -1;
          end;


          function CheckBracket(const s:string; var s1:string) :boolean;
          {checks whether s =(...(s1)...) and s1 is a valid term}
          var
            s2,s3:  TermString;
            FloatNumber:    ParserFloat;
            fsort:  TToken;
            VariableID:integer;
          begin
            Result := false;

            if length(s) = 0 then
              exit;

            {$IFNDEF Win32}
              s2 := nil;
              s3 := nil;
              new(s2);
              new(s3);
              try
            {$ENDIF}

            if (s[1]='(') and (s[length(s)]=')') then
            begin
              s1 := copy(s, 2, length(s)-2);

              if CheckNumber(s1, FloatNumber) or
                 CheckNegate(s1, s2{$IFNDEF Win32}^{$ENDIF}) or
                 CheckAdd(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckSubtract(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckMultiply(s1,s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckIntegerDiv(s1,s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckModulo(s1,s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckRealDivision(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckFuncTwoVar(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckFuncOneVar(s1, s2{$IFNDEF Win32}^{$ENDIF}, fsort) or
                 CheckVariable(s1, VariableID) or
                 CheckIntPower(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                 CheckRealPower(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF})
              then
                Result := true
              else
                if CheckBracket(s1, s2{$IFNDEF Win32}^{$ENDIF}) then
                begin
                  s1 := s2{$IFNDEF Win32}^{$ENDIF};
                  Result := true
                end;
            end;

            {$IFNDEF Win32}
              finally
                if assigned(s2) then dispose(s2);
                if assigned(s3) then dispose(s3);
              end;
            {$ENDIF}
          end;


          function CheckNegate(const s:string; var s1:string) :boolean;
          {checks whether s denotes the negative value of a valid TOperation}
          var
            s2,s3:   TermString;
            fsort:   TToken;
            VariableID: integer;
          begin
            Result := false;
            if (length(s)<>0) and (s[1]='-') then
            begin
              s1:=copy(s,2,length(s)-1);

              {$IFNDEF Win32}
                s2 := nil;
                s3 := nil;
                new(s2);
                new(s3);
                try
              {$ENDIF}

              if CheckBracket(s1, s2{$IFNDEF Win32}^{$ENDIF}) then
              begin
                s1 := s2{$IFNDEF Win32}^{$ENDIF};
                result := true
              end
              else
                Result :=
                  CheckVariable(s1, VariableID) or
                  CheckFuncOneVar(s1, s2{$IFNDEF Win32}^{$ENDIF}, fsort) or
                  CheckFuncTwoVar(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                  CheckIntPower(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF}) or
                  CheckRealPower(s1, s2{$IFNDEF Win32}^{$ENDIF}, s3{$IFNDEF Win32}^{$ENDIF});

              {$IFNDEF Win32}
                finally
                  if assigned(s2) then dispose(s2);
                  if assigned(s3) then dispose(s3);
                end;
              {$ENDIF}
            end;
          end;


          function CheckAdd(const s:string; var s1, s2:string) :boolean;
          {checks whether '+' is the primary TOperation in s}
          var
            s3,s4:     TermString;
            i,j:       integer;
            FloatNumber:       ParserFloat;
            fsort:     TToken;
            VariableID:   integer;
          begin
            Result:=false;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            i:=0;
            repeat

              j:=pos('+',copy(s,i+1,length(s)-i));

              if j > 0 then
              begin
                inc(i, j);
                if (i<length(s)) and (i>1) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+1,length(s)-i);

                  Result := CheckNumberBrackets(s1) and CheckNumberBrackets(s2);

                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or CheckNumber(s1,FloatNumber);

                    if not Result then
                    begin
                      Result := CheckBracket(s1, s3{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                        s1 := s3{$IFNDEF Win32}^{$ENDIF};
                    end;

                    if not Result then
                      Result := CheckNegate(s1, s3{$IFNDEF Win32}^{$ENDIF}) or
                                CheckSubtract(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckMultiply(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntegerDiv(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckModulo(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealDivision(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                CheckIntPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});

                    if Result then
                    begin
                      Result := CheckVariable(s2,VariableID) or
                                CheckNumber(s2,FloatNumber);
                      if not Result then
                      begin
                        Result := CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s2 := s3{$IFNDEF Win32}^{$ENDIF}
                        else
                          Result := CheckAdd(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckSubtract(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckMultiply(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntegerDiv(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckModulo(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealDivision(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                    CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                      end;
                    end;
                  end;
                end;
              end;
            until (j=0) or Result or (i>=length(s));

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}

          end;



          function CheckSubtract(const s:string; var s1,s2:string) :boolean;
          {checks whether '-' is the primary TOperation in s}
          var
            s3,s4:    TermString;
            i,j:      integer;
            FloatNumber:      ParserFloat;
            fsort:    TToken;
            VariableID:  integer;
          begin
            Result:=false;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            i:=0;
            repeat

              j:=pos('-',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                inc(i, j);
                if (i>1) and (i<length(s)) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+1,length(s)-i);

                  Result := CheckNumberBrackets(s1) and CheckNumberBrackets(s2);

                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or CheckNumber(s1,FloatNumber);

                    if not Result then
                    begin
                      Result := CheckBracket(s1, s3{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                        s1 := s3{$IFNDEF Win32}^{$ENDIF};
                    end;
                    if not Result then
                      Result := CheckNegate(s1, s3{$IFNDEF Win32}^{$ENDIF}) or
                                CheckSubtract(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckMultiply(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntegerDiv(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckModulo(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealDivision(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                CheckIntPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                    if Result then
                    begin
                      Result :=  CheckVariable(s2,VariableID) or
                                 CheckNumber(s2,FloatNumber);
                      if not Result then
                      begin
                         Result := CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});
                         if Result then
                           s2 := s3{$IFNDEF Win32}^{$ENDIF}
                         else
                           Result := CheckMultiply(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                   CheckIntegerDiv(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                   CheckModulo(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                   CheckRealDivision(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                   CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                   CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                   CheckIntPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                   CheckRealPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF})
                      end;
                    end;
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}

          end;


          function CheckMultiply(const s:string; var s1,s2:string): boolean;
          {checks whether '*' is the primary TOperation in s}
          var
            s3,s4:    TermString;
            i,j:      integer;
            FloatNumber:      ParserFloat;
            fsort:    TToken;
            VariableID:  integer;
          begin
            Result:=false;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            i:=0;
            repeat
              j:=pos('*',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                i:=i+j;
                if (i<length(s)) and (i>1) then
                begin
                  s1:=copy(s,1,i-1);  s2:=copy(s,i+1,length(s)-i);
                  Result := CheckNumberBrackets(s1) and CheckNumberBrackets(s2);
                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or
                              CheckNumber(s1,FloatNumber);


                    if not Result then
                    begin
                      Result := CheckBracket(s1, s3{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                        s1 := s3{$IFNDEF Win32}^{$ENDIF};
                    end;
                    if not Result then
                      Result := CheckNegate(s1, s3{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntegerDiv(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckModulo(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealDivision(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                    if Result then
                    begin
                      Result := CheckVariable(s2,VariableID) or
                                CheckNumber(s2,FloatNumber);
                      if not Result then begin
                        Result := CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s2 := s3{$IFNDEF Win32}^{$ENDIF}
                        else
                          Result := CheckMultiply(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntegerDiv(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckModulo(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealDivision(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                    CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF})
                      end
                    end
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}
          end;


          function CheckIntegerDiv(const s:string; var s1,s2:string): boolean;
          {checks whether 'DIV' is the primary TOperation in s}
          var s3,s4:  TermString;
              i,j:    integer;
              VariableID:integer;
              FloatNumber:    ParserFloat;
              fsort:  TToken;
          begin
            Result := false;
            i := 0;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            repeat
              j:=pos('DIV',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                i:=i+j;
                if (i<length(s)) and (i>1) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+3,length(s)-i-2);
                  Result := CheckNumberBrackets(s1) and CheckNumberBrackets(s2);
                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or
                              CheckNumber(s1,FloatNumber);

                    if not Result then
                    begin
                      Result := CheckBracket(s1, s3{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                        s1 := s3{$IFNDEF Win32}^{$ENDIF};
                    end;
                    if not Result then
                      Result := CheckNegate(s1, s3{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntegerDiv(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckModulo(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealDivision(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                    if Result then
                    begin
                      Result := CheckVariable(s2,VariableID) or
                                CheckNumber(s2,FloatNumber);
                      if not Result then
                      begin
                        Result := CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s2 := s3{$IFNDEF Win32}^{$ENDIF}
                        else
                          Result := CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF},fsort) or
                                    CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF})
                      end
                    end;
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}
          end;


          function CheckModulo(const s:string; var s1,s2:string): boolean;
          {checks whether 'MOD' is the primary TOperation in s}
          var s3,s4:  TermString;
              i,j:    integer;
              VariableID:integer;
              FloatNumber:    ParserFloat;
              fsort:  TToken;
          begin
            Result := false;
            i := 0;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            repeat
              j:=pos('MOD',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                i:=i+j;
                if (i<length(s)) and (i>1) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+3,length(s)-i-2);
                  Result := CheckNumberBrackets(s1) and CheckNumberBrackets(s2);
                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or
                              CheckNumber(s1,FloatNumber);

                    if not Result then
                    begin
                      Result := CheckBracket(s1, s3{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                        s1 := s3{$IFNDEF Win32}^{$ENDIF};
                    end;
                    if not Result then
                      Result := CheckNegate(s1, s3{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntegerDiv(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckModulo(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealDivision(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                    if Result then
                    begin
                      Result := CheckVariable(s2,VariableID) or
                                CheckNumber(s2,FloatNumber);
                      if not Result then
                      begin
                        Result := CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s2 := s3{$IFNDEF Win32}^{$ENDIF}
                        else
                          Result := CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF},fsort) or
                                    CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF})
                      end
                    end;
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}

          end;

          function CheckRealDivision(const s:string; var s1,s2:string): boolean;
          {checks whether '/' is the primary TOperation in s}
          var s3,s4:  TermString;
              i,j:    integer;
              VariableID:integer;
              FloatNumber:    ParserFloat;
              fsort:  TToken;
          begin
            Result := false;
            i := 0;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            repeat
              j:=pos('/',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                i:=i+j;
                if (i<length(s)) and (i>1) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+1,length(s)-i);
                  Result := CheckNumberBrackets(s1) and CheckNumberBrackets(s2);
                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or
                              CheckNumber(s1,FloatNumber);

                    if not Result then
                    begin
                      Result := CheckBracket(s1, s3{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                        s1 := s3{$IFNDEF Win32}^{$ENDIF};
                    end;
                    if not Result then
                      Result := CheckNegate(s1, s3{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntegerDiv(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckModulo(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealDivision(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckIntPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                CheckRealPower(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                    if Result then
                    begin
                      Result := CheckVariable(s2,VariableID) or
                                CheckNumber(s2,FloatNumber);
                      if not Result then
                      begin
                        Result := CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s2 := s3{$IFNDEF Win32}^{$ENDIF}
                        else
                          Result := CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF},fsort) or
                                    CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckIntPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF}) or
                                    CheckRealPower(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF})
                      end
                    end;
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}
          end;


          function CheckFuncTwoVar(const s:string; var s1,s2:string) :boolean;
          {checks whether s=f(s1,s2); s1,s2 being valid terms}

            function checkcomma(const s:string; var s1,s2:string) :boolean;
            var s3: TermString;
                i,j:integer;
            begin
              Result:=false;
              i:=0;

              {$IFNDEF Win32}
                s3 := nil;
                new(s3);
                try
              {$ENDIF}

              repeat
                j:=pos(',',copy(s,i+1,length(s)-i));
                if j>0 then
                begin
                  i:=i+j;
                  if (i<length(s)) and (i>1) then
                  begin
                    s1:=copy(s,1,i-1);
                    s2:=copy(s,i+1,length(s)-i);
                    s3{$IFNDEF Win32}^{$ENDIF}:='('+s1+')';
                    Result := CheckBracket(s3{$IFNDEF Win32}^{$ENDIF},s1);
                    if Result then
                    begin
                      s3{$IFNDEF Win32}^{$ENDIF} := '('+s2+')';
                      Result := CheckBracket(s3{$IFNDEF Win32}^{$ENDIF},s2);
                    end;
                  end;
                end;
              until Result or (i>=length(s)) or (j=0);

              {$IFNDEF Win32}
                finally
                  if assigned(s3) then dispose(s3);
                end;
              {$ENDIF}

            end;

            function CheckFun( const name: string): boolean;
            var
              l: integer;
              ss: TermString;
            begin
              Result := false;
              l := length(name);
              if copy( s, 1, l) = name then
              begin

                {$IFNDEF Win32}
                  ss := nil;
                  new(ss);
                  try
                {$ENDIF}

                ss{$IFNDEF Win32}^{$ENDIF} := copy(s,succ(l),length(s)-l);
                if (ss{$IFNDEF Win32}^{$ENDIF}[1]='(') and
                   (ss{$IFNDEF Win32}^{$ENDIF}[length(ss{$IFNDEF Win32}^{$ENDIF})]=')') then
                begin
                  ss{$IFNDEF Win32}^{$ENDIF} :=
                        copy(ss{$IFNDEF Win32}^{$ENDIF}, 2, length(ss{$IFNDEF Win32}^{$ENDIF})-2);
                  Result := checkcomma(ss{$IFNDEF Win32}^{$ENDIF}, s1, s2);
                end;

                {$IFNDEF Win32}
                  finally
                    if assigned(ss) then dispose(ss);
                  end;
                {$ENDIF}
              end;
            end;

          var
            counter : integer;
          begin
            counter := 0;
            with FunctionTwo do
              repeat
                Result := CheckFun(Strings[counter]);
                inc(counter);
              until Result or (counter = FunctionTwo.Count);
          end;


          function CheckFuncOneVar(const s:string; var s1:string; var fsort:TToken): boolean;
          {checks whether s denotes the evaluation of a function fsort(s1)}
          var
            s2 : TermString;

            function CheckFun(const name: string): boolean;
            var
              l: integer;
            begin
              Result := false;
              l := length(name);
              if copy(s, 1, l) = name then
              begin
                s2{$IFNDEF Win32}^{$ENDIF} := copy( s, succ(l), length(s)-l);
                Result := CheckBracket( s2{$IFNDEF Win32}^{$ENDIF}, s1);
              end;
            end;

          var
            s3,s4     :TermString;
            i,j       :integer;
            FloatNumber:ParserFloat;
            ffsort    :TToken;
            VariableID   :integer;

            counter : integer;
          begin

            {$IFNDEF Win32}
              s2 := nil;
              s3 := nil;
              s4 := nil;
              new(s2);
              new(s3);
              new(s4);
              try
            {$ENDIF}

            fsort := FuncOneVar;
            counter := 0;
            with FunctionOne do
              repeat
                Result := CheckFun(Strings[counter]);
                inc(counter);
              until Result or (counter = FunctionOne.Count);

            if not Result then
            begin
              i:=0;
              repeat
                j:=pos('^',copy(s,i+1,length(s)-i));
                if j>0 then
                begin
                  inc(i, j);
                  if i in [2..length(s)-1]  then
                  begin
                    s1:=copy(s,1,i-1);
                    s2{$IFNDEF Win32}^{$ENDIF}:=copy(s,i+1,length(s)-i);
                    Result := CheckNumberBrackets(s1) and
                              CheckNumberBrackets(s2{$IFNDEF Win32}^{$ENDIF});

                    if Result then
                    begin
                      Result := CheckVariable(s1,VariableID);
                      if not Result then
                      begin
                        Result := CheckBracket(s1,s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s1 := s3{$IFNDEF Win32}^{$ENDIF};
                      end;

                      if not Result then
                        Result := CheckNumber(s1, FloatNumber) or
                                  CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, ffsort) or
                                  CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                      if Result then
                      begin
                        Result := CheckNumber(s2{$IFNDEF Win32}^{$ENDIF}, FloatNumber);

                        if Result and (Abs(FloatNumber) < MaxInt) then
                        begin
                           counter := trunc(FloatNumber);
                           if (counter <> FloatNumber) or (counter < 0) then
                             Result:=false
                           else
                             case counter of
                               2:fsort:=square;
                               3:fsort:=third;
                               4:fsort:=fourth;
                             else
                               Result:=false;
                             end;
                        end;
                      end;
                    end;
                  end;
                end;
              until (j=0) or Result or (i>=length(s));
            end;

            {$IFNDEF Win32}
              finally
                if assigned(s2) then dispose(s2);
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}

          end;

          function CheckIntPower(const s:string; var s1,s2:string) :boolean;
          {checks whether s=s1^s2, s2 integer}
          var
            s3,s4   :TermString;
            i,j     :integer;
            FloatNumber     :ParserFloat;
            fsort   :TToken;
            VariableID :integer;
          begin
            Result:=false;
            i:=0;

            {$IFNDEF Win32}
              s3 := nil;
              s3 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}


            repeat
              j:=pos('^',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                i:=i+j;
                if (1<i) and (i<length(s)) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+1,length(s)-i);
                  Result := CheckNumberBrackets(s1) and
                            CheckNumberBrackets(s2);
                  if Result then
                  begin
                    Result := CheckVariable(s1,VariableID) or
                              CheckBracket(s1,s3{$IFNDEF Win32}^{$ENDIF});


                    { Bug fix "e^1" vs. "(e)^1" for 9.01 by Thomas

                     s3 only contains a valid value, if "CheckBracket" has been
                     executed; "CheckBracket" only will be called if
                     a call to "CheckVariable" was not successful, so that
                     VariableID = -1
                     Thus an additional test for "(VariableID=-1)" is one possible
                     solution for the problem }
                    if Result and (VariableID=-1) then
                      s1 := s3{$IFNDEF Win32}^{$ENDIF};
                  end;
                  if not Result then
                    Result := CheckNumber(s1, FloatNumber) or
                              CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                              CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});

                  if Result then
                  begin
                    Result := CheckNumber(s2, FloatNumber);
                    if Result then
                      if (trunc(FloatNumber)<>FloatNumber) then
                        Result :=false
                      else
                        if (trunc(FloatNumber)>=2) and (trunc(FloatNumber)<=4) then
                          Result :=false;
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}

          end;

          function CheckRealPower(const s:string; var s1,s2: string ) :boolean;
          {checks whether s=s1^s2, s2 real}
          var
            i,j   :integer;
            FloatNumber   :ParserFloat;
            s3,s4 :TermString;
            fsort :TToken;
            VariableID:integer;
          begin
            Result:=false;
            i:=0;

            {$IFNDEF Win32}
              s3 := nil;
              s4 := nil;
              new(s3);
              new(s4);
              try
            {$ENDIF}

            repeat
              j:=pos('^',copy(s,i+1,length(s)-i));
              if j>0 then
              begin
                i:=i+j;
                if (1<i) and (i<length(s)) then
                begin
                  s1:=copy(s,1,i-1);
                  s2:=copy(s,i+1,length(s)-i);
                  Result := CheckNumberBrackets(s1) and
                            CheckNumberBrackets(s2);
                  if Result then
                  begin
                     Result := CheckVariable(s1,VariableID) or
                               CheckNumber(s1,FloatNumber);
                     if not Result then
                     begin
                        Result := CheckBracket(s1,s3{$IFNDEF Win32}^{$ENDIF});
                        if Result then
                          s1:=s3{$IFNDEF Win32}^{$ENDIF};
                     end;

                     if not Result then
                        Result := CheckFuncOneVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                  CheckFuncTwoVar(s1, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});

                     if Result then
                     begin
                       Result := CheckNumber(s2, FloatNumber);
                       if Result then
                       begin
                         if trunc(FloatNumber)=FloatNumber then
                           Result:=false
                       end
                       else
                       begin
                          Result := CheckVariable(s2,VariableID) or
                                    CheckBracket(s2, s3{$IFNDEF Win32}^{$ENDIF});

                          { bugfix 9.01; added test for VariableID; explanation see
                            the equivalent code in CheckIntPower }
                          if Result and (VariableID=-1) then
                            s2:=s3{$IFNDEF Win32}^{$ENDIF}
                          else if not Result then { bugfix 9.01: added "if not result then "}
                            Result := CheckFuncOneVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, fsort) or
                                      CheckFuncTwoVar(s2, s3{$IFNDEF Win32}^{$ENDIF}, s4{$IFNDEF Win32}^{$ENDIF});
                       end
                     end;
                  end;
                end;
              end;
            until Result or (i>=length(s)) or (j=0);

            {$IFNDEF Win32}
              finally
                if assigned(s3) then dispose(s3);
                if assigned(s4) then dispose(s4);
              end;
            {$ENDIF}

          end;




          procedure CreateOperation( var AnOperation: POperation;
                                     Term:TToken;
                                     Proc: Pointer);
          begin
            AnOperation := nil;
            new(AnOperation);
            with AnOperation^ do
            begin
              Arg1:=nil; Arg2:=nil; Dest:=nil; NextOperation:=nil;
              Token := Term;
              Operation := TMathProcedure(Proc);
            end;
          end;





const
  blanks = ' ';



type
  PTermRecord = ^TermRecord;
  TermRecord = record
                 { this usage of string is a bit inefficient,
                   as always 256 bytes are consumed. But since
                   we a) are allocating memory dynamically and
                   b) this will be released immediately when
                   finished with parsing this seems to be OK

                   One COULD create a "TermClass" where this is handled }
                 StartString:string;
                 LeftString, RightString:string;

                 Token: TToken;

                 Position: array[1..3] of integer;

                 Next1,
                 Next2,
                 Previous: PTermRecord;
               end;

const
  { side effect: for each bracketing level added
      SizeOf(integer) bytes additional stack usage
      maxLevelWidth*SizeOf(Pointer) additional global memory used }
  maxBracketLevels = 20;

  { side effect: for each additional level width
      maxBracketLevels*SizeOf(Pointer) additional global memory used }
  maxLevelWidth = 50;
type
  LevelArray = array[0..maxBracketLevels] of integer;

  OperationPointerArray = array[0..maxBracketLevels, 1..maxLevelWidth] of POperation;
  POperationPointerArray = ^OperationPointerArray;
var
  Matrix: POperationPointerArray;

  { bracket positions }
  CurrentBracket,
  i,
  CurBracketLevels:    integer;

  BracketLevel: LevelArray;

  LastOP: POperation;
  FloatNumber: ParserFloat;
  VariableID: integer;


  ANewTerm, { need this particlar pointer to guarantee a good, flawless memory cleanup in except }

  FirstTerm,
  Next1Term,
  Next2Term,
  LastTerm: PTermRecord;

  counter1,
  counter2: integer;
begin
  { initialize local variables for safe checking in try..finally..end}
  LastOP := nil;

  { FirstTerm := nil; } { not necessary since not freed in finally }
  LastTerm := nil;
  ANewTerm := nil;
  Next1Term := nil;
  Next2Term := nil;

  Error := false;

  FillChar(BracketLevel, SizeOf(BracketLevel), 0); { initialize bracket array }
  BracketLevel[0]:=1;
  CurBracketLevels:=0;

  new(Matrix);

  try { this block protects the whole of ALL assignments...}
    FillChar(Matrix^, SizeOf(Matrix^), 0);

    ANewTerm := new(PTermRecord);

    with ANewTerm^ do
    begin

      StartString := UpperCase(FunctionString);

      { remove leading and trailing spaces }

      counter1 := 1;
      while counter1 <= length(StartString) do
        if StartString[counter1] <> ' ' then
          break
        else
          inc(counter1);

      counter2 := length(StartString);
      while counter2 > counter1 do
        if StartString[counter2] <> ' ' then
          break
        else
          dec(counter2);

      StartString := Copy(StartString, counter1, counter2 - counter1 + 1);

      if Pos(' ', StartString) > 0 then
        raise EExpressionHasBlanks.Create('Expression has blanks');
      {
      Old code:

         StartString := RemoveBlanks(UpperCase(FunctionString));

      ...do not use! Using it would create the following situation:

         Passed string:   "e xp(12)"
         Modified string: "exp(12)"

      This MAY or may not be the desired meaning - there may well exist
      a variable "e" and a function "xp" and just the operator would be missing.

      Conclusion: the above line has the potential of changing the meaning
                  of an expression.
      }

      if not CheckNumberBrackets(StartString) then
        raise EMissMatchingBracket.Create('Missing brackets in expression');

      while CheckBracket(StartString, FunctionString) do
        StartString := FunctionString;

      LeftString := blanks; RightString := blanks; Token := variab;
      Next1:=nil; Next2:=nil; Previous:=nil;
    end;

    CreateOperation(Matrix^[0,1], variab, nil);

    LastTerm := ANewTerm;
    FirstTerm := ANewTerm;
    ANewTerm := nil;
    with LastTerm^ do
    begin
      Position[1]:=0;
      Position[2]:=1;
      Position[3]:=1;
    end;

    repeat

      repeat
        CurrentBracket := LastTerm^.Position[1];
        i := LastTerm^.Position[2];

        if LastTerm^.Next1 = nil then
          with LastTerm^ do
          begin
            if CheckVariable(StartString, VariableID) then
            begin
              Token:=variab;

              if Position[3]=1 then
                Matrix^[CurrentBracket,i]^.Arg1:= PParserFloat(Variables.Objects[VariableID])
              else
                Matrix^[CurrentBracket,i]^.Arg2:= PParserFloat(Variables.Objects[VariableID])
            end
            else
            begin
              if CheckNumber(StartString, FloatNumber) then
              begin
                Token:=constant;
                if Position[3] = 1 then
                begin
                  new(Matrix^[CurrentBracket,i]^.Arg1);
                  Matrix^[CurrentBracket,i]^.Arg1^ := FloatNumber;
                end
                else
                begin
                  new(Matrix^[CurrentBracket,i]^.Arg2);
                  Matrix^[CurrentBracket,i]^.Arg2^ := FloatNumber;
                end;
              end
              else
              begin
                if CheckNegate(StartString, LeftString) then
                  Token:=minus
                else
                begin
                  if CheckAdd(StartString, LeftString, RightString) then
                    Token:=sum
                  else
                  begin
                    if CheckSubtract(StartString, LeftString, RightString) then
                      Token:=diff
                    else
                    begin
                      if CheckMultiply(StartString, LeftString, RightString) then
                        Token:=prod
                      else
                      begin
                        if CheckIntegerDiv(StartString, LeftString, RightString) then
                          Token := IntDiv
                        else
                        begin
                          if CheckModulo(StartString, LeftString, RightString) then
                            Token:=modulo
                          else
                          begin
                            if CheckRealDivision(StartString, LeftString, RightString) then
                              Token:=divis
                            else
                            begin
                              if not CheckFuncOneVar(StartString,LeftString, Token) then
                              begin
                                if CheckIntPower(StartString,LeftString,RightString) then
                                  Token:=integerpower
                                else
                                begin
                                  if CheckRealPower(StartString,LeftString,RightString) then
                                    Token:=realpower
                                  else
                                  begin
                                    if CheckFuncTwoVar(StartString,LeftString,RightString) then
                                      Token:=FuncTwoVar
                                    else
                                    begin
                                      Error := true; {with an exception raised this is meaningless...}
                                      if (LeftString=blanks) and (RightString=blanks) then
                                        raise ESyntaxError.CreateFmt(
                                           'Error parsing expression:'#13'%s', [StartString]
                                                                     )
                                      else
                                        raise ESyntaxError.CreateFmt(
                                           'Error parsing expression:'#13'%s'#13'%s', [Leftstring, RightString]
                                                                     )
                                    end;
                                  end;
                                end;
                              end;
                            end;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end; {with LastTerm^}



        if LastTerm^.Token in ( [brack, minus, square, third, fourth, FuncOneVar] +
                                [FuncTwoVar] + TokenOperators) then
        begin
          if LastTerm^.Next1 = nil then
          begin
            try
              Next1Term := nil;
              new(Next1Term);

              inc(CurrentBracket);
              if CurrentBracket>maxBracketLevels then
              begin
                Error:=true;
                raise ETooManyNestings.Create('Expression contains too many nestings');
              end;

              if CurBracketLevels<CurrentBracket then
                CurBracketLevels:=CurrentBracket;

              i := BracketLevel[CurrentBracket]+1;
              if i>maxLevelWidth then
              begin
                Error:=true;
                raise EExpressionTooComplex.Create('Expression is too complex');
              end;

              with Next1Term^ do
              begin
                StartString:=LastTerm^.LeftString;
                Previous:=LastTerm;
                Position[1]:=CurrentBracket;
                Position[2]:=i; Position[3]:=1;
                Token:=variab;
                LeftString:=blanks; RightString:=blanks;
                Next1:=nil; Next2:=nil;
              end;

              with LastTerm^ do
              begin
                case Token of
                  FuncOneVar:
                    with FunctionOne do
                      CreateOperation( Matrix^[CurrentBracket,i],
                                       Token,
                                       Objects[IndexOf(copy(StartString, 1, pos('(', StartString)-1))]);

                  FuncTwoVar:
                    with FunctionTwo do
                      CreateOperation( Matrix^[CurrentBracket,i],
                                       Token,
                                       Objects[IndexOf(copy(StartString, 1, pos('(', StartString)-1))]);
                else
                  CreateOperation(Matrix^[CurrentBracket,i], Token, nil);
                end;

                new(Matrix^[CurrentBracket,i]^.Dest);
                Matrix^[CurrentBracket,i]^.Dest^ := 0;

                if Position[3] = 1 then
                  Matrix^[Position[1], Position[2]]^.Arg1 := Matrix^[CurrentBracket,i]^.Dest
                else
                  Matrix^[Position[1], Position[2]]^.Arg2 := Matrix^[CurrentBracket,i]^.Dest;

                Next1 := Next1Term;
              end;

              if LastTerm^.Token in [brack, minus, square, third, fourth, FuncOneVar] then
                inc(BracketLevel[CurrentBracket]);

            except
              if assigned(Next1Term) then
              begin
                dispose(Next1Term);
                Next1Term := nil;
              end;
              raise;
            end;

          end

          else
          begin
            if LastTerm^.Token in TokenOperators + [FuncTwoVar] then
            begin
              try
                Next2Term := nil;
                new(Next2Term);

                inc(CurrentBracket);
                if CurrentBracket > maxBracketLevels then
                begin
                  Error:=true;
                  raise ETooManyNestings.Create('Expression contains too many nestings');
                end;

                if CurBracketLevels<CurrentBracket then
                  CurBracketLevels:=CurrentBracket;

                i:=BracketLevel[CurrentBracket]+1;
                if i > maxLevelWidth then
                begin
                  Error:=true;
                  raise EExpressionTooComplex.Create('Expression is too complex');
                end;

                with Next2Term^ do
                begin
                  StartString := LastTerm^.RightString;
                  Previous := LastTerm;
                  Position[1]:=CurrentBracket; Position[2]:=i; Position[3]:=2;
                  LeftString:=blanks; RightString:=blanks; Token:=variab;
                  Next1 := nil; Next2 := nil;
                end;

                LastTerm^.Next2:=Next2Term;
                inc(BracketLevel[CurrentBracket]);

              except
                if assigned(Next2Term) then
                begin
                  dispose(Next2Term);
                  Next2Term := nil;
                end;
              end;
            end
            else
              raise EParserInternalError.Create('Internal Error');
          end;
        end;


        with LastTerm^ do
          if Next1=nil then
          { we are done with THIS loop }
            break
          else
            if Next2=nil then
              LastTerm := Next1
            else
              LastTerm:= Next2;

      until false; { endless loop, break'ed 7 lines above }

      if LastTerm = FirstTerm then
      begin
        dispose(LastTerm);
        FirstTerm:=nil;
        break; { OK - that is it, we did not find any more terms}
      end;

      repeat
        with LastTerm^ do
        begin
          if Next1 <> nil then
          begin
            dispose(Next1);
            Next1 := nil;
          end;

          if Next2 <> nil then
          begin
            dispose(Next2);
            Next2 := nil;
          end;

          LastTerm := Previous;
        end;
      until ((LastTerm^.Token in TokenOperators + [FuncTwoVar]) and (LastTerm^.Next2=nil)) or
            (LastTerm=FirstTerm);


      if (LastTerm=FirstTerm) and
         ( (FirstTerm^.Token in [brack, minus, square, third, fourth, FuncOneVar]) or

           ((FirstTerm^.Token in TokenOperators + [FuncTwoVar]) and (FirstTerm^.Next2<>nil))
          ) then
      begin
          break;
      end;


    until false;


    { after having built the expression matrix, translate it into a tree/list }

    with FirstTerm^ do
      if FirstTerm <> nil then
      begin
        if Next1 <> nil then
        begin
          dispose(Next1);
          Next1 := nil;
        end;
        if Next2 <> nil then
        begin
          dispose(Next2);
          Next2 := nil;
        end;

        dispose(FirstTerm);
        { FirstTerm := nil; }
      end;

    BracketLevel[0]:=1;

    if CurBracketLevels = 0 then
    begin
      FirstOP := Matrix^[0,1];
      Matrix^[0,1] := nil;
      FirstOP^.Dest := FirstOP^.Arg1;
      NumberOperations := 0;
    end
    else
    begin
      for counter1 := CurBracketLevels downto 1 do
        for counter2 := 1 to BracketLevel[counter1] do
        begin
          if (counter1=CurBracketLevels) and (counter2=1) then
          begin
            NumberOperations := 1;
            FirstOP := Matrix^[counter1,counter2];
            LastOP := FirstOP;
          end
          else
          begin
            inc(NumberOperations);
            LastOP^.NextOperation := Matrix^[counter1,counter2];
            LastOP := LastOP^.NextOperation;
          end;
        end;

      with Matrix^[0,1]^ do
      begin
        Arg1:=nil; Arg2:=nil; Dest:=nil;
      end;

      if assigned(Matrix^[0,1]) then
      begin
        dispose(Matrix^[0,1]);
        Matrix^[0,1] := nil;
      end;
    end;


  except

    if assigned(Matrix^[0,1]) then
    begin
      dispose(Matrix^[0,1]);
      Matrix^[0,1] := nil;
    end;

    if Assigned(Matrix) then
    begin
      for counter1 := CurBracketLevels downto 1 do
        for counter2 := 1 to BracketLevel[counter1] do
          if Assigned(Matrix^[counter1,counter2]) then
            dispose(Matrix^[counter1, counter2]);

      dispose(Matrix);
      {Matrix := nil; }
    end;

    if Assigned(Next1Term) then
      dispose(Next1Term);

    if Assigned(Next2Term) then
      dispose(Next2Term);

{   do NOT kill this one at it is possibly the same as LastTerm (see below)!
    if Assigned(FirstTerm) then
      dispose(FirstTerm);

    instead, DO kill ANewTerm, which will only be <> nil if it has NOT passed
    its value to some other pointer already so it can safely be freed
}
    if Assigned(ANewTerm) then
      dispose(ANewTerm);

    if Assigned(LastTerm) then
      dispose(LastTerm);

    FirstOP := nil;
    NumberOperations := 0;

    raise;
  end;
end;



end.
