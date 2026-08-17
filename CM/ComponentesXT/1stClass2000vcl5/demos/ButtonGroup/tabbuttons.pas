unit tabbuttons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, fcLabel, ExtCtrls, fcClearPanel, fcButtonGroup,
  ComCtrls, fcButton, fcImgBtn;

type
  TTabBtnGroupForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Shape1: TShape;
    fcButtonGroup1: TfcButtonGroup;
    fcButtonGroup1fcImageBtn1: TfcImageBtn;
    fcButtonGroup1fcImageBtn2: TfcImageBtn;
    fcButtonGroup1fcImageBtn3: TfcImageBtn;
    fcButtonGroup1fcImageBtn4: TfcImageBtn;
    fcButtonGroup1fcImageBtn5: TfcImageBtn;
    fcButtonGroup1fcImageBtn6: TfcImageBtn;
    fcButtonGroup1fcImageBtn7: TfcImageBtn;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    fcLabel4: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel6: TfcLabel;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    fcLabel7: TfcLabel;
    fcLabel8: TfcLabel;
    procedure fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabBtnGroupForm: TTabBtnGroupForm;

implementation

{$R *.DFM}

procedure TTabBtnGroupForm.fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
  OldSelected, Selected: TfcButtonGroupItem);
begin
   PageControl1.ActivePage :=
      (FindComponent('TabSheet'+IntToStr(Selected.Button.Tag)) as TTabSheet);
end;

procedure TTabBtnGroupForm.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

end.
