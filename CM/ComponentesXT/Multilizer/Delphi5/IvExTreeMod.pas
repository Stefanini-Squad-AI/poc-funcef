{ This translator module component translates the TdxTreeView component }

unit IvExTreeMod;

{$I IVMULTI.INC}

interface

uses
  Classes, Controls, IvMulti, IvDictio;

type
  TIvExpressTreeModule = class(TIvModule)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;
  end;

implementation

uses
  ComCtrls,
  dxtree;

function TIvExpressTreeModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
  treeView: TdxTreeView;
  oldSortType: TSortType;
begin
  if (component is TdxTreeView) then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      treeView := component as TdxTreeView;
      oldSortType := treeView.SortType;
      treeView.Items.BeginUpdate;
      try
        treeView.SortType := stNone;
        for i := 0 to treeView.Items.Count - 1 do
        begin
          treeView.Items[i].Text := translator.DoTranslateContextString(
            treeView,
            component.Name,
            'Items',
            treeView.Items[i].Text);
        end;
      finally
        treeView.SortType := oldSortType;
        treeView.Items.EndUpdate;
      end;
    end;
  end
  else
    Result := False;
end;

begin
  Modules.Add(TIvExpressTreeModule.Create(nil));
end.
