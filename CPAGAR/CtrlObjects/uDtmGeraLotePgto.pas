{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - uDtmGeraLotePgto                                                  }
{------------------------------------------------------------------------------}
// Componentes : SqlLotePagto, SqlLoteXDocumento
// Data        : 19/08/2004 (término)
// Autor       : David Ayrolla
// Pendência   : 17221
// Descrição   : Componentes alterados para implementação de  processo RAD por
//               lote ou por documento.
//------------------------------------------------------------------------------

Unit
  uDtmGeraLotePgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmSqlParams, DBClient, uCMClientDataSet;

type
  TDtmGeraLotePgto = class(TDataModule)
    SqlFormadePagto: TCMSqlParams;
    SqlNumlancto: TCMSqlParams;
    SqlDescPortadorForma: TCMSqlParams;
    SqlRateio: TCMSqlParams;
    SqlSaldoLoteNaoEmitido: TCMSqlParams;
    SqlTipoDocRecPag: TCMSqlParams;
    SqlAux: TCMSqlParams;
    Sqlseladiantpendent: TCMSqlParams;
    SqlLoteXDocumento: TCMSqlParams;
    SqlLotePagto: TCMSqlParams;
    SqlDocPendentes: TCMSqlParams;
    sqlModulos: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
