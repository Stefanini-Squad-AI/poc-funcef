unit uCMMath;

interface

Uses JclStrings, SysUtils, Math;

function StrToFloatDef(sValor :String; rDefault :Double) :Double;
function StrToFloatCM(const sNumber: String): Double;
function FloatToStrCM(const rValor: Double): String;
Function RoundCM( Valor: Extended; Decimais: Integer ): Extended;

implementation

Function RoundCM( Valor: Extended; Decimais: Integer ): Extended;
Begin
  Result := Round( Valor * Power( 10, Decimais ) ) / Power( 10, Decimais );
End;

function FloatToStrCM(const rValor: Double): String;
Var                                                          
  sdc: Char;
Begin
  sdc := DecimalSeparator;
  Try
    DecimalSeparator := '.';
    Result := FloatToStr(rValor);
  finally
    DecimalSeparator := sdc;                         
  End;
End;

function StrToFloatCM(const sNumber: String): Double;
Var
  sAuxFloat: String;
  iPos: Integer;
Begin
  sAuxFloat := sNumber;

  iPos := Pos(ThousandSeparator,sAuxFloat);
  While (iPos > 0) Do
  Begin
    Delete(sAuxFloat,iPos,1);
    iPos := Pos(ThousandSeparator,sAuxFloat);
  End;

  CharReplace(sAuxFloat,ThousandSeparator,#0);
  Result := StrToFloat(sAuxFloat);
End;

function StrToFloatDef(sValor :String; rDefault :Double) :Double;
Begin
   Try
     Result := StrToFloat(sValor)
   Except
     Result := rDefault;
   End;
End;


end.
