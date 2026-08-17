// This samples requires ACE Report components

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, SctVar, SctRep, AcePage, SctCtrl,
  IvDictio, IvMulti, IvAMulti, IvBinDic, IvTestDi, IvDlgMod;

type
  TForm1 = class(TForm)
    Source1: TDataSource;
    Table1: TTable;
    Panel1: TPanel;
    LanguageButton: TButton;
    ReportButton: TButton;
    IvTranslator1: TIvTranslator;
    IvBinaryDictionary1: TIvBinaryDictionary;
    SctReport1: TSctReport;
    ReportPage: TSctGrouppage;
    ReportHeaderBand: TSctBand;
    ReportHeaderBandlevel: TSctLevel;
    PageHeaderBand: TSctBand;
    PageHeaderBandlevel: TSctLevel;
    DetailBand: TSctBand;
    DetailBandlevel: TSctLevel;
    PageFooterBand: TSctBand;
    PageFooterBandlevel: TSctLevel;
    ReportFooterBand: TSctBand;
    ReportFooterBandlevel: TSctLevel;
    Sctvarlabel1: TSctvarlabel;
    Sctvarlabel2: TSctvarlabel;
    svarDateTime: TSctDateTimeVar;
    svarPage: TSctPageVar;
    DataSourceGuide: TSctDataSourceGuide;
    table1FirstNameVar: TSctDBVar;
    table1LastNameVar: TSctDBVar;
    table1EmailVar: TSctDBVar;
    varlabel: TSctvarlabel;
    varlabel1: TSctvarlabel;
    varlabel2: TSctvarlabel;
    Sctvarlabel3: TSctvarlabel;
    IvDialogModule1: TIvDialogModule;
    procedure ReportButtonClick(Sender: TObject);
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
  if SelectLanguage(Self, IvBinaryDictionary1, '', [], 0, language) then
    IvBinaryDictionary1.Language := language;
end;

procedure TForm1.ReportButtonClick(Sender: TObject);
begin
  SctReport1.Run;
end;

end.
