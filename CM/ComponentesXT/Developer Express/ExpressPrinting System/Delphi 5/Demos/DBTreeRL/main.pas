unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI, ToolWin, Db, DBTables,
  dxPSCore,  dxtree, dxdbtree, dxPSTVLnk, dxPSdxDBTVLnk;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miDesigner: TMenuItem;
    miHelp: TMenuItem;
    miPageSetup: TMenuItem;
    miPrintPreview: TMenuItem;
    miPrint: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miDX: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    ToolBar1: TToolBar;
    tbSetup: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbDevider: TToolButton;
    tbDesigner: TToolButton;
    tbDX: TToolButton;
    tbSeparator: TToolButton;
    tbExit: TToolButton;
    ilButtons: TImageList;
    ImageList1: TImageList;
    Table: TTable;
    Table_id: TIntegerField;
    Table_parent: TIntegerField;
    Table_name: TStringField;
    Table_bdate: TDateField;
    Table_edate: TDateField;
    Table_info: TMemoField;
    DataSource: TDataSource;
    DBTreeView1: TdxDBTreeView;
    dxComponentPrinter1Link1: TdxDBTreeViewReportLink;
    procedure FormCreate(Sender: TObject);
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miDesignerClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure DBTreeView1Expanded(Sender: TObject; Node: TTreeNode);
    procedure DBTreeView1Collapsed(Sender: TObject; Node: TTreeNode);
    procedure DBTreeView1GetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation


{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Table.DatabaseName := ExtractFilePath(Application.ExeName) + '..\Data\';
  Table.Active := true;
end;

procedure TMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TMainForm.miDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.DBTreeView1Expanded(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex := 1;
end;

procedure TMainForm.DBTreeView1Collapsed(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex := 0;
end;

procedure TMainForm.DBTreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

end.
