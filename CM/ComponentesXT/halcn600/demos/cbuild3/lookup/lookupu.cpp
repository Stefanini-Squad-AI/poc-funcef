//----------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "lookupu.h"
//----------------------------------------------------------------------------
#pragma link "Halcn6DB"
#pragma resource "*.dfm"
TMainForm *MainForm;
//----------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent *Owner)
	: TForm(Owner)
{
}
//----------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
	HalcyonDataSet1->Open();
	HalcyonDataSet2->Open();
}
//----------------------------------------------------------------------------