//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("CustomSourceDemo.res");
USEFORM("fuCustomSourceDemo.cpp", fmCustomSourceDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TfmCustomSourceDemo), &fmCustomSourceDemo);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
