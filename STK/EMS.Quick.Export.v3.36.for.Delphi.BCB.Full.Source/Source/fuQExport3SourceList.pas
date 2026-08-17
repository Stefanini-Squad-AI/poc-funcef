unit fuQExport3SourceList;

{$I VerCtrl.inc}

interface

uses
  {$IFDEF VCL6}Variants, {$ENDIF}Classes, Controls, Forms, StdCtrls, ExtCtrls,
  ComCtrls {$IFDEF VCL4}, ImgList{$ENDIF};

type
  TfmQExport3SourceList = class(TForm)
    paButtons: TPanel;
    bOk: TButton;
    bCancel: TButton;
    lvExportSourceList: TTreeView;
    ImageList: TImageList;
    procedure lvExportSourceListDblClick(Sender: TObject);
    procedure lvExportSourceListChange(Sender: TObject; Node: TTreeNode);
  private
    procedure TuneButtons;
  end;

function RunExportSourceList(List: TStrings): TComponent;

implementation

uses DB, DBGrids, Grids, SysUtils, QExport3CustomSource;

{$R *.dfm}

function RunExportSourceList(List: TStrings): TComponent;
var
  i: integer;
  Cmp: TComponent;
  RootNode: TTreeNode;
  DataSetRoot, DBGridRoot,
  ListViewRoot, StringGridRoot,
  CustomSourceRoot: TTreeNode;
begin
  Result := nil;

  with TfmQExport3SourceList.Create(nil) do
  try
    lvExportSourceList.Items.BeginUpdate;
    try
      lvExportSourceList.Items.Clear;

      DataSetRoot := lvExportSourceList.Items.Add(nil, 'Data Sets');
      with  DataSetRoot do begin
        ImageIndex := 0;
        SelectedIndex := 0;
      end;
      DBGridRoot := lvExportSourceList.Items.Add(nil, 'DB Grids');
      with DBGridRoot do begin
        ImageIndex := 0;
        SelectedIndex := 0;
      end;
      ListViewRoot := lvExportSourceList.Items.Add(nil, 'List Views');
      with ListViewRoot do begin
        ImageIndex := 0;
        SelectedIndex := 0;
      end;
      StringGridRoot := lvExportSourceList.Items.Add(nil, 'String Grids');
      with StringGridRoot do begin
        ImageIndex := 0;
        SelectedIndex := 0;
      end;
      CustomSourceRoot := lvExportSourceList.Items.Add(nil, 'Custom Sources');
      with CustomSourceRoot do begin
        ImageIndex := 0;
        SelectedIndex := 0;
      end;

      for i := 0 to List.Count - 1 do begin
        if not (List.Objects[i] is TComponent) then Continue;

        Cmp := List.Objects[i] as TComponent;

        if Cmp is TDataSet then
          RootNode := DataSetRoot
        else if Cmp is TDBGrid then
          RootNode := DBGridRoot
        else if Cmp is TListView then
          RootNode := ListViewRoot
        else if Cmp is TStringGrid then
          RootNode := StringGridRoot
        else if Cmp is TqeCustomSource then
          RootNode := CustomSourceRoot
        else RootNode := nil;

        if Assigned(RootNode) then
          with lvExportSourceList.Items.AddChild(RootNode,
            Format('%s (%s)', [List[i], Cmp.ClassName])) do begin
            Data := List.Objects[i];
            ImageIndex := 1;
            SelectedIndex := 1;
          end;
      end;
      lvExportSourceList.FullExpand;

    finally
      lvExportSourceList.Items.EndUpdate;
    end;
    bOk.Enabled := lvExportSourceList.Items.Count > 0;

    if ShowModal = mrOk then
      Result := TComponent(lvExportSourceList.Selected.Data);
  finally
    Free;
  end;
end;

procedure TfmQExport3SourceList.lvExportSourceListDblClick(Sender: TObject);
begin
  if bOk.Enabled then bOk.Click;
end;

procedure TfmQExport3SourceList.TuneButtons;
begin
  bOk.Enabled := Assigned(lvExportSourceList.Selected) and
    (lvExportSourceList.Selected.Level = 1);
end;

procedure TfmQExport3SourceList.lvExportSourceListChange(Sender: TObject;
  Node: TTreeNode);
begin
  TuneButtons;
end;

end.
