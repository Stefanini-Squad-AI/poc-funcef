unit UAllTrim;

interface


function tiraTodosBrancos(Value: String): String;

implementation

function tiraTodosBrancos(Value: String): String;
var
  i: Integer;
begin
  i := pos(' ',Value);
  while i <> 0 do
  begin
    delete(Value,i,1);
    i := pos(' ',Value);
  end;
  tiraTodosBrancos := Value;
end;

end.
 
