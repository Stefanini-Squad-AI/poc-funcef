unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, fcClearPanel,
  fcButtonGroup, fcOutlookBar;

type
  TForm2 = class(TForm)
    fcOutlookBar1: TfcOutlookBar;
    fcOutlookBar1OutlookList1: TfcOutlookList;
    BtnFuncionario: TfcShapeBtn;
    fcOutlookBar1OutlookList2: TfcOutlookList;
    fcOutlookBar1fcShapeBtn2: TfcShapeBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

end.
