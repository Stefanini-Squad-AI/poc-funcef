#pragma link "QExport3"
#pragma link "QExport3XLS"
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fuQExportXLSDemo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "QExport3"
#pragma link "QExport3XLS"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  AnsiString Path = ExtractFilePath(Application->ExeName);
  Table1->TableName = Path + "country.db";
  Table1->Open();
  FillListViewAndStringGrid();
  QExportXLS1->FileName = Path + "demo.xls";
  FFlag = false;

  chDataSet->Checked = QExportXLS1->Sheets->Items[0]->Exported;
  chDBGrid->Checked = QExportXLS1->Sheets->Items[1]->Exported;
  chListView->Checked = QExportXLS1->Sheets->Items[2]->Exported;
  chStringGrid->Checked = QExportXLS1->Sheets->Items[3]->Exported;
}

void __fastcall TForm1::FormDestroy(TObject *Sender)
{
  Table1->Close();
}

void __fastcall TForm1::Button1Click(TObject *Sender)
{
  QExportXLS1->Sheets->Items[0]->Exported = chDataSet->Checked;
  QExportXLS1->Sheets->Items[1]->Exported = chDBGrid->Checked;
  QExportXLS1->Sheets->Items[2]->Exported = chListView->Checked;
  QExportXLS1->Sheets->Items[3]->Exported = chStringGrid->Checked;
  QExportXLS1->Execute();
}
void __fastcall TForm1::FormShow(TObject *Sender)
{
  PageControl1->ActivePage = tshDataSet;
}

void __fastcall TForm1::FillListViewAndStringGrid(void)
{
  Table1->DisableControls();
  try
  {
    Table1->First();
    ListView1->Items->BeginUpdate();
    try
    {
      ListView1->Items->Clear();
      int i = 0;
      StringGrid1->Cells[0][0] = "Name";
      StringGrid1->Cells[1][0] = "Capital";
      StringGrid1->Cells[2][0] = "Continent";
      StringGrid1->Cells[3][0] = "Area";
      StringGrid1->Cells[4][0] = "Population";
      while (!Table1->Eof)
      {
        TListItem *ListItem = ListView1->Items->Add();
        ListItem->Caption = Table1->FieldByName("NAME")->AsString;
        ListItem->SubItems->Add(Table1->FieldByName("CAPITAL")->AsString);
        ListItem->SubItems->Add(Table1->FieldByName("CONTINENT")->AsString);
        ListItem->SubItems->Add(Table1->FieldByName("AREA")->AsString);
        ListItem->SubItems->Add(Table1->FieldByName("POPULATION")->AsString);

        StringGrid1->Cells[0][i+1] = Table1->FieldByName("NAME")->AsString;
        StringGrid1->Cells[1][i+1] = Table1->FieldByName("CAPITAL")->AsString;
        StringGrid1->Cells[2][i+1] = Table1->FieldByName("CONTINENT")->AsString;
        StringGrid1->Cells[3][i+1] = Table1->FieldByName("AREA")->AsString;
        StringGrid1->Cells[4][i+1] = Table1->FieldByName("POPULATION")->AsString;
        Table1->Next();
        i++;
      }
      Table1->First();
    }
    __finally
    {
      ListView1->Items->EndUpdate();
    }
  }
  __finally
  {
    Table1->EnableControls();
  }
}
void __fastcall TForm1::QExportXLS1GetDataParams(TObject *Sender, int Sheet, 
  int Col, int Row, TxlsFormat *Format, AnsiString &FormatText)
{
  if (Sheet == 3)
  {
    if (Col == 0) 
      FFlag = AnsiCompareText(StringGrid1->Cells[2][Row-3], "South America") == 0;
    if (FFlag)
    {
      Format->Fill->Background = clrGold;
      Format->Fill->Pattern = ptSolid;
    }
    else
    {
      Format->Fill->Background = clrPaleBlue;
      Format->Fill->Pattern = ptSolid;
    }
  }
}

void __fastcall TForm1::QExportXLS1GetFooterParams(TObject *Sender,
      int Sheet, int Col, int Row, TxlsFormat *Format, WideString &S)
{
  if (S.Pos("EMS") > 0)
  {
    Format->Font->Size = 14;
    Format->Font->Color = clrOrange;
    Format->Font->Name = "Arial Black";
    Format->Font->Style << xfsBold;
  }
  else
  {
    Format->Font->Size = 12;
    Format->Font->Color = clrBlack;
    Format->Font->Name = "Arial";
    Format->Font->Style << xfsBold;
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::QExportXLS1GetHeaderParams(TObject *Sender,
      int Sheet, int Col, int Row, TxlsFormat *Format, WideString &S)
{
  if (S.Pos("www") > 0)
  {
    Format->Font->Color = clrBlue;
    Format->Font->Underline = fulSingle;
    Format->Alignment->Horizontal = halLeft;
  }
  else if (S.Pos("Welcome") > 0)
  {
    Format->Alignment->Horizontal = halRight;
  }
  else
  {
    Format->Font->Color = clrBlack;
    Format->Font->Underline = fulNone;
    Format->Alignment->Horizontal = halLeft;
  }
}
//---------------------------------------------------------------------------

