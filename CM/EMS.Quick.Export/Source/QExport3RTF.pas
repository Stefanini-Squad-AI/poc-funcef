unit QExport3RTF;

{$I VerCtrl.inc}

interface

uses
  QExport3, Classes, QExport3RTFList, IniFiles
  {$IFDEF WIN32}
    {$IFNDEF NOGUI}, Graphics{$ELSE}, QExport3Graphics{$ENDIF}
  {$ENDIF}
  {$IFDEF LINUX}
    {$IFNDEF NOGUI}, QGraphics{$ELSE}, QExport3Graphics{$ENDIF}
  {$ENDIF};

type
  TrtfStripType = (stNone, stCol, stRow);
  TrtfTextAlignment = (talLeft, talRight, talCenter, talFill);

  TrtfStyle = class(TCollectionItem)
  private
    FFont: TFont;
    FBackgroundColor: TColor;
    FHighlightColor: TColor;
    FAllowHighlight: boolean;
    FAllowBackground: boolean;
    FAlignment: TrtfTextAlignment;
    procedure SetFont(const Value: TFont);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SetDefault; virtual;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string); virtual;
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string); virtual;
  published
    property Font: TFont read FFont write SetFont;
    property BackgroundColor: TColor read FBackgroundColor
      write FBackgroundColor default clWhite;
    property HighlightColor: TColor read FHighlightColor
      write FHighlightColor default clWhite;
    property AllowHighlight: boolean read FAllowHighlight
      write FAllowHighLight default false;
    property AllowBackground: boolean read FAllowBackground
      write FAllowBackground default true;
    property Alignment: TrtfTextAlignment read FAlignment
      write FAlignment default talLeft;
  end;

  TrtfStyles = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TrtfStyle;
    procedure SetItem(Index: integer; Value: TrtfStyle);
  public
    constructor Create(Holder: TPersistent);
    function Add: TrtfStyle;
    procedure SaveToIniFile(IniFile: TIniFile; const SectionPrefix: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const SectionPrefix: string); 

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TrtfStyle read GetItem
      write SetItem; default;
  end;

  TRTFOptions = class(TPersistent)
  private
    FHolder: TPersistent;
//    FDefaultCaptionAlign: TQExportColAlign;
    FCaptionAligns: TStrings;
    FCaptionStyle: TrtfStyle;
    FDataStyle: TrtfStyle;
    FPageOrientation: TQExportPageOrientation;
    FStripStyles: TrtfStyles;
    FStripType: TrtfStripType;
    FHeaderStyle: TrtfStyle;
    FFooterStyle: TrtfStyle;
    procedure SetCaptionAligns(const Value: TStrings);
    procedure SetCaptionStyle(const Value: TrtfStyle);
    procedure SetDataStyle(const Value: TrtfStyle);
    procedure SetStripStyles(const Value: TrtfStyles);
    procedure SetHeaderStyle(const Value: TrtfStyle);
    procedure SetFooterStyle(const Value: TrtfStyle);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(Holder: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
//    property DefaultCaptionAlign: TQExportColAlign
//      read FDefaultCaptionAlign write FDefaultCaptionAlign
//      default ecaCenter;
    property CaptionAligns: TStrings read FCaptionAligns
      write SetCaptionAligns;
    property CaptionStyle: TrtfStyle read FCaptionStyle
      write SetCaptionStyle;
    property DataStyle: TrtfStyle read FDataStyle
      write SetDataStyle;
    property PageOrientation: TQExportPageOrientation
      read FPageOrientation write FPageOrientation
      default poPortrait;
    property StripStyles: TrtfStyles read FStripStyles
      write SetStripStyles;
    property StripType: TrtfStripType read FStripType
      write FStripType default stNone;
    property HeaderStyle: TrtfStyle read FHeaderStyle
      write SetHeaderStyle;
    property FooterStyle: TrtfStyle read FFooterStyle
      write SetFooterStyle;
  end;

  TrtfGetStyleEvent = procedure(Sender: TObject;
    Style: TrtfStyle) of object;
  TrtfGetCaptionStyleEvent = procedure(Sender: TObject; ColNo: integer;
    Style: TrtfStyle) of object;
  TrtfGetDataStyleEvent = procedure(Sender: TObject; Row, Col: integer;
    Style: TrtfStyle) of object;

  TQExport3RTF = class(TQExport3FormatText)
  private
    FOptions: TRTFOptions;
    FOnGetHeaderStyle: TrtfGetStyleEvent;
    FOnGetCaptionStyle: TrtfGetCaptionStyleEvent;
    FOnGetDataStyle: TrtfGetDataStyleEvent;
    FOnGetFooterStyle: TrtfGetStyleEvent;
    procedure SetOptions(const Value: TRTFOptions);
    procedure StyleToStrs(Style: TrtfStyle; var AlignStr, FontStr, ColorStr,
      AttrStr, BackgroundStr, HighlightStr: string);
  protected
    procedure BeginExport; override;
    procedure BeforeExport; override;
    function GetColCaption(Index: integer): string; override;
    procedure WriteCaptionRow; override;
    function GetColData(ExportCol: TQExportCol): string; override;
    procedure WriteDataRow; override;
    procedure EndExport; override;

    function GetWriter: TQRTFWriter;
    function GetWriterClass: TQExportWriterClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Abort; override;
    function NormalString(const S: string): string; override;
  published
    property Options: TRTFOptions read FOptions write SetOptions;

    property ColumnsWidth;
    property ColumnsAlign;

    property OnGetHeaderStyle: TrtfGetStyleEvent
      read FOnGetHeaderStyle write FOnGetHeaderStyle;
    property OnGetCaptionStyle: TrtfGetCaptionStyleEvent
      read FOnGetCaptionStyle write FOnGetCaptionStyle;
    property OnGetDataStyle: TrtfGetDataStyleEvent
      read FOnGetDataStyle write FOnGetDataStyle;
    property OnGetFooterStyle: TrtfGetStyleEvent
      read FOnGetFooterStyle write FOnGetFooterStyle;
  end;

implementation

uses SysUtils, QExport3Common
     {$IFDEF WIN32}
     , Windows
     {$ENDIF}
     {$IFDEF LINUX}
       {$IFNDEF NOGUI}, QForms {$ENDIF}
     {$ENDIF};

{ TRTFOptions }

constructor TRTFOptions.Create(Holder: TPersistent);
begin
  inherited Create;
  FHolder := Holder;
//  FDefaultCaptionAlign := ecaCenter;
  FCaptionAligns := TStringList.Create;
  FDataStyle := TrtfStyle.Create(nil);
  FDataStyle.Font.Name := 'Arial';
  FDataStyle.Font.Size := 10;
  FCaptionStyle := TrtfStyle.Create(nil);
  FCaptionStyle.Assign(FDataStyle);
  FCaptionStyle.Font.Style := FCaptionStyle.Font.Style + [fsBold];
  FCaptionStyle.Alignment := talCenter;
  FPageOrientation := poPortrait;
  FStripStyles := TrtfStyles.Create(Self);
  FStripType := stNone;
  FHeaderStyle := TrtfStyle.Create(nil);
  FFooterStyle := TrtfStyle.Create(nil);
end;

destructor TRTFOptions.Destroy;
begin
  FFooterStyle.Free;
  FHeaderStyle.Free;
  FStripStyles.Free;
  FCaptionStyle.Free;
  FDataStyle.Free;
  FCaptionAligns.Free;
  inherited;
end;

procedure TRTFOptions.Assign(Source: TPersistent);
begin
  if Source is TRTFOptions then begin
//    DefaultCaptionAlign := (Source as TRTFOptions).DefaultCaptionAlign;
    CaptionAligns := (Source as TRTFOptions).CaptionAligns;
    CaptionStyle := (Source as TRTFOptions).CaptionStyle;
    DataStyle := (Source as TRTFOptions).DataStyle;
    PageOrientation := (Source as TRTFOptions).PageOrientation;
    StripStyles := (Source as TRTFOptions).StripStyles;
    StripType := (Source as TRTFOptions).StripType;
    HeaderStyle := (Source as TRTFOptions).HeaderStyle;
    FooterStyle := (Source as TRTFOptions).FooterStyle;
    Exit;
  end;
  inherited;
end;

function TRTFOptions.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

procedure TRTFOptions.SetCaptionAligns(const Value: TStrings);
begin
  FCaptionAligns.Assign(Value);
end;

procedure TRTFOptions.SetCaptionStyle(const Value: TrtfStyle);
begin
  FCaptionStyle.Assign(Value);
end;

procedure TRTFOptions.SetDataStyle(const Value: TrtfStyle);
begin
  FDataStyle.Assign(Value);
end;

procedure TRTFOptions.SetStripStyles(const Value: TrtfStyles);
begin
  FStripStyles.Assign(Value);
end;

procedure TRTFOptions.SetHeaderStyle(const Value: TrtfStyle);
begin
  FHeaderStyle.Assign(Value);
end;

procedure TRTFOptions.SetFooterStyle(const Value: TrtfStyle);
begin
  FFooterStyle.Assign(Value);
end;

{ TQExport3RTF }

constructor TQExport3RTF.Create(AOwner: TComponent);
begin
  inherited;
  FOptions := TRTFOptions.Create(Self);
end;

destructor TQExport3RTF.Destroy;
begin
  FOptions.Free;
  inherited;
end;

procedure TQExport3RTF.Abort;
var
  i: integer;
begin
  with GetWriter do begin
    WriteLn('\pard');
    WritePara;
    for i := 0 to Footer.Count - 1 do begin
      WritePara;
      WriteLn(Footer[i]);
    end;
  end;
  inherited;
end;

procedure TQExport3RTF.BeginExport;
var
  fti: TRTFFontTableItem;
  cti: TRTFColorTableItem;
  AlignStr, FontStr, ColorStr, AttrStr,
  BackgroundStr, HighlightStr, FormatStr: string;
  N, CurRM, i: integer;
  Style: TrtfStyle;
begin
  inherited;
  with GetWriter do begin
    WriteBOF;
    WriteHeader;
    fti := TRTFFontTableItem.Create(0, 'nil', FOptions.CaptionStyle.Font.Name);
    AddFont(fti);
    fti := TRTFFontTableItem.Create(1, 'nil', FOptions.DataStyle.Font.Name);
    AddFont(fti);
    WriteFontTable;
    cti := TRTFColorTableItem.Create(clBlack);
    AddColor(cti);
    WriteColorTable;

    SetFont(FOptions.DataStyle.Font, true, FontStr);

    if Options.PageOrientation = poLandscape then begin
      WriteLn('\landscape');
      WriteLn('\paperw16838');
      WriteLn('\paperh11906');
    end
    else begin
      WriteLn('\paperw11906');
      WriteLn('\paperh16838');
    end;

    Style := TrtfStyle.Create(nil);
    try
      Style.Assign(FOptions.HeaderStyle);
      if Assigned(FOnGetHeaderStyle) then FOnGetHeaderStyle(Self, Style);

      StyleToStrs(Style, AlignStr, FontStr, ColorStr, AttrStr,
        BackgroundStr, HighlightStr);
    finally
      Style.Free;
    end;
    
    if BackgroundStr <> EmptyStr then
      BackgroundStr := BackgroundStr + ' ';

    if Self.Header.Count > 0 then begin
      WriteLn('{' + AlignStr + BackgroundStr);
      try
        for i := 0 to Self.Header.Count - 1 do begin
          FormatStr := FontStr + ColorStr + AttrStr;
          if FormatStr <> EmptyStr then
            FormatStr := FormatStr + ' ';
          WriteLn('{' + HighlightStr + FormatStr + Self.Header[i] + '}');
          WritePara;
        end;
      finally
        WriteLn('}');
      end;
    end;
    
    WritePara;
    WriteLn('\trowd\trql\trgaph0\trleft36');
    CurRM := 36;
    {$IFDEF WIN32}
     {$IFNDEF NOGUI}
     N := GetDisplayTextWidth('X', Options.CaptionStyle.Font);
     {$ELSE}
     N := XL;
     {$ENDIF}
    {$ELSE}
    N := XL;
    {$ENDIF}
    for i := 0 to  Columns.Count - 1 do
    begin
      CurRM := CurRM + Columns[i].Width * N * 15 + 10;
      WriteLn('\clbrdrl\brdrth \clbrdrr\brdrth \clbrdrt\brdrth \clbrdrb\brdrth');
      WriteLn('\cellx' + IntToStr(CurRM));
    end;
  end;
end;

procedure TQExport3RTF.BeforeExport;
var
  FontStr: string;
begin
  GetWriter.SetFont(FOptions.DataStyle.Font, true, FontStr);
end;

function TQExport3RTF.GetColCaption(Index: integer): string;
var
  AlignStr, FontStr, ColorStr, AttrStr,
  BackgroundStr, HighlightStr, FormatStr: string;
  i: integer;
  Style: TrtfStyle;
  ColAlign: TQExportColAlign;
begin
  Result := inherited GetColCaption(Index);

  case FOptions.CaptionStyle.Alignment of
    talCenter: ColAlign := ecaCenter;
    talRight: ColAlign := ecaRight;
    else ColAlign := ecaLeft;
  end;
  if FOptions.CaptionAligns.Count > 0 then begin
    i := FOptions.CaptionAligns.IndexOfName(Columns[Index].Name);
    if (i > -1) and
       (Length(FOptions.CaptionAligns.Values[Columns[Index].Name]) > 0) then begin
      case AnsiUpperCase(FOptions.CaptionAligns.Values[Columns[Index].Name])[1] of
        'C': ColAlign := ecaCenter;
        'R': ColAlign := ecaRight;
        else ColAlign := ecaLeft;
      end;
    end;
  end;

  Style := TrtfStyle.Create(nil);
  try
    Style.Assign(FOptions.CaptionStyle);
    if Assigned(FOnGetCaptionStyle) then
      FOnGetCaptionStyle(Self, Index, Style);

    StyleToStrs(Style, AlignStr, FontStr, ColorStr, AttrStr,
      BackgroundStr, HighlightStr);
  finally
    Style.Free;
  end;

  AlignStr := GetWriter.AlignToStr(ColAlign);

  FormatStr := FontStr + ColorStr + AttrStr;
  if FormatStr <> EmptyStr then FormatStr := FormatStr + ' ';

  Result := '\pard\intbl\li30\ri30' + BackgroundStr + 
    AlignStr + '{' + HighlightStr + FormatStr + Result + '}\cell';
end;

procedure TQExport3RTF.WriteCaptionRow;
var
  FontStr: string;
begin
  GetWriter.SetFont(FOptions.CaptionStyle.Font, true, FontStr);
  GetWriter.WriteLn(GetCaptionRow + '\row');
end;

function TQExport3RTF.GetColData(ExportCol: TQExportCol): string;
var
  AlignStr, FontStr, ColorStr, AttrStr,
  BackgroundStr, HighLightStr, FormatStr: string;
  Style: TrtfStyle;
  Index, i: integer;
  ColAlign: TQExportColAlign;
begin
  Result := inherited GetColData(ExportCol);
  Index := ExportCol.ColumnIndex;

  Result := Replace(Result, #13#10, ' \par ');

  ColAlign := Columns[Index].ColAlign;

  Style := TrtfStyle.Create(nil);
  try
    if (FOptions.StripType <> stNone) and
       (FOptions.StripStyles.Count > 0) then begin
      if FOptions.StripType = stCol
        then i := Index mod FOptions.StripStyles.Count
        else i := RecordCounter mod FOptions.StripStyles.Count;
      Style.Assign(FOptions.StripStyles[i]);
    end
    else Style.Assign(FOptions.DataStyle);

    if Assigned(FOnGetDataStyle) then
      FOnGetDataStyle(Self, SkipRecCount + RecordCounter, Index, Style);

    StyleToStrs(Style, AlignStr, FontStr, ColorStr, AttrStr,
      BackgroundStr, HighlightStr);
  finally
    Style.Free;
  end;
  AlignStr := GetWriter.AlignToStr(ColAlign);

  FormatStr := FontStr + ColorStr + AttrStr;
  if FormatStr <> EmptyStr then FormatStr := FormatStr + ' ';

  Result := '\pard\intbl\li30\ri30' +  BackgroundStr + HighlightStr +
            AlignStr +'{' + FormatStr + Result + '}\cell';
end;

procedure TQExport3RTF.WriteDataRow;
begin
  GetWriter.WriteLn(GetDataRow(true) + '\row');
end;

procedure TQExport3RTF.EndExport;
var
  i: integer;
  Style: TrtfStyle;
  AlignStr, FontStr, ColorStr, AttrStr,
  BackgroundStr, HighlightStr, FormatStr: string;
begin
  with GetWriter do begin
    WriteLn('\pard');

    Style := TrtfStyle.Create(nil);
    try
      Style.Assign(FOptions.FooterStyle);
      if Assigned(FOnGetFooterStyle) then FOnGetFooterStyle(Self, Style);

      StyleToStrs(Style, AlignStr, FontStr, ColorStr, AttrStr,
        BackgroundStr, HighlightStr);
    finally
      Style.Free;
    end;

    if BackgroundStr <> EmptyStr then
      BackgroundStr := BackgroundStr + ' ';

    if Self.Footer.Count > 0 then begin
      WritePara;
      WriteLn('{' + AlignStr + BackgroundStr);
      try
        for i := 0 to Self.Footer.Count - 1 do begin
          FormatStr := FontStr + ColorStr + AttrStr;
          if FormatStr <> EmptyStr then
            FormatStr := FormatStr + ' ';
          WriteLn('{' + HighlightStr + FormatStr + Self.Footer[i] + '}');
          WritePara;
        end;
      finally
        WriteLn('}');
      end;
    end;
    WriteEOF;
  end;
  inherited;
end;

function TQExport3RTF.NormalString(const S: string): string;
var
  i: Integer;
begin
  Result := EmptyStr;
  for i := 1 to Length(S) do
    if S[i] = '\' then Result := Result + '\\'
    else Result := Result + S[i];
end;

function TQExport3RTF.GetWriter: TQRTFWriter;
begin
  Result := TQRTFWriter(inherited GetWriter);
end;

function TQExport3RTF.GetWriterClass: TQExportWriterClass;
begin
  Result := TQRTFWriter;
end;

procedure TQExport3RTF.StyleToStrs(Style: TrtfStyle; var AlignStr, FontStr,
  ColorStr, AttrStr, BackgroundStr, HighlightStr: string);
var
  Writer: TQRTFWriter;
begin
  case Style.Alignment of
    talRight: AlignStr := '\qr';
    talCenter: AlignStr := '\qc';
    talFill: AlignStr := '\qj';
    else AlignStr := '\ql';
  end;

  Writer := GetWriter;
  Writer.SetFont(Style.Font, false, FontStr);
  ColorStr := Writer.GetColorText(Style.Font.Color, ctText);
  AttrStr := EmptyStr;

  if fsBold in Style.Font.Style then
    AttrStr := AttrStr + '\b';
  if fsItalic in Style.Font.Style then
    AttrStr := AttrStr + '\i';
  if fsUnderline in Style.Font.Style then
    AttrStr := AttrStr + '\ul';
  if fsStrikeOut in Style.Font.Style then
    AttrStr := AttrStr + '\strike';

  if Style.AllowBackground then
    BackgroundStr := Writer.GetColorText(Style.BackgroundColor, ctBackground)
  else
    BackgroundStr := EmptyStr;
 
  if Style.AllowHighlight then
    HighlightStr := Writer.GetColorText(Style.HighlightColor, ctHighlight)
  else
    HighlightStr := EmptyStr;
end;

procedure TQExport3RTF.SetOptions(const Value: TRTFOptions);
begin
  FOptions.Assign(Value);
end;

{ TrtfStyle }

constructor TrtfStyle.Create(Collection: TCollection);
begin
  inherited;
  FFont := TFont.Create;
  SetDefault;
  {FFont.Name := 'Arial';
  FFont.Size := 10;
  FBackgroundColor := clWhite;
  FHighlightColor := clWhite;
  FAllowHighlight := false;
  FAllowBackground := true;}
end;

destructor TrtfStyle.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TrtfStyle.Assign(Source: TPersistent);
begin
  if Source is TrtfStyle then begin
    Font := (Source as TrtfStyle).Font;
    BackgroundColor := (Source as TrtfStyle).BackgroundColor;
    HighlightColor := (Source as TrtfStyle).HighlightColor;
    AllowHighlight := (Source as TrtfStyle).AllowHighlight;
    AllowBackground := (Source as TrtfStyle).AllowBackground;
    Alignment := (Source as TrtfStyle).Alignment;
    Exit;
  end;
  inherited;
end;

procedure TrtfStyle.SetDefault;
begin
  FFont.Name := 'Arial';
  FFont.Size := 10;
  FFont.Style := [];
  FFont.Color := clBlack;
  FBackgroundColor := clWhite;
  FHighlightColor := clWhite;
  FAllowHighlight := false;
  FAllowBackground := true;
  FAlignment := talLeft;
end;

procedure TrtfStyle.SaveToIniFile(IniFile: TIniFile; const Section: string);
begin
  with IniFile do begin
    WriteString(Section, S_RTF_FontName, FFont.Name);
    WriteInteger(Section, S_RTF_FontSize, FFont.Size);
    WriteInteger(Section, S_RTF_FontColor, FFont.Color);
    WriteBool(Section, S_RTF_FontBold, fsBold in FFont.Style);
    WriteBool(Section, S_RTF_FontItalic, fsItalic in FFont.Style);
    WriteBool(Section, S_RTF_FontUnderline, fsUnderline in FFont.Style);
    WriteBool(Section, S_RTF_FontStrikeOut, fsStrikeOut in FFont.Style);
    WriteInteger(Section, S_RTF_BackgroundColor, FBackgroundColor);
    WriteInteger(Section, S_RTF_HighlightColor, FHighlightColor);
    WriteBool(Section, S_RTF_AllowHighlight, FAllowHighlight);
    WriteBool(Section, S_RTF_AllowBackground, FAllowBackground);
    WriteInteger(Section, S_RTF_Alignment, Integer(FAlignment));
  end;
end;

procedure TrtfStyle.LoadFromIniFile(IniFile: TIniFile; const Section: string);
begin
  SetDefault;
  with IniFile do begin
    FFont.Name := ReadString(Section, S_RTF_FontName, FFont.Name);
    FFont.Size := ReadInteger(Section, S_RTF_FontSize, FFont.Size);
    FFont.Color := ReadInteger(Section, S_RTF_FontColor, FFont.Color);
    if ReadBool(Section, S_RTF_FontBold, fsBold in FFont.Style)
      then FFont.Style := FFont.Style + [fsBold]
      else FFont.Style := FFont.Style - [fsBold];
    if ReadBool(Section, S_RTF_FontItalic, fsItalic in FFont.Style)
      then FFont.Style := FFont.Style + [fsItalic]
      else FFont.Style := FFont.Style - [fsItalic];
    if ReadBool(Section, S_RTF_FontUnderline, fsUnderline in FFont.Style)
      then FFont.Style := FFont.Style + [fsUnderline]
      else FFont.Style := FFont.Style - [fsUnderline];
    if ReadBool(Section, S_RTF_FontStrikeOut, fsStrikeOut in FFont.Style)
      then FFont.Style := FFont.Style + [fsStrikeOut]
      else FFont.Style := FFont.Style - [fsStrikeOut];
    FBackgroundColor :=
      ReadInteger(Section, S_RTF_BackgroundColor, FBackgroundColor);
    FHighlightColor :=
      ReadInteger(Section, S_RTF_HighlightColor, FHighlightColor);
    FAllowHighlight :=
      ReadBool(Section, S_RTF_AllowHighlight, FAllowHighlight);
    FAllowBackground :=
      ReadBool(Section, S_RTF_AllowBackground, FAllowBackground);
    FAlignment :=
      TrtfTextAlignment(ReadInteger(Section, S_RTF_Alignment,
        Integer(FAlignment)));
  end;
end;

procedure TrtfStyle.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

{ TrtfStyles }

constructor TrtfStyles.Create(Holder: TPersistent);
begin
  inherited Create(TrtfStyle);
  FHolder := Holder;
end;

function TrtfStyles.Add: TrtfStyle;
begin
  Result := inherited Add as TrtfStyle;
end;

procedure TrtfStyles.SaveToIniFile(IniFile: TIniFile;
  const SectionPrefix: string);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].SaveToIniFile(IniFile, SectionPrefix + IntToStr(i)); 
end;

procedure TrtfStyles.LoadFromIniFile(IniFile: TIniFile;
  const SectionPrefix: string);
var
  List: TStringList;
  i: integer;
  Str: string;
begin
  BeginUpdate;
  try
    Clear;
    List := TStringList.Create;
    try
      IniFile.ReadSections(List);
      for i := 0 to List.Count - 1 do begin
        Str := Copy(List[i], 1, Length(SectionPrefix));
        if AnsiCompareText(Str, SectionPrefix) = 0 then
          Add.LoadFromIniFile(IniFile, List[i]);
      end;
    finally
      List.Free;
    end;
  finally
    EndUpdate;
  end;
end;

function TrtfStyles.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TrtfStyles.GetItem(Index: integer): TrtfStyle;
begin
  Result := inherited GetItem(Index) as TrtfStyle;
end;

procedure TrtfStyles.SetItem(Index: integer; Value: TrtfStyle);
begin
  inherited SetItem(Index, Value);
end;

end.
