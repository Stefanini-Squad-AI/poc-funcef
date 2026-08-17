unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, IvDictio, IvMulti, IvTestDi;

type
  TForm1 = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarEdit1: TdxBarEdit;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    IvTestDictionary1: TIvTestDictionary;
    IvTranslator1: TIvTranslator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
