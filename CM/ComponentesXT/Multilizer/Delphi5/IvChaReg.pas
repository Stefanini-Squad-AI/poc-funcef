unit IvChaReg;

interface

procedure Register;

implementation

uses
  Classes,
  IvCommon, IvChaMod;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIvChartModule]);
end;

end.
