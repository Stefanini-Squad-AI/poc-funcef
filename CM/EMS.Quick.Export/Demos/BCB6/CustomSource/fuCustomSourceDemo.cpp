//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "fuCustomSourceDemo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "QExport3"
#pragma link "QExport3CustomSource"
#pragma link "QExport3XLS"
#pragma resource "*.dfm"
TfmCustomSourceDemo *fmCustomSourceDemo;
//---------------------------------------------------------------------------
__fastcall TfmCustomSourceDemo::TfmCustomSourceDemo(TComponent* Owner)
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

void __fastcall TfmCustomSourceDemo::buExportClick(TObject *Sender)
{
  qeCustomSource1->Eof = false;
  QExport3XLS1->Execute();
}

void __fastcall TfmCustomSourceDemo::FillStringGrid()
{
  StringGrid1->Cells[0][0] = "CODE";
  StringGrid1->Cells[1][0] = "NAME";
  StringGrid1->Cells[2][0] = "DATE";
  StringGrid1->Cells[3][0] = "SALARY";
  StringGrid1->Cells[4][0] = "IS_MALE";

  for (int i = 0; i <= 4; i++)
    for (int j = 0; j <= 4; j++)
    {
      StringGrid1->Cells[j][i + 1] = DataArray[i][j];
      if (j == 3)
      {
        TReplaceFlags Flags;
        Flags << rfReplaceAll << rfIgnoreCase;
        StringGrid1->Cells[j][i + 1] = StringReplace(StringGrid1->Cells[j][i + 1], ".",
          DecimalSeparator, Flags);
      }
    }
}

void __fastcall TfmCustomSourceDemo::FormCreate(TObject *Sender)
{
  QExport3XLS1->FileName = ExtractFilePath(Application->ExeName) + "CustomSourceDemo.xls";
  FillStringGrid();
}

void _fastcall TfmCustomSourceDemo::qeCustomSource1GetColumnValue(
  TObject *Sender, int RecNo, TqeCustomColumn *Column, Variant &Value)
{
  if (Column->Index == 3)
  {
    TReplaceFlags Flags;
    Flags << rfReplaceAll << rfIgnoreCase;
    Value = StringReplace(DataArray[RecNo - 1][Column->Index], ".",
            DecimalSeparator, Flags);
  }
  else 
  {
    Value = DataArray[RecNo - 1][Column->Index];
  }
}

void __fastcall TfmCustomSourceDemo::qeCustomSource1GetNextRecord(TObject *Sender,
  int RecNo, bool &Eof)
{
  Eof = RecNo == 5; 
}
