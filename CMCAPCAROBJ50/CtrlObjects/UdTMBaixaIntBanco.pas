//  Autor     : Marcus Oliveira
//  Data      : 24.04.2007
//  Pendencia : 24823
//  Descrição : Mostrar só os portadores formas habilitados.
{-------------------------------------------------------------------------------
Pendência: 23081
Data     : 17/08/2006
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos.
Alterei a query sqlDocumentos
-------------------------------------------------------------------------------}



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
