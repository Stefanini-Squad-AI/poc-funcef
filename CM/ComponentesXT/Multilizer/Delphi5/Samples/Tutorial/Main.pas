unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ComCtrls;

type
  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    DistanceEdit: TEdit;
    UnitLabel: TLabel;
    CalculateButton: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    ExitMenu: TMenuItem;
    Label2: TLabel;
    CurrentTime: TLabel;
    Label3: TLabel;
    SpeedingFine: TLabel;
    StatusBar1: TStatusBar;
    AboutMenu: TMenuItem;
    Label4: TLabel;
    Label1: TLabel;
    CurrentLocale: TLabel;
    CurrentLanguage: TLabel;
    procedure CalculateButtonClick(Sender: TObject);
    procedure AboutMenuClick(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    procedure DisplayHint(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.DisplayHint(Sender: TObject);
begin
  // Shows the hint on the status bar

  StatusBar1.SimpleText := GetLongHint(Application.Hint);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // Redirects hints to the status bar

  Application.OnHint := DisplayHint;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  // Updates the speeding fine and time labels

  SpeedingFine.Caption := Format('%m', [500.0]);
  CurrentTime.Caption := DateTimeToStr(Now);
end;

procedure TMainForm.CalculateButtonClick(Sender: TObject);
var
  distance, hours, minutes: Integer;
begin
  // Calculates the average driving time

  try
    distance := StrToInt(DistanceEdit.Text);
    if distance < 0 then
      raise Exception.Create('');

    hours := distance div 100;
    minutes := Round(0.6*(distance mod 100));

    MessageDlg(
      Format(
        'The avarage driving time is %0:d hours and %1:d minutes.',
        [hours, minutes]),
      mtInformation,
      [mbOK],
      0);
  except
    MessageDlg(
      Format(
        '"%s" is not a valid distance!',
        [DistanceEdit.Text]),
      mtError,
      [mbOK],
      0);
    DistanceEdit.SetFocus;
  end;
end;

procedure TMainForm.AboutMenuClick(Sender: TObject);
begin
  // Shows an about dialog box

  MessageDlg(
    'Dcalc is a multilingual application that calculates the average driving time',
    mtCustom,
    [mbOK],
    0);
end;

procedure TMainForm.ExitMenuClick(Sender: TObject);
begin
  // Exits program

  Close;
end;

end.
