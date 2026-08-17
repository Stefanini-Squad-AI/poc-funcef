unit IvIPReg;

interface

procedure Register;

implementation

uses
  Classes,
  IvCommon, IvIPMod;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIvInfoPowerModule]);
end;

end.
