//---------------------------------------------------------------------------

#ifndef fuCustomSourceDemoH
#define fuCustomSourceDemoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <QExport3.hpp>
#include <QExport3CustomSource.hpp>
#include <QExport3XLS.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TfmCustomSourceDemo : public TForm
{
__published:	// IDE-managed Components
	TPanel *paTop;
	TLabel *Label1;
	TqeCustomSource *qeCustomSource1;
	TStringGrid *StringGrid1;
	TPanel *paButtons;
	TButton *buExport;
	TQExport3XLS *QExport3XLS1;
        void __fastcall buExportClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall qeCustomSource1GetColumnValue(TObject *Sender,
          int RecNo, TqeCustomColumn *Column, Variant &Value);
        void __fastcall qeCustomSource1GetNextRecord(TObject *Sender, 
          int RecNo, bool &Eof);
private:	// User declarations
	void __fastcall FillStringGrid();
public:		// User declarations
        __fastcall TfmCustomSourceDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmCustomSourceDemo *fmCustomSourceDemo;
//---------------------------------------------------------------------------
#endif
