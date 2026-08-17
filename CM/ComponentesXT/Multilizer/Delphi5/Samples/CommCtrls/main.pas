{
How to translate the TTreeView, TListView, TOutline and TStringGrid components:

1) Add one TIvControlModule component to a form or data module
   (only one TIvControlModule per application is required) or
   add IvConMod unit to the uses clause anywhere in the application

2) To translate TTreeView add ('', 'Items') to the Targets property.
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button
   - Check if ('', 'Items') was added to the list. If not add it manually.

3) To translate TListView add ('', 'Items') to the Targets property.

4) To translate TOutline add ('', 'Lines') to the Targets property.

5) To translate TStringGrid add ('', 'Cells') to the Targets property.
}

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, IvAMulti, IvBinDic, StdCtrls, ComCtrls,
  IvTestDi, IvConMod, Grids;

type
  TForm1 = class(TForm)
    LanguageButton: TButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    IvTranslator1: TIvTranslator;
    IvControlModule1: TIvControlModule;
    TreeViewSheet: TTabSheet;
    TreeView1: TTreeView;
    ListViewSheet: TTabSheet;
    ListView1: TListView;
    StringGridSheet: TTabSheet;
    StringGrid1: TStringGrid;
    IvBinaryDictionary1: TIvBinaryDictionary;
    procedure LanguageButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[1, 0] := 'Ice Hockey'; //ivlm
  StringGrid1.Cells[2, 0] := 'Football'; //ivlm
  StringGrid1.Cells[0, 1] := 'Finland'; //ivlm
  StringGrid1.Cells[0, 2] := 'Sweden'; //ivlm
  StringGrid1.Cells[1, 1] := '122';
  StringGrid1.Cells[1, 2] := '67';
  StringGrid1.Cells[2, 1] := '21';
  StringGrid1.Cells[2, 2] := '22';

  // By default translator translates the host form just after the form has
  // been loaded from the DFM file. This means that at this the translator has
  // already translated the form. If we want to translate the properties we
  // just changed we have to call the TIvTranslator::Translate method.

  IvTranslator1.Translate;
end;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
