{
How to translate the Preview dialog of ReportBuilder:

ReportBuilder stores the strings of the preview window as a string resources
into the EXE file. Multilizer can automatically translate these resource
strings into the active language if you DO NOT USE runtime packages.

To include the resource strings into the dictionary makes sure that the scan
files (Project | Scan Files) contains the EXE scan file for the application.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppComm, ppProd, ppClass, ppReport, Db,
  DBTables, ppCtrls, ppPrnabl, ppBands, StdCtrls, IvDictio, IvMulti, IvAMulti,
  IvBinDic;

type
  TForm1 = class(TForm)
    CustomerTable: TTable;
    CustomerDataSource: TDataSource;
    CustomerList: TppReport;
    Customer: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    LanguageButton: TButton;
    PreviewButton: TButton;
    Label1: TLabel;
    IvTranslator1: TIvTranslator;
    IvDictionary1: TIvBinaryDictionary;
    procedure PreviewButtonClick(Sender: TObject);
    procedure LanguageButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  IvLanguD;

procedure TForm1.LanguageButtonClick(Sender: TObject);
var
  language: Integer;
begin
  if SelectLanguage(Self, IvDictionary1, '', [], 0, language) then
    IvDictionary1.Language := language;
end;

procedure TForm1.PreviewButtonClick(Sender: TObject);
begin
  CustomerList.Print;
end;

end.
