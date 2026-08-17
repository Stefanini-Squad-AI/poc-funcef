Unit
  uDtmPagEletronico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBTables, Wwquery;

type
  TDTmPagEletronico = class(TDataModule)
    QryLoteDoc: TwwQuery;
    QryLoteDocNUMLOTE: TFloatField;
    QryLoteDocNODOCUMENTO: TFloatField;
    QryLoteDocVALOR: TFloatField;
    QryLoteDocCODBARRA: TStringField;
    QryLoteDocCODBARRAVALOR: TStringField;
    QryLoteDocCODDOCUMENTO: TFloatField;
    QryLoteDocCODPORTFORMA: TFloatField;
    sqlLoteDoc: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    QryAtualizaBarras: TwwQuery;
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
