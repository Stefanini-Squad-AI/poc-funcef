unit QExport3HTML;

{$I VerCtrl.inc}

interface

uses QExport3, Classes, IniFiles
     {$IFDEF WIN32}
       {$IFNDEF NOGUI}, Graphics{$ELSE}, QExport3Graphics{$ENDIF}
     {$ENDIF}
     {$IFDEF LINUX}
       {$IFNDEF NOGUI}, QGraphics{$ELSE}, QExport3Graphics{$ENDIF}
     {$ENDIF};

type
  TQHTMLWriter = class(TQExportWriter)
  public
    procedure StartHTML;
    procedure EndHTML;
    procedure StartHEAD;
    procedure EndHEAD;
    procedure StartUI;
    procedure EndUI;
    procedure LI;
    procedure StartBODY;
    procedure EndBODY;
    procedure StartSTYLE;
    procedure EndSTYLE;
    procedure WriteTITLE(const ATitle: string);
    function AlignToStr(Value: TQExportColAlign): string; override;
    procedure WriteLocationLinks(const Index, First, Prior, Next, Last,
      Template: string; PageCount, PageNumber: integer; IsTop, IsIndex: boolean;
      Strings: TStrings);
    procedure WriteCaptionRowTD(const Data: string);
    procedure WriteOddRowTD(const Data: string);
    procedure WriteEvenRowTD(const Data: string);
    procedure WriteTABLE(BorderWidth, CellPadding, CellSpacing: integer;
      const BackgroundFileName: string);
    procedure WriteCSSLink(const FileName: string);
  end;

  TTableOptions = class(TPersistent)
  private
    FCellPadding: integer;
    FCellSpacing: integer;
    FBorder: integer;
    FAdvancedAttributes: TStrings;
    FOddRowBgColor: TColor;
    FHeadersRowFontColor: TColor;
    FTableFontColor: TColor;
    FTableBgColor: TColor;
    FHeadersRowBgColor: TColor;
    FBorderColor: TColor;
    FBackgroundFileName: string;
    procedure SetCellPadding(const Value: integer);
    procedure SetCellSpacing(const Value: integer);
    procedure SetBorder(const Value: integer);
    procedure SetAdvancedAttributes(const Value: TStrings);
    procedure SetHeadersRowBgColor(const Value: TColor);
    procedure SetHeadersRowFontColor(const Value: TColor);
    procedure SetOddRowBgColor(const Value: TColor);
    procedure SetTableBgColor(const Value: TColor);
    procedure SetTableFontColor(const Value: TColor);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property Border: integer read FBorder write SetBorder default 1;
    property CellPadding: integer read FCellPadding
      write SetCellPadding default 4;
    property CellSpacing: integer read FCellSpacing
      write SetCellSpacing default 1;
    property AdvancedAttributes: TStrings read FAdvancedAttributes
      write SetAdvancedAttributes;
    property HeadersRowBgColor: TColor read FHeadersRowBgColor
      write SetHeadersRowBgColor;
    property HeadersRowFontColor: TColor read FHeadersRowFontColor
      write SetHeadersRowFontColor;
    property TableBgColor: TColor read FTableBgColor write SetTableBgColor;
    property TableFontColor: TColor read FTableFontColor write SetTableFontColor;
    property OddRowBgColor: TColor read FOddRowBgColor write SetOddRowBgColor;
    property BorderColor: TColor read FBorderColor
      write FBorderColor default clWhite;
    property BackgroundFileName: string read FBackgroundFileName
      write FBackgroundFileName;
  end;

  TDefaultOption = (doFontName, doFontSize);

  TDefaultOptions = set of TDefaultOption;

  THTMLOptions = class(TPersistent)
  private
    FBackgroundColor: TColor;
    FBackgroundFileName: string;
    FVLinkColor: TColor;
    FLinkColor: TColor;
    FALinkColor: TColor;
    FTextFont: TFont;
    FAdvancedAttributes: TStrings;
    FDefaultOptions: TDefaultOptions;
    procedure SetAdvancedAttributes(const Value: TStrings);
    procedure SetTextFont(const Value: TFont);
    procedure SetBackgroundFileName(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property BackgroundColor: TColor read FBackgroundColor
      write FBackgroundColor;
    property BackgroundFileName: string read FBackgroundFileName
      write SetBackgroundFileName;
    property LinkColor: TColor read FLinkColor write FLinkColor;
    property VLinkColor: TColor read FVLinkColor write FVLinkColor;
    property ALinkColor: TColor read FALinkColor write FALinkColor;
    property TextFont: TFont read FTextFont write SetTextFont;
    property AdvancedAttributes: TStrings read FAdvancedAttributes
      write SetAdvancedAttributes;
    property DefaultOptions: TDefaultOptions read FDefaultOptions
      write FDefaultOptions;
  end;

  TUsingCSS = (usInternal, usExternal);
  THTMLTemplate = (htCustom, htBW, htClassic, htColorFul, htGray, htMS_Money,
    htMurky, htOlive, htPlain, htSimple);

  TQExportHTMLNavigation = class(TPersistent)
  private
    FIndexLinkTemplate: string;
    FOnBottom: boolean;
    FOnTop: boolean;
    FIndexLinkTitle: string;
    FFirstLinkTitle: string;
    FPriorLinkTitle: string;
    FNextLinkTitle: string;
    FLastLinkTitle: string;
  public
    constructor Create;
    procedure Assign(SOurce: TPersistent); override;
  published
    property IndexLinkTemplate: string read FIndexLinkTemplate
      write FIndexLinkTemplate;
    property OnTop: boolean read FOnTop write FOnTop default true;
    property OnBottom: boolean read FOnBottom write FOnBottom default true;
    property IndexLinkTitle: string read FIndexLinkTitle write FIndexLinkTitle;
    property FirstLinkTitle: string read FFirstLinkTitle write FFirstLinkTitle;
    property PriorLinkTitle: string read FPriorLinkTitle write FPriorLinkTitle;
    property NextLinkTitle: string read FNextLinkTitle write FNextLinkTitle;
    property LastLinkTitle: string read FLastLinkTitle write FLastLinkTitle;
  end;

  TQExport3HTML = class(TQExport3FormatText)
  private
    FBoolAsCheckBox: boolean;
    FGenerateIndex: boolean;
    FMaxRecords: integer;
    FNavigation: TQExportHTMLNavigation;
    FCSSFileName: string;
    FHTMLOptions: THTMLOptions;
    FHTMLTemplate: THTMLTemplate;
    FTableOptions: TTableOptions;
    FUsingCSS: TUsingCSS;
    SStyle: TStringList;
    FCurrPass: integer;
    FUseBorderColor: boolean;
    FOverwriteCSSFile: boolean;

    FStr: TFileStream;
    FPages: TList;
    FInterpretTags: Boolean;

    procedure SetHTMLOptions(const Value: THTMLOptions);
    procedure SetHTMLTemplate(const Value: THTMLTemplate);
    procedure SetMaxRecords(const Value: integer);
    procedure SetTableOptions(const Value: TTableOptions);
    procedure SetNavigation(const Value: TQExportHTMLNavigation);

    procedure DoGenerateIndex;
    procedure ClearPages;
    function IsTableBGDefined: boolean;
    procedure WritePageHeader(const CurrFileName: string);
  protected
    procedure WriteDataRow; override;

    function GetColData(ExportCol: TQExportCol): string; override;
    procedure WriteCaptionRow; override;

    function GetSpecialCharacters: TSpecialCharacters; override;

    function GetWriter: TQHTMLWriter;
    function GetWriterClass: TQExportWriterClass; override;

    procedure BeginExport; override;
    procedure BeforeExport; override;
    procedure AfterExport; override;
    procedure EndExport; override;

    function GetShowedFileName: string; override;
    function GetPrintedFileName: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Abort; override;
    function NormalString(const S: string): string; override;
    procedure Execute; override;

    procedure SaveTemplateToFile(const FileName: string);
    procedure LoadTemplateFromFile(const FileName: string);
  published
    property UsingCSS: TUsingCSS read FUsingCSS
      write FUsingCSS default usInternal;
    property CSSFileName: string read FCSSFileName
      write FCSSFileName;
    property OverwriteCSSFile: boolean read FOverwriteCSSFile
      write FOverwriteCSSFile  default true;
    property TableOptions: TTableOptions
      read FTableOptions write SetTableOptions;
    property HTMLOptions: THTMLOptions read FHTMLOptions
      write SetHTMLOptions;
    property HTMLTemplate: THTMLTemplate read FHTMLTemplate
      write SetHTMLTemplate default htClassic;
    property MaxRecords: integer read FMaxRecords
      write SetMaxRecords default 0;
    property GenerateIndex: boolean read FGenerateIndex
      write FGenerateIndex default false;
    property Navigation: TQExportHTMLNavigation read FNavigation
      write SetNavigation;
    property BoolAsCheckBox: boolean read FBoolAsCheckBox
      write FBoolAsCheckBox default false;
    property InterpretTags: Boolean read FInterpretTags
      write FInterpretTags default True;

    property Title;
    property ColumnsAlign;
    property OnGetCellParams;
  end;

  function TemplateToStr(ATemplate: THTMLTemplate): string;

implementation

uses SysUtils, QExport3HTMLTemplates, QExport3Common;

const // do not localize
  SColor = 'color: %s;';
  SBackgroundColor = 'background-color: %s;';
  SNormal = 'normal';
  SBold = 'bold';
  SItalic = 'italic';
  SFontWeight = 'font-weight: %s;';
  SFontStyle = 'font-style: %s;';
  SNone = 'none';
  SUnderline = 'underline';
  STextDecoration = 'text-decoration: %s;';
  SFontSize = 'font-size: %dpt;';
  SFontFamily = 'font-family: %s;';
  SAlign = 'align=%s';

  SCheckedBox = '<input type="checkbox" checked disabled>';
  SUncheckedBox = '<input type="checkbox" disabled>';

type
  THTMLPageOption = class
  private
    FTopLocationLinkPos: integer;
    FBottomLocationLinkPos: integer;
  public
    constructor Create;

    property TopLocationLinkPos: integer read FTopLocationLinkPos
      write FTopLocationLinkPos;
    property BottomLocationLinkPos: integer read FBottomLocationLinkPos
      write FBottomLocationLinkPos;
  end;

  constructor THTMLPageOption.Create;
  begin
    inherited;
    FTopLocationLinkPos := -1;
    FBottomLocationLinkPos := -1;
  end;

function IntToHexStr(const Value: integer): string;
begin
  Result := Format('#%.6x', [Value]);
end;

function D2HTMLColor(DColor: TColor): TColor;
begin
  Result := (DColor and $0000FF00) or ((DColor mod $100) * $10000)
    or ((DColor div $10000) mod $100);
end;

function ExtractFName(const FileName: string): string;
begin
  Result := ChangeFileExt(FileName, '');
end;

function TemplateToStr(ATemplate: THTMLTemplate): string;
const
  TemplateStr: array[THTMLTemplate] of string = ('Custom', 'Black&White',
    'Classic', 'ColorFul', 'Gray', 'MS_Money', 'Murky', 'Olive', 'Plain',
    'Simple');
begin
  Result := TemplateStr[ATemplate];
end;

{ TQHTMLWriter }

function TQHTMLWriter.AlignToStr(Value: TQExportColAlign): string;
begin
  case Value of
    ecaLeft: Result := 'Left';
    ecaCenter: Result := 'Center';
    ecaRight: Result := 'Right';
    else Result := EmptyStr;
  end
end;

procedure TQHTMLWriter.EndBODY;
begin
  WriteLn('</BODY>');
end;

procedure TQHTMLWriter.EndHEAD;
begin
  WriteLn('</HEAD>');
end;

procedure TQHTMLWriter.EndHTML;
begin
  WriteLn('</HTML>');
end;

procedure TQHTMLWriter.EndSTYLE;
begin
  WriteLn('</STYLE>');
end;

procedure TQHTMLWriter.EndUI;
begin
  WriteLn('</UI>');
end;

procedure TQHTMLWriter.LI;
begin
  WriteLn('<LI>');
end;

procedure TQHTMLWriter.StartBODY;
begin
  WriteLn('<BODY>');
end;

procedure TQHTMLWriter.StartHEAD;
begin
  WriteLn('<HEAD>');
end;

procedure TQHTMLWriter.StartHTML;
begin
  WriteLn('<HTML>');
end;

procedure TQHTMLWriter.StartSTYLE;
begin
  WriteLn('<Style type="text/css">');
end;

procedure TQHTMLWriter.StartUI;
begin
  WriteLn('<UI>');
end;

procedure TQHTMLWriter.WriteLocationLinks(const Index, First, Prior, Next, Last,
  Template: string; PageCount, PageNumber: integer; IsTop, IsIndex: boolean;
  Strings: TStrings);
var
  sFirst, sPrior, sNext, sLast, sLink, sNumber: string;
  i: integer;
  nPrior, nNext: integer;
begin
  if PageNumber = 1
    then nPrior := PageCount
    else nPrior := PageNumber - 1;

  if PageNumber = PageCount
    then nNext := 1
    else nNext := PageNumber + 1;

  sFirst := AddNumberToFileName(ExtractFileName(Template), 1, 2);
  sPrior := AddNumberToFileName(ExtractFileName(Template), nPrior, 2);
  sNext := AddNumberToFileName(ExtractFileName(Template), nNext, 2);
  sLast := AddNumberToFileName(ExtractFileName(Template), PageCount, 2);

  Strings.BeginUpdate;
  try
    Strings.Clear;

    if not IsTop then Strings.Add('<br>');
    Strings.Add('<Table Border="0" Cellpadding="4" Cellspacing="1">');
    Strings.Add('  <tr>');
    if IsIndex then
      Strings.Add('    <td><a href="' + ExtractFileName(Template) + '">' + Index + '</a></td>');
    Strings.Add('    <td><a href="' + sFirst + '">' + First + '</a></td>');
    Strings.Add('    <td><a href="' + sPrior + '">' + Prior + '</a></td>');
    for i := 1 to PageCount do
      if i <> PageNumber then begin
        if i < 10
          then sNumber := Format('0%d', [i])
          else sNumber := IntToStr(i);

        sLink := AddNumberToFileName(ExtractFileName(Template), i, 2);

        Strings.Add('    <td><a href="' + sLink + '">' + sNumber + '</a></td>');
      end
      else begin
        if i < 10
          then sNumber := Format('0%d', [i])
          else sNumber := IntToStr(i);

        Strings.Add('    <td><b>' + sNumber + '</b></td>');
      end;

    Strings.Add('    <td><a href="' + sNext + '">' + Next + '</a></td>');
    Strings.Add('    <td><a href="' + sLast + '">' + Last + '</a></td>');
    Strings.Add('  </tr>');
    Strings.Add('</Table>');
    if IsTop then Strings.Add('<br>');
  finally
    Strings.EndUpdate;
  end;
end;

procedure TQHTMLWriter.WriteTITLE(const ATitle: string);
begin
  WriteLn(' <Title>' + ATitle + '</Title>');
end;

procedure TQHTMLWriter.WriteCaptionRowTD(const Data: string);
begin
  WriteLn(Format('    <td class="ThRows">%s</td>', [Data]));
end;

procedure TQHTMLWriter.WriteOddRowTD(const Data: string);
begin
  WriteLn(Format('    <td class="TrOdd"%s</td>', [Data]));
end;

procedure TQHTMLWriter.WriteEvenRowTD(const Data: string);
begin
  WriteLn(Format('    <td class="TrRows"%s</td>', [Data]));
end;

procedure TQHTMLWriter.WriteTABLE(BorderWidth, CellPadding,
  CellSpacing: integer; const BackgroundFileName: string);
begin
  if not FileExists(BackgroundFileName) then
    WriteLn(Format('<Table Border="%d" Cellpadding="%d" Cellspacing="%d">',
                   [BorderWidth, CellPadding, CellSpacing]))
  else
    WriteLn(Format('<Table Border="%d" Cellpadding="%d" Cellspacing="%d" Background="%s">',
                   [BorderWidth, CellPadding, CellSpacing, BackgroundFileName]))
end;

procedure TQHTMLWriter.WriteCSSLink(const FileName: string);
begin
  WriteLn(Format(' <link rel="stylesheet" type="text/css" href="%s">', [{ExtractFileName(}FileName{)}]));
end;

{ TTableOptions }

constructor TTableOptions.Create;
begin
  inherited Create;
  FBorder := 1;
  FCellPadding := 4;
  FCellSpacing := 1;
  FBorderColor := clWhite;
  FAdvancedAttributes := TStringList.Create;
end;

destructor TTableOptions.Destroy;
begin
  FAdvancedAttributes.Free;
  inherited Destroy;
end;

procedure TTableOptions.Assign(Source: TPersistent);
var
  ATableOptions: TTableOptions;
begin
  if Source is TTableOptions then begin
    ATableOptions := TTableOptions(Source);
    Border := ATableOptions.Border;
    CellPadding := ATableOptions.CellPadding;
    CellSpacing := ATableOptions.CellSpacing;
    AdvancedAttributes := ATableOptions.AdvancedAttributes;
    HeadersRowBgColor := ATableOptions.HeadersRowBgColor;
    HeadersRowFontColor := ATableOptions.HeadersRowFontColor;
    TableBgColor := ATableOptions.TableBgColor;
    TableFontColor := ATableOptions.TableFontColor;
    OddRowBgColor := ATableOptions.OddRowBgColor;
    BorderColor := ATableOptions.BorderColor;
  end;
end;

procedure TTableOptions.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(S_HTML, S_HTML_CellPadding, CellPadding);
    WriteInteger(S_HTML, S_HTML_CellSpacing, CellSpacing);
    WriteInteger(S_HTML, S_HTML_BorderWidth, Border);
    WriteString(S_HTML, S_HTML_TableBackground, BackgroundFileName);
    WriteString(S_HTML, S_HTML_TableAdvanced, AdvancedAttributes.Text);
    WriteString(S_HTML, S_HTML_OddRowBackgroundColor,
      ColorToString(OddRowBgColor));
    WriteString(S_HTML, S_HTML_HeadFontColor,
      ColorToString(HeadersRowFontColor));
    WriteString(S_HTML, S_HTML_DataFontColor,
      ColorToString(TableFontColor));
    WriteString(S_HTML, S_HTML_EvenRowBackgroundColor,
      ColorToString(TableBgColor));
    WriteString(S_HTML, S_HTML_HeadBackgroundColor,
      ColorToString(HeadersRowBgColor));
  end;
end;

procedure TTableOptions.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    CellPadding := ReadInteger(S_HTML, S_HTML_CellPadding, 4);
    CellSpacing := ReadInteger(S_HTML, S_HTML_CellSpacing, 1);
    Border := ReadInteger(S_HTML, S_HTML_BorderWidth, 1);
    BackgroundFileName := ReadString(S_HTML, S_HTML_TableBackground, EmptyStr);
    AdvancedAttributes.Text := ReadString(S_HTML,
      S_HTML_TableAdvanced, EmptyStr);
    OddRowBgColor := StringToColor(ReadString(S_HTML,
      S_HTML_OddRowBackgroundColor, ColorToString(RhtClassic.ROddRowBgColor)));
    HeadersRowFontColor := StringToColor(ReadString(S_HTML,
      S_HTML_HeadFontColor, ColorToString(RhtClassic.RHeadersRowFontColor)));
    TableFontColor := StringToColor(ReadString(S_HTML,
      S_HTML_DataFontColor, ColorToString(RhtClassic.RTableFontColor)));
    TableBgColor := StringToColor(ReadString(S_HTML,
      S_HTML_EvenRowBackgroundColor, ColorToString(RhtClassic.RTableBgColor)));
    HeadersRowBgColor := StringToColor(ReadString(S_HTML,
      S_HTML_HeadBackgroundColor, ColorToString(RhtClassic.RHeadersRowBgColor)));
  end;
end;

procedure TTableOptions.SetAdvancedAttributes(const Value: TStrings);
begin
  if Assigned(Value) then
    FAdvancedAttributes.Assign(Value);
end;

procedure TTableOptions.SetBorder(const Value: integer);
begin
  if FBorder <> Value then
    FBorder := Value;
end;

procedure TTableOptions.SetCellPadding(const Value: integer);
begin
  if FCellPadding <> Value then
    FCellPadding := Value;
end;

procedure TTableOptions.SetCellSpacing(const Value: integer);
begin
  if FCellSpacing <> Value then
    FCellSpacing := Value;
end;

procedure TTableOptions.SetHeadersRowBgColor(const Value: TColor);
begin
  if FHeadersRowBgColor <> Value then
    FHeadersRowBgColor := Value;
end;

procedure TTableOptions.SetHeadersRowFontColor(const Value: TColor);
begin
  if FHeadersRowFontColor <> Value then
    FHeadersRowFontColor := Value;
end;

procedure TTableOptions.SetOddRowBgColor(const Value: TColor);
begin
  if FOddRowBgColor <> Value then
    FOddRowBgColor := Value;
end;

procedure TTableOptions.SetTableBgColor(const Value: TColor);
begin
  if FTableBgColor <> Value then
    FTableBgColor := Value;
end;

procedure TTableOptions.SetTableFontColor(const Value: TColor);
begin
  if FTableFontColor <> Value then
    FTableFontColor := Value;
end;

{ THTMLOptions }

constructor THTMLOptions.Create;
begin
  inherited Create;
  FAdvancedAttributes := TStringList.Create;
  FTextFont := TFont.Create;
  FTextFont.Name := 'Arial';
  FDefaultOptions := [doFontSize];
end;

destructor THTMLOptions.Destroy;
begin
  FAdvancedAttributes.Free;
  FTextFont.Free;
  inherited Destroy;
end;

procedure THTMLOptions.Assign(Source: TPersistent);
begin
  if Source is THTMLOptions then begin
    BackgroundColor := (Source as THTMLOptions).BackgroundColor;
    BackgroundFileName := (Source as THTMLOptions).BackgroundFileName;
    LinkColor := (Source as THTMLOptions).LinkColor;
    VLinkColor := (Source as THTMLOptions).VLinkColor;
    ALinkColor := (Source as THTMLOptions).ALinkColor;
    TextFont := (Source as THTMLOptions).TextFont;
    AdvancedAttributes := (Source as THTMLOptions).AdvancedAttributes;
    Exit;
  end;
  inherited;
end;

procedure THTMLOptions.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteString(S_HTML, S_HTML_BackgroundColor, ColorToString(BackgroundColor));
    WriteString(S_HTML, S_HTML_BackgroundFile, BackgroundFileName);
    WriteString(S_HTML, S_HTML_VLinkColor, ColorToString(VLinkColor));
    WriteString(S_HTML, S_HTML_LinkColor, ColorToString(LinkColor));
    WriteString(S_HTML, S_HTML_ALinkColor, ColorToString(ALinkColor));

    WriteString(S_HTML, S_HTML_FontName, TextFont.Name);
    WriteString(S_HTML, S_HTML_FontColor, ColorToString(TextFont.Color));
    WriteString(S_HTML, S_HTML_BodyAdvanced, AdvancedAttributes.Text);
  end;
end;

procedure THTMLOptions.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    BackgroundColor := StringToColor(ReadString(S_HTML, S_HTML_BackgroundColor,
      ColorToString(RhtClassic.RBackgroundColor)));
    BackgroundFileName := ReadString(S_HTML, S_HTML_BackgroundFile, EmptyStr);
    VLinkColor := StringToColor(ReadString(S_HTML, S_HTML_VLinkColor,
      ColorToString(RhtClassic.RVLinkColor)));
    LinkColor := StringToColor(ReadString(S_HTML, S_HTML_LinkColor,
      ColorToString(RhtClassic.RLinkColor)));
    ALinkColor := StringToColor(ReadString(S_HTML, S_HTML_ALinkColor,
      ColorToString(RhtClassic.RALinkColor)));
    TextFont.Name := ReadString(S_HTML, S_HTML_FontName, 'arial');
    TextFont.Color := StringToColor(ReadString(S_HTML, S_HTML_FontColor,
      ColorToString(RhtClassic.RDefaultTextColor)));
  end;
end;

procedure THTMLOptions.SetAdvancedAttributes(const Value: TStrings);
begin
  if Assigned(Value) then
    FAdvancedAttributes.Assign(Value);
end;

procedure THTMLOptions.SetBackgroundFileName(const Value: string);
begin
  if FBackgroundFileName <> Value then FBackgroundFileName := Value;
end;

procedure THTMLOptions.SetTextFont(const Value: TFont);
begin
  if Assigned(Value) then
    FTextFont.Assign(Value);
end;

{ TQExport3HTML }

procedure TQExport3HTML.Abort;
begin
  inherited;

end;

procedure TQExport3HTML.AfterExport;
var
  i: integer;
begin
  if not IsEmpty then
    GetWriter.WriteLn('</Table>');
  for i := 0 to Footer.Count - 1 do GetWriter.WriteLn(Footer[i]);
  if (MaxRecords > 0) and (GetWriter.Stream is TFileStream) then
    THTMLPageOption(FPages[FCurrPass - 1]).BottomLocationLinkPos := FStr.Position;
  GetWriter.EndBODY;
  GetWriter.EndHTML;
  inherited;
end;

procedure TQExport3HTML.BeginExport;

  procedure CheckDefaultOptions(Indent: Integer);
  var
    S: string;
  begin
    SetLength(S, Indent);
    FillChar(S[1], Indent, ' ');
    if not (doFontName in FHTMLOptions.DefaultOptions) then
      SStyle.Add(S + 'font-family: ' + FHTMLOptions.FTextFont.Name + ';');
    if not (doFontSize in FHTMLOptions.DefaultOptions) then
      SStyle.Add(Format(S + SFontSize, [FHTMLOptions.FTextFont.Size]));
  end;

begin
  inherited;
  ClearPages;
  SStyle.Clear;
  with FHTMLOptions do begin
    SStyle.Add('  BODY { background: ' +
      IntToHexStr(D2HTMLColor(FBackgroundcolor)) + ';' +
      ' color: ' + IntToHexStr(D2HTMLColor(FTextFont.Color)) + ';');
    CheckDefaultOptions(9);
    if FBackgroundFileName <> '' then begin
      SStyle.Add(Format('background-image: url(%s)', [FBackgroundFileName]));
    end;
    SStyle.Add('  }');
    SStyle.Add('  A:link { color: ' +
      IntToHexStr(D2HTMLColor(FLinkColor)) + ' }');
    SStyle.Add('  A:visited { color: ' +
      IntToHexStr(D2HTMLColor(FVLinkColor)) + ' }');
    SStyle.Add('  A:active { color: ' +
      IntToHexStr(D2HTMLColor(FALinkColor)) + ' }');
  end;
  FUseBorderColor := FTableOptions.BorderColor <> clWhite;
  with FTableOptions do begin
    if AllowCaptions then begin
      SStyle.Add('  .ThRows { ');
      if not IsTableBGDefined then
        SStyle.Add(Format('            background-color: %s;',
          [IntToHexStr(D2HTMLColor(FHeadersRowBgColor))]));
      SStyle.Add(Format('            color: %s;',
        [IntToHexStr(D2HTMLColor(FHeadersRowFontColor))]));

      SStyle.Add('            font-weight: bold; text-align: center;');
      CheckDefaultOptions(12);
      SStyle.Add('  }');
    end;
    SStyle.Add('  .TrRows {');
    if not IsTableBGDefined then
      SStyle.Add(Format('            background-color: %s;',
        [IntToHexStr(D2HTMLColor(FTableBgColor))]));
    SStyle.Add(Format('            color: %s;',
      [IntToHexStr(D2HTMLColor(FTableFontColor))]));
    CheckDefaultOptions(12);
    SStyle.Add('  }');
    SStyle.Add('  .TrOdd  {');
    if not IsTableBGDefined then
      SStyle.Add(Format('            background-color: %s;',
        [IntToHexStr(D2HTMLColor(FOddRowBgColor))]));
    SStyle.Add(Format('            color: %s;',
      [IntToHexStr(D2HTMLColor(FTableFontColor))]));
    CheckDefaultOptions(12);
    SStyle.Add('  }');
    if FUseBorderColor then
      SStyle.Add('  .TrBC { background-color: ' +
        IntToHexStr(D2HTMLColor(BorderColor)) + ' }');
  end;
  FCurrPass := 0;
end;

procedure TQExport3HTML.BeforeExport;
begin
  inherited;
  if IsEmpty then
    WritePageHeader(FileName);
end;

constructor TQExport3HTML.Create(AOwner: TComponent);
begin
  inherited;
  FUsingCSS := usInternal;
  FHTMLOptions := THTMLOptions.Create;
  FTableOptions := TTableOptions.Create;
  FMaxRecords := 0;
  FGenerateIndex := false;
  FBoolAsCheckBox := false;
  Header.Add('<br>'); Footer.Add('<br>');
  HTMLTemplate := htClassic;
  SStyle := TStringList.Create;
  FNavigation := TQExportHTMLNavigation.Create;
  FPages := TList.Create;
  FOverwriteCSSFile := true;
  FInterpretTags := True;
end;

destructor TQExport3HTML.Destroy;
begin
  SStyle.Free;
  FTableOptions.Free;
  FHTMLOptions.Free;
  FNavigation.Free;

  ClearPages;
  FPages.Free;
  inherited;
end;


procedure TQExport3HTML.DoGenerateIndex;
var
  FS: TFileStream;
  WR: TQHTMLWriter;
  i: integer;
  sNumber, sName: string;
begin
  sName := FileName;
  FS := TFileStream.Create(sName, fmCreate);
  WR := TQHTMLWriter.Create(Self, FS);
  try
    with WR do begin
      StartHTML;
      StartHEAD;
      if FUsingCss = usInternal then begin
        StartSTYLE;
        for i := 0 to SStyle.Count - 1 do Writeln(SStyle[i]);
        EndSTYLE;
      end
      else WriteCSSLink(FCSSFileName);
      EndHEAD;
      StartBODY;
      StartUI;
      for i := 1 to FCurrPass do begin
        LI;
        if i < 10 then sNumber := '0' + IntToStr(i)
        else sNumber := IntToStr(i);

        sName := ExtractFileName(FileName);
        if Navigation.IndexLinkTemplate = EmptyStr then
          Writeln(Format('<a href="%s">%s</a>',
                  [ExtractFName(sName) + sNumber + ExtractFileExt(sName),
                   ExtractFName(sName) + sNumber + ExtractFileExt(sName)]))
        else
          Writeln(Format('<a href="%s">%s</a>',
                  [ExtractFName(sName) + sNumber + ExtractFileExt(sName),
                   Navigation.IndexLinkTemplate + sNumber]));

      end;
      EndUI;
      EndBODY;
      EndHTML;
    end;
  finally
    WR.Free;
    FS.Free;
  end;
end;

procedure TQExport3HTML.EndExport;
var
  i: integer;
  FS: TFileStream;
  MS: TMemoryStream;
  sFileName: string;
  Strings: TStringList;
begin
  if FMaxRecords > 0 then begin
    if FGenerateIndex and (GetWriter.Stream is TFileStream) then
      DoGenerateIndex;
    if (FNavigation.OnTop or FNavigation.OnBottom) and (FCurrPass > 1) then begin

      FStr.Free;
      FStr := nil;

      MS := TMemoryStream.Create;
      try
        Strings := TStringList.Create;
        try
          for i := 1 to FCurrPass do begin

            sFileName := AddNumberToFileName(FileName, i, 2);

            FS := TFileStream.Create(sFileName,
              fmOpenReadWrite or fmShareExclusive);
            GetWriter.Stream := FS;
            try
              if FNavigation.OnTop then begin
                MS.Size := 0;
                FS.Seek(THTMLPageOption(FPages[i - 1]).TopLocationLinkPos, soFromBeginning);
                MS.CopyFrom(FS, FS.Size - FS.Position);
                FS.Seek(THTMLPageOption(FPages[i - 1]).TopLocationLinkPos, soFromBeginning);
                GetWriter.WriteLocationLinks(FNavigation.IndexLinkTitle,
                  FNavigation.FirstLinkTitle, FNavigation.PriorLinkTitle,
                  FNavigation.NextLinkTitle, FNavigation.LastLinkTitle,
                  FileName,  FCurrPass, i, true, GenerateIndex, Strings);
                Strings.SaveToStream(FS);
                FS.CopyFrom(MS, 0);

                if FNavigation.OnBottom then
                  THTMLPageOption(FPages[i - 1]).BottomLocationLinkPos :=
                    THTMLPageOption(FPages[i - 1]).BottomLocationLinkPos +
                    Length(Strings.Text);
              end;

              if FNavigation.OnBottom then begin
                MS.Size := 0;
                FS.Seek(THTMLPageOption(FPages[i - 1]).BottomLocationLinkPos, soFromBeginning);
                MS.CopyFrom(FS, FS.Size - FS.Position);
                FS.Seek(THTMLPageOption(FPages[i - 1]).BottomLocationLinkPos, soFromBeginning);
                GetWriter.WriteLocationLinks(FNavigation.IndexLinkTitle,
                  FNavigation.FirstLinkTitle, FNavigation.PriorLinkTitle,
                  FNavigation.NextLinkTitle, FNavigation.LastLinkTitle,
                  FileName,  FCurrPass, i, false, GenerateIndex, Strings);
                Strings.SaveToStream(FS);
                FS.CopyFrom(MS, 0);
              end;
            finally
              FS.Free;
            end;
          end;
        finally
          Strings.Free;
        end;
      finally
        MS.Free;
      end;
    end;
  end;
  inherited;
end;

procedure TQExport3HTML.Execute;
begin
  FStr := TFileStream.Create(FileName, fmCreate);
  try
    ExportToStream(FStr);
  finally
    FStr.Free;
  end;
  ShowResult;
end;

function TQExport3HTML.GetColData(ExportCol: TQExportCol): string;
var
  AlignStr,
  InlineStyleStr: string;
  CurrAlign: TQExportColAlign;
  fInlineStyle: boolean;
  CurrBackground: TColor;
  CurrFont: TFont;
  Index: integer;
//  GCD: TQExportGetColData;

  procedure CheckInlineStyle;
  begin
    InlineStyleStr := InlineStyleStr + ' ';
    fInlineStyle := true;
  end;

begin
  Result := inherited GetColData(ExportCol);
  Index := ExportCol.ColumnIndex;

{  GCD := ExportRow.GetColData;
  try
    ExportRow.GetColData := nil;
    Result := ExportRow[Index].GetExportedValue(true);
  finally
    ExportRow.GetColData := GCD;
  end;}

  AlignStr := '';
  CurrAlign := Columns[Index].ColAlign;
  InlineStyleStr := '';
  fInlineStyle := false;
//  if not ((Columns[Index].ColType = ectBoolean) or FBoolAsCheckBox) then
//    Result := NormalString(Result);
  if Result = '' then Result := '&nbsp';
  if Odd(RecordCounter) then CurrBackground := TableOptions.TableBgColor
  else CurrBackground := TableOptions.OddRowBgColor;
  CurrFont := TFont.Create;
  try
    CurrFont.Assign(FHTMLOptions.TextFont);
    GetCellParams(RecordCounter, Index, Result, CurrAlign, CurrFont, CurrBackground);
    AlignStr := ' ' + Format(SAlign, [GetWriter.AlignToStr(CurrAlign)]);
    // Background color
    if Odd(RecordCounter) then begin
      if CurrBackground <> TableOptions.TableBgColor then begin
        InlineStyleStr := Format('background-color: %s;',
          [IntToHexStr(D2HTMLColor(CurrBackground))]);
        CheckInlineStyle;
      end;
    end
    else begin
      if CurrBackground <> TableOptions.OddRowBgColor then begin
        InlineStyleStr := Format(SBackgroundColor,
          [IntToHexStr(D2HTMLColor(CurrBackground))]);
        CheckInlineStyle;
      end;
    end;
    // Font.Name
    if CompareText(CurrFont.Name, FHTMLOptions.TextFont.Name) <> 0 then begin
      InlineStyleStr := InlineStyleStr + Format(SFontFamily,
        [CurrFont.Name]);
      CheckInlineStyle;
    end;
    // Font.Size
    if (CurrFont.Size <> FHTMLOptions.TextFont.Size) then begin
      InlineStyleStr := InlineStyleStr + Format(SFontSize,
        [CurrFont.Size]);
      CheckInlineStyle;
    end;
    // Font.Color
    if CurrFont.Color <> FHTMLOptions.TextFont.Color then begin
      InlineStyleStr := InlineStyleStr + Format(SColor,
        [IntToHexStr(D2HTMLColor(CurrFont.Color))]);
      CheckInlineStyle;
    end;
    // Bold
    if (fsBold in CurrFont.Style) and
      (not (fsBold in FHTMLOptions.TextFont.Style)) then begin
      InlineStyleStr := InlineStyleStr + Format(SFontWeight, [SBold]);
      CheckInlineStyle;
    end;
    if (not (fsBold in CurrFont.Style)) and
      (fsBold in FHTMLOptions.TextFont.Style) then begin
      InlineStyleStr := InlineStyleStr + Format(SFontWeight, [SNormal]);
      CheckInlineStyle;
    end;
    // Italic
    if (fsItalic in CurrFont.Style) and
      (not (fsItalic in FHTMLOptions.TextFont.Style)) then begin
      InlineStyleStr := InlineStyleStr + Format(SFontStyle, [SItalic]);
      CheckInlineStyle;
    end;
    if (not (fsItalic in CurrFont.Style)) and
      (fsItalic in FHTMLOptions.TextFont.Style) then begin
      InlineStyleStr := InlineStyleStr + Format(SFontStyle, [SNormal]);
      CheckInlineStyle;
    end;
    // Underline
    if (fsUnderline in CurrFont.Style) and
      (not (fsUnderline in FHTMLOptions.TextFont.Style)) then begin
      InlineStyleStr := InlineStyleStr + Format(STextDecoration, [SUnderline]);
      CheckInlineStyle;
    end;
    if (not (fsUnderline in CurrFont.Style)) and
      (fsUnderline in FHTMLOptions.TextFont.Style) then begin
      InlineStyleStr := InlineStyleStr + Format(STextDecoration, [SNone]);
      CheckInlineStyle;
    end;
    if fInlineStyle then begin
      Delete(InlineStyleStr, Length(InlineStyleStr) - 1, 2);
      InlineStyleStr := ' style="' + InlineStyleStr + '"';
    end;

    Result := AlignStr + InlineStyleStr + '>' + Result;
  finally
    CurrFont.Free;
  end;
end;

function TQExport3HTML.GetSpecialCharacters: TSpecialCharacters;
begin
  Result := ['<', '>', '&', '"'];
end;

function TQExport3HTML.GetWriter: TQHTMLWriter;
begin
  Result := TQHTMLWriter(inherited GetWriter);
end;

function TQExport3HTML.GetWriterClass: TQExportWriterClass;
begin
  Result := TQHTMLWriter;
end;

procedure TQExport3HTML.LoadTemplateFromFile(const FileName: string);
var
  TemplateFile: TIniFile;
begin
  TemplateFile := TIniFile.Create(FileName);
  try
    with TemplateFile, FHTMLOptions, FTableOptions do begin
      // Body options
      BackgroundColor := ReadInteger('HTML options', 'Background-color', BackgroundColor);
      TextFont.Color := ReadInteger('HTML options', 'Font-color', TextFont.Color);
      TextFont.Name := ReadString('HTML options', 'Font-family', TextFont.Name);
      LinkColor := ReadInteger('HTML options', 'LinkColor', LinkColor);
      VLinkColor := ReadInteger('HTML options', 'VLinkColor', VLinkColor);
      ALinkColor := ReadInteger('HTML options', 'ALinkColor', ALinkColor);
      // Table options
      HeadersRowBgColor := ReadInteger('Table options', 'Header-bgcolor', HeadersRowBgColor);
      HeadersRowFontColor := ReadInteger('Table options', 'Header-color', HeadersRowFontColor);
      TableFontColor := ReadInteger('Table options', 'Table-color', TableFontColor);
      TableBgColor := ReadInteger('Table options', 'Even_row-bgcolor', TableBgColor);
      OddRowBgColor := ReadInteger('Table options', 'Odd_row-bgcolor', OddRowBgColor);
      BorderColor := ReadInteger('Table options', 'Border-color', BorderColor);
    end;
  finally
    TemplateFile.Free;
  end;
end;

function TQExport3HTML.NormalString(const S: string): string;
var
  i: integer;
  bNewLine: boolean;
begin
  Result := '';
  bNewLine := false;
  for i := 1 to Length(S) do
  begin
    if S[i] in GetSpecialCharacters then
    begin
      if FInterpretTags then
        case S[i] of
          '<': Result := Result + '&lt;';
          '>': Result := Result + '&gt;';
          '"': Result := Result + '&quot;';
          '&': Result := Result + '&amp;';
        end
      else
        case S[i] of
          '<': Result := Result + '<';
          '>': Result := Result + '>';
          '"': Result := Result + '"';
          '&': Result := Result + '&';
        end;
    end
    // CR & LF
    else if S[i] in [#13, #10] then
    begin
      if not bNewLine then
      begin
        Result := Result + '<br>';
        bNewLine := true;
      end
      else
        bNewLine := false;
    end
    else
      Result := Result + S[i];
  end;
end;

procedure TQExport3HTML.SaveTemplateToFile(const FileName: string);
var
  TemplateFile: TIniFile;
begin
  TemplateFile := TIniFile.Create(FileName);
  try
    with TemplateFile, FHTMLOptions, FTableOptions do begin
      // Body options
      WriteInteger('HTML options', 'Background-color', BackgroundColor);
      WriteInteger('HTML options', 'Font-color', TextFont.Color);
      WriteString('HTML options', 'Font-family', TextFont.Name);
      WriteInteger('HTML options', 'LinkColor', LinkColor);
      WriteInteger('HTML options', 'VLinkColor', VLinkColor);
      WriteInteger('HTML options', 'ALinkColor', ALinkColor);
      // Table options
      WriteInteger('Table options', 'Header-bgcolor', HeadersRowBgColor);
      WriteInteger('Table options', 'Header-color', HeadersRowFontColor);
      WriteInteger('Table options', 'Table-color', TableFontColor);
      WriteInteger('Table options', 'Even_row-bgcolor', TableBgColor);
      WriteInteger('Table options', 'Odd_row-bgcolor', OddRowBgColor);
      WriteInteger('Table options', 'Border-color', BorderColor);
    end;
  finally
    TemplateFile.Free;
  end;
end;

procedure TQExport3HTML.SetHTMLOptions(const Value: THTMLOptions);
begin
  if Assigned(Value) then FHTMLOptions.Assign(Value);
end;

procedure TQExport3HTML.SetHTMLTemplate(const Value: THTMLTemplate);

  procedure SetTemplate(const Template: RHTMLTemplate);
  begin
    with FHTMLOptions, FTableOptions, Template do begin
      FBackgroundColor := RBackgroundColor;
      FLinkColor := RLinkColor;
      FVLinkColor := RVLinkColor;
      FALinkColor := RALinkColor;
      FTextFont.Color := RDefaultTextColor;
      FTextFont.Name := RTextFontName;
      FHeadersRowBgColor := RHeadersRowBgColor;
      FHeadersRowFontColor := RHeadersRowFontColor;
      FTableBgColor := RTableBgColor;
      FTableFontColor := RTableFontColor;
      FOddRowBgColor := ROddRowBgColor;
    end;
  end;

begin
  if FHTMLTemplate <> Value then begin
    FHTMLTemplate := Value;
    case Value of
      htBW: SetTemplate(RhtBW);
      htClassic: SetTemplate(RhtClassic);
      htColorFul: SetTemplate(RhtColorFul);
      htGray: SetTemplate(RhtGray);
      htMS_Money: SetTemplate(RhtMS_Money);
      htMurky: SetTemplate(RhtMurky);
      htOlive: SetTemplate(RhtOlive);
      htPlain: SetTemplate(RhtPlain);
      htSimple: SetTemplate(RhtSimple);
    end;
  end;
end;

procedure TQExport3HTML.SetMaxRecords(const Value: integer);
begin
  if FMaxRecords <> Value then begin
    if Value < 0 then FMaxRecords := 0
    else FMaxRecords := Value;
  end;
end;

procedure TQExport3HTML.SetTableOptions(const Value: TTableOptions);
begin
  if Assigned(Value) then FTableOptions.Assign(Value);
end;

procedure TQExport3HTML.SetNavigation(const Value: TQExportHTMLNavigation);
begin
  if Assigned(Value) then FNavigation.Assign(Value);
end;

procedure TQExport3HTML.WriteCaptionRow;
begin
//
end;

procedure TQExport3HTML.WriteDataRow;
var
  i: integer;
  sName: string;
//  FCSS: TextFile;
  PgOpt: THTMLPageOption;
begin
  if (RecordCounter = 0) or
      ((MaxRecords > 0) and ((RecordCounter) mod MaxRecords = 0) and
     (GetWriter.Stream is TFileStream)) then begin
    sName := FileName;

    if (MaxRecords > 0) and (GetWriter.Stream is TFileStream) then begin

      if FCurrpass > 0 then begin
        GetWriter.WriteLn('</Table>');
        for i := 0 to Footer.Count - 1 do GetWriter.WriteLn(Footer[i]);
        THTMLPageOption(FPages[FCurrPass - 1]).BottomLocationLinkPos := FStr.Position;
        GetWriter.EndBODY;
        GetWriter.EndHTML;
      end;

      inc(FCurrPass);

      sName := AddNumberToFileName(sName, FCurrPass, 2);

      FStr.Free;

      FStr := TFileStream.Create(sName, fmCreate);
      GetWriter.Stream := FStr;
      PgOpt := THTMLPageOption.Create;
      FPages.Add(PgOpt);
    end;

    WritePageHeader(sName);
{    GetWriter.StartHTML;
    GetWriter.StartHEAD;
    GetWriter.WriteTITLE(Title);
    if FUsingCss = usInternal then begin
      GetWriter.StartSTYLE;
      for i := 0 to SStyle.Count - 1 do GetWriter.WriteLn(SStyle[i]);
      GetWriter.EndSTYLE;
    end
    else begin
      if (GetWriter.Stream is TFileStream) then begin
        if FCSSFileName = EmptyStr then  FCSSFileName := ChangeFileExt(sName, '.css');
        GetWriter.WriteCSSLink(FCSSFileName);
        if (not FileExists(FCSSFileName)) or FOverwriteCSSFile then begin
          AssignFile(FCSS, FCSSFileName);
          Rewrite(FCSS);
          try
            for i := 0 to SStyle.Count - 1 do WriteLn(FCSS, SStyle[i]);
          finally
            CloseFile(FCSS);
          end;
        end;
      end;
    end;
    GetWriter.EndHEAD;
    GetWriter.StartBODY;

    if (MaxRecords > 0) and (GetWriter.Stream is TFileStream) then
      THTMLPageOption(FPages[FCurrPass - 1]).TopLocationLinkPos :=
        GetWriter.Stream.Position;

    for i := 0 to Header.Count - 1 do GetWriter.WriteLn(Header[i]);}
    if FUseBorderColor then begin
      GetWriter.WriteLn('<Table cellspacing=0 cellpadding=0 class="TrBC">');
      GetWriter.WriteLn('<tr><td>');
    end;
    with FTableOptions do
      GetWriter.WriteTABLE(Border, CellPadding, CellSpacing, BackgroundFileName);
    if AllowCaptions then begin
      GetWriter.WriteLn('  <tr>');
      for i := 0 to Columns.Count - 1 do
        GetWriter.WriteCaptionRowTD(GetColCaption(i));
      GetWriter.WriteLn('  </tr>');
    end;
  end;

  GetWriter.WriteLn('  <tr>');

  ///++++++++++++++++++++++

  for i := 0 to ExportRow.Count - 1 do begin
    if MaxRecords > 0 then begin
      if Odd((RecordCounter + 1) mod MaxRecords) or
         (Odd(MaxRecords) and ((RecordCounter + 1) mod MaxRecords = 0))
        then GetWriter.WriteOddRowTD(ExportRow[i].GetExportedValue(true))
        else GetWriter.WriteEvenRowTD(ExportRow[i].GetExportedValue(true))
    end
    else begin
      if Odd(RecordCounter + 1)
        then GetWriter.WriteOddRowTD(ExportRow[i].GetExportedValue(true))
        else GetWriter.WriteEvenRowTD(ExportRow[i].GetExportedValue(true))
    end;
  end;
  GetWriter.WriteLn('  </tr>');
end;

function TQExport3HTML.GetShowedFileName: string;
var
  sFirst: string;
begin
  Result := inherited GetShowedFileName;
  sFirst := AddNumberToFileName(Result, 1, 2);
  if (MaxRecords > 0) and (not GenerateIndex) and FileExists(sFirst) then
    Result := sFirst;
end;

function TQExport3HTML.GetPrintedFileName: string;
var
  sFirst: string;
begin
  Result := inherited GetShowedFileName;
  sFirst := AddNumberToFileName(Result, 1, 2);
  if (MaxRecords > 0) and (not GenerateIndex) and FileExists(sFirst) then
    Result := sFirst;
end;

procedure TQExport3HTML.ClearPages;
var
  i: integer;
begin
  for i := FPages.Count - 1 downto 0 do begin
    THTMLPageOption(FPages[i]).Free;
    FPages.Delete(i);
  end;
end;

function TQExport3HTML.IsTableBGDefined: boolean;
begin
  Result := FileExists(TableOptions.BackgroundFileName);
end;

procedure TQExport3HTML.WritePageHeader(const CurrFileName: string);
var
  i: integer;
  FCSS: TextFile;
begin
  GetWriter.StartHTML;
  GetWriter.StartHEAD;
  GetWriter.WriteTITLE(Title);
  if FUsingCss = usInternal then begin
    GetWriter.StartSTYLE;
    for i := 0 to SStyle.Count - 1 do GetWriter.WriteLn(SStyle[i]);
    GetWriter.EndSTYLE;
  end
  else begin
    if (GetWriter.Stream is TFileStream) then begin
      if FCSSFileName = EmptyStr then  FCSSFileName :=
        ChangeFileExt(CurrFileName, '.css');
      GetWriter.WriteCSSLink(FCSSFileName);
      if (not FileExists(FCSSFileName)) or FOverwriteCSSFile then begin
        AssignFile(FCSS, FCSSFileName);
        Rewrite(FCSS);
        try
          for i := 0 to SStyle.Count - 1 do WriteLn(FCSS, SStyle[i]);
        finally
          CloseFile(FCSS);
        end;
      end;
    end;
  end;
  GetWriter.EndHEAD;
  GetWriter.StartBODY;

  if (MaxRecords > 0) and (GetWriter.Stream is TFileStream) then
    THTMLPageOption(FPages[FCurrPass - 1]).TopLocationLinkPos :=
      GetWriter.Stream.Position;

  for i := 0 to Header.Count - 1 do GetWriter.WriteLn(Header[i]);
end;

{ TQExportHTMLNavigation }

procedure TQExportHTMLNavigation.Assign(SOurce: TPersistent);
begin
  if Source is TQExportHTMLNavigation then begin
    IndexLinkTemplate := (Source as TQExportHTMLNavigation).IndexLinkTemplate;
    OnTop := (Source as TQExportHTMLNavigation).OnTop;
    OnBottom := (Source as TQExportHTMLNavigation).OnBottom;
    IndexLinkTitle := (Source as TQExportHTMLNavigation).IndexLinkTitle;
    FirstLinkTitle := (Source as TQExportHTMLNavigation).FirstLinkTitle;
    PriorLinkTitle := (Source as TQExportHTMLNavigation).PriorLinkTitle;
    NextLinkTitle := (Source as TQExportHTMLNavigation).NextLinkTitle;
    LastLinkTitle := (Source as TQExportHTMLNavigation).LastLinkTitle;
    Exit;
  end;
  inherited;
end;

constructor TQExportHTMLNavigation.Create;
begin
  inherited;
  FIndexLinkTemplate := EmptyStr;
  FOnTop := true;
  FOnBottom := true;
  FIndexLinkTitle := 'Index';
  FFirstLinkTitle := 'First';
  FPriorLinkTitle := 'Prior';
  FNextLinkTitle := 'Next';
  FLastLinkTitle := 'Last';
end;

end.
