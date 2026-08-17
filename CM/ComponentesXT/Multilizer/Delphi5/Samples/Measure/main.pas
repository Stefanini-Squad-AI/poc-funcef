unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvMulti, IvAMulti, IvBinDic, StdCtrls, IvDictio;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    IvTranslator1: TIvTranslator;
    IvDictionary1: TIvBinaryDictionary;
    Temperature: TLabel;
    Label6: TLabel;
    SizeValue: TLabel;
    Distance: TLabel;
    Area: TLabel;
    LiquidCapacity: TLabel;
    LanguageButton: TButton;
    LocaleButton: TButton;
    Label7: TLabel;
    ScientificTemperature: TLabel;
    Label8: TLabel;
    DryCapacity: TLabel;
    procedure IvTranslator1LanguageChange(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
    procedure LocaleButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  IvMLUtil, IvLanguD;

procedure TMainForm.IvTranslator1LanguageChange(Sender: TObject);
begin
  Temperature.Caption :=
    Format(
      IvDictionary1.Translate('Mean daily temperature in January in Helsinki is %s'), //ivlm
      [IvFormatTemperature(
        IvDictionary1.LocaleData.MeasurementSystem,
        -5.7,
        ivmtC,
        '%.1f %s',
        ivutF,
        '+%.1f %s')]);

  ScientificTemperature.Caption :=
    Format(
      IvDictionary1.Translate('The efective temperature of Sun is %s'), //ivlm
      [IvFormatTemperature(
        IvDictionary1.LocaleData.MeasurementSystem,
        5785,
        ivmtK,
        '%.0f %s',
        ivutF,
        '+%.0f %s')]);

  SizeValue.Caption :=
    Format(
      IvDictionary1.Translate('I am %s tall and I weigh %s'), //ivlm
      [IvFormatLength(
         IvDictionary1.LocaleData.MeasurementSystem,
         182,
         ivmlcm,
         '%.0f %s',
         ivulFoot,
         '201'),
       IvFormatWeight(
         IvDictionary1.LocaleData.MeasurementSystem,
         75,
         ivmwkg,
         '%.0f %s',
         ivuwPound,
         '2')]);

  Distance.Caption :=
    Format(
      IvDictionary1.Translate('The dictance between Helsinki and Stockholm is %s'), //ivlm
      [IvFormatLength(
        IvDictionary1.LocaleData.MeasurementSystem,
        402,
        ivmlkm,
        '%.0f %s',
        ivulMile,
        '200')]);

  Area.Caption :=
    Format(
      IvDictionary1.Translate('My apartment is %s'), //ivlm
      [IvFormatArea(
        IvDictionary1.LocaleData.MeasurementSystem,
        70,
        ivmam2,
        '%.0f %s',
        ivuaFoot2,
        '200')]);

  LiquidCapacity.Caption :=
    Format(
      IvDictionary1.Translate('Measure %s water'), //ivlm
      [IvFormatLiquidCapacity(
        IvDictionary1.LocaleData.MeasurementSystem,
        3,
        ivmcl,
        '%.0f %s',
        ivulPint,
        '200')]);

  DryCapacity.Caption :=
    Format(
      IvDictionary1.Translate('The capacity of the van is %s'), //ivlm
      [IvFormatDryCapacity(
        IvDictionary1.LocaleData.MeasurementSystem,
        9,
        ivmcm3,
        '%.0f %s',
        ivudBushel,
        '200')]);
end;

procedure TMainForm.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

procedure TMainForm.LocaleButtonClick(Sender: TObject);
var
  locale: Integer;
begin
  if SelectLocale(Self, IvDictionary1, '', [], 0, locale) then
    IvDictionary1.Locale := locale;
end;

end.
