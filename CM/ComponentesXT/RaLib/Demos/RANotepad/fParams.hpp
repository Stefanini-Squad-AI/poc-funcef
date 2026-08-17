// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'fParams.pas' rev: 5.00

#ifndef fParamsHPP
#define fParamsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <RAHLEditor.hpp>	// Pascal unit
#include <RAEditor.hpp>	// Pascal unit
#include <ColorGrd.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <RARegAuto.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fparams
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TParamsForm;
class PASCALIMPLEMENTATION TParamsForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Comctrls::TPageControl* Pages;
	Stdctrls::TButton* bCancel;
	Stdctrls::TButton* bOK;
	Comctrls::TTabSheet* tsEditor;
	Stdctrls::TLabel* Label1;
	Stdctrls::TComboBox* cbKeyboardLayot;
	Stdctrls::TGroupBox* gbEditor;
	Stdctrls::TCheckBox* cbUndoAfterSave;
	Stdctrls::TCheckBox* cbDoubleClickLine;
	Stdctrls::TCheckBox* cbKeepTrailingBlanks;
	Stdctrls::TCheckBox* cbSytaxHighlighting;
	Stdctrls::TCheckBox* cbAutoIndent;
	Stdctrls::TCheckBox* cbSmartTab;
	Stdctrls::TCheckBox* cbBackspaceUnindents;
	Stdctrls::TCheckBox* cbGroupUndo;
	Stdctrls::TCheckBox* cbCursorBeyondEOF;
	Stdctrls::TEdit* eTabStops;
	Stdctrls::TLabel* Label2;
	Comctrls::TTabSheet* tsColors;
	Stdctrls::TLabel* Label3;
	Stdctrls::TComboBox* cbColorSettings;
	Stdctrls::TLabel* Label4;
	Stdctrls::TListBox* lbElements;
	Stdctrls::TLabel* Label5;
	Colorgrd::TColorGrid* ColorGrid;
	Stdctrls::TGroupBox* GroupBox1;
	Stdctrls::TCheckBox* cbBold;
	Stdctrls::TCheckBox* cbItalic;
	Stdctrls::TCheckBox* cbUnderline;
	Stdctrls::TGroupBox* GroupBox2;
	Stdctrls::TCheckBox* cbDefForeground;
	Stdctrls::TCheckBox* cbDefBackground;
	Raregauto::TRegAuto* raColorSamples;
	Stdctrls::TLabel* Label6;
	Raregauto::TRegAuto* RegAuto1;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall NotImplemented(System::TObject* Sender);
	void __fastcall lbElementsClick(System::TObject* Sender);
	void __fastcall lbElementsDrawItem(Controls::TWinControl* Control, int Index, const Windows::TRect 
		&Rect, Windows::TOwnerDrawState State);
	void __fastcall ColorChanged(System::TObject* Sender);
	void __fastcall cbColorSettingsChange(System::TObject* Sender);
	void __fastcall DefClick(System::TObject* Sender);
	void __fastcall RegAuto1AfterSave(System::TObject* Sender);
	void __fastcall RegAuto1AfterLoad(System::TObject* Sender);
	
private:
	Rahleditor::TRAHLEditor* RAHLEditor1;
	Rahleditor::THighLighter FHighlighter;
	Raregauto::TRegAuto* FRegAuto;
	Rahleditor::TSymbolColor* SC;
	bool InChanging;
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TParamsForm(Classes::TComponent* AOwner) : Forms::TForm(
		AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TParamsForm(Classes::TComponent* AOwner, int 
		Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TParamsForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TParamsForm(HWND ParentWindow) : Forms::TForm(ParentWindow
		) { }
	#pragma option pop
	
};


class DELPHICLASS TParams;
class PASCALIMPLEMENTATION TParams : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	bool DoubleClickLine;
	bool UndoAfterSave;
	bool KeepTrailingBlanks;
	bool AutoIndent;
	bool SmartTab;
	bool BackspaceUnindents;
	bool GroupUndo;
	bool CursorBeyondEOF;
	bool SytaxHighlighting;
	AnsiString TabStops;
	int RightMargin;
	__fastcall TParams(void);
	__fastcall virtual ~TParams(void);
	void __fastcall Save(Raregauto::TRegAuto* ARegAuto);
	void __fastcall Restore(Raregauto::TRegAuto* ARegAuto);
	void __fastcall LoadColors(Raregauto::TRegAuto* ARegAuto, const AnsiString Section, Rahleditor::TRAHLEditor* 
		ARAHLEditor);
	void __fastcall SaveColors(Raregauto::TRegAuto* ARegAuto, const AnsiString Section, Rahleditor::TRAHLEditor* 
		ARAHLEditor);
};


typedef AnsiString fParams__3[10];

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString HighLighters[10];
extern PACKAGE TParams* Params;
extern PACKAGE bool __fastcall Show(Raregauto::TRegAuto* ARegAuto, Rahleditor::THighLighter AHighlighter
	, const bool EditorPagesOnly);

}	/* namespace Fparams */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Fparams;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// fParams
