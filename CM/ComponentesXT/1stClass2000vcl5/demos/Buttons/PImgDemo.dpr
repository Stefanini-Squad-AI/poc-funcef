program PImgDemo;

uses
  Forms,
  ImgButtonDemo in 'ImgButtonDemo.pas' {ImageBtnDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TImageBtnDemoForm, ImageBtnDemoForm);
  Application.Run;
end.
