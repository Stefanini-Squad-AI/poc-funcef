{ QuickReport mailing labels form }

unit report;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, IvDictio, IvMulti;

type
  TQRLabelsForm = class(TQuickRep)
    MasterTable: TTable;
    DetailBand1: TQRBand;
    IvTranslator1: TIvTranslator;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    procedure QuickRepPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  QRPrev,
  Main;

procedure TQRLabelsForm.QuickRepPreview(Sender: TObject);
var
  dialog: TQRStandardPreview;
  translator: TIvTranslator;
begin
  dialog := TQRStandardPreview.CreatePreview(Application, QRPrinter);
  translator := TIvTranslator.Create(nil);
  try
    translator.Targets.Add(TIvTargetProperty.Create('', 'Caption', ivttInclude));
    translator.Targets.Add(TIvTargetProperty.Create('', 'Hint', ivttInclude));
    translator.TranslateForm(dialog);
  finally
    translator.Free;
  end;
  dialog.Show;
end;

end.
