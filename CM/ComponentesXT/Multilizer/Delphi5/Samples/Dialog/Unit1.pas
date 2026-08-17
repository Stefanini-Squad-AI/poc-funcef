{
How to translate the common dialogs:

1) Add the TIvDialogModule component to the main form or data module.

2) Add the native string of the common dialogs to the dictionary.
   - Start Language Manager
   - Choose Project | Include Strings | Dialog Strings
   - Check the dialog type(s) that you use.
   - Press OK to update the dictionary
   This add the the strings used by the common dialogs.
   If you have the common dialog components on the form, Language Manager
   can automatically add the include strings to the dictionary.
   
   Note! These strings MUST ALWAYS be in US English, even if the native
         language of your application is not English.

3) To translate the open or save dialog
   add ('', 'Title') and ('', 'Filter') to the Targets property
   - Right click the TIvTranslator component
   - Choose Targets...
   - Press the Detect button
   - Check if the above targets were added to the list.
     If not add them manually.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvMulti, IvDlgMod, IvDictio, IvTestDi, StdCtrls, ExtDlgs, IvAMulti, IvBinDic,
  IvPSDlg;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    OpenButton: TButton;
    SaveDialog1: TSaveDialog;
    SaveButton: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenPictureButton: TButton;
    SavePictureDialog1: TSavePictureDialog;
    SavePictureButton: TButton;
    FontDialog1: TFontDialog;
    FontButton: TButton;
    ColorDialog1: TColorDialog;
    ColorButton: TButton;
    PrintDialog1: TPrintDialog;
    PrintButton: TButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrinterSetupButton: TButton;
    FindDialog1: TFindDialog;
    FindButton: TButton;
    ReplaceDialog1: TReplaceDialog;
    ReplaceButton: TButton;
    LanguageButton: TButton;
    IvTranslator1: TIvTranslator;
    IvDialogModule1: TIvDialogModule;
    IvBinaryDictionary1: TIvBinaryDictionary;
    procedure OpenButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure OpenPictureButtonClick(Sender: TObject);
    procedure SavePictureButtonClick(Sender: TObject);
    procedure FontButtonClick(Sender: TObject);
    procedure ColorButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure PrinterSetupButtonClick(Sender: TObject);
    procedure FindButtonClick(Sender: TObject);
    procedure ReplaceButtonClick(Sender: TObject);
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
  
procedure TForm1.OpenButtonClick(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  SaveDialog1.Execute;
end;

procedure TForm1.OpenPictureButtonClick(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
end;

procedure TForm1.SavePictureButtonClick(Sender: TObject);
begin
  SavePictureDialog1.Execute;
end;

procedure TForm1.FontButtonClick(Sender: TObject);
begin
  FontDialog1.Execute;
end;

procedure TForm1.ColorButtonClick(Sender: TObject);
begin
  ColorDialog1.Execute;
end;

procedure TForm1.PrintButtonClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TForm1.PrinterSetupButtonClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TForm1.FindButtonClick(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.ReplaceButtonClick(Sender: TObject);
begin
  ReplaceDialog1.Execute;
end;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  // Changes the active language of the application
  // The SelectLanguage function shows a dialog box.
  // If the user presses OK, the function returns True and
  // and the selected language in the language parameter.

  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

end.
 