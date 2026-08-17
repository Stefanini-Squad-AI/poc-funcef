unit OutlookBarUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, ExtCtrls, fcClearPanel, fcButtonGroup,
  fcOutlookBar, StdCtrls, ComCtrls, fcLabel, fcImgBtn, fcButton, fcShapeBtn,
  fcDemoRichEdit, fcImager, fcCombo, fcTreeCombo;

type
  TOutlookBarForm = class(TForm)
    fcOutlookBar1: TfcOutlookBar;
    fcOutlookBar1OutlookList1: TfcOutlookList;
    fcOutlookBar1fcShapeBtn1: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn2: TfcShapeBtn;
    ImageList1: TImageList;
    fcOutlookBar2: TfcOutlookBar;
    fcOutlookBar2fcImageBtn1: TfcImageBtn;
    fcOutlookBar2fcImageBtn2: TfcImageBtn;
    fcOutlookBar2fcImageBtn3: TfcImageBtn;
    Edit1: TEdit;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcImager1: TfcImager;
    CheckBox5: TCheckBox;
    fcLabel4: TfcLabel;
    fcShapeBtn1: TfcShapeBtn;
    fcTreeCombo1: TfcTreeCombo;
    procedure CheckBox5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OutlookBarForm: TOutlookBarForm;

implementation

{$R *.DFM}

procedure TOutlookBarForm.CheckBox5Click(Sender: TObject);
begin
  with fcoutlookbar2 do begin
     if (Sender as TCheckBox).checked then
     begin
        Imager:= fcImager1;
     end
     else begin
        Imager:=nil;
     end
  end

end;

end.
