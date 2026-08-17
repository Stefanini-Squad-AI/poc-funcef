unit UModulo;

interface

type TModulo = Class
  private
    FIntegraContab,
    FMascaraPlano: string;
    FPlano: integer;
  public
    constructor Create;
    function VerificaMascara( sMascara: String; var lNivel: Array of Integer;
                              var ind: Integer ): Boolean;
    function CalcGrau( sNoAnterior: String; lNivel: Array of Integer;
                       ind: Integer; var sPai: String ): Integer;
    function CharIsAlpha(const C: AnsiChar): Boolean;
    function CharIsNum(const C: AnsiChar): Boolean;
    function StrIsAlphaNum(const S: AnsiString; sLetras, sNumeros: String): Boolean;
    function ExistsMultChar(const S: AnsiString): Boolean;
  end;


var Modulo: TModulo;

implementation

Uses ivDictio,  SysUtils;

constructor TModulo.Create;
begin
  FIntegraContab := 'N'{ivlm};
  FPlano         := 0;
  FMascaraPlano  := ''
end;

function TModulo.CalcGrau( sNoAnterior: String; lNivel: Array of Integer;
                 ind: Integer; var sPai: String ): Integer;
var
  i, iAux: Integer;
  sAux: String;
  lAux: Boolean;
begin
  iAux   := 0;
  Result := 0;
  sAux   := '';
  lAux   := False;

  For i := 1 To ind + 1 Do Begin
      inc( Result );
      iAux := iAux + lNivel[ i ];

      If Length( sNoAnterior ) = iAux Then Begin
         lAux := True;
         sPai := Copy( sNoAnterior, 1, iAux - lNivel[ i ] );
         Break;
      End;
  End;

  If Not lAux Then
     Result := 0;
end;

function TModulo.VerificaMascara( sMascara: String;
         var lNivel: Array of Integer; var ind: Integer): Boolean;
var
  i, iSoma: Integer;
begin
  Result := True;
  iSoma  := 0;
  lNivel[ 0 ] := 1;

  For i := 1 To Length( sMascara ) Do Begin
      If copy( sMascara, i, 1 ) = '.'{ivlm} Then Begin
         Inc( ind );
         lnivel[ ind ] := i - ind - iSoma;
         iSoma := iSoma + lNivel[ ind ];
      End;
  End;

  If ( ind = 0 ) And ( Length( sMascara ) > 0 ) Then Begin
     lnivel[ 1 ] := Length( sMascara );
     ind := 1;
  End;

  If ind = 0 Then
     Result := False;

  lNivel[ ind + 1 ] := Length( sMascara ) - ind - iSoma;
end;

function TModulo.CharIsAlpha(const C: AnsiChar): Boolean;
begin
  Result := ( C In [ 'A'{ivlm}..'Z'{ivlm} ] ) Or ( C In [ 'a'{ivlm}..'z'{ivlm} ] );
end;

function TModulo.CharIsNum(const C: AnsiChar): Boolean;
begin
  Result := ( C In [ '0'{ivlm}..'9'{ivlm} ] );
end;

function TModulo.StrIsAlphaNum( const S: AnsiString; sLetras, sNumeros: String ): Boolean;
var
  I: Integer;
  bIsAlpha, bIsNum: Boolean;
begin
  bIsAlpha := False;
  bIsNum := False;

  for I := 1 to Length( S ) do begin
      if Not bIsAlpha then
         bIsAlpha := CharIsAlpha( S[ I ] );

      if Not bIsNum then
         bIsNum := CharIsNum( S[ I ] );
  end;

  // Testa se precisa ter numeros e/ou letras

  If UpperCase( sLetras ) = 'S'{ivlm} Then
     If UpperCase( sNumeros ) = 'S'{ivlm} Then
        Result := bIsAlpha And bIsNum
     Else
        Result := bIsAlpha
  Else
     If UpperCase( sNumeros ) = 'S'{ivlm} Then
        Result := bIsNum
     Else
        Result := True;
end;

function TModulo.ExistsMultChar(const S: AnsiString): Boolean;
Var
  x: Integer;
Begin
  Result := False;

  If Trim( S ) <> '' Then Begin
     For x := 2 To Length( S ) Do
         If S[ x ] = S[ x - 1 ] Then Begin
            Result := True;
            Break;
         End;
  End;
End;

end.

