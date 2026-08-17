//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("dclIndyC50.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("IdAbout.pas");
USEUNIT("IdDsnBaseCmpEdt.pas");
USEUNIT("IdDsnPropEdBinding.pas");
USEUNIT("IdDsnRegister.pas");
USEUNIT("IdRegister.pas");

USERES("IdRegister.dcr");
USEPACKAGE("IndyC50.bpi");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
