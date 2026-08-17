unit MyReg;

interface

procedure Register;

implementation

uses
  Classes, MyControl, MyModule;

{$R MLSample.dcr}

procedure Register;
begin
  // Register the TMyControl component

  RegisterComponents('Multilizer', [TMyControl]);

  // Register the translator module for the TMyControl component

  RegisterComponents('Multilizer', [TMyModule]);
end;

end.
