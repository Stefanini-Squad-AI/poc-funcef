unit m;

function main: string;
var
  B: TButton;
begin
  B := Application.FindComponent('Test').
     FindComponent('Button5');
  B.Visible := IsS(B.Caption);
end;

function IsS(F: string): Boolean;
begin
  Result := False;
end;

end.
