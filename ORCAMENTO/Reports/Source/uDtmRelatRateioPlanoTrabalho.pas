unit uDtmRelatRateioPlanoTrabalho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams;

type
  TdtmRelatRateioPlanoTrabalho = class(TDataModule)
    sqlPatroConta: TCMSqlParams;
    sqlCriterio: TCMSqlParams;
    sqlPlanoTrabalho: TCMSqlParams;
    sqlCenario: TCMSqlParams;
    sqlPlanoPrevConta: TCMSqlParams;
    sqlCenRespConta: TCMSqlParams;
    sqlCentroCusto: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    sqlAtivProj: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  DtmRelatRateioPlanoTrabalho : TdtmRelatRateioPlanoTrabalho;
  
implementation

{$R *.DFM}

end.
