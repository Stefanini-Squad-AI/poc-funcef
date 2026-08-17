unit Unit1;

function main: string;
begin
  Result := caseme(1);
end;

function caseme(Param: integer): string;
begin
  case Param of
    1:
      Result := '1 selected';
    1 + 1:
      Result := '2 selected';
    else
      Result := '"else" selected';
  end;
end;

end.
