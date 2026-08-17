unit IvAboutD;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TIvAboutDialog = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    URL: TLabel;
    CopyrightSupra: TLabel;
    URLSupra: TLabel;
    Email: TLabel;
    EmailLabel: TLabel;
    procedure URLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EmailClick(Sender: TObject);
  public
  end;

implementation

{$R *.DFM}

uses
{$IFDEF WIN32}
  ShellAPI,
{$ENDIF}
  IvCommon, IvDictio;

procedure TIvAboutDialog.FormCreate(Sender: TObject);

{$IFNDEF WIN32}
  procedure DisableLink(link: TLabel);
  begin
    link.Cursor := crDefault;
    link.Font.Color := clWindowText;
    link.Font.Style := URL.Font.Style - [fsUnderline];
  end;
{$ENDIF}

{$IFNDEF IVVB}
const
  GAP_C = 16;
{$ENDIF}
var
  code: TIvLicense;
begin
  code := TIvLicense(StrToInt(GetMLRegistryValue(DICTIONARY_CODE_C, '0')));
  
{$IFDEF IVVB}
  Version.Caption := Format('%s Version %s.%s', [LICENSE_NAMES_C[code], VB_VER_C, VB_VER_SUB_C]);
  ProductName.Caption := 'MULTILIZER Visual Basic Edition';
  Comments.Caption :=
    'MULTILIZER Visual Basic Edition includes the complete set of components and tools ' +
    'for localizing software to all languages and character sets in Visual Basic.';
{$ELSE}
  Version.Caption := Format('%s Version %s.%s', [LICENSE_NAMES_C[code], VCL_VER_C, VCL_VER_SUB_C]);
  CopyrightSupra.Hide;
  URLSupra.Hide;
  URL.Top := URL.Top - GAP_C;
  Comments.Top := Comments.Top - GAP_C;
  EmailLabel.Top := EmailLabel.Top - GAP_C;
  Email.Top := Email.Top - GAP_C;
  Panel1.Height := Panel1.Height - GAP_C;
  OKButton.Top := OKButton.Top - GAP_C;
  Height := Height - GAP_C;
{$ENDIF}

{$IFNDEF WIN32}
  DisableLink(URL);
  DisableLink(URLSupra);
  DisableLink(Email);
{$ENDIF}

{$IFDEF IVWIDE}
  URL.Cursor := crHandPoint;
  URLSupra.Cursor := crHandPoint;
  Email.Cursor := crHandPoint;
{$ENDIF}
end;

procedure TIvAboutDialog.URLClick(Sender: TObject);
begin
{$IFDEF WIN32}
  ShellExecute(
    Application.Handle,
    'open',
    PChar('http://' + (Sender as TLabel).Caption),
    nil,
    nil,
    SW_SHOW);
{$ENDIF}
end;

procedure TIvAboutDialog.EmailClick(Sender: TObject);
begin
{$IFDEF WIN32}
  ShellExecute(
    Application.Handle,
    'open',
    PChar((Sender as TLabel).Caption),
    nil,
    nil,
    SW_SHOW);
{$ENDIF}
end;

end.
