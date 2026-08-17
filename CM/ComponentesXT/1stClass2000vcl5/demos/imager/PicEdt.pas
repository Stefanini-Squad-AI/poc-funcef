unit PicEdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ExtDlgs, TypInfo, fcCommon, fcBitmap;

type
  TfcGraphicType = (gtBitmap, gtIcon, gtJPEG, gtEmf, gtWmf);

const
  GRAPHICTYPES: array[TfcGraphicType] of string = ('Bitmap', 'Icon', 'JPEG Image', 'Enhanced Metafile', 'Windows Metafile');

type
  TfcPicEditor = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    Panel: TPanel;
    ImagePanel: TPanel;
    LoadButton: TButton;
    SaveButton: TButton;
    ClearButton: TButton;
    Image: TImage;
    OpenDialog: TOpenPictureDialog;
    SaveDialog: TSavePictureDialog;
    procedure LoadButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateImage;
  public
    { Public declarations }
    StoredImage: TPicture;
  end;

  function ExecutePictureEditor(AGraphic: TGraphic;
    DestGraphic: TPersistent): Boolean;

var
  fcPicEditor: TfcPicEditor;

implementation

{$R *.DFM}

function ExecutePictureEditor(AGraphic: TGraphic;
  DestGraphic: TPersistent): Boolean;
begin
  result := False;
  with TfcPicEditor.Create(Application) do
  begin
    StoredImage.Assign(AGraphic);
    UpdateImage;

    if ShowModal = mrOK then
    begin
      result := True;
      DestGraphic.Assign(StoredImage.Graphic);
    end;
    Free;
  end;
end;

procedure TfcPicEditor.UpdateImage;
var s: TSize;
begin
  if (StoredImage.Graphic <> nil) and not StoredImage.Graphic.Empty then
  begin
    s := fcSize(StoredImage.Width, StoredImage.Height);
    if (StoredImage.Width > Image.Width) or (StoredImage.Height > Image.Height) then
    begin
      if StoredImage.Width > StoredImage.Height then
        s := fcSize(Image.Width, Image.Width * StoredImage.Height div StoredImage.Width)
      else s := fcSize(Image.Height * StoredImage.Width div StoredImage.Height, Image.Height);
    end;
    Image.Picture.Bitmap.Width := s.cx;
    Image.Picture.Bitmap.Height := s.cy;
    Image.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, s.cx, s.cy), StoredImage.Graphic);
    ImagePanel.Caption := '';
  end else begin
    Image.Picture.Bitmap.Assign(nil);
    Image.Repaint;
    ImagePanel.Caption := '(None)';
  end;
end;

procedure TfcPicEditor.LoadButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    StoredImage.LoadFromFile(OpenDialog.FileName);
    UpdateImage;
  end;
end;

procedure TfcPicEditor.SaveButtonClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    StoredImage.SaveToFile(SaveDialog.FileName);
end;

procedure TfcPicEditor.ClearButtonClick(Sender: TObject);
begin
  StoredImage.Free;
  StoredImage := TPicture.Create;
//  StoredImage.RespectPalette := True;
  UpdateImage;
end;

procedure TfcPicEditor.HelpButtonClick(Sender: TObject);
var KLinkMacro: PChar;
begin
  KLinkMacro := 'KL("Picture Editor", 1, "", "")';
  WinHelp(Handle, PChar(Application.HelpFile), HELP_COMMAND, Integer(KLinkMacro));
end;

procedure TfcPicEditor.FormCreate(Sender: TObject);
begin
  StoredImage := TPicture.Create;
//  StoredImage.RespectPalette := True;
end;

procedure TfcPicEditor.FormDestroy(Sender: TObject);
begin
  StoredImage.Free;
end;

end.
