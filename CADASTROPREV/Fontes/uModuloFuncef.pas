unit UModuloFuncef;

interface

Uses SysUtils;

type TModuloFuncef = Class
   private
     FExemplo : string;
   public
     property Exemplo : string read FExemplo write FExemplo;
   end;

   function PreparaStr(Codigo : string; Tam : byte) : string;

var ModuloFuncef : TModuloFuncef;

implementation

function PreparaStr(Codigo : string; Tam : byte) : string;
var
  I:byte;
begin
  Codigo := Trim(Codigo);
  if Length(Codigo)<>Tam
  then begin
    if Length(Codigo)>Tam
      then Codigo:=copy(Codigo,1,Tam)
      else for I:=Length(Codigo) to (Tam-1) do
             Codigo:=Codigo+' ';
  end;
  PreparaStr:=Codigo;
end;

end.




