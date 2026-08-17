unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SyntaxEd, SynParse, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvTestDi;

type
  TForm1 = class(TForm)
    SyntaxMemo1: TSyntaxMemo;
    SyntaxMemoParser1: TSyntaxMemoParser;
    EditButton: TButton;
    Label1: TLabel;
    Languages: TComboBox;
    IvTranslator1: TIvTranslator;
    IvDictionary1: TIvTestDictionary;
    procedure EditButtonClick(Sender: TObject);
    procedure LanguagesChange(Sender: TObject);
    procedure IvDictionary1LanguageChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.EditButtonClick(Sender: TObject);
begin
  SyntaxMemoParser1.ModifyProperties;
end;

procedure TForm1.LanguagesChange(Sender: TObject);
var
  old: Integer;
begin
  old := IvDictionary1.Language;
  try
    IvDictionary1.language := Languages.ItemIndex + 1;
  except
    MlMessageDlg(
      'The language that you selected is not compatible with the current system code page.', //ivlm
      mtError,
      [mbOK],
      0);
    IvDictionary1.Language := old;
  end;
end;

procedure TForm1.IvDictionary1LanguageChange(Sender: TObject);
var
  i: Integer;
begin
  Languages.Clear;
  for i := 1 to IvDictionary1.LanguageCount - 1 do
    Languages.Items.Add(IvDictionary1.Languages[i].NativeName);

  Languages.ItemIndex := IvDictionary1.ActiveLanguage - 1;
end;

end.
