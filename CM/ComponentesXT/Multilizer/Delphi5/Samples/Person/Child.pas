unit Child;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, Messages, MultForm, IvMulti,
  ComCtrls, StdCtrls, ExtCtrls, Menus, IvDictio, Dialogs, IvDlgMod;

type
  TSex = (seMale, seFemale);

  TChildForm = class(TMultilingualForm)
    MainMenu: TMainMenu;
    PersonMenu: TMenuItem;
    DetailsMenu: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ColorPanel: TPanel;
    Label5: TLabel;
    FirstNameLabel: TLabel;
    HeightLabel: TLabel;
    WeightLabel: TLabel;
    DateOfBirthLabel: TLabel;
    FontMenu: TMenuItem;
    N1: TMenuItem;
    FontDialog: TFontDialog;
    Label6: TLabel;
    LastNameLabel: TLabel;
    Label8: TLabel;
    SexLabel: TLabel;
    Image: TImage;
    Label10: TLabel;
    DescriptionLabel: TLabel;
    IvDialogModule1: TIvDialogModule;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DetailsMenuClick(Sender: TObject);
    procedure FontMenuClick(Sender: TObject);
    procedure TranslatorLocaleChange(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    FDirty: Boolean;
    FFileName: String;
    FSex: TSex;
    FPersonHeight: Integer;
    FPersonWeight: Integer;
    FDateOfBirth: TDateTime;
    FImageFileName: String;

    function GetPersonName: String;

    procedure SetPersonHeight(value: Integer);
    procedure SetPersonWeight(value: Integer);
    procedure SetDateOfBirth(value: TDateTime);
    procedure SetSex(value: TSex);
    procedure SetImageFileName(const value: String);

    procedure UpdateCaption;

    procedure WMMDIMaximize(var msg: TMessage); message WM_MDIMAXIMIZE;

  public
    procedure Open(const fileName: String);
    procedure SaveAs(const fileName: String);
    procedure Save;

    property PersonName: String read GetPersonName;
    property FileName: String read FFileName write FFileName;
    property Sex: TSex read FSex write SetSex;
    property PersonHeight: Integer read FPersonHeight write SetPersonHeight;
    property PersonWeight: Integer read FPersonWeight write SetPersonWeight;
    property DateOfBirth: TDateTime read FDateOfBirth write SetDateOfBirth;
    property ImageFileName: String read FImageFileName write SetImageFileName;
  end;

implementation

{$R *.DFM}

uses
  SysUtils, IniFiles,
  IvMlUtil,
  Details, Main;

const
  SECTION_C = 'Values';

procedure TChildForm.WMMDIMaximize(var msg: TMessage);
begin
  inherited;
  Caption := Caption;
end;

procedure TChildForm.UpdateCaption;
begin
  Caption := PersonName + ' (' + LowerCase(FFileName) + ')';
end;

function TChildForm.GetPersonName: String;
begin
  Result := FirstNameLabel.Caption + ' ' + LastNameLabel.Caption;
end;

procedure TChildForm.SetPersonHeight(value: Integer);
begin
  FPersonHeight := value;
  HeightLabel.Caption := IvFormatLength(
    MainForm.Dictionary.LocaleData.MeasurementSystem,
    FPersonHeight,
    ivmlcm,
    '%.0f %s',
    ivulFoot,
    '201');
end;

procedure TChildForm.SetPersonWeight(value: Integer);
begin
  FPersonWeight := value;
  WeightLabel.Caption := IvFormatWeight(
    MainForm.Dictionary.LocaleData.MeasurementSystem,
    FPersonWeight,
    ivmwkg,
    '%.0f %s',
    ivuwPound,
    '2');
end;

procedure TChildForm.SetDateOfBirth(value: TDateTime);
begin
  FDateOfBirth := value;
  DateOfBirthLabel.Caption := FormatDateTime('dddddd', FDateOfBirth);
end;

procedure TChildForm.SetSex(value: TSex);
begin
  FSex := value;
  if FSex = seMale then
    SexLabel.Caption := Translate('male')
  else
    SexLabel.Caption := Translate('female');
end;

procedure TChildForm.SetImageFileName(const value: String);
begin
  if value <> FImageFileName then
  begin
    FImageFileName := value;
    Image.Picture.LoadFromFile(FImageFileName);
  end;
end;

procedure TChildForm.Open(const fileName: String);
var
  iniFile: TIniFile;
begin
  iniFile := TIniFile.Create(fileName);
  FirstNameLabel.Caption := iniFile.ReadString(SECTION_C, 'FirstName', '');
  LastNameLabel.Caption := iniFile.ReadString(SECTION_C, 'LastName', '');
  Sex := TSex(iniFile.ReadInteger(SECTION_C, 'Sex', 0));
  PersonHeight := iniFile.ReadInteger(SECTION_C, 'Height', 0);
  PersonWeight := iniFile.ReadInteger(SECTION_C, 'Weight', 0);
  DateOfBirth := EncodeDate(
    iniFile.ReadInteger(SECTION_C, 'Year', 1900),
    iniFile.ReadInteger(SECTION_C, 'Month', 1),
    iniFile.ReadInteger(SECTION_C, 'Day', 1));
  ColorPanel.Color := iniFile.ReadInteger(SECTION_C, 'Color', clBtnFace);
  DescriptionLabel.Caption := iniFile.ReadString(SECTION_C, 'Description', '');
  ImageFileName := iniFile.ReadString(SECTION_C, 'ImageFileName', '');
  iniFile.Free;
  FFileName := fileName;
  FDirty := False;
  UpdateCaption;
end;

procedure TChildForm.Save;
var
  iniFile: TIniFile;
  year, month, day: Word;
begin
  if FFileName = '' then
    Exit;

  iniFile := TIniFile.Create(FFileName);
  iniFile.WriteString(SECTION_C, 'FirstName', FirstNameLabel.Caption);
  iniFile.WriteString(SECTION_C, 'LastName', LastNameLabel.Caption);
  iniFile.WriteInteger(SECTION_C, 'Sex', Integer(Sex));
  iniFile.WriteInteger(SECTION_C, 'Height', PersonHeight);
  iniFile.WriteInteger(SECTION_C, 'Weight', PersonWeight);
  DecodeDate(DateOfBirth, year, month, day);
  iniFile.WriteInteger(SECTION_C, 'Day', day);
  iniFile.WriteInteger(SECTION_C, 'Month', month);
  iniFile.WriteInteger(SECTION_C, 'Year', year);
  iniFile.WriteString(SECTION_C, 'Description', DescriptionLabel.Caption);
  iniFile.WriteInteger(SECTION_C, 'Color', ColorPanel.Color);
  iniFile.WriteString(SECTION_C, 'ImageFileName', ImageFileName);
  iniFile.Free;
  FDirty := False;
end;

procedure TChildForm.SaveAs(const fileName: String);
begin
  FFileName := fileName;
  Save;
  UpdateCaption;
end;

procedure TChildForm.FormCreate(Sender: TObject);
begin
  inherited;
  FDirty := False;
end;

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TChildForm.DetailsMenuClick(Sender: TObject);
var
  dialog: TDetailsDialog;
begin
  dialog := TDetailsDialog.Create(nil);
  dialog.FirstNameEdit.Text := FirstNameLabel.Caption;
  dialog.LastNameEdit.Text := LastNameLabel.Caption;
  dialog.Sex := Sex;
  dialog.PersonHeight := PersonHeight;
  dialog.PersonWeight := PersonWeight;
  dialog.DateOfBirth := DateOfBirth;
  dialog.DescriptionMemo.Lines.Text := DescriptionLabel.Caption;
  dialog.ColorPanel.Color := ColorPanel.Color;
  dialog.ImageFileName := ImageFileName;
  if dialog.ShowModal = idOK then
  begin
    UpdateCaption;
    FirstNameLabel.Caption := dialog.FirstNameEdit.Text;
    LastNameLabel.Caption := dialog.LastNameEdit.Text;
    Sex := dialog.Sex;
    PersonHeight := dialog.PersonHeight;
    PersonWeight := dialog.PersonWeight;
    DateOfBirth := dialog.DateOfBirth;
    DescriptionLabel.Caption := dialog.DescriptionMemo.Lines.Text;
    ColorPanel.Color := dialog.ColorPanel.Color;
    ImageFileName := dialog.ImageFileName;
  end;
  dialog.Free;
end;

procedure TChildForm.FontMenuClick(Sender: TObject);
begin
  FontDialog.Font := Font;
  if FontDialog.Execute then
    Font := FontDialog.Font;
end;

procedure TChildForm.TranslatorLocaleChange(Sender: TObject);
begin
  inherited;
  SetPersonHeight(FPersonHeight);
  SetPersonWeight(FPersonWeight);
  SetDateOfBirth(FDateOfBirth);
  SetSex(FSex);
end;

procedure TChildForm.FormClick(Sender: TObject);
begin
  inherited;
  SendMessage(MainForm.ClientHandle, WM_MDIMAXIMIZE, Handle, 0);
end;

procedure TChildForm.FormResize(Sender: TObject);
var
  str: String;
begin
  str := MainForm.Caption;
  inherited;
  if WindowState = wsMaximized then
  begin
    str := Caption;
    str := MainForm.Caption;
  end;
end;

end.
