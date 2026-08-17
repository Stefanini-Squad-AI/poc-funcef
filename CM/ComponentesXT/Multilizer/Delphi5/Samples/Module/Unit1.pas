// NOTE: Install MLSample.dpk package before opening this sample.
//       It adds TMyControl and TMyModule to the Component Palette.
//
// This sample application demonstrates the using of translator module
// The TMyControl component has the Items property that is not published.
// Thats's why the TIvTranslator can not translate it. To make the TMyControl
// multilingual a translator module, TMyModule, has been written.
//
// By default Multilizer translates the form just after it has been loaded
// from the DFM file. This has been disabled by setting ivtoAutoOpen flag of
// IvTranslator1.Options to false.
//
// The form is translate in the last line of the OnCreate event.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MyControl, IvMulti, MyModule, IvDictio, IvAMulti, IvBinDic;

type
  TForm1 = class(TForm)
    MyControl1: TMyControl;
    Button1: TButton;
    IvBinaryDictionary1: TIvBinaryDictionary;
    IvTranslator1: TIvTranslator;
    MyModule1: TMyModule;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  // Adds the items to the control

  MyControl1.Add('One'); //ivlm
  MyControl1.Add('Two'); //ivlm
  MyControl1.Add('Three'); //ivlm

  // Translates the form

  IvTranslator1.Translate;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  language: Integer;
begin
  // Changes the new active language

  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
