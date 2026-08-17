{
How to translate QR reports:

1) Set the TIvTranslator.CharsetChange to ivccAll

2) Do not use the default preview but write the OnPreview event.
   See the TMainForm.QuickRep1Preview event

3) Add the preview strings to the dictionary by starting Language Manager and
   choosing Project | Include Strings | QuickReport Strings and
   check the Preview button.
}

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls, Db, DBTables, StdCtrls, IvDictio, IvTestDi,
  IvMulti, IvAMulti, IvBinDic;

type
  TMainForm = class(TForm)
    Table1: TTable;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    PreviewButton: TButton;
    LanguageButton: TButton;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    ReportButton: TButton;
    IvTranslator1: TIvTranslator;
    QRDBText2: TQRDBText;
    IvDictionary1: TIvBinaryDictionary;
    procedure PreviewButtonClick(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure ReportButtonClick(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1Preview(Sender: TObject);

  private
    counter: Integer;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  QRPrev,
  IvLanguD,
  Report;

procedure TMainForm.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

procedure TMainForm.QuickRep1BeforePrint(
  Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  counter := 0;
end;

procedure TMainForm.QRLabel1Print(sender: TObject; var Value: String);
begin
  Inc(counter);
  Value := Format(IvDictionary1.Translate('Person #%d:'), [counter]);
end;

procedure TMainForm.PreviewButtonClick(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TMainForm.ReportButtonClick(Sender: TObject);
var
  report: TQRLabelsForm;
begin
  report := TQRLabelsForm.Create(Self);
  try
    report.Preview;
  finally
    report.Free;
  end;
end;

procedure TMainForm.QuickRep1Preview(Sender: TObject);
var
  dialog: TQRStandardPreview;
  translator: TIvTranslator;
begin
  // Creates the preview form, translates it, and finally shows the form.

  dialog := TQRStandardPreview.CreatePreview(Application, QuickRep1.QRPrinter);
  translator := TIvTranslator.Create(nil);
  try
    translator.Targets.Add(TIvTargetProperty.Create('', 'Caption', ivttInclude));
    translator.Targets.Add(TIvTargetProperty.Create('', 'Hint', ivttInclude));
    translator.TranslateForm(dialog);
  finally
    translator.Free;
  end;
  dialog.Show;
end;

end.
