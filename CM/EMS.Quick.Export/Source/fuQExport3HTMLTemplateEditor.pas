unit fuQExport3HTMLTemplateEditor;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QExport3HTML, Buttons, StdCtrls, ExtCtrls, IniFiles;

type
  TfmQExport3HTMLTemplateEditor = class(TForm)
    Panel1: TPanel;
    ColorDialog: TColorDialog;
    btStart: TBitBtn;
    btCancel: TBitBtn;
    sdTemplate: TSaveDialog;
    odTemplate: TOpenDialog;
    sohoLabel17: TLabel;
    HTMLPanel: TPanel;
    sohoLabel6: TLabel;
    BackPanel: TPanel;
    lbHTMLDefaultText: TLabel;
    lbHTMLLink: TLabel;
    lbHTMLVLink: TLabel;
    lbHTMLALink: TLabel;
    Panel2: TPanel;
    ColHead1: TPanel;
    Head1: TLabel;
    ColHead2: TPanel;
    Head2: TLabel;
    ColHead3: TPanel;
    Head3: TLabel;
    Row1: TPanel;
    Data1: TLabel;
    Row2: TPanel;
    Data5: TLabel;
    Row3: TPanel;
    Data9: TLabel;
    OddRow3: TPanel;
    Data10: TLabel;
    OddRow2: TPanel;
    Data6: TLabel;
    OddRow1: TPanel;
    Data2: TLabel;
    Row4: TPanel;
    Data3: TLabel;
    Row5: TPanel;
    Data7: TLabel;
    Row6: TPanel;
    Data11: TLabel;
    OddRow6: TPanel;
    Data12: TLabel;
    OddRow5: TPanel;
    Data8: TLabel;
    OddRow4: TPanel;
    Data4: TLabel;
    cbxTemplate: TComboBox;
    btSaveTemplate: TBitBtn;
    btLoadTemplate: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cbxTemplateChange(Sender: TObject);
    procedure btCancelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BackPanelClick(Sender: TObject);
    procedure Row1Click(Sender: TObject);
    procedure OddRow1Click(Sender: TObject);
    procedure ColHead1Click(Sender: TObject);
    procedure Head3Click(Sender: TObject);
    procedure btSaveTemplateClick(Sender: TObject);
    procedure btLoadTemplateClick(Sender: TObject);
    procedure lbHTMLDefaultTextClick(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTemplate: THTMLTemplate;
    FTextFontName: string;
    FHeadersRowBgColor: TColor;
    FALinkColor: TColor;
    FHeadersRowFontColor: TColor;
    FOddRowBgColor: TColor;
    FLinkColor: TColor;
    FBackGroundColor: TColor;
    FTableFontColor: TColor;
    FTableBgColor: TColor;
    FDefaultTextColor: TColor;
    FVLinkColor: TColor;
    procedure SetCustomTemplate;
    procedure SetTemplate(const Value: THTMLTemplate);
    procedure SetALinkColor(const Value: TColor);
    procedure SetBackGroundColor(const Value: TColor);
    procedure SetDefaultTextColor(const Value: TColor);
    procedure SetHeadersRowBgColor(const Value: TColor);
    procedure SetHeadersRowFontColor(const Value: TColor);
    procedure SetLinkColor(const Value: TColor);
    procedure SetOddRowBgColor(const Value: TColor);
    procedure SetTableBgColor(const Value: TColor);
    procedure SetTableFontColor(const Value: TColor);
    procedure SetTextFontName(const Value: string);
    procedure SetVLinkColor(const Value: TColor);
  private
    TemplateFile: TIniFile;
  public
    { Public declarations }
     property Template: THTMLTemplate read FTemplate write SetTemplate;
     property BackGroundColor: TColor read FBackGroundColor write SetBackGroundColor;
     property DefaultTextColor: TColor read FDefaultTextColor write SetDefaultTextColor;
     property TextFontName: string read FTextFontName write SetTextFontName;
     property LinkColor: TColor read FLinkColor write SetLinkColor;
     property VLinkColor: TColor read FVLinkColor write SetVLinkColor;
     property ALinkColor: TColor read FALinkColor write SetALinkColor;
     property HeadersRowBgColor: TColor read FHeadersRowBgColor write SetHeadersRowBgColor;
     property HeadersRowFontColor: TColor read FHeadersRowFontColor write SetHeadersRowFontColor;
     property TableBgColor: TColor read FTableBgColor write SetTableBgColor;
     property TableFontColor: TColor read FTableFontColor write SetTableFontColor;
     property OddRowBgColor: TColor read FOddRowBgColor write SetOddRowBgColor;
  end;

var
  fmQExport3HTMLTemplateEditor: TfmQExport3HTMLTemplateEditor;

implementation

uses QExport3HTMLTemplates;

{$R *.DFM}


procedure TfmQExport3HTMLTemplateEditor.FormShow(Sender: TObject);
begin
  cbxTemplate.ItemIndex := Integer(Template);
  cbxTemplateChange(nil);
end;


procedure TfmQExport3HTMLTemplateEditor.cbxTemplateChange(Sender: TObject);
begin
  Template := THTMLTemplate(cbxTemplate.ItemIndex);
end;

procedure TfmQExport3HTMLTemplateEditor.btCancelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then btCancel.Click;
end;

procedure TfmQExport3HTMLTemplateEditor.BackPanelClick(Sender: TObject);
begin
  ColorDialog.Color := BackGroundColor;
  if ColorDialog.Execute then begin
    BackGroundColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.Row1Click(Sender: TObject);
begin
  ColorDialog.Color := (Sender as TPanel).Color;
  if ColorDialog.Execute then begin
    TableBgColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.OddRow1Click(Sender: TObject);
begin
  ColorDialog.Color := (Sender as TPanel).Color;
  if ColorDialog.Execute then begin
    OddRowBgColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.ColHead1Click(Sender: TObject);
begin
  ColorDialog.Color := (Sender as TPanel).Color;
  if ColorDialog.Execute then begin
    HeadersRowBgColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.Head3Click(Sender: TObject);
begin
  ColorDialog.Color := (Sender as TLabel).Font.Color;
  if ColorDialog.Execute then begin
    HeadersRowFontColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.Data1Click(Sender: TObject);
begin
  ColorDialog.Color := Data1.Font.Color;
  if ColorDialog.Execute then begin
    TableFontColor := ColorDialog.Color;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetCustomTemplate;
begin
  cbxTemplate.ItemIndex := 0;
  Template := htCustom;
end;

procedure TfmQExport3HTMLTemplateEditor.btSaveTemplateClick(Sender: TObject);
begin
  if sdTemplate.Execute then begin
    TemplateFile := TIniFile.Create(sdTemplate.FileName);
    try
      with TemplateFile do begin
      // Body options
        WriteString('HTML options', 'Background-color', ColorToString(BackgroundColor));
        WriteString('HTML options', 'Font-color', ColorToString(DefaultTextColor));
        WriteString('HTML options', 'Font-family', TextFontName);
        WriteString('HTML options', 'LinkColor', ColorToString(LinkColor));
        WriteString('HTML options', 'VLinkColor', ColorToString(VLinkColor));
        WriteString('HTML options', 'ALinkColor', ColorToString(ALinkColor));
        // Table options
        WriteString('Table options', 'Header-bgcolor', ColorToString(HeadersRowBgColor));
        WriteString('Table options', 'Header-color', ColorToString(HeadersRowFontColor));
        WriteString('Table options', 'Table-color', ColorToString(TableFontColor));
        WriteString('Table options', 'Even_row-bgcolor', ColorToString(TableBgColor));
        WriteString('Table options', 'Odd_row-bgcolor', ColorToString(OddRowBgColor));
      end;
    finally
      TemplateFile.Free;
    end;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.btLoadTemplateClick(Sender: TObject);
begin
  if odTemplate.Execute then begin
    TemplateFile := TIniFile.Create(odTemplate.FileName);
    try
      with TemplateFile do begin
        BackgroundColor := ReadInteger('HTML options', 'Background-color',
          BackgroundColor);
        DefaultTextColor := ReadInteger('HTML options', 'Font-color',
           DefaultTextColor);
        TextFontName := ReadString ('HTML options', 'Font-family', TextFontName);
        LinkColor := ReadInteger('HTML options', 'LinkColor', LinkColor);
        VLinkColor := ReadInteger('HTML options', 'VLinkColor', VLinkColor);
        ALinkColor := ReadInteger('HTML options', 'ALinkColor', ALinkColor);
        // Table options
        HeadersRowBgColor := ReadInteger('Table options', 'Header-bgcolor',
          HeadersRowBgColor);
        HeadersRowFontColor := ReadInteger('Table options', 'Header-color',
          HeadersRowFontColor);
        TableFontColor := ReadInteger('Table options', 'Table-color',
          TableFontColor);
        TableBgColor := ReadInteger('Table options', 'Even_row-bgcolor',
          TableBgColor);
        OddRowBgColor := ReadInteger('Table options', 'Odd_row-bgcolor',
          OddRowBgColor);
      end;
    finally
      TemplateFile.Free;
    end;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.lbHTMLDefaultTextClick(Sender: TObject);
begin
  ColorDialog.Color := (Sender as TLabel).Font.Color;
  if ColorDialog.Execute then begin
    case (Sender as TComponent).Tag of
      1:  DefaultTextColor := ColorDialog.Color;
      11: LinkColor := ColorDialog.Color;
      12: VLinkColor := ColorDialog.Color;
      13: ALinkColor := ColorDialog.Color;
    end;
    SetCustomTemplate;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetTemplate(const Value: THTMLTemplate);

  procedure SetStdTemplate(ATemplate: RHTMLTemplate);
  begin
    with ATemplate do begin
      BackGroundColor := RBackgroundColor;
      LinkColor := RLinkColor;
      VLinkColor := RVLinkColor;
      ALinkColor := RALinkColor;
      DefaultTextColor := RDefaultTextColor;
      // := RTextFontName;
      HeadersRowFontColor := RHeadersRowFontColor;
      HeadersRowBgColor := RHeadersRowBgColor;
      TableBgColor := RTableBgColor;
      OddRowBgColor := ROddRowBgColor;
      TableFontColor := RTableFontColor;
    end;
  end;

begin
  if FTemplate <> Value then begin
    FTemplate := Value;
    case FTemplate of
      htBW: SetStdTemplate(RhtBW);
      htClassic: SetStdTemplate(RhtClassic);
      htColorFul: SetStdTemplate(RhtColorFul);
      htGray: SetStdTemplate(RhtGray);
      htMS_Money: SetStdTemplate(RhtMS_Money);
      htMurky: SetStdTemplate(RhtMurky);
      htOlive: SetStdTemplate(RhtOlive);
      htPlain: SetStdTemplate(RhtPlain);
      htSimple: SetStdTemplate(RhtSimple);
    end;
  end;
end;


procedure TfmQExport3HTMLTemplateEditor.SetALinkColor(const Value: TColor);
begin
  if FALinkColor <> Value then begin
    FALinkColor := Value;
    lbHTMLALink.Font.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetBackGroundColor(const Value: TColor);
begin
  if FBackGroundColor <> Value then begin
    FBackGroundColor := Value;
    BackPanel.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetDefaultTextColor(const Value: TColor);
begin
  if FDefaultTextColor <> Value then begin
    FDefaultTextColor := Value;
    lbHTMLDefaultText.Font.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetHeadersRowBgColor(const Value: TColor);
var
  i: integer;
begin
  if FHeadersRowBgColor <> Value then begin
    FHeadersRowBgColor := Value;
    for i := 1 to 3 do
      (FindComponent('ColHead' + IntToStr(i)) as TPanel).Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetHeadersRowFontColor(
  const Value: TColor);
var
  i: integer;
begin
  if FHeadersRowFontColor <> Value then begin
    FHeadersRowFontColor := Value;
    for i := 1 to 3 do
      (FindComponent('Head' + IntToStr(i)) as TLabel).Font.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetLinkColor(const Value: TColor);
begin
  if FLinkColor <> Value then begin
    FLinkColor := Value;
    lbHTMLLink.Font.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetOddRowBgColor(const Value: TColor);
var
  i: integer;
begin
  if FOddRowBgColor <> Value then begin
    FOddRowBgColor := Value;
    for i := 1 to 6 do
      (FindComponent('OddRow' + IntToStr(i)) as TPanel).Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetTableBgColor(const Value: TColor);
var
  i: integer;
begin
  if FTableBgColor <> Value then begin
    FTableBgColor := Value;
    for i := 1 to 6 do
      (FindComponent('Row' + IntToStr(i)) as TPanel).Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetTableFontColor(const Value: TColor);
var
  i: integer;
begin
  if FTableFontColor <> Value then begin
    FTableFontColor := Value;
    for i := 1 to 12 do
      (FindComponent(Format('Data%d',[i])) as TLabel).Font.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetTextFontName(const Value: string);
begin
  if FTextFontName <> Value then begin
    FTextFontName := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.SetVLinkColor(const Value: TColor);
begin
  if FVLinkColor <> Value then begin
    FVLinkColor := Value;
    lbHTMLVLink.Font.Color := Value;
  end;
end;

procedure TfmQExport3HTMLTemplateEditor.FormCreate(Sender: TObject);
var
  i: THTMLTemplate;
begin
  for i := Low(THTMLTemplate) to High(THTMLTemplate) do
    cbxTemplate.Items.Add(TemplateToStr(i));
end;

end.
