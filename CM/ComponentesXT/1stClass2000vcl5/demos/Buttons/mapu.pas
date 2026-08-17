unit mapu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, ExtCtrls, fcImageForm, StdCtrls, Mask, Db, DBTables,
  fcShapeBtn, fcImage, DBCtrls, fcLabel, fcClearPanel, fcButtonGroup;

type
  TMapForm = class(TForm)
    fcImageBtn1: TfcImageBtn;
    fcImageBtn2: TfcImageBtn;
    fcImageBtn7: TfcImageBtn;
    fcImageBtn8: TfcImageBtn;
    fcImageBtn9: TfcImageBtn;
    fcImageBtn10: TfcImageBtn;
    DataSource1: TDataSource;
    Table1: TTable;
    Table1CountyName: TStringField;
    Table1SalesTaxRate: TCurrencyField;
    Table1NumberOfCities: TIntegerField;
    Table1EstimatedPopulation: TIntegerField;
    Table1EstimatedHousingUnits: TIntegerField;
    Table1CountyCode: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Table1CityTownList: TMemoField;
    Image2: TImage;
    fcLabel4: TfcLabel;
    fcImageBtn3: TfcImageBtn;
    fcImageBtn4: TfcImageBtn;
    fcImageBtn5: TfcImageBtn;
    fcImageBtn6: TfcImageBtn;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure fcImageBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapForm: TMapForm;

implementation

{$R *.DFM}


procedure TMapForm.fcShapeBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TMapForm.fcImageBtn6Click(Sender: TObject);
begin
  fcLabel4.Caption := (Sender as TFcImageBtn).Caption;
  case (Sender as TfcImageBtn).Tag of
    1:Table1.Locate('CountyName','Marin',[loPartialKey]);
    2:Table1.Locate('CountyName','Sonoma',[loPartialKey]);
    3:Table1.Locate('CountyName','Napa',[loPartialKey]);
    4:Table1.Locate('CountyName','Solano',[loPartialKey]);
    5:Table1.Locate('CountyName','Contra Costa',[loPartialKey]);
    6:Table1.Locate('CountyName','Alameda',[loPartialKey]);
    7:Table1.Locate('CountyName','Santa Clara',[loPartialKey]);
    8:Table1.Locate('CountyName','Santa Cruz',[loPartialKey]);
    9:Table1.Locate('CountyName','San Mateo',[loPartialKey]);
    10:Table1.Locate('CountyName','San Francisco',[loPartialKey]);
  end;
end;

procedure TMapForm.FormShow(Sender: TObject);
begin
  // Don't Show Background if 256 or less Colors
  if ((GetDeviceCaps(Image2.Canvas.Handle, BITSPIXEL) *
       GetDeviceCaps(Image2.Canvas.Handle, PLANES)) <= 8) then
     Image2.Visible := False;
end;

end.
