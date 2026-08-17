//------------------------------------------------------------------------------
// Data      : 27/08/2007
// Autor     : Marcus Oliveira
// Pendência : 24699
// Descrição : A query dos modelos cnabs foi alterada pra trazer somente os modelos
//             CNABS que estão cadastrados no portadorforma.
//------------------------------------------------------------------------------

Unit
  uDtmPagEletronico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBTables, Wwquery;

type
  TDTmPagEletronico = class(TDataModule)
    sqlLoteDoc: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    SqlAtualizaBarras: TCMSqlParams;
    sqlLotePagto: TCMSqlParams;
    sqlDocumentos: TCMSqlParams;
    sqlPortadorForma: TCMSqlParams;
    sqlModelosCnab: TCMSqlParams;
    sqlAux: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Implementation

{$R *.DFM}

End.
