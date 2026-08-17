unit uFuncoesRelats;

interface

uses Classes, ppTypes, ppVar;

procedure CriaSystemVariableAux(AOwner: TComponent);

var
  ppSystemVariableAux: TppSystemVariable;

implementation

procedure CriaSystemVariableAux(AOwner: TComponent);
begin
  if (Assigned(ppSystemVariableAux)) then
    ppSystemVariableAux.Free;
    
  ppSystemVariableAux         := TppSystemVariable.Create(AOwner);
  ppSystemVariableAux.Visible := false;
  ppSystemVariableAux.Left    := 0;
  ppSystemVariableAux.Top     := 0;
  ppSystemVariableAux.VarType := vtPageSet;
end;

end. 
