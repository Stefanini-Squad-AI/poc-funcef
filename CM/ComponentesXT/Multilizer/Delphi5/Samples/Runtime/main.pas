unit main;

// This sample demonstrates how to add components on run-time to a multilingual
// application

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvMulti, IvAMulti, IvBinDic, Menus, IvDictio;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    LanguageButton: TButton;
    AddButton: TButton;
    IvTranslator1: TIvTranslator;
    IvBinaryDictionary1: TIvBinaryDictionary;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    procedure AddButtonClick(Sender: TObject);
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
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

procedure TMainForm.AddButtonClick(Sender: TObject);
var
  lab: TLabel;
  item: TMenuItem;
begin
  // This adds two components on run-time.
  // Always use the native language when creating new components on run-time.

  lab := TLabel.Create(Self);
  lab.Parent := Self;
  lab.Caption := 'Sample 2'; //ivlm This tag is for Language Manager to scan the string
  lab.SetBounds(10, 50, 100, 50);

  item := TMenuItem.Create(Self);
  item.Caption := 'Exit'; //ivlm
  File1.Add(item);

  // After you have added the components call the Translate method to translate
  // them to the current language.

  IvTranslator1.Translate;
end;

end.
