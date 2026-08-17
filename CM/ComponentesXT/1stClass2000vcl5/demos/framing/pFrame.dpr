program pFrame;

uses
  Forms,
  Frameu in 'Frameu.pas' {FrameDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrameDemo, FrameDemo);
  Application.Run;
end.
