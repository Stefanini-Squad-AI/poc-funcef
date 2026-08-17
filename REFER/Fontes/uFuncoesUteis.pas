unit uFuncoesUteis;

interface

uses Windows, SysUtils, Classes, Forms, Dialogs, DBTables, StdCtrls, checklst,
     uSistema, DBaseDados, UDataBase;

function TrocaCaracter(Texto : string; De, Para : Char) : String;

implementation

function TrocaCaracter(Texto : string; De, Para : Char) : String;
var
  Posic : Integer;

begin
  repeat
    Posic := pos(De, Texto);
    if Posic > 0 then
      Texto[Posic] := Para;
  until (Posic = 0);
  Result := Texto;
end;

end.
 