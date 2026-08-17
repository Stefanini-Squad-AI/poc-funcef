//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "animalu.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Halcn6DB"
#pragma link "Halcn6Nv"
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
   HalcyonDataSet1->Open();    
}
//---------------------------------------------------------------------------
