unit DCalcDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmCalcDocumento = class(TDataModule)
    qrySaldoDoc: TwwQuery;
    qryUpdLiberaLanc: TwwQuery;
    qrySaldoDocTOT_RECEBER: TFloatField;
    qrySaldoDocTOT_RECEBIDO: TFloatField;
    qrySaldoDocDATAVENCTO: TDateTimeField;
    qrySaldoDocULTBAIXA: TDateTimeField;
    qrySaldoDocTOT_ALTERADOR: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmCalcDocumento: TdtmCalcDocumento;

implementation

{$R *.DFM}

end.
