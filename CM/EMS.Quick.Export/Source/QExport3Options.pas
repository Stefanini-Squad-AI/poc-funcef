unit QExport3Options;

interface

uses Classes, Graphics, QExport3, QExport3HTML, QExport3PDF, QExport3XLS,
  QExport3RTF;

type

  TQExportOptions = class(TPersistent)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(Holder: TPersistent);
  end;

  TQExportRTFOptions = class(TQExportOptions)
  private
    FCaptionAligns: TStrings;
    FCaptionStyle: TrtfStyle;
    FDataStyle: TrtfStyle;
//    FDefaultCaptionAlign: TQExportColAlign;
    FFooterStyle: TrtfStyle;
    FHeaderStyle: TrtfStyle;
    FPageOrientation: TQExportPageOrientation;
    FStripStyles: TrtfStyles;
    FStripType: TrtfStripType;

    procedure SetCaptionAligns(const Value: TStrings);
    procedure SetCaptionStyle(const Value: TrtfStyle);
    procedure SetDataStyle(const Value: TrtfStyle);
    procedure SetFooterStyle(const Value: TrtfStyle);
    procedure SetHeaderStyle(const Value: TrtfStyle);
    procedure SetStripStyles(const Value: TrtfStyles);
  public
    constructor Create(Holder: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property CaptionAligns: TStrings read FCaptionAligns
      write SetCaptionAligns;
    property CaptionStyle: TrtfStyle read FCaptionStyle
      write SetCaptionStyle;
    property DataStyle: TrtfStyle read FDataStyle
      write SetDataStyle;
//    property DefaultCaptionAlign: TQExportColAlign
//      read FDefaultCaptionAlign write FDefaultCaptionAlign
//      default ecaCenter;
    property FooterStyle: TrtfStyle read FFooterStyle
      write SetFooterStyle;
    property HeaderStyle: TrtfStyle read FHeaderStyle
      write SetHeaderStyle;
    property PageOrientation: TQExportPageOrientation
      read FPageOrientation write FPageOrientation
      default poPortrait;
    property StripStyles: TrtfStyles read FStripStyles
      write SetStripStyles;
    property StripType: TrtfStripType read FStripType
      write FStripType default stNone;
  end;

  TQExportXMLOptions = class(TQExportOptions)
  private
    FStandalone: boolean;
    FEncoding: string;

    function IsEncoding: boolean;
  public
    constructor Create(Holder: TPersistent);
    procedure Assign(Source: TPersistent); override;
  published
    property Standalone: boolean read FStandalone write FStandalone default true;
    property Encoding: string read FEncoding write FEncoding stored IsEncoding;
  end;

  TQExportSQLOptions = class(TQExportOptions)
  private
    FTableName: string;
    FCreateTable: boolean;
    FCommitRecCount: integer;
    FCommitAfterScript: boolean;
    FCommitStatement: string;
    FStatementTerm: char;

    function IsTableName: boolean;
    function IsCommitStatement: boolean;
  public
    constructor Create(Holder: TPersistent);
    procedure Assign(Source: TPersistent); override;
  published
    property TableName: string read FTableName write FTableName
      stored IsTableName;
    property CreateTable: boolean read FCreateTable write FCreateTable
      default false;
    property CommitRecCount: integer read FCommitRecCount write FCommitRecCount
      default 0;
    property CommitAfterScript: boolean read FCommitAfterScript
      write FCommitAfterScript default false;
    property CommitStatement: string read FCommitStatement
      write FCommitStatement stored IsCommitStatement;
    property StatementTerm: char read FStatementTerm write FStatementTerm
      default ';';
  end;

  TQExportHTMLTableOptions = class(TQExportOptions)
  private
    FBorderWidth: integer;
    FCellPadding: integer;
    FCellSpacing: integer;
    FAdvancedAttributes: TStrings;

    FHeadersRowBgColor: TColor;
    FHeadersRowFontColor: TColor;
    FTableBgColor: TColor;
    FTableFontColor: TColor;
    FOddRowBgColor: TColor;

    FBorderColor: TColor;
    FBackgroundFileName: string;

    procedure SetAdvancedAttributes(const Value: TStrings);
    function IsBackgroundFileName: boolean;
  public
    constructor Create(Holder: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property BorderWidth: integer read FBorderWidth write FBorderWidth
      default 1;
    property CellPadding: integer read FCellPadding write FCellPadding
      default 4;
    property CellSpacing: integer read FCellSpacing write FCellSpacing
      default 1;
    property AdvancedAttributes: TStrings read FAdvancedAttributes
      write SetAdvancedAttributes;

    property HeadersRowBgColor: TColor read FHeadersRowBgColor
      write FHeadersRowBgColor default $000000FF;
    property HeadersRowFontColor: TColor read FHeadersRowFontColor
      write FHeadersRowFontColor default $00FFFFFF;
    property TableBgColor: TColor read FTableBgColor write FTableBgColor
      default $00EC7A00;
    property TableFontColor: TColor read FTableFontColor write FTableFontColor
      default $00FFFFFF;
    property OddRowBgColor: TColor read FOddRowBgColor write FOddRowBgColor
      default $00CE6B00;

    property BorderColor: TColor read FBorderColor write FBorderColor
      default clWhite;
    property BackgroundFileName: string read FBackgroundFileName
      write FBackgroundFileName stored IsBackgroundFileName;
  end;

  TQExportHTMLPageOptions = class(TQExportOptions)
  private
    FTitle: string;

    FBackgroundColor: TColor;
    FTextFont: TFont;
    FDefaultOptions: TDefaultOptions;

    FLinkColor: TColor;
    FVLinkColor: TColor;
    FALinkColor: TColor;

    FBackgroundFileName: string;
    FAdvancedAttributes: TStrings;

    FUsingCSS: TUsingCSS;
    FCSSFileName: string;
    FOverwriteCSSFile: boolean;
    FBoolAsCheckBox: boolean;

    function IsTitle: boolean;
    procedure SetTextFont(const Value: TFont);
    function IsBackgroundFilename: boolean;
    procedure SetAdvancedAttributes(const Value: TStrings);
    function IsCSSFileName: boolean;
  public
    constructor Create(Holder: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Title: string read FTitle write FTitle stored IsTitle;

    property BackgroundColor: TColor read FBackgroundColor
      write FBackgroundColor default $00993333;
    property TextFont: TFont read FTextFont write SetTextFont;
    property DefaultOptions: TDefaultOptions read FDefaultOptions
      write FDefaultOptions default [doFontSIze];

    property LinkColor: TColor read FLinkColor write FLinkColor
      default $007DEF69;
    property VLinkColor: TColor read FVLinkColor write FVLinkColor
      default $00FF00FF;
    property ALinkColor: TColor read FALinkColor write FALinkColor
      default $0000FF00;

    property BackgroundFileName: string read FBackgroundFileName
      write FBackgroundFileName stored IsBackgroundFileName;
    property AdvancedAttributes: TStrings read FAdvancedAttributes
      write SetAdvancedAttributes;

    property UsingCSS: TUsingCSS read FUsingCSS write FUsingCSS
      default usInternal;
    property CSSFileName: string read FCSSFileName write FCSSFileName
      stored IsCSSFileName;
    property OverwriteCSSFile: boolean read FOverwriteCSSFile
      write FOverwriteCSSFile default true;
    property BoolAsCheckBox: boolean read FBoolAsCheckBox
      write FBoolAsCheckBox default false;
  end;

  TQExportHTMLMultiFileOptions = class(TQExportOptions)
  private
    FFileRecCount: integer;
    FGenerateIndex: boolean;
    FIndexLinkTemplate: string;

    FNavigationOnTop: boolean;
    FNavigationOnBottom: boolean;
    FIndexLinkTitle: string;
    FFirstLinkTitle: string;
    FPriorLinkTitle: string;
    FNextLinkTitle: string;
    FLastLinkTitle: string;

    function IsIndexLinkTemplate: boolean;
    function IsIndexLinkTitle: boolean;
    function IsFirstLinkTitle: boolean;
    function IsPriorLinkTitle: boolean;
    function IsNextLinkTitle: boolean;
    function IsLastLinkTitle: boolean;
  public
    constructor Create(Holder: TPersistent);
    procedure Assign(Source: TPersistent); override;
  published
    property FileRecCount: integer read FFileRecCount write FFileRecCount
      default 0;
    property GenerateIndex: boolean read FGenerateIndex write FGenerateIndex
      default false;
    property IndexLinkTemplate: string read FIndexLinkTemplate
      write FIndexLinkTemplate stored IsIndexLinkTemplate;

    property NavigationOnTop: boolean read FNavigationOnTop
      write FNavigationOnTop default true;
    property NavigationOnBottom: boolean read FNavigationOnBottom
      write FNavigationOnBottom default true;
    property IndexLinkTitle: string read FIndexLinkTitle write FIndexLinkTitle
      stored IsIndexLinkTitle;
    property FirstLinkTitle: string read FFirstLinkTitle write FFirstLinkTitle
      stored IsFirstLinkTitle;
    property PriorLinkTitle: string read FPriorLinkTitle write FPriorLinkTitle
      stored IsPriorLinkTitle;
    property NextLinkTitle: string read FNextLinkTitle write FNextLinkTitle
      stored IsNextLinkTitle;
    property LastLinkTitle: string read FLastLinkTitle write FLastLinkTitle
      stored IsLastLinkTitle;
  end;

  TQExportTXTOptions = class(TQExportOptions)
  private
    FAutoCalcColWidth: boolean;
    FColSpacing: integer;
  public
    constructor Create(Holder: TPersistent);
    procedure Assign(Source: TPersistent); override;
  published
    property AutoCalcColWidth: boolean read FAutoCalcColWidth
      write FAutoCalcColWidth default true;
    property ColSpacing: integer read FColSpacing write FColSpacing default 1;
  end;

  TQExportCSVOptions = class(TQExportOptions)
  private
    FComma: char;
    FQuote: char;
    FQuoteStrings: boolean;
  public
    constructor Create(Holder: TPersistent);
    procedure Assign(Source: TPersistent); override;
  published
    property Comma: char read FComma write FComma;
    property Quote: char read FQuote write FQuote default '"';
    property QuoteStrings: boolean read FQuoteStrings write FQuoteStrings
      default true;
  end;

  TQExportPDFOptions = class(TQExportOptions)
  private
    FPageOptions: TQExportPDFPageOptions;
    FHeaderFont: TPDFFont;
    FCaptionFont: TPDFFont;
    FDataFont: TPDFFont;
    FFooterFont: TPDFFont;

    FRowSpacing: double;
    FColSpacing: double;
    FGridLineWidth: integer;

    function IsRowSpacing: boolean;
    function IsColSpacing: boolean;

    procedure SetPageOptions(const Value: TQExportPDFPageOptions);
    procedure SetCaptionFont(const Value: TPDFFont);
    procedure SetDataFont(const Value: TPDFFont);
    procedure SetFooterFont(const Value: TPDFFont);
    procedure SetHeaderFont(const Value: TPDFFont);
  public
    constructor Create(Holder: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property PageOptions: TQExportPDFPageOptions read FPageOptions
      write SetPageOptions;
    property HeaderFont: TPDFFont read FHeaderFont write SetHeaderFont;
    property CaptionFont: TPDFFont read FCaptionFont write SetCaptionFont;
    property DataFont: TPDFFont read FDataFont write SetDataFont;
    property FooterFont: TPDFFont read FFooterFont write SetFooterFont;

    property RowSpacing: double read FRowSpacing write FRowSpacing
      stored IsRowSpacing;
    property ColSpacing: double read FColSpacing write FColSpacing
      stored IsColSpacing;
    property GridLineWidth: integer read FGridLineWidth write FGridLineWidth
      default 1;
  end;

  TQExportAccessOptions = class(TQExportOptions)
  private
    FPassword: string;
    FTableName: string;
    FCreateTable: boolean;

    function IsPassword: Boolean;
    function IsTableName: boolean;
  public
    constructor Create(Holder: TPersistent);
    procedure Assign(Source: TPersistent); override;
  published
    property Password: string read FPassword write FPassword
      stored IsPassword;
    property TableName: string read FTableName write FTableName
      stored IsTableName;
    property CreateTable: boolean read FCreateTable write FCreateTable
      default true;
  end;

  TQExportXLSOptions = class(TQExportOptions)
  private
    FAutoCalcColWidth: boolean;
    FPageHeader: string;
    FPageFooter: string;
    FSheetTitle: string;
    FPageBackground: string;
    FHeaderFormat: TxlsFormat;
    FCaptionFormat: TxlsFormat;
    FDataFormat: TxlsFormat;
    FAggregateFormat: TxlsFormat;
    FFooterFormat: TxlsFormat;
    FFieldFormats: TxlsFieldFormats;
    FStripStyles: TxlsFormats;
    FStripType: TxlsStripType;
    FHyperlinks: TxlsHyperlinks;
    FNotes: TxlsNotes;
    FCharts: TxlsCharts;
    FHyperlinkFormat: TxlsFormat;
    FNoteFormat: TxlsNoteFormat;
    FPictures: TxlsPictures;
    FImages: TxlsImages;
    FCells: TxlsCells;
    FMergedCells: TxlsMergedCellList;

    function IsPageHeader: Boolean;
    function IsPageFooter: Boolean;

    procedure SetSheetTitle(const Value: string);
    procedure SetHeaderFormat(const Value: TxlsFormat);
    procedure SetCaptionFormat(const Value: TxlsFormat);
    procedure SetDataFormat(const Value: TxlsFormat);
    procedure SetAggregateFormat(const Value: TxlsFormat);
    procedure SetFooterFormat(const Value: TxlsFormat);
    procedure SetFieldFormats(const Value: TxlsFieldFormats);
    procedure SetStripStyles(const Value: TxlsFormats);
    procedure SetHyperlinks(const Value: TxlsHyperlinks);
    procedure SetNotes(const Value: TxlsNotes);
    procedure SetCharts(const Value: TxlsCharts);
    procedure SetHyperlinkFormat(const Value: TxlsFormat);
    procedure SetNoteFormat(const Value: TxlsNoteFormat);
    procedure SetPictures(const Value: TxlsPictures);
    procedure SetImages(const Value: TxlsImages);
    procedure SetCells(const Value: TxlsCells);
    procedure SetMergedCells(const Value: TxlsMergedCellList);
  public
    constructor Create(Holder: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property AutoCalcColWidth: boolean read FAutoCalcColWidth
      write FAutoCalcColWidth default false;
    property PageHeader: string read FPageHeader write FPageHeader
      stored IsPageHeader;
    property PageFooter: string read FPageFooter write FPageFooter
      stored IsPageFooter;
    property SheetTitle: string read FSheetTitle write SetSheetTitle;
    property PageBackground: string read FPageBackground
      write FPageBackground;

    property HeaderFormat: TxlsFormat read FHeaderFormat
      write SetHeaderFormat;
    property CaptionFormat: TxlsFormat read FCaptionFormat
      write SetCaptionFormat;
    property DataFormat: TxlsFormat read FDataFormat
      write SetDataFormat;
    property AggregateFormat: TxlsFormat read FAggregateFormat
      write SetAggregateFormat;
    property FooterFormat: TxlsFormat read FFooterFormat
      write SetFooterFormat;
    property HyperlinkFormat: TxlsFormat read FHyperlinkFormat
      write SetHyperlinkFormat;
    property NoteFormat: TxlsNoteFormat read FNoteFormat
      write SetNoteFormat;

    property FieldFormats: TxlsFieldFormats read FFieldFormats
      write SetFieldFormats;
    property StripStyles: TxlsFormats read FStripStyles
      write SetStripStyles;
    property StripType: TxlsStripType read FStripType
      write FStripType default ssNone;
    property Hyperlinks: TxlsHyperlinks read FHyperlinks
      write SetHyperlinks;
    property Notes: TxlsNotes read FNotes write SetNotes;
    property Charts: TxlsCharts read FCharts write SetCharts;
    property Pictures: TxlsPictures read FPictures write SetPictures;
    property Images: TxlsImages read FImages write SetImages;
    property Cells: TxlsCells read FCells write SetCells;
    property MergedCells: TxlsMergedCellList read FMergedCells
      write SetMergedCells;
  end;

implementation

uses SysUtils, QExport3Common;

{ TQExportOptions }

constructor TQExportOptions.Create(Holder: TPersistent);
begin
  inherited Create;
  FHolder := Holder;
end;

function TQExportOptions.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

{ TQExportSQLOptions }

constructor TQExportSQLOptions.Create;
begin
  inherited;
  FTableName := EmptyStr;
  FCreateTable := false;
  FCommitRecCount := 0;
  FCommitAfterScript := false;
  FCommitStatement := S_Commit;
  FStatementTerm := ';';
end;

procedure TQExportSQLOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportSQLOptions then begin
    TableName := (Source as TQExportSQLOptions).TableName;
    CreateTable := (Source as TQExportSQLOptions).CreateTable;
    CommitRecCount := (Source as TQExportSQLOptions).CommitRecCount;
    CommitAfterScript := (Source as TQExportSQLOptions).CommitAfterScript;
    CommitStatement := (Source as TQExportSQLOptions).CommitStatement;
    StatementTerm := (Source as TQExportSQLOptions).StatementTerm;
    Exit;
  end;
  inherited;
end;

function TQExportSQLOptions.IsTableName: boolean;
begin
  Result := FTableName <> EmptyStr;
end;

function TQExportSQLOptions.IsCommitStatement: boolean;
begin
  Result := FCommitStatement <> S_Commit;
end;

{ TQExportRTFOptions }

constructor TQExportRTFOptions.Create;
begin
  inherited;
  FCaptionAligns := TStringList.Create;
  FCaptionStyle := TrtfStyle.Create(nil);
  SetDefaultRTFCaption(FCaptionStyle);
  FDataStyle := TrtfStyle.Create(nil);
//  FDefaultCaptionAlign := ecaCenter;
  FFooterStyle := TrtfStyle.Create(nil);
  FHeaderStyle := TrtfStyle.Create(nil);
  FPageOrientation := poPortrait;
  FStripStyles := TrtfStyles.Create(Self);
  FStripType := stNone;
end;

destructor TQExportRTFOptions.Destroy;
begin
  FCaptionAligns.Free;
  FCaptionStyle.Free;
  FDataStyle.Free;
  FFooterStyle.Free;
  FHeaderStyle.Free;
  FStripStyles.Free;
  inherited;
end;

procedure TQExportRTFOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportRTFOptions then begin
    CaptionAligns := (Source as TQExportRTFOptions).CaptionAligns;
    CaptionStyle := (Source as TQExportRTFOptions).CaptionStyle;
    DataStyle := (Source as TQExportRTFOptions).DataStyle;
//    DefaultCaptionAlign := (Source as TQExportRTFOptions).DefaultCaptionAlign;
    FooterStyle := (Source as TQExportRTFOptions).FooterStyle;
    HeaderStyle := (Source as TQExportRTFOptions).HeaderStyle;
    PageOrientation := (Source as TQExportRTFOptions).PageOrientation;
    StripStyles := (Source as TQExportRTFOptions).StripStyles;
    StripType := (Source as TQExportRTFOptions).StripType;
    Exit;
  end;
  inherited;
end;

procedure TQExportRTFOptions.SetCaptionAligns(const Value: TStrings);
begin
  FCaptionAligns.Assign(Value);
end;

procedure TQExportRTFOptions.SetCaptionStyle(const Value: TrtfStyle);
begin
  FCaptionStyle.Assign(Value);
end;

procedure TQExportRTFOptions.SetDataStyle(const Value: TrtfStyle);
begin
  FDataStyle.Assign(Value);
end;

procedure TQExportRTFOptions.SetFooterStyle(const Value: TrtfStyle);
begin
  FFooterStyle.Assign(Value);
end;

procedure TQExportRTFOptions.SetHeaderStyle(const Value: TrtfStyle);
begin
  FHeaderStyle.Assign(Value);
end;

procedure TQExportRTFOptions.SetStripStyles(const Value: TrtfStyles);
begin
  FStripStyles.Assign(Value)
end;

{ TQExportXMLOptions }

constructor TQExportXMLOptions.Create;
begin
  FStandalone := true;
  FEncoding := EmptyStr;
end;

procedure TQExportXMLOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportXMLOptions then begin
    Standalone := (Source as TQExportXMLOptions).Standalone;
    Encoding := (Source as TQExportXMLOptions).Encoding;
    Exit;
  end;
  inherited;
end;

function TQExportXMLOptions.IsEncoding: boolean;
begin
  Result := FEncoding <> EmptyStr;
end;

{ TQExportHTMLTableOptions }

constructor TQExportHTMLTableOptions.Create;
begin
  inherited;
  FBorderWidth := 1;
  FCellPadding := 4;
  FCellSpacing := 1;
  FAdvancedAttributes := TStringList.Create;

  FHeadersRowBgColor := $000000FF;
  FHeadersRowFontColor := $00FFFFFF;
  FTableBgColor := $00EC7A00;
  FTableFontColor := $00FFFFFF;
  FOddRowBgColor := $00CE6B00;

  FBorderColor := clWhite;
  FBackgroundFileName := EmptyStr;
end;

destructor TQExportHTMLTableOptions.Destroy;
begin
  FAdvancedAttributes.Free;
  inherited;
end;

procedure TQExportHTMLTableOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportHTMLTableOptions then begin
    BorderWidth := (Source as TQExportHTMLTableOptions).BorderWidth;
    CellPadding := (Source as TQExportHTMLTableOptions).CellPadding;
    CellSpacing := (Source as TQExportHTMLTableOptions).CellSpacing;
    AdvancedAttributes := (Source as TQExportHTMLTableOptions).AdvancedAttributes;

    HeadersRowBgColor := (Source as TQExportHTMLTableOptions).HeadersRowBgColor;
    HeadersRowFontColor := (Source as TQExportHTMLTableOptions).HeadersRowFontColor;
    TableBgColor := (Source as TQExportHTMLTableOptions).TableBgColor;
    TableFontColor := (Source as TQExportHTMLTableOptions).TableFontColor;
    OddRowBgColor := (Source as TQExportHTMLTableOptions).OddRowBgColor;

    BorderColor := (Source as TQExportHTMLTableOptions).BorderColor;
    BackgroundFileName := (Source as TQExportHTMLTableOptions).BackgroundFileName;

    Exit;
  end;
  inherited;
end;

procedure TQExportHTMLTableOptions.SetAdvancedAttributes(const Value: TStrings);
begin
  FAdvancedAttributes.Assign(Value);
end;

function TQExportHTMLTableOptions.IsBackgroundFileName: boolean;
begin
  Result := FBackgroundFileName <> EmptyStr;
end;

{ TQExportHTMLPageOptions }

constructor TQExportHTMLPageOptions.Create;
begin
  inherited;
  FTitle := EmptyStr;

  FBackgroundColor := $00993333;
  FTextFont := TFont.Create;
  FTextFont.Name := 'Arial';
  FTextFont.Color := $00FFFFFF;
  FDefaultOptions := [doFontSIze];

  FLinkColor  := $007DEF69;
  FVLinkColor := $00FF00FF;
  FALinkColor := $0000FF00;

  FBackgroundFileName := EmptyStr;
  FAdvancedAttributes := TStringList.Create;

  FUsingCSS := usInternal;
  FCSSFileName := EmptyStr;
  FOverwriteCSSFile := true;
  FBoolAsCheckBox := false;
end;

destructor TQExportHTMLPageOptions.Destroy;
begin
  FTextFont.Free;
  FAdvancedAttributes.Free;
  inherited;
end;

procedure TQExportHTMLPageOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportHTMLPageOptions then begin
    Title := (Source as TQExportHTMLPageOptions).Title;
    BackgroundColor := (Source as TQExportHTMLPageOptions).BackgroundColor;
    TextFont := (Source as TQExportHTMLPageOptions).TextFont;
    DefaultOptions := (Source as TQExportHTMLPageOptions).DefaultOptions;

    LinkColor := (Source as TQExportHTMLPageOptions).LinkColor;
    VLinkColor := (Source as TQExportHTMLPageOptions).VLinkColor;
    ALinkColor := (Source as TQExportHTMLPageOptions).ALinkColor;

    BackgroundFileName := (Source as TQExportHTMLPageOptions).BackgroundFileName;
    AdvancedAttributes := (Source as TQExportHTMLPageOptions).AdvancedAttributes;

    UsingCSS := (Source as TQExportHTMLPageOptions).UsingCSS;
    CSSFileName := (Source as TQExportHTMLPageOptions).CSSFileName;
    OverwriteCSSFile := (Source as TQExportHTMLPageOptions).OverwriteCSSFile;
    BoolAsCheckBox := (Source as TQExportHTMLPageOptions).BoolAsCheckBox;

    Exit;
  end;
  inherited;
end;

function TQExportHTMLPageOptions.IsTitle: boolean;
begin
  Result := FTitle <> EmptyStr;
end;

procedure TQExportHTMLPageOptions.SetTextFont(const Value: TFont);
begin
  FTextFont.Assign(Value);
end;

function TQExportHTMLPageOptions.IsBackgroundFilename: boolean;
begin
  Result := FBackgroundFileName <> EmptyStr;
end;

procedure TQExportHTMLPageOptions.SetAdvancedAttributes(const Value: TStrings);
begin
  FAdvancedAttributes.Assign(Value);
end;

function TQExportHTMLPageOptions.IsCSSFileName: boolean;
begin
  Result :=  FCSSFileName <> EmptyStr;
end;

{ TQExportHTMLMultiFileOptions }

constructor TQExportHTMLMultiFileOptions.Create;
begin
  inherited;
  FFileRecCount := 0;
  FGenerateIndex := false;
  FIndexLinkTemplate := EmptyStr;

  FNavigationOnTop := true;
  FNavigationOnBottom := true;

  FIndexLinkTitle := S_Index;
  FFirstLinkTitle := S_First;
  FPriorLinkTitle := S_Prior;;
  FNextLinkTitle := S_Next;
  FLastLinkTitle := S_Last;
end;

procedure TQExportHTMLMultiFileOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportHTMLMultiFileOptions then begin
    FileRecCount := (Source as TQExportHTMLMultiFileOptions).FileRecCount;
    GenerateIndex := (Source as TQExportHTMLMultiFileOptions).GenerateIndex;
    IndexLinkTemplate := (Source as TQExportHTMLMultiFileOptions).IndexLinkTemplate;

    NavigationOnTop := (Source as TQExportHTMLMultiFileOptions).NavigationOnTop;
    NavigationOnBottom := (Source as TQExportHTMLMultiFileOptions).NavigationOnBottom;
    IndexLinkTitle := (Source as TQExportHTMLMultiFileOptions).IndexLinkTitle;
    FirstLinkTitle := (Source as TQExportHTMLMultiFileOptions).FirstLinkTitle;
    PriorLinkTitle := (Source as TQExportHTMLMultiFileOptions).PriorLinkTitle;
    NextLinkTitle := (Source as TQExportHTMLMultiFileOptions).NextLinkTitle;
    LastLinkTitle := (Source as TQExportHTMLMultiFileOptions).LastLinkTitle;

    Exit;
  end;
  inherited;
end;

function TQExportHTMLMultiFileOptions.IsIndexLinkTemplate: boolean;
begin
  Result := FIndexLinkTemplate <> EmptyStr;
end;

function TQExportHTMLMultiFileOptions.IsIndexLinkTitle: boolean;
begin
  Result := FIndexLinkTitle <> S_Index;
end;

function TQExportHTMLMultiFileOptions.IsFirstLinkTitle: boolean;
begin
  Result := FFirstLinkTitle <> S_First;
end;

function TQExportHTMLMultiFileOptions.IsPriorLinkTitle: boolean;
begin
  Result := FPriorLinkTitle <> S_Prior;
end;

function TQExportHTMLMultiFileOptions.IsNextLinkTitle: boolean;
begin
  Result := FNextLinkTitle <> S_Next;
end;

function TQExportHTMLMultiFileOptions.IsLastLinkTitle: boolean;
begin
  Result := FLastLinkTitle <> S_Last;
end;

{ TQExportTXTOptions }

constructor TQExportTXTOptions.Create;
begin
  inherited;
  FAutoCalcColWidth := true;
  FColSpacing := 1;
end;

procedure TQExportTXTOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportTXTOptions then begin
    AutoCalcColWidth := (Source as TQExportTXTOptions).AutoCalcColWidth;
    ColSpacing := (Source as TQExportTXTOptions).ColSpacing;
    Exit;
  end;
  inherited;
end;

{ TQExportCSVOptions }

constructor TQExportCSVOptions.Create;
begin
  inherited;
  FComma := GetListSeparator;
  FQuote := '"';
  FQuoteStrings := true;
end;

procedure TQExportCSVOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportCSVOptions then begin
    Comma := (Source as TQExportCSVOptions).Comma;
    Quote := (Source as TQExportCSVOptions).Quote;
    QuoteStrings := (Source as TQExportCSVOptions).QuoteStrings;
    Exit;
  end;
  inherited;
end;

{ TQExportPDFOptions }

constructor TQExportPDFOptions.Create;
begin
  inherited;
  FPageOptions := TQExportPDFPageOptions.Create;
  FHeaderFont := TPDFFont.Create;
  FHeaderFont.FontName := 'HeaderFont';
  FCaptionFont := TPDFFont.Create;
  FCaptionFont.FontName := 'CaptionFont';
  FDataFont := TPDFFont.Create;
  FDataFont.FontName := 'DataFont';
  FFooterFont := TPDFFont.Create;
  FFooterFont.FontName := 'FooterFont';

  FRowSpacing := 1;
  FColSpacing := 3;
  FGridLineWidth := 1;
end;

destructor TQExportPDFOptions.Destroy;
begin
  FPageOptions.Free;
  FHeaderFont.Free;
  FCaptionFont.Free;
  FDataFont.Free;
  FFooterFont.Free;
  inherited;
end;

procedure TQExportPDFOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportPDFOptions then begin
    PageOptions := (Source as TQExportPDFOptions).PageOptions;

    HeaderFont := (Source as TQExportPDFOptions).HeaderFont;
    CaptionFont := (Source as TQExportPDFOptions).CaptionFont;
    DataFont := (Source as TQExportPDFOptions).DataFont;
    FooterFont := (Source as TQExportPDFOptions).FooterFont;

    RowSpacing := (Source as TQExportPDFOptions).RowSpacing;
    ColSpacing := (Source as TQExportPDFOptions).ColSpacing;
    GridLineWidth := (Source as TQExportPDFOptions).GridLineWidth;

    Exit;
  end;
  inherited;
end;

function TQExportPDFOptions.IsRowSpacing: boolean;
begin
  Result := FRowSpacing <> 1;
end;

function TQExportPDFOptions.IsColSpacing: boolean;
begin
  Result := FColSpacing <> 3;
end;

procedure TQExportPDFOptions.SetHeaderFont(const Value: TPDFFont);
begin
  FHeaderFont.Assign(Value);
end;

procedure TQExportPDFOptions.SetPageOptions(const Value: TQExportPDFPageOptions);
begin
  FPageOptions.Assign(Value);
end;

procedure TQExportPDFOptions.SetCaptionFont(const Value: TPDFFont);
begin
  FCaptionFont.Assign(Value);
end;

procedure TQExportPDFOptions.SetDataFont(const Value: TPDFFont);
begin
  FDataFont.Assign(Value);
end;

procedure TQExportPDFOptions.SetFooterFont(const Value: TPDFFont);
begin
  FFooterFont.Assign(Value);
end;

{ TQExportAccessOptions }

constructor TQExportAccessOptions.Create;
begin
  inherited;
  FTableName := 'EXPORT_TABLE';
  FCreateTable := true;
end;

procedure TQExportAccessOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportAccessOptions then begin
    TableName := (Source as TQExportAccessOptions).TableName;
    CreateTable := (Source as TQExportAccessOptions).CreateTable;
    Exit;
  end;
  inherited;
end;

function TQExportAccessOptions.IsPassword: Boolean;
begin
  Result := FPassword <> EmptyStr;
end;

function TQExportAccessOptions.IsTableName: boolean;
begin
  Result := FTableName <> EmptyStr;
end;

{ TQExportXLSOptions }

constructor TQExportXLSOptions.Create;
begin
  inherited;
  FAutoCalcColWidth := false;
  FPageHeader := EmptyStr;
  FPageFooter := 'Page &P of &N';
  FSheetTitle := 'Sheet 1';
  FPageBackground := EmptyStr;

  FHeaderFormat := TxlsFormat.Create(nil);
  FCaptionFormat := TxlsFormat.Create(nil);
  SetDefaultXLSCaption(FCaptionFormat);
  FDataFormat := TxlsFormat.Create(nil);
  FAggregateFormat := TxlsFormat.Create(nil);
  FFooterFormat := TxlsFormat.Create(nil);
  FHyperlinkFormat := TxlsFormat.Create(nil);
  FHyperlinkFormat.Font.Color := clrBlue;
  FHyperlinkFormat.Font.Underline := fulSingle;
  FNoteFormat := TxlsNoteFormat.Create(nil);

  FFieldFormats := TxlsFieldFormats.Create(Self);
  FStripStyles := TxlsFormats.Create(Self);
  FStripType := ssNone;
  FHyperlinks := TxlsHyperlinks.Create(Self);
  FNotes := TxlsNotes.Create(Self);
  FCharts := TxlsCharts.Create(Self);
  FPictures := TxlsPictures.Create(Self);
  FImages := TxlsImages.Create(Self);
  FCells := TxlsCells.Create(Self);
  FMergedCells := TxlsMergedCellList.Create(Self);
end;

destructor TQExportXLSOptions.Destroy;
begin
  FHeaderFormat.Free;
  FCaptionFormat.Free;
  FDataFormat.Free;
  FAggregateFormat.Free;
  FFooterFormat.Free;
  FHyperlinkFormat.Free;
  FNoteFormat.Free;

  FFieldFormats.Free;
  FStripStyles.Free;
  FHyperlinks.Free;
  FNotes.Free;
  FCharts.Free;
  FPictures.Free;
  FImages.Free;
  FCells.Free;
  FMergedCells.Free;
  inherited;
end;

procedure TQExportXLSOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportXLSOptions then begin
    AutoCalcColWidth := (Source as TQExportXLSOptions).AutoCalcColWidth;
    PageHeader := (Source as TQExportXLSOptions).PageHeader;
    PageFooter := (Source as TQExportXLSOptions).PageFooter;
    SheetTitle := (Source as TQExportXLSOptions).SheetTitle;

    HeaderFormat := (Source as TQExportXLSOptions).HeaderFormat;
    CaptionFormat := (Source as TQExportXLSOptions).CaptionFormat;
    DataFormat := (Source as TQExportXLSOptions).DataFormat;
    AggregateFormat := (Source as TQExportXLSOptions).AggregateFormat;
    FooterFormat := (Source as TQExportXLSOptions).FooterFormat;
    HyperlinkFormat := (Source as TQExportXLSOptions).HyperlinkFormat;
    NoteFormat := (Source as TQExportXLSOptions).NoteFormat;

    FieldFormats := (Source as TQExportXLSOptions).FieldFormats;
    StripStyles := (Source as TQExportXLSOptions).StripStyles;
    StripType := (Source as TQExportXLSOptions).StripType;
    Hyperlinks := (Source as TQExportXLSOptions).Hyperlinks;
    Notes := (Source as TQExportXLSOptions).Notes;
    Charts := (Source as TQExportXLSOptions).Charts;
    Pictures := (Source as TQExportXLSOptions).Pictures;
    Images := (Source as TQExportXLSOptions).Images;
    Cells := (Source as TQExportXLSOptions).Cells;
    MergedCells := (Source as TQExportXLSOptions).MergedCells;

    Exit;
  end;
  inherited;
end;

function TQExportXLSOptions.IsPageHeader: Boolean;
begin
  Result := FPageHeader <> EmptyStr;
end;

function TQExportXLSOptions.IsPageFooter: Boolean;
begin
  Result := FPageFooter <> EmptyStr;
end;

procedure TQExportXLSOptions.SetSheetTitle(const Value: string);
begin
  if FSheetTitle <> Value then
    if Value <> EmptyStr
      then FSheetTitle := Value
      else FSheetTitle := 'Sheet1';
end;

procedure TQExportXLSOptions.SetHeaderFormat(const Value: TxlsFormat);
begin
  FHeaderFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetCaptionFormat(const Value: TxlsFormat);
begin
  FCaptionFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetDataFormat(const Value: TxlsFormat);
begin
  FDataFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetAggregateFormat(const Value: TxlsFormat);
begin
  FAggregateFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetFooterFormat(const Value: TxlsFormat);
begin
  FFooterFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetFieldFormats(const Value: TxlsFieldFormats);
begin
  FFieldFormats.Assign(Value);
end;

procedure TQExportXLSOptions.SetStripStyles(const Value: TxlsFormats);
begin
  FStripStyles.Assign(Value);
end;

procedure TQExportXLSOptions.SetHyperlinks(const Value: TxlsHyperlinks);
begin
  FHyperlinks.Assign(Value);
end;

procedure TQExportXLSOptions.SetNotes(const Value: TxlsNotes);
begin
  FNotes.Assign(Value);
end;

procedure TQExportXLSOptions.SetCharts(const Value: TxlsCharts);
begin
  FCharts.Assign(Value);
end;

procedure TQExportXLSOptions.SetHyperlinkFormat(const Value: TxlsFormat);
begin
  FHyperlinkFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetNoteFormat(const Value: TxlsNoteFormat);
begin
  FNoteFormat.Assign(Value);
end;

procedure TQExportXLSOptions.SetPictures(const Value: TxlsPictures);
begin
  FPictures.Assign(Value);
end;

procedure TQExportXLSOptions.SetImages(const Value: TxlsImages);
begin
  FImages.Assign(Value);
end;

procedure TQExportXLSOptions.SetCells(const Value: TxlsCells);
begin
  FCells.Assign(Value);
end;

procedure TQExportXLSOptions.SetMergedCells(const Value: TxlsMergedCellList);
begin
  FMergedCells.Assign(Value);
end;

end.
