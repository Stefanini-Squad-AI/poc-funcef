unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MultForm, IvMulti, StdCtrls, ExtCtrls, IvDictio;

type
  TAboutDialog = class(TMultilingualForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Label1: TLabel;
    OkButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  Main;
  
end.
