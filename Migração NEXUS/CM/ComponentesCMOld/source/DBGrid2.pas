unit DBGrid2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids;

type
  TDBGrid2 = class(TDBGrid)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    property ColWidths;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  published
    { Published declarations }
  end;


implementation

procedure TDBGrid2.KeyDown(var Key: Word; Shift: TShiftState);
begin
   inherited KeyDown(Key, Shift);
end;

end.
