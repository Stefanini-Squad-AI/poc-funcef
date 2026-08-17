unit Details;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MultForm, IvMulti, StdCtrls, ExtCtrls, ComCtrls, Child, IvDictio, IvDlgMod;

type
  TDetailsDialog = class(TMultilingualForm)
    OKButton: TButton;
    CancelButton: TButton;
    PageControl: TPageControl;
    NameSheet: TTabSheet;
    SizeSheet: TTabSheet;
    ImageSheet: TTabSheet;
    OtherSheet: TTabSheet;
    Label1: TLabel;
    FirstNameEdit: TEdit;
    Label3: TLabel;
    LastNameEdit: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    HeightEdit: TEdit;
    WeightEdit: TEdit;
    WeightLabel: TLabel;
    HeightLabel: TLabel;
    SexRadioGroup: TRadioGroup;
    GroupBox1: TGroupBox;
    DateEdit: TEdit;
    DateLabel: TLabel;
    ImageButton: TButton;
    ImageOpenDialog: TOpenDialog;
    DescriptionLabel: TLabel;
    DescriptionMemo: TMemo;
    Label5: TLabel;
    ColorPanel: TPanel;
    ColorDialog: TColorDialog;
    Image: TImage;
    IvDialogModule1: TIvDialogModule;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ImageButtonClick(Sender: TObject);
    procedure ColorPanelClick(Sender: TObject);

  private
    FPersonHeight: Integer;
    FPersonWeight: Integer;
    FDateOfBirth: TDateTime;
    FImageFileName: String;

    function GetSex: TSex;
    procedure SetSex(value: TSex);

    procedure SetPersonHeight(value: Integer);
    procedure SetPersonWeight(value: Integer);
    procedure SetDateOfBirth(value: TDateTime);
    procedure SetImageFileName(const value: String);

    function GetPersonName: String;

    function CheckFirstName: Boolean;
    function CheckLastName: Boolean;
    function CheckDate: Boolean;
    function CheckSex: Boolean;
    function CheckHeight: Boolean;
    function CheckWeight: Boolean;
    function CheckColor: Boolean;

    procedure InvalidValue(const value, name, usage: String);

  public
    property PersonName: String read GetPersonName;
    property Sex: TSex read GetSex write SetSex;
    property PersonHeight: Integer read FPersonHeight write SetPersonHeight;
    property PersonWeight: Integer read FPersonWeight write SetPersonWeight;
    property DateOfBirth: TDateTime read FDateOfBirth write SetDateOfBirth;
    property ImageFileName: String read FImageFileName write SetImageFileName;
  end;

implementation

{$R *.DFM}

uses
  IvMlUtil,
  Main;

const
  NULL_STRING_C = 'Give a none null string.'; //ivlm

function TDetailsDialog.GetPersonName: String;
begin
  Result := FirstNameEdit.Text + ' ' + LastNameEdit.Text;
end;

function TDetailsDialog.GetSex: TSex;
begin
  Result := TSex(SexRadioGroup.ItemIndex);
end;

procedure TDetailsDialog.SetSex(value: TSex);
begin
  SexRadioGroup.ItemIndex := Integer(value);
end;

procedure TDetailsDialog.InvalidValue(const value, name, usage: String);
var
  str: String;
begin
  str := MlFormat(
    '''%0:s'' is not a valid %1:s value.', //ivlm
    [value, name]);
  if usage <> '' then
    str := str + ' ' + Translate(usage);
  MessageDlg(str, mtError, [mbOk], 0);
end;

function TDetailsDialog.CheckFirstName: Boolean;
begin
  Result := FirstNameEdit.Text <> '';
  if not Result then
    InvalidValue(
      FirstNameEdit.Text,
      Translate('first name'),
      NULL_STRING_C);
end;

function TDetailsDialog.CheckLastName: Boolean;
begin
  Result := LastNameEdit.Text <> '';
  if not Result then
    InvalidValue(
      LastNameEdit.Text,
      Translate('last name'),
      NULL_STRING_C);
end;

function TDetailsDialog.CheckDate: Boolean;
begin
  Result := False;
  try
    FDateOfBirth := StrToDate(DateEdit.Text);
    Result := True;
  except
    InvalidValue(
      DateEdit.Text,
      Translate('date'),
      Format(
        Translator.Dictionary.Translate('Give value in the following format: %s'), //ivlm
        [LowerCase(ShortDateFormat)]));
  end;
end;

function TDetailsDialog.CheckSex: Boolean;
begin
  Result := SexRadioGroup.ItemIndex >= 0;
  if not Result then
    InvalidValue(
      Translate('unknown'),
      Translate('sex'),
      NULL_STRING_C);
end;

function TDetailsDialog.CheckColor: Boolean;
begin
  Result := ColorPanel.Color <> clBtnFace;
  if not Result then
    InvalidValue(
      Translate('unknown'),
      Translate('favour color'),
      NULL_STRING_C);
end;

function TDetailsDialog.CheckHeight: Boolean;
var
  index, secondIndex: Integer;
  str: String;
  value: Single;
begin
  Result := False;
  if MainForm.Dictionary.LocaleData.MeasurementSystem = ivmsMetric then
  begin
    try
      FPersonHeight := StrToInt(HeightEdit.Text);
      Result := FPersonHeight > 0;
    except
    end;

    if not Result then
      InvalidValue(
        HeightEdit.Text,
        Translate('height'),
        'Give the value in centimeters.'); //ivlm
  end
  else
  begin
    str := HeightEdit.Text;
    index := Pos('''', str);
    if index = 0 then
      // No inches

      try
        FPersonHeight := Round(100*FOOT_IN_METERS_C*StrToInt(str));
        Result := FPersonHeight > 0;
      except
      end
    else
      // Height contains inches

      try
        // Feet

        value := 100*FOOT_IN_METERS_C*StrToInt(Copy(str, 1, index - 1));

        // Inches

        secondIndex := Pos('"', str);
        if secondIndex = 0 then
          FPersonHeight := Round(value + 100*INCH_IN_METERS_C*StrToInt(Copy(str, index + 1, Length(str))))
        else
          FPersonHeight := Round(value + 100*INCH_IN_METERS_C*StrToInt(Copy(str, index + 1, secondIndex - index - 1)));
        Result := FPersonHeight > 0;
      except
      end;

    if not Result then
      InvalidValue(
        HeightEdit.Text,
        Translate('height'),
        'Give the value in feet''inches''''.'); //ivlm
  end;
end;

procedure TDetailsDialog.SetPersonHeight(value: Integer);
begin
  if MainForm.Dictionary.LocaleData.MeasurementSystem = ivmsMetric then
    HeightEdit.Text := IntToStr(value)
  else
    HeightEdit.Text := IvFormatLength(
      MainForm.Dictionary.LocaleData.MeasurementSystem,
      value,
      ivmlcm,
      '%.0f',
      ivulFoot,
      '301');
end;

function TDetailsDialog.CheckWeight: Boolean;
begin
  Result := False;
  if MainForm.Dictionary.LocaleData.MeasurementSystem = ivmsMetric then
  begin
    try
      FPersonWeight := StrToInt(WeightEdit.Text);
      Result := FPersonWeight > 0;
    except
    end;

    if not Result then
      InvalidValue(
        WeightEdit.Text,
        Translate('weight'),
        'Give the value in kilograms.'); //ivlm
  end
  else
  begin
    try
      FPersonWeight := Round(POUND_IN_KILOGRAMS_C*StrToInt(WeightEdit.Text));
      Result := FPersonWeight > 0;
    except
    end;

    if not Result then
      InvalidValue(
        WeightEdit.Text,
        Translate('weight'),
        'Give the value in pounds.'); //ivlm
  end;
end;

procedure TDetailsDialog.SetPersonWeight(value: Integer);
begin
  if MainForm.Dictionary.LocaleData.MeasurementSystem = ivmsMetric then
    WeightEdit.Text := IntToStr(value)
  else
    WeightEdit.Text := IvFormatWeight(
      MainForm.Dictionary.LocaleData.MeasurementSystem,
      value,
      ivmwkg,
      '%.0f',
      ivuwPound,
      '000');
end;

procedure TDetailsDialog.SetDateOfBirth(value: TDateTime);
begin
  DateEdit.Text := FormatDateTime('ddddd', value);
end;

procedure TDetailsDialog.FormCreate(Sender: TObject);
begin
  inherited;
  if MainForm.Dictionary.LocaleData.MeasurementSystem = ivmsUS then
  begin
    HeightLabel.Caption := 'feet'; //ivlm
    WeightLabel.Caption := 'pounds'; //ivlm
  end;
  DateLabel.Caption := '(' + Translator.Dictionary.Translate(LowerCase(ShortDateFormat)) + ')';
  PageControl.ActivePage := NameSheet;
end;

procedure TDetailsDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if ModalResult = idCancel then
    CanClose := True
  else
  begin
    CanClose := False;

    if not CheckFirstName then
    begin
      PageControl.ActivePage := NameSheet;
      FirstNameEdit.SetFocus;
    end
    else if not CheckLastName then
    begin
      PageControl.ActivePage := NameSheet;
      LastNameEdit.SetFocus;
    end
    else if not CheckDate then
    begin
      PageControl.ActivePage := NameSheet;
      DateEdit.SetFocus;
    end
    else if not CheckSex then
    begin
      PageControl.ActivePage := NameSheet;
      SexRadioGroup.SetFocus;
    end
    else if not CheckHeight then
    begin
      PageControl.ActivePage := SizeSheet;
      HeightEdit.SetFocus;
    end
    else if not CheckWeight then
    begin
      PageControl.ActivePage := SizeSheet;
      WeightEdit.SetFocus;
    end
    else if not CheckColor then
    begin
      PageControl.ActivePage := OtherSheet;
      ColorPanel.SetFocus;
    end
    else
      CanClose := True;
  end;
end;

procedure TDetailsDialog.SetImageFileName(const value: String);
begin
  if value <> FImageFileName then
  begin
    FImageFileName := value;
    Image.Picture.LoadFromFile(FImageFileName);
  end;
end;

procedure TDetailsDialog.ImageButtonClick(Sender: TObject);
begin
  ImageOpenDialog.FileName := ImageFileName;
  if ImageOpenDialog.Execute then
    ImageFileName := ImageOpenDialog.FileName;
end;

procedure TDetailsDialog.ColorPanelClick(Sender: TObject);
begin
  ColorDialog.Color := ColorPanel.Color;
  if ColorDialog.Execute then
    ColorPanel.Color := ColorDialog.Color;
end;

end.
