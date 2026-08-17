unit Unit1;

{
This samples application demonstrates the case where the native language of
the application is not English. In this case it is Finnish.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvDictio, IvAMulti, IvBinDic, IvMulti;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    IvTranslator1: TIvTranslator;
    IvBinaryDictionary1: TIvBinaryDictionary;
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
