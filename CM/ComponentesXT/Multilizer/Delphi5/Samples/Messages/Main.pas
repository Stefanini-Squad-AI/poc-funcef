unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvDictio, IvMulti, IvAMulti, IvBinDic;

type
  TForm1 = class(TForm)
    StaticGroup: TGroupBox;
    StaticApplicationButton: TButton;
    StaticSystemGroup: TGroupBox;
    StaticSystemButton: TButton;
    DynamicGroup: TGroupBox;
    DynamicApplicationButton: TButton;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DynamicSystemGroup: TGroupBox;
    Label8: TLabel;
    DynamicSystemButton: TButton;
    LanguageButton: TButton;
    IvDictionary1: TIvBinaryDictionary;
    IvTranslator1: TIvTranslator;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CustomButton: TButton;
    procedure StaticApplicationButtonClick(Sender: TObject);
    procedure DynamicApplicationButtonClick(Sender: TObject);
    procedure StaticSystemButtonClick(Sender: TObject);
    procedure DynamicSystemButtonClick(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
    procedure CustomButtonClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  IvLanguD;

type
  EMyException = class(Exception)
  public
    constructor CreateFmt(const msg: string; const args: array of const);
  end;

resourcestring
  SMyString = '''%s'' is not a valid time';

var
  i: Integer;

constructor EMyException.CreateFmt(const msg: string; const args: array of const);
begin
  inherited CreateFmt(msg, args);
end;


procedure TForm1.StaticApplicationButtonClick(Sender: TObject);
begin
  // Use MessageDlg function instead of MesssageBox function.
  // Translate the msg parameter before passing to the function.

  MessageDlg(
    IvDictionary1.Translate('Operation is not allowed'), //ivlm
    mtError,
    [mbOK],
    0);
end;

procedure TForm1.DynamicApplicationButtonClick(Sender: TObject);
var
  fileName: String;
begin
  // Use the MessageDlg function instead of MessageBox function.
  // Translate the msg parameter before passing to the function.

  fileName := 'dummy';
  if not FileExists(fileName) then
  begin
    MessageDlg(
      Format(
        IvDictionary1.Translate('%s does not exists!'),  //ivlm
        [fileName]),
      mtError,
      [mbYes, mbNo],
      0);
  end;
end;

procedure TForm1.StaticSystemButtonClick(Sender: TObject);
begin
  // Error messages that do not contains any parameters (e.g. "Division by zero")
  // might be problematic because VCL does not read them when the error occurs
  // but VCL stores the values of the messages in a structure when the application
  // is started. At this time the active language is not set and the original
  // resource string value is stored.
  //
  // To translate such messages, Multilizer assings Application's HandleException event
  // an event that translates the message.
  //
  // The only thing you have to do is to add the error message to the dictionary.
  //
  // This sample tries to divide by zero causing an exception to occur.
  // The dictionary contains 'Division by zero' string.

  i := 0;
  i := 10 div i;
end;

procedure TForm1.DynamicSystemButtonClick(Sender: TObject);
begin
  // Dynamic error messages (e.g. "'%s' is not a valid time") are easier to
  // translate because VCL reads them only when needed. MULTILIZER can
  // translate them automatically so the only thing you have to do is to add
  // the message to the dictionary.
  //
  // The only thing you have to do is to add the error message to the dictionary.
  //
  // This sample tries to convert an invalid string to a time variable.
  // That's why the system raises an exception. The exception message is
  // "'%s' is not a valid time".

  StrToTime('dummy');
end;

procedure TForm1.CustomButtonClick(Sender: TObject);
begin
  raise EMyException.CreateFmt(SMyString, ['dummy']);
end;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

end.

