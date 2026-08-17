Unit uDtmEfetivaCenario;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

Type
  TdtmEfetivaCenario = class(TDataModule)
    sqlPeriodoFim: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    sqlCenario: TCMSqlParams;
    sqlTestaOrcAnt: TCMSqlParams;
    sqlPeriodo: TCMSqlParams;
    sqlSaldoCenarioAnt: TCMSqlParams;
    sqlOrcadoAnt: TCMSqlParams;
    sqlOrcado: TCMSqlParams;
    sqlTestaOrc: TCMSqlParams;
    sqlSaldoCenario: TCMSqlParams;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Implementation

{$R *.DFM}

End.
