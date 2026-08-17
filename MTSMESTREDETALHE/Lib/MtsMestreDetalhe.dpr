library MtsMestreDetalhe;

uses
  ComServ,
  MtsMestreDetalhe_TLB in 'MtsMestreDetalhe_TLB.pas',
  uObjMestreDetalhe in '..\Source\uObjMestreDetalhe.pas' {ObjMestreDetalhe: CoClass},
  uCtrlMestreDetalhe in '..\Source\uCtrlMestreDetalhe.pas',
  uDbTbldetalhe in '..\Source\uDbTbldetalhe.pas',
  uDbTblmestre in '..\Source\uDbTblmestre.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
