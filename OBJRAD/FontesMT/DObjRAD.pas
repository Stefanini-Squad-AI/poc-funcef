unit DObjRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
  TDtmObjRAD = class(TDataModule)
    Cds: TCMClientDataSet;
    spFinalizaEtapa: TCMSqlParams;
    spFinalizaProc: TCMSqlParams;
    spBuscaTipoEtapa: TCMSqlParams;
    spEtapaFinal: TCMSqlParams;
    spEtapaRetorno: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
