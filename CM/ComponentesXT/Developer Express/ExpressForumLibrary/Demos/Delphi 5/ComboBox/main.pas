unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, dxfComboBox, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dxfComboBox3: TdxfComboBox;
    dxfComboBox2: TdxfComboBox;
    dxfComboBox1: TdxfComboBox;
    Label1: TLabel;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    dxfFontNameComboBox1: TdxfFontNameComboBox;
    procedure dxfComboBox2CloseUp(Sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.dxfComboBox2CloseUp(Sender: TObject; var Value: String);
var S : String;
    i : integer;
begin
   S := '';
     for i := 0 to dxfComboBox2.Items.Count - 1 do
       if dxfComboBox2.Checked[i] then
         if S = '' then
           S := dxfComboBox2.Items[i]
         else
           S := S +', '+dxfComboBox2.Items[i];
   Value := S;
end;

end.
