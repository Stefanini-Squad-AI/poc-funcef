//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl50.bpi");
USEPACKAGE("QExport3RT_C5.bpi");
USEPACKAGE("vcldb50.bpi");
USEUNIT("QExport3Reg.pas");
USEUNIT("QExport3Dsgn.pas");
USEFORMNS("fuQExport3HTMLTemplateEditor.pas", Fuqexport3htmltemplateeditor, fmQExport3HTMLTemplateEditor);
USEFORMNS("fuQExport3ColumnsEditor.pas", Fuqexport3columnseditor, fmQExport3ColumnsEditor);
USEFORMNS("fuQExport3XLSEditor.pas", Fuqexport3xlseditor, fmQExport3XLSEditor);
USEFORMNS("fuQExport3SourceList.pas", Fuqexport3sourcelist, fmQExport3SourceList);
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
