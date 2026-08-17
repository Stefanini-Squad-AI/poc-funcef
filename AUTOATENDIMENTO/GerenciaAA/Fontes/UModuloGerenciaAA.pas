unit UModuloGerenciaAA;

interface

uses Sysutils, JCLStrings;

type TModuloGerenciaAA = Class
   private
     FExemplo : string;
   public
     property Exemplo : string read FExemplo write FExemplo;
   end;

//Extrai o primeiro token delimitado por "{}" de uma string
function RecuperaToken( var sStr : String ) : String;


//Coloca as inicias das palavras contidas na string em maiúsculas e as
//demais em minúsculas.
function StrToName(sStr: String): String;


var ModuloGerenciaAA : TModuloGerenciaAA;

implementation


//Extrai o primeiro token delimitado por "{}" de uma string
function RecuperaToken( var sStr : String ) : String;
var
  iPosI, iPosF  : integer;
begin
  iPosI := StrFind( '{', sStr );
  if iPosI > 0 then
  begin
    iPosF := StrFind( '}', sStr, iPosI );
    if iPosF > 0 then
      if iPosI < iPosF then
      begin
        Result := Copy( sStr, iPosI + 1, iPosF - iPosI - 1 );
        sStr := Copy( sStr, 1, iPosI - 1 ) + Copy( sStr, iPosF + 1, length( sStr ) - iPosF );
      end;
  end;
end; {RecuperaToken}



//Coloca as inicias das palavras contidas na string em maiúsculas e as
//demais em minúsculas.
function StrToName(sStr: String): String;
var
  iPos : integer;
  sPalavra : String;
begin
  sStr := trim( AnsiLowerCase( sStr ) );
  Result := '';

  while True do
  begin
    iPos := Pos( ' ', sStr );
    if iPos > 0 then
    begin
      sPalavra := trim( Copy( sStr, 1, iPos - 1 ) );
      sStr := trim( Copy( sStr, iPos, length( sStr ) - iPos + 1 ) );
    end
    else
    begin
      sPalavra := sStr;
      sStr := '';
    end;

    if   ( sPalavra <> 'do'  )
     and ( sPalavra <> 'da'  )
     and ( sPalavra <> 'dos' )
     and ( sPalavra <> 'das' )
     and ( sPalavra <> 'de'  )
     or  ( Result   =  ''      ) then
      sPalavra := AnsiUpperCase( Copy( sPalavra, 1, 1 ) ) +
                  Copy( sPalavra, 2, length( sPalavra ) - 1 );

    Result := Result + ' ' + sPalavra;

    if sStr = '' then
      break;
  end;

  Result := trim( Result );
end; {StrToName}


end.
