//---------------------------------------------------------------------------
#ifndef animaluH
#define animaluH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Halcn6DB.hpp"
#include "Halcn6Nv.hpp"
#include <Db.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
    THalcyonNavigator *HalcyonNavigator1;
    THalcyonDataSet *HalcyonDataSet1;
    TDataSource *DataSource1;
    TDBEdit *DBEdit1;
    TDBImage *DBImage1;
    void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
