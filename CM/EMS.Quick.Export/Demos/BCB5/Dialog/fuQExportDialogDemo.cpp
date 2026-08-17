#pragma link "QExport3Dialog"
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fuQExportDialogDemo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

AnsiString DataArray[5][5] =
    {{"1", "ALEX", "01.05.1974", "270.36", "true"},
     {"2", "MARIA", "14.03.1977", "199.95", "false"},
     {"3", "MARK", "15.06.1976", "154.55", "true"},
     {"4", "JOHN", "22.08.1979", "400.12", "true"},
     {"5", "HELEN", "09.08.1974", "414.63", "false"}};

void __fastcall TForm1::FormCreate(TObject* Sender)
{

  int n;
  FillListView();
  FillStringGrid();

  Session->GetDatabaseNames(ComboBox1->Items);
  if (ComboBox1->Items->Count > 0)
  {
    n = ComboBox1->Items->IndexOf("DBDEMOS");
    if (n > -1) ComboBox1->ItemIndex = n;
    else
    {
      n = ComboBox1->Items->IndexOf("BCDEMOS");
      if (n > -1) ComboBox1->ItemIndex = n;
      else ComboBox1->ItemIndex = 0;
    }
    ComboBox1->OnChange(0);
  }

  QExportDialog1->FileName = ExtractFilePath(Application->ExeName) + "demo.xls";
  PageControl1->ActivePage = tshDataSet;
  PageControl1->OnChange(0);
}

void __fastcall TForm1::FormDestroy(TObject* Sender)
{
  if (Table1->Active) Table1->Close();
}

void __fastcall TForm1::Button1Click(TObject* Sender)
{
  if (PageControl1->ActivePage == tshDataSet)
    QExportDialog1->ExportSource = esDataSet;
  else if (PageControl1->ActivePage == tshDBGrid)
         QExportDialog1->ExportSource = esDBGrid;
       else if (PageControl1->ActivePage == tshListView)
              QExportDialog1->ExportSource = esListView;
            else if (PageControl1->ActivePage == tshStringGrid)
                   QExportDialog1->ExportSource = esStringGrid;

  QExportDialog1->Execute();
}

void __fastcall TForm1::FillListView()
{
  TListItem* Item;
  for (int i = 0; i <= 4; ++i)
  {
    Item = ListView1->Items->Add();
    Item->Caption = DataArray[i][0];
    for (int j = 1; j <= 4; ++j)
     Item->SubItems->Add(DataArray[i][j]);
  }
}

void __fastcall TForm1::FillStringGrid()
{
  StringGrid1->Cells[0][0] = "CODE";
  StringGrid1->Cells[1][0] = "NAME";
  StringGrid1->Cells[2][0] = "DATE";
  StringGrid1->Cells[3][0] = "SALARY";
  StringGrid1->Cells[4][0] = "IS_MALE";

  for (int i = 0; i <= 4; ++i)
    for (int j = 0; j <= 4; ++j)
      StringGrid1->Cells[j][i + 1] = DataArray[i][j];
}

void __fastcall TForm1::PageControl1Change(TObject* Sender)
{
  int Index1, Index2;

  if ((PageControl1->ActivePage == tshDataSet) ||
     (PageControl1->ActivePage == tshDBGrid))
  {
    Index1 = ComboBox1->ItemIndex;
    Index2 = ComboBox2->ItemIndex;
    if (PageControl1->ActivePage == tshDataSet) Panel2->Parent = tshDataSet;
    else Panel2->Parent = tshDBGrid;

    ComboBox1->ItemIndex = Index1;
    ComboBox2->ItemIndex = Index2;
   }
}

void __fastcall TForm1::ComboBox1Change(TObject* Sender)
{
  Session->GetTableNames(ComboBox1->Text, "", true, false, ComboBox2->Items);
  if (ComboBox2->Items->Count > 0)
  {
    ComboBox2->ItemIndex = 0;
  }
  ComboBox2->OnChange(0);
}

void __fastcall TForm1::ComboBox2Change(TObject* Sender)
{
  if (Table1->Active) Table1->Close();
  if (ComboBox2->ItemIndex > -1)
  {
    if (Table1->Active) Table1->Close();
    Table1->DatabaseName = ComboBox1->Text;
    Table1->TableName = ComboBox2->Text;
    __try
    {
      Table1->Open();
    }
    catch (Exception* E)
    {
      ShowMessage(E->Message);
    }
  }
}
