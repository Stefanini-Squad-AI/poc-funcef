unit DLookFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, MontaSelect;

type
  TdtmLookFolha = class(TDataModule)
    cdsTipoDesemb: TCMClientDataSet;
    sqlTipoDesemb: TCMSqlParams;
    cdsPortFormaRec: TCMClientDataSet;
    sqlPortFormaRec: TCMSqlParams;
    sqlPortFormaPag: TCMSqlParams;
    cdsPortFormaPag: TCMClientDataSet;
    cdsTipoReceb: TCMClientDataSet;
    sqlTipoReceb: TCMSqlParams;


  private // Private declarations


  public  // Public declarations


  end;



var
  dtmLookFolha: TdtmLookFolha;



implementation
{$R *.DFM}



end.
