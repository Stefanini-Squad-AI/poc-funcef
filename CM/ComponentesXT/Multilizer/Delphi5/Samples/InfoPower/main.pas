{
How to translate the InfoPower components:

1) Add the TIvInfoPowerModule component to the Component Palette.
   See ..\..\manual.htm and ..\..\customiz.htm.

2) Add one TIvInfoPowerModule component to main form or data module
   (only one TIvInfoPowerModule per application is required) or
   add Iv1stMod unit to the uses clause anywhere in the application.

3) If you use the TwwDBRichEdit component add one TIvDialogModule component to
   main form or data module (only one TIvDialogModule per application is
   required) or add IvDlgMod unit to the uses clause anywhere in the
   application.

4) Set the TIvTranslator.Targets property to match IP components:
   - All dialogs: Add ('', 'BtnOKCaption') and ('', 'BtnCancelCaption') to the Targets property

   - User Message dialog: add ('TwwUserMessagesIntl', '') to the Targets property

   - TwwSearchDialog: add ('TwwSearchDialogIntl', '') to the Targets property

   - TwwLocateDialog: add ('TwwLocateDialogIntl', '') to the Targets property

   - TwwFilterDialog: add ('TwwFilterDialogIntl', '') to the Targets property

   - TwwRecordViewDialog: add ('TwwDBNavigatorIntlHints', '') to the Targets property

   - TwwDBRich: add
     ('TwwDBRichEditIntl', ''),
     ('TwwRichEditMenuLabels', ''),
     ('TwwRichEditPopupMenuLabels', ''),
     ('TwwRichEditParagraphDlg', '') and
     ('TwwRichEditTabDlg', '') to the Targets property

   - TwwDBGrid: add ('', 'DisplayLabel') to the Targets property

   To add the above targets automatically:
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button
}

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwtable, StdCtrls, Mask,
  Wwintl, wwrcdvw, Wwfltdlg, wwidlg, Wwlocate, ComCtrls, wwriched, IvDictio,
  IvMulti, IvAMulti, IvBinDic, IvEBinDi, wwDialog, IvIPMod, IvDlgMod,
  IvTestDi, Wwdbdlg, wwdblook, wwdbedit, Wwdotdot, wwSpeedButton,
  wwDBNavigator, ExtCtrls, wwclearpanel;

type
  TMainForm = class(TForm)
    wwTable1: TwwTable;
    wwDataSource1: TwwDataSource;
    LanguageButton: TButton;
    wwMemoDialog1: TwwMemoDialog;
    wwSearchDialog1: TwwSearchDialog;
    wwLocateDialog1: TwwLocateDialog;
    wwLookupDialog1: TwwLookupDialog;
    wwFilterDialog1: TwwFilterDialog;
    wwRecordViewDialog1: TwwRecordViewDialog;
    wwIntl1: TwwIntl;
    IvTranslator1: TIvTranslator;
    IvInfoPowerModule1: TIvInfoPowerModule;
    IvDialogModule1: TIvDialogModule;
    PageControl1: TPageControl;
    wwDBGridSheet: TTabSheet;
    wwDBRichEditSheet: TTabSheet;
    DialogSheet: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    Label1: TLabel;
    wwDBRichEdit1: TwwDBRichEdit;
    Label2: TLabel;
    MemoButton: TButton;
    SearchButton: TButton;
    LocateButton: TButton;
    LookupButton: TButton;
    FilterButton: TButton;
    RecordViewButton: TButton;
    Label3: TLabel;
    RichEditButton: TButton;
    RichFindButton: TButton;
    RichReplaceButton: TButton;
    RichFontButton: TButton;
    RichParagraphButton: TButton;
    RichTabButton: TButton;
    IvDictionary1: TIvBinaryDictionary;
    ControlSheet: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    wwDBComboDlg1: TwwDBComboDlg;
    GroupBox3: TGroupBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupComboDlg1: TwwDBLookupComboDlg;
    LookupTable: TwwTable;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1PriorPage: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1NextPage: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    wwDBNavigator1SaveBookmark: TwwNavButton;
    wwDBNavigator1RestoreBookmark: TwwNavButton;
    procedure FormActivate(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
    procedure MemoButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure LocateButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure RecordViewButtonClick(Sender: TObject);
    procedure LookupButtonClick(Sender: TObject);
    procedure RichEditButtonClick(Sender: TObject);
    procedure RichFindButtonClick(Sender: TObject);
    procedure RichReplaceButtonClick(Sender: TObject);
    procedure RichFontButtonClick(Sender: TObject);
    procedure RichParagraphButtonClick(Sender: TObject);
    procedure RichTabButtonClick(Sender: TObject);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  IvLanguD;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  // If you open the table manually (i.e. the Active property is false)
  // you have to call the TIvTranslator.Translate method

  //wwTable1.Active := True;
  //IvTranslator1.Translate;
end;

procedure TMainForm.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

procedure TMainForm.MemoButtonClick(Sender: TObject);
begin
  wwMemoDialog1.Execute;
end;

procedure TMainForm.SearchButtonClick(Sender: TObject);
begin
  wwSearchDialog1.Execute;
end;

procedure TMainForm.LocateButtonClick(Sender: TObject);
begin
  wwLocateDialog1.Execute;
end;

procedure TMainForm.LookupButtonClick(Sender: TObject);
begin
  wwLookupDialog1.Execute;
end;

procedure TMainForm.FilterButtonClick(Sender: TObject);
begin
  wwFilterDialog1.Execute;
end;

procedure TMainForm.RecordViewButtonClick(Sender: TObject);
begin
  wwRecordViewDialog1.Execute;
end;

procedure TMainForm.RichEditButtonClick(Sender: TObject);
begin
  wwDBRichEdit1.Execute;
end;

procedure TMainForm.RichFindButtonClick(Sender: TObject);
begin
  wwDBRichEdit1.ExecuteFindDialog;
end;

procedure TMainForm.RichReplaceButtonClick(Sender: TObject);
begin
  wwDBRichEdit1.ExecuteReplaceDialog;
end;

procedure TMainForm.RichFontButtonClick(Sender: TObject);
begin
  wwDBRichEdit1.ExecuteFontDialog;
end;

procedure TMainForm.RichParagraphButtonClick(Sender: TObject);
begin
  wwDBRichEdit1.ExecuteParagraphDialog;
end;

procedure TMainForm.RichTabButtonClick(Sender: TObject);
begin
  wwDBRichEdit1.ExecuteTabDialog;
end;

procedure TMainForm.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  ShowMessage(Translate('This is a message'));
end;

end.
