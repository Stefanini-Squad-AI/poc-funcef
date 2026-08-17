//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <QExport3.hpp>
#include <QExport3XLS.hpp>
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
//---------------------------------------------------------------------------
class TForm1 : public Forms::TForm
{
__published:
    TTable *Table1;
    TDataSource *DataSource1;
    TQExport3XLS *QExportXLS1;
    TLabel *Label1;
    TPanel *Panel1;
    TPanel *Panel2;
    TButton *Button1;
    TPageControl *PageControl1;
    TTabSheet *tshDataSet;
    TTabSheet *tshDBGrid;
    TTabSheet *tshListView;
    TDBGrid *DBGrid1;
    TDBGrid *DBGrid2;
    TTabSheet *tshStringGrid;
    TListView *ListView1;
    TStringGrid *StringGrid1;
    TGroupBox *gbExportedSheets;
    TCheckBox *chDataSet;
    TCheckBox *chDBGrid;
    TCheckBox *chListView;
    TCheckBox *chStringGrid;
    
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall Button1Click(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall QExportXLS1GetDataParams(TObject *Sender, int Sheet, 
      int Col, int Row, TxlsFormat *Format, AnsiString &FormatText);
        void __fastcall QExportXLS1GetFooterParams(TObject *Sender,
          int Sheet, int Col, int Row, TxlsFormat *Format, WideString &S);
        void __fastcall QExportXLS1GetHeaderParams(TObject *Sender,
          int Sheet, int Col, int Row, TxlsFormat *Format, WideString &S);
private:
    bool FFlag;
    void __fastcall FillListViewAndStringGrid(void);
public:
        __fastcall TForm1(TComponent* Owner);
};

//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
