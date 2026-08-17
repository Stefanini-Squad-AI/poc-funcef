{
This translator module component translates the color names of
the color components of the 1stClass components.

To do: Translate the none string
}

unit Iv1stMod;

interface

uses
  Classes, Graphics,
  IvMulti,
  fcColorCombo;

type
  TIv1stClassModule = class(TIvModule)
  protected
    FColors: TStringList;
    FOptions: TfcColorListBoxOptions;

    procedure ColorCallbackProc(const str: String);
    function AddColor(const name, color: String): Boolean;

    procedure InitCustomColors(
      colors: TStringList;
      options: TfcColorListBoxOptions;
      greyScaleIncrement: Integer;
      noneString: String);

  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;

    class function ComposeValueColor(const name: String; color: TColor): String;
    class function ComposeValueString(const name, color: String): String;

    class function ParseColorValue(
      const str: String;
      var name: String;
      var color: TColor): String;
  end;

implementation

uses
  SysUtils, Windows,
  IvCommon, IvDictio, IvParser,
  fcCommon;

function TIv1stClassModule.AddColor(const name, color: String): Boolean;
var
  str: String;
begin
  str := ComposeValueString(name, color);
  FColors.Add(ComposeValueString(name, color));
  Result := True;
end;

procedure TIv1stClassModule.ColorCallbackProc(const str: String);
var
  colorInt: LongInt;
  color: TColor;
begin
  IdentToColor(str, colorInt);
  colorInt := colorInt and $00FFFFFF;
  color := StringToColor(str);

  if (str = 'clBlack') and (ccoShowStandardColors in FOptions) then
    AddColor(Copy(str, 3, Length(str) - 2), IntToHex(color, 6))
  else if ((str <> 'clBlack') and (str <> 'clNone') and
    (((ccoShowStandardColors in FOptions) and
    (not (colorInt in [COLOR_SCROLLBAR..COLOR_ENDCOLORS])) or
    ((colorInt in [COLOR_SCROLLBAR..COLOR_ENDCOLORS]) and
    (ccoShowSystemColors in FOptions))))) then
  begin
    AddColor(Copy(str, 3, Length(str) - 2), IntToHex(color,6));
  end;
end;

procedure TIv1stClassModule.InitCustomColors(
  colors: TStringList;
  options: TfcColorListBoxOptions;
  greyScaleIncrement: Integer;
  noneString: String);
var
  i, count: Integer;
begin
  FColors := colors;
  FOptions := options;

  if ccoShowColorNone in options then
  begin
    if noneString = '' then
      noneString := 'None';
    AddColor(noneString, IntToHex(clNone, 6));
  end;

  GetColorValues(ColorCallbackProc);

  if ccoShowGreyScale in options then
  begin
    i := 0;
    count := 1;
    while i <= 255 do
    begin
      if AddColor('Grey' + IntToStr(count), fcRGBToHexString(i, i, i)) then
        Inc(count);
      i := i + GreyScaleIncrement;
    end;
 end;
end;

class function TIv1stClassModule.ComposeValueString(const name, color: String): String;
begin
  Result := name + '=' + color;
end;

class function TIv1stClassModule.ComposeValueColor(const name: String; color: TColor): String;
begin
  Result := ComposeValueString(name, IntToHex(Integer(color), 6));
end;

class function TIv1stClassModule.ParseColorValue(
  const str: String;
  var name: String;
  var color: TColor): String;
var
  parser: TIvAnsiParser;
begin
  parser := TIvAnsiParser.CreateValue(str, '=');
  try
    name := parser.GetString;
    color := StrToInt('$' + parser.GetString);
  finally
    parser.Free
  end;
end;

function TIv1stClassModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
  str: String;
  color: TColor;
  colorList: TfcCustomColorList;
  colorCombo: TfcCustomColorCombo;

  function IsInitNeeded(options: TfcColorListBoxOptions): Boolean;
  begin
    Result :=
      not (ccoShowCustomColors in options) or
      (ccoShowSystemColors in options) or
      (ccoShowColorNone in options) or
      (ccoShowStandardColors in options) or
      (ccoShowGreyScale	in options);
  end;

  function GetOptions(options: TfcColorListBoxOptions): TfcColorListBoxOptions;
  begin
    Result := options
      - [ccoShowSystemColors, ccoShowColorNone, ccoShowStandardColors, ccoShowGreyScale]
      + [ccoShowCustomColors];
  end;

begin
  if (component is TfcCustomColorList) then
  begin
    // Translates the items of the color list

    if translator.Targets.IsPropertyInTargets(component.ClassName, 'CustomColors') then
    begin
      colorList := TfcCustomColorList(component);

      // Inits the color list

      if IsInitNeeded(colorList.Options) then
      begin
        InitCustomColors(
          colorList.CustomColors,
          colorList.Options,
          colorList.GreyScaleIncrement,
          colorList.NoneString);
        colorList.Options := GetOptions(colorList.Options);
      end;

      colorList.CustomColors.BeginUpdate;
      for i := 0 to colorList.CustomColors.Count - 1 do
      begin
        ParseColorValue(colorList.CustomColors[i], str, color);

        colorList.CustomColors[i] := ComposeValueColor(
          translator.DoTranslateContextString(
            colorList,
            component.Name,
            'CustomColors',
            str),
          color);
      end;
      colorList.CustomColors.EndUpdate;
    end;
    Result := True;
  end
  else if (component is TfcCustomColorCombo) then
  begin
    // Translates the items of the color combo

    if translator.Targets.IsPropertyInTargets(component.ClassName, 'CustomColors') then
    begin
      colorCombo := TfcCustomColorCombo(component);

      // Inits the color list

      if IsInitNeeded(colorCombo.ColorListOptions.Options) then
      begin
        InitCustomColors(
          colorCombo.CustomColors,
          colorCombo.ColorListOptions.Options,
          colorCombo.ColorListOptions.GreyScaleIncrement,
          colorCombo.ColorListOptions.NoneString);
        colorCombo.ColorListOptions.Options := GetOptions(colorCombo.ColorListOptions.Options);
      end;

      colorCombo.CustomColors.BeginUpdate;
      for i := 0 to colorCombo.CustomColors.Count - 1 do
      begin
        ParseColorValue(colorCombo.CustomColors[i], str, color);

        colorCombo.CustomColors[i] := ComposeValueColor(
          translator.DoTranslateContextString(
            colorCombo,
            component.Name,
            'CustomColors',
            str),
          color);
      end;
      colorCombo.CustomColors.EndUpdate;
    end;
    Result := True;
  end
  else
    Result := False;
end;

begin
  Modules.Add(TIv1stClassModule.Create(nil));
end.
