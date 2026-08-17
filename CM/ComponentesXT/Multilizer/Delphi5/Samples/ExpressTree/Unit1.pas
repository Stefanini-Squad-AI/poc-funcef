{
How to translate the tree views of ExpressTree Suite:

1) Add the TIvExpressTreeModule component to the Component Palette
   See ..\..\customiz.htm

2) Add one TIvExpressTreeModule component to a form or data module
   (only one TIvExpressTreeModule per application is required) or
   add IvExTreeMod unit to the uses clause anywhere in the application

3) Set the TIvTranslator.Targets property
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button

The module does not translate the TdxDBTreeView component. In order to make it
multilingual you have to add an own field to the database for each language and
translate the display strings. See the data.db and
the IvBinaryDictionary1LanguageChange event.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, StdCtrls, dxtree, IvExTreeMod, ComCtrls, dxdbtree,
  Db, DBTables, IvAMulti, IvBinDic;

type
  TForm1 = class(TForm)
    LanguageButton: TButton;
    IvTranslator1: TIvTranslator;
    IvExpressTreeModule1: TIvExpressTreeModule;
    PageControl1: TPageControl;
    Sheet: TTabSheet;
    DBSheet: TTabSheet;
    dxTreeView1: TdxTreeView;
    dxDBTreeView1: TdxDBTreeView;
    DataSource1: TDataSource;
    Table1: TTable;
    IvBinaryDictionary1: TIvBinaryDictionary;
    procedure LanguageButtonClick(Sender: TObject);
    procedure IvBinaryDictionary1LanguageChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  // Changes the active language

  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

procedure TForm1.IvBinaryDictionary1LanguageChange(Sender: TObject);
var
  selected: TTreeNode;
begin
  // Changes the diplay field to match the active language.
  // Stores the selected node and restores it.

  selected := dxDBTreeView1.Selected;
  dxDBTreeView1.DisplayField := Translate('EnglishName');
  dxDBTreeView1.ListField := Translate('EnglishName');
  dxDBTreeView1.Selected := selected;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

end.
