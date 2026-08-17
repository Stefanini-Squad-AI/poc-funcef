unit ImgCombos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fcCombo, fcTreeCombo, fctreeview, fcCommon,
  ComCtrls, CheckLst, fcFontCombo, ExtCtrls
  {$ifndef Ver100}
  ,ImgList
  {$endif}
  ,fcDemoRichEdit;

type
  TTreeComboDemoForm = class(TForm)
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    CheckListBox: TCheckListBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    TreeCombo2: TfcTreeCombo;
    TreeCombo1: TfcTreeCombo;
    Label3: TLabel;
    fcFontCombo1: TfcFontCombo;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcDemoRichEdit2: TfcDemoRichEdit;
    procedure ComboEnter(Sender: TObject);
    procedure CheckListBoxClickCheck(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ActiveCombo: TfcCustomTreeCombo;
  end;

var
  TreeComboDemoForm: TTreeComboDemoForm;

implementation

{$R *.DFM}

procedure TTreeComboDemoForm.ComboEnter(Sender: TObject);
begin
  ActiveCombo := (Sender as TfcCustomTreeCombo);

  with CheckListBox, ActiveCombo do
  begin
    Checked[4] := tvoRowSelect in TreeOptions;
    Checked[2] := tvoShowButtons in TreeOptions;
    Checked[0] := tvoShowLines in TreeOptions;
    Checked[1] := tvoShowRoot in TreeOptions;
    Checked[3] := icoExpanded in Options;
    Checked[5] := icoEndNodesOnly in Options;
    Checked[6] := ShowMatchText;
    Checked[7] := Style = csDropDownList;
  end;
end;

procedure TTreeComboDemoForm.CheckListBoxClickCheck(Sender: TObject);
begin
  with CheckListBox, ActiveCombo do
  begin
    if Checked[4] then TreeOptions := TreeOptions + [tvoRowSelect] else TreeOptions := TreeOptions - [tvoRowSelect];
    if Checked[2] then TreeOptions := TreeOptions + [tvoShowButtons] else TreeOptions := TreeOptions - [tvoShowButtons];;
    if Checked[0] then TreeOptions := TreeOptions + [tvoShowLines] else TreeOptions := TreeOptions - [tvoShowLines];
    if Checked[1] then TreeOptions := TreeOptions + [tvoShowRoot] else TreeOptions := TreeOptions - [tvoShowRoot];
    if Checked[3] then Options := Options + [icoExpanded] else Options := Options - [icoExpanded];
    if Checked[5] then Options := Options + [icoEndNodesOnly] else Options := Options - [icoEndNodesOnly];
    ShowMatchText := Checked[6];
    if Checked[7] then Style := fcCombo.csDropDownList else Style := csDropDown;
  end;
end;

procedure TTreeComboDemoForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then TreeCombo1.SetFocus
  else fcFontCombo1.SetFocus;
end;

procedure TTreeComboDemoForm.FormShow(Sender: TObject);
begin
  PageControl1Change(PageControl1);
  TreeCombo1.text:= 'HandShake';
  TreeCombo1.SelectAll;
  TreeCombo2.text:= 'Satellite';
end;


end.
