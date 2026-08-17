unit IvPassWD;

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  IvDictio, IvMulti;

type
  TIvPasswordDialog = class(TForm)
    GroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    UserName: TEdit;
    Password: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    SavePassword: TCheckBox;
    IvTranslator1: TIvTranslator;
    procedure HelpButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TIvPasswordDialog.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

end.
