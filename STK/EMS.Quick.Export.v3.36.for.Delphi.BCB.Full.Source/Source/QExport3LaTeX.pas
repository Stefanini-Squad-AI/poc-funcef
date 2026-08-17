unit QExport3LaTeX;

interface

uses QExport3, Classes;

type
  TQLaTeXWriter = class(TQExportWriter)
  public
    procedure UsePackage(const APackage, Options: string);
    procedure NewLine;
    procedure HLine;
    procedure BeginEnv(const Environment, Params: string);
    procedure EndEnv(const Environment: string);
  end;

  TLaTeXVersion = (LaTeX209, LaTeX2e);
  TLaTeXDocStyle = (dsArticle, dsBook);

  TLaTeXOptions = class(TPersistent)
  private
    FDocumentStyle: TLaTeXDocStyle;
    FDocumentParams: string;
    FLaTeXVersion: TLaTeXVersion;
    FLanguages: string;
    FCodePage: integer;

    procedure SetCodePage(const Value: integer);
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property LaTeXVersion: TLaTeXVersion read FLaTeXVersion write FLaTeXVersion default LaTex2e;
    property DocumentStyle: TLaTeXDocStyle read FDocumentStyle write FDocumentStyle default dsArticle;
    property DocumentParams : string read FDocumentParams write FDocumentParams;
    property CodePage: integer read FCodePage write SetCodePage;
    property Languages : string read FLanguages write FLanguages;
  end;

  TQExport3LaTeX = class(TQExport3FormatText)
  private
    FOptions: TLaTeXOptions;
    FPreambula: TStrings;
    procedure SetOptions(const Value: TLaTeXOptions);
    procedure SetPreambula(const Value: TStrings);
  protected
    procedure WriteDataRow; override;
    function GetDataRow(NeedFormat: boolean): string; override;
    function GetColData(ExportCol: TQExportCol): string; override;
    function GetColCaption(Index: integer): string; override;
    function GetCaptionRow: string; override;
    procedure WriteCaptionRow; override;
    function GetSpecialCharacters: TSpecialCharacters; override;

    function GetWriter: TQLaTeXWriter;
    function GetWriterClass: TQExportWriterClass; override;

    procedure BeginExport; override;
    procedure EndExport; override;

    function StyleToStr(Value: TLaTeXDocStyle): string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Abort; override;
    function NormalString(const S: string): string; override;
  published
    property Options: TLaTeXOptions read FOptions write SetOptions;
    property Preambula: TStrings read FPreambula write SetPreambula;
  end;

implementation

uses SysUtils{$IFDEF WIN32}, Windows{$ENDIF};

{ TQLaTeXWriter }

procedure TQLaTeXWriter.BeginEnv(const Environment, Params: string);
var
  s: string;
begin
  s := '\begin' + '{' + Environment + '}';
  if Params <> EmptyStr then s := s + '{' + Params + '}';
  WriteLn(s);
end;

procedure TQLaTeXWriter.EndEnv(const Environment: string);
begin
  WriteLn('\end' + '{' + Environment + '}');
end;

procedure TQLaTeXWriter.HLine;
begin
  WriteLn('\hline');
end;

procedure TQLaTeXWriter.NewLine;
begin
  WriteLn('\\');
end;

procedure TQLaTeXWriter.UsePackage(const APackage, Options: string);
begin
  WriteLn('\usepackage' + '[' + Options + ']' + '{' + APackage + '}');
end;

{ TQExport3LaTeX }

procedure TQExport3LaTeX.WriteDataRow;
begin
  GetWriter.WriteLn(GetDataRow(true));
  GetWriter.NewLine;
  GetWriter.HLine;
end;

function TQExport3LaTeX.NormalString(const S: string): string;
var
  j: integer;
begin
  Result := '';
  for j := 1 to Length(S) do
    if (S[j] in GetSpecialCharacters) then
      if S[j] = '\' then Result := Result + '\backslash'
      else Result := Result + '\' + S[j]
    else
      case S[j] of
       '>': Result := Result + '$>$';
       '<': Result := Result + '$<$';
      else Result := Result + S[j];
      end;
end;

procedure TQExport3LaTeX.BeginExport;
var
  s: string;
  i: integer;
begin
  inherited;
  with FOptions do begin
    s := DocumentParams;
    if FOptions.LaTeXVersion = LaTeX209 then begin
      if s <> EmptyStr then
        GetWriter.WriteLn('\documentstyle' + '[' + s + ']' + '{' + StyleToStr(DocumentStyle) + '}')
      else GetWriter.WriteLn('\documentstyle' + '{' + StyleToStr(DocumentStyle) + '}');
    end
    else begin
      if s <> EmptyStr then
        GetWriter.WriteLn('\documentclass' + '[' + s + ']' + '{' + StyleToStr(DocumentStyle) + '}')
      else GetWriter.WriteLn('\documentclass' + '{' + StyleToStr(DocumentStyle) + '}');
      GetWriter.UsePackage('inputenc', 'cp' + IntToStr(CodePage));
      GetWriter.UsePackage('babel', Languages);
      if FPreambula.Count > 0 then begin
        for i := 0 to FPreambula.Count - 1 do GetWriter.WriteLn(FPreambula[i]);
        GetWriter.EmptyLine;
      end;
    end;
  end;

  GetWriter.BeginEnv('document', '');
  if Pos('RUSSIAN', UpperCase(FOptions.Languages)) > 0 then GetWriter.WriteLn('\Rus');
  GetWriter.EmptyLine;
  for i := 0 to Header.Count - 1 do GetWriter.WriteLn(Header[i]);
  GetWriter.WriteLn('\par\bigskip');

  s := '|';
  for i := 0 to Columns.Count - 1 do
    if Columns[i].IsNumeric then s := s + 'r' + '|'
    else s := s + 'l' + '|';
  GetWriter.BeginEnv('tabular', s);
  GetWriter.HLine;
end;

procedure TQExport3LaTeX.SetOptions(const Value: TLaTeXOptions);
begin
  FOptions.Assign(Value);
end;

constructor TQExport3LaTeX.Create(AOwner: TComponent);
begin
  inherited;
  FOptions := TLaTeXOptions.Create;
  FPreambula := TStringList.Create;
end;

destructor TQExport3LaTeX.Destroy;
begin
  FPreambula.Free;
  FOptions.Free;
  inherited;
end;

procedure TQExport3LaTeX.SetPreambula(const Value: TStrings);
begin
  FPreambula.Assign(Value);
end;

procedure TQExport3LaTeX.EndExport;
var
  i: integer;
begin
  GetWriter.EndEnv('tabular');
  GetWriter.EmptyLine;
  for i := 0 to Footer.Count-1 do GetWriter.Writeln(Footer[i]);
  GetWriter.EndEnv('document');
  inherited;
end;

function TQExport3LaTeX.GetColData(ExportCol: TQExportCol): string;
begin
  Result := inherited GetColData(ExportCol);
  Result := Result + ' & ';
end;

function TQExport3LaTeX.GetDataRow(NeedFormat: boolean): string;
begin
  Result := inherited GetDataRow(NeedFormat);
  Delete(Result, Length(Result) - 2, 3);
end;

function TQExport3LaTeX.GetColCaption(Index: integer): string;
begin
  Result := inherited GetColCaption(Index);
  Result := Result + ' & ';
end;

function TQExport3LaTeX.GetCaptionRow: string;
begin
  Result := inherited GetCaptionRow;
  Delete(Result, Length(Result) - 2, 3);
end;

procedure TQExport3LaTeX.WriteCaptionRow;
begin
  GetWriter.WriteLn(GetCaptionRow);
  GetWriter.NewLine;
  GetWriter.HLine;
end;

function TQExport3LaTeX.GetSpecialCharacters: TSpecialCharacters;
begin
  Result := ['#', '$', '%', '&', '~', '_', '^', '\', '{', '}'];
end;

function TQExport3LaTeX.GetWriter: TQLaTeXWriter;
begin
  Result := TQLaTeXWriter(inherited GetWriter);
end;

function TQExport3LaTeX.GetWriterClass: TQExportWriterClass;
begin
  Result := TQLaTeXWriter;
end;

function TQExport3LaTeX.StyleToStr(Value: TLaTeXDocStyle): string;
begin
  case Value of
    dsArticle: Result := 'article';
    dsBook: Result := 'book';
    else Result := EmptyStr;
  end;
end;

procedure TQExport3LaTeX.Abort;
begin
  GetWriter.HLine;
  GetWriter.EndEnv('tabular');
  GetWriter.EmptyLine;
  GetWriter.EndEnv('document');
  inherited;
end;

{ TLaTeXOptions }

procedure TLaTeXOptions.Assign(Source: TPersistent);
begin
  if Source is TLaTeXOptions then begin
    DocumentStyle := (Source as TLaTeXOptions).DocumentStyle;
    DocumentParams := (Source as TLaTeXOptions).DocumentParams;
    LaTeXVersion := (Source as TLaTeXOptions).LaTeXVersion;
    Languages := (Source as TLaTeXOptions).Languages;
    CodePage := (Source as TLaTeXOptions).CodePage;
    Exit;
  end;
  inherited;
end;

constructor TLaTeXOptions.Create;
begin
  inherited Create;
  FLaTeXVersion := LaTeX2e;
  FDocumentStyle := dsArticle;
  {$IFDEF WIN32}
  FCodePage := GetACP;
  {$ENDIF}
  FDocumentParams := 'a4paper';
  FLanguages := 'english';
end;

procedure TLaTeXOptions.SetCodePage(const Value: integer);
begin
  if FCodePage <> Value then FCodePage := Value;
  {$IFDEF WIN32} if FCodePage <= 0 then  FCodePage := GetACP;{$ENDIF}
end;

end.
