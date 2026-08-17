{ This translator module component translates the TOutline, TStringGrid,
  TListView, TTreeView and TStatusBar components. }

unit IvConMod;

{$I IVMULTI.INC}

interface

uses
  Classes, Controls, IvMulti, IvDictio;

type
  TIvControlModule = class(TIvModule)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;

    function FlipControl(
      translator: TIvTranslator;
      control: TControl;
      state: TIvBidirectionalState): Boolean; override;

    function ChangeComponentReadingOrder(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;
  end;

implementation

uses
{$IFDEF WIN32}
  ComCtrls,
{$ENDIF}
  Grids, Outline;

function TIvControlModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i, j, x, y: Integer;
  stringGrid: TStringGrid;
  outline: TOutline;
{$IFDEF WIN32}
  listItem: TListItem;
  listView: TListView;
  treeView: TTreeView;
  oldSortType: TSortType;
{$ENDIF}
begin
  if (component is TStringGrid) then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Cells') then
    begin
      stringGrid := component as TStringGrid;

      { Translates the fixed columns }

      for x := 0 to stringGrid.FixedCols - 1 do
        for y := 0 to stringGrid.RowCount - 1 do
        begin
          stringGrid.Cells[x, y] := translator.DoTranslateContextString(
            stringGrid,
            component.Name,
            'Cells',
            stringGrid.Cells[x, y]);
        end;

      { Translates the fixed rows }

      for y := 0 to stringGrid.FixedRows - 1 do
        for x := stringGrid.FixedCols to stringGrid.ColCount - 1 do
        begin
          stringGrid.Cells[x, y] := translator.DoTranslateContextString(
            stringGrid,
            component.Name,
            'Cells',
            stringGrid.Cells[x, y]);
        end;
    end;
  end
  else if (component is TOutline) then
  begin
    { The item range is from 1 to ItemCount }

    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Lines') then
    begin
      outline := component as TOutline;
      outline.BeginUpdate;
      for i := 1 to outline.ItemCount do
      begin
        outline.Items[i].Text := translator.DoTranslateContextString(
          outline,
          component.Name,
          'Lines',
          outline.Items[i].Text);
      end;
      outline.EndUpdate;
    end;
  end
{$IFDEF WIN32}
  else if (component is TListView) then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      listView := component as TListView;
      oldSortType := listView.SortType;
      listView.Items.BeginUpdate;
      try
        listView.SortType := stNone;
        for i := 0 to listView.Items.Count - 1 do
        begin
          listItem := listView.Items[i];
          listItem.Caption := translator.DoTranslateContextString(
            listItem,
            component.Name,
            'Caption',
            listItem.Caption);
          for j := 0 to listItem.SubItems.Count - 1 do
            listItem.SubItems[j] := translator.DoTranslateContextString(
              listItem,
              component.Name,
              'Items',
              listItem.SubItems[j]);
        end;
      finally
        listView.SortType := oldSortType;
        listView.Items.EndUpdate;
      end;
      listView.Repaint;
    end;
  end
  else if (component is TTreeView) then
  begin
    Result := True;
    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Items') then
    begin
      treeView := component as TTreeView;
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
{$ENDIF}
  else
    Result := False;
end;

function TIvControlModule.FlipControl(
  translator: TIvTranslator;
  control: TControl;
  state: TIvBidirectionalState): Boolean;
{$IFDEF IVPRO32}
var
  activeSheet: TTabSheet;
{$ENDIF}
begin
{$IFDEF IVPRO32}
  if control is TTabSheet then
  begin
    { No active when the control is a tab sheet }

    Result := True;
  end
  else if control.Parent is TTabSheet then
  begin
    Result := True;
    state.Flipped := True;
    activeSheet := (control.Parent.Parent as TPageControl).ActivePage;
    control.Left := activeSheet.ClientWidth - control.Width - control.Left;
  end
  else
{$ENDIF}
    Result := False;
end;

function TIvControlModule.ChangeComponentReadingOrder(
  translator: TIvTranslator;
  component: TComponent): Boolean;
{$IFDEF IVPRO32}
var
  i: Integer;
  panel: TStatusPanel;
{$ENDIF}
begin
{$IFDEF IVPRO32}
  if (component is TStatusBar) then
  begin
    Result := True;
    for i := 0 to (component as TStatusBar).Panels.Count - 1 do
    begin
      panel := (component as TStatusBar).Panels[i];
      if panel.Alignment = taLeftJustify then
        panel.Alignment := taRightJustify
      else if panel.Alignment = taRightJustify then
        panel.Alignment := taLeftJustify;
    end;
  end
  else
{$ENDIF}
    Result := False;
end;

begin
  Modules.Add(TIvControlModule.Create(nil));
end.
