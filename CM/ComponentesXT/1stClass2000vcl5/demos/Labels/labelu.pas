unit labelu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, fcLabel, ComCtrls, StdCtrls, DBCtrls, Db, DBTables, fcButton,
  fcImgBtn, fcShapeBtn, fcText, fcClearPanel, fcButtonGroup, ShellAPI, Math,
  fcDemoRichEdit;

type
  TLabelForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Panel1: TPanel;
    fcButtonGroup1: TfcButtonGroup;
    fcButtonGroup1fcImageBtn1: TfcImageBtn;
    fcButtonGroup1fcImageBtn2: TfcImageBtn;
    fcButtonGroup1fcImageBtn3: TfcImageBtn;
    fcButtonGroup1fcImageBtn4: TfcImageBtn;
    fcButtonGroup1fcImageBtn5: TfcImageBtn;
    Panel2: TPanel;
    Rotatedlabel1: TfcLabel;
    embossedlabel1: TfcLabel;
    ShadowLabel1: TfcLabel;
    outlinedlabel1: TfcLabel;
    engravedlabel1: TfcLabel;
    Block3DLabel1: TfcLabel;
    FunLabel1: TfcLabel;
    Rotatedlabel2: TfcLabel;
    BlendLabel1: TfcLabel;
    Extrudelabel1: TfcLabel;
    Rotatedlabel3: TfcLabel;
    fcDemoRichEdit1: TfcDemoRichEdit;
    Panel3: TPanel;
    RotateLabel5: TfcLabel;
    RotateLabel6: TfcLabel;
    RotateLabel4: TfcLabel;
    RotateLabel3: TfcLabel;
    RotateLabel7: TfcLabel;
    RotateLabel8: TfcLabel;
    RotateLabel9: TfcLabel;
    fcDemoRichEdit2: TfcDemoRichEdit;
    Panel4: TPanel;
    Shape2: TShape;
    fcLabel16: TfcLabel;
    fcLabel17: TfcLabel;
    fcLabel18: TfcLabel;
    fcLabel22: TfcLabel;
    fcLabel23: TfcLabel;
    fcLabel24: TfcLabel;
    fcLabel25: TfcLabel;
    fcLabel31: TfcLabel;
    fcLabel32: TfcLabel;
    fcLabel33: TfcLabel;
    fcLabel35: TfcLabel;
    fcLabel39: TfcLabel;
    fcLabel40: TfcLabel;
    RadioGroup1: TRadioGroup;
    fcDemoRichEdit3: TfcDemoRichEdit;
    Panel5: TPanel;
    Shape1: TShape;
    BlockTestLabel1: TfcLabel;
    fcLabel38: TfcLabel;
    fcLabel34: TfcLabel;
    fcLabel37: TfcLabel;
    fcLabel36: TfcLabel;
    BlockTestLabel2: TfcLabel;
    BlockTestLabel3: TfcLabel;
    wowlabel1: TfcLabel;
    wowlabel4: TfcLabel;
    fcLabel48: TfcLabel;
    wowlabel2: TfcLabel;
    wowlabel3: TfcLabel;
    fcDemoRichEdit4: TfcDemoRichEdit;
    Panel6: TPanel;
    MultiLineLabel1: TfcLabel;
    EllipsisLabel2: TfcLabel;
    fcDemoRichEdit5: TfcDemoRichEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel7: TPanel;
    fcLabel2: TfcLabel;
    fcLabel1: TfcLabel;
    Panel8: TPanel;
    AcceleratorKeyLabel1: TfcLabel;
    AcceleratorKeyLabel2: TfcLabel;
    AcceleratorKeyLabel3: TfcLabel;
    AcceleratorKeyLabel4: TfcLabel;
    AcceleratorKeyLabel5: TfcLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label1: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure fcLabel1MouseEnter(Sender: TObject);
    procedure fcLabel1MouseLeave(Sender: TObject);
    procedure fcLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LabelForm: TLabelForm;

implementation

{$R *.DFM}


procedure TLabelForm.RadioGroup1Click(Sender: TObject);
begin
   fcLabel39.Font.Color := clBtnFace;
   case RadioGroup1.ItemIndex of
      0: begin
         fcLabel35.TextOptions.Style := fclsDefault;
         fcLabel39.TextOptions.Style := fclsDefault;
         fcLabel39.Font.Color := clBlack;
         fcLabel40.TextOptions.Style := fclsDefault;
         end;
      1: begin
         fcLabel35.TextOptions.Style := fclsRaised;
         fcLabel39.TextOptions.Style := fclsRaised;
         fcLabel40.TextOptions.Style := fclsRaised;
         end;
      2: begin
         fcLabel35.TextOptions.Style := fclsLowered;
         fcLabel39.TextOptions.Style := fclsLowered;
         fcLabel40.TextOptions.Style := fclsLowered;
         end;
      3: begin
         fcLabel35.TextOptions.Style := fclsOutline;
         fcLabel39.TextOptions.Style := fclsOutline;
         fcLabel40.TextOptions.Style := fclsOutline;
         end;
   end;
end;

procedure TLabelForm.fcButtonGroup1Change(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  PageControl1.ActivePage :=
    (FindComponent('TabSheet'+IntToStr(Selected.Button.Tag)) as TTabSheet);
end;

procedure TLabelForm.fcLabel1MouseEnter(Sender: TObject);
begin
  (Sender as TfcLabel).Font.Color := clBlue;
end;

procedure TLabelForm.fcLabel1MouseLeave(Sender: TObject);
begin
   (Sender as TfcLabel).Font.Color := clBlack;
end;

procedure TLabelForm.fcLabel1Click(Sender: TObject);
begin
   ShellExecute(Handle, 'OPEN',
     PChar('https://www.he.net/cgi-bin/suid/~wol2wol/ordering/order.cgi'),
           nil, nil, sw_shownormal);
end;

end.
