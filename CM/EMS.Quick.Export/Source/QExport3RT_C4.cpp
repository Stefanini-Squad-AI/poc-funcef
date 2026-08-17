//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl40.bpi");
USEPACKAGE("vcldb40.bpi");
USEPACKAGE("vclx40.bpi");
USEUNIT("QExport3.pas");
USEUNIT("QExport3LaTeX.pas");
USEUNIT("QExport3XML.pas");
USEUNIT("QExport3RTFList.pas");
USEUNIT("QExport3RTF.pas");
USEUNIT("QExport3HTML.pas");
USEUNIT("QExport3SQL.pas");
USEUNIT("QExport3HTMLTemplates.pas");
USEUNIT("QExport3ASCII.pas");
USEUNIT("QExport3Clipboard.pas");
USEUNIT("QExport3DBF.pas");
USEUNIT("QExport3PDF.pas");
USEUNIT("QExport3Options.pas");
USEUNIT("QExport3XLS.pas");
USEFORMNS("fuQExport3XLSColorEditor.pas", Fuqexport3xlscoloreditor, fmQExport3XLSColorEditor);
USEUNIT("QExport3Common.pas");
USEFORMNS("fuQExport3Progress.pas", Fuqexport3progress, fmQExport3Progress);
USEFORMNS("fuQExport3About.pas", Fuqexport3about, fmQExport3About);
USEUNIT("QExport3Dialog.pas");
USEPACKAGE("bcbsmp40.bpi");
USEUNIT("QExport3StrIDs.pas");
USEFORMNS("fuQExport3License.pas", Fuqexport3license, fmQExport3License);
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
