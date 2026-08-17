unit uAutorizaCM;

interface

Uses Classes, Dialogs, controls;

Type
  TAutorizaCM = Class(TComponent)

  Private

  Protected

  Public
    Procedure Execute;
  Published

  End;

implementation

{ TAutorizaCM }

procedure TAutorizaCM.Execute;
Var
  sComponentes :String;
  X:Integer;
begin
   sComponentes := '';

   For X:=0 To Owner.ComponentCount - 1 Do
       If Owner.Components[x] Is TControl Then
          sComponentes := sComponentes + Owner.Components[x].Name + ': ' + Owner.Components[x].ClassName + (#13+#10);

   ShowMessage(sComponentes)
end;



end.
