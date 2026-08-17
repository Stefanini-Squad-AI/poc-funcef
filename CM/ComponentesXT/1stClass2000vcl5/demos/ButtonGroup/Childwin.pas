unit Childwin;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls, Main, Buttons, fcCommon, fcShapeBtn,
  ComCtrls, fcDemoRichEdit;

type
  TMDIChild = class(TForm)
    fcDemoRichEdit1: TfcDemoRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.DFM}

procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMDIChild.FormCreate(Sender: TObject);
var ABitmap: TBitmap;
begin
  with MainMdiForm.fcButtonGroup1.ButtonItems.Add do
  begin
    (Button as TfcShapeBtn).TextOptions.Alignment := taLeftJustify;
    PointerTag := self;
    ABitmap := TBitmap.Create;
    ABitmap.Width := 16;
    ABitmap.Height := 16;
//    ABitmap.Canvas.Draw(0, 0, Icon);
    DrawIconEx(ABitmap.Canvas.Handle, 0, 0, Icon.Handle, 16, 16, 0, 0, DI_NORMAL or DI_DEFAULTSIZE);
    Button.Glyph := ABitmap;
    ABitmap.Free;
  end;
end;

procedure TMDIChild.FormDestroy(Sender: TObject);
begin
  MainMDIForm.fcButtonGroup1.ButtonItems.FindPointerTag(self).Free;
end;

procedure TMDIChild.FormActivate(Sender: TObject);
begin
  MainMDIForm.fcButtonGroup1.ButtonItems.FindPointerTag(self).Selected := True;
end;

end.
