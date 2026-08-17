unit InfoUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, fcDemoRichEdit;

type
  TInfoForm = class(TForm)
    fcDemoRichEdit1: TfcDemoRichEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoForm: TInfoForm;

implementation

{$R *.DFM}

end.
