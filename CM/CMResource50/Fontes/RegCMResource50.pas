unit RegCMResource50;

interface

Uses uResource, Classes;

procedure register;

implementation


procedure register;
begin
  RegisterComponents('CM Additional', [TCMResourceManager]);
end;


end.
