unit TXComp;

interface

uses
  Classes, TXtraDev, Graphics;

type
  THTMLControlOptions = class(TPersistent)
  private
    function GetBackLink: String;
    function GetForwardLink: String;
    function GetPixelFormat: TPixelFormat;
    function GetUseTextFileName: Boolean;
    function GetVisible: Boolean;
    function GetZoomableImages: Boolean;
    procedure SetBackLink(const Value: String);
    procedure SetForwardLink(const Value: String);
    procedure SetPixelFormat(const Value: TPixelFormat);
    procedure SetUseTextFileName(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure SetZoomableImages(const Value: Boolean);
    function GetShowLinks: Boolean;
    procedure SetShowLinks(const Value: Boolean);
  published
    property BackLink: String read GetBackLink write SetBackLink;
    property ForwardLink: String read GetForwardLink write SetForwardLink;
    property ShowLinks: Boolean read GetShowLinks write SetShowLinks;
    property UseTextFileName: Boolean read GetUseTextFileName write SetUseTextFileName;
    property ZoomableImages: Boolean read GetZoomableImages write SetZoomableImages;
    property PixelFormat: TPixelFormat read GetPixelFormat write SetPixelFormat;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TCSS2ControlOptions = class(TPersistent)
  private
    function GetBackLink: String;
    function GetForwardLink: String;
    function GetPixelFormat: TPixelFormat;
    function GetUseTextFileName: Boolean;
    function GetVisible: Boolean;
    function GetZoomableImages: Boolean;
    procedure SetBackLink(const Value: String);
    procedure SetForwardLink(const Value: String);
    procedure SetPixelFormat(const Value: TPixelFormat);
    procedure SetUseTextFileName(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure SetZoomableImages(const Value: Boolean);
    function GetShowLinks: Boolean;
    procedure SetShowLinks(const Value: Boolean);
  published
    property BackLink: String read GetBackLink write SetBackLink;
    property ForwardLink: String read GetForwardLink write SetForwardLink;
    property ShowLinks: Boolean read GetShowLinks write SetShowLinks;
    property UseTextFileName: Boolean read GetUseTextFileName write SetUseTextFileName;
    property ZoomableImages: Boolean read GetZoomableImages write SetZoomableImages;
    property Visible: Boolean read GetVisible write SetVisible;
    property PixelFormat: TPixelFormat read GetPixelFormat write SetPixelFormat;
  end;

  TRTFControlOptions = class(TPersistent)
  private
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
  published
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TWK1ControlOptions = class(TPersistent)
  private
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
  published
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TWQ1ControlOptions = class(TPersistent)
  private
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
  published
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TXLSControlOptions = class(TPersistent)
  private
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
  published
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TPDFControlOptions = class(TPersistent)
  private
    function GetCompressImages: Boolean;
    function GetCreator: String;
    procedure SetAuthor(const Value: String);
    procedure SetCompressImages(const Value: Boolean);
    procedure SetCreator(const Value: String);
    procedure SetKeyWords(const Value: String);
    procedure SetScaleImages(const Value: Boolean);
    procedure SetSubject(const Value: String);
    procedure SetTitle(const Value: String);
    function GetAuthor: String;
    function GetKeywords: String;
    function GetScaleImages: Boolean;
    function GetSubject: String;
    function GetTitle: String;
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
    function GetFastCompression: Boolean;
    procedure SetFastCompression(const Value: Boolean);
  published
    property Creator: String read GetCreator write SetCreator;
    property Title: String read GetTitle write SetTitle;
    property Author: String read GetAuthor write SetAuthor;
    property Keywords: String read GetKeywords write SetKeyWords;
    property Subject: String read GetSubject write SetSubject;
    property FastCompression: Boolean read GetFastCompression write SetFastCompression;
    property CompressImages: Boolean read GetCompressImages write SetCompressImages;
    property ScaleImages: Boolean read GetScaleImages write SetScaleImages;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TGraphicControlOptions = class(TPersistent)
  private
    function GetPixelFormat: TPixelFormat;
    function GetUseTextFileName: Boolean;
    function GetVisible: Boolean;
    procedure SetPixelFormat(const Value: TPixelFormat);
    procedure SetUseTextFileName(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
  published
    property PixelFormat: TPixelFormat read GetPixelFormat write SetPixelFormat;
    property UseTextFileName: Boolean read GetUseTextFileName write SetUseTextFileName;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  TExtraOptions = class(TComponent)
  private
    FPDF: TPDFControlOptions;
    FHTML: THTMLControlOptions;
    FCSS2: TCSS2ControlOptions;
    FRTF: TRTFControlOptions;
    FLotus: TWK1ControlOptions;
    FQuattro: TWQ1ControlOptions;
    FExcel: TXLSControlOptions;
    FGraphic: TGraphicControlOptions;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property HTML: THTMLControlOptions read FHTML write FHTML;
    property CSS2: TCSS2ControlOptions read FCSS2 write FCSS2;
    property RTF: TRTFControlOptions read FRTF write FRTF;
    property Lotus: TWK1ControlOptions read FLotus write FLotus;
    property Quattro: TWQ1ControlOptions read FQuattro write FQuattro;
    property Excel: TXLSControlOptions read FExcel write FExcel;
    property Graphic: TGraphicControlOptions read FGraphic write FGraphic;
    property PDF: TPDFControlOptions read FPDF write FPDF;
  end;

  procedure Register;

implementation

{ TExtraOptions }

constructor TExtraOptions.Create(AOwner: TComponent);
begin
  inherited;
  FHTML    := THTMLControlOptions.Create;
  FCSS2    := TCSS2ControlOptions.Create;
  FRTF     := TRTFControlOptions.Create;
  FPDF     := TPDFControlOptions.Create;
  FLotus   := TWK1ControlOptions.Create;
  FExcel   := TXLSControlOptions.Create;
  FQuattro := TWQ1ControlOptions.Create;
  FGraphic := TGraphicControlOptions.Create;
end;

destructor TExtraOptions.Destroy;
begin
  FHTML.Free;
  FCSS2.Free;
  FRTF.Free;
  FPDF.Free;
  FLotus.Free;
  FExcel.Free;
  FQuattro.Free;
  FGraphic.Free;
  inherited;
end;

procedure Register;
begin
  RegisterComponents('RBuilder', [TExtraOptions]);
end;

{ TPDFControlOptions }

function TPDFControlOptions.GetAuthor: String;
begin
  Result := ExtraDevices.PDF.Author;
end;

function TPDFControlOptions.GetCompressImages: Boolean;
begin
  Result := ExtraDevices.PDF.CompressImages;
end;

function TPDFControlOptions.GetCreator: String;
begin
  Result := ExtraDevices.PDF.Creator;
end;

function TPDFControlOptions.GetFastCompression: Boolean;
begin
  Result := ExtraDevices.PDF.FastCompression;
end;

function TPDFControlOptions.GetKeywords: String;
begin
  Result := ExtraDevices.PDF.Keywords;
end;

function TPDFControlOptions.GetScaleImages: Boolean;
begin
  Result := ExtraDevices.PDF.ScaleImages;
end;

function TPDFControlOptions.GetSubject: String;
begin
  Result := ExtraDevices.PDF.Subject;
end;

function TPDFControlOptions.GetTitle: String;
begin
  Result := ExtraDevices.PDF.Title;
end;

function TPDFControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.PDF.Visible;
end;

procedure TPDFControlOptions.SetAuthor(const Value: String);
begin
  ExtraDevices.PDF.Author := Value;
end;

procedure TPDFControlOptions.SetCompressImages(const Value: Boolean);
begin
  ExtraDevices.PDF.CompressImages := Value;
end;

procedure TPDFControlOptions.SetCreator(const Value: String);
begin
  ExtraDevices.PDF.Creator := Value;
end;

procedure TPDFControlOptions.SetFastCompression(const Value: Boolean);
begin
  ExtraDevices.PDF.FastCompression := Value;
end;

procedure TPDFControlOptions.SetKeyWords(const Value: String);
begin
  ExtraDevices.PDF.Keywords := Value;
end;

procedure TPDFControlOptions.SetScaleImages(const Value: Boolean);
begin
  ExtraDevices.PDF.ScaleImages := Value;
end;

procedure TPDFControlOptions.SetSubject(const Value: String);
begin
  ExtraDevices.PDF.Subject := Value;
end;

procedure TPDFControlOptions.SetTitle(const Value: String);
begin
  ExtraDevices.PDF.Title := Value;
end;

procedure TPDFControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.PDF.Visible := Value;
end;

{ TXLSControlOptions }

function TXLSControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.Excel.Visible;
end;

procedure TXLSControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.Excel.Visible := Value;
end;

{ TWK1ControlOptions }

function TWK1ControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.Lotus.Visible;
end;

procedure TWK1ControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.Lotus.Visible := Value;
end;

{ THTMLControlOptions }

function THTMLControlOptions.GetBackLink: String;
begin
  Result := ExtraDevices.HTML.BackLink;
end;

function THTMLControlOptions.GetForwardLink: String;
begin
  Result := ExtraDevices.HTML.ForwardLink;
end;

function THTMLControlOptions.GetPixelFormat: TPixelFormat;
begin
  Result := ExtraDevices.HTML.PixelFormat;
end;

function THTMLControlOptions.GetShowLinks: Boolean;
begin
  Result := ExtraDevices.HTML.ShowLinks;
end;

function THTMLControlOptions.GetUseTextFileName: Boolean;
begin
  Result := ExtraDevices.HTML.UseTextFileName;
end;

function THTMLControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.HTML.Visible;
end;

function THTMLControlOptions.GetZoomableImages: Boolean;
begin
  Result := ExtraDevices.HTML.ZoomableImages;
end;

procedure THTMLControlOptions.SetBackLink(const Value: String);
begin
  ExtraDevices.HTML.BackLink := Value;
end;

procedure THTMLControlOptions.SetForwardLink(const Value: String);
begin
  ExtraDevices.HTML.ForwardLink := Value;
end;

procedure THTMLControlOptions.SetPixelFormat(const Value: TPixelFormat);
begin
  ExtraDevices.HTML.PixelFormat := Value;
end;

procedure THTMLControlOptions.SetShowLinks(const Value: Boolean);
begin
  ExtraDevices.HTML.ShowLinks := Value;
end;

procedure THTMLControlOptions.SetUseTextFileName(const Value: Boolean);
begin
  ExtraDevices.HTML.UseTextFileName := Value;
end;

procedure THTMLControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.HTML.Visible := Value;
end;

procedure THTMLControlOptions.SetZoomableImages(const Value: Boolean);
begin
  ExtraDevices.HTML.ZoomableImages := Value;
end;

{ TCSS2ControlOptions }

function TCSS2ControlOptions.GetBackLink: String;
begin
  Result := ExtraDevices.CSS2.BackLink;
end;

function TCSS2ControlOptions.GetForwardLink: String;
begin
  Result := ExtraDevices.CSS2.ForwardLink;
end;

function TCSS2ControlOptions.GetPixelFormat: TPixelFormat;
begin
  Result := ExtraDevices.CSS2.PixelFormat;
end;

function TCSS2ControlOptions.GetShowLinks: Boolean;
begin
  Result := ExtraDevices.CSS2.ShowLinks;
end;

function TCSS2ControlOptions.GetUseTextFileName: Boolean;
begin
  Result := ExtraDevices.CSS2.UseTextFileName;
end;

function TCSS2ControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.CSS2.Visible;
end;

function TCSS2ControlOptions.GetZoomableImages: Boolean;
begin
  Result := ExtraDevices.CSS2.ZoomableImages;
end;

procedure TCSS2ControlOptions.SetBackLink(const Value: String);
begin
  ExtraDevices.CSS2.BackLink := Value;
end;

procedure TCSS2ControlOptions.SetForwardLink(const Value: String);
begin
  ExtraDevices.CSS2.ForwardLink := Value;
end;

procedure TCSS2ControlOptions.SetPixelFormat(const Value: TPixelFormat);
begin
  ExtraDevices.CSS2.PixelFormat := Value;
end;

procedure TCSS2ControlOptions.SetShowLinks(const Value: Boolean);
begin
  ExtraDevices.CSS2.ShowLinks := Value;
end;

procedure TCSS2ControlOptions.SetUseTextFileName(const Value: Boolean);
begin
  ExtraDevices.CSS2.UseTextFileName := Value;
end;

procedure TCSS2ControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.CSS2.Visible := Value;
end;

procedure TCSS2ControlOptions.SetZoomableImages(const Value: Boolean);
begin
  ExtraDevices.CSS2.ZoomableImages := Value;
end;

{ TRTFControlOptions }

function TRTFControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.RTF.Visible;
end;

procedure TRTFControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.RTF.Visible := Value;
end;

{ TWQ1ControlOptions }

function TWQ1ControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.Quattro.Visible;
end;

procedure TWQ1ControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.Quattro.Visible := Value;
end;

{ TGraphicControlOptions }

function TGraphicControlOptions.GetPixelFormat: TPixelFormat;
begin
  Result := ExtraDevices.Graphic.PixelFormat;
end;

function TGraphicControlOptions.GetUseTextFileName: Boolean;
begin
  Result := ExtraDevices.Graphic.UseTextFileName;
end;

function TGraphicControlOptions.GetVisible: Boolean;
begin
  Result := ExtraDevices.Graphic.Visible;
end;

procedure TGraphicControlOptions.SetPixelFormat(const Value: TPixelFormat);
begin
  ExtraDevices.Graphic.PixelFormat := Value;
end;

procedure TGraphicControlOptions.SetUseTextFileName(const Value: Boolean);
begin
  ExtraDevices.Graphic.UseTextFileName := Value;
end;

procedure TGraphicControlOptions.SetVisible(const Value: Boolean);
begin
  ExtraDevices.Graphic.Visible := Value;
end;

end.
