unit RegCmBussines50;

interface

Uses Classes;

procedure Register;

implementation

Uses CmPendencia;

procedure Register;
begin
  RegisterComponents('CM Bussines', [TCMPendencia]);
end;

end.
