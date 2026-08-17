Unit
  uDtmGeraLotePgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmSqlParams;

type
  TDtmGeraLotePgto = class(TDataModule)
    SqlFormadePagto: TCMSqlParams;
    SqlNumlancto: TCMSqlParams;
    SqlDescPortadorForma: TCMSqlParams;
    SqlModulos: TCMSqlParams;
    SqlRateio: TCMSqlParams;
    SqlSaldoLoteNaoEmitido: TCMSqlParams;
    SqlTipoDocRecPag: TCMSqlParams;
    SqlAux: TCMSqlParams;
    Sqlseladiantpendent: TCMSqlParams;
    SqlDocPendentes: TCMSqlParams;
    SqlLoteXDocumento: TCMSqlParams;
    SqlLotePagto: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
