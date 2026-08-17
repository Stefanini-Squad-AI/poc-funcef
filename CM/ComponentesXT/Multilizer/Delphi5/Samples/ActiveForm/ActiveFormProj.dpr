library ActiveFormProj;

uses
  ComServ,
  ActiveFormProj_TLB in 'ActiveFormProj_TLB.pas',
  ActiveFormImpl1 in 'ActiveFormImpl1.pas' {ActiveFormX: TActiveForm} {ActiveFormX: CoClass},
  About in 'About.pas' {AboutDialog};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
