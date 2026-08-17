unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ImgList, dxfBackGround;

type
  TForm1 = class(TForm)
    dxfBackGround: TdxfBackGround;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image: TImage;
    ImageList: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  dxfBackGround.BkPicture := nil;
  dxfBackGround.BkAnimate.ImageList := nil;
  Form1.Refresh;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  dxfBackGround.BkPicture := Image.Picture;
  dxfBackGround.BkAnimate.ImageList := nil;
  Form1.Refresh;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  dxfBackGround.BkAnimate.ImageList := ImageList;
end;

end.
