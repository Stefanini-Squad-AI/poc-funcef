unit TreeFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, ComCtrls, DB, Forms, Dialogs;

  function  TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
  function  TreeAddItem(Sender: TTreeView; ItemList: TStrings; Bookmark: TBookmark; Resort: Boolean): TTreeNode;
  function  TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
  procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);

implementation

function TreeAddItem(Sender: TTreeView; ItemList: TStrings; Bookmark: TBookmark; Resort: Boolean): TTreeNode;
var ThisNode, Node: TTreeNode;
    I: Integer;
begin
   Node := nil;

   For I := 0 to Itemlist.count -1 do
   Begin
      ThisNode := TreeFindItem(Sender, node, Itemlist[i]);

      If ThisNode <> nil then Node := ThisNode else
      Begin
         If I < Itemlist.count -1 then
         Begin
            If I = 0 then
               Node := Sender.items.Add(Node, Itemlist[i])
            Else
               Node := Sender.items.AddChild(Node, Itemlist[i]);
         End
         Else
         Begin
            If I = 0 then
               Node := Sender.items.AddObject(Node, Itemlist[i], Bookmark)
            Else
               Node := Sender.items.AddChildObject(Node, Itemlist[i], Bookmark);
         End;

         Node.stateIndex := Node.level + 1;

         If Resort and (Node.parent <> nil) then
            Node.parent.alphasort;
      End;
   End;
   
   Result := Node;
end;

function TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
begin
   If NodeItem = nil then
      NodeItem := Sender.items.getfirstnode
   Else
      NodeItem := NodeItem.getfirstchild;

   If (NodeItem <> nil) and (NodeItem.text <> Name) then
     Repeat
         NodeItem := NodeItem.getnextsibling;
     Until (NodeItem = nil) or (NodeItem.text = Name);

   Result := NodeItem;
end;

function TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
begin
   Result := TreeAddItem(Sender, Itemlist, nil, false);
end;

procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);
var Node, Parent: TTreeNode;
begin
   Node := TreeGetItem(Sender, ItemList);

   While Node.level >= Level do
   Begin
      Parent := Node.parent;
      Node.delete;

      If (Parent = nil) or (Parent.hasChildren) then break;

      Node := Parent;
   End;
end;


end.
