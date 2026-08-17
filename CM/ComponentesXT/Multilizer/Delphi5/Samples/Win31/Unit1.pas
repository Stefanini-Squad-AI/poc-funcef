unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, Outline, Tabs, ComCtrls, Tabnotbk, IvMulti,
  IvConMod, IvDictio, IvAMulti, IvBinDic;

type
  TForm1 = class(TForm)
    Notebook1: TNotebook;
    TabSet1: TTabSet;
    LanguageButton: TButton;
    Outline1: TOutline;
    Header1: THeader;
    TabbedNotebook1: TTabbedNotebook;
    Label1: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    IvBinaryDictionary1: TIvBinaryDictionary;
    IvTranslator1: TIvTranslator;
    IvControlModule1: TIvControlModule;
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  Notebook1.PageIndex := 0;
  TabSet1.TabIndex := 0;
end;

procedure TForm1.TabSet1Change(
  Sender: TObject;
  NewTab: Integer;
  var AllowChange: Boolean);
begin
  Notebook1.PageIndex := NewTab;
end;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
