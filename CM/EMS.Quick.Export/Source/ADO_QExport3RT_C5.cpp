//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl50.bpi");
USEUNIT("ADO_QExport3Access.pas");
USEUNIT("ADO_QExport3Database.pas");
USEPACKAGE("vcldb50.bpi");
USEPACKAGE("vclado50.bpi");
USEPACKAGE("vclx50.bpi");
USEPACKAGE("QExport3RT_C5.bpi");
USEFORMNS("ADO_QExport3Dialog.pas", Ado_qexport3dialog, ADO_QExport3DialogF);
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
