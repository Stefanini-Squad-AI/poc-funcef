unit QExport3Clipboard;

{$I VerCtrl.inc}

interface

uses QExport3, Classes;

const
  SDefaultViewer = 'Clipbrd.exe';

type
  TQClipboardExportType = (etSeparated, etFixed);

  TQExport3Clipboard = class(TQExport3Memory)
  private
    FSeparator: Char;
    FSpacing: Integer;
    FClipboardViewer: string;
    FExportType: TQClipboardExportType;
    procedure SetExportType(const Value: TQClipboardExportType);
  protected
    procedure BeginExport; override;
    procedure EndExport; override;
    function GetColCaption(Index: integer): string; override;
    function GetColData(ExportCol: TQExportCol): string; override;
    procedure WriteDataRow; override;
    procedure WriteCaptionRow; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ExportType: TQClipboardExportType read FExportType write SetExportType
      default etSeparated;
    property Separator: Char read FSeparator write FSeparator;
    property Spacing: Integer read FSpacing write FSpacing default 2;
    property ClipboardViewer: string read FClipboardViewer write FClipboardViewer;

    property Header;
    property Footer;
    property AllowCaptions;
    property Captions;
    property Formats;
    property UserFormats;

    property OnFetchedRecord;
  end;


implementation

uses SysUtils, QExport3Common
     {$IFDEF WIN32}
       , ClipBrd, Windows
     {$ENDIF}
     {$IFDEF LINUX}
       {$IFNDEF NOGUI}, QClipbrd{$ENDIF}
     {$ENDIF};

{ TQExport3Clipboard }

procedure TQExport3Clipboard.BeginExport;
begin
  inherited;
  AutoCalcColWidth := FExportType = etFixed;
  if Title <> EmptyStr then GetWriter.WriteLn(Title);
  if Header.Text <> EmptyStr then GetWriter.WriteLn(Header.Text);
end;

constructor TQExport3Clipboard.Create(AOwner: TComponent);
begin
  inherited;
  FExportType := etSeparated;
  FSeparator := GetListSeparator;
  FSpacing := 2;
  FClipboardViewer := SDefaultViewer;
end;

procedure TQExport3Clipboard.EndExport;
begin
  if Footer.Text <> EmptyStr then GetWriter.WriteLn(Footer.Text);
  inherited;
end;

function TQExport3Clipboard.GetColCaption(Index: integer): string;
begin
  Result := inherited GetColCaption(Index);
  if FExportType = etSeparated then Result := Result + FSeparator
  else Result := GetWriter.PadL(Result, ' ', Columns[Index].Width);
end;

function TQExport3Clipboard.GetColData(ExportCol: TQExportCol): string;
begin
  Result := inherited GetColData(ExportCol);
  if FExportType = etSeparated then Result := Result + FSeparator
  else Result := GetWriter.PadL(Result, ' ', Columns[ExportCol.ColumnIndex].Width);
end;

procedure TQExport3Clipboard.SetExportType(const Value: TQClipboardExportType);
begin
  FExportType := Value;
  AutoCalcColWidth :=  FExportType = etFixed; 
end;

procedure TQExport3Clipboard.WriteCaptionRow;
begin
  GetWriter.WriteLn(GetCaptionRow);
end;

procedure TQExport3Clipboard.WriteDataRow;
begin
  GetWriter.WriteLn(GetDataRow(true));
end;

end.
