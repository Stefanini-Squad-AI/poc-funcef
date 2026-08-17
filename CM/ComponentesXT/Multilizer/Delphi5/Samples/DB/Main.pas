unit main;

// This example demonstrates how to translate the column header of DBGrid
// and the hints of the DBNavigator.
//
// Seel the online help indexes 'TDBGrid' and 'TDBNavigator' to learn more

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, DBTables, ExtCtrls, DBCtrls, IvMulti, IvDBMult,
  StdCtrls, IvDatDic, IvDictio;

type
  TMainForm = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    IvDBDictionary1: TIvDBDictionary;
    IvTranslator1: TIvTranslator;
    LanguageButton: TButton;
    procedure LanguageButtonClick(Sender: TObject);
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

procedure TMainForm.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDBDictionary1, '', [], 0, language) then
    IvDBDictionary1.Language := language;
end;

end.
