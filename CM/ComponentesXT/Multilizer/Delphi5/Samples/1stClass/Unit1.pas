{
How to translate the color list of 1stClass:

1) Add the TIv1stClassModule component to the Component Palette
   See ..\..\manual.htm and ..\..\customiz.htm

2) Add one TIv1stClassModule component to a form or data module
   (only one TIv1stClassModule per application is required) or
   add Iv1stMod unit to the uses clause anywhere in the application

3) Add ('TfcColorList', 'CustomColors') and ('TfcColorCombo', 'CustomColors') or
   ('', 'CustomColors') to the Targets property
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button
   - Check if CustomColors was added to the list. If not add it manually.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fcColorCombo, fcCombo, IvDictio, IvMulti, Iv1stMod, IvAMulti,
  IvBinDic;

type
  TForm1 = class(TForm)
    fcColorCombo1: TfcColorCombo;
    fcColorList1: TfcColorList;
    Button1: TButton;
    IvTranslator1: TIvTranslator;
    Iv1stClassModule1: TIv1stClassModule;
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
  