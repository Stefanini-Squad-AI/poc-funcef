unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvAMulti, IvBinDic, Db, DBTables, StdCtrls, DBCtrls,
  IvTestDi, Mask, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBLookupListBox1: TDBLookupListBox;
    DBLookupComboBox1: TDBLookupComboBox;
    LanguageButton: TButton;
    DataSource: TDataSource;
    LookupDataSource: TDataSource;
    ItemsTable: TTable;
    LookupTable: TTable;
    IvTranslator1: TIvTranslator;
    DBNavigator1: TDBNavigator;
    GroupBox3: TGroupBox;
    DBEdit1: TDBEdit;
    IvBinaryDictionary1: TIvBinaryDictionary;
    procedure IvTranslator1LanguageChange(Sender: TObject);
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

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

procedure TForm1.IvTranslator1LanguageChange(Sender: TObject);
begin
  // Solution #1
  // When the language changes the lookup fields must be changed to
  // match the new active language.

  DBLookupListBox1.ListField := Translate('EnglishLookup');
  DBLookupComboBox1.ListField := DBLookupListBox1.ListField;

{
  // Solution #2
  // When the language changes the lookup table must be changed to
  // match the new active language.

  LookupTable.Active := False;
  LookupTable.TableName := Translate('english.db');
  LookupTable.Active := True;
}
end;

end.
