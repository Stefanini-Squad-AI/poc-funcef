unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IvDictio, IvMulti;

type
  TAboutDialog = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    OKButton: TButton;
    IvTranslator1: TIvTranslator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutDialog: TAboutDialog;

implementation

{$R *.DFM}

end.
