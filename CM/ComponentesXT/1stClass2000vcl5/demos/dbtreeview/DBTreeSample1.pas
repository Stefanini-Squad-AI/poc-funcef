unit DBTreeSample1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, fcdbtreeview, Db, DBTables, Grids, fcTreeView, DBGrids,
  ComCtrls, StdCtrls, Mask, DBCtrls, ExtCtrls, fcScrollBar, fcButton,
  fcImgBtn, fcShapeBtn,
  fcOutlookList, fcDemoRichEdit, fcImager;

type
  TDMTreeViewForm = class(TForm)
    fcDBTreeView1: TfcDBTreeView;
    CustomersDS: TDataSource;
    CustomersTbl: TTable;
    CustomersTblCustNo: TFloatField;
    CustomersTblCompany: TStringField;
    CustomersTblAddr1: TStringField;
    CustomersTblAddr2: TStringField;
    CustomersTblCity: TStringField;
    CustomersTblState: TStringField;
    CustomersTblZip: TStringField;
    CustomersTblCountry: TStringField;
    CustomersTblPhone: TStringField;
    CustomersTblFAX: TStringField;
    CustomersTblTaxRate: TFloatField;
    CustomersTblContact: TStringField;
    CustomersTblLastInvoiceDate: TDateTimeField;
    CustomersTblLookupOrders: TIntegerField;
    OrdersDS: TDataSource;
    OrdersTbl: TTable;
    OrdersTblOrderNo: TFloatField;
    OrdersTblCustNo: TFloatField;
    OrdersTblSaleDate: TDateTimeField;
    OrdersTblShipDate: TDateTimeField;
    OrdersTblEmpNo: TIntegerField;
    OrdersTblShipToContact: TStringField;
    OrdersTblShipToAddr1: TStringField;
    OrdersTblShipToAddr2: TStringField;
    OrdersTblShipToCity: TStringField;
    OrdersTblShipToState: TStringField;
    OrdersTblShipToZip: TStringField;
    OrdersTblShipToCountry: TStringField;
    OrdersTblShipToPhone: TStringField;
    OrdersTblShipVIA: TStringField;
    OrdersTblPO: TStringField;
    OrdersTblTerms: TStringField;
    OrdersTblPaymentMethod: TStringField;
    OrdersTblItemsTotal: TCurrencyField;
    OrdersTblTaxRate: TFloatField;
    OrdersTblFreight: TCurrencyField;
    OrdersTblAmountPaid: TCurrencyField;
    ItemsDS: TDataSource;
    ItemsTbl: TTable;
    ItemsTblOrderNo: TFloatField;
    ItemsTblItemNo: TFloatField;
    ItemsTblPartNo: TFloatField;
    ItemsTblQty: TIntegerField;
    ItemsTblDiscount: TFloatField;
    ItemsTblLookupPartDescription: TStringField;
    ItemsTblLookupPartPrice: TFloatField;
    LookupPartTbl: TTable;
    LookupOrderTbl: TTable;
    PageControl1: TPageControl;
    CustomersTabSheet: TTabSheet;
    OrdersTabSheet: TTabSheet;
    ItemsTabSheet: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    EditCustNo: TDBEdit;
    EditCompany: TDBEdit;
    EditAddr: TDBEdit;
    Label3: TLabel;
    EditAddr2: TDBEdit;
    Label4: TLabel;
    EditZip: TDBEdit;
    Label7: TLabel;
    EditState: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
    EditCity: TDBEdit;
    Label8: TLabel;
    EditCountry: TDBEdit;
    EditPhone: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditFAX: TDBEdit;
    EditLastInvoiceDate: TDBEdit;
    Label13: TLabel;
    EditContact: TDBEdit;
    Label12: TLabel;
    EditTaxRate: TDBEdit;
    Label11: TLabel;
    TreeStateLabel: TLabel;
    ImageList1: TImageList;
    Label14: TLabel;
    EditOrderNo: TDBEdit;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    EditSaleDate: TDBEdit;
    Label16: TLabel;
    EditEmpNo: TDBEdit;
    Label17: TLabel;
    EditShipDate: TDBEdit;
    Label18: TLabel;
    EditShipVIA: TDBEdit;
    Label25: TLabel;
    EditPO: TDBEdit;
    Label28: TLabel;
    EditTerms: TDBEdit;
    Label29: TLabel;
    EditPaymentMethod: TDBEdit;
    Label30: TLabel;
    EditItemsTotal: TDBEdit;
    Label31: TLabel;
    EditAmountPaid: TDBEdit;
    Label32: TLabel;
    EditFreight: TDBEdit;
    Label33: TLabel;
    DBEdit2: TDBEdit;
    Label34: TLabel;
    EditDiscount: TDBEdit;
    Label35: TLabel;
    DBEdit3: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    EditItemNo: TDBEdit;
    EditPartNo: TDBEdit;
    Label38: TLabel;
    EditQty: TDBEdit;
    Label39: TLabel;
    PartsDS: TDataSource;
    PartsTbl: TTable;
    GroupBox1: TGroupBox;
    DBEdit6: TDBEdit;
    Label42: TLabel;
    DBEdit4: TDBEdit;
    Label40: TLabel;
    DBEdit5: TDBEdit;
    Label41: TLabel;
    DBEdit7: TDBEdit;
    Label43: TLabel;
    DBEdit8: TDBEdit;
    Label44: TLabel;
    DBEdit9: TDBEdit;
    Label45: TLabel;
    SpeedButton1: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Label19: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    FilterCombo: TComboBox;
    Label20: TLabel;
    CheckBox4: TCheckBox;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcDemoRichEdit2: TfcDemoRichEdit;
    CheckBox5: TCheckBox;
    fcImager1: TfcImager;
    procedure fcDBTreeView1CalcNodeAttributes(TreeView: TfcDBCustomTreeView;
      Node: TfcDBTreeNode);
    procedure fcDBTreeView1Change(TreeView: TfcDBCustomTreeView;
      Node: TfcDBTreeNode);
    procedure PageControl1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FilterComboChange(Sender: TObject);
    procedure CustomersTblFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure fcDBTreeView1DrawText(TreeView: TfcDBCustomTreeView;
      Node: TfcDBTreeNode; ARect: TRect; var DefaultDrawing: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTreeViewForm: TDMTreeViewForm;

implementation

{$R *.DFM}

procedure TDMTreeViewForm.fcDBTreeView1CalcNodeAttributes(TreeView: TfcDBCustomTreeView;
  Node: TfcDBTreeNode);
begin
     //   TreeView.Canvas.Brush.Color:= clNone;
   if Node.DataSet = CustomersTbl then begin

      { Use lookupfield to determine if expand icon (+) should be displayed }
      Node.HasChildren:= not node.dataset.fieldbyname('LookupOrders').isNull;

      { Use US bitmap for US customers }
      if Node.DataSet.FieldByname('Country').asString ='US' then
         Node.StateIndex:= 0
      else Node.StateIndex:= 1;


   end
end;

procedure TDMTreeViewForm.fcDBTreeView1Change(TreeView: TfcDBCustomTreeView;
  Node: TfcDBTreeNode);
var s: string;
    tempNode: TfcDBTreeNode;
begin
  { Compute label to indicate tree state }
  s:= '';
  tempNode:= node;
  repeat
     s:= tempNode.Text + #13 + s;
     tempNode:= tempNode.parent;
  until tempNode=nil;
  TreeStateLabel.caption:= s;

  { Select appropriate tab sheet based on active node }
  if Node.dataset=CustomersTbl then PageControl1.activePage:= CustomersTabSheet
  else if node.dataset=OrdersTbl then PageControl1.activePage:= OrdersTabSheet
  else if node.dataset=ItemsTbl then PageControl1.activePage:= ItemsTabSheet;

end;

procedure TDMTreeViewForm.PageControl1Change(Sender: TObject);
begin
   { This code causes the treeview to highlight the
     dataset associated with the ActivePage of the tab control }
   if PageControl1.ActivePage = OrdersTabSheet then
      fcDBTreeView1.MakeActiveDataSet(OrdersTbl, False)
   else if PageControl1.ActivePage = ItemsTabSheet then
      fcDBTreeView1.MakeActiveDataSet(ItemsTbl, False)
   else if PageControl1.ActivePage = CustomersTabSheet then
      fcDBTreeView1.MakeActiveDataSet(CustomersTbl, False)
end;

procedure TDMTreeViewForm.ComboBox1Change(Sender: TObject);
begin
   { Update treeview's fields based on active index }
   with (Sender as TComboBox) do
   begin
      if text = 'By Company' then begin
         CustomersTbl.indexname:= 'ByCompany';
         fcDBTreeView1.DisplayFields[0]:= '"Company" ("CustNo")';
      end
      else begin
         CustomersTbl.indexname:= '';
         fcDBTreeView1.DisplayFields[0]:= '"CustNo", "Company"';
      end;

   end;
end;

procedure TDMTreeViewForm.CheckBox1Click(Sender: TObject);
begin
  with fcDBTreeView1 do begin
     if dtvoExpandButtons3D in Options then
        Options:= Options - [dtvoExpandButtons3D]
     else Options:= Options + [dtvoExpandButtons3D]
  end
end;

procedure TDMTreeViewForm.CheckBox2Click(Sender: TObject);
begin
  with fcDBTreeView1 do begin
     if (Sender as TCheckBox).checked then
        Options:= Options + [dtvoRowSelect]
     else
        Options:= Options - [dtvoRowSelect]
  end
end;

procedure TDMTreeViewForm.CheckBox3Click(Sender: TObject);
begin
  if (Sender as TCheckBox).checked then
  begin
     with fcDBTreeView1.MultiSelectAttributes do begin
        enabled:= True;
        MultiSelectCheckbox:= true;
     end
  end
  else begin
     with fcDBTreeView1.MultiSelectAttributes do begin
        enabled:= False;
        MultiSelectCheckbox:= False;
     end
  end;
end;

procedure TDMTreeViewForm.FilterComboChange(Sender: TObject);
begin
  with (Sender as TComboBox) do
  begin
     if ItemIndex=0 then CustomersTbl.Filtered:= False
     else if ItemIndex>0 then CustomersTbl.Filtered:= True
  end
end;

procedure TDMTreeViewForm.CustomersTblFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
   if FilterCombo.ItemIndex=1 then
      Accept:= DataSet.FieldByName('Country').asString = 'US'
   else if FilterCombo.ItemIndex=2 then
      Accept:= not (DataSet.FieldByName('Country').asString = 'US')
end;

procedure TDMTreeViewForm.CheckBox4Click(Sender: TObject);
begin
  with fcDBTreeView1 do begin
     if (Sender as TCheckBox).checked then
        Options:= Options + [dtvoHotTracking]
     else
        Options:= Options - [dtvoHotTracking]
  end

end;

procedure TDMTreeViewForm.CheckBox5Click(Sender: TObject);
begin
  with fcDBTreeView1 do begin
     if (Sender as TCheckBox).checked then
     begin
        Imager:= fcImager1;
        LineColor:= clWhite;
        Font.color:= clWhite;
        Font.style:= Font.Style + [fsBold];
        InactiveFocusColor:= clGray;
     end
     else begin
        Imager:=nil;
        LineColor:= clBtnShadow;
        Font.color:= clBlack;
        Font.style:= Font.Style - [fsBold];
        InactiveFocusColor:= clBtnFace;
     end
  end
end;

procedure TDMTreeViewForm.fcDBTreeView1DrawText(
  TreeView: TfcDBCustomTreeView; Node: TfcDBTreeNode; ARect: TRect;
  var DefaultDrawing: Boolean);
begin
{ Set hot-track color to yellow if imager in background }
  if Node.Hot then
  begin
     if (TreeView.Imager<>nil) then
        TreeView.Canvas.Font.Color:= clYellow
     else begin
        if Node.MultiSelected then
           TreeView.Canvas.Font.Color:= clWhite
     end
  end
end;

end.
