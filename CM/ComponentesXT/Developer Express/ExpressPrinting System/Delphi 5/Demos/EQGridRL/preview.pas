unit preview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls;

type
  TPreviewForm = class(TForm)
    DBImage: TDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation

uses main;

{$R *.DFM}

end.
