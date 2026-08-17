//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl40.bpi");
USEPACKAGE("vcldb40.bpi");
USEPACKAGE("QExport3RT_C4.bpi");
USEUNIT("QExport3Reg.pas");
USERES("QExport3Reg.dcr");
USEUNIT("QExport3Dsgn.pas");
USEFORMNS("fuQExport3ColumnsEditor.pas", Fuqexport3columnseditor, fmQExport3ColumnsEditor);
USEFORMNS("fuQExport3HTMLTemplateEditor.pas", Fuqexport3htmltemplateeditor, fmQExport3HTMLTemplateEditor);
USEFORMNS("fuQExport3SourceList.pas", Fuqexport3sourcelist, fmQExport3SourceList);
USEFORMNS("fuQExport3XLSEditor.pas", Fuqexport3xlseditor, fmQExport3XLSEditor);
USEPACKAGE("Vclx40.bpi");
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
