unit fuQExport3About;

{$I VerCtrl.inc}

interface

uses Classes, Controls, Forms, StdCtrls, Buttons,
  ExtCtrls, Graphics, jpeg;

type
  TfmQExport3About = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    lbCompanyHomePageTag: TLabel;
    lbCompanyHomePage: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lbCompanyHomePageClick(Sender: TObject);
    procedure lbRegisterNowClick(Sender: TObject);
    procedure lbLicenseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowAboutForm;

implementation

uses Windows, ShellAPI, SysUtils, QExport3Common, fuQExport3License;

{$R *.DFM}

procedure ShowAboutForm;
begin
  with TfmQExport3About.Create(nil) do
  try
    //lbVerInfo.Caption := Format(S_FULL_PRODUCT_NAME, [S_VERSION]);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmQExport3About.FormCreate(Sender: TObject);
begin
{$IFDEF TRIAL}
  lbVersion.Caption := 'Evalution version';
{$ELSE}
 // lbVersion.Caption := 'Registered version';
  //lbVersion.Font.Color := clBlack;
  //lbRegisterNow.Visible := False;
{$ENDIF}
end;

procedure TfmQExport3About.lbCompanyHomePageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
               PChar((Sender as TLabel).Caption),
               nil, nil, SW_SHOW);
end;

procedure TfmQExport3About.lbRegisterNowClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
               PChar(S_REG_URL),
               nil, nil, SW_SHOW);
end;

procedure TfmQExport3About.lbLicenseClick(Sender: TObject);
begin
  with TfmQExport3License.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
