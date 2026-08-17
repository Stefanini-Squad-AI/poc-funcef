unit Main;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls,
  ToolWin, fcClearPanel, fcButtonGroup, fcButton,
  fcShapeBtn, fcImgBtn, fcImager, fcLabel
  {$ifndef ver100}
  , ImgList
  {$endif};

type
  TMainMdiForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    OpenDialog: TOpenDialog;
    StatusBar: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton9: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ImageList1: TImageList;
    fcButtonGroup1: TfcButtonGroup;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure FormActivate(Sender: TObject);
    procedure WindowTileItemClick(Sender: TObject);
    procedure WindowCascadeItemClick(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
    procedure SetMDIChildCaption(Child: TCustomForm; Name: string);
  public
    { Public declarations }
  end;

var
  MainMdiForm: TMainMdiForm;

implementation

{$R *.DFM}

uses ChildWin;

procedure TMainMdiForm.SetMDIChildCaption(Child: TCustomForm; Name: string);
begin
  Child.Caption := Name;
  TfcShapeBtn(fcButtonGroup1.ButtonItems.FindPointerTag(Child).Button).Caption := Name;
end;

procedure TMainMdiForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { create a new MDI child window }
  Child := TMDIChild.Create(Application);
  SetMDIChildCaption(Child, Name);
end;

procedure TMainMdiForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('FORM' + IntToStr(MDIChildCount + 1));
end;

procedure TMainMdiForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainMdiForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TMainMdiForm.fcButtonGroup1Change(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  TCustomForm(Selected.PointerTag).Show;
end;

procedure TMainMdiForm.FormActivate(Sender: TObject);
begin
  FileNew1Execute(Sender);
end;

procedure TMainMdiForm.WindowTileItemClick(Sender: TObject);
begin
  Tile;
end;

procedure TMainMdiForm.WindowCascadeItemClick(Sender: TObject);
begin
  Cascade;
end;

procedure TMainMdiForm.FileCloseItemClick(Sender: TObject);
begin
  if ActiveMDIChild <> nil then ActiveMDIChild.Close;
end;

end.
