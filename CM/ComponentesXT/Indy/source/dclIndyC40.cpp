//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("dclIndyC40.res");
USEPACKAGE("vcl40.bpi");
USERES("IdRegister.dcr");
USEPACKAGE("IndyC40.bpi");
USEUNIT("IdAbout.pas");
USEUNIT("IdDsnBaseCmpEdt.pas");
USEUNIT("IdDsnPropEdBinding.pas");
USEUNIT("IdDsnRegister.pas");
USEUNIT("IdRegister.pas");

//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
