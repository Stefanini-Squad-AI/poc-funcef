program XMLTest;

uses
  Forms,
  XMLTestMain in 'XMLTestMain.pas' {frmXMLTestDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmXMLTestDemo, frmXMLTestDemo);
  Application.Run;
end.
