unit uDtmBaixaIntBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams;

type
  TDtmBaixaIntBanco = class(TDataModule)
    SqlDocumentos: TCMSqlParams;
    SqlAuxCodDoc: TCMSqlParams;
    SqlPortaDorForma: TCMSqlParams;
    SqlParamCAP: TCMSqlParams;
    SqlOcorrencia: TCMSqlParams;
    SqlAux: TCMSqlParams;
    SqlUnid: TCMSqlParams;
    SqlModelosCnab: TCMSqlParams;
    SqlAlt: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
