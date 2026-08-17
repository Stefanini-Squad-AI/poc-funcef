{
How to translate the series of TChart:

1) Add the TIvChartModule component to the Component Palette
   See ..\..\customiz.htm

2) Add one TIvChartModule component to a form or data module
   (only one TIvChartModule per application is required) or
   add IvChaMod unit to the uses clause anywhere in the application

3) Add ('TChartTitle', 'Text') or ('', 'Text') to the Targets property
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button
   - Check if Text was added to the list. If not add it manually.

Read the comments in the OnCreate event.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TeeProcs, Chart, TeEngine, Series, IvDictio, IvMulti,
  IvEMulti, IvTestDi, IvAMulti, IvBinDic, IvChaMod;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    LanguageButton: TButton;
    Series1: TBarSeries;
    IvBinaryDictionary1: TIvBinaryDictionary;
    IvTranslator1: TIvTranslator;
    IvChartModule1: TIvChartModule;
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
  // Inits the chart
  // Note the ivlm comments.
  // They are for Language Manager to extract the string to the dictionary.

  with Series1 do
  begin
    Add(20.1, 'Car', clRed); //ivlm
    Add(30.4, 'Buss', clGreen); //ivlm
    Add(60.5, 'Bicycle', clBlue); //ivlm
  end;

  // Translates the form.
  // The ivtoAutoOpen flag of the TIvTranslator.Options method is set false.
  // That's why we have to call the TIvTranslator.Translate method manually.

  IvTranslator1.Translate;
end;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  // Selects a new active language

  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
