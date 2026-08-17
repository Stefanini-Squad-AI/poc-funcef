unit TilerUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, fcLabel, ExtCtrls, fcClearPanel
  {$ifndef ver100}, ImgList{$endif}, Buttons, fcImager, StdCtrls, fcButton,
  fcImgBtn, fcShapeBtn, fcButtonGroup, fcOutlookBar;

type
  TTilerForm = class(TForm)
    ImageList1: TImageList;
    fcLabel1: TfcLabel;
    fcImager1: TfcImager;
    fcOutlookBar1: TfcOutlookBar;
    fcOutlookBar1fcShapeBtn1: TfcShapeBtn;
    fcControlBar1OutlookList2: TfcOutlookList;
    procedure fcControlBar1OutlookList1ItemChange(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TilerForm: TTilerForm;

implementation

{$R *.DFM}


procedure TTilerForm.fcControlBar1OutlookList1ItemChange(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
var ABitmap: TBitmap;
begin
  if OutlookList.Selected = nil then Exit;
  ABitmap := TBitmap.Create;
  try
    ImageList1.GetBitmap(OutlookList.Selected.Index, ABitmap);
    fcImager1.Picture.Assign(ABitmap);
  finally
    ABitmap.Free;
  end;
end;
end.
