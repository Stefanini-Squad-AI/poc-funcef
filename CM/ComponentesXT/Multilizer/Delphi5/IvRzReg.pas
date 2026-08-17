unit IvRzReg;

interface

procedure Register;

implementation

uses
  Classes,
  IvCommon, IvRzMod;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIvRaizeModule]);
end;

end.
