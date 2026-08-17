//----------------------------------------------------------------------------
#ifndef lookupuH
#define lookupuH
//----------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Windows.hpp>
#include <Messages.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBCtrls.hpp>
#include <DB.hpp>
#include "Halcn6DB.hpp"
#include <Db.hpp>
#include <ExtCtrls.hpp>
#include <Mask.hpp>
//----------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:
	TScrollBox *ScrollBox;
	TLabel *Label1;
	TDBEdit *EditACCT_NBR;
	TLabel *Label2;
	TDBEdit *EditSYMBOL;
	TLabel *Label3;
	TDBEdit *EditSHARES;
	TLabel *Label4;
	TDBEdit *EditPUR_PRICE;
	TLabel *Label5;
	TDBEdit *EditPUR_DATE;
	TDBNavigator *DBNavigator;
	TPanel *Panel1;
	TDataSource *DataSource1;
	TPanel *Panel2;
    THalcyonDataSet *HalcyonDataSet1;
    TDBLookupComboBox *DBLookupComboBox1;
    TDataSource *DataSource2;
    THalcyonDataSet *HalcyonDataSet2;
	void __fastcall FormCreate(TObject *Sender);
private:
	// private declarations
public:
	// public declarations
	__fastcall TMainForm(TComponent *Owner);
};
//----------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//----------------------------------------------------------------------------
#endif
