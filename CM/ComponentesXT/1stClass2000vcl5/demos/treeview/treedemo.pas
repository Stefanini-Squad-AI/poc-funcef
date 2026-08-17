unit treedemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcTreeView, Buttons, StdCtrls, fcdbtreeview, ComCtrls,
  shellapi, fcStatusBar, Db, DBTables, Grids, DBGrids, fcImager, fcCombo,
  fcTreeCombo, fcFontCombo, fcDemoRichEdit;

type
  TTreeViewDemoForm = class(TForm)
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    fcTreeView1: TfcTreeView;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    fcStatusBar1: TfcStatusBar;
    fcTreeView2: TfcTreeView;
    TabSheet3: TTabSheet;
    fcTreeView3: TfcTreeView;
    Label1: TLabel;
    DataSource1: TDataSource;
    Button1: TButton;
    ImageList2: TImageList;
    DBGrid1: TDBGrid;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcDemoRichEdit2: TfcDemoRichEdit;
    Query1: TQuery;
    fcDemoRichEdit3: TfcDemoRichEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure fcTreeView1CalcNodeAttributes(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; State: TfcItemStates);
    procedure fcTreeView2MouseMove(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; Shift: TShiftState; X, Y: Integer);
    procedure Table1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure fcTreeView3ToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TreeViewDemoForm: TTreeViewDemoForm;

implementation

{$R *.DFM}

procedure TTreeViewDemoForm.CheckBox1Click(Sender: TObject);
begin
  with fcTreeView1 do begin
     if tvoExpandButtons3D in Options then
        Options:= Options - [tvoExpandButtons3D]
     else Options:= Options + [tvoExpandButtons3D]
  end
end;

procedure TTreeViewDemoForm.FormShow(Sender: TObject);
begin
   fctreeview1.FullExpand;
   fctreeview2.FullExpand;
end;

procedure TTreeViewDemoForm.CheckBox2Click(Sender: TObject);
begin
  with fcTreeView1 do begin
     if (Sender as TCheckBox).checked then
        Options:= Options + [tvoRowSelect]
     else
        Options:= Options - [tvoRowSelect]
  end

end;

procedure TTreeViewDemoForm.fcTreeView1CalcNodeAttributes(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; State: TfcItemStates);
begin
    if fcisHot in State then TreeView.Canvas.Font.Style:= TreeView.Canvas.Font.Style + [fsUnderline];
end;

{ Update statusbar to contain URL link address }
procedure TTreeViewDemoForm.fcTreeView2MouseMove(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; Shift: TShiftState; X, Y: Integer);
begin
   with TreeView do begin
      if (Node<>Nil) and (Node.StringData<>'') and
          (fchtOnItem in GetHitTestInfoAt(x,y)) then
         fcStatusBar1.Panels[0].Text:= Node.StringData
      else
         fcStatusBar1.Panels[0].Text:= '';
   end
end;

procedure TTreeViewDemoForm.Table1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var CurNode, ChildNode: TfcTreeNode;
    CountryMatch, AmountOrderedMatch, AmountOwedMatch: boolean;
    AmountOwed, AmountOrdered: Double;
begin

  { TreeView handle not available i.e. destroying}
  if not fcTreeView3.HandleAllocated then exit;

  accept:= False;

  CountryMatch:= True;
  AmountOrderedMatch:= True;
  AmountOwedMatch:= True;

  with fcTreeView3 do begin
     curNode:= Items.GetFirstNode;
     repeat
        if (curNode.StringData = 'Country') and (curNode.checked) then begin
           CountryMatch:= False;

           { Search checkboxes for country to see if any countries match current record }
           ChildNode:= curNode.GetFirstChild;
           repeat
              if ChildNode.checked then begin
                 if dataset.fieldbyname('Country').asString = ChildNode.text then
                 begin
                    CountryMatch:= True;
                    break;
                 end;
              end;
              ChildNode:= ChildNode.GetNextSibling;
           until ChildNode = nil;
        end
        else if (curNode.StringData = 'Amount Ordered') and (curNode.checked) then begin
           { Check AmountOrdered to amount matches radio group selected in treeview }
           AmountOrderedMatch:= False;
           ChildNode:= curNode.GetFirstChild;
           repeat
              if ChildNode.checked then begin
                 AmountOrdered:= dataset.fieldbyname('AmountOrdered').asFloat;
                 with dataset.fieldbyname('AmountOrdered') do
                    if ((ChildNode.StringData='') or
                       (AmountOrdered >= strtoint(ChildNode.StringData))) and
                       ((ChildNode.StringData2='') or
                       (AmountOrdered < strtoint(ChildNode.StringData2))) then
                    AmountOrderedMatch:= True;
                 break;
              end;
              ChildNode:= ChildNode.GetNextSibling;
           until ChildNode = nil;
        end
        else if (curNode.StringData = 'Amount Owed') and (curNode.checked) then begin
           { Check AmountOrdered to amount matches radio group selected in treeview }
           AmountOwedMatch:= False;
           ChildNode:= curNode.GetFirstChild;
           repeat
              if ChildNode.checked then begin
                 AmountOwed:= dataset.fieldbyname('AmountOrdered').asFloat -
                              dataset.fieldbyname('AmountPaid').asFloat;
                 if ((ChildNode.StringData='') or
                    (AmountOwed > strtoint(ChildNode.StringData))) and
                    ((ChildNode.StringData2='') or
                    (AmountOwed <= strtoint(ChildNode.StringData2))) then
                    AmountOwedMatch:= True;
                 break;
              end;
              ChildNode:= ChildNode.GetNextSibling;
           until ChildNode = nil;
        end;

        curNode:= curNode.GetNextSibling;
     until curNode=nil;
  end;

  if CountryMatch and AmountOrderedMatch and AmountOwedMatch then accept:= true;
end;

procedure TTreeViewDemoForm.Button1Click(Sender: TObject);
begin
   { Reapply filter by refreshing query locally }
   query1.updatecursorpos;
   query1.resync([rmCenter]);
end;

procedure TTreeViewDemoForm.fcTreeView3ToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
   if (Node.Level=1) and (Node.checked) then
      Node.parent.checked:= True;
end;

end.
 