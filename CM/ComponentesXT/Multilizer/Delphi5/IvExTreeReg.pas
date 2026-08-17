unit IvExTreeReg;

interface

procedure Register;

implementation

uses
  Classes,
  IvCommon, IvExTreeMod;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIvExpressTreeModule]);
end;

end.
