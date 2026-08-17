unit uGeraSenha;

interface

uses SysUtils, Dialogs;

function GeraSenha( iMinQtdeChar, iMaxQtdeChar : integer;
                    bTodasMaisculas : Boolean = False;
                    bComecaComChar  : Boolean = True;
                    iTipoSenha      : Integer = 1;
                    bRandomize      : Boolean = True ) : String;

implementation


function GeraSenha( iMinQtdeChar, iMaxQtdeChar : integer;
                    bTodasMaisculas : Boolean = False;
                    bComecaComChar  : Boolean = True;
                    iTipoSenha      : Integer = 1;
                    bRandomize      : Boolean = True ) : String;
var
  QtdeChar, i, iChar : integer;
  sTabela, Ch : String;
begin
  Result := '';
  iChar := 0;

  if ( iMinQtdeChar > iMaxQtdeChar ) or ( iMinQtdeChar < 1 ) then Exit;

  sTabela := ( '0123456789ABCDEFGHIJKLMNOPQRSTU' +
               'VWXYZabcdefghijklmnopqrstuvwxyz' );

  if bRandomize then Randomize;

  QtdeChar := Random( iMaxQtdeChar - iMinQtdeChar + 1 ) + iMinQtdeChar;

  for i := 1 to QtdeChar do
  begin
    while True do
    begin

      if iTipoSenha = 1 then
        iChar := Random( 63 );

      if iTipoSenha = 2 then
        iChar := Random( 53 ) + 10;

      if iTipoSenha = 3 then
        iChar := Random( 11 );

      if bComecaComChar           and
       ( i = 1        )           and
       ( iChar <= 10  )           and
       ( not ( iTipoSenha = 3 ) ) then
        Continue;

       if ( iChar = 34 ) or ( iChar = 39 ) then
        Continue;   

       Break;
    end;

    Ch := Copy( sTabela, iChar, 1 );

    if bTodasMaisculas then Ch := UpperCase( Ch );

    Result := Result + Ch;
  end;
end;

end.
