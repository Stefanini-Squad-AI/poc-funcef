{
How to translate the TDBScroll component:

Multilizer can translate:
- Column headers. Add the ('', 'Header') target to the TIvTranslator.Targets
- Selected string. Add the ('', 'InfoText') target to the TIvTranslator.Targets
- Caption of the seach box. Add the ('', 'Caption') target to the TIvTranslator.Targets

To set the TIvTranslator.Targets property
- Right click the TIvTranslator component
- Choose Targets...
- Press the Detect button
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBScroll, Db, DBTables, IvDictio, IvMulti, IvAMulti, IvBinDic,
  ExtCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    DBScroll1: TDBScroll;
    LanguageButton: TButton;
    Table1: TTable;
    DataSource1: TDataSource;
    IvBinaryDictionary1: TIvBinaryDictionary;
    IvTranslator1: TIvTranslator;
    DBNavigator1: TDBNavigator;
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

end.
