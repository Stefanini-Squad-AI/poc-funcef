//---------------------------------------------------------------------------

#include <basepch.h>
#pragma hdrstop
USEFORMNS("fuQExport3About.pas", Fuqexport3about, fmQExport3About);
USEFORMNS("fuQExport3Progress.pas", Fuqexport3progress, fmQExport3Progress);
USEFORMNS("fuQExport3XLSColorEditor.pas", Fuqexport3xlscoloreditor, fmQExport3XLSColorEditor);
USEFORMNS("QExport3Dialog.pas", Qexport3dialog, QExport3DialogF);
USEFORMNS("fuQExport3License.pas", Fuqexport3license, fmQExport3License);
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
