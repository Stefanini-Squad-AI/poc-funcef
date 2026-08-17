unit dGlobal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, CMDatabase, Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
   TdtmGlobal = class(TDataModule)
      dbScript: TCMDatabase;
      sqlPlanCentCust: TCMSqlParams;
      sqlPlanCentRespon: TCMSqlParams;
      cdsPlanCentRespon: TCMClientDataSet;
      cdsPlanCentCust: TCMClientDataSet;
      sqlParamGlobal: TCMSqlParams;
      cdsParamGlobal: TCMClientDataSet;
      sqlCentroRespon: TCMSqlParams;
      sqlCentroCusto: TCMSqlParams;
      cdsCentroRespon: TCMClientDataSet;
      cdsCentroCusto: TCMClientDataSet;

   private  // Private declarations

   public   // Public declarations

   end;



var
  dtmGlobal: TdtmGlobal;



implementation
{$R *.DFM}



end.
