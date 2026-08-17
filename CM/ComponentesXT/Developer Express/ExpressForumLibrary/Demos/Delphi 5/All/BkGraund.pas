unit BkGraund;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dxfBackGround, dxfColorButton, ExtCtrls, ImgList;

type
  TBkGroundForm = class(TForm)
    dxfBackGround: TdxfBackGround;
    dxfColorButton1: TdxfColorButton;
    dxfColorButton2: TdxfColorButton;
    dxfColorButton3: TdxfColorButton;
    ImageList: TImageList;
    Image: TImage;
    procedure FormCreate(Sender: TObject);
    procedure dxfColorButton1Click(Sender: TObject);
    procedure dxfColorButton2Click(Sender: TObject);
    procedure dxfColorButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BkGroundForm: TBkGroundForm;

implementation

uses main;

{$R *.DFM}

procedure TBkGroundForm.FormCreate(Sender: TObject);
begin
  Parent := MainForm.BkGroundPanel;
  Align := alClient;
end;

procedure TBkGroundForm.dxfColorButton1Click(Sender: TObject);
begin
  dxfBackGround.BkPicture := nil;
  dxfBackGround.BkAnimate.ImageList := nil;
  Refresh;
end;

procedure TBkGroundForm.dxfColorButton2Click(Sender: TObject);
begin
  dxfBackGround.BkPicture := Image.Picture;
  dxfBackGround.BkAnimate.ImageList := nil;
  Refresh;
end;

procedure TBkGroundForm.dxfColorButton3Click(Sender: TObject);
begin
  dxfBackGround.BkAnimate.ImageList := ImageList;
end;

end.
