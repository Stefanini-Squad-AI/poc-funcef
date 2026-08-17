unit IvMlUtil;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  SysUtils, Classes, Graphics, Forms, Dialogs, Controls, FileCtrl,
  IvDictio;

const
  { Measurement conversion constants }

  INCH_IN_FEET_C = 12;
  FEET_IN_YARD_C = 3;
  YARDS_IN_FURLONG_C = 220;
  FURLONGS_IN_MILE_C = 8;

  INCH_IN_METERS_C: Single = 0.0254;
  FOOT_IN_METERS_C: Single = 0.3048;
  YARD_IN_METERS_C: Single = 0.9144;
  FURLONG_IN_METERS_C: Single = 201.2;
  MILE_IN_METERS: Single = 1609.3;

  OUNCES_IN_POUND_C = 16;
  POUNDS_IN_TON_C = 2000;

  OUNCE_IN_KILOGRAMS_C: Single = 0.02835;
  POUND_IN_KILOGRAMS_C: Single = 0.453;
  TON_IN_KILOGRAMS_C: Single = 907;

  CAPTIONS_C: array[TMsgDlgType] of String =
  (
    'Warning',
    'Error',
    'Information',
    'Confirm',
    ''
  );
  BUTTONCAPTIONS_C: array[TMsgDlgBtn] of String =
  (
    '&Yes',
    '&No',
    'OK',
    'Cancel',
    '&Abort',
    '&Retry',
    '&Ignore',
    '&All',
{$IFDEF IVWIDE}
    'N&o to All',
    'Y&es to All',
{$ENDIF}
    '&Help'
  );

type
  { Measurement types }

  TIvMetricLength = (ivmlmm, ivmlcm, ivmldm, ivmlm, ivmlkm);
  TIvUSLength = (ivulInch, ivulFoot, ivulYard, ivulFurlong, ivulMile);

  TIvMetricArea = (ivmacm2, ivmam2, ivmaAre, ivmaHectare, ivmakm2);
  TIvUSArea = (ivuaInch2, ivuaFoot2, ivuaYard2, ivuaAcre, ivuaMile2);

  TIvMetricCapacity = (ivmcml, ivmccl, ivmcdl, ivmcl, ivmcm3);
  TIvUSLiquidCapacity = (ivulOunce, ivulPint, ivulGallon);
  TIvUSDryCapacity = (ivudPint, ivudBushel);

  TIvMetricWeight = (ivmwg, ivmwkg, ivmwt);
  TIvUSWeight = (ivuwOunce, ivuwPound, ivuwTon);

  TIvMetricTemperature = (ivmtC, ivmtK);
  TIvUSTemperature = (ivutF);

  TIvUSQuantity = (ivusqNone, ivusqShort, ivusqLong, ivusqSymbol);

function IvWeek(
  date: TDateTime;
  firstWeekOfYear: TIvFirstWeekOfYear;
  firstDayOfWeek: TIvDayOfWeek): Integer;

function IvWeekEx(date: TDateTime): Integer;

function IvDayOfWeek(date: TDateTime): TIvDayOfWeek;

function IvDayOfWeekNumber(
  date: TDateTime;
  firstDayOfWeek: TIvDayOfWeek): Integer;

function IvFirstDayOfWeek(
  date: TDateTime;
  firstDayOfWeek: TIvDayOfWeek): TDateTime;

function IvFirstDayOfMonth(date: TDateTime): TDateTime;

function IvFirstDayOfYear(date: TDateTime): TDateTime;

function IvFirstWeekOfMonth(
  date: TDateTime;
  firstWeekOfYear: TIvFirstWeekOfYear;
  firstDayOfWeek: TIvDayOfWeek): Integer;

function IvVCLDayToDay(index: Integer): Integer;

{ Measurement functions }

function IvFormatGeneric(
  measurementSystem: TIvMeasurementSystem;
  value, normalizedValue: Double;
  metricUnit: Integer;
  const metricFormat: String;
  usUnit: Integer;
  const usFormat: String;
  metricTable: array of String;
  symbolUsTable: array of String;
  shortUsTable: array of String;
  singleUsTable: array of String;
  pruralUsTable: array of String;
  usRatiosTable: array of Integer;
  usToMetricTable: array of Single): String;

function IvFormatLength(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricLength;
  const metricFormat: String;
  usUnit: TIvUSLength;
  const usFormat: String): String;

function IvFormatArea(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricArea;
  const metricFormat: String;
  usUnit: TIvUSArea;
  const usFormat: String): String;

function IvFormatLiquidCapacity(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricCapacity;
  const metricFormat: String;
  usUnit: TIvUSLiquidCapacity;
  const usFormat: String): String;

function IvFormatDryCapacity(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricCapacity;
  const metricFormat: String;
  usUnit: TIvUSDryCapacity;
  const usFormat: String): String;

function IvFormatWeight(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricWeight;
  const metricFormat: String;
  usUnit: TIvUSWeight;
  const usFormat: String): String;

function IvFormatTemperature(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricTemperature;
  const metricFormat: String;
  usUnit: TIvUSTemperature;
  const usFormat: String): String;

{ Message and input dialogs }

function IvMessageBox(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  dictionary: TIvDictionary): Integer;

function IvMessageBoxPos(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  x, y: Integer;
  dictionary: TIvDictionary): Integer;

procedure IvShowMessage(const msg: String; dictionary: TIvDictionary);
procedure IvShowMessagePos(const msg: String; X, Y: Integer; dictionary: TIvDictionary);

{ Extended message dialogs }

function IvMessageBoxEx(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  dictionary: TIvDictionary): Integer;

function IvMessageBoxPosEx(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  x, y: Integer;
  dictionary: TIvDictionary): Integer;

{ Input dialogs }

function IvInputBox(const captionMsg, prompt, def: String; dictionary: TIvDictionary): String;
function IvInputQuery(const captionMsg, prompt: String; var value: String; dictionary: TIvDictionary): Boolean;

{ Directory functions }

function IvSelectDirectory(
  var directory: String;
  options: TSelectDirOpts;
  helpContext: Longint;
  dictionary: TIvDictionary): Boolean;

{ IV StayOnTop: If this var is TRUE then TIvMLForm objects will be fsStayOnTop }
var
  IvFormAlwaysStayOnTop: boolean;


implementation

uses
  StdCtrls, ExtCtrls,
  IvMulti, IvMlCons;

function IvWeek(
  date: TDateTime;
  firstWeekOfYear: TIvFirstWeekOfYear;
  firstDayOfWeek: TIvDayOfWeek): Integer;
var
  number: Integer;
  first: TDateTime;
begin
  { Gets the number of the first day of the week.
    Depending on FirstWeekOfYear variable counts the date of the first day
    of the first week. }

  first := IvFirstDayOfYear(date);
  number := IvDayOfWeekNumber(first, firstDayOfWeek);
  case firstWeekOfYear of
    ivfwFirstPart:
      first := first - number + 1;

    ivfwFirstFull:
      if number > 0 then
        first := first + 7 - number + 1;

    ivfwFirst4:
      if number <= 3 then
        first := first - number + 1
      else
        first := first + 7 - number;
  end;

  { Finally calculates the difference between the current day and the first
    day of the first week. Divedes the difference by 7 to get the amount of
    week and adds 1 so that the first week is 1 }

  Result := Trunc(date - first) div 7 + 1;
end;

function IvWeekEx(date: TDateTime): Integer;
begin
  Result := IvWeek(date, ivfwFirstPart, ivwdMonday);
end;

function IvDayOfWeek(date: TDateTime): TIvDayOfWeek;
begin
  { DayOfWeek returns 1 as the first day but it is Sunday
    1 + 5 mod 7 = 6 (ivwdSunday)
    2 + 5 mod 7 = 0 (ivwdMonday) }

  Result := TIvDayOfWeek((DayOfWeek(date) + 5) mod 7);
end;

function IvDayOfWeekNumber(
  date: TDateTime;
  firstDayOfWeek: TIvDayOfWeek): Integer;
begin
  { Calculates the difference between the current day and the first day of
    week. Add one to the result because the first day of week is 1 }

  Result := Integer(IvDayOfWeek(date)) - Integer(firstDayOfWeek);
  if Result < 0 then
    Result := 6 + Result;
  Result := Result + 1;
end;

function IvFirstDayOfWeek(
  date: TDateTime;
  firstDayOfWeek: TIvDayOfWeek): TDateTime;
begin
  Result := date - IvDayOfWeekNumber(date, firstDayOfWeek) + 1;
end;

function IvFirstDayOfMonth(date: TDateTime): TDateTime;
var
  year, month, day: Word;
begin
  DecodeDate(date, year, month, day);
  Result := EncodeDate(year, month, 1);
end;

function IvFirstDayOfYear(date: TDateTime): TDateTime;
var
  year, month, day: Word;
begin
  DecodeDate(date, year, month, day);
  Result := EncodeDate(year, 1, 1);
end;

function IvFirstWeekOfMonth(
  date: TDateTime;
  firstWeekOfYear: TIvFirstWeekOfYear;
  firstDayOfWeek: TIvDayOfWeek): Integer;
begin
  Result := IvWeek(IvFirstDayOfMonth(date), firstWeekOfYear, firstDayOfWeek);
end;

function IvVCLDayToDay(index: Integer): Integer;
begin
  Result := (index + 5) mod 7;
end;


{ Measurement functions }

procedure ParseUSFormat(
  const format: String;
  var quantity: TIvUSQuantity;
  var digits, subDigits: Integer);
begin
  if Length(format) >= 1 then
    quantity := TIvUSQuantity(StrToInt(format[1]))
  else
    quantity := ivusqShort;

  if Length(format) >= 2 then
    digits := StrToInt(format[2])
  else
    digits := 0;

  if Length(format) >= 3 then
    subDigits := StrToInt(format[3])
  else
    subDigits := 0;
end;

function IvFormatGeneric(
  measurementSystem: TIvMeasurementSystem;
  value, normalizedValue: Double;
  metricUnit: Integer;
  const metricFormat: String;
  usUnit: Integer;
  const usFormat: String;
  metricTable: array of String;
  symbolUsTable: array of String;
  shortUsTable: array of String;
  singleUsTable: array of String;
  pruralUsTable: array of String;
  usRatiosTable: array of Integer;
  usToMetricTable: array of Single): String;
var
  i, real, fraction, nominator, newNominator, subRatio, digits, sub: Integer;
  quantity: TIvUSQuantity;
begin
  if MeasurementSystem = ivmsMetric then
    { Format metric }

    Result := Format(metricFormat, [value, metricTable[metricUnit]])
  else
  begin
    { Format us }

    ParseUSFormat(usFormat, quantity, digits, sub);
    subRatio := 1;
    for i := 1 to sub do
      subRatio := subRatio*usRatiosTable[usUnit - i];

    value := normalizedValue/usToMetricTable[usUnit];
    if (digits = 0) and (sub = 0) then
    begin
      real := Round(value);
      fraction := 0;
      nominator := 1;
    end
    else if sub > 0 then
    begin
      real := Trunc(value);
      fraction := Round(subRatio*(value - real));
      if fraction = subRatio then
      begin
        Inc(real);
        fraction := 0;
      end;
      nominator := 1;
    end
    else
    begin
      nominator := 2;
      for i := 1 to digits - 1 do
        nominator := 2*nominator;
      real := Trunc(value);
      fraction := Round(nominator*(value - real));
      if fraction = nominator then
      begin
        Inc(real);
        fraction := 0;
      end;

      if fraction <> 0 then
      begin
        i := nominator;
        newNominator := 2;
        while i > 1 do
        begin
          i := i div 2;
          if (fraction mod i) = 0 then
          begin
            nominator := newNominator;
            fraction := fraction div i;
            Break;
          end;
          newNominator := 2*newNominator;
        end;
      end;
    end;

    if sub = 0 then
    begin
      Result := IntToStr(real);
      if fraction > 0 then
        Result := Result + ' ' + IntToStr(fraction) + '/' + IntToStr(nominator);

      case quantity of
        ivusqShort: Result := Result + ' ' + shortUsTable[usUnit];
        ivusqLong: if Result = '1' then
             Result := Result + ' ' + singleUsTable[usUnit]
           else
             Result := Result + ' ' + pruralUsTable[usUnit];
      end;
    end
    else
    begin
      real := Trunc(value);
      fraction := Round(subRatio*(value - real));
      if fraction = subRatio then
      begin
        Inc(real);
        fraction := 0;
      end;
      Result := IntToStr(real);

      case quantity of
        ivusqNone: if fraction > 0 then
             Result := Result + ' ' + IntToStr(fraction);

        ivusqSymbol: begin
             Result := Result + symbolUsTable[usUnit];
             if fraction > 0 then
               Result := Result + IntToStr(fraction) + symbolUsTable[usUnit - sub];
           end;

        ivusqShort: begin
             Result := Result + ' ' + shortUsTable[usUnit];
             if fraction > 0 then
               Result := Result + ' ' + IntToStr(fraction) + ' ' + shortUsTable[usUnit - sub];
           end;

        ivusqLong: if (Result = '1') and (fraction = 0) then
             Result := Result + ' ' + singleUsTable[usUnit]
           else
           begin
             Result := Result + ' ' + pruralUsTable[usUnit];
             if fraction > 0 then
               Result := Result + ' ' + IntToStr(fraction) + ' ' + pruralUsTable[usUnit - sub];
           end;
      end;
    end;
  end;
end;

function IvFormatLength(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricLength;
  const metricFormat: String;
  usUnit: TIvUSLength;
  const usFormat: String): String;
var
  normalizedValue: Double;
begin
  case metricUnit of
    ivmlmm: normalizedValue := value/1000;
    ivmlcm: normalizedValue := value/100;
    ivmldm: normalizedValue := value/10;
    ivmlkm: normalizedValue := 1000*value;
  else
    normalizedValue := value;
  end;

  Result := IvFormatGeneric(
    measurementSystem,
    value,
    normalizedValue,
    Integer(metricUnit),
    metricFormat,
    Integer(usUnit),
    usFormat,
    ['mm', 'cm', 'dm', 'm', 'km'],
    ['''''', '''', 'yd', 'fl', 'mi'],
    ['in', 'ft', 'yd', 'fl', 'mi'],
    ['inch', 'foot', 'yard', 'furlong', 'mile'],
    ['inches', 'feet', 'yards', 'furlongs', 'miles'],
    [INCH_IN_FEET_C, FEET_IN_YARD_C, YARDS_IN_FURLONG_C, FURLONGS_IN_MILE_C, 0],
    [INCH_IN_METERS_C, FOOT_IN_METERS_C, YARD_IN_METERS_C, FURLONG_IN_METERS_C, MILE_IN_METERS]);
end;

function IvFormatArea(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricArea;
  const metricFormat: String;
  usUnit: TIvUSArea;
  const usFormat: String): String;
var
  normalizedValue: Double;
begin
  case metricUnit of
    ivmacm2: normalizedValue := value/10000;
    ivmaAre: normalizedValue := 100*value;
    ivmaHectare: normalizedValue := 10000*value;
    ivmakm2: normalizedValue := 1000000*value;
  else
    normalizedValue := value;
  end;

  Result := IvFormatGeneric(
    measurementSystem,
    value,
    normalizedValue,
    Integer(metricUnit),
    metricFormat,
    Integer(usUnit),
    usFormat,
    ['cm2', 'm2', 'a', 'ha', 'km2'],
    ['sq in2', 'sq ft', 'sq yd', 'acre', 'sq mi'],
    ['sq in2', 'sq ft', 'sq yd', 'acre', 'sq mi'],
    ['square inch', 'square foot', 'square yard', 'acre', 'square mile'],
    ['square inches', 'square feet', 'square yards', 'acres', 'square miles'],
    [144, 9, 4840, 640, 0],
    [0.00064583, 0.093, 0.8361, 4047, 2590000]);
end;

function IvFormatLiquidCapacity(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricCapacity;
  const metricFormat: String;
  usUnit: TIvUSLiquidCapacity;
  const usFormat: String): String;
var
  normalizedValue: Double;
begin
  case metricUnit of
    ivmcml: normalizedValue := value/1000;
    ivmccl: normalizedValue := value/100;
    ivmcdl: normalizedValue := value/10;
    ivmcm3: normalizedValue := 1000*value;
  else
    normalizedValue := value;
  end;

  Result := IvFormatGeneric(
    measurementSystem,
    value,
    normalizedValue,
    Integer(metricUnit),
    metricFormat,
    Integer(usUnit),
    usFormat,
    ['ml', 'cl', 'dl', 'l', 'm3'],
    ['fl oz', 'pt', 'gal'],
    ['fl oz', 'pt', 'gal'],
    ['fluid ounce', 'pint', 'gallon'],
    ['fluid ounces', 'pints', 'gallons'],
    [16, 8, 0],
    [0.0296, 0.4732, 3.7853]);
end;

function IvFormatDryCapacity(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricCapacity;
  const metricFormat: String;
  usUnit: TIvUSDryCapacity;
  const usFormat: String): String;
var
  normalizedValue: Double;
begin
  case metricUnit of
    ivmcml: normalizedValue := value/1000;
    ivmccl: normalizedValue := value/100;
    ivmcdl: normalizedValue := value/10;
    ivmcm3: normalizedValue := 1000*value;
  else
    normalizedValue := value;
  end;

  Result := IvFormatGeneric(
    measurementSystem,
    value,
    normalizedValue,
    Integer(metricUnit),
    metricFormat,
    Integer(usUnit),
    usFormat,
    ['ml', 'cl', 'dl', 'l', 'm3'],
    ['pt', 'bu'],
    ['pt', 'bu'],
    ['pint', 'bushel'],
    ['pints', 'bushels'],
    [64, 0],
    [0.5506, 35.239]);
end;

function IvFormatWeight(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricWeight;
  const metricFormat: String;
  usUnit: TIvUSWeight;
  const usFormat: String): String;
var
  normalizedValue: Double;
begin
  case metricUnit of
    ivmwg: normalizedValue := value/1000;
    ivmwt: normalizedValue := 1000*value;
  else
    normalizedValue := value;
  end;

  Result := IvFormatGeneric(
    measurementSystem,
    value,
    normalizedValue,
    Integer(metricUnit),
    metricFormat,
    Integer(usUnit),
    usFormat,
    ['g', 'kg', 't'],
    ['oz', 'lb', 'ton'],
    ['oz', 'lb', 'ton'],
    ['ounce', 'pound', 'ton'],
    ['ounces', 'pounds', 'tons'],
    [OUNCES_IN_POUND_C, POUNDS_IN_TON_C, 0],
    [OUNCE_IN_KILOGRAMS_C, POUND_IN_KILOGRAMS_C, TON_IN_KILOGRAMS_C]);
end;

function IvFormatTemperature(
  measurementSystem: TIvMeasurementSystem;
  value: Double;
  metricUnit: TIvMetricTemperature;
  const metricFormat: String;
  usUnit: TIvUSTemperature;
  const usFormat: String): String;
const
  METRIC_C: array[TIvMetricTemperature] of String = ('°C', 'K');
  US_C: array[TIvUSTemperature] of String = ('°F');
begin
  if MeasurementSystem = ivmsMetric then
    Result := Format(metricFormat, [value, METRIC_C[metricUnit]])
  else
  begin
    if metricUnit = ivmtK then
      value := value - 273.15;
    value := 1.8*value + 32;
    Result := Format(usFormat, [value, US_C[usUnit]])
  end;
end;


{ Message and input dialogs }

type
  TIvMLForm = class(TForm)
  protected
    FTranslator: TIvTranslator;

    constructor CreateML(owner: TComponent; dictionary: TIvDictionary);
  end;

  TIvMessageForm = class(TIvMLForm)
  private
    FMsg: TLabel;

    procedure Restrict(
      translator: TIvTranslator;
      obj: TObject;
      const name: String;
      var translate: Boolean);

    procedure HelpButtonClick(Sender: TObject);

  protected
    constructor CreateML(
      owner: TComponent;
      const msg, captionMsg: String;
      dlgType: TMsgDlgType;
      buttons: TMsgDlgButtons;
      dictionary: TIvDictionary;
      translateMsg: Boolean);
  end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  i: Integer;
  buffer: array[0..51] of Char;
begin
  for i := 0 to 25 do
    buffer[i] := Chr(i + Ord('A'));
  for i := 0 to 25 do
    buffer[i + 26] := Chr(i + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

constructor TIvMlForm.CreateML(owner: TComponent; dictionary: TIvDictionary);
begin
{$IFDEF VER93}
  inherited CreateNew(owner, 0);
{$ELSE}
  inherited CreateNew(owner);
{$ENDIF}

  { IV StayOnTop: Always stay on top type of form? }
  if IvFormAlwaysStayOnTop then
    Self.FormStyle := fsStayOnTop;

  FTranslator := TIvTranslator.Create(Self);
  FTranslator.Dictionary := dictionary;
  FTranslator.Targets.Add(TIvTargetProperty.Create('', 'Caption', ivttInclude));
end;

constructor TIvMessageForm.CreateML(
  owner: TComponent;
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  dictionary: TIvDictionary;
  translateMsg: Boolean);
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcHorzSpacing = 10;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
  ICONIDS_C: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);
  BUTTONNAMES_C: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All',
{$IFDEF IVWIDE}
    'NoToAll', 'YesToAll',
{$ENDIF}
    'Help');
  MODALRESULTS_C: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll,
{$IFDEF IVWIDE}
    mrNoToAll, mrYesToAll,
{$ENDIF}
    0);
var
  DialogUnits: TPoint;
  HorzMargin, VertMargin, HorzSpacing, VertSpacing, ButtonWidth,
  ButtonHeight, ButtonSpacing, ButtonCount, ButtonGroupWidth,
  IconTextWidth, IconTextHeight, X: Integer;
  B, DefaultButton, CancelButton: TMsgDlgBtn;
  IconID: PChar;
  TextRect: TRect;
  str: String;
{$IFNDEF WIN32}
  buffer: array[0..255] of Char;
{$ENDIF}
begin
  inherited CreateML(owner, dictionary);

  BorderStyle := bsDialog;
  Canvas.Font := Font;
  DialogUnits := GetAveCharSize(Canvas);
  HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
  VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
  HorzSpacing := MulDiv(mcHorzSpacing, DialogUnits.X, 4);
  VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
  ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);
  ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
  ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
  SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
  if dictionary <> nil then
    str := dictionary.Translate(msg)
  else
    str := msg;
  DrawText(
    Canvas.Handle,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
    str),
    -1,
    TextRect,
    DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK);
  IconID := ICONIDS_C[DlgType];
  IconTextWidth := TextRect.Right;
  IconTextHeight := TextRect.Bottom;
  if IconID <> nil then
  begin
    Inc(IconTextWidth, 32 + HorzSpacing);
    if IconTextHeight < 32 then
      IconTextHeight := 32;
  end;
  ButtonCount := 0;
  for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    if B in Buttons then Inc(ButtonCount);
  ButtonGroupWidth := 0;
  if ButtonCount <> 0 then
    ButtonGroupWidth :=
      ButtonWidth * ButtonCount + ButtonSpacing * (ButtonCount - 1);
  ClientWidth := MaxInteger(IconTextWidth, ButtonGroupWidth) + HorzMargin * 2;
  ClientHeight :=
    IconTextHeight + ButtonHeight + VertSpacing + VertMargin * 2;
  Left := (Screen.Width div 2) - (Width div 2);
  Top := (Screen.Height div 2) - (Height div 2);
  if captionMsg = '' then
  begin
    if DlgType = mtCustom then
      Caption := Application.Title
    else
      Caption := CAPTIONS_C[DlgType];
  end
  else
    Caption := captionMsg;
  if IconID <> nil then
    with TImage.Create(Self) do
    begin
      Name := 'Image';
      Parent := Self;
      Picture.Icon.Handle := LoadIcon(0, IconID);
      SetBounds(HorzMargin, VertMargin, 32, 32);
    end;
  FMsg := TLabel.Create(Self);
  with FMsg do
  begin
    Name := 'Message';
    Parent := Self;
    WordWrap := True;
    Caption := msg;
    BoundsRect := TextRect;
    SetBounds(
      IconTextWidth - TextRect.Right + HorzMargin,
      VertMargin,
      TextRect.Right,
      TextRect.Bottom);
  end;
  if mbOk in Buttons then
    DefaultButton := mbOk
  else if mbYes in Buttons then
    DefaultButton := mbYes
  else
    DefaultButton := mbRetry;
  if mbCancel in Buttons then
    CancelButton := mbCancel
  else if mbNo in Buttons then
    CancelButton := mbNo
  else
    CancelButton := mbOk;
  X := (ClientWidth - ButtonGroupWidth) div 2;
  for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
  begin
    if B in Buttons then
      with TButton.Create(Self) do
      begin
        Name := BUTTONNAMES_C[B];
        Parent := Self;
        Caption := BUTTONCAPTIONS_C[B];
        ModalResult := MODALRESULTS_C[B];
        if B = DefaultButton then
          Default := True;
        if B = CancelButton then
          Cancel := True;
        SetBounds(
          X,
          IconTextHeight + VertMargin + VertSpacing,
          ButtonWidth,
          ButtonHeight);
        Inc(X, ButtonWidth + ButtonSpacing);
        if B = mbHelp then
          OnClick := HelpButtonClick;
      end;
  end;

  if not translateMsg then
    FTranslator.OnRestrictProperty := Restrict;
end;

procedure TIvMessageForm.Restrict(
  translator: TIvTranslator;
  obj: TObject;
  const name: String;
  var translate: Boolean);
begin
  if (obj = FMsg) and (CompareText(name, 'caption') = 0) then
    translate := False;
end;

procedure TIvMessageForm.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

function IvMessageBox(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  dictionary: TIvDictionary): Integer;
begin
  Result := IvMessageBoxPos(
    msg,
    captionMsg,
    dlgType,
    buttons,
    helpContext,
    -1,
    -1,
    dictionary);
end;

function IvMessageBoxPos(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  x, y: Integer;
  dictionary: TIvDictionary): Integer;
var
  box: TIvMessageForm;
begin
  box := TIvMessageForm.CreateML(Application, msg, captionMsg, dlgType, buttons, dictionary, True);

  try
    box.HelpContext := helpContext;
    if x >= 0 then
      box.Left := x;
    if y >= 0 then
      box.Top := y;

    box.FTranslator.Translate;
    Result := box.ShowModal;
  finally
    box.Free;
  end;
end;

procedure IvShowMessage(const msg: String; dictionary: TIvDictionary);
begin
  IvShowMessagePos(msg, -1, -1, dictionary);
end;

procedure IvShowMessagePos(const msg: String; x, y: Integer; dictionary: TIvDictionary);
begin
  IvMessageBoxPos(msg, '',  mtCustom, [mbOK], 0, x, y, dictionary);
end;

{ Extended message functions }

function IvMessageBoxEx(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  dictionary: TIvDictionary): Integer;
begin
  Result := IvMessageBoxPosEx(
    msg,
    captionMsg,
    dlgType,
    buttons,
    helpContext,
    -1,
    -1,
    dictionary);
end;

function IvMessageBoxPosEx(
  const msg, captionMsg: String;
  dlgType: TMsgDlgType;
  buttons: TMsgDlgButtons;
  helpContext: Longint;
  x, y: Integer;
  dictionary: TIvDictionary): Integer;
var
  box: TIvMessageForm;
begin
  box := TIvMessageForm.CreateML(Application, msg, captionMsg, dlgType, buttons, dictionary, False);
  try
    box.HelpContext := helpContext;
    if x >= 0 then
      box.Left := x;
    if y >= 0 then
      box.Top := y;
    box.FTranslator.Translate;
    Result := box.ShowModal;
  finally
    box.Free;
  end;
end;

{ Input box }

type
  TIvInputForm = class(TIvMLForm)
  protected
    Edit: TEdit;

    constructor CreateML(
      owner: TComponent;
      const captionMsg, prompt: String;
      var value: String;
      dictionary: TIvDictionary);
  end;

constructor TIvInputForm.CreateML(
  owner: TComponent;
  const captionMsg, prompt: String;
  var value: String;
  dictionary: TIvDictionary);
var
  promptLabel: TLabel;
  dialogUnits: TPoint;
  buttonTop, buttonWidth, buttonHeight: Integer;
begin
  inherited CreateML(owner, dictionary);

  Canvas.Font := Font;
  Caption := captionMsg;
  DialogUnits := GetAveCharSize(Canvas);
  BorderStyle := bsDialog;
  ClientWidth := MulDiv(180, DialogUnits.X, 4);
  ClientHeight := MulDiv(63, DialogUnits.Y, 8);
  Position := poScreenCenter;

  promptLabel := TLabel.Create(Self);
  with promptLabel do
  begin
    Parent := Self;
    AutoSize := True;
    Left := MulDiv(8, DialogUnits.X, 4);
    Top := MulDiv(8, DialogUnits.Y, 8);
    Caption := dictionary.Translate(prompt);
  end;

  Edit := TEdit.Create(Self);
  with Edit do
  begin
    Parent := Self;
    Left := PromptLabel.Left;
    Top := MulDiv(19, DialogUnits.Y, 8);
    Width := MulDiv(164, DialogUnits.X, 4);
    MaxLength := 255;
    Text := Value;
    SelectAll;
  end;

  buttonTop := MulDiv(41, DialogUnits.Y, 8);
  buttonWidth := MulDiv(50, DialogUnits.X, 4);
  buttonHeight := MulDiv(14, DialogUnits.Y, 8);
  with TButton.Create(Self) do
  begin
    Parent := Self;
    Caption := 'OK';
    ModalResult := mrOk;
    Default := True;
    SetBounds(
      MulDiv(38, DialogUnits.X, 4),
      buttonTop,
      buttonWidth,
      buttonHeight);
  end;

  with TButton.Create(Self) do
  begin
    Parent := Self;
    Caption := 'Cancel';
    ModalResult := mrCancel;
    Cancel := True;
    SetBounds(
      MulDiv(92, DialogUnits.X, 4),
      ButtonTop,
      ButtonWidth,
      ButtonHeight);
  end;

  FTranslator.Translate;
end;

function IvInputQuery(
  const captionMsg, prompt: String;
  var value: String;
  dictionary: TIvDictionary): Boolean;
var
  form: TIvInputForm;
begin
  Result := False;
  form := nil;

  try
    form := TIvInputForm.CreateML(Application, captionMsg, prompt, value, dictionary);
    if form.ShowModal = mrOk then
    begin
      value := form.Edit.Text;
      Result := True;
    end;
  finally
    form.Free;
  end;
end;

function IvInputBox(
  const captionMsg, prompt, def: String;
  dictionary: TIvDictionary): String;
begin
  Result := def;
  IvInputQuery(captionMsg, prompt, Result, dictionary);
end;

{ TIvSelectDirDlg }

type
  TIvPathLabel = class(TCustomLabel)
  protected
    procedure Paint; override;

  public
    constructor Create(owner: TComponent); override;

  published
    property Alignment;
    property Transparent;
  end;

  EInvalidDrive = class(Exception);

  TIvSelectDirDlg = class(TIvMLForm)
    DirList: TDirectoryListBox;
    DirEdit: TEdit;
    DriveList: TDriveComboBox;
    DirLabel: TIvPathLabel;
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    NetButton: TButton;
    FileList: TFileListBox;

    procedure DirListChange(Sender: TObject);
{$IFDEF DIR_CHECK}
    procedure DriveListClick(Sender: TObject);
{$ENDIF}
    procedure FormCreate(Sender: TObject);
    procedure DriveListChange(Sender: TObject);
    procedure NetClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);

  private
    FAllowCreate: Boolean;
    FPrompt: Boolean;
{$IFDEF DIR_CHECK}
    FOldDrive: Char;
{$ENDIF}
    WNetConnectDialog: function (WndParent: HWND; IType: Longint): Longint;

    procedure SetAllowCreate(value: Boolean);
    procedure SetDirectory(const value: String);
    function GetDirectory: String;

  public
    constructor CreateML(owner: TComponent; dictionary: TIvDictionary);

    property Directory: String read GetDirectory write SetDirectory;
    property AllowCreate: Boolean read FAllowCreate write SetAllowCreate default False;
    property Prompt: Boolean read FPrompt write FPrompt default False;
  end;

{$IFNDEF IVWIDE}
const
  Slashes: array [False..True] of PChar = ('','\');
{$ENDIF}

function SlashSep(const Path, S: String): String;
begin
{$IFDEF IVWIDE}
  if AnsiLastChar(Path)^ <> '\' then
    Result := Path + '\' + S
  else
    Result := Path + S;
{$ELSE}
  Result := Format('%s%s%s',[Path, Slashes[Path[Length(Path)] <> '\'], S]);
{$ENDIF}
end;

{ TIvPathLabel }

constructor TIvPathLabel.Create(owner: TComponent);
begin
  inherited Create(owner);
  WordWrap := False;
  AutoSize := False;
  ShowAccelChar := False;
end;

procedure TIvPathLabel.Paint;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  Rect: TRect;
  Temp: String;
{$IFNDEF WIN32}
  buffer: array[0..255] of Char;
{$ENDIF}
begin
  with Canvas do
  begin
    Rect := ClientRect;
    if not Transparent then
    begin
      Brush.Color := Self.Color;
      Brush.Style := bsSolid;
      FillRect(Rect);
    end;
    Brush.Style := bsClear;
    Temp := MinimizeName(Caption, Canvas, Rect.Right - Rect.Left);
    DrawText(
      Canvas.Handle,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
      Temp),
      Length(Temp),
      Rect,
      DT_NOPREFIX or Alignments[Alignment]);
  end;
end;


{ TIvSelectDirDlg }

{$IFDEF POIS}
function DiskInDrive(Drive: Char): Boolean;
var
  ErrorMode: word;
begin
  // Make it upper case

  Drive := UpCase(Drive);

  // Make sure it's a letter

  if not (Drive in ['A'..'Z']) then
    raise Exception.Create(Format('%s is not a valid driveletter', [Drive]));

  // Turn off critical errors

  ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
  try
    // drive 1 = a, 2 = b, 3 = c, etc.

    if DiskSize(Ord(Drive) - $40) = -1 then
      Result := False
    else
      Result := True;
  finally
    // Restore old error mode

    SetErrorMode(ErrorMode);
  end;
end;

procedure ProcessPath(
  const EditText: String;
  var Drive: Char;
  var DirPart: String;
  var FilePart: String);
var
  SaveDir: string;
  Root: string;
begin
  GetDir(0, SaveDir);
  Drive := SaveDir[1];
  DirPart := EditText;
  if (DirPart[1] = '[') and (AnsiLastChar(DirPart)^ = ']') then
    DirPart := Copy(DirPart, 2, Length(DirPart) - 2)
  else
  begin
    Root := ExtractFileDrive(DirPart);
    if Length(Root) = 0 then
      Root := ExtractFileDrive(SaveDir)
    else
      Delete(DirPart, 1, Length(Root));
    if (Length(Root) >= 2) and (Root[2] = ':') then
      Drive := Root[1]
    else
      Drive := #0;
  end;

  if (not DiskInDrive(Drive)) then
    raise EInvalidDrive.CreateFmt('No disk in drive %s', [UpCase(Drive)]);

  try
    if DirectoryExists(Root) then
      ChDir(Root);
    FilePart := ExtractFileName (DirPart);
    if Length(DirPart) = (Length(FilePart) + 1) then
      DirPart := '\'
    else if Length(DirPart) > Length(FilePart) then
      SetLength(DirPart, Length(DirPart) - Length(FilePart) - 1)
    else
    begin
      GetDir(0, DirPart);
      Delete(DirPart, 1, Length(ExtractFileDrive(DirPart)));
      if Length(DirPart) = 0 then
        DirPart := '\';
    end;
    if Length(DirPart) > 0 then
      ChDir (DirPart);  {first go to our new directory}
    if (Length(FilePart) > 0) and not
       (((Pos('*', FilePart) > 0) or (Pos('?', FilePart) > 0)) or
       FileExists(FilePart)) then
    begin
      ChDir(FilePart);
      if Length(DirPart) = 1 then
        DirPart := '\' + FilePart
      else
        DirPart := DirPart + '\' + FilePart;
      FilePart := '';
    end;
    if Drive = #0 then
      DirPart := Root + DirPart;
  finally
    if DirectoryExists(SaveDir) then
      ChDir(SaveDir);  { restore original directory }
  end;
end;
{$ENDIF}

constructor TIvSelectDirDlg.CreateML(owner: TComponent; dictionary: TIvDictionary);
begin
  inherited CreateML(owner, dictionary);
  Caption := 'Select Directory'; {ivlm}
  BorderStyle := bsDialog;
  ClientWidth := 424;
  ClientHeight := 255;
  Position := poScreenCenter;

  DirEdit := TEdit.Create(Self);
  with DirEdit do
  begin
    Parent := Self;
    SetBounds(8, 24, 313, 20);
    Visible := False;
    TabOrder := 0;
  end;

  with TLabel.Create(Self) do
  begin
    Parent := Self;
    SetBounds(8, 8, 92, 13);
    FocusControl := DirEdit;
    Caption := 'Directory &Name:'; {ivlm}
  end;

  DriveList := TDriveComboBox.Create(Self);
  with DriveList do
  begin
    Parent := Self;
    SetBounds(232, 192, 185, 19);
    TabOrder := 4;
    OnChange := DriveListChange;
{$IFDEF DIR_CHECK}
    OnClick  := DriveListClick;
{$ENDIF}
  end;

  with TLabel.Create(Self) do
  begin
    Parent := Self;
    SetBounds(232, 176, 41, 13);
    Caption := 'D&rives:'; {ivlm}
    FocusControl := DriveList;
  end;

  DirLabel := TIvPathLabel.Create(Self);
  with DirLabel do
  begin
    Parent := Self;
    SetBounds(120, 8, 213, 13);
  end;

  DirList := TDirectoryListBox.Create(Self);
  with DirList do
  begin
    Parent := Self;
    SetBounds(8, 72, 213, 138);
    TabOrder := 1;
    TabStop := True;
    ItemHeight := 17;
    IntegralHeight := True;
    OnChange := DirListChange;
  end;

  with TLabel.Create(Self) do
  begin
    Parent := Self;
    SetBounds(8, 56, 66, 13);
    Caption := '&Directories:'; {ivlm}
    FocusControl := DirList;
  end;

  FileList := TFileListBox.Create(Self);
  with FileList do
  begin
    Parent := Self;
    SetBounds(232, 72, 185, 93);
    TabOrder := 2;
    TabStop := True;
    FileType := [ftNormal];
    Mask := '*.*';
    Font.Color := clGrayText;
    ItemHeight := 13;
  end;

  with TLabel.Create(Self) do
  begin
    Parent := Self;
    SetBounds(232, 56, 57, 13);
    Caption := '&Files: (*.*)'; {ivlm}
    FocusControl := FileList;
  end;

  NetButton := TButton.Create(Self);
  with NetButton do
  begin
    Parent := Self;
    SetBounds(8, 224, 75, 25);
    Visible := False;
    TabOrder := 6;
    Caption := 'Ne&twork...'; {ivlm}
    OnClick := NetClick;
  end;

  OKButton := TButton.Create(Self);
  with OKButton do
  begin
    Parent := Self;
    SetBounds(172, 224, 75, 25);
    TabOrder := 4;
    OnClick := OKClick;
    Caption := 'OK'; {ivlm}
    ModalResult := 1;
    Default := True;
  end;

  CancelButton := TButton.Create(Self);
  with CancelButton do
  begin
    Parent := Self;
    SetBounds(256, 224, 75, 25);
    TabOrder := 5;
    Cancel := True;
    Caption := 'Cancel'; {ivlm}
    ModalResult := 2;
  end;

  HelpButton := TButton.Create(Self);
  with HelpButton do
  begin
    Parent := Self;
    SetBounds(340, 224, 77, 27);
    TabOrder := 7;
    Caption := '&Help'; {ivlm}
    OnClick := HelpButtonClick;
  end;

  FormCreate(Self);
  FTranslator.Translate;
end;

procedure TIvSelectDirDlg.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TIvSelectDirDlg.DirListChange(Sender: TObject);
begin
  DirLabel.Caption := DirList.Directory;
  FileList.Directory := DirList.Directory;
  DirEdit.Text := DirLabel.Caption;
  DirEdit.SelectAll;
end;

{$IFDEF DIR_CHECK}
procedure TIvSelectDirDlg.DriveListClick(Sender: TObject);
begin
  FOldDrive := DriveList.Drive;
end;
{$ENDIF}

procedure TIvSelectDirDlg.DriveListChange(Sender: TObject);
begin
  try
    DirList.Drive := DriveList.Drive;
  except
{$IFDEF DIR_CHECK}
    DriveList.Drive := FOldDrive;
{$ENDIF}
    raise;
  end;
end;

procedure TIvSelectDirDlg.FormCreate(Sender: TObject);
var
  UserHandle: THandle;
  NetDriver: THandle;
  WNetGetCaps: function (Flags: Word): Word;
begin
  { is network access enabled? }
{$IFDEF WIN32}
  UserHandle := GetModuleHandle(User32);
{$ELSE}
  UserHandle := GetModuleHandle('USER');
{$ENDIF}
  @WNetGetCaps := GetProcAddress(UserHandle, 'WNETGETCAPS');
  if @WNetGetCaps <> nil then
  begin
    NetDriver := WNetGetCaps(Word(-1));
    if NetDriver <> 0 then
    begin
      @WNetConnectDialog := GetProcAddress(NetDriver, 'WNETCONNECTDIALOG');
      NetButton.Visible := @WNetConnectDialog <> nil;
    end;
  end;

  FAllowCreate := False;
  DirLabel.BoundsRect := DirEdit.BoundsRect;
  DirListChange(Self);
end;

procedure TIvSelectDirDlg.SetAllowCreate(Value: Boolean);
begin
  if Value <> FAllowCreate then
  begin
    FAllowCreate := Value;
    DirLabel.Visible := not FAllowCreate;
    DirEdit.Visible := FAllowCreate;
  end;
end;

procedure TIvSelectDirDlg.SetDirectory(const Value: string);
var
  Temp: string;
begin
  if Value <> '' then
  begin
    Temp := ExpandFileName(SlashSep(Value, '*.*'));
    if (Length(Temp) >= 3) and (Temp[2] = ':') then
    begin
      DriveList.Drive := Temp[1];
      Temp := ExtractFilePath(Temp);
      try
        DirList.Directory := Copy(Temp, 1, Length(Temp) - 1);
      except
        on EInOutError do
        begin
          GetDir(0, Temp);
          DriveList.Drive := Temp[1];
          DirList.Directory := Temp;
        end;
      end;
    end;
  end;
end;

function TIvSelectDirDlg.GetDirectory: string;
begin
  if FAllowCreate then
    Result := DirEdit.Text
  else
    Result := DirLabel.Caption;
end;

procedure TIvSelectDirDlg.NetClick(Sender: TObject);
begin
  if Assigned(WNetConnectDialog) then
    WNetConnectDialog(Handle, WNTYPE_DRIVE);
end;

procedure TIvSelectDirDlg.OKClick(Sender: TObject);
begin
  if AllowCreate and Prompt and (not DirectoryExists(Directory)) and
    (IvMessageBox(
      'The specified directory does not exist. Create it?', {ivlm}
      '',
      mtConfirmation,
      [mbYes, mbNo],
      0,
      FTranslator.Dictionary) <> mrYes) then
    ModalResult := 0;
end;

function IvSelectDirectory(
  var directory: String;
  options: TSelectDirOpts;
  helpContext: Longint;
  dictionary: TIvDictionary): Boolean;
var
  dialog: TIvSelectDirDlg;
begin
  dialog := TIvSelectDirDlg.CreateML(Application, dictionary);
  try
    dialog.Directory := Directory;
    dialog.AllowCreate := sdAllowCreate in Options;
    dialog.Prompt := sdPrompt in Options;

    { scale to screen res }

    if Screen.PixelsPerInch <> 96 then
    begin
      dialog.ScaleBy(Screen.PixelsPerInch, 96);
      dialog.FileList.ParentFont := True;
      dialog.Left := (Screen.Width div 2) - (dialog.Width div 2);
      dialog.Top := (Screen.Height div 2) - (dialog.Height div 2);
      dialog.FileList.Font.Color := clGrayText;
    end;

    if helpContext = 0 then
    begin
      dialog.HelpButton.Visible := False;
      dialog.OKButton.Left := dialog.CancelButton.Left;
      dialog.CancelButton.Left := dialog.HelpButton.Left;
    end
    else
      dialog.HelpContext := helpContext;

    Result := dialog.ShowModal = mrOK;
    if Result then
    begin
      Directory := dialog.Directory;
      if sdPerformCreate in Options then
        ForceDirectories(Directory);
    end;
  finally
    dialog.Free;
  end;
end;

end.
