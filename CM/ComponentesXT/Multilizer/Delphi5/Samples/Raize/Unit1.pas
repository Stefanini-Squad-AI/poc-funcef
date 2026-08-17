{
How to translate the tree and list views of Raize Components 2.5:

1) Add the TIvRaizeModule component to the Component Palette
   See ..\..\customiz.htm

2) Add one TIvRaizeModule component to a form or data module
   (only one TIvRaizeModule per application is required) or
   add IvRzMod unit to the uses clause anywhere in the application

3) Set the TIvTranslator.Targets property
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RzRadGrp, RzRadChk, ExtCtrls, RzPanel, RzButton, StdCtrls, RzEdit,
  RzLabel, ComCtrls, RzTrkBar, RzCmboBx, RzLstBox, RzPrgres, RzStatus,
  RzCommon, IvDictio, IvMulti, IvTestDi, RzBmpBtn, RzLnEdit, RzBHints,
  RzBorder, RzChkLst, RzTreeVw, RzListVw, IvDlgMod, IvConMod, IvRzMod,
  RzLaunch, Menus, RzLookup, Mask, Db, DBTables, Grids, DBGrids, RzDBLook,
  IvAMulti, IvBinDic;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RzStatusBar1: TRzStatusBar;
    RzFrameController1: TRzFrameController;
    RzClockStatus1: TRzClockStatus;
    RzKeyStatus1: TRzKeyStatus;
    RzGlyphStatus1: TRzGlyphStatus;
    RzProgressBar1: TRzProgressBar;
    RzMarqueeStatus1: TRzMarqueeStatus;
    LanguageButton: TButton;
    TabSheet3: TTabSheet;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzGroupBox6: TRzGroupBox;
    RzGroupBox7: TRzGroupBox;
    RzGroupBox8: TRzGroupBox;
    RzGroupBox9: TRzGroupBox;
    RzGroupBox10: TRzGroupBox;
    RzCheckList1: TRzCheckList;
    RzTabbedListBox1: TRzTabbedListBox;
    RzEditListBox1: TRzEditListBox;
    RzColorComboBox1: TRzColorComboBox;
    RzMRUComboBox1: TRzMRUComboBox;
    RzGroupBox11: TRzGroupBox;
    RzListView1: TRzListView;
    RzTreeView1: TRzTreeView;
    RzCheckTree1: TRzCheckTree;
    RzLineComboBox1: TRzLineComboBox;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzGroupBox12: TRzGroupBox;
    RzGroupBox13: TRzGroupBox;
    RzGroupBox14: TRzGroupBox;
    RzMemo1: TRzMemo;
    RzButton1: TRzButton;
    RzMenuButton1: TRzMenuButton;
    RzGroupBox15: TRzGroupBox;
    RzCheckBox1: TRzCheckBox;
    RzGroupBox16: TRzGroupBox;
    RzListBox1: TRzListBox;
    RzGroupBox17: TRzGroupBox;
    RzComboBox1: TRzComboBox;
    RzRadioGroup1: TRzRadioGroup;
    IvDialogModule1: TIvDialogModule;
    IvRaizeModule1: TIvRaizeModule;
    RzLauncher1: TRzLauncher;
    RzGroupBox18: TRzGroupBox;
    RzRadioButton2: TRzRadioButton;
    RzRadioButton1: TRzRadioButton;
    PopupMenu1: TPopupMenu;
    One1: TMenuItem;
    Two1: TMenuItem;
    Tree1: TMenuItem;
    TabSheet4: TTabSheet;
    RzGroupBox19: TRzGroupBox;
    RzLEDDisplay1: TRzLEDDisplay;
    RzGroupBox21: TRzGroupBox;
    RzBmpButton1: TRzBmpButton;
    RzLookupDialog1: TRzLookupDialog;
    RzBalloonHints1: TRzBalloonHints;
    RzGroupBox22: TRzGroupBox;
    RzURLLabel1: TRzURLLabel;
    RzGroupBox24: TRzGroupBox;
    LookupDialogButton: TRzButton;
    LookupEdit: TRzEdit;
    RzDBLookupDialog1: TRzDBLookupDialog;
    RzGroupBox25: TRzGroupBox;
    RzGroupBox26: TRzGroupBox;
    DBLookupDialogButton: TRzButton;
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    IvBinaryDictionary1: TIvBinaryDictionary;
    IvTranslator1: TIvTranslator;
    RzGroupBox5: TRzGroupBox;
    RzResourceStatus1: TRzResourceStatus;
    procedure FormActivate(Sender: TObject);
    procedure LookupDialogButtonClick(Sender: TObject);
    procedure DBLookupDialogButtonClick(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  IvLanguD;

procedure TForm1.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TForm1.LookupDialogButtonClick(Sender: TObject);
begin
  RzLookupDialog1.Execute;
end;

procedure TForm1.DBLookupDialogButtonClick(Sender: TObject);
begin
  RzDBLookupDialog1.Execute;
end;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
