unit imagetabformu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, fcClearPanel, fcButtonGroup, fcImage, fcImageForm,
  fcButton, fcImgBtn, fcShapeBtn, fcLabel;

type
  TImageTabForm = class(TForm)
    fcImageForm1: TfcImageForm;
    fcButtonGroup1: TfcButtonGroup;
    fcButtonGroup1fcImageBtn1: TfcImageBtn;
    fcButtonGroup1fcImageBtn2: TfcImageBtn;
    fcButtonGroup1fcImageBtn3: TfcImageBtn;
    fcButtonGroup1fcImageBtn4: TfcImageBtn;
    Shape1: TShape;
    fcLabel1: TfcLabel;
    fcShapeBtn1: TfcShapeBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    fcLabel5: TfcLabel;
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageTabForm: TImageTabForm;

implementation

{$R *.DFM}

procedure TImageTabForm.fcShapeBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TImageTabForm.fcButtonGroup1Change(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  PageControl1.ActivePage :=
    (FindComponent('TabSheet'+IntToStr(Selected.Button.Tag)) as TTabSheet);
end;

procedure TImageTabForm.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

end.
