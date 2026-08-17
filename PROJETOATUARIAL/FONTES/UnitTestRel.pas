unit UnitTestRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppDB, ppDBBDE, Db, DBTables, Wwquery, ppPrnabl, ppClass,
  ppBands, ppCache, ppComm, ppProd, ppReport, ExtCtrls, ppViewr;

type
  TFormtesterel = class(TForm)
    ppReport1: TppReport;
    ppReport1HeaderBand1: TppHeaderBand;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1FooterBand1: TppFooterBand;
    ppReport1DBText1: TppDBText;
    wwQuery1: TwwQuery;
    DataSource1: TDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1Label1: TppLabel;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppViewer1: TppViewer;
    ppReport1DBText2: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formtesterel: TFormtesterel;

implementation
uses fmostrarelat;
{$R *.DFM}

procedure TFormtesterel.FormCreate(Sender: TObject);
begin
   wwQuery1.open;
   ppReport1.print;
   close;
end;

procedure TFormtesterel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

end.
