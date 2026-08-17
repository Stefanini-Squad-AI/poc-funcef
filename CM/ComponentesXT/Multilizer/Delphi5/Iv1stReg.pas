unit Iv1stReg;

interface

procedure Register;

implementation

uses
  Classes, IvCommon, Iv1stMod;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIv1stClassModule]);
end;

end.
