//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl50.bpi");
USEUNIT("QExport3LaTeX.pas");
USEUNIT("QExport3.pas");
USEUNIT("QExport3RTF.pas");
USEUNIT("QExport3RTFList.pas");
USEUNIT("QExport3XML.pas");
USEUNIT("QExport3SQL.pas");
USEUNIT("QExport3HTML.pas");
USEUNIT("QExport3ASCII.pas");
USEUNIT("QExport3HTMLTemplates.pas");
USEUNIT("QExport3DBF.pas");
USEUNIT("QExport3Clipboard.pas");
USEUNIT("QExport3XLS.pas");
USEFORMNS("fuQExport3XLSColorEditor.pas", Fuqexport3xlscoloreditor, fmQExport3XLSColorEditor);
USEUNIT("QExport3Common.pas");
USEFORMNS("fuQExport3Progress.pas", Fuqexport3progress, fmQExport3Progress);
USEFORMNS("fuQExport3About.pas", Fuqexport3about, fmQExport3About);
USEUNIT("QExport3Options.pas");
USEUNIT("QExport3PDF.pas");
USEUNIT("QExport3XLSUtils.pas");
USEUNIT("QExport3XLSFile.pas");
USEUNIT("QExport3XLSConsts.pas");
USEUNIT("QExport3XLSCommon.pas");
USEUNIT("QExport3CustomSource.pas");
USEUNIT("QExport3Types.pas");
USEPACKAGE("Vclx50.bpi");
USEPACKAGE("Vcldb50.bpi");
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
