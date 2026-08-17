{
This translator module component translates the TRzTreeView, TRzCheckTree,
and TRzListView components.
}

unit IvRzMod;

interface

uses
  Classes, Controls, IvMulti, IvDictio;

type
  TIvRaizeModule = class(TIvModule)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;
  end;

implementation

uses
  ComCtrls,
  RzTreeVw, RzListVw;

function TIvRaizeModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
  threeView: TRzTreeView;
  checkTree: TRzCheckTree;
  listItem: TListItem;
  listView: TRzListView;
begin
  if component is TRzTreeView then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      threeView := component as TRzTreeView;
      for i := 0 to threeView.Items.Count - 1 do
      begin
        threeView.Items[i].Text := translator.DoTranslateContextString(
          threeView,
          component.Name,
          'Items',
          threeView.Items[i].Text);
      end;
    end;
  end
  else if component is TRzCheckTree then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      checkTree := component as TRzCheckTree;
      for i := 0 to checkTree.Items.Count - 1 do
      begin
        checkTree.Items[i].Text := translator.DoTranslateContextString(
          checkTree,
          component.Name,
          'Items',
          checkTree.Items[i].Text);
      end;
    end;
  end
  else if (component is TRzListView) then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      listView := component as TRzListView;
      for i := 0 to listView.Items.Count - 1 do
      begin
        listItem := listView.Items[i];

        listItem.Caption := translator.DoTranslateContextString(
          listItem,
          component.Name,
          'Caption',
          listItem.Caption);
        translator.DoTranslateStrings(
          listItem,
          component.Name,
          'Items',
          listItem.SubItems);
      end;
      listView.Repaint;
    end;
  end
  else
    Result := False;
end;

begin
  Modules.Add(TIvRaizeModule.Create(nil));
end.
