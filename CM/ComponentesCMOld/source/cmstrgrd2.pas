unit cmstrgrd2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, CMStrGrd;

type
  TCMStringGrid2 = class(TCMStringGrid)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure WMLButtonDown(var Message: TMessage); message WM_LBUTTONDOWN;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

implementation

procedure TCMStringGrid2.WMLButtonDown(var Message: TMessage);
begin
   // Mesmo não tendo nada aqui esse nada faz algo. Não remova.
end;

end.
