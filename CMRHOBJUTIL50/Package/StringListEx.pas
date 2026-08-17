unit StringListEx;

interface

uses
  Windows, Messages, SysUtils, Classes;

type
  TStringListEx = class(TStringList)
  public
    // Retorna o determinado Campo (IndexField) de um determinado Item "Index" da lista
    function GetFieldItem(Index, IndexField: integer): string;
    // Retorna o índice do Campo (IndexField) que contém a Primeira Ocorrência de "S"
    function IndexOfField(const S:string; IndexField:integer): integer;
  end;

implementation

//uses Consts;

function TStringListEx.GetFieldItem(Index, IndexField: integer): string;
var
  iPos, c: integer;
  sItemAux, sItemProcura: string;
begin
  sItemAux := Strings[Index];

  for c:=0 to IndexField do
  begin
    iPos := Pos(#9,sItemAux);
    if (iPos = 0) then
      iPos := Length(sItemAux)
    else
      Dec(iPos);

    sItemProcura := Copy(sItemAux,1,iPos);
    System.Delete(sItemAux,1,iPos+1);
  end;
  Result := sItemProcura;
end;

function TStringListEx.IndexOfField(const S:string; IndexField:integer): integer;
var
  iPos, c: integer;
  sItemAux: string;
begin
  iPos := -1;
   for c:=0 to Count-1 do
  begin
    sItemAux := GetFieldItem(c, IndexField);

    if (sItemAux = S) then
    begin
      iPos := C;
      break;
    end;
  end;

  Result := iPos;
end;

end.
