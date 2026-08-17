unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IvDictio, IvMulti, IvAMulti, IvBinDic, IvFiMult,
  IvDsMult, IvMLDDic;

type
  TForm1 = class(TForm)
    Language: TRadioGroup;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    IvTranslator1: TIvTranslator;
    IvDictionary1: TIvBinaryDictionary;
    procedure LanguageClick(Sender: TObject);
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

procedure TForm1.LanguageClick(Sender: TObject);
begin
  if IvDictionary1.ActiveLanguage <> Language.ItemIndex + 1 then
    IvDictionary1.Language := Language.ItemIndex + 1;
end;

procedure TForm1.IvDictionary1LanguageChange(Sender: TObject);
begin
  Language.ItemIndex := IvDictionary1.ActiveLanguage - 1;
end;

end.
