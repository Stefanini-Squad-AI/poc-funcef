//---------------------------------------------------------------------------

#ifndef fuQExportDialogADODemoH
#define fuQExportDialogADODemoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ADO_QExport3Dialog.hpp>
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <DB.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:
        TPanel *Panel1;
        TButton *Button1;
        TPageControl *PageControl1;
        TTabSheet *tshDataSet;
        TTabSheet *tshListView;
        TTabSheet *tshDBGrid;
        TDBGrid *DBGrid1;
        TListView *ListView1;
        TDBGrid *DBGrid2;
        TTabSheet *tshStringGrid;
        TStringGrid *StringGrid1;
        TTable *Table1;
        TDataSource *DataSource1;
        TADO_QExport3Dialog *QExportDialog1;
        TPanel *Panel2;
        TComboBox *ComboBox1;
        TLabel *Label1;
        TLabel *Label2;
        TComboBox *ComboBox2;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall PageControl1Change(TObject *Sender);
	void __fastcall ComboBox1Change(TObject *Sender);
	void __fastcall ComboBox2Change(TObject *Sender);
	
private:
	void __fastcall FillListView(void);
	void __fastcall FillStringGrid(void);
public:
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
