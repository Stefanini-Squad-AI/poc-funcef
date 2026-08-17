unit DLookIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, MontaSelect, uCmSqlParams;

type
  TdtmLookIRRF = class(TDataModule)


    cdsEmpresaProp      : TCMClientDataSet;
    cdsParamIRRF        : TCMClientDataSet;
    cdsLancIRRF         : TCMClientDataSet;
    
    cdsLookCentroCusto  : TCMClientDataSet;
    cdsLookCentroRespon : TCMClientDataSet;
    cdsLookCidades      : TCMClientDataSet;
    cdsLookFormaPagto   : TCMClientDataSet;
    cdsLookModulo       : TCMClientDataSet;
    cdsLookMotivo       : TCMClientDataSet;
    cdsLookNatureza     : TCMClientDataSet;
    cdsLookPatro        : TCMClientDataSet;
    cdsLookPlanoPrev    : TCMClientDataSet;
    cdsLookPrograma     : TCMClientDataSet;
    cdsLookTipoDesemb   : TCMClientDataSet;
    cdsLookTipoDoc      : TCMClientDataSet;

    MS_DocumentoCaP: TMontaSelect;
    sql: TCMSqlParams;


  private // Private declarations


  public  // Public declarations


  end;



var
  dtmLookIRRF: TdtmLookIRRF;



implementation
{$R *.DFM}



end.
