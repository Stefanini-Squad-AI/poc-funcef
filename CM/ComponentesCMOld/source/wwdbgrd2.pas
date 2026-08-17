unit Wwdbgrd2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, Wwdbigrd, Wwdbgrid, wwDatSrc, DBGrids, DB;

type
  TwwDBGrid2 = class(TwwDBGrid)
  private
    { Private declarations }
  protected
    { Protected declarations }
    function GetInplEditor: TInplaceEdit;
    function GetDataSource: TDataSource;
    procedure SetDataSource(val: TDataSource);

  public
    { Public declarations }
    property InplEditor: TInplaceEdit read GetInplEditor;
  published
    { Published declarations }
    property DataSource : TDataSource read GetDataSource write SetDataSource;

  end;

implementation


function TwwDBGrid2.GetInplEditor: TInplaceEdit;
begin
   Result := InplaceEditor;
end;

Function TwwDBGrid2.GetDataSource: TDataSource;
begin
   if (inherited DataSource) is TDataSource
   then Result:= (inherited DataSource) as TDataSource
   else Result:= Nil;
end;

Procedure TwwDBGrid2.SetDataSource(Val: TDataSource);
begin
   inherited DataSource := TwwDataSource(Val);
end;

end.
