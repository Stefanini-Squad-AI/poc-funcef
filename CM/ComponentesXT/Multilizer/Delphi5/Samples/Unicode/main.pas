unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvDictio, IvAMulti, IvMulti, IvFiMult;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    LanguageButton: TButton;
    ListBox1: TListBox;
    IvTranslator1: TIvTranslator;
    IvDictionary1: TIvTextDictionary;
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
  //IvLaSelD;
  
procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

end.
