unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,  ImgRptLnk, Buttons,  ExtDlgs, dxPSCore, dxPSLbxLnk,
  dxPSGrLnks;

type
  TMainForm = class(TForm)
    dxComponentPrinter1: TdxComponentPrinter;
    Panel1: TPanel;
    RLGroup: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbTransparent: TCheckBox;
    cbImgTransparent: TCheckBox;
    cbBorder: TCheckBox;
    cbCenter: TCheckBox;
    cbStretch: TCheckBox;
    ImageGroup: TGroupBox;
    cbCompTransparent: TCheckBox;
    cbCompCenter: TCheckBox;
    cbCompStretch: TCheckBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel2: TPanel;
    Image1: TImage;
    btnLoad: TBitBtn;
    BtnPreview: TBitBtn;
    btnLoadProp: TBitBtn;
    btnRestore: TBitBtn;
    btnPrint: TBitBtn;
    Panel3: TPanel;
    ccBorderColor: TPanel;
    ccColor: TPanel;
    ColorDialog1: TColorDialog;
    procedure PreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RestoreClick(Sender: TObject);
    procedure cbCenterClick(Sender: TObject);
    procedure cbStretchClick(Sender: TObject);
    procedure cbTransparentClik(Sender: TObject);
    procedure cbImgTransparentClick(Sender: TObject);
    procedure cbBorderClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure cbCompCenterClick(Sender: TObject);
    procedure cbCompStretchClick(Sender: TObject);
    procedure cbCompTransparentClick(Sender: TObject);
    procedure btnLoadPropClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ccBorderColorClick(Sender: TObject);
    procedure ccColorClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReadProperty;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.PreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, dxComponentPrinter1.CurrentLink);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  dxComponentPrinter1.CurrentLink := dxComponentPrinter1.AddLink(Image1);
  ReadProperty;
  cbCompCenter.Checked := Image1.Center;
  cbCompStretch.Checked := Image1.Stretch;
  cbCompTransparent.Checked := Image1.Transparent;
end;

procedure TMainForm.RestoreClick(Sender: TObject);
begin
  dxComponentPrinter1.CurrentLink.RestoreDefaults;
  ReadProperty;
end;

procedure TMainForm.ReadProperty;
begin
  with TdxImageReportLink(dxComponentPrinter1.CurrentLink) do
  begin
    cbCenter.Checked := Center;
    cbStretch.Checked := Stretch;
    cbTransparent.Checked := Transparent;
    cbImgTransparent.Checked := ImgTransparent;
    cbBorder.Checked := PaintBorder;
    ccColor.Color := Color;
    ccBorderColor.Color := BorderColor;
  end;
  ccColor.Enabled := not cbTransparent.Checked;
  ccColor.BorderStyle := TBorderStyle(Ord(not cbTransparent.Checked));
  ccBorderColor.Enabled := cbBorder.Checked;
  ccBorderColor.BorderStyle := TBorderStyle(Ord(cbBorder.Checked));
end;

procedure TMainForm.cbCenterClick(Sender: TObject);
begin
  TdxImageReportLink(dxComponentPrinter1.CurrentLink).Center := TCheckBox(Sender).Checked;
end;

procedure TMainForm.cbStretchClick(Sender: TObject);
begin
  TdxImageReportLink(dxComponentPrinter1.CurrentLink).Stretch := TCheckBox(Sender).Checked;
end;

procedure TMainForm.cbTransparentClik(Sender: TObject);
begin
  TdxImageReportLink(dxComponentPrinter1.CurrentLink).Transparent := TCheckBox(Sender).Checked;
  ccColor.Enabled := not TCheckBox(Sender).Checked;
  ccColor.BorderStyle := TBorderStyle(Ord(not TCheckBox(Sender).Checked));
end;

procedure TMainForm.cbImgTransparentClick(Sender: TObject);
begin
  TdxImageReportLink(dxComponentPrinter1.CurrentLink).ImgTransparent := TCheckBox(Sender).Checked;
end;

procedure TMainForm.cbBorderClick(Sender: TObject);
begin
  TdxImageReportLink(dxComponentPrinter1.CurrentLink).PaintBorder := TCheckBox(Sender).Checked;
  ccBorderColor.Enabled := TCheckBox(Sender).Checked;
  ccBorderColor.BorderStyle := TBorderStyle(Ord(TCheckBox(Sender).Checked));
end;

procedure TMainForm.btnLoadClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TMainForm.cbCompCenterClick(Sender: TObject);
begin
  Image1.Center := TCheckBox(Sender).Checked;
end;

procedure TMainForm.cbCompStretchClick(Sender: TObject);
begin
  Image1.Stretch := TCheckBox(Sender).Checked;
end;

procedure TMainForm.cbCompTransparentClick(Sender: TObject);
begin
  Image1.Transparent := TCheckBox(Sender).Checked;
end;

procedure TMainForm.btnLoadPropClick(Sender: TObject);
begin
  with TdxImageReportLink(dxComponentPrinter1.CurrentLink) do
  begin
    Center := Image.Center;
    ImgTransparent := Image.Transparent;
    Stretch := Image.Stretch;
  end;
  ReadProperty;
end;

procedure TMainForm.btnPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.CurrentLink.Print(True,nil);
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
   ShowMessage(dxComponentPrinter1.CurrentLink.ClassName);
end;

procedure TMainForm.ccBorderColorClick(Sender: TObject);
begin
  ColorDialog1.Color := ccBorderColor.Color;
  if ColorDialog1.Execute then
  begin
    ccBorderColor.Color := ColorDialog1.Color;
    TdxImageReportLink(dxComponentPrinter1.CurrentLink).BorderColor := ccBorderColor.Color;
  end;
end;

procedure TMainForm.ccColorClick(Sender: TObject);
begin
  ColorDialog1.Color := ccColor.Color;
  if ColorDialog1.Execute then
  begin
    ccColor.Color := ColorDialog1.Color;
    TdxImageReportLink(dxComponentPrinter1.CurrentLink).Color := ccColor.Color;
  end;
end;

end.
