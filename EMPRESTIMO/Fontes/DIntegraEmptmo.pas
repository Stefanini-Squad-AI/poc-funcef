unit DIntegraEmptmo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmIntegraEmptmo = class(TDataModule)
    qryRemarcaEnvio: TwwQuery;
    qryExcluiTMPDESC: TwwQuery;
    qryDocumentosExclusao: TwwQuery;
    qryDocumentosExclusaoCODDOCUMENTO: TFloatField;
    qryExcluiFinanceiro: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmIntegraEmptmo: TdtmIntegraEmptmo;

implementation

{$R *.DFM}

end.
