unit Dxfvmain;

interface

uses
	SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
	Forms, Dialogs, Menus, ExtCtrls, Dxfgrph;

const
	DxfDir = 'd:\images\dxfs\utah\';

type
	TForm1 = class(TForm)
		MainMenu1: TMainMenu;
		OpenDialog1: TOpenDialog;
		File1: TMenuItem;
    Open1: TMenuItem;
		Test1: TMenuItem;
		PaintBox1: TPaintBox;
		procedure Open1Click(Sender: TObject);
		procedure Test1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure FormDestroy(Sender: TObject);
		procedure PaintBox1Paint(Sender: TObject);
		procedure FormResize(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
		Dxf: TDxf;
		procedure SizeAndPaintDxf;
	end;

var
	Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Open1Click(Sender: TObject);
begin
	if OpenDialog1.Execute then
		begin
			Dxf.ScaleFactor := 3;
			Dxf.LoadFromFile(OpenDialog1.FileName);
			PaintBox1.Invalidate;
		end;
end;

procedure TForm1.SizeAndPaintDxf;
var
	Scale1: Extended;
	ORect: TRect;
begin
	ORect := PaintBox1.Canvas.ClipRect;
	PaintBox1.Canvas.Brush.Color := clWhite;
	PaintBox1.Canvas.Brush.Style := bsSolid;
	PaintBox1.Canvas.FillRect(ORect);
	if Dxf.Empty then
		Exit;
	Dxf.Width := PaintBox1.Width;
	Scale1 := Dxf.ScaleFactor;
	Dxf.Height := PaintBox1.Height;
	if Scale1 < Dxf.ScaleFactor then
  	Dxf.ScaleFactor := Scale1;
	PaintBox1.Canvas.Draw(0, 0, Dxf);
end;

procedure TForm1.Test1Click(Sender: TObject);
var
	Dxf: TDxf;
	ORect: TRect;
	SearchRec: TSearchRec;
	r: Integer;
	LoadTime, DrawTime, xTime, Count: DWord;
begin
	Dxf := TDxf.Create;
	Dxf.ScaleFactor := 3;
	LoadTime := 0;
	DrawTime := 0;
	Count := 0;
	try
		r := FindFirst(DxfDir + '*.dxf', faAnyFile, SearchRec);
		while r = 0 do
			begin
				xTime := GetTickCount;
				try
					Dxf.LoadFromFile(DxfDir + SearchRec.Name);
				except
					on Exception do
						begin
							r := FindNext(SearchRec);
							continue;
						end;
				end;
				LoadTime := LoadTime + GetTickCount - xTime;
				ORect := ClientRect;
				Canvas.Brush.Color := clWhite;
				Canvas.Brush.Style := bsSolid;
				Canvas.FillRect(ORect);
				xTime := GetTickCount;
        Dxf.Height := ClientHeight;
				Canvas.Draw(4, 4, Dxf);
				DrawTime := DrawTime + GetTickCount - xTime;
				Inc(Count);
				r := FindNext(SearchRec);
			end;
		if Count > 0 then
			MessageDlg('Load Time: ' + IntToStr(LoadTime div Count) + #13
					+ 'Draw Time: ' + IntToStr(DrawTime div Count), mtInformation, [mbOk], 0);
	except
		on Exception do
			begin
				Dxf.Free;
				raise;
			end;
	end;
	Dxf.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
	Dxf := TDxf.Create;
	Resize;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
	Dxf.Free;
  Dxf := nil;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
	SizeAndPaintDxf;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
	PaintBox1.Height := ClientHeight - 16;
	PaintBox1.Width := ClientWidth - 16;
	if Assigned (Dxf) and not Dxf.Empty then
		SizeAndPaintDxf;
end;

end.
